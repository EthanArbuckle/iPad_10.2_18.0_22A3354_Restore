@implementation _UISearchTextFieldVisualStyle

- (NSNumber)clearButtonOuterInset
{
  return 0;
}

- (NSNumber)clearButtonInnerInset
{
  return 0;
}

- (double)rightViewInset
{
  return 1.0;
}

- (double)searchBookmarkButtonOffset
{
  return 9.0;
}

- (double)leftViewInset
{
  _BOOL4 v2;
  double result;

  v2 = UISearchBarUsesModernAppearance();
  result = 8.0;
  if (v2)
    return 6.0;
  return result;
}

- (double)leftViewInsetAddition
{
  return 0.0;
}

- (double)textLeadingInset
{
  return 5.0;
}

- (_UISearchTextFieldVisualStyle)initWithInstance:(id)a3
{
  id v4;
  _UISearchTextFieldVisualStyle *v5;
  _UISearchTextFieldVisualStyle *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISearchTextFieldVisualStyle;
  v5 = -[_UISearchTextFieldVisualStyle init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_searchTextField, v4);

  return v6;
}

- (UIColor)defaultLeftViewTintColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (double)backgroundCornerRadius
{
  return 10.0;
}

- (UIFont)dynamicSearchFieldFont
{
  return (UIFont *)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchTextField);
}

- (BOOL)usesCustomIntrinsicSize
{
  return 1;
}

- (double)defaultHeight
{
  return 28.0;
}

+ (double)defaultHeightForBarMetrics:(int64_t)a3
{
  return 28.0;
}

- (double)textLeftInsetLegacy
{
  return 1.0;
}

- (double)textRightInset
{
  return 10.0;
}

- (double)leftViewToPlaceholderCenteredMargin
{
  return 8.0;
}

- (double)searchResultsListButtonOffset
{
  return 8.0;
}

- (double)searchTextResultsPadding
{
  return 10.0;
}

- (UIColor)filledLeftViewTintColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (UISearchTextField)searchTextField
{
  return (UISearchTextField *)objc_loadWeakRetained((id *)&self->_searchTextField);
}

@end
