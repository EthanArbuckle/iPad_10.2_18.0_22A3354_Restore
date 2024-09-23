@implementation ShortcutsRowCollectionViewListCell

+ (double)estimatedCellHeight
{
  return 130.0;
}

- (ShortcutsRowCollectionViewListCell)initWithFrame:(CGRect)a3
{
  ShortcutsRowCollectionViewListCell *v3;
  id v4;
  id v5;
  UICollectionView *v6;
  UICollectionView *collectionView;
  void *v8;
  void *v9;
  ShortcutsRowCellProvider *v10;
  ShortcutsRowCellProvider *cellProvider;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;
  _QWORD v34[5];

  v33.receiver = self;
  v33.super_class = (Class)ShortcutsRowCollectionViewListCell;
  v3 = -[ShortcutsRowCollectionViewListCell initWithFrame:](&v33, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UICollectionView);
    v5 = objc_alloc_init((Class)UICollectionViewFlowLayout);
    v6 = (UICollectionView *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v5, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    collectionView = v3->_collectionView;
    v3->_collectionView = v6;

    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v3->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UICollectionView setAlwaysBounceHorizontal:](v3->_collectionView, "setAlwaysBounceHorizontal:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UICollectionView setBackgroundColor:](v3->_collectionView, "setBackgroundColor:", v8);

    -[UICollectionView setShowsHorizontalScrollIndicator:](v3->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setAccessibilityIdentifier:](v3->_collectionView, "setAccessibilityIdentifier:", CFSTR("ShortcutsRowTableViewCellCollectionView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewListCell contentView](v3, "contentView"));
    objc_msgSend(v9, "addSubview:", v3->_collectionView);

    v10 = -[ShortcutsRowCellProvider initWithCollectionView:]([ShortcutsRowCellProvider alloc], "initWithCollectionView:", v3->_collectionView);
    cellProvider = v3->_cellProvider;
    v3->_cellProvider = v10;

    -[ShortcutsRowCellProvider setDelegate:](v3->_cellProvider, "setDelegate:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewListCell traitCollection](v3, "traitCollection"));
    -[ShortcutsRowCellProvider setTraitCollection:](v3->_cellProvider, "setTraitCollection:", v12);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](v3->_collectionView, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewListCell contentView](v3, "contentView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
    v34[0] = v29;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView leadingAnchor](v3->_collectionView, "leadingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewListCell contentView](v3, "contentView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
    v34[1] = v25;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView trailingAnchor](v3->_collectionView, "trailingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewListCell contentView](v3, "contentView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v14));
    v34[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](v3->_collectionView, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewListCell contentView](v3, "contentView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
    LODWORD(v19) = 1132068864;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:priority:", v18, 0.0, v19));
    v34[3] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellProvider heightConstraint](v3->_cellProvider, "heightConstraint"));
    v34[4] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

  }
  return v3;
}

- (_TtC4Maps20MapsFavoritesManager)favoritesDataProvider
{
  return -[ShortcutsRowCellProvider favoritesDataProvider](self->_cellProvider, "favoritesDataProvider");
}

- (void)setFavoritesDataProvider:(id)a3
{
  -[ShortcutsRowCellProvider setFavoritesDataProvider:](self->_cellProvider, "setFavoritesDataProvider:", a3);
}

- (SuggestionsDataProvider)suggestionsDataProvider
{
  return -[ShortcutsRowCellProvider suggestionsDataProvider](self->_cellProvider, "suggestionsDataProvider");
}

- (void)setSuggestionsDataProvider:(id)a3
{
  -[ShortcutsRowCellProvider setSuggestionsDataProvider:](self->_cellProvider, "setSuggestionsDataProvider:", a3);
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
  v5.super_class = (Class)ShortcutsRowCollectionViewListCell;
  -[ShortcutsRowCollectionViewListCell traitCollectionDidChange:](&v5, "traitCollectionDidChange:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewListCell traitCollection](self, "traitCollection"));
  -[ShortcutsRowCellProvider setTraitCollection:](self->_cellProvider, "setTraitCollection:", v4);

}

- (void)shortcutsRowCellProviderAddNewShortcut:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewListCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "shortcutsRowTableViewCellAddNewShortcut:", self);

}

- (void)shortcutsRowCellProvider:(id)a3 openShortcut:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewListCell delegate](self, "delegate"));
  objc_msgSend(v6, "shortcutsRowTableViewCell:openShortcut:", self, v5);

}

- (void)shortcutsRowCellProvider:(id)a3 openFavorite:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewListCell delegate](self, "delegate"));
  objc_msgSend(v6, "shortcutsRowTableViewCell:openFavorite:", self, v5);

}

- (void)shortcutsRowCellProvider:(id)a3 editShortcut:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewListCell delegate](self, "delegate"));
  objc_msgSend(v6, "editFavoriteShortcut:", v5);

}

- (void)shortcutsRowCellProvider:(id)a3 removeShortcut:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewListCell delegate](self, "delegate"));
  objc_msgSend(v6, "removeFavoriteShortcut:", v5);

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
