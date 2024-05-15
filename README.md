<!-- Project Title -->
<div align="center" style="display: flex; align-items: center; justify-content: center;">
  <img src="readmeimages/movieshublogo.jpeg" alt="Echat Logo" width="500" height="400">
</div>


<h1 align="center">Movie Hub: Your Ultimate Destination for Cinematic Delights</h1>
<p>Welcome to Movie Hub, your go-to platform for discovering and exploring the latest and greatest in the world of cinema. With a vast array of features designed to enhance your movie-watching experience, Movie Hub brings the magic of the silver screen right to your fingertips.</p>


## 🔰 Project Overview
Movie Hub is a comprehensive application that leverages APIs to provide users with up-to-date information on popular TV shows, top-rated movies, and trending cinematic gems. Whether you're a seasoned film buff or a casual viewer looking for your next favorite flick, Movie Hub has something for everyone.

---
### 🎥 Simple demo

---
## ➤ Key Features

### 1. Extensive Movie Database
- **API Integration:** Utilizing APIs, Movie Hub offers access to a vast repository of movie data, ensuring that users stay informed about the latest releases and timeless classics.
- **Popular TV Shows:** Explore a curated collection of popular TV shows, with detailed information on episodes, cast, and more.
- **Top-Rated Movies:** Discover critically acclaimed films rated highly by both audiences and critics alike.
- **Trending Movies:** Stay ahead of the curve with a dynamic list of trending movies, updated regularly to reflect the latest cinematic trends.

### 2. Detailed Movie Information
- **Comprehensive Details:** Dive deep into each movie's details, including synopsis, cast information, genre, release date, and more.
- **IMDb Ratings:** Get instant access to IMDb ratings, helping you make informed decisions about which movies to watch.
- **Trailers:** Watch movie trailers directly within the app, allowing you to preview the cinematic experience before diving in.

### 3. Seamless User Experience
- **Intuitive Interface:** Enjoy a user-friendly interface designed for effortless navigation and exploration.


---
## 🛠 Technologies and Frameworks Used
- <img src="https://user-images.githubusercontent.com/25181517/186150365-da1eccce-6201-487c-8649-45e9e99435fd.png" alt="Flutter" width="20" height="20"> **Flutter Framework** (Dart language)
- <img src="https://pbs.twimg.com/profile_images/1243623122089041920/gVZIvphd_400x400.jpg" alt="OpenAI" width="20" height="20"> **API Integration:** Leveraging powerful APIs to fetch real-time movie data, ensuring that users have access to the latest information.
- <img src="https://upload.wikimedia.org/wikipedia/commons/3/33/Figma-logo.svg" alt="Figma" width="20" height="20">**User Interface Design:** Crafting an intuitive user interface designed for easy navigation and an enjoyable user experience.
- <img src="https://static.vecteezy.com/system/resources/previews/023/986/480/non_2x/youtube-logo-youtube-logo-transparent-youtube-icon-transparent-free-free-png.png" alt="Figma" width="20" height="20"> **Trailer Playback:** Implementing functionality for seamless trailer playback, allowing users to preview movies before deciding to watch.

## ⚡Usage/Examples

```javascript
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

//MyApp
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// Send prompt to API and get the response
final String apiKey='ddc4f1e089f508e004ae72d6eb9';
  final String readAccessToken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiCJ2ZXJzaW9uIjoxfQ.Gw0EtDta7KDYAI7BKeRxMCd1a94B2u8gAfdLxYlbjcc';

  loadMovies() async{
    TMDB tMDBWithCustomLogs=TMDB(
                                ApiKeys(apiKey,readAccessToken),
                                logConfig: ConfigLogger(showLogs: true,showErrorLogs: true));
    Map trendingResults=await tMDBWithCustomLogs.v3.trending.getTrending();
    Map topRatedMoviesResults=await tMDBWithCustomLogs.v3.movies.getTopRated();
    Map tvShowsResults=await tMDBWithCustomLogs.v3.tv.getPopular();
}
```

## 🚀 Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/sahilpotdukhe/echat.git
2. **Navigate to the project directory:**
    ```bash
    cd echat
3. **Install dependencies:**
    ```bash
    flutter pub get
4. **Run the app:**
    ```bash
    flutter run

## 📋 Requirements

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- TMDB API: [Usage](https://developer.themoviedb.org/reference/intro/getting-started)

## <img src="https://upload.wikimedia.org/wikipedia/commons/3/33/Figma-logo.svg" alt="Figma" width="20" height="20"> App Design

<div align="center">
  <table style="border-collapse: collapse;">
    <tr>
      <td style="padding-right: 0px; border: none;">
        <img src="readmeimages/1.png" alt="Screen 1" width="250">
        <p align="center">Home Screen</p>
      </td>
      <td style="padding-right: 0px; border: none;">
        <img src="readmeimages/2.png" alt="Screen 2" width="250">
        <p align="center">MovieDetails Screen</p>
      </td>
      <td style="border: none;">
        <img src="readmeimages/3.png" alt="Screen 3" width="250">
        <p align="center">TrailerPlayback Screen </p>
      </td>
    </tr>
  </table>
</div>

---
## 🤝 Contributing
Contributions are always welcome!
If you have a suggestion that would make this better, please fork the repo and create a pull request. Don't forget to give the project a star! Thanks again!
- Fork the Project
- Create your Feature Branch (```bash git checkout -b feature/AmazingFeature```)
- Commit your Changes (```bash git commit -m 'Add some AmazingFeature'```)
- Push to the Branch (```bash git push origin feature/AmazingFeature```)
- Open a Pull Request 


---
## ➤ Contact
You can reach out to me via the following methods:

- **Email:**  <img src="https://github.com/SatYu26/SatYu26/blob/master/Assets/Gmail.svg" alt="Gmail" width="20" height="20">&nbsp;&nbsp;<a href="mailto:sahilpotdukhe.ssp@gmail.com">sahilpotdukhe.ssp@gmail.com
- **Social Media:**
   - <img src="https://github.com/SatYu26/SatYu26/blob/master/Assets/Linkedin.svg" alt="Linkedin" width="20" height="20">&nbsp;&nbsp;[LinkedIn](https://www.linkedin.com/in/sahil-potdukhe/)
   - <img src="https://w7.pngwing.com/pngs/914/758/png-transparent-github-social-media-computer-icons-logo-android-github-logo-computer-wallpaper-banner-thumbnail.png" alt="Github" width="20" height="20">&nbsp;&nbsp;[GitHub](https://github.com/sahilpotdukhe)
   - <img src="https://github.com/SatYu26/SatYu26/blob/master/Assets/Instagram.svg" alt="Instagram" width="20" height="20">&nbsp;&nbsp;[Instagram](https://www.instagram.com/sahilpotdukhe11/)
   - <img src="https://github.com/SatYu26/SatYu26/blob/master/Assets/Twitter.svg" alt="Twitter" width="20" height="20">&nbsp;&nbsp;[Twitter](https://twitter.com/SahilPotdukhe)
  ---


