@implementation _UIKeyShortcutHUDSearchTextField

- (void)setShortcutInputView:(id)a3
{
  _UIKeyShortcutHUDShortcutInputView *v5;

  v5 = (_UIKeyShortcutHUDShortcutInputView *)a3;
  if (self->_shortcutInputView != v5)
  {
    objc_storeStrong((id *)&self->_shortcutInputView, a3);
    -[UITextField setRightView:](self, "setRightView:", v5);
    -[UITextField setRightViewMode:](self, "setRightViewMode:", 2);
  }

}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView systemLayoutSizeFittingSize:](self->_shortcutInputView, "systemLayoutSizeFittingSize:", a3.size.width, a3.size.height);
  v8 = v7;
  v10 = v9;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v11 = CGRectGetWidth(v16) - v8 + -10.0;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v12 = (CGRectGetHeight(v17) - v10) * 0.5;
  v13 = v11;
  v14 = v8;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  UIUserInterfaceLayoutDirection v13;
  UIUserInterfaceLayoutDirection v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect result;

  v21.receiver = self;
  v21.super_class = (Class)_UIKeyShortcutHUDSearchTextField;
  -[UISearchTextField clearButtonRectForBounds:](&v21, sel_clearButtonRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIOffset:", -4.0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v12)
  {
    v14 = v13;
    objc_msgSend(v12, "UIOffsetValue");
    if (v14 == UIUserInterfaceLayoutDirectionRightToLeft)
      v15 = -v15;
    v5 = v5 + v15;
    v7 = v7 + v16;
  }

  v17 = v5;
  v18 = v7;
  v19 = v9;
  v20 = v11;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UIUserInterfaceLayoutDirection v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchButtonWidth");
  v11 = v10 + -23.0;

  if (v8 == UIUserInterfaceLayoutDirectionRightToLeft)
    v12 = 8.0;
  else
    v12 = v11;
  if (v8 != UIUserInterfaceLayoutDirectionRightToLeft)
    v11 = 8.0;
  v20.receiver = self;
  v20.super_class = (Class)_UIKeyShortcutHUDSearchTextField;
  -[UISearchTextField editingRectForBounds:](&v20, sel_editingRectForBounds_, x, y, width, height);
  v15 = v12 + v14;
  v17 = v16 - (v11 + v12);
  v19 = v18 + 0.0;
  result.size.height = v13;
  result.size.width = v17;
  result.origin.y = v19;
  result.origin.x = v15;
  return result;
}

- (id)preferredFocusEnvironments
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  objc_super v7;

  objc_opt_self();
  WeakRetained = objc_loadWeakRetained(&_currentHUDCollectionViewManager);
  if (objc_msgSend(WeakRetained, "nextFocusUpdatePrefersTopSearchResult"))
  {
    objc_msgSend(WeakRetained, "preferredFocusEnvironments");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIKeyShortcutHUDSearchTextField;
    -[UIView preferredFocusEnvironments](&v7, sel_preferredFocusEnvironments);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (BOOL)_suppressSoftwareKeyboard
{
  return 1;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIKeyShortcutHUDSearchTextField;
  -[UIResponder buildMenuWithBuilder:](&v7, sel_buildMenuWithBuilder_, v4);
  objc_msgSend(v4, "system");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenuSystem contextSystem](UIMenuSystem, "contextSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    objc_msgSend(v4, "removeMenuForIdentifier:", CFSTR("com.apple.menu.share"));
    objc_msgSend(v4, "removeMenuForIdentifier:", CFSTR("com.apple.menu.lookup"));
    objc_msgSend(v4, "removeMenuForIdentifier:", CFSTR("com.apple.menu.autofill"));
  }

}

- (_UIKeyShortcutHUDSearchButton)searchButton
{
  return self->_searchButton;
}

- (void)setSearchButton:(id)a3
{
  objc_storeStrong((id *)&self->_searchButton, a3);
}

- (_UIKeyShortcutHUDShortcutInputView)shortcutInputView
{
  return self->_shortcutInputView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutInputView, 0);
  objc_storeStrong((id *)&self->_searchButton, 0);
}

@end
