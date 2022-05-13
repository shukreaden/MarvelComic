//
//  MarvelComicService.swift
//  MarvelComic
//
//  Created by Shukre Ahmed on 5/12/22.
//
//  Alamofire synchronous github link
//

import Foundation
import Alamofire
import Alamofire_Synchronous
import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

struct MarvelComicApiConstants {
    static let apiEndpoint = "https://gateway.marvel.com:443/v1/public/comics/"
    static let comicId = "67869"
    static let publicKey = "28337a775af2473f6d789fd07f7dd65e"
    static let privateKey = "d1cb7f0ac7264e19e376401286314e7c2e9f1650"
}

class MarvelComicService {
    
    func getComicData() -> Comic {
        let timeStamp = generateTimeStamp()
        let unformattedHash = generateMD5(string: timeStamp + MarvelComicApiConstants.privateKey + MarvelComicApiConstants.publicKey)
        let hash = unformattedHash.map { String(format: "%02hhx", $0) }.joined()
        let params : Parameters = [
            "ts" : timeStamp,
            "apikey" : MarvelComicApiConstants.publicKey,
            "hash" : hash,
        ]
        let response = Alamofire.request(MarvelComicApiConstants.apiEndpoint + MarvelComicApiConstants.comicId, parameters: params).responseData()
            let decoder = JSONDecoder()
        let comic = try? decoder.decode(Comic.self, from: response.value!)
        return comic!
    }

    func generateMD5(string: String) -> Data {
            let length = Int(CC_MD5_DIGEST_LENGTH)
            let messageData = string.data(using:.utf8)!
            var digestData = Data(count: length)

            _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
                messageData.withUnsafeBytes { messageBytes -> UInt8 in
                    if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                        let messageLength = CC_LONG(messageData.count)
                        CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                    }
                    return 0
                }
            }
            return digestData
        }
    
    func generateTimeStamp() -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timestamp = format.string(from: date)
        return timestamp
    }
}
