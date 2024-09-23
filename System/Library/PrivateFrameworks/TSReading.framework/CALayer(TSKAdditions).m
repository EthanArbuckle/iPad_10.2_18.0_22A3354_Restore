@implementation CALayer(TSKAdditions)

- (uint64_t)makeStretchableLayerWithImage:()TSKAdditions leftCap:topCap:
{
  return objc_msgSend(a1, "makeStretchableLayerWithImage:leftCap:rightCap:topCap:bottomCap:", a3, a3, a4, a4);
}

- (uint64_t)makeStretchableLayerWithImage:()TSKAdditions leftCap:rightCap:topCap:bottomCap:
{
  objc_msgSend(a1, "makeStretchableLayerWithoutImage:leftCap:rightCap:topCap:bottomCap:");
  return objc_msgSend(a1, "setContents:", a3);
}

- (uint64_t)makeStretchableLayerWithoutImage:()TSKAdditions leftCap:topCap:
{
  return objc_msgSend(a1, "makeStretchableLayerWithoutImage:leftCap:rightCap:topCap:bottomCap:", a3, a3, a4, a4);
}

- (uint64_t)makeStretchableLayerWithoutImage:()TSKAdditions leftCap:rightCap:topCap:bottomCap:
{
  double Width;
  size_t Height;
  double v15;
  double v16;

  Width = (double)CGImageGetWidth(image);
  Height = CGImageGetHeight(image);
  v15 = a7 / (double)Height;
  v16 = ((double)Height - (a6 + a7)) / (double)Height;
  objc_msgSend(a1, "setContentsGravity:", *MEMORY[0x24BDE5C88]);
  return objc_msgSend(a1, "setContentsCenter:", a4 / Width, v15, (Width - (a4 + a5)) / Width, v16);
}

- (uint64_t)makeStretchableLayerWithUIImage:()TSKAdditions leftCap:topCap:
{
  return objc_msgSend(a1, "makeStretchableLayerWithUIImage:leftCap:rightCap:topCap:bottomCap:", a3, a3, a4, a4);
}

- (uint64_t)makeStretchableLayerWithUIImage:()TSKAdditions leftCap:rightCap:topCap:bottomCap:
{
  double v13;
  double v14;

  objc_msgSend(a7, "scale");
  v14 = v13;
  objc_msgSend(a1, "makeStretchableLayerWithImage:leftCap:rightCap:topCap:bottomCap:", objc_msgSend(a7, "CGImage"), v14 * a2, v14 * a3, v14 * a4, v14 * a5);
  return objc_msgSend(a1, "setContentsScale:", v14);
}

@end
