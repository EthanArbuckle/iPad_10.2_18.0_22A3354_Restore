@implementation _UIFloatingTabBarPlaceholderCell

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (_UIFloatingTabBarPlaceholderCell)initWithFrame:(CGRect)a3
{
  _UIFloatingTabBarPlaceholderCell *v3;
  _UIFloatingTabBarPlaceholderCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingTabBarPlaceholderCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UIView _setOverrideVibrancyTrait:](v3, "_setOverrideVibrancyTrait:", 0);
  return v4;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v4 = a3;
  -[_UIFloatingTabBarCell listItem](self, "listItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentTab");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIFloatingTabBarPlaceholderCell _itemView](self, "_itemView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setItem:", v6);

    -[UIView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v8, "userInterfaceIdiom"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "editModeItemMargins");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[UICollectionViewCell contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    objc_msgSend(v18, "sizeThatFits:");
    v20 = v19;
    v22 = v21;

    objc_msgSend(v4, "setSize:", v13 + v17 + v20, v11 + v15 + v22);
  }

  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIFloatingTabBarPlaceholderCell;
  -[UICollectionViewCell prepareForReuse](&v5, sel_prepareForReuse);
  -[_UIFloatingTabBarPlaceholderCell _itemView](self, "_itemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setItem:", 0);

  -[_UIFloatingTabBarPlaceholderCell _itemView](self, "_itemView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingTabBarPlaceholderCell;
  -[UICollectionViewCell updateConfigurationUsingState:](&v6, sel_updateConfigurationUsingState_, a3);
  -[_UIFloatingTabBarPlaceholderCell _itemView](self, "_itemView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[_UIFloatingTabBarPlaceholderCell _itemView](self, "_itemView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEditing:", 0);

}

- (void)setListItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFloatingTabBarPlaceholderCell;
  v4 = a3;
  -[_UIFloatingTabBarCell setListItem:](&v7, sel_setListItem_, v4);
  objc_msgSend(v4, "contentTab", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIFloatingTabBarPlaceholderCell _itemView](self, "_itemView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItem:", v5);

}

@end
