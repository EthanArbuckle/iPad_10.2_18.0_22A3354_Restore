@implementation UIImage(SeymourMedia)

- (uint64_t)initWithData:()SeymourMedia immediateLoadWithMaxSize:scale:
{
  return objc_msgSend(a1, "_initWithData:immediateLoadWithMaxSize:scale:renderingIntent:cache:", a3, 0, 0);
}

+ (id)imageWithSize:()SeymourMedia format:actions:
{
  id v9;
  objc_class *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  double v18;
  double v19;

  v9 = a6;
  v10 = (objc_class *)MEMORY[0x24BEBD618];
  v11 = a5;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithSize:format:", v11, a1, a2);

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __54__UIImage_SeymourMedia__imageWithSize_format_actions___block_invoke;
  v16[3] = &unk_24DC6AAF0;
  v18 = a1;
  v19 = a2;
  v17 = v9;
  v13 = v9;
  objc_msgSend(v12, "imageWithActions:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)compositedImageWithSize:()SeymourMedia images:cornerRadius:blendMode:legacyMode:
{
  id v14;
  id v15;
  CGImage *v16;
  uint64_t v17;
  double Width;
  double Height;
  double v20;
  BOOL v21;
  BOOL v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  int v33;

  v14 = a6;
  objc_msgSend(v14, "firstObject");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = (CGImage *)objc_msgSend(v15, "CGImage");
  v17 = objc_msgSend(v14, "count");
  if (a4 <= 0.0
    && v17 == 1
    && v16
    && ((Width = (double)CGImageGetWidth(v16),
         Height = (double)CGImageGetHeight(v16),
         v20 = round(a2),
         round(a3) == Height)
      ? (v21 = v20 == Width)
      : (v21 = 0),
        !v21 ? (v22 = a8 == 0) : (v22 = 0),
        !v22))
  {
    v23 = v15;
  }
  else if (objc_msgSend(v14, "count"))
  {
    if ((unint64_t)objc_msgSend(v14, "count") > 1)
      objc_msgSend(MEMORY[0x24BEBD620], "smu_preferredRendererFormat");
    else
      objc_msgSend(MEMORY[0x24BEBD620], "smu_formatForImage:", v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setOpaque:", 1);
    v25 = (void *)objc_opt_class();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __90__UIImage_SeymourMedia__compositedImageWithSize_images_cornerRadius_blendMode_legacyMode___block_invoke;
    v27[3] = &unk_24DC6AB18;
    v29 = a4;
    v30 = a2;
    v31 = a3;
    v33 = a7;
    v28 = v14;
    v32 = a1;
    objc_msgSend(v25, "imageWithSize:format:actions:", v24, v27, a2, a3);
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (double)centerRect:()SeymourMedia inRect:
{
  return round(a5 + (a7 - a3) * 0.5);
}

@end
