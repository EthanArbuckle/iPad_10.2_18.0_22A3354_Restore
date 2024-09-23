@implementation CALayer(WebCoreCALayerExtras)

- (uint64_t)_web_clearContents
{
  objc_msgSend(a1, "setContents:", 0);
  return objc_msgSend(a1, "setContentsOpaque:", 0);
}

- (uint64_t)web_disableAllActions
{
  _QWORD v3[17];
  _QWORD v4[17];
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("actions");
  v3[0] = CFSTR("anchorPoint");
  v3[1] = CFSTR("anchorPointZ");
  v4[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4[1] = v4[0];
  v3[2] = CFSTR("backgroundColor");
  v3[3] = CFSTR("borderColor");
  v4[2] = v4[0];
  v4[3] = v4[0];
  v3[4] = CFSTR("borderWidth");
  v3[5] = CFSTR("bounds");
  v4[4] = v4[0];
  v4[5] = v4[0];
  v3[6] = CFSTR("contents");
  v3[7] = CFSTR("contentsRect");
  v4[6] = v4[0];
  v4[7] = v4[0];
  v3[8] = CFSTR("contentsScale");
  v3[9] = CFSTR("cornerRadius");
  v4[8] = v4[0];
  v4[9] = v4[0];
  v3[10] = CFSTR("opacity");
  v3[11] = CFSTR("position");
  v4[10] = v4[0];
  v4[11] = v4[0];
  v3[12] = CFSTR("shadowColor");
  v3[13] = CFSTR("sublayerTransform");
  v4[12] = v4[0];
  v4[13] = v4[0];
  v3[14] = CFSTR("sublayers");
  v3[15] = CFSTR("transform");
  v4[14] = v4[0];
  v4[15] = v4[0];
  v3[16] = CFSTR("zPosition");
  v4[16] = v4[0];
  v6[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 17);
  return objc_msgSend(a1, "setStyle:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
}

- (uint64_t)_web_setLayerBoundsOrigin:()WebCoreCALayerExtras
{
  objc_msgSend(a1, "bounds");
  return objc_msgSend(a1, "setBounds:", a2, a3);
}

- (uint64_t)_web_setLayerTopLeftPosition:()WebCoreCALayerExtras
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend(a1, "bounds");
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "anchorPoint");
  return objc_msgSend(a1, "setPosition:", a2 + v10 * v7, a3 + v11 * v9, v10, v11);
}

+ (void)_web_renderLayerWithContextID:()WebCoreCALayerExtras shouldPreserveFlip:
{
  void *v6;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0CD27B0], "layer");
  objc_msgSend(v6, "setContextId:", a3);
  objc_msgSend(v6, "setPreservesFlip:", a4);
  return v6;
}

- (uint64_t)_web_maskContainsPoint:()WebCoreCALayerExtras
{
  uint64_t result;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  char v13;
  const CGPath *v14;
  CGPoint v15;

  result = objc_msgSend(a1, "mask");
  if (result)
  {
    objc_msgSend((id)objc_msgSend(a1, "mask"), "convertPoint:fromLayer:", a1, a2, a3);
    v8 = v7;
    v10 = v9;
    v11 = (void *)objc_msgSend(a1, "mask");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v11)
    {
      v12 = (void *)objc_msgSend(v11, "fillRule");
      v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CD2B70]);
      v14 = (const CGPath *)objc_msgSend(v11, "path");
      v15.x = v8;
      v15.y = v10;
      return CGPathContainsPoint(v14, 0, v15, v13);
    }
    else
    {
      return objc_msgSend((id)objc_msgSend(a1, "mask"), "containsPoint:", v8, v10);
    }
  }
  return result;
}

- (uint64_t)_web_maskMayIntersectRect:()WebCoreCALayerExtras
{
  uint64_t result;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  CGRect PathBoundingBox;
  CGRect v21;

  result = objc_msgSend(a1, "mask");
  if (result)
  {
    objc_msgSend((id)objc_msgSend(a1, "mask"), "convertRect:fromLayer:", a1, a2, a3, a4, a5);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_msgSend(a1, "mask");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v19)
      PathBoundingBox = CGPathGetPathBoundingBox((CGPathRef)objc_msgSend(v19, "path"));
    else
      objc_msgSend((id)objc_msgSend(a1, "mask"), "bounds");
    v21.origin.x = v12;
    v21.origin.y = v14;
    v21.size.width = v16;
    v21.size.height = v18;
    return CGRectIntersectsRect(PathBoundingBox, v21);
  }
  return result;
}

@end
