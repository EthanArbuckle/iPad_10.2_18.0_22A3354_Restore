@implementation BKLibraryBookshelfCollectionView

- (BKLibraryBookshelfCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  BKLibraryBookshelfCollectionView *v4;
  BKLibraryBookshelfCollectionView *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKLibraryBookshelfCollectionView;
  v4 = -[BKLibraryBookshelfCollectionView initWithFrame:collectionViewLayout:](&v10, "initWithFrame:collectionViewLayout:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionView traitCollection](v4, "traitCollection"));
    v5->_currentUserInterfaceStyle = (int64_t)objc_msgSend(v6, "userInterfaceStyle");

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v8 = -[BKLibraryBookshelfCollectionView registerForTraitChanges:withAction:](v5, "registerForTraitChanges:withAction:", v7, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v5;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionView traitCollection](self, "traitCollection", a3, a4));
  -[BKLibraryBookshelfCollectionView setCurrentUserInterfaceStyle:](self, "setCurrentUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionView bkaxLabelProvider](self, "bkaxLabelProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bkaxLabel"));

  return v3;
}

- (BKLibraryBookshelfCollectionViewAccessibilityLabelProvider)bkaxLabelProvider
{
  return (BKLibraryBookshelfCollectionViewAccessibilityLabelProvider *)objc_loadWeakRetained((id *)&self->bkaxLabelProvider);
}

- (void)setBkaxLabelProvider:(id)a3
{
  objc_storeWeak((id *)&self->bkaxLabelProvider, a3);
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->bkaxLabelProvider);
}

@end
