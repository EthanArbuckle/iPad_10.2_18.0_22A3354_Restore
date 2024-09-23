@implementation UICollectionViewTableHeaderFooterView

- (void)_commonInit
{
  UITableViewHeaderFooterView *v3;
  void *v4;
  UITableViewHeaderFooterView *v5;

  v3 = [UITableViewHeaderFooterView alloc];
  -[UICollectionReusableView reuseIdentifier](self, "reuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UITableViewHeaderFooterView initWithReuseIdentifier:](v3, "initWithReuseIdentifier:", v4);

  -[UIView addSubview:](self, "addSubview:", v5);
  -[UICollectionViewTableHeaderFooterView setTableViewHeaderFooterView:](self, "setTableViewHeaderFooterView:", v5);

}

- (UICollectionViewTableHeaderFooterView)initWithFrame:(CGRect)a3
{
  return -[UICollectionViewTableHeaderFooterView initWithReuseIdentifier:](self, "initWithReuseIdentifier:", &stru_1E16EDF20, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UICollectionViewTableHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  UICollectionViewTableHeaderFooterView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UICollectionViewTableHeaderFooterView;
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v7 = a3;
  v8 = -[UICollectionReusableView initWithFrame:](&v10, sel_initWithFrame_, v3, v4, v5, v6);
  -[UICollectionReusableView _setReuseIdentifier:](v8, "_setReuseIdentifier:", v7, v10.receiver, v10.super_class);

  -[UICollectionViewTableHeaderFooterView _commonInit](v8, "_commonInit");
  return v8;
}

- (UICollectionViewTableHeaderFooterView)initWithCoder:(id)a3
{
  id v3;
  UICollectionViewTableHeaderFooterView *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewTableHeaderFooterView;
  v3 = a3;
  v4 = -[UICollectionReusableView initWithCoder:](&v8, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("UITableViewHeaderFooterView"), v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UICollectionViewTableHeaderFooterView setTableViewHeaderFooterView:](v4, "setTableViewHeaderFooterView:", v5);
  -[UICollectionViewTableHeaderFooterView tableViewHeaderFooterView](v4, "tableViewHeaderFooterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](v4, "addSubview:", v6);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewTableHeaderFooterView;
  v4 = a3;
  -[UICollectionReusableView encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tableViewHeaderFooterView, CFSTR("UITableViewHeaderFooterView"), v5.receiver, v5.super_class);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewTableHeaderFooterView;
  -[UICollectionReusableView prepareForReuse](&v4, sel_prepareForReuse);
  -[UICollectionViewTableHeaderFooterView tableViewHeaderFooterView](self, "tableViewHeaderFooterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UICollectionViewTableHeaderFooterView;
  -[UIView layoutSubviews](&v12, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UICollectionViewTableHeaderFooterView tableViewHeaderFooterView](self, "tableViewHeaderFooterView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)applyLayoutAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UICollectionViewTableHeaderFooterView;
  -[UICollectionReusableView applyLayoutAttributes:](&v11, sel_applyLayoutAttributes_, a3);
  -[UICollectionViewTableHeaderFooterView _tableAttributes](self, "_tableAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionReusableView _collectionView](self, "_collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewHeaderFooterView _setTableViewStyle:updateFrame:](self->_tableViewHeaderFooterView, "_setTableViewStyle:updateFrame:", 0, 0);
  -[UICollectionViewTableHeaderFooterView _tableLayout](self, "_tableLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_constants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewHeaderFooterView _setConstants:](self->_tableViewHeaderFooterView, "_setConstants:", v7);

  -[UICollectionViewTableHeaderFooterView _tableLayout](self, "_tableLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewHeaderFooterView setTable:](self->_tableViewHeaderFooterView, "setTable:", v8);

  -[UITableViewHeaderFooterView setSectionHeader:](self->_tableViewHeaderFooterView, "setSectionHeader:", objc_msgSend(v4, "isHeader"));
  objc_msgSend(v4, "maxTitleWidth");
  -[UITableViewHeaderFooterView setMaxTitleWidth:](self->_tableViewHeaderFooterView, "setMaxTitleWidth:");
  objc_msgSend(v4, "margins");
  -[UITableViewHeaderFooterView _setMarginWidth:](self->_tableViewHeaderFooterView, "_setMarginWidth:", v9);
  objc_msgSend(v4, "margins");
  -[UITableViewHeaderFooterView _setRightMarginWidth:](self->_tableViewHeaderFooterView, "_setRightMarginWidth:", v10);
  -[UITableViewHeaderFooterView setTextAlignment:](self->_tableViewHeaderFooterView, "setTextAlignment:", objc_msgSend(v4, "textAlignment"));
  -[UITableViewHeaderFooterView _setInsetsContentViewsToSafeArea:](self->_tableViewHeaderFooterView, "_setInsetsContentViewsToSafeArea:", objc_msgSend(v4, "insetsContentViewsToSafeArea"));
  -[UITableViewHeaderFooterView _setupLabelAppearance](self->_tableViewHeaderFooterView, "_setupLabelAppearance");
  -[UICollectionViewTableHeaderFooterView setFloating:](self, "setFloating:", objc_msgSend(v4, "floating"));

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._collectionView);
  objc_msgSend(WeakRetained, "collectionViewLayout");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

LABEL_6:
    v15 = v4;
    goto LABEL_7;
  }
  v7 = (void *)v6;
  v8 = objc_loadWeakRetained((id *)&self->super._collectionView);
  objc_msgSend(v8, "collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_estimatesSizes");

  if (!v10)
    goto LABEL_6;
  v11 = objc_loadWeakRetained((id *)&self->super._collectionView);
  objc_msgSend(v11, "collectionViewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_cellsShouldConferWithAutolayoutEngineForSizingInfo");

  if (!v13)
    goto LABEL_6;
  -[UICollectionViewTableHeaderFooterView tableViewHeaderFooterView](self, "tableViewHeaderFooterView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _preferredAttributesFittingAttributesWithInnerView(self, v4, v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v15;
}

- (UICollectionViewTableLayout)_tableLayout
{
  void *v2;
  void *v3;
  id v4;

  -[UICollectionReusableView _collectionView](self, "_collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (UICollectionViewTableLayout *)v4;
}

- (UICollectionViewTableLayoutAttributes)_tableAttributes
{
  void *v2;
  id v3;

  -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (UICollectionViewTableLayoutAttributes *)v3;
}

- (UIColor)tintColor
{
  void *v2;
  void *v3;

  -[UICollectionViewTableHeaderFooterView tableViewHeaderFooterView](self, "tableViewHeaderFooterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setTintColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UICollectionViewTableHeaderFooterView tableViewHeaderFooterView](self, "tableViewHeaderFooterView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

}

- (UILabel)textLabel
{
  void *v2;
  void *v3;

  -[UICollectionViewTableHeaderFooterView tableViewHeaderFooterView](self, "tableViewHeaderFooterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UILabel *)v3;
}

- (UILabel)detailTextLabel
{
  void *v2;
  void *v3;

  -[UICollectionViewTableHeaderFooterView tableViewHeaderFooterView](self, "tableViewHeaderFooterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UILabel *)v3;
}

- (UIView)contentView
{
  void *v2;
  void *v3;

  -[UICollectionViewTableHeaderFooterView tableViewHeaderFooterView](self, "tableViewHeaderFooterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (UIView)backgroundView
{
  void *v2;
  void *v3;

  -[UICollectionViewTableHeaderFooterView tableViewHeaderFooterView](self, "tableViewHeaderFooterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setBackgroundView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UICollectionViewTableHeaderFooterView tableViewHeaderFooterView](self, "tableViewHeaderFooterView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundView:", v4);

}

- (BOOL)floating
{
  return *(&self->_floating + 4);
}

- (void)setFloating:(BOOL)a3
{
  *(&self->_floating + 4) = a3;
}

- (UITableViewHeaderFooterView)tableViewHeaderFooterView
{
  return self->_tableViewHeaderFooterView;
}

- (void)setTableViewHeaderFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewHeaderFooterView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewHeaderFooterView, 0);
}

@end
