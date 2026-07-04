# Cyclorama Curved Screen 🛰️

**A curved screen, floating on your desktop.** 🪐

Drop in a photo, a film, or a live web page — it plays on a concave panel that hangs there like the
viewscreen of a starship bridge 🚀 No window, no frame, no chrome. Just a curved surface,
broadcasting 📡 It leans toward your cursor when you pass by 👀 and drifts gently while it waits ✨

![demo](media/preview.gif)

## 🎬 It plays films

![film on the curve](media/demos/film.gif)

<sub>*Sintel* © Blender Foundation · CC BY 3.0 · your own films work the same: `Cyclorama film.mp4`</sub>

## 🖼️ It hangs masterpieces

![The Starry Night, leaning with the cursor](media/demos/art.gif)

<sub>van Gogh's *The Starry Night*, leaning toward the cursor as it passes 👀</sub>

## 🌐 It broadcasts the live planet

![live wind map of Earth](media/demos/web.gif)

<sub>[earth.nullschool.net](https://earth.nullschool.net) — a real web page, alive on the curve. Any URL works 📡</sub>

## ✨ Put anything on it

```
Cyclorama                       # 🌌 a James Webb image, out of the box
Cyclorama photo.jpg             # 🖼️ your picture
Cyclorama film.mp4              # 🎬 a film — loops, floating player bar
Cyclorama https://example.com   # 🌐 a live page: a dashboard, a stream, a clock
Cyclorama --register            # 📎 right-click any film → "Open with → Cyclorama"
```

Or skip the terminal: drop a file straight onto the curve 🫳 and it swaps in place —
`Ctrl+V` a path or a URL works too ✨

Ships with **James Webb Space Telescope** imagery 🔭 in [`samples/`](samples/) — nebulae 🌫️,
galaxies 🌀, the deep field 🌌 — so out of the box it looks like it's receiving something from
very, very far away 👽

## 🛠️ Details

<sub>For the curious — everything technical lives here, and only here 🤓</sub>

- 🎛️ **Flags** — `--curve 0.5` (bend, 0–0.8) · `--flat` · `--top` (always-on-top) · `--still`
  (no idle drift) · `--mute` · `--size WxH` · `--pos X,Y` · force a type with `--image` /
  `--video` / `--url` · `--register` / `--unregister` (Open-with entry, HKCU only, no admin)
- ⌨️ **Player keys** — `Space` pause · `←`/`→` seek 10s · `Ctrl+V` open clipboard file/URL
- 🧠 **How it works** — the content is painted onto a real 3D mesh bent into a parabola
  (`z = curveDepth · nx²`; flip the sign for a convex bulge 🔄) and viewed through a perspective
  camera. Images use an `ImageBrush`, video plays through a GPU `VideoDrawing`, web pages render in
  an offscreen WebView2. The whole app is two files — see [`Program.cs`](Program.cs) 📄
- 🚀 **Install** — `.\install.ps1` builds it and installs it as a real app for the current user:
  `%LOCALAPPDATA%\Programs\Cyclorama`, Start-Menu + desktop shortcuts, Open-with entry 📎
  (`.\install.ps1 -Uninstall` removes it all) · or just `dotnet build -c Release` · needs .NET 8
  on Windows (WebView2 runtime for web pages, preinstalled on current Windows 10/11)
- 🎥 **The demo is code** — [`promo/`](promo/) is an HTML composition rendered to mp4 (60 fps) with
  [HyperFrames](https://github.com/heygen-com/hyperframes); `npx hyperframes render` rebuilds it 🔁
- 🏅 **Credits** — Webb imagery: NASA, ESA, CSA, STScI, CC BY 4.0 · demo footage: *Sintel* ©
  Blender Foundation CC BY 3.0, *The Starry Night* public domain ([details](samples/CREDITS.md)) ·
  code: [MIT](LICENSE) 📜
