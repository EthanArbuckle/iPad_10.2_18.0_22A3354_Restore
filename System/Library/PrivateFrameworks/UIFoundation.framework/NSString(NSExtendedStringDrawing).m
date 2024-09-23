@implementation NSString(NSExtendedStringDrawing)

- (double)boundingRectWithSize:()NSExtendedStringDrawing options:attributes:context:
{
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  char v18;

  v13 = CTFontSwapDefaultLineHeightAdjustment();
  v14 = MEMORY[0x18D790ECC](v13, 0.0);
  v18 = 0;
  if (!a6)
    a6 = +[NSAttributeDictionary emptyAttributeDictionary](NSAttributeDictionary, "emptyAttributeDictionary");
  v15 = __NSStringDrawingEngine(a1, a6, a5, 0, a7, 0, &v18, 0.0, 0.0, a2, a3, 0.0);
  v16 = CTFontSwapDefaultLineHeightAdjustment();
  MEMORY[0x18D790ECC](v16, v14);
  return v15;
}

- (void)drawWithRect:()NSExtendedStringDrawing options:attributes:context:
{
  uint64_t v17;
  uint64_t v18;

  v17 = CTFontSwapDefaultLineHeightAdjustment();
  MEMORY[0x18D790ECC](v17, 0.0);
  if (!a8)
    a8 = +[NSAttributeDictionary emptyAttributeDictionary](NSAttributeDictionary, "emptyAttributeDictionary");
  _NSStringDrawingCore(a1, a8, a7, 0, a2, a3, a4, a5, 0.0, v18, a9);
  CTFontSwapDefaultLineHeightAdjustment();
  JUMPOUT(0x18D790ECCLL);
}

- (uint64_t)drawWithRect:()NSExtendedStringDrawing options:attributes:
{
  return objc_msgSend(a1, "drawWithRect:options:attributes:context:", a3, a4, 0);
}

- (uint64_t)boundingRectWithSize:()NSExtendedStringDrawing options:attributes:
{
  return objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:", a3, a4, 0);
}

- (uint64_t)hasColorGlyphsInRange:()NSExtendedStringDrawing attributes:
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v8 = (void *)objc_msgSend(objc_allocWithZone((Class)_NSCachedAttributedString), "initWithString:attributes:", a1, a5);
  v9 = objc_msgSend(v8, "copyCachedInstance");
  if (v9)
  {
    v10 = (void *)v9;

    v8 = v10;
  }
  else
  {
    objc_msgSend(v8, "fixAttributesInRange:", a3, a4);
    if (a4 == objc_msgSend(a1, "length"))
      objc_msgSend(v8, "cache");
  }
  v11 = objc_msgSend(v8, "hasColorGlyphsInRange:", a3, a4);

  return v11;
}

@end
