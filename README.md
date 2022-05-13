# Marvel Comic

Marvel comic application that displays a single comic title, description, and cover image via the comic endpoint from Marvels Api(https://gateway.marvel.com:443/v1/public/comics/). Also adds UI tests for checking that the comic's content is displayed properly(shows comic image, title, and description as well as shows comic accessory buttons -> "read now", "mark as read", "add to library" and "read offline"). Also adds a single unit test for making sure the timestamp added to the Marvel api call is formatted correctly.


## Usage
In order to use the app with your own developer keys follow steps below,
 * Open the MarvelComicService.swift file under MarvelComic/MarvelComic/Services/
 * In the MarvelComicApiConstants struct at the top of the MarvelComicService.swift file, simply replace the strings "INSERT_YOUR_PUBLIC_KEY_HERE" and "INSERT_YOUR_PRIVATE_KEY_HERE" with your public key and private key.
If you also want to show your own comic of choice replace the added Black panther comic id(67869) with your own!

## Acknowledgements

 - [Swift UI Library Usage](https://developer.apple.com/documentation/swiftui/)
  - [Marvel Api Documentation](https://developer.marvel.com/docs)
  - [CocoaPods dependancy manager](https://cocoapods.org/)
 - [Alamofire Synchronous Library Usage by Dalodd](https://github.com/Dalodd/Alamofire-Synchronous)
 - [MD5 hash generator from zaph answer on stack overflow](https://stackoverflow.com/questions/32163848/how-can-i-convert-a-string-to-an-md5-hash-in-ios-using-swift)
 - Various Youtube videos and articles not listed here to help me with my first time using SwiftUI


## Demo

 - [iPhone 13 pro](https://www.kapwing.com/videos/627dfef0d8cb11008bbb7b57)
 - [iPhone 13 pro Max](https://www.kapwing.com/videos/627dff461438ee00ac591774)
 - [iPad pro](https://www.kapwing.com/videos/627dff6ad9aa430089ed20c2)
 - [iPhone SE](https://www.kapwing.com/videos/627dff934cfce20082f775cf)
