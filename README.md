Description:

A Flutter application that fetches and displays video data from an API. This app mimics a "reels page" and implements pagination, lazy loading, error handling, and caching to improve user experience. It uses Flutter BLoC for state management and follows clean architecture principles in order to separate the Business Logic from the User Interface. This structure includes two parts, features and core. Which is then further classified as blocs, pages, data and widgets. Videos that are available at remote server are in streaming format i.e. m3u8. This format is not standard video format so, It had to be first converted to standard form that android and iOS devices dont take much time to process them. 


How to Run:

 Requirements: Flutter, Xcode, VS Code or Android studio 
 Clone the git repository from ........ and open in VS code. Connect an android or iPhone device to experience best rendering effects of video. Android emulators do not provide good visuals for videos. 


How to use APK: 

 Go to this link (https://drive.google.com/file/d/1TcPa-Qrf6wcXQAtutT9nQrlKDcU9AVKT/view?usp=sharing) 
 click and install apk on android and open the app. 

Features

1- Video Display (Reels Page):

Displays videos in a smooth-scrolling reels-style layout.
Fetches video data from the provided API.

2- Pagination & Lazy Loading:

Implements pagination to load more videos when the user scrolls down.
Lazy loading to improve performance by fetching more data only when necessary.

3- Caching:

Video data is cached to reduce unnecessary API calls and improve load times.

4- Error Handling:

Handles network errors, API errors, and JSON parsing errors gracefully.

5- State Management (BLoC Pattern):

Uses the BLoC pattern to separate UI and business logic, ensuring maintainability and testability.


Key Libraries and Packages

- flutter_bloc: For state management using BLoC pattern.
- http: To make API requests and fetch data from the provided   endpoint.
- cached_network_image: For caching images and reducing unnecessary network calls.
- video_player: To display video content.
- flutter_screenutil: For responsive layouts across different screen sizes.
- shared_preferences: For local storage to cache data.
- path_provider: To store cached data in device storage.
- permission_handler: To handle permissions (like storage and network access).