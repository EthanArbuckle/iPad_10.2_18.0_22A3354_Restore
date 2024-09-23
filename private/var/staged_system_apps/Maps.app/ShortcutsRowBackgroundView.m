@implementation ShortcutsRowBackgroundView

- (ShortcutsRowBackgroundView)initWithCollectionView:(id)a3
{
  id v4;
  double y;
  double width;
  double height;
  ShortcutsRowBackgroundView *v8;
  ShortcutsRowBackgroundView *v9;
  UIView *v10;
  UIView *platterView;
  void *v12;
  unsigned int v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ShortcutsRowBackgroundView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = -[ShortcutsRowBackgroundView initWithFrame:](&v16, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_collectionView, v4);
    v10 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    platterView = v9->_platterView;
    v9->_platterView = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
    -[UIView setBackgroundColor:](v9->_platterView, "setBackgroundColor:", v12);

    -[UIView _setContinuousCornerRadius:](v9->_platterView, "_setContinuousCornerRadius:", 10.0);
    v13 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
    v9->_myPlacesFeaturesEnabled = v13;
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v9->_platterView, "layer"));
      objc_msgSend(v14, "setMaskedCorners:", 0);

    }
    -[ShortcutsRowBackgroundView addSubview:](v9, "addSubview:", v9->_platterView);
  }

  return v9;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double y;
  double v6;
  double v7;
  double v8;
  double Height;
  id v10;
  id WeakRetained;
  double v12;
  double v13;
  id v14;
  double v15;
  double Width;
  id v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double MaxX;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v27.receiver = self;
  v27.super_class = (Class)ShortcutsRowBackgroundView;
  -[ShortcutsRowBackgroundView layoutSubviews](&v27, "layoutSubviews");
  if (self->_myPlacesFeaturesEnabled)
  {
    -[ShortcutsRowBackgroundView bounds](self, "bounds");
    y = v4;
    v7 = v6;
    Height = v8;
  }
  else
  {
    v10 = -[ShortcutsRowBackgroundView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    objc_msgSend(WeakRetained, "contentOffset");
    v13 = v12;

    v14 = objc_loadWeakRetained((id *)&self->_collectionView);
    objc_msgSend(v14, "contentSize");
    Width = v15;

    v17 = objc_loadWeakRetained((id *)&self->_collectionView);
    objc_msgSend(v17, "bounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v28.origin.x = v19;
    v28.origin.y = v21;
    v28.size.width = v23;
    v28.size.height = v25;
    if (Width <= CGRectGetWidth(v28))
    {
      v29.origin.x = v19;
      v29.origin.y = v21;
      v29.size.width = v23;
      v29.size.height = v25;
      Width = CGRectGetWidth(v29);
    }
    y = CGRectZero.origin.y;
    v7 = Width + -32.0;
    v30.origin.x = v19;
    v30.origin.y = v21;
    v30.size.width = v23;
    v30.size.height = v25;
    Height = CGRectGetHeight(v30);
    if (v10 == (id)1)
    {
      -[ShortcutsRowBackgroundView bounds](self, "bounds");
      MaxX = CGRectGetMaxX(v31);
      v32.origin.x = CGRectZero.origin.x;
      v32.origin.y = y;
      v32.size.width = v7;
      v32.size.height = Height;
      v3 = v13 + MaxX - CGRectGetWidth(v32) + -16.0;
    }
    else
    {
      v3 = 16.0 - v13;
    }
  }
  -[UIView setFrame:](self->_platterView, "setFrame:", v3, y, v7, Height);
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_platterView, 0);
}

@end
