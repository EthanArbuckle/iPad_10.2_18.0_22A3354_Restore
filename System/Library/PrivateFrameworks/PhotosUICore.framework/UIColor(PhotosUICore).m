@implementation UIColor(PhotosUICore)

+ (uint64_t)px_messagesBubbleGray
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_116960);
}

+ (uint64_t)px_assetPlaceholderGray
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.930000007, 1.0);
}

+ (uint64_t)px_assetExplorerBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.82, 0.835, 0.854, 1.0);
}

+ (id)px_dynamicHighlightColor
{
  if (px_dynamicHighlightColor_onceToken != -1)
    dispatch_once(&px_dynamicHighlightColor_onceToken, &__block_literal_global_2_116957);
  return (id)px_dynamicHighlightColor_color;
}

+ (uint64_t)px_placeholderBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "px_colorNamed:", CFSTR("PXPlaceholderBackgroundColor"));
}

+ (id)px_colorNamed:()PhotosUICore
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "px_bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
