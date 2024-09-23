@implementation PFParallaxColor(PhotosUI)

- (uint64_t)pu_UIColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", objc_msgSend(a1, "CGColor"));
}

- (uint64_t)pu_toneVariation
{
  objc_msgSend(MEMORY[0x1E0D71210], "lowKeyTone");
  objc_msgSend(MEMORY[0x1E0D71210], "highKeyTone");
  objc_msgSend(a1, "tone");
  PXMapValueFromRangeToNewRange();
  return PXClamp();
}

- (uint64_t)pu_lumaVariation
{
  objc_msgSend(MEMORY[0x1E0D71210], "lowKeyTone");
  objc_msgSend(MEMORY[0x1E0D71210], "highKeyTone");
  objc_msgSend(a1, "luma");
  PXMapValueFromRangeToNewRange();
  return PXClamp();
}

- (uint64_t)pu_chromaVariation
{
  objc_msgSend(MEMORY[0x1E0D71210], "lowKeyTone");
  objc_msgSend(MEMORY[0x1E0D71210], "highKeyTone");
  objc_msgSend(a1, "chroma");
  PXMapValueFromRangeToNewRange();
  return PXClamp();
}

+ (id)pu_parallaxColorWithUIColor:()PhotosUI
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0D75170], "colorWithCGColor:", objc_msgSend(objc_retainAutorelease(a3), "CGColor"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)pu_parallaxColorWithHue:()PhotosUI toneVariation:
{
  double v2;

  objc_msgSend(MEMORY[0x1E0D71210], "lowKeyTone");
  objc_msgSend(MEMORY[0x1E0D71210], "highKeyTone");
  PXMapValueFromRangeToNewRange();
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D75170]), "initWithHue:tone:", a1, v2);
}

+ (id)pu_parallaxColorWithHue:()PhotosUI chroma:lumaVariation:
{
  double v4;

  objc_msgSend(MEMORY[0x1E0D71210], "lowKeyTone");
  objc_msgSend(MEMORY[0x1E0D71210], "highKeyTone");
  PXMapValueFromRangeToNewRange();
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D75170]), "initWithLuma:hue:chroma:", v4, a1, a2);
}

+ (id)pu_parallaxColorWithLuma:()PhotosUI hue:chromaVariation:
{
  double v4;

  objc_msgSend(MEMORY[0x1E0D71210], "lowKeyTone");
  objc_msgSend(MEMORY[0x1E0D71210], "highKeyTone");
  PXMapValueFromRangeToNewRange();
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D75170]), "initWithLuma:hue:chroma:", a1, a2, v4);
}

@end
