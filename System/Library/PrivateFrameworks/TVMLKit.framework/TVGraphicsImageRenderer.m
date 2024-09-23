@implementation TVGraphicsImageRenderer

+ (id)preferredFormat
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDF6AA0];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formatForTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");

  return v5;
}

+ (id)formatWithCGImage:(CGImage *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formatWithUIImage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)formatWithUIImage:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  if (formatWithUIImage__onceToken != -1)
    dispatch_once(&formatWithUIImage__onceToken, &__block_literal_global_38);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_supportsDeepColor");

  if (!v8)
  {
    v9 = 0;
LABEL_9:
    +[TVGraphicsImageRenderer preferredFormat](TVGraphicsImageRenderer, "preferredFormat");
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
    goto LABEL_10;
  }
  objc_msgSend(v3, "imageRendererFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScale:", v6);
  if (!v9 || formatWithUIImage__sOverrideDefault && formatWithUIImage__sPrefersExtendedRange)
    goto LABEL_9;
LABEL_10:

  return v9;
}

uint64_t __45__TVGraphicsImageRenderer_formatWithUIImage___block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("PrefersExtendedRange"), CFSTR("com.apple.TVMLKit"), (Boolean *)&formatWithUIImage__sOverrideDefault);
  formatWithUIImage__sPrefersExtendedRange = result;
  return result;
}

+ (id)imageWithSize:(CGSize)a3 format:(id)a4 actions:(id)a5
{
  double height;
  double width;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  height = a3.height;
  width = a3.width;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BDF6A98];
  v10 = a4;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithSize:format:", v10, width, height);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56__TVGraphicsImageRenderer_imageWithSize_format_actions___block_invoke;
  v15[3] = &unk_24EB87920;
  v16 = v8;
  v12 = v8;
  objc_msgSend(v11, "imageWithActions:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __56__TVGraphicsImageRenderer_imageWithSize_format_actions___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  CGContextSetInterpolationQuality((CGContextRef)objc_msgSend(v3, "CGContext"), kCGInterpolationHigh);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)imageWithSize:(CGSize)a3 format:(id)a4 cgContextActions:(id)a5
{
  double height;
  double width;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  double v17;
  double v18;

  height = a3.height;
  width = a3.width;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BDF6A98];
  v10 = a4;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithSize:format:", v10, width, height);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__TVGraphicsImageRenderer_imageWithSize_format_cgContextActions___block_invoke;
  v15[3] = &unk_24EB87948;
  v17 = width;
  v18 = height;
  v16 = v8;
  v12 = v8;
  objc_msgSend(v11, "imageWithActions:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __65__TVGraphicsImageRenderer_imageWithSize_format_cgContextActions___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextSetInterpolationQuality(v3, kCGInterpolationHigh);
  CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 48));
  CGContextScaleCTM(v3, 1.0, -1.0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)imageWithSize:(CGSize)a3 alpha:(BOOL)a4 actions:(id)a5
{
  _BOOL4 v5;
  double height;
  double width;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  height = a3.height;
  width = a3.width;
  v8 = a5;
  +[TVGraphicsImageRenderer preferredFormat](TVGraphicsImageRenderer, "preferredFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOpaque:", !v5);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:format:", v9, width, height);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__TVGraphicsImageRenderer_imageWithSize_alpha_actions___block_invoke;
  v14[3] = &unk_24EB87920;
  v15 = v8;
  v11 = v8;
  objc_msgSend(v10, "imageWithActions:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __55__TVGraphicsImageRenderer_imageWithSize_alpha_actions___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  CGContextSetInterpolationQuality((CGContextRef)objc_msgSend(v3, "CGContext"), kCGInterpolationHigh);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)imageWithSize:(CGSize)a3 alpha:(BOOL)a4 cgContextActions:(id)a5
{
  _BOOL4 v5;
  double height;
  double width;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  double v16;
  double v17;

  v5 = a4;
  height = a3.height;
  width = a3.width;
  v8 = a5;
  +[TVGraphicsImageRenderer preferredFormat](TVGraphicsImageRenderer, "preferredFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOpaque:", !v5);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:format:", v9, width, height);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __64__TVGraphicsImageRenderer_imageWithSize_alpha_cgContextActions___block_invoke;
  v14[3] = &unk_24EB87948;
  v16 = width;
  v17 = height;
  v15 = v8;
  v11 = v8;
  objc_msgSend(v10, "imageWithActions:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __64__TVGraphicsImageRenderer_imageWithSize_alpha_cgContextActions___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextSetInterpolationQuality(v3, kCGInterpolationHigh);
  CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 48));
  CGContextScaleCTM(v3, 1.0, -1.0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)decodedImage:(id)a3 opaque:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a4;
  v5 = a3;
  if (v5)
  {
    +[TVGraphicsImageRenderer formatWithUIImage:](TVGraphicsImageRenderer, "formatWithUIImage:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScale:", 1.0);
    objc_msgSend(v6, "setOpaque:", v4);
    objc_msgSend(v5, "size");
    v8 = v7;
    v10 = v9;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __47__TVGraphicsImageRenderer_decodedImage_opaque___block_invoke;
    v13[3] = &unk_24EB86630;
    v14 = v5;
    +[TVGraphicsImageRenderer imageWithSize:format:actions:](TVGraphicsImageRenderer, "imageWithSize:format:actions:", v6, v13, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __47__TVGraphicsImageRenderer_decodedImage_opaque___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;

  v1 = *(void **)(a1 + 32);
  v2 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(v1, "size");
  return objc_msgSend(v1, "drawInRect:", v2, v3, v4, v5);
}

@end
