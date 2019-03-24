#
# gdFlip
#
from os import getTempDir, `/`, existsOrCreateDir, removeDir
import libgd

proc main() =

  let outputsDir = getTempDir() / "libgd-test"
  discard existsOrCreateDir(outputsDir)

  withGd img, 300, 300:
    let white = img.gdSetColor(255, 255, 255)

    let red = img.gdSetColor(255, 0, 0)
    img.gdDrawRectangle(startCorner=[50, 50], endCorner=[100, 220], color=red)

    img.gdFlip(HORIZONTAL)

    let png_out = open(outputsDir / "test_gd_flip.png", fmWrite)
    img.gdWritePng(png_out)
    png_out.close()

  removeDir(outputsDir)

main()
