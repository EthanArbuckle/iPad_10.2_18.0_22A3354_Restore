@implementation TSUImage(TSDAdditions)

- (uint64_t)CGImageForSize:()TSDAdditions inContext:orLayer:
{
  void *v11;
  uint64_t v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGAffineTransform v25;

  if (a5)
  {
    if (a6)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUImage(TSDAdditions) CGImageForSize:inContext:orLayer:]");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSUImage-TSDAdditions.m"), 20, CFSTR("using context to determine requested image size. layer should be nil"));
    }
    if ((TSDCGContextIsPrintContext((uint64_t)a5) & 1) != 0 || TSDCGContextIsPDFContext((uint64_t)a5))
      return objc_msgSend(a1, "CGImageForContentsScale:", 2.0);
    v16 = TSDCGContextAssociatedScreenScale((uint64_t)a5);
    v17 = TSDMultiplySizeScalar(a2, a3, v16);
    v19 = v18;
    CGContextGetCTM(&v25, a5);
    v20 = TSDTransformScale(&v25.a);
    a2 = TSDMultiplySizeScalar(v17, v19, v20);
    a3 = v21;
  }
  else if (a6)
  {
    objc_msgSend(a6, "contentsScale");
    a2 = a2 * v14;
    objc_msgSend(a6, "contentsScale");
    a3 = a3 * v15;
  }
  objc_msgSend(a1, "size");
  if (a2 <= v22 && (objc_msgSend(a1, "size"), a3 <= v23))
    v24 = 1.0;
  else
    v24 = 2.0;
  return objc_msgSend(a1, "CGImageForContentsScale:", v24);
}

@end
