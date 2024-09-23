@implementation _UISearchAtomViewVisualStyle

- (_UISearchAtomViewVisualStyle)initWithInstance:(id)a3
{
  id v4;
  _UISearchAtomViewVisualStyle *v5;
  _UISearchAtomViewVisualStyle *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISearchAtomViewVisualStyle;
  v5 = -[_UISearchAtomViewVisualStyle init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_searchAtomView, v4);

  return v6;
}

- (double)disabledAlpha
{
  return 0.5;
}

- (double)maximumFallbackWidth
{
  return 157.0;
}

- (double)maximumAtomWidthFraction
{
  return 0.75;
}

- (double)minimumConstrainedAtomWidth
{
  return 94.0;
}

- (double)cornerRadius
{
  return 4.0;
}

- (double)contentHorizontalPadding
{
  return 4.0;
}

- (double)textVerticalPadding
{
  return 2.0;
}

- (double)imageTextSpacing
{
  return 4.0;
}

- (double)minimumTextConstrastRatio
{
  return 0.222222222;
}

- (UIColor)defaultTextAndImageColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (UIColor)defaultSelectedTextAndImageColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (UIColor)textContrastFallbackColor
{
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (UIColor)defaultAtomBackgroundColor
{
  return +[UIColor systemGrayColor](UIColor, "systemGrayColor");
}

- (UIBlurEffect)defaultAtomBackgroundBlurEffect
{
  return 0;
}

- (UIBlurEffect)disabledAtomBackgroundBlurEffect
{
  return 0;
}

- (UIColor)defaultSelectedAtomBackgroundColor
{
  return 0;
}

- (UIFont)defaultFont
{
  void *v2;
  void *v3;

  objc_msgSend(off_1E167A830, "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", CFSTR("UICTFontTextStyleBody"), 0x8000, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (_UISearchAtomView)searchAtomView
{
  return (_UISearchAtomView *)objc_loadWeakRetained((id *)&self->_searchAtomView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchAtomView);
}

@end
