# Cyclorama Curved Screen

A curved screen for your desktop. Give it an image, a video, or a web page — it shows up on a real
concave 3D surface in a borderless, transparent window that leans toward your cursor.

![license](https://img.shields.io/badge/license-MIT-white) ![platform](https://img.shields.io/badge/Windows-.NET%208-blue)

![demo](media/preview.gif)

▶ **[Watch the full demo](media/demo.mp4)** — the demo itself is code, rendered from
[`promo/`](promo/) with [HyperFrames](https://github.com/heygen-com/hyperframes).

| image | video (with player) | live web page |
|---|---|---|
| ![](media/showcase.png) | ![](media/video-player.png) | ![](media/web-mode.png) |

## Use

```
Cyclorama                      # opens with a bundled James Webb image
Cyclorama photo.jpg
Cyclorama clip.mp4             # looped, with a play/seek/volume bar
Cyclorama https://example.com
```

Drag to move · drag the corner grip to resize · `Esc` to close.

Useful flags: `--curve 0.5` (how bent, 0–0.8) · `--top` (always-on-top) · `--still` (no idle drift) ·
`--mute` · `--size WxH` · `--pos X,Y`

## How it works

The content isn't a 2D warp effect — it's painted onto a real 3D mesh bent into a parabola:

```
z = curveDepth · nx²        // flip the sign and the screen bulges outward instead
```

Images use an `ImageBrush`, video plays through a GPU `VideoDrawing`, and web pages render in an
offscreen WebView2. Details are in [`Program.cs`](Program.cs) — the whole app is two files.

## Build & run

```
dotnet build -c Release
```

Needs .NET 8 (Windows). Bundled space imagery is from the **James Webb Space Telescope**
(NASA, ESA, CSA, STScI — [credits](samples/CREDITS.md)). Code is [MIT](LICENSE).
