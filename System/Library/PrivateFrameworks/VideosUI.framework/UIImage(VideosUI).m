@implementation UIImage(VideosUI)

+ (id)vui_videosUIImageNamed:()VideosUI
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "vui_videosUIBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)imageWithColor:()VideosUI
{
  id v3;
  void *v4;
  CGSize v6;
  CGRect v7;

  v3 = a3;
  v6.width = 1.0;
  v6.height = 1.0;
  UIGraphicsBeginImageContext(v6);
  objc_msgSend(v3, "setFill");

  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.width = 1.0;
  v7.size.height = 1.0;
  UIRectFill(v7);
  UIGraphicsGetImageFromCurrentImageContext();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v4;
}

- (uint64_t)vui_iconImageOfSize:()VideosUI
{
  double v6;

  +[VUIAppIconImageService iconCornerRadiusForSize:](VUIAppIconImageService, "iconCornerRadiusForSize:");
  return objc_msgSend(a1, "vui_iconImageOfSize:radius:", a2, a3, v6);
}

- (uint64_t)vui_iconImageOfSize:()VideosUI radius:
{
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = 1.0 / v9;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if (v12 == 2)
    v13 = 0.0;
  else
    v13 = v10;
  return objc_msgSend(a1, "vui_iconImageOfSize:radius:stroke:", a2, a3, a4, v13);
}

- (id)vui_iconImageOfSize:()VideosUI radius:stroke:
{
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  void *v15;
  CGContext *CurrentContext;
  void *v17;
  void *v18;
  void *v19;
  CGSize v21;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11;

  v13 = *MEMORY[0x1E0C9D538];
  v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", *MEMORY[0x1E0C9D538], v14, a2, a3, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLineWidth:", a5);
  v21.width = a2;
  v21.height = a3;
  UIGraphicsBeginImageContextWithOptions(v21, 0, v12);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
  objc_msgSend(v15, "addClip");
  v17 = (void *)objc_msgSend(a1, "copy");
  objc_msgSend(v17, "drawInRect:blendMode:alpha:", 17, v13, v14, a2, a3, 1.0);
  if (a5 != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setStroke");

    objc_msgSend(v15, "strokeWithBlendMode:alpha:", 5, 1.0);
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  return v19;
}

- (id)vui_aspectFitImageOfSize:()VideosUI
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  double v18;
  double v19;

  v5 = (void *)objc_msgSend(a1, "copy");
  objc_msgSend(v5, "size");
  v8 = a2 / v6;
  if (a2 / v6 < a3 / v7)
    v8 = a3 / v7;
  v9 = floor(v6 * v8);
  v10 = floor(v7 * v8);
  v11 = objc_alloc_init(MEMORY[0x1E0DC3830]);
  objc_msgSend(v11, "setScale:", 1.0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v11, v9, v10);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__UIImage_VideosUI__vui_aspectFitImageOfSize___block_invoke;
  v16[3] = &unk_1E9FA1668;
  v17 = v5;
  v18 = v9;
  v19 = v10;
  v13 = v5;
  objc_msgSend(v12, "imageWithActions:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)vui_croppedImageOfSize:()VideosUI
{
  id v5;
  double Width;
  id v7;
  CGFloat v8;
  id v9;
  CGImage *v10;
  CGImageRef v11;
  CGImage *v12;
  id v13;
  NSObject *v14;
  CGRect v16;

  v5 = objc_retainAutorelease((id)objc_msgSend(a1, "copy"));
  Width = (double)CGImageGetWidth((CGImageRef)objc_msgSend(v5, "CGImage"));
  v7 = objc_retainAutorelease(v5);
  v8 = floor(((double)CGImageGetHeight((CGImageRef)objc_msgSend(v7, "CGImage")) - a3) * 0.5);
  v9 = objc_retainAutorelease(v7);
  v10 = (CGImage *)objc_msgSend(v9, "CGImage");
  v16.origin.x = floor((Width - a2) * 0.5);
  v16.origin.y = v8;
  v16.size.width = a3;
  v16.size.height = a2;
  v11 = CGImageCreateWithImageInRect(v10, v16);
  if (v11)
  {
    v12 = v11;
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v11, objc_msgSend(v9, "imageOrientation"), 1.0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v12);
  }
  else
  {
    VUIDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[UIImage(VideosUI) vui_croppedImageOfSize:].cold.1(v14);

    v13 = v9;
  }

  return v13;
}

- (void)vui_croppedImageOfSize:()VideosUI .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "VUIImage::croppedImageOfSize - The created imageRef is nil. Returning unaltered image", v1, 2u);
}

@end
