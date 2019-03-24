#
# gdSetPixel
#
from os import getTempDir, `/`, existsOrCreateDir, removeDir
import libgd

proc main() =

  let outputsDir = getTempDir() / "libgd-test"
  discard existsOrCreateDir(outputsDir)

  withGd img, 128, 128:
    let white = img.gdSetColor(255, 255, 255)
    let blue = img.gdSetColor("#0000ff")

    for i in 10 .. 100:
      img.gdSetPixel(point=[i, i], color=blue)

    let png_out = open(outputsDir / "test_gd_set_pixel.png", fmWrite)
    img.gdWritePng(png_out)
    png_out.close()

  removeDir(outputsDir)

main()
