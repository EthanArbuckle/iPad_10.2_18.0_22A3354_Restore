@implementation UIImage(SFUIImageUtilities)

+ (double)sfui_scaleSize:()SFUIImageUtilities toSize:contentMode:
{
  double v7;
  double v8;

  v7 = a1 / a2;
  v8 = a3 / a4;
  if (a7 == 2)
  {
    if (v7 <= v8)
      return a3;
    return a4 * v7;
  }
  if (a7 == 1 && v7 < v8)
    return a4 * v7;
  return a3;
}

- (id)sfui_imageScaledToSize:()SFUIImageUtilities contentMode:
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  id v23;
  CGSize v25;

  v5 = (void *)objc_opt_class();
  objc_msgSend(a1, "size");
  objc_msgSend(v5, "sfui_scaleSize:toSize:contentMode:", a3);
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "size");
  if (v11 == v7 && v10 == v9)
  {
    v23 = a1;
  }
  else
  {
    objc_msgSend(a1, "scale");
    UIRectIntegralWithScale();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(a1, "scale");
    v22 = v21;
    v25.width = v18;
    v25.height = v20;
    UIGraphicsBeginImageContextWithOptions(v25, 0, v22);
    objc_msgSend(a1, "drawInRect:", v14, v16, v18, v20);
    UIGraphicsGetImageFromCurrentImageContext();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  return v23;
}

+ (id)sfui_bulletImageWithSystemName:()SFUIImageUtilities color:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x24BEBD4B8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "systemWhiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 22.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sfui_systemImageNamed:withBackgroundColor:symbolColor:size:cornerRadius:configuration:", v8, v7, v9, v10, 40.0, 40.0, 10.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)sfui_systemImageNamed:()SFUIImageUtilities withBackgroundColor:symbolColor:size:cornerRadius:
{
  return objc_msgSend(a1, "sfui_systemImageNamed:withBackgroundColor:symbolColor:size:cornerRadius:configuration:", a3, a4, a5, 0);
}

+ (id)sfui_systemImageNamed:()SFUIImageUtilities withBackgroundColor:symbolColor:size:cornerRadius:configuration:
{
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  void *v26;
  CGSize v28;

  v15 = a7;
  v16 = (void *)MEMORY[0x24BEBD640];
  v17 = a8;
  objc_msgSend(v16, "systemImageNamed:withConfiguration:", a6, a9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageWithTintColor:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "scale");
    v21 = v20;
    v28.width = a1;
    v28.height = a2;
    UIGraphicsBeginImageContextWithOptions(v28, 0, v21);
    objc_msgSend(v15, "setFill");
    objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), a1, a2, a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fill");
    objc_msgSend(v19, "size");
    v24 = (a1 - v23) * 0.5;
    objc_msgSend(v19, "size");
    objc_msgSend(v19, "drawAtPoint:", v24, (a2 - v25) * 0.5);
    UIGraphicsGetImageFromCurrentImageContext();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

@end
