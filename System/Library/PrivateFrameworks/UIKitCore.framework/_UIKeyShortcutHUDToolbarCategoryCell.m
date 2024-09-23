@implementation _UIKeyShortcutHUDToolbarCategoryCell

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIKeyShortcutHUDToolbarCategoryCell;
  v4 = a3;
  -[_UIKeyShortcutHUDToolbarCell updateConfigurationUsingState:](&v11, sel_updateConfigurationUsingState_, v4);
  -[UICollectionViewCell contentConfiguration](self, "contentConfiguration", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isCategoryVisible");

  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "toolbarCategoryVisibleFont");
  else
    objc_msgSend(v7, "toolbarCategoryRegularFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  -[UICollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v5);
}

- (id)_defaultContentConfigurationWithCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_UIKeyShortcutHUDCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setText:", v6);
  return v5;
}

- (void)configureForMetricsCalculationsWithCategory:(id)a3
{
  id v4;

  -[_UIKeyShortcutHUDToolbarCategoryCell _defaultContentConfigurationWithCategory:](self, "_defaultContentConfigurationWithCategory:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v4);

}

- (void)configureForDisplayingInHUDWithCategory:(id)a3
{
  void *v4;
  id v5;

  -[_UIKeyShortcutHUDToolbarCategoryCell _defaultContentConfigurationWithCategory:](self, "_defaultContentConfigurationWithCategory:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlignment:", 1);

  -[UICollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v5);
}

@end
