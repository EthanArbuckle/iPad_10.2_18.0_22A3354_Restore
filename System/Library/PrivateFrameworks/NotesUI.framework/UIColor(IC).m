@implementation UIColor(IC)

+ (id)preferredDefaultFontColor
{
  if (preferredDefaultFontColor_onceToken != -1)
    dispatch_once(&preferredDefaultFontColor_onceToken, &__block_literal_global_24_0);
  return (id)preferredDefaultFontColor_sDefaultFontColor;
}

+ (id)ICTintColor
{
  void *v0;

  if (ICTintColor_onceToken[0] != -1)
    dispatch_once(ICTintColor_onceToken, &__block_literal_global_27);
  v0 = (void *)ICTintColor_color;
  if (!ICTintColor_color)
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((color) != nil)", "+[UIColor(IC) ICTintColor]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "color");
    v0 = (void *)ICTintColor_color;
  }
  return v0;
}

+ (id)ICBackgroundColor
{
  if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ICGroupedBackgroundColor
{
  if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ic_resolvedColorForNoteEditor
{
  id v2;

  if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) != 0)
  {
    objc_msgSend(a1, "ic_resolvedColorForLightUserInterfaceStyle");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

+ (uint64_t)ic_systemGray5Color
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
}

+ (id)ic_noteEditorSecondaryLabelColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ic_resolvedColorForNoteEditor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)ic_noteEditorBackgroundColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ic_resolvedColorForNoteEditor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)ICNoteEditorToolbarColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
}

+ (id)ICDarkenedTintColor
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "ICTintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_darkerAccessibilityColorForColor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)ic_darkerAccessibilityColorForColor:()IC
{
  id v3;
  id v4;
  CGColor *ConvertedToSRGB;
  void *v6;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = a3;
  v10 = 0.0;
  v11 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  if ((objc_msgSend(v3, "getHue:saturation:brightness:alpha:", &v11, &v10, &v9, &v8) & 1) == 0)
  {
    v4 = objc_retainAutorelease(v3);
    ConvertedToSRGB = TSUCGColorCreateConvertedToSRGB(objc_msgSend(v4, "CGColor"));
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", ConvertedToSRGB);
    v3 = (id)objc_claimAutoreleasedReturnValue();

    CGColorRelease(ConvertedToSRGB);
    if ((objc_msgSend(v3, "getHue:saturation:brightness:alpha:", &v11, &v10, &v9, &v8) & 1) == 0)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[UIColor(IC) ic_darkerAccessibilityColorForColor:]", 1, 0, CFSTR("Trying to darken color, but even converting to SRGB failed."));
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v11, v10, v9 * 0.8, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)ICPasswordProtectActionColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.78, 0.78, 0.8, 1.0);
}

+ (uint64_t)ICPinActionColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.58, 0.0, 1.0);
}

+ (uint64_t)ICExtractedDocumentViewControllerBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.819607843, 1.0);
}

+ (id)ICTintedSelectionColor
{
  id v1;
  void *v2;
  id v3;

  v1 = (id)objc_msgSend(a1, "ICTintColor");
  if (sUsingCustomTintColor == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "ICTintColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "colorWithAlphaComponent:", 0.2);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (ICTintedSelectionColor_onceToken != -1)
      dispatch_once(&ICTintedSelectionColor_onceToken, &__block_literal_global_29);
    v3 = (id)ICTintedSelectionColor_sTintedSelectionColor;
  }
  return v3;
}

+ (uint64_t)ICMoveActionBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.471, 0.479, 0.999, 1.0);
}

+ (uint64_t)ICShareActionBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.196, 0.576, 0.988, 1.0);
}

+ (uint64_t)ICDefaultFindBarColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.82, 0.83, 0.85, 1.0);
}

+ (uint64_t)ICListTitleTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:", CFSTR("list_title_text_color"));
}

+ (uint64_t)ic_dynamicWhiteBlackColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:", CFSTR("dynamic_white_black_color"));
}

+ (id)ic_attachmentBackgroundColorForTraitCollection:()IC
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "ic_attachmentBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resolvedColorWithTraitCollection:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((traitCollection) != nil)", "+[UIColor(IC) ic_attachmentBackgroundColorForTraitCollection:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "traitCollection");
    v6 = 0;
  }

  return v6;
}

+ (id)ic_tintColorWithTraitCollection:()IC
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a3;
  objc_msgSend(v3, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resolvedColorWithTraitCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)ic_resolvedColor
{
  uint64_t v1;

  v1 = objc_msgSend(objc_retainAutorelease(a1), "CGColor");
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v1);
}

- (id)ic_resolvedColorForLightUserInterfaceStyle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resolvedColorWithTraitCollection:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)ic_colorWith256Red:()IC green:blue:alpha:
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", a1 / 255.0, a2 / 255.0, a3 / 255.0, a4 / 255.0);
}

+ (uint64_t)ic_colorWith256Red:()IC green:blue:unitAlpha:
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", a1 / 255.0, a2 / 255.0, a3 / 255.0);
}

+ (id)ICSelectedAttachmentBrickHighlightColor
{
  if (ICSelectedAttachmentBrickHighlightColor_onceToken != -1)
    dispatch_once(&ICSelectedAttachmentBrickHighlightColor_onceToken, &__block_literal_global_38);
  return (id)ICSelectedAttachmentBrickHighlightColor_color;
}

+ (id)ICGrayTodoButtonColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "tertiaryLabelColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_resolvedColorForNoteEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)ICControlAccentColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
}

+ (uint64_t)ICListStatusIndicatorColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "ic_colorWith256Red:green:blue:alpha:", 234.0, 187.0, 0.0, 255.0);
}

+ (uint64_t)ICFindInNoteHighlightColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.917647059, 0.733333333, 0.0, 0.3);
}

+ (uint64_t)ICLearnMoreButtonUnpressedColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "ic_colorWith256Red:green:blue:alpha:", 0.0, 122.0, 255.0, 255.0);
}

+ (id)ICLearnMoreButtonPressedColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ICLearnMoreButtonUnpressedColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)ICLearnMoreLinkColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled())
    objc_msgSend(MEMORY[0x1E0DC3658], "ICDarkenedTintColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "ICTintColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ICHashtagUnconfirmedColor
{
  if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ICHashtagColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled())
    objc_msgSend(MEMORY[0x1E0DC3658], "ICDarkenedTintColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "ICTintColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ICLinkAcceleratorUnconfirmedColor
{
  if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ICMentionUnconfirmedColor
{
  if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ICUnknownInlineAttachmentTextColor
{
  if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ic_imageFromColor:()IC size:
{
  id v7;
  CGContext *CurrentContext;
  id v9;
  CGColor *v10;
  void *v11;
  CGSize v13;
  CGRect v14;

  v7 = a5;
  v13.width = a1;
  v13.height = a2;
  UIGraphicsBeginImageContext(v13);
  CurrentContext = UIGraphicsGetCurrentContext();
  v9 = objc_retainAutorelease(v7);
  v10 = (CGColor *)objc_msgSend(v9, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v10);
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = a1;
  v14.size.height = a2;
  CGContextFillRect(CurrentContext, v14);
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v11;
}

+ (id)ic_attachmentBackgroundColor
{
  if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "ic_dynamicWhiteBlackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "ICBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)ICMonostyledBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
}

+ (uint64_t)ICMonostyledBorderColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
}

+ (id)ICBlockQuoteBackgroundColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ic_resolvedColorForNoteEditor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)ic_lightAttachmentBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (id)ic_noteEditorLabelColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ic_resolvedColorForNoteEditor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)ic_noteEditorPreviewColorForceLightContent:()IC
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_resolvedColorForNoteEditor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)ic_notePreviewBackgroundLightContent:()IC
{
  if ((a3 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ic_colorFromString:()IC
{
  uint64_t v0;
  CGColor *v1;
  void *v2;

  v0 = ICCGColorCreateWithString();
  if (v0)
  {
    v1 = (CGColor *)v0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    CGColorRelease(v1);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)ic_emphasisBackgroudColorFromColor:()IC
{
  void *v3;
  void *v4;
  uint64_t v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", objc_msgSend(objc_retainAutorelease(a3), "CGColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0.0;
  v9 = 0.0;
  v6 = 0;
  v7 = 0.0;
  objc_msgSend(v3, "getRed:green:blue:alpha:", &v9, &v8, &v7, &v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", fmax(v9 * 0.85, 0.0), fmax(v8 * 0.85, 0.0), fmax(v7 * 0.85, 0.0), 0.15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)ic_colorString
{
  void *v1;

  v1 = (void *)objc_msgSend(objc_retainAutorelease(a1), "CGColor");
  if (v1)
  {
    ICStringFromCGColor();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (uint64_t)ic_isBlack
{
  objc_msgSend(objc_retainAutorelease(a1), "CGColor");
  return TSUColorIsBlack();
}

- (BOOL)ic_isWhite
{
  double v1;

  objc_msgSend(objc_retainAutorelease(a1), "CGColor");
  TSUColorLightness();
  return v1 == 1.0;
}

- (id)ic_colorBlendedWithColor:()IC
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (v4 && !objc_msgSend(a1, "isEqual:", v4))
  {
    objc_msgSend(a1, "_colorBlendedWithColor:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a1;
  }
  v6 = v5;

  return v6;
}

- (id)ic_colorBlendedWithColor:()IC fraction:
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  if (v6 && !objc_msgSend(a1, "isEqual:", v6))
  {
    objc_msgSend(a1, "alphaComponent");
    v9 = v8;
    objc_msgSend(v6, "alphaComponent");
    v11 = v10 * a2 + (1.0 - a2) * v9;
    objc_msgSend(a1, "colorWithAlphaComponent:", 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithAlphaComponent:", a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_colorBlendedWithColor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "colorWithAlphaComponent:", v11);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = a1;
  }

  return v7;
}

+ (uint64_t)ic_systemGray2Color
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
}

+ (uint64_t)ic_systemGray3Color
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
}

+ (uint64_t)ic_systemGray4Color
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
}

@end
