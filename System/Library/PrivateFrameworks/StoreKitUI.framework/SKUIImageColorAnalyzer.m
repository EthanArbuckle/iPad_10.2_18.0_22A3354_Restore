@implementation SKUIImageColorAnalyzer

+ (id)analyzeImage:(id)a3
{
  id v4;
  void *v5;
  CGContext *v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v17[37];
  unsigned __int8 v18;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    +[SKUIImageColorAnalyzer analyzeImage:].cold.1();
  }
  v5 = (void *)objc_opt_new();
  if (v5)
  {
    v6 = (CGContext *)objc_msgSend(a1, "_createContextForImage:", v4);
    if (!v6)
      goto LABEL_10;
    AnalyzedImageColors::AnalyzedImageColors((AnalyzedImageColors *)v17);
    v7 = AnalyzeImagePlease((_BOOL8)v6, (uint64_t)v17);
    v8 = v7;
    if (v7)
    {
      objc_msgSend(a1, "_colorFromITColor:", v17[0], v17[1], v17[2], v17[3]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v9);

      objc_msgSend(a1, "_colorFromITColor:", v17[4], v17[5], v17[6], v17[7]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTextPrimaryColor:", v10);

      objc_msgSend(a1, "_colorFromITColor:", v17[8], v17[9], v17[10], v17[11]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTextSecondaryColor:", v11);

      objc_msgSend(v5, "setIsBackgroundLight:", v18);
    }
    CGContextRelease(v6);
    if (!v8)
    {
LABEL_10:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v12);

      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTextPrimaryColor:", v13);

      objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTextSecondaryColor:", v14);

      objc_msgSend(v5, "setIsBackgroundLight:", 1);
    }
    v15 = v5;
  }

  return v5;
}

+ (id)_colorFromITColor:(ITColor)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", a3.var0, a3.var1, a3.var2, a3.var3);
}

+ (CGContext)_createContextForImage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  CGImage *v6;
  size_t Width;
  size_t Height;
  CGContext *v9;
  CGColorSpace *SRGB;
  CGImageRef CopyWithColorSpace;
  CGImage *v12;
  CGContext *v14;
  CGRect v15;

  v3 = a3;
  v4 = v3;
  if (v3 && (v5 = objc_retainAutorelease(v3), objc_msgSend(v5, "CGImage")))
  {
    v6 = (CGImage *)objc_msgSend(objc_retainAutorelease(v5), "CGImage");
    Width = CGImageGetWidth(v6);
    Height = CGImageGetHeight(v6);
    v9 = 0;
    if (Width && Height)
    {
      SRGB = (CGColorSpace *)CGColorSpaceGetSRGB();
      if (SRGB)
      {
        CopyWithColorSpace = CGImageCreateCopyWithColorSpace(v6, SRGB);
        v12 = CopyWithColorSpace;
        if (CopyWithColorSpace)
          v6 = CopyWithColorSpace;
      }
      else
      {
        v12 = 0;
      }
      v14 = CGBitmapContextCreate(0, 0x16uLL, 0x16uLL, 8uLL, 0x58uLL, SRGB, 0x2002u);
      v9 = v14;
      if (v14)
      {
        v15.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
        v15.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
        v15.size.width = 22.0;
        v15.size.height = 22.0;
        CGContextDrawImage(v14, v15, v6);
      }
      if (v12)
        CGImageRelease(v12);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)analyzeImage:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "+[SKUIImageColorAnalyzer analyzeImage:]";
}

@end
