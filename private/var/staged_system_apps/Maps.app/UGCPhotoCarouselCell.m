@implementation UGCPhotoCarouselCell

- (UGCPhotoCarouselCell)initWithFrame:(CGRect)a3
{
  UGCPhotoCarouselCell *v3;
  UGCPhotoCarouselCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UGCPhotoCarouselCell;
  v3 = -[UGCPhotoCarouselCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    *(_OWORD *)&v3->_sectionInset.top = 0u;
    *(_OWORD *)&v3->_sectionInset.bottom = 0u;
    -[UGCPhotoCarouselCell _setupSubviews](v3, "_setupSubviews");
    -[UGCPhotoCarouselCell _setupConstraints](v4, "_setupConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "_contentSizeDidChange", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v4;
}

- (double)estimatedHeight
{
  uint64_t v3;
  UGCPhotoCarouselController **p_carouselController;
  id WeakRetained;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v3 = sub_1002A8AA0(self);
  p_carouselController = &self->_carouselController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_carouselController);
  v6 = WeakRetained;
  if (v3 == 5)
  {
    v7 = (unint64_t)objc_msgSend(WeakRetained, "totalNumberOfItems");

    v8 = ((__PAIR128__(v7, __ROR8__(0xAAAAAAAAAAAAAAABLL * v7, 1)) - 0x2AAAAAAAAAAAAAABLL) >> 64) / 6;
    v9 = objc_loadWeakRetained((id *)p_carouselController);
    objc_msgSend(v9, "preferredCellHeight");
    v11 = (double)v8 + (double)v8 + v10 * (double)(v8 + 1);
  }
  else
  {
    objc_msgSend(WeakRetained, "preferredCellHeight");
    v13 = v12 + self->_sectionInset.top + self->_sectionInset.bottom;

    v9 = (id)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption2));
    objc_msgSend(v9, "_mapkit_scaledValueForValue:", v13);
    v11 = v14;
  }

  return v11;
}

- (void)_contentSizeDidChange
{
  id WeakRetained;
  unsigned __int8 v4;
  void *v5;

  if (!MapsFeature_IsEnabled_SydneyARP(self, a2)
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_carouselController),
        v4 = objc_msgSend(WeakRetained, "photoSliderShouldEnablePagingScroll"),
        WeakRetained,
        (v4 & 1) == 0))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselCell _horizontalCarouselLayout](self, "_horizontalCarouselLayout"));
    -[UICollectionView setCollectionViewLayout:](self->_collectionView, "setCollectionViewLayout:", v5);

  }
  -[UGCPhotoCarouselCell estimatedHeight](self, "estimatedHeight");
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");
}

- (void)_setupSubviews
{
  id v3;
  void *v4;
  UICollectionView *v5;
  UICollectionView *collectionView;
  uint64_t v7;
  UICollectionView *v8;
  id WeakRetained;
  void *v10;

  v3 = objc_alloc((Class)UICollectionView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselCell _horizontalCarouselLayout](self, "_horizontalCarouselLayout"));
  v5 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  collectionView = self->_collectionView;
  self->_collectionView = v5;

  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = sub_1002A8AA0(self);
  v8 = self->_collectionView;
  if (v7 == 5)
  {
    -[UICollectionView setScrollEnabled:](v8, "setScrollEnabled:", 0);
  }
  else
  {
    -[UICollectionView setAlwaysBounceVertical:](v8, "setAlwaysBounceVertical:", 0);
    -[UICollectionView setAlwaysBounceHorizontal:](self->_collectionView, "setAlwaysBounceHorizontal:", 1);
    -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_carouselController);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "collectionViewBackgroundColor"));
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v10);

  -[UICollectionView _setCornerRadius:](self->_collectionView, "_setCornerRadius:", 0.0);
  -[UGCPhotoCarouselCell addSubview:](self, "addSubview:", self->_collectionView);
}

- (void)_setupConstraints
{
  UGCPhotoCarouselCell *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  NSLayoutConstraint *heightConstraint;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *constraints;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_constraints);
  v3 = self;
  -[UGCPhotoCarouselCell estimatedHeight](v3, "estimatedHeight");
  if (!v3->_heightConstraint)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView heightAnchor](v3->_collectionView, "heightAnchor"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToConstant:", v5));
    heightConstraint = v3->_heightConstraint;
    v3->_heightConstraint = (NSLayoutConstraint *)v7;

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](v3->_collectionView, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselCell topAnchor](v3, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v23[0] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView leadingAnchor](v3->_collectionView, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselCell leadingAnchor](v3, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v23[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView trailingAnchor](v3->_collectionView, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselCell trailingAnchor](v3, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v23[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](v3->_collectionView, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselCell bottomAnchor](v3, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v23[3] = v15;
  v23[4] = v3->_heightConstraint;
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 5));
  constraints = self->_constraints;
  self->_constraints = v16;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);
}

- (void)_updateConstraints
{
  uint64_t v3;
  id WeakRetained;
  unsigned int v5;
  MUPagingScrollContainerView *v6;
  MUPagingScrollContainerView *pagingScrollView;
  MUPagingScrollContainerView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *heightConstraint;
  NSArray *v17;
  NSArray *constraints;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  if (sub_1002A8AA0(self) == 5 && MapsFeature_IsEnabled_SydneyARP(5, v3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_carouselController);
    v5 = objc_msgSend(WeakRetained, "photoSliderShouldEnablePagingScroll");

    if (v5)
    {
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_constraints);
      v6 = (MUPagingScrollContainerView *)objc_msgSend(objc_alloc((Class)MUPagingScrollContainerView), "initWithHorizontalScrollView:", self->_collectionView);
      pagingScrollView = self->_pagingScrollView;
      self->_pagingScrollView = v6;

      -[MUPagingScrollContainerView setAutomaticallyFlipsForRTL:](self->_pagingScrollView, "setAutomaticallyFlipsForRTL:", 1);
      v8 = self->_pagingScrollView;
      -[MUPagingScrollContainerView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UGCPhotoCarouselCell addSubview:](self, "addSubview:", v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MUPagingScrollContainerView leadingAnchor](v8, "leadingAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselCell leadingAnchor](self, "leadingAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
      v24[0] = v21;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MUPagingScrollContainerView topAnchor](v8, "topAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselCell topAnchor](self, "topAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
      v24[1] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MUPagingScrollContainerView trailingAnchor](v8, "trailingAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselCell trailingAnchor](self, "trailingAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
      v24[2] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MUPagingScrollContainerView bottomAnchor](v8, "bottomAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselCell bottomAnchor](self, "bottomAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
      heightConstraint = self->_heightConstraint;
      v24[3] = v15;
      v24[4] = heightConstraint;
      v17 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 5));
      constraints = self->_constraints;
      self->_constraints = v17;

      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);
    }
  }
}

- (id)_horizontalGridLayout
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 0.166666672));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", 49.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v2, v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "heightDimension"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v6, v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:repeatingSubitem:count:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v8, v5, 6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:", 1.0));
  objc_msgSend(v9, "setInterItemSpacing:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v9));
  objc_msgSend(v11, "setInterGroupSpacing:", 1.0);
  v12 = objc_msgSend(objc_alloc((Class)UICollectionViewCompositionalLayout), "initWithSection:", v11);

  return v12;
}

- (id)_horizontalCarouselLayout
{
  uint64_t v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  if (sub_1002A8AA0(self) == 5 && (MapsFeature_IsEnabled_SydneyARP(5, v3) & 1) == 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselCell _horizontalGridLayout](self, "_horizontalGridLayout"));
  }
  else
  {
    v4 = objc_alloc_init((Class)UICollectionViewFlowLayout);
    objc_msgSend(v4, "setScrollDirection:", 1);
    objc_msgSend(v4, "setMinimumInteritemSpacing:", 2.0);
    objc_msgSend(v4, "setSectionInset:", self->_sectionInset.top, self->_sectionInset.left, self->_sectionInset.bottom, self->_sectionInset.right);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption2));
    objc_msgSend(v5, "_mapkit_scaledValueForValue:", 90.0);
    v7 = v6;

    objc_msgSend(v4, "setItemSize:", v7, v7);
  }
  return v4;
}

- (void)setSectionInset:(UIEdgeInsets)a3
{
  if (self->_sectionInset.left != a3.left
    || self->_sectionInset.top != a3.top
    || self->_sectionInset.right != a3.right
    || self->_sectionInset.bottom != a3.bottom)
  {
    self->_sectionInset = a3;
    -[UGCPhotoCarouselCell _contentSizeDidChange](self, "_contentSizeDidChange");
  }
}

- (void)setCarouselController:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_carouselController);

  if (WeakRetained != v4)
  {
    v6 = objc_storeWeak((id *)&self->_carouselController, v4);
    objc_msgSend(v4, "setupCollectionView:", self->_collectionView);

    -[UGCPhotoCarouselCell estimatedHeight](self, "estimatedHeight");
    -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");
    if (sub_1002A8AA0(self) == 5)
    {
      objc_initWeak(&location, self);
      v7 = objc_loadWeakRetained((id *)&self->_carouselController);
      v8 = _NSConcreteStackBlock;
      v9 = 3221225472;
      v10 = sub_10090CF74;
      v11 = &unk_1011AD260;
      objc_copyWeak(&v12, &location);
      objc_msgSend(v7, "setChangeHandler:", &v8);

      -[UGCPhotoCarouselCell _contentSizeDidChange](self, "_contentSizeDidChange", v8, v9, v10, v11);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }

}

- (UGCPhotoCarouselController)carouselController
{
  return (UGCPhotoCarouselController *)objc_loadWeakRetained((id *)&self->_carouselController);
}

- (UIEdgeInsets)sectionInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sectionInset.top;
  left = self->_sectionInset.left;
  bottom = self->_sectionInset.bottom;
  right = self->_sectionInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_carouselController);
  objc_storeStrong((id *)&self->_pagingScrollView, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
