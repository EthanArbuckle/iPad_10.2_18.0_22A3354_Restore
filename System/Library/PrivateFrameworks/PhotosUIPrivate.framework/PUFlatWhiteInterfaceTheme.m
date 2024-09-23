@implementation PUFlatWhiteInterfaceTheme

+ (id)errorIconSymbolName
{
  return CFSTR("exclamationmark.circle");
}

+ (id)errorIconSymbolColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
}

- (id)themeImagePrefix
{
  return &stru_1E58AD278;
}

- (id)_themeImageWithBaseName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (_themeImageWithBaseName__onceToken != -1)
    dispatch_once(&_themeImageWithBaseName__onceToken, &__block_literal_global_31704);
  -[PUFlatWhiteInterfaceTheme themeImagePrefix](self, "themeImagePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend((id)_themeImageWithBaseName__nonExistentImages, "containsObject:", v6) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      objc_msgSend((id)_themeImageWithBaseName__nonExistentImages, "addObject:", v6);
  }

  return v7;
}

- (id)_fontDescriptorWithTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  id *v6;
  NSString *v7;
  _BOOL4 IsAccessibilityCategory;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = (id *)MEMORY[0x1E0DC4730];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  if (IsAccessibilityCategory)
  {
    objc_msgSend(*v6, "preferredContentSizeCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)*MEMORY[0x1E0DC48D0];
    if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC4938]) & 1) == 0
      && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v9, (UIContentSizeCategory)v10) == NSOrderedDescending)
    {
      v11 = v10;

      v9 = v11;
    }
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((_DWORD)v4)
    {
      objc_msgSend(v13, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v13, "symbolicTraits") | v4);
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v5, v4, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (NSDictionary)sectionHeaderNotTappableTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4AD0], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSDictionary)textBlockBelowArtTitleTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4B08], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSDictionary)textBlockBelowArtTitleEmphasizedTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4B08], 32770, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSDictionary)textBlockBelowArtSubTitleTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4AA0], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (int64_t)topLevelStatusBarStyle
{
  return 0;
}

- (id)tintColorForBarStyle:(int64_t)a3
{
  return 0;
}

- (UIColor)topLevelNavigationBarButtonTintColor
{
  return 0;
}

- (id)topLevelNavigationBarButtonTitleTextAttributesForState:(unint64_t)a3
{
  return 0;
}

- (id)topLevelNavigationBarDoneButtonTitleTextAttributesForState:(unint64_t)a3
{
  return 0;
}

- (UIOffset)topLevelNavigationBarButtonTitlePositionAdjustmentforBarMetrics:(int64_t)a3
{
  double v3;
  double v4;
  UIOffset result;

  v3 = *MEMORY[0x1E0DC51A8];
  v4 = *(double *)(MEMORY[0x1E0DC51A8] + 8);
  result.vertical = v4;
  result.horizontal = v3;
  return result;
}

- (id)topLevelNavigationBarButtonBackgroundImageForState:(unint64_t)a3 barMetrics:(int64_t)a4
{
  return 0;
}

- (id)topLevelNavigationBarBackButtonBackgroundImageForState:(unint64_t)a3 barMetrics:(int64_t)a4
{
  return 0;
}

- (id)topLevelNavigationBarDoneButtonBackgroundImageForState:(unint64_t)a3 barMetrics:(int64_t)a4
{
  return 0;
}

- (UIColor)photoCollectionViewBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

- (int)photoCollectionViewBackgroundColorValue
{
  CGColorSpaceRef v3;
  CGColorSpace *v4;
  CGColorRenderingIntent RenderingIntent;
  id v6;
  CGColor *CopyByMatchingToColorSpace;
  float64x2_t *Components;
  int32x2_t v15;

  v3 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  if (!v3)
    return 255;
  v4 = v3;
  RenderingIntent = CGColorSpaceGetRenderingIntent();
  -[PUFlatWhiteInterfaceTheme photoCollectionViewBackgroundColor](self, "photoCollectionViewBackgroundColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v4, RenderingIntent, (CGColorRef)objc_msgSend(v6, "CGColor"), 0);

  CGColorSpaceRelease(v4);
  if (!CopyByMatchingToColorSpace)
    return 255;
  if (CGColorGetNumberOfComponents(CopyByMatchingToColorSpace) <= 2)
  {
    CGColorRelease(CopyByMatchingToColorSpace);
    return 255;
  }
  Components = (float64x2_t *)CGColorGetComponents(CopyByMatchingToColorSpace);
  CGColorRelease(CopyByMatchingToColorSpace);
  __asm { FMOV            V1.2D, #31.0 }
  v15 = (int32x2_t)vshl_u32((uint32x2_t)vmovn_s64(vcvtq_s64_f64(vmulq_f64(*Components, _Q1))), (uint32x2_t)0x50000000ALL);
  return vadd_s32(vdup_lane_s32(v15, 1), v15).u32[0] + (int)(Components[1].f64[0] * 31.0);
}

- (id)photoCollectionCloudQuotaBannerFont
{
  void *v2;
  void *v3;

  -[PUFlatWhiteInterfaceTheme _fontDescriptorWithTextStyle:addingSymbolicTraits:](self, "_fontDescriptorWithTextStyle:addingSymbolicTraits:", *MEMORY[0x1E0DC4AB8], 0x8000);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)photoCollectionCloudQuotaBannerBackgroundColorHighlighted:(BOOL)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.674509823, 0.674509823, 0.674509823, 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)photoCollectionCloudQuotaBannerTextAlignment
{
  return 1;
}

- (id)photoCollectionCloudQuotaBannerTextColorHighlighted:(BOOL)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDirectionalEdgeInsets)photoCollectionCloudQuotaBannerTextMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 0.0;
  v3 = 8.0;
  v4 = 0.0;
  v5 = 8.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (id)photoCollectionCloudQuotaBannerLinkTextFont
{
  void *v2;
  void *v3;

  -[PUFlatWhiteInterfaceTheme _fontDescriptorWithTextStyle:addingSymbolicTraits:](self, "_fontDescriptorWithTextStyle:addingSymbolicTraits:", *MEMORY[0x1E0DC4AB8], 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)photoCollectionCloudQuotaBannerLinkTextColorHighlighted:(BOOL)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)photoCollectionToolbarTextTitleSpacerWidth
{
  return 20.0;
}

- (double)photoCollectionToolbarIconToTextSpacerWidth
{
  return 31.0;
}

- (UIFont)albumListTitleLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B08], 0x8000, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)configureAlbumListTitleLabel:(id)a3 asOpaque:(BOOL)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "labelColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6);

}

- (void)configureAlbumListTitleTextField:(id)a3 asOpaque:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v5);

  if (a4)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  objc_msgSend(v7, "setReturnKeyType:", 9);
}

- (UIFont)albumListSubtitleLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B08], 0x8000, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)configureAlbumListSubtitleLabel:(id)a3 asOpaque:(BOOL)a4
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "_setTextColorFollowsTintColor:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

}

- (UIFont)albumListSectionTitleLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AD0], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)configureAlbumListSectionTitleLabel:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)configureAlbumListStackViewPhonePhotoDecoration:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a3;
  objc_msgSend(v3, "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderColor:", v5);

  PLPhysicalScreenScale();
  objc_msgSend(v4, "setBorderWidth:", 1.0 / v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForegroundColor:", v7);

}

- (double)albumListDisabledAlbumStackViewAlpha
{
  return 0.5;
}

- (double)albumListDisabledAlbumTitleAlpha
{
  return 0.25;
}

- (UIColor)folderCellBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
}

- (UIColor)placeholderCellBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
}

- (UIColor)badgeOverThumbnailColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (UIColor)albumBadgeInTitleColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
}

- (UIColor)albumCornersBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

- (double)padAlbumCornerRadius
{
  return 4.0;
}

- (double)phoneAlbumCornerRadius
{
  return 4.0;
}

- (double)bannerHeight
{
  return 67.0;
}

- (UIColor)bannerBackgroundColor
{
  return 0;
}

- (void)configureBannerStackView:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setStyle:", 2);
  objc_msgSend(v3, "setStackSize:", 48.0, 48.0);
  objc_msgSend(v3, "setStackOffset:", 0.0, -1.0);
  objc_msgSend(v3, "setStackPerspectiveInsets:", 2.0, 2.0, 2.0, 2.0);
  objc_msgSend(v3, "setStackPerspectiveOffset:", 0.0, -4.0);

}

- (void)configureBannerLabel:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a3;
  objc_msgSend(v3, "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4AD8]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v6);

}

- (void)configureMapViewAnnotationCountLabel:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0DC1350];
  v4 = a3;
  objc_msgSend(v3, "systemFontOfSize:", 16.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v6);

  objc_msgSend(v4, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v7);

}

- (int64_t)photoBrowserBarStyle
{
  return 0;
}

- (UIColor)photoBrowserTitleViewTextColor
{
  return 0;
}

- (UIColor)photoBrowserSpotlightThemeColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIColor)photoBrowserTitleViewTappableTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

- (UIColor)photoBrowserChromeVisibleBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

- (UIColor)photoBrowserChromeHiddenBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

- (double)videoPaletteSideMargin
{
  return 8.0;
}

- (double)videoPaletteBottomMargin
{
  return 4.0;
}

- (id)_commentsFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
}

- (NSDictionary)contentCommentsHiddenButtonTextAttributes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = *MEMORY[0x1E0DC1138];
  -[PUFlatWhiteInterfaceTheme _commentsFont](self, "_commentsFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E0DC1140];
  -[PUFlatWhiteInterfaceTheme contentCommentsHiddenButtonImageColor](self, "contentCommentsHiddenButtonImageColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (UIColor)contentCommentsHiddenButtonImageColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.400000006, 1.0);
}

- (NSDictionary)contentCommentsShownButtonTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  -[PUFlatWhiteInterfaceTheme _commentsFont](self, "_commentsFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (UIEdgeInsets)contentCommentsButtonImageInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 5.0;
  v4 = 8.0;
  v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (NSDictionary)toolbarCommentsHiddenButtonTextAttributes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = *MEMORY[0x1E0DC1138];
  -[PUFlatWhiteInterfaceTheme _commentsFont](self, "_commentsFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E0DC1140];
  -[PUFlatWhiteInterfaceTheme contentCommentsShownButtonImageColor](self, "contentCommentsShownButtonImageColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (UIEdgeInsets)commentsButtonTextInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 4.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)commentsButtonStringForCount:(int64_t)a3
{
  __CFString *v3;

  if (a3 < 1)
  {
    v3 = &stru_1E58AD278;
  }
  else
  {
    if ((unint64_t)a3 > 0x63)
      PXLocalizedString();
    else
      PXLocalizedStringFromInteger();
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (UIColor)toolbarAirPlayButtonColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_systemInteractionTintColor");
}

- (UIFont)photoBrowserPhotoPrimaryTitleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
}

- (UIFont)photoBrowserPhotoSubtitleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
}

- (UIFont)photoBrowserTimeTitleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
}

- (void)configureProgressIndicatorMessageLabel:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0DC1350];
  v4 = *MEMORY[0x1E0DC4B10];
  v5 = a3;
  objc_msgSend(v3, "px_defaultFontForTextStyle:withSymbolicTraits:", v4, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v5, "_setTextColorFollowsTintColor:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithAlphaComponent:", 0.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v7);

}

- (void)configureCompactProgressIndicatorMessageLabel:(id)a3
{
  void *v3;
  double v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0DC1350];
  v4 = *MEMORY[0x1E0DC1448];
  v5 = a3;
  objc_msgSend(v3, "systemFontOfSize:weight:", 15.0, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v7);
  objc_msgSend(v5, "_setTextColorFollowsTintColor:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

}

- (UIColor)playheadColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (UIColor)playheadOutlineColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
}

- (UIColor)playheadBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

- (UIColor)videoScrubberTileBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 0.5);
}

- (UIColor)playbackTimeLabelBackgroundColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)scrubberPlaceholderColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.930000007, 1.0);
}

- (UIFont)playbackTimeLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pu_fontWithMonospacedNumbers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)videoSearchResultLabelFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4AA0], *MEMORY[0x1E0DC1448]);
}

- (UIImage)compactLoadErrorIcon
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PUFlatWhiteInterfaceTheme_compactLoadErrorIcon__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  if (compactLoadErrorIcon_onceToken != -1)
    dispatch_once(&compactLoadErrorIcon_onceToken, block);
  return (UIImage *)(id)compactLoadErrorIcon_icon;
}

- (UIImage)regularLoadErrorIcon
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PUFlatWhiteInterfaceTheme_regularLoadErrorIcon__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  if (regularLoadErrorIcon_onceToken != -1)
    dispatch_once(&regularLoadErrorIcon_onceToken, block);
  return (UIImage *)(id)regularLoadErrorIcon_icon;
}

- (UIImage)airPlayVideoPlaceholderIcon
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 3, 100.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("tv"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (UIColor)airPlayVideoPlaceholderIconTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

- (UIColor)airPlayVideoPlaceholderBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

- (UIColor)airPlayVideoPlaceholderTitleTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIColor)airPlayVideoPlaceholderMessageTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (UIFont)airPlayVideoPlaceholderTitleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
}

- (UIFont)airPlayVideoPlaceholderMessageFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
}

- (UIColor)airPlayControllerBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

- (UIColor)photoEditingSolidBackgroundViewColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)photoEditingBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

- (UIColor)photoEditingPopoverBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
}

- (UIColor)photoEditingToolbarSecondaryButtonColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIColor)photoEditingToolButtonColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
}

- (id)photoEditingHighlightedButtonColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "px_dynamicHighlightColor");
}

- (UIColor)photoEditingToolbarDestructiveButtonColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
}

- (UIFont)photoEditingToolbarButtonNormalFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

- (UIFont)photoEditingToolbarButtonCompactFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 10.0, *MEMORY[0x1E0DC1438]);
}

- (UIFont)photoEditingAdjustmentsModeLabelFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 12.0);
}

- (UIFont)photoEditingAdjustmentsModePickerFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

- (UIFont)photoEditingAdjustmentsModePickerValueFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

- (UIColor)photoEditingAdjustmentsModePickerValueColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
}

- (UIColor)photoEditingAdjustmentsToolBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

- (UIColor)photoEditingAdjustmentsBarBackgroundColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.899999976);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)photoEditingAdjustmentsBarPlayheadColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.200000003, 0.200000003, 1.0);
}

- (UIColor)photoEditingAdjustmentsModeLabelColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
}

- (UIColor)photoEditingAdjustmentsBarMainColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
}

- (UIColor)photoEditingAdjustmentsBarHighlightColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
}

- (UIColor)photoEditingAdjustmentsBarDisabledColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.800000012);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)photoEditingAdjustmentsBarOriginalPositionMarkerColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

- (UIColor)photoEditingAdjustmentsBarCurrentPositionMarkerColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIColor)photoEditingAdjustmentsBarCurrentPositionDisabledMarkerColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
}

- (UIColor)photoEditingAdjustmentsBarSuggestedMarkerColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
}

- (UIColor)photoEditingTooltipColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.629999995, 1.0);
}

- (UIFont)photoEditingTooltipFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
}

- (UIColor)photoEditingOverlayBadgeColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

- (UIColor)photoEditingOverlayBadgeBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIFont)photoEditingOverlayBadgeFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

- (UIColor)photoEditingInactiveFilterTitleColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.627, 0.624, 0.643, 1.0);
}

- (UIColor)photoEditingActiveFilterTitleColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_systemInteractionTintColor");
}

- (UIFont)photoEditingFilterTitleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
}

- (UIColor)photoEditingToolbarButtonColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (UIColor)photoEditingCropTiltWheelColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.627, 0.624, 0.643, 1.0);
}

- (UIFont)photoEditingCropToggleButtonFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
}

- (UIColor)photoEditingCropToggleButtonColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_systemInteractionTintColor");
}

- (UIColor)photoEditingIrisDisabledColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIColor)photoEditingKeyPhotoSelectionNormalColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIColor)photoEditingDepthButtonDisabledColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (id)photoEditingDepthBadgeDisabledColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)photoEditingDepthBadgeEnabledTextColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.600000024);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)photoEditingDepthBadgeDisabledTextColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIColor)photoEditingToolbarLightGradientStartColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.400000006);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)photoEditingToolbarLightGradientEndColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)photoEditingToolbarUltralightGradientStartColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.200000003);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)photoEditingToolbarUltralightGradientEndColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)photoEditingToolbarDarkGradientStartColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.600000024);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)photoEditingToolbarDarkGradientEndColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)photoEditingToolbarUnderlineColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.200000003);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)photoEditingTopToolbarToolLabelButtonColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (UIColor)photoEditingBadgeViewFillColor
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustmentLabelPlatterAlpha");
  objc_msgSend(v2, "colorWithAlphaComponent:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (UIColor)photoEditingBadgeViewContentColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIColor)photoEditingAdjustmentControlDefaultColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIColor)photoEditingCircularIndicatorBackgroundStrokeColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)photoEditingCircularIndicatorProgressStrokeColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (UIColor)photoEditingEffectCellHighlightBackgroundColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)photoEditingEffectSelectionLoupeColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIColor)photoEditingTrimPlayheadLineColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIColor)photoEditingTimecodeBackgroundColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)photoEditingTimecodeLabelColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIColor)photoEditingTrimControllerBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (UIColor)photoEditingCropHandleColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIColor)photoEditingCropInnerLineColor
{
  if (photoEditingCropInnerLineColor_onceToken != -1)
    dispatch_once(&photoEditingCropInnerLineColor_onceToken, &__block_literal_global_144);
  return (UIColor *)(id)photoEditingCropInnerLineColor_color;
}

- (UIColor)photoEditingNotchButtonBackgroundColor
{
  if (photoEditingNotchButtonBackgroundColor_onceToken != -1)
    dispatch_once(&photoEditingNotchButtonBackgroundColor_onceToken, &__block_literal_global_147_31696);
  return (UIColor *)(id)photoEditingNotchButtonBackgroundColor_color;
}

- (UIFont)topToolbarToolLabelFont
{
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontSize");
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:");
}

- (UIFont)topToolbarToolButtonFont
{
  void *v2;
  double v3;

  v2 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontSize");
  return (UIFont *)objc_msgSend(v2, "systemFontOfSize:", v3 + 1.0);
}

- (double)editToolbarButtonSize
{
  return 23.0;
}

- (double)topToolbarToolButtonGlyphSize
{
  return 21.0;
}

- (UIColor)videoEditingToolbarToolButtonColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (UIColor)cloudFeedBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

- (UIColor)cloudFeedSeparatorColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
}

- (double)cloudFeedSeparatorHeight
{
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  return round(*(double *)&PUMainScreenScale_screenScale * 0.5) / *(double *)&PUMainScreenScale_screenScale;
}

- (NSDictionary)cloudFeedWhiteDefaultTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E08];
  -[PUFlatWhiteInterfaceTheme textBlockBelowArtTitleTextAttributes](self, "textBlockBelowArtTitleTextAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  return (NSDictionary *)v4;
}

- (NSDictionary)cloudFeedWhiteEmphasizedTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E08];
  -[PUFlatWhiteInterfaceTheme textBlockBelowArtTitleEmphasizedTextAttributes](self, "textBlockBelowArtTitleEmphasizedTextAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  return (NSDictionary *)v4;
}

- (NSDictionary)cloudFeedLargerDefaultTextAttributes
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)cloudFeedLargerEmphasizedTextAttributes
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)cloudFeedInvitationTitleTextAttributes
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)cloudFeedInvitationSubtitleTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)configureCloudFeedInvitationReplyButton:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

}

- (NSDictionary)cloudFeedInteractionTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "_systemInteractionTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSDictionary)cloudFeedInteractionLargerTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "_systemInteractionTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (id)attributedStringForCloudFeedGroupHeaderWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUFlatWhiteInterfaceTheme sectionHeaderNotTappableTextAttributes](self, "sectionHeaderNotTappableTextAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v5);

  return v6;
}

- (void)configureCloudFeedGroupHeaderTextCell:(id)a3 contentInsets:(UIEdgeInsets)a4 withText:(id)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v11;
  void *v12;
  NSString *v13;
  id v14;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v11 = a3;
  -[PUFlatWhiteInterfaceTheme attributedStringForCloudFeedGroupHeaderWithText:](self, "attributedStringForCloudFeedGroupHeaderWithText:", a5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredContentSizeCategory");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setNumberOfTextLines:", !UIContentSizeCategoryIsAccessibilityCategory(v13));
  objc_msgSend(v11, "setAttributedText:", v14);
  objc_msgSend(v11, "setContentInsets:", top, left, bottom, right);

}

- (void)configureCloudFeedSectionHeaderTextCell:(id)a3 contentInsets:(UIEdgeInsets)a4 descriptionAttributedText:(id)a5 detailAttributedText:(id)a6
{
  double right;
  double left;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  NSString *v28;
  _BOOL8 v29;
  id v30;

  right = a4.right;
  left = a4.left;
  v30 = a5;
  v10 = a6;
  v11 = (void *)MEMORY[0x1E0DC1350];
  v12 = a3;
  objc_msgSend(v11, "pu_scaledValue:usingFontOfAttributedString:", v30, 20.0);
  v14 = v13;
  objc_msgSend(MEMORY[0x1E0DC1350], "pu_scaledValue:usingFontOfAttributedString:", v10, 20.0);
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0DC1350], "pu_scaledValue:usingFontOfAttributedString:", v30, 16.0);
  v18 = v17;
  v19 = objc_msgSend(v30, "length");
  v20 = (_QWORD *)MEMORY[0x1E0DC1138];
  if (v19)
  {
    objc_msgSend(v30, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(v10, "attribute:atIndex:effectiveRange:", *v20, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v21, "ascender");
  v24 = v14 - v23;
  objc_msgSend(v22, "ascender");
  v26 = v16 - v25;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "preferredContentSizeCategory");
  v28 = (NSString *)objc_claimAutoreleasedReturnValue();

  v29 = !UIContentSizeCategoryIsAccessibilityCategory(v28);
  objc_msgSend(v12, "setContentInsets:", v24, left, v18, right);
  objc_msgSend(v12, "setAttributedText:", v30);
  objc_msgSend(v12, "setNumberOfTextLines:", v29);
  objc_msgSend(v12, "setAttributedDetailText:", v10);
  objc_msgSend(v12, "setNumberOfDetailTextLines:", v29);
  objc_msgSend(v12, "setTextDetailTextSpacing:", v26);

}

- (UIImage)cloudFeedSectionHeaderBackgroundImage
{
  if (cloudFeedSectionHeaderBackgroundImage_onceToken != -1)
    dispatch_once(&cloudFeedSectionHeaderBackgroundImage_onceToken, &__block_literal_global_152);
  return (UIImage *)(id)cloudFeedSectionHeaderBackgroundImage_image;
}

- (void)configureCloudFeedStackView:(id)a3 withStackSize:(CGSize)a4
{
  double height;
  double width;
  uint64_t v6;
  id v7;
  id v8;

  height = a4.height;
  width = a4.width;
  v6 = configureCloudFeedStackView_withStackSize__onceToken;
  v7 = a3;
  v8 = v7;
  if (v6 != -1)
  {
    dispatch_once(&configureCloudFeedStackView_withStackSize__onceToken, &__block_literal_global_155);
    v7 = v8;
  }
  objc_msgSend(v7, "setStackSize:", width, height);
  objc_msgSend(v8, "setStackPerspectiveOffset:", -5.0, 0.0);
  objc_msgSend(v8, "setStackPerspectiveInsets:", 2.0, 2.0, 2.0, 2.0);
  objc_msgSend(v8, "setPhotoDecoration:", configureCloudFeedStackView_withStackSize__photoDecoration);

}

- (id)createCloudFeedCommentButton
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v13;

  if (createCloudFeedCommentButton_onceToken != -1)
    dispatch_once(&createCloudFeedCommentButton_onceToken, &__block_literal_global_157);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:forState:", createCloudFeedCommentButton_commentButtonImage, 0);
  objc_msgSend(v3, "setShowsTouchWhenHighlighted:", 1);
  objc_msgSend(v3, "sizeToFit");
  -[PUFlatWhiteInterfaceTheme commentsButtonTextInset](self, "commentsButtonTextInset");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "frame");
  objc_msgSend(v3, "setTitleEdgeInsets:", v5, v7 - CGRectGetWidth(v13), v9, v11);
  return v3;
}

- (void)configureCloudFeedCommentButton:(id)a3 withCount:(int64_t)a4
{
  uint64_t v6;
  id v7;
  id v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  id v12;
  uint64_t block;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  PUFlatWhiteInterfaceTheme *v17;

  block = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __71__PUFlatWhiteInterfaceTheme_configureCloudFeedCommentButton_withCount___block_invoke;
  v16 = &unk_1E58ABD10;
  v17 = self;
  v6 = configureCloudFeedCommentButton_withCount__onceToken;
  v7 = a3;
  if (v6 != -1)
    dispatch_once(&configureCloudFeedCommentButton_withCount__onceToken, &block);
  -[PUFlatWhiteInterfaceTheme commentsButtonStringForCount:](self, "commentsButtonStringForCount:", a4);
  v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v11)
    v9 = v11;
  else
    v9 = &stru_1E58AD278;
  v10 = (void *)objc_msgSend(v8, "initWithString:attributes:", v9, configureCloudFeedCommentButton_withCount__commentCountAttributes, v11, block, v14, v15, v16, v17);
  objc_msgSend(v7, "setAttributedTitle:forState:", v10, 0);

}

- (UIFont)sharedAlbumCommentCardUserFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 17.0);
}

- (UIFont)sharedAlbumCommentCardTitleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

- (UIFont)sharedAlbumCommentCardTextFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledFontForFont:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v4;
}

- (UIFont)sharedAlbumCommentCardButtonFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 20.0);
}

- (UIFont)sharedAlbumCommentCardAlbumTitleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
}

- (void)configureEditPluginNavigationController:(id)a3
{
  id v3;

  objc_msgSend(a3, "navigationBar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBarStyle:", 1);

}

- (void)configureEditPluginListCellLabel:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a3;
  objc_msgSend(v3, "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v6);

}

- (void)configureEditPluginUserDefaultsTableView:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0DC3F10];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "setTableFooterView:", v5);

}

- (void)configureEditPluginUserDefaultsCell:(id)a3 withIcon:(id)a4 title:(id)a5
{
  __CFString *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v8);

  v11 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v7)
    v12 = v7;
  else
    v12 = &stru_1E58AD278;
  v20 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithString:attributes:", v12, v14);

  objc_msgSend(v9, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAttributedText:", v15);

  objc_msgSend(v9, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v18);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v19);

}

- (UIFont)searchRecentLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AD0], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIColor)searchRecentLabelTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIFont)searchTitleLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)searchItalicTitleLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 32769, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (id)searchTitleLabelHighlightedFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PUFlatWhiteInterfaceTheme searchTitleLabelFont](self, "searchTitleLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 32770);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  objc_msgSend(v4, "fontWithDescriptor:size:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)searchTitleTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (id)searchTitleDimmedTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (void)configureSearchTitleLabel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  double v8;
  id v9;

  v9 = a3;
  -[PUFlatWhiteInterfaceTheme searchTitleLabelFont](self, "searchTitleLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v4);

  objc_msgSend(v9, "_setTextColorFollowsTintColor:", 1);
  -[PUFlatWhiteInterfaceTheme searchTitleTextColor](self, "searchTitleTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(v7))
  {
    objc_msgSend(v9, "setNumberOfLines:", 0);
    LODWORD(v8) = 1.0;
    objc_msgSend(v9, "_setHyphenationFactor:", v8);
  }

}

- (UIFont)searchSubtitleLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AB8], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIColor)searchSubtitleTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (void)configureSearchSubtitleLabel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  double v8;
  id v9;

  v9 = a3;
  -[PUFlatWhiteInterfaceTheme searchSubtitleLabelFont](self, "searchSubtitleLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v4);

  objc_msgSend(v9, "_setTextColorFollowsTintColor:", 1);
  -[PUFlatWhiteInterfaceTheme searchSubtitleTextColor](self, "searchSubtitleTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(v7))
  {
    objc_msgSend(v9, "setNumberOfLines:", 0);
    LODWORD(v8) = 1.0;
    objc_msgSend(v9, "_setHyphenationFactor:", v8);
  }

}

- (UIFont)searchResultCountLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIColor)searchResultCountTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (void)configureSearchResultCountLabel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  double v8;
  id v9;

  v9 = a3;
  -[PUFlatWhiteInterfaceTheme searchResultCountLabelFont](self, "searchResultCountLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v4);

  objc_msgSend(v9, "_setTextColorFollowsTintColor:", 1);
  -[PUFlatWhiteInterfaceTheme searchResultCountTextColor](self, "searchResultCountTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(v7))
  {
    objc_msgSend(v9, "setNumberOfLines:", 0);
    LODWORD(v8) = 1.0;
    objc_msgSend(v9, "_setHyphenationFactor:", v8);
  }

}

- (double)searchSingleTitleTopBaselineDistance
{
  return 46.0;
}

- (double)searchSingleTitleBottomBaselineDistance
{
  return 34.0;
}

- (double)searchTitleTopBaselineDistance
{
  return 37.0;
}

- (double)searchTitleSubtitleBaselineDistance
{
  return 20.0;
}

- (double)searchSubtitleBottomBaselineDistance
{
  return 23.0;
}

- (id)searchDefaultAttributes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = *MEMORY[0x1E0DC1138];
  -[PUFlatWhiteInterfaceTheme searchTitleLabelFont](self, "searchTitleLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E0DC1140];
  -[PUFlatWhiteInterfaceTheme searchTitleTextColor](self, "searchTitleTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)searchItalicTitleAttributes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = *MEMORY[0x1E0DC1138];
  -[PUFlatWhiteInterfaceTheme searchItalicTitleLabelFont](self, "searchItalicTitleLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E0DC1140];
  -[PUFlatWhiteInterfaceTheme searchTitleTextColor](self, "searchTitleTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)searchDimmedAttributes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = *MEMORY[0x1E0DC1138];
  -[PUFlatWhiteInterfaceTheme searchTitleLabelFont](self, "searchTitleLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E0DC1140];
  -[PUFlatWhiteInterfaceTheme searchTitleDimmedTextColor](self, "searchTitleDimmedTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __71__PUFlatWhiteInterfaceTheme_configureCloudFeedCommentButton_withCount___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(*(id *)(a1 + 32), "_commentsFont");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  v5[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)configureCloudFeedCommentButton_withCount__commentCountAttributes;
  configureCloudFeedCommentButton_withCount__commentCountAttributes = v3;

}

void __57__PUFlatWhiteInterfaceTheme_createCloudFeedCommentButton__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("bubble.left"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithSymbolConfiguration:", v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pu_tintedImageWithColor:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)createCloudFeedCommentButton_commentButtonImage;
  createCloudFeedCommentButton_commentButtonImage = v3;

}

void __71__PUFlatWhiteInterfaceTheme_configureCloudFeedStackView_withStackSize___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PUPhotoDecoration defaultDecoration](PUPhotoDecoration, "defaultDecoration");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)configureCloudFeedStackView_withStackSize__photoDecoration;
  configureCloudFeedStackView_withStackSize__photoDecoration = v0;

}

void __66__PUFlatWhiteInterfaceTheme_cloudFeedSectionHeaderBackgroundImage__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PUFeedBottomGradient"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cloudFeedSectionHeaderBackgroundImage_image;
  cloudFeedSectionHeaderBackgroundImage_image = v0;

}

void __67__PUFlatWhiteInterfaceTheme_photoEditingNotchButtonBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_148);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)photoEditingNotchButtonBackgroundColor_color;
  photoEditingNotchButtonBackgroundColor_color = v0;

}

id __67__PUFlatWhiteInterfaceTheme_photoEditingNotchButtonBackgroundColor__block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __59__PUFlatWhiteInterfaceTheme_photoEditingCropInnerLineColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_146);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)photoEditingCropInnerLineColor_color;
  photoEditingCropInnerLineColor_color = v0;

}

id __59__PUFlatWhiteInterfaceTheme_photoEditingCropInnerLineColor__block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __49__PUFlatWhiteInterfaceTheme_regularLoadErrorIcon__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 28.0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend((id)objc_opt_class(), "errorIconSymbolName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "systemImageNamed:withConfiguration:", v1, v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "errorIconSymbolColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)regularLoadErrorIcon_icon;
  regularLoadErrorIcon_icon = v4;

}

void __49__PUFlatWhiteInterfaceTheme_compactLoadErrorIcon__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 18.6);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend((id)objc_opt_class(), "errorIconSymbolName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "systemImageNamed:withConfiguration:", v1, v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "errorIconSymbolColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)compactLoadErrorIcon_icon;
  compactLoadErrorIcon_icon = v4;

}

void __53__PUFlatWhiteInterfaceTheme__themeImageWithBaseName___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 10);
  v1 = (void *)_themeImageWithBaseName__nonExistentImages;
  _themeImageWithBaseName__nonExistentImages = v0;

}

@end
