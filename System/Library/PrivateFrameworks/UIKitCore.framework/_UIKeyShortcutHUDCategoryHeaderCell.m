@implementation _UIKeyShortcutHUDCategoryHeaderCell

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)configureWithCategory:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UIKeyShortcutHUDCategoryHeaderCell setCategoryMenu:](self, "setCategoryMenu:", v4);
  -[_UIKeyShortcutHUDCategoryHeaderCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setText:", v5);
  -[UICollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v6);

}

- (id)defaultContentConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_UIKeyShortcutHUDCategoryHeaderCell;
  -[_UIKeyShortcutHUDCell defaultContentConfiguration](&v21, sel_defaultContentConfiguration);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categoryHeaderFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(v2, "directionalLayoutMargins");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "categoryHeaderVerticalTextAdjustment");
  v16 = v7 + v15;

  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "categoryHeaderVerticalTextAdjustment");
  v19 = v11 - v18;

  objc_msgSend(v2, "setDirectionalLayoutMargins:", v16, v9, v19, v13);
  return v2;
}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIKeyShortcutHUDCategoryHeaderCell;
  -[_UIKeyShortcutHUDMenuCell updateConfigurationUsingState:](&v5, sel_updateConfigurationUsingState_, a3);
  +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v4);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  id WeakRetained;
  double v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIKeyShortcutHUDCategoryHeaderCell;
  -[UICollectionReusableView preferredLayoutAttributesFittingAttributes:](&v12, sel_preferredLayoutAttributesFittingAttributes_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_categoryMenu);
  objc_msgSend(v7, "headerWidthForCategory:", WeakRetained);
  v10 = v9;

  objc_msgSend(v4, "setSize:", v10, v6);
  return v4;
}

- (_UIKeyShortcutHUDMenu)categoryMenu
{
  return (_UIKeyShortcutHUDMenu *)objc_loadWeakRetained((id *)&self->_categoryMenu);
}

- (void)setCategoryMenu:(id)a3
{
  objc_storeWeak((id *)&self->_categoryMenu, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_categoryMenu);
}

@end
