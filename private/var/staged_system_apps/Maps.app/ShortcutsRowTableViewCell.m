@implementation ShortcutsRowTableViewCell

+ (NSString)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

+ (double)cellHeightWithTraitCollection:(id)a3
{
  double v3;

  +[ShortcutsRowCollectionViewCell cellSizeWithTraitCollection:](ShortcutsRowCollectionViewCell, "cellSizeWithTraitCollection:", a3);
  return v3;
}

+ (double)estimatedCellHeight
{
  return 130.0;
}

- (ShortcutsRowTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ShortcutsRowTableViewCell *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  UICollectionView *v9;
  UICollectionView *collectionView;
  void *v11;
  void *v12;
  ShortcutsRowCellProvider *v13;
  ShortcutsRowCellProvider *cellProvider;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD v37[5];

  v36.receiver = self;
  v36.super_class = (Class)ShortcutsRowTableViewCell;
  v4 = -[MapsThemeTableViewCell initWithStyle:reuseIdentifier:](&v36, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[ShortcutsRowTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[ShortcutsRowTableViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("ShortcutsRowTableViewCell"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("ShortcutsRowTableViewCellContent"));

    v7 = objc_alloc((Class)UICollectionView);
    v8 = objc_alloc_init((Class)UICollectionViewFlowLayout);
    v9 = (UICollectionView *)objc_msgSend(v7, "initWithFrame:collectionViewLayout:", v8, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    collectionView = v4->_collectionView;
    v4->_collectionView = v9;

    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v4->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UICollectionView setAlwaysBounceHorizontal:](v4->_collectionView, "setAlwaysBounceHorizontal:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UICollectionView setBackgroundColor:](v4->_collectionView, "setBackgroundColor:", v11);

    -[UICollectionView setShowsHorizontalScrollIndicator:](v4->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setAccessibilityIdentifier:](v4->_collectionView, "setAccessibilityIdentifier:", CFSTR("ShortcutsRowTableViewCellCollectionView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v12, "addSubview:", v4->_collectionView);

    v13 = -[ShortcutsRowCellProvider initWithCollectionView:]([ShortcutsRowCellProvider alloc], "initWithCollectionView:", v4->_collectionView);
    cellProvider = v4->_cellProvider;
    v4->_cellProvider = v13;

    -[ShortcutsRowCellProvider setDelegate:](v4->_cellProvider, "setDelegate:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowTableViewCell traitCollection](v4, "traitCollection"));
    -[ShortcutsRowCellProvider setTraitCollection:](v4->_cellProvider, "setTraitCollection:", v15);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](v4->_collectionView, "topAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowTableViewCell contentView](v4, "contentView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
    v37[0] = v32;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView leadingAnchor](v4->_collectionView, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowTableViewCell contentView](v4, "contentView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "leadingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
    v37[1] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView trailingAnchor](v4->_collectionView, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowTableViewCell contentView](v4, "contentView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v17));
    v37[2] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](v4->_collectionView, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowTableViewCell contentView](v4, "contentView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
    LODWORD(v22) = 1132068864;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:priority:", v21, 0.0, v22));
    v37[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellProvider heightConstraint](v4->_cellProvider, "heightConstraint"));
    v37[4] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

  }
  return v4;
}

- (SuggestionsDataProvider)suggestionsDataProvider
{
  return -[ShortcutsRowCellProvider suggestionsDataProvider](self->_cellProvider, "suggestionsDataProvider");
}

- (void)setSuggestionsDataProvider:(id)a3
{
  -[ShortcutsRowCellProvider setSuggestionsDataProvider:](self->_cellProvider, "setSuggestionsDataProvider:", a3);
}

- (id)favoritesDataProvider
{
  return -[ShortcutsRowCellProvider favoritesDataProvider](self->_cellProvider, "favoritesDataProvider");
}

- (void)setFavoritesDataProvider:(id)a3
{
  -[ShortcutsRowCellProvider setFavoritesDataProvider:](self->_cellProvider, "setFavoritesDataProvider:", a3);
}

- (void)resetScrollOffset
{
  -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", CGPointZero.x, CGPointZero.y);
}

- (void)fetchMissingImages
{
  -[ShortcutsRowCellProvider fetchMissingImages](self->_cellProvider, "fetchMissingImages");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ShortcutsRowTableViewCell;
  -[MapsThemeTableViewCell traitCollectionDidChange:](&v5, "traitCollectionDidChange:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowTableViewCell traitCollection](self, "traitCollection"));
  -[ShortcutsRowCellProvider setTraitCollection:](self->_cellProvider, "setTraitCollection:", v4);

}

- (void)shortcutsRowCellProviderAddNewShortcut:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ShortcutsRowTableViewCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "shortcutsRowTableViewCellAddNewShortcut:", self);

}

- (void)shortcutsRowCellProvider:(id)a3 openShortcut:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ShortcutsRowTableViewCell delegate](self, "delegate"));
  objc_msgSend(v6, "shortcutsRowTableViewCell:openShortcut:", self, v5);

}

- (void)shortcutsRowCellProvider:(id)a3 openFavorite:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ShortcutsRowTableViewCell delegate](self, "delegate"));
  objc_msgSend(v6, "shortcutsRowTableViewCell:openFavorite:", self, v5);

}

- (ShortcutsRowTableViewCellDelegate)delegate
{
  return (ShortcutsRowTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_cellProvider, 0);
}

@end
