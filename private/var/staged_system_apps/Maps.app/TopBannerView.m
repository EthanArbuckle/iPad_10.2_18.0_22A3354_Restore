@implementation TopBannerView

- (id)initAllowingBlurredForButton:(BOOL)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TopBannerView;
  v3 = -[CardView initAllowingBlurredForButton:](&v6, "initAllowingBlurredForButton:", a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  NSLayoutConstraint *v4;
  NSLayoutConstraint *maximumHeightConstraint;
  id v6;

  -[CardView setLayoutStyle:](self, "setLayoutStyle:", 6);
  -[TopBannerView _createSubviews](self, "_createSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerView _initialConstraints](self, "_initialConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[OverflowView heightAnchor](self->_overflowView, "heightAnchor"));
  v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintLessThanOrEqualToConstant:", -1.0));
  maximumHeightConstraint = self->_maximumHeightConstraint;
  self->_maximumHeightConstraint = v4;

}

- (void)_createSubviews
{
  UIStackView *v3;
  UIStackView *stackView;
  OverflowView *v5;
  OverflowView *overflowView;
  id v7;

  v3 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  stackView = self->_stackView;
  self->_stackView = v3;

  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 0.0);
  -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 0);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = -[OverflowView initWithContentView:]([OverflowView alloc], "initWithContentView:", self->_stackView);
  overflowView = self->_overflowView;
  self->_overflowView = v5;

  -[OverflowView setTranslatesAutoresizingMaskIntoConstraints:](self->_overflowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CardView contentView](self, "contentView"));
  objc_msgSend(v7, "addSubview:", self->_overflowView);

}

- (id)_initialConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OverflowView topAnchor](self->_overflowView, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerView topAnchor](self, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v17[0] = v14;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OverflowView trailingAnchor](self->_overflowView, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerView trailingAnchor](self, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));
  v17[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OverflowView leadingAnchor](self->_overflowView, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerView leadingAnchor](self, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  v17[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OverflowView bottomAnchor](self->_overflowView, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerView bottomAnchor](self, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v17[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 4));

  return v12;
}

- (void)setItems:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  unsigned __int8 v6;
  NSArray *v7;
  NSArray *items;
  NSArray *v9;

  v4 = (NSArray *)a3;
  v5 = v4;
  if (self->_items != v4)
  {
    v9 = v4;
    v6 = -[NSArray isEqualToArray:](v4, "isEqualToArray:");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSArray *)-[NSArray copy](v9, "copy");
      items = self->_items;
      self->_items = v7;

      -[TopBannerView _updateItemViews](self, "_updateItemViews");
      v5 = v9;
    }
  }

}

- (void)_updateItemViews
{
  void *v3;
  _BYTE *v4;
  void *v5;
  _BYTE *v6;
  int64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  double y;
  double width;
  double height;
  void *i;
  void *v18;
  void *v19;
  char *v20;
  void *v21;
  TopBannerItemView *v22;
  void *v23;
  _BOOL8 v24;
  BOOL v25;
  void *v26;
  void *v27;
  id obj;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerView items](self, "items"));
  v4 = objc_msgSend(v3, "count");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
  v6 = objc_msgSend(v5, "count");

  if (v4 - v6 < 0)
  {
    v7 = v6 - v4;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));

      objc_msgSend(v9, "removeFromSuperview");
      --v7;
    }
    while (v7);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[TopBannerView items](self, "items"));
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = 0;
    v29 = *(_QWORD *)v31;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v29)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
        v20 = (char *)objc_msgSend(v19, "count");

        if ((char *)i + v13 >= v20)
        {
          v22 = -[TopBannerItemView initWithFrame:]([TopBannerItemView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
          -[TopBannerItemView setItem:](v22, "setItem:", v18);
          -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v22);
        }
        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
          v22 = (TopBannerItemView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", (char *)i + v13));

          -[TopBannerItemView setItem:](v22, "setItem:", v18);
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerView items](self, "items"));
        v24 = (char *)i + v13 != (char *)objc_msgSend(v23, "count") - 1;

        -[TopBannerItemView setHairlineVisible:](v22, "setHairlineVisible:", v24);
        v25 = 1;
        -[TopBannerItemView setFirstItemWithIcon:](v22, "setFirstItemWithIcon:", (v12 & 1) == 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "artwork"));
        if (!v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "artworkURL"));
          v25 = v27 != 0;

        }
        v12 |= v25;

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v13 += (uint64_t)i;
    }
    while (v11);
  }

  -[OverflowView resetContentOffset](self->_overflowView, "resetContentOffset");
  -[TopBannerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setMaximumHeight:(double)a3
{
  double v5;

  -[NSLayoutConstraint constant](self->_maximumHeightConstraint, "constant");
  if (v5 != a3)
  {
    -[NSLayoutConstraint setConstant:](self->_maximumHeightConstraint, "setConstant:", a3);
    -[NSLayoutConstraint setActive:](self->_maximumHeightConstraint, "setActive:", a3 != -1.0);
  }
}

- (double)maximumHeight
{
  double result;

  -[NSLayoutConstraint constant](self->_maximumHeightConstraint, "constant");
  return result;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_maximumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_overflowView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
