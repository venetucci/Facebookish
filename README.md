# Facebookish
Facebook prototype in Swift

Submitted by: Michelle Venetucci Harvey

Time spent: 14 hours spent in total

## User Stories

The following **required** and **optional** functionality is complete:

* [x] Tapping on a photo in the news feed should expand the photo full screen.
* [x] Tapping the Done button should animate the photo back into its position in the news feed.
* [x] On scroll of the full screen photo, the background should start to become transparent, revealing the feed.
* [x] If the user scrolls a large amount and releases, the full screen photo should dismiss.
* [x] Optional: The full screen photo should be zoomable.
* [x] Optional: The user should be able to page through the other photos in full screen mode.

## Video Walkthrough 

Here's a walkthrough of all implemented user stories:

![Video Walkthrough](/facebook_walkthrough/facebook_walkthrough.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes
I had the zoom working before I implemented the image paging in full screen mode - now it's sort of working, but messes with the scroll offset. 

I was getting an error when trying to downcast the `NewsFeedViewController` in the `ImageTransition` file, since it's nested in a navigation controller and a tab bar controller, so I set the values in the news feed and assigned the properties as global variables in the imageTransition file. This makes it easier to re-use the `ImageTransition` for other view controllers in the future. 

## License

    Copyright 2016 Michelle Venetucci Harvey

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


