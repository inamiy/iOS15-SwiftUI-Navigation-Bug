# iOS15-SwiftUI-Navigation-Bug
Demonstrates SwiftUI Navigation behavior change from iOS 14 to iOS 15 which disallows single-source-of-truth state management.

## Xcode 12.5.1 / iOS 14.5

NOTE: Array of `isActive`s was already broken in iOS 14, but UI transition was working correctly.

https://user-images.githubusercontent.com/138476/134607135-4f403539-d3ad-4d48-99d5-deac9fb100bc.mov

## Xcode 13.0 / iOS 15.0

Both aray of `isActive`s and UI transition are broken.
(This occurs only when single `@Published` (a.k.a. single-source-of-truth) is used, 
and will be no problem if multi-`@Published` or multi-`@State` are used)

https://user-images.githubusercontent.com/138476/134607396-a5dd7182-9947-47d8-8910-681d78fca048.mov
