@implementation UIImage(MTAdditions)

+ (id)defaultPodcastArtwork
{
  const __CFString *v0;

  if (objc_msgSend(MEMORY[0x1E0D7F278], "isRunningOnTV"))
    v0 = CFSTR("missingartwork");
  else
    v0 = CFSTR("defaultCoverImage");
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", v0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)nowPlayingIcon
{
  if (nowPlayingIcon_onceToken != -1)
    dispatch_once(&nowPlayingIcon_onceToken, &__block_literal_global_7);
  return (id)nowPlayingIcon_templateNowPlayingIcon;
}

+ (id)nowPlayingIconPaused
{
  if (nowPlayingIconPaused_onceToken != -1)
    dispatch_once(&nowPlayingIconPaused_onceToken, &__block_literal_global_6);
  return (id)nowPlayingIconPaused_templateNowPlayingIcon;
}

+ (uint64_t)unplayedIcon
{
  return objc_msgSend(a1, "unplayedIconForTheme:", 0);
}

+ (uint64_t)unplayedIconForTheme:()MTAdditions
{
  return objc_msgSend(a1, "unplayedIconForDarkBackground:", objc_msgSend(a3, "isBackgroundDark"));
}

+ (id)unplayedIconForDarkBackground:()MTAdditions
{
  if (unplayedIconForDarkBackground__onceToken != -1)
    dispatch_once(&unplayedIconForDarkBackground__onceToken, &__block_literal_global_9);
  return (id)unplayedIconForDarkBackground__strokedUnplayedIcon;
}

+ (uint64_t)halfPlayedIcon
{
  return objc_msgSend(a1, "halfPlayedIconForTheme:", 0);
}

+ (uint64_t)halfPlayedIconForTheme:()MTAdditions
{
  return objc_msgSend(a1, "halfPlayedIconForDarkBackground:", objc_msgSend(a3, "isBackgroundDark"));
}

+ (id)halfPlayedIconForDarkBackground:()MTAdditions
{
  if (halfPlayedIconForDarkBackground__onceToken != -1)
    dispatch_once(&halfPlayedIconForDarkBackground__onceToken, &__block_literal_global_12_0);
  return (id)halfPlayedIconForDarkBackground__strokedHalfPlayedIcon;
}

+ (id)backCatalogIconForTheme:()MTAdditions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryTextColorForTheme:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "backCatalogIconForTintColor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)backCatalogIconForDarkBackground:()MTAdditions
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", (double)a3, 0.5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "backCatalogIconForTintColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)backCatalogIconForTintColor:()MTAdditions
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (backCatalogIconForTintColor__onceToken != -1)
    dispatch_once(&backCatalogIconForTintColor__onceToken, &__block_literal_global_16_0);
  v4 = (id)backCatalogIconForTintColor__tintedIcons;
  objc_sync_enter(v4);
  objc_msgSend((id)backCatalogIconForTintColor__tintedIcons, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)backCatalogIconForTintColor__tintedIcons;
    objc_msgSend((id)backCatalogIconForTintColor__untintedIcon, "im_flatImageWithColor:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v3);
  }
  objc_sync_exit(v4);

  return v5;
}

+ (id)backCatalogPartiallyPlayedIconForTheme:()MTAdditions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryTextColorForTheme:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "backCatalogPartiallyPlayedIconForTintColor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)backCatalogPartiallyPlayedIconForDarkBackground:()MTAdditions
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", (double)a3, 0.5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "backCatalogPartiallyPlayedIconForTintColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)backCatalogPartiallyPlayedIconForTintColor:()MTAdditions
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (backCatalogPartiallyPlayedIconForTintColor__onceToken != -1)
    dispatch_once(&backCatalogPartiallyPlayedIconForTintColor__onceToken, &__block_literal_global_20_0);
  v4 = (id)backCatalogPartiallyPlayedIconForTintColor__tintedIcons;
  objc_sync_enter(v4);
  objc_msgSend((id)backCatalogPartiallyPlayedIconForTintColor__tintedIcons, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)backCatalogPartiallyPlayedIconForTintColor__tintedIcons;
    objc_msgSend((id)backCatalogPartiallyPlayedIconForTintColor__untintedIcon, "im_flatImageWithColor:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v3);
  }
  objc_sync_exit(v4);

  return v5;
}

+ (uint64_t)playedIcon
{
  return 0;
}

+ (id)multiCheckIcon
{
  if (multiCheckIcon_onceToken != -1)
    dispatch_once(&multiCheckIcon_onceToken, &__block_literal_global_23);
  return (id)multiCheckIcon_templateMultiCheckIcon;
}

+ (id)multiUncheckIcon
{
  if (multiUncheckIcon_onceToken != -1)
    dispatch_once(&multiUncheckIcon_onceToken, &__block_literal_global_26_0);
  return (id)multiUncheckIcon_templateMultiUncheckIcon;
}

+ (id)infoIcon
{
  if (infoIcon_onceToken != -1)
    dispatch_once(&infoIcon_onceToken, &__block_literal_global_29);
  return (id)infoIcon_templateInfoIcon;
}

+ (id)defaultPodcastArtworkWithWidth:()MTAdditions
{
  if (a2 <= 51.0)
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("defaultCoverImageSmall"));
  else
    objc_msgSend(a1, "defaultPodcastArtwork");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)drawBorder:()MTAdditions withContext:
{
  void *v12;
  double v13;
  CGFloat v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  v14 = 1.0 / v13;

  CGContextSetRGBFillColor(a7, 0.0, 0.0, 0.0, 0.18);
  v15.origin.x = a1;
  v15.origin.y = a2;
  v15.size.width = a3;
  v15.size.height = v14;
  CGContextFillRect(a7, v15);
  v16.origin.x = a1;
  v16.origin.y = a2 + v14;
  v16.size.width = v14;
  v16.size.height = a4 + v14 * -2.0;
  CGContextFillRect(a7, v16);
  v17.origin.x = a1 + a3 - v14;
  v17.origin.y = a2 + v14;
  v17.size.width = v14;
  v17.size.height = a4 + v14 * -2.0;
  CGContextFillRect(a7, v17);
  v18.origin.y = a2 + a4 - v14;
  v18.origin.x = a1;
  v18.size.width = a4;
  v18.size.height = v14;
  CGContextFillRect(a7, v18);
}

+ (id)combineImages:()MTAdditions rowCount:size:border:
{
  id v10;
  void *v11;
  double v12;
  CGFloat v13;
  CGContext *CurrentContext;
  CGContext *v15;
  int64_t v16;
  double v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  id v26;
  CGImage *v27;
  void *v28;
  CGSize v30;
  CGRect v31;

  v10 = a5;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = v12;
  v30.width = a2;
  v30.height = a3;
  UIGraphicsBeginImageContextWithOptions(v30, 0, v13);

  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext)
  {
    v15 = CurrentContext;
    CGContextTranslateCTM(CurrentContext, 0.0, a3);
    CGContextScaleCTM(v15, 1.0, -1.0);
    if (objc_msgSend(v10, "count"))
    {
      v16 = 0;
      v17 = a3 / (double)a6 + -2.0;
      do
      {
        objc_msgSend(v10, "objectAtIndex:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v16 + -(int)a6 * (v16 / a6);
        v20 = v17 * (double)(int)(v16 / a6);
        v21 = v17 * (double)v19;
        v22 = (double)(4 * v19);
        if (v21 <= 0.0)
          v22 = -0.0;
        v23 = v21 + v22;
        v24 = (double)(int)(4 * (v16 / a6));
        if (v20 <= 0.0)
          v24 = -0.0;
        v25 = v20 + v24;
        v26 = objc_retainAutorelease(v18);
        v27 = (CGImage *)objc_msgSend(v26, "CGImage");
        v31.origin.x = v23;
        v31.origin.y = v25;
        v31.size.width = v17;
        v31.size.height = v17;
        CGContextDrawImage(v15, v31, v27);
        objc_msgSend(a1, "drawBorder:withContext:", v15, v23, v25, v17, v17);

        ++v16;
      }
      while (objc_msgSend(v10, "count") > (unint64_t)v16);
    }
    UIGraphicsGetImageFromCurrentImageContext();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (CGContext)scaleToSize:()MTAdditions addBorder:
{
  void *v9;
  double v10;
  CGFloat v11;
  CGContext *CurrentContext;
  CGContext *v13;
  CGImage *v14;
  void *v15;
  double v16;
  CGFloat v17;
  CGSize v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v10;
  v19.width = a2;
  v19.height = a3;
  UIGraphicsBeginImageContextWithOptions(v19, 0, v11);

  CurrentContext = UIGraphicsGetCurrentContext();
  v13 = CurrentContext;
  if (CurrentContext)
  {
    CGContextTranslateCTM(CurrentContext, 0.0, a3);
    CGContextScaleCTM(v13, 1.0, -1.0);
    v14 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.width = a2;
    v20.size.height = a3;
    CGContextDrawImage(v13, v20, v14);
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scale");
      v17 = 1.0 / v16;

      CGContextSetRGBFillColor(v13, 0.0, 0.0, 0.0, 0.18);
      v21.origin.x = 0.0;
      v21.origin.y = 0.0;
      v21.size.width = a2;
      v21.size.height = v17;
      CGContextFillRect(v13, v21);
      v22.origin.x = 0.0;
      v22.origin.y = v17;
      v22.size.width = v17;
      v22.size.height = a3 + v17 * -2.0;
      CGContextFillRect(v13, v22);
      v23.origin.x = a2 - v17;
      v23.origin.y = v17;
      v23.size.width = v17;
      v23.size.height = a3 + v17 * -2.0;
      CGContextFillRect(v13, v23);
      v24.origin.y = a3 - v17;
      v24.origin.x = 0.0;
      v24.size.width = a2;
      v24.size.height = v17;
      CGContextFillRect(v13, v24);
    }
    UIGraphicsGetImageFromCurrentImageContext();
    v13 = (CGContext *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  return v13;
}

@end
