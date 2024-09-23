@implementation _UIFloatingTabBarItemCell

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_UIFloatingTabBarItemCell;
  -[UICollectionReusableView preferredLayoutAttributesFittingAttributes:](&v20, sel_preferredLayoutAttributesFittingAttributes_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBarItemCell _contentViewInset](self, "_contentViewInset");
  v6 = v5;
  v8 = v7;
  -[_UIFloatingTabBarItemCell _itemView](self, "_itemView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  objc_msgSend(v9, "sizeThatFits:");
  v11 = v10;

  objc_msgSend(v4, "size");
  objc_msgSend(v4, "setSize:", v6 + v8 + v11);
  -[_UIFloatingTabBarCell listItem](self, "listItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "itemIndex");

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[_UIFloatingTabBarCell listItem](self, "listItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "parent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "children");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    -[_UIFloatingTabBarCell listItem](self, "listItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setZIndex:", v17 - objc_msgSend(v18, "itemIndex"));

  }
  objc_msgSend(v4, "setGroupItemMinimized:", 0);
  return v4;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingTabBarItemCell;
  v4 = a3;
  -[UICollectionReusableView applyLayoutAttributes:](&v6, sel_applyLayoutAttributes_, v4);
  v5 = objc_msgSend(v4, "isGroupItemMinimized", v6.receiver, v6.super_class);

  -[_UIFloatingTabBarItemCell setGroupItemMinimized:](self, "setGroupItemMinimized:", v5);
}

- (UIEdgeInsets)_contentViewInset
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIFloatingTabBarItemCell _itemView](self, "_itemView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  if (objc_msgSend(v5, "isCustomizableItem"))
  {
    -[UICollectionViewCell configurationState](self, "configurationState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEditing"))
    {
      objc_msgSend(v4, "editModeItemMargins");
      v9 = v11;
      v8 = v12;
      v7 = v13;
      v6 = v14;
    }

  }
  v15 = v9;
  v16 = v8;
  v17 = v7;
  v18 = v6;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIFloatingTabBarItemCell;
  -[UICollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[_UIFloatingTabBarItemCell _itemView](self, "_itemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

}

- (void)setListItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "contentTab");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFloatingTabBarItemCell.m"), 71, CFSTR("listItem must represent a single item, not a group."));

    }
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIFloatingTabBarItemCell;
  -[_UIFloatingTabBarCell setListItem:](&v11, sel_setListItem_, v6);
  objc_msgSend(v6, "contentTab");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBarItemCell _itemView](self, "_itemView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setItem:", v9);

}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIFloatingTabBarItemCell;
  v4 = a3;
  -[UICollectionViewCell updateConfigurationUsingState:](&v9, sel_updateConfigurationUsingState_, v4);
  v5 = objc_msgSend(v4, "isEditing", v9.receiver, v9.super_class);
  -[_UIFloatingTabBarItemCell _itemView](self, "_itemView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEditing:", v5);

  v7 = objc_msgSend(v4, "cellDragState");
  -[_UIFloatingTabBarItemCell _itemView](self, "_itemView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDragged:", v7 != 0);

}

- (BOOL)isHighlighted
{
  void *v2;
  char v3;

  -[_UIFloatingTabBarItemCell _itemView](self, "_itemView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHighlighted");

  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingTabBarItemCell;
  -[UICollectionViewCell setHighlighted:](&v6, sel_setHighlighted_);
  -[_UIFloatingTabBarItemCell _itemView](self, "_itemView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlighted:", v3);

}

- (BOOL)hasSelectionHighlight
{
  void *v2;
  char v3;

  -[_UIFloatingTabBarItemCell _itemView](self, "_itemView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSelectionHighlight");

  return v3;
}

- (void)setHasSelectionHighlight:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIFloatingTabBarItemCell _itemView](self, "_itemView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHasSelectionHighlight:", v3);

}

- (void)setGroupItemMinimized:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  double v6;
  void *v7;
  id v8;

  v4 = a3;
  self->_groupItemMinimized = a3;
  if (a3)
  {
    -[_UIFloatingTabBarCell listItem](self, "listItem");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v6 = 0.0;
    else
      v6 = 1.0;
  }
  else
  {
    v6 = 1.0;
  }
  -[_UIFloatingTabBarItemCell _itemView](self, "_itemView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitleOpacity:", v6);

  if (v4)
  {

  }
}

- (BOOL)groupItemMinimized
{
  return self->_groupItemMinimized;
}

@end
