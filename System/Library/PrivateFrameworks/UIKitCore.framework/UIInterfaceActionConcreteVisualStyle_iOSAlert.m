@implementation UIInterfaceActionConcreteVisualStyle_iOSAlert

- (CGSize)minimumActionContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 44.0;
  v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (double)actionSectionSpacing
{
  return 8.0;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  if (!objc_msgSend(a3, "isHighlighted"))
    return 0;
  -[UIInterfaceActionConcreteVisualStyle_iOS _highlightedView](self, "_highlightedView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_regularActionFont
{
  void *v2;
  void *v3;

  objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", CFSTR("UICTFontTextStyleBody"), 0x8000, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_preferredActionFont
{
  void *v2;
  void *v3;

  objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", CFSTR("UICTFontTextStyleHeadline"), 0x8000, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
