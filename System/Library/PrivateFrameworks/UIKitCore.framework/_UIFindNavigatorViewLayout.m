@implementation _UIFindNavigatorViewLayout

- (BOOL)isEqual:(id)a3
{
  void *v3;

  v3 = (void *)objc_opt_class();
  return objc_msgSend(v3, "isEqual:", objc_opt_class());
}

- (CGSize)preferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  if (self->_usesAssistantBarHeight)
  {
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:](UISystemInputAssistantViewController, "_defaultPreferredHeightForTraitCollection:", v3);
  }
  else
  {
    -[_UIFindNavigatorViewLayout preferredTextFieldFont](self, "preferredTextFieldFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_scaledValueForValue:", 49.0);
    UIRoundToViewScale(self);
  }
  v5 = v4;

  v6 = -1.0;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (NSString)preferredMaximumContentSizeCategory
{
  return (NSString *)CFSTR("UICTContentSizeCategoryAccessibilityM");
}

- (UIImageSymbolConfiguration)preferredSymbolConfigurationForImageForTextFields
{
  return +[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 2);
}

- (UIFont)preferredTextFieldFont
{
  void *v2;
  void *v3;

  -[_UIFindNavigatorViewLayout preferredMaximumContentSizeCategory](self, "preferredMaximumContentSizeCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "_preferredFontForTextStyle:maximumContentSizeCategory:", CFSTR("UICTFontTextStyleBody"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIColor)preferredOpaqueBackgroundColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

- (double)preferredCornerRadius
{
  return 0.0;
}

- (double)preferredHorizontalPadding
{
  return 4.0;
}

- (double)preferredVerticalPadding
{
  return 4.0;
}

- (BOOL)showsReplaceInOptionsMenu
{
  return 1;
}

- (id)commonButtonConfig:(id)a3
{
  void (**v3)(id, void *);
  void *v4;

  v3 = (void (**)(id, void *))a3;
  +[UIButtonConfiguration borderlessButtonConfiguration](UIButtonConfiguration, "borderlessButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMacIdiomStyle:", 1);
  v3[2](v3, v4);

  return v4;
}

- (id)commonButtonConfigWithTitle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58___UIFindNavigatorViewLayout_commonButtonConfigWithTitle___block_invoke;
  v8[3] = &unk_1E16B1A88;
  v5 = v4;
  v9 = v5;
  objc_copyWeak(&v10, &location);
  -[_UIFindNavigatorViewLayout commonButtonConfig:](self, "commonButtonConfig:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v6;
}

- (id)commonButtonConfigWithImageName:(id)a3 isAccessory:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74___UIFindNavigatorViewLayout_commonButtonConfigWithImageName_isAccessory___block_invoke;
  v9[3] = &unk_1E16B1AB0;
  v10 = v5;
  v6 = v5;
  -[_UIFindNavigatorViewLayout commonButtonConfig:](self, "commonButtonConfig:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setAssistantBarStyle:(int64_t)a3
{
  self->_assistantBarStyle = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (UIButton)nextResultButton
{
  return self->_nextResultButton;
}

- (void)setNextResultButton:(id)a3
{
  objc_storeStrong((id *)&self->_nextResultButton, a3);
}

- (UIButton)previousResultButton
{
  return self->_previousResultButton;
}

- (void)setPreviousResultButton:(id)a3
{
  objc_storeStrong((id *)&self->_previousResultButton, a3);
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (UIButton)replaceButton
{
  return self->_replaceButton;
}

- (void)setReplaceButton:(id)a3
{
  objc_storeStrong((id *)&self->_replaceButton, a3);
}

- (UIView)searchTextField
{
  return self->_searchTextField;
}

- (void)setSearchTextField:(id)a3
{
  objc_storeStrong((id *)&self->_searchTextField, a3);
}

- (UIView)replaceTextField
{
  return self->_replaceTextField;
}

- (void)setReplaceTextField:(id)a3
{
  objc_storeStrong((id *)&self->_replaceTextField, a3);
}

- (BOOL)replaceFieldVisible
{
  return self->_replaceFieldVisible;
}

- (void)setReplaceFieldVisible:(BOOL)a3
{
  self->_replaceFieldVisible = a3;
}

- (BOOL)usesAssistantBarHeight
{
  return self->_usesAssistantBarHeight;
}

- (void)setUsesAssistantBarHeight:(BOOL)a3
{
  self->_usesAssistantBarHeight = a3;
}

- (int64_t)assistantBarStyle
{
  return self->_assistantBarStyle;
}

- (BOOL)usesSymbolForDoneButton
{
  return self->_usesSymbolForDoneButton;
}

- (BOOL)usesNextAndPreviousArrows
{
  return self->_usesNextAndPreviousArrows;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceTextField, 0);
  objc_storeStrong((id *)&self->_searchTextField, 0);
  objc_storeStrong((id *)&self->_replaceButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_previousResultButton, 0);
  objc_storeStrong((id *)&self->_nextResultButton, 0);
}

@end
