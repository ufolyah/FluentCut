# FluentCut
Better Open Video Editor

# Our goals
1. Core: Performance-focused video editor timeline editing and rendering foundation system.
2. Application: Multiple GUIs and binary-size-sensitive builds focused on different practical usages, with Best UI and UEX.
3. Feature plugins: provide optional ready-to-use features provided by third-party **open** libs as many as possible.

# How to start
```bash
# pull submodule code
git submodule init
git submodule update

```

# Technical Choice
## Build
1. Although currently we focus on Windows 10 22h2+, we should not break the probability of cross-platform support. So if any feature uses windows api, please write a wrapper for that.
2. Main Module shall be built with CMAKE, and targeting to MSVC 2019.
2. GUI Module shall be built with QT. QMAKE usages is TBD.
2. Scripts are recommended to be written in Python; Bash is OK; Powershell scripts must come with a translated copy in python or bash.
### Render API
- For codes in this repo, use vulkan. 
- For the compatibility with third party renderer, FluentCut shall include ANGLE(**with Vulkan Backend**) and swiftshader(**with Vulkan backend**)
### MultiMedia Encoder/Decoder
- ffmpeg (**msvc build**, nvenc, nvdec, qsv, dxva, vaapi enabled)
## GUI
- Use QT, but only LGPL part.
## IPC & Message System (TBD)
- TBD: GRPC? HTTP? Or custom one?
- How to share texture to external usage?
## Event loop & Http server
- use ASIO in side thread.
## Plugin Support
- Different APIs for import/export/timeline edit/render respectively.
- An easy script system based on quickJS.
- plugin support should be implemented both in quickJS and C++ dynamic lib.
## third-party Feature
Because of license and binary size issue, all modules shall be able to turn off when build.
- 2d render and lottie animation: skia
- Audio Effects: custom VST3 host
- tts: system default or third party.
- AI plugins: 
    - tts
    - speech recognize
    - human beautifier
    - txt2img: stable diffusion web ui

# TODO:
## Main Module
1. model, render and data sync between.
2. HDR support.
2. reader cache.
3. performance monitor.
3. API/CLI

## GUI Application
2. i18n support.
2. License presenter.

