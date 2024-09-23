@implementation UIColor(SafariSharedExtras)

- (BOOL)safari_meetsThresholdForDarkAppearance
{
  double v1;

  objc_msgSend(a1, "safari_grayscaleComponent");
  return v1 <= 0.6;
}

- (double)safari_grayscaleComponent
{
  CGColorSpace *v2;
  CGColor *CopyByMatchingToColorSpace;
  double v4;

  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D930]);
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v2, kCGRenderingIntentDefault, (CGColorRef)objc_msgSend(objc_retainAutorelease(a1), "CGColor"), 0);
  v4 = *CGColorGetComponents(CopyByMatchingToColorSpace);
  CFRelease(v2);
  CFRelease(CopyByMatchingToColorSpace);
  return v4;
}

+ (id)safari_colorWithRGBColorComponents:()SafariSharedExtras
{
  id v3;
  void *v4;
  double v6;
  double v7;
  double v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v3, "count") != 3)
    goto LABEL_7;
  v7 = 0.0;
  v8 = 0.0;
  v6 = 0.0;
  v4 = 0;
  if (getValidColorComponentAtIndexInArray(v3, 0, &v8))
  {
    if (getValidColorComponentAtIndexInArray(v3, 1, &v7)
      && getValidColorComponentAtIndexInArray(v3, 2, &v6))
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v8, v7, v6, 1.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v4 = 0;
  }
LABEL_8:

  return v4;
}

- (id)safari_rgbColorComponents
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  double v6;
  double v7;
  double v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v7 = 0.0;
  v8 = 0.0;
  v6 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v8, &v7, &v6, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)safari_colorWithWBSNamedColorOption:()SafariSharedExtras
{
  id v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "isClearColor");
  v5 = (void *)MEMORY[0x1E0CEA478];
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  }
  else
  {
    objc_msgSend(v3, "redComponent");
    v7 = v6;
    objc_msgSend(v3, "greenComponent");
    v9 = v8;
    objc_msgSend(v3, "blueComponent");
    v11 = v10;
    objc_msgSend(v3, "alphaComponent");
    objc_msgSend(v5, "colorWithRed:green:blue:alpha:", v7, v9, v11, v12);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)safari_colorWithSerializedColorData:()SafariSharedExtras
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v10;
  uint8_t buf[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v10 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v10);
    v5 = v10;
    if (v5)
    {
      v6 = (id)WBS_LOG_CHANNEL_PREFIXKeyedArchiver();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "safari_privacyPreservingDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIColor(SafariSharedExtras) safari_colorWithSerializedColorData:].cold.1(v7, buf, v6);
      }

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishDecoding");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)safari_colorDataForSerialization
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v2, "encodeObject:forKey:", a1, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v2, "encodedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)safari_luminance
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  CGColorSpace *v6;
  id v7;
  CGColor *CopyByMatchingToColorSpace;
  const CGFloat *Components;
  void *v10;

  objc_getAssociatedObject(a1, sel_safari_luminance);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D990]);
    v7 = objc_retainAutorelease(a1);
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v6, kCGRenderingIntentDefault, (CGColorRef)objc_msgSend(v7, "CGColor"), 0);
    Components = CGColorGetComponents(CopyByMatchingToColorSpace);
    v5 = WBSComputeLuminance(*Components, Components[1], Components[2]);
    CFRelease(v6);
    CFRelease(CopyByMatchingToColorSpace);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v7, sel_safari_luminance, v10, (void *)1);

  }
  return v5;
}

- (double)safari_saturation
{
  void *v1;
  double v3;

  v3 = 0.0;
  objc_msgSend(a1, "safari_sRGBColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "getHue:saturation:brightness:alpha:", 0, &v3, 0, 0);

  return v3;
}

- (BOOL)safari_isOffWhite
{
  double v2;
  double v3;

  objc_msgSend(a1, "safari_saturation");
  if (v2 >= 0.05)
    return 0;
  objc_msgSend(a1, "safari_luminance");
  return v3 > 0.8;
}

- (double)safari_contrastRatioWithColor:()SafariSharedExtras
{
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a3, "safari_luminance");
  v5 = v4;
  objc_msgSend(a1, "safari_luminance");
  if (v5 <= v6)
    v7 = v6;
  else
    v7 = v5;
  if (v5 < v6)
    v6 = v5;
  return (v7 + 0.05) / (v6 + 0.05);
}

- (id)safari_colorByModifyingBrightnessByMultiplier:()SafariSharedExtras
{
  double v4;
  double v5;
  double v6;
  double v7;

  v6 = 0.0;
  v7 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v7, &v6, &v5, &v4);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithHue:saturation:brightness:alpha:", v7, v6, v5 * a2, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)safari_colorWithSerializedColorData:()SafariSharedExtras .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A840B000, log, OS_LOG_TYPE_ERROR, "Failed to read from color data: %{public}@", buf, 0xCu);

}

@end
