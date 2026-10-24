# Nova Toolkit

Nova Toolkit is a Windows desktop suite built with .NET 10 and Windows Forms. It uses a dark, neon-accented interface and keeps notes and tasks on the local device.

## Logo and HTML landing page

The app logos are `logo.svg` (web and scalable artwork) and `logo.ico` (Windows app and installer icon).

To view the landing page and download Nova Toolkit:

1. Open `index.html` in a web browser. It is a self-contained page and can be viewed directly from the project folder.
2. Select **Download for Windows** or **Download Nova Toolkit** on the page.
3. The download link points to `dist\NovaToolkit-Setup.exe`, the Windows installer included in this project.

Keep `index.html`, `logo.svg`, and the `dist` folder together so the logo and download link continue to work. To share the page online, publish those files with a static website host such as GitHub Pages; see [Publish the website with GitHub Pages](#publish-the-website-with-github-pages).

## Included tools

- Scientific calculator with parentheses, powers, constants, and degree-based trig functions
- Auto-saving quick notes
- Markdown editor with a live preview
- 25-minute focus timer and stopwatch
- Locally saved to-do list
- Cryptographically random password generator
- Unit converter for length, weight, and temperature
- Text tools for word/character counts and common transformations
- Live world clocks for five major cities
- Voice recorder that saves microphone recordings as WAV files
- Audio and video media player with playlist, seek, volume, and M3U playlist export
- Embedded web browser with address/search, back, forward, and reload controls
- Drive space report and Windows physical-drive health status when available
- System monitor for available memory and Nova Toolkit CPU/memory usage
- Built-in command console for date, time, drive summary, system info, calculator expressions, and text output; it does not execute arbitrary shell commands
- JSON formatter/validator and Base64 encoder/decoder
- Color palette generator with HEX copy
- Batch file renamer with a preview and collision checks

## Build and run

Install the .NET 10 SDK on Windows, then run:

```powershell
dotnet run --project .\Toolkit.csproj
```

## Create the standalone EXE

Run this in PowerShell from the project folder:

```powershell
powershell -ExecutionPolicy Bypass -File .\publish-exe.ps1
```

The execution-policy override applies only to that PowerShell process. The self-contained, single-file Windows x64 executable is written to `dist\NovaToolkit.exe`; it does not require a separately installed .NET runtime.

## Create the Windows installer

Install Inno Setup 6, then run:

```powershell
powershell -ExecutionPolicy Bypass -File .\build-installer.ps1
```

The setup program is written to `dist\NovaToolkit-Setup.exe`. It installs per-user under `%LocalAppData%\Programs\Nova Toolkit`, creates a Start Menu shortcut, and offers an optional desktop shortcut. It does not require administrator rights.

## Publish the website with GitHub Pages

The `.github\workflows\pages.yml` workflow publishes `index.html`, `logo.svg`, and the installer to GitHub Pages when changes are pushed to the `main` or `master` branch. Create a GitHub repository, push this project to it, then enable GitHub Pages with **GitHub Actions** as the build and deployment source in the repository's Pages settings.

To use a custom domain, first register it with a domain registrar. Set the repository Actions variable `CUSTOM_DOMAIN` to the domain (for example, `jonathan656556.com`), add the DNS records GitHub Pages specifies for that domain, and set the custom domain in the repository's Pages settings. The workflow will then include the matching `CNAME` file when it deploys. A registry lookup returning no record does not guarantee a domain is available to register.

The app stores notes, tasks, browser data, and microphone recordings in `%LocalAppData%\NovaToolkit`. Password generation and text processing run locally. Audio recording uses NAudio; media playback uses Windows media codecs. The embedded browser uses Microsoft Edge WebView2 and requires the WebView2 Runtime, which is included with most Windows installations that have Microsoft Edge. Physical-drive health depends on Windows exposing storage health data.
