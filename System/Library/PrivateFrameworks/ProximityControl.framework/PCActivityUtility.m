@implementation PCActivityUtility

+ (id)order:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF00]), "initWithArray:", v3);

  return v4;
}

+ (id)activityFrom:(id)a3
{
  id v3;
  void *v4;
  char v5;
  __objc2_class **v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;

  v3 = a3;
  objc_msgSend(v3, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("com.apple.ProximityControl.activity.call"), "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = off_24CCF6278;
  }
  else
  {
    objc_msgSend(v3, "activityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(CFSTR("com.apple.ProximityControl.activity.media"), "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      v6 = off_24CCF6270;
    }
    else
    {
      objc_msgSend(v3, "activityType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(CFSTR("com.apple.ProximityControl.activity.alarm"), "isEqualToString:", v9);

      if ((v10 & 1) != 0)
      {
        v6 = off_24CCF6238;
      }
      else
      {
        objc_msgSend(v3, "activityType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(CFSTR("com.apple.ProximityControl.activity.annoucement"), "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {
          v6 = off_24CCF6240;
        }
        else
        {
          objc_msgSend(v3, "activityType");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(CFSTR("com.apple.ProximityControl.activity.timer"), "isEqualToString:", v13);

          if (!v14)
          {
            v15 = 0;
            goto LABEL_12;
          }
          v6 = &off_24CCF6280;
        }
      }
    }
  }
  v15 = (void *)objc_msgSend(objc_alloc(*v6), "initWithActivity:", v3);
LABEL_12:

  return v15;
}

BOOL __27__PCActivityUtility_order___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[PCActivityUtility activity:isLessThan:](PCActivityUtility, "activity:isLessThan:", a3, a2);
}

+ (BOOL)activity:(id)a3 isLessThan:(id)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;

  v5 = a4;
  v6 = objc_msgSend(a3, "pcactivityType");
  v7 = objc_msgSend(v5, "pcactivityType");

  return v6 < v7;
}

+ (id)deviceNameFor:(id)a3
{
  return CFSTR("HomePod");
}

+ (id)composedImageFor:(id)a3
{
  return +[PCActivityUtility composedImageFor:assetType:](PCActivityUtility, "composedImageFor:assetType:", a3, 0);
}

+ (id)composedImageFor:(id)a3 assetType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  +[PCActivityUtility imageForAssetType:](PCActivityUtility, "imageForAssetType:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "pcactivityType") == 1)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[PCActivityUtility composedImageWithDeviceImage:badgeImage:](PCActivityUtility, "composedImageWithDeviceImage:badgeImage:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)composedImageWithArtworkFor:(id)a3 assetType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  +[PCActivityUtility imageForAssetType:](PCActivityUtility, "imageForAssetType:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PCActivityUtility scaleImageIfNeeded:toFitSize:withCornerRadius:](PCActivityUtility, "scaleImageIfNeeded:toFitSize:withCornerRadius:", v7, 14.0, 14.0, 1.75);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PCActivityUtility composedImageWithDeviceImage:badgeImage:](PCActivityUtility, "composedImageWithDeviceImage:badgeImage:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)composedImageWithDeviceImage:(id)a3 badgeImage:(id)a4
{
  id v5;
  id v6;
  CGContext *CurrentContext;
  id v8;
  CGColor *v9;
  void *v10;
  CGSize v12;
  CGSize v13;

  v5 = a4;
  v6 = a3;
  v12.width = 44.0;
  v12.height = 44.0;
  UIGraphicsBeginImageContextWithOptions(v12, 0, 0.0);
  objc_msgSend(v6, "drawInRect:", 0.0, 0.0, 44.0, 44.0);

  if (v5)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.2);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (CGColor *)objc_msgSend(v8, "CGColor");
    v13.width = 0.0;
    v13.height = 1.0;
    CGContextSetShadowWithColor(CurrentContext, v13, 2.0, v9);

    objc_msgSend(v5, "drawInRect:", 27.0, 27.0, 14.0, 14.0);
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v10;
}

+ (id)disambiguationButtonImageForActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGContext *CurrentContext;
  id v9;
  CGColor *v10;
  id v11;
  CGSize v13;
  CGSize v14;

  v3 = a3;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PCActivityUtility iconForBundleIdentifier:](PCActivityUtility, "iconForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "pcactivityType") != 1)
  {
    if (objc_msgSend(v3, "pcactivityType"))
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v3, "callImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        goto LABEL_7;
    }
LABEL_9:
    v11 = objc_alloc_init(MEMORY[0x24BDF6AC8]);
    goto LABEL_10;
  }
  objc_msgSend(v3, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PCActivityUtility scaleImageIfNeeded:toFitSize:withCornerRadius:](PCActivityUtility, "scaleImageIfNeeded:toFitSize:withCornerRadius:", v6, 34.0, 34.0, 2.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_9;
LABEL_7:
  if (!v5)
    goto LABEL_9;
  v13.width = 42.0;
  v13.height = 42.0;
  UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.2);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (CGColor *)objc_msgSend(v9, "CGColor");
  v14.width = 0.0;
  v14.height = 1.0;
  CGContextSetShadowWithColor(CurrentContext, v14, 2.0, v10);

  objc_msgSend(v7, "drawInRect:", 4.0, 4.0, 34.0, 34.0);
  objc_msgSend(v5, "drawInRect:", 26.0, 26.0, 16.0, 16.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
LABEL_10:

  return v11;
}

+ (id)iconForBundleIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BE51A90];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:", v4);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", 60.0, 60.0, 3.0);
  v7 = (id)objc_msgSend(v5, "prepareImageForDescriptor:", v6);
  v8 = objc_msgSend(v5, "CGImageForDescriptor:", v6);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:", v8);

  return v9;
}

+ (id)imageForAssetType:(int64_t)a3
{
  void *v4;
  void *v5;

  +[PCAssetManager sharedInstance](PCAssetManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageForAssetType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)formattedDurationFor:(double)a3
{
  uint64_t v4;
  id v5;
  void *v6;

  if (a3 >= 3600.0)
    v4 = 224;
  else
    v4 = 192;
  v5 = objc_alloc_init(MEMORY[0x24BDD14F8]);
  objc_msgSend(v5, "setAllowedUnits:", v4);
  objc_msgSend(v5, "setUnitsStyle:", 0);
  objc_msgSend(v5, "setZeroFormattingBehavior:", 0x10000);
  objc_msgSend(v5, "stringFromTimeInterval:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)scaleImageIfNeeded:(id)a3 toFitSize:(CGSize)a4 withCornerRadius:(double)a5
{
  double height;
  double width;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  CGSize v25;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  if (v8)
  {
    v9 = 0.0;
    v25.width = width;
    v25.height = height;
    UIGraphicsBeginImageContextWithOptions(v25, 0, 0.0);
    objc_msgSend(v8, "size");
    v11 = v10;
    objc_msgSend(v8, "size");
    if (vabdd_f64(v11, v12) >= 0.00000011920929)
    {
      objc_msgSend(v8, "size");
      v17 = width / v16;
      objc_msgSend(v8, "size");
      if (v17 < height / v18)
        v17 = height / v18;
      objc_msgSend(v8, "size");
      v20 = v19 * v17;
      objc_msgSend(v8, "size");
      v22 = v21 * v17;
      v9 = (width - v20) * 0.5;
      v14 = (height - v22) * 0.5;
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, width, height, a5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addClip");

      width = v20;
      height = v22;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, width, height, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addClip");

      v14 = 0.0;
    }
    objc_msgSend(v8, "drawInRect:", v9, v14, width, height);
    UIGraphicsGetImageFromCurrentImageContext();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
