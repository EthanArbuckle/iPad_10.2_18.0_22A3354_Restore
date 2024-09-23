@implementation HomeCuratedCollectionsTableViewCell

+ (NSString)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1);
  return NSStringFromClass(v2);
}

+ (double)cellHeightWithTraitCollection:(id)a3 includeExploreGuidesHeight:(BOOL)a4 collectionCount:(unint64_t)a5
{
  double result;

  +[MKCollectionsCarouselView horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:](MKCollectionsCarouselView, "horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:", 7, a4, a5 == 1);
  return result;
}

+ (double)estimatedCellHeight
{
  return 202.0;
}

- (HomeCuratedCollectionsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  HomeCuratedCollectionsTableViewCell *v7;
  HomeCuratedCollectionsTableViewCell *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HomeCuratedCollectionsTableViewCell;
  v7 = -[MapsThemeTableViewCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, v6);
  v8 = v7;
  if (v7)
  {
    -[HomeCuratedCollectionsTableViewCell setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[HomeCuratedCollectionsTableViewCell setBackgroundColor:](v8, "setBackgroundColor:", v9);

  }
  return v8;
}

- (void)setCellModel:(id)a3
{
  HomeCuratedCollectionsTableViewCellModel *v5;
  HomeCuratedCollectionsTableViewCellModel *v6;
  HomeCuratedCollectionsTableViewCellModel **p_cellModel;
  void *v8;
  MKCollectionsCarouselView *carouselView;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MKCollectionsCarouselView *v16;
  MKCollectionsCarouselView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];

  v5 = (HomeCuratedCollectionsTableViewCellModel *)a3;
  v6 = v5;
  p_cellModel = &self->_cellModel;
  if (self->_cellModel != v5 && !-[HomeCuratedCollectionsTableViewCellModel isEqual:](v5, "isEqual:"))
  {
    if (*p_cellModel)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsTableViewCellModel observers](*p_cellModel, "observers"));
      objc_msgSend(v8, "unregisterObserver:", self);

      -[MKCollectionsCarouselView removeFromSuperview](self->_carouselView, "removeFromSuperview");
      carouselView = self->_carouselView;
      self->_carouselView = 0;

    }
    objc_storeStrong((id *)&self->_cellModel, a3);
    if (*p_cellModel)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsTableViewCellModel observers](*p_cellModel, "observers"));
      objc_msgSend(v10, "registerObserver:", self);

      v11 = objc_alloc((Class)MKCollectionsCarouselView);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsTableViewCellModel syncCoordinator](*p_cellModel, "syncCoordinator"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsTableViewCellModel delegate](*p_cellModel, "delegate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsTableViewCellModel delegate](*p_cellModel, "delegate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsTableViewCellModel exploreGuides](*p_cellModel, "exploreGuides"));
      v16 = (MKCollectionsCarouselView *)objc_msgSend(v11, "initCollectionsCarouselViewWithContext:withPlaceCollections:usingSyncCoordinator:withRoutingDelegate:withScrollViewDelegate:withAnalyticsDelegate:exploreGuides:", 7, &__NSArray0__struct, v12, v13, 0, v14, v15);
      v17 = self->_carouselView;
      self->_carouselView = v16;

      -[MKCollectionsCarouselView setTranslatesAutoresizingMaskIntoConstraints:](self->_carouselView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[MKCollectionsCarouselView setAccessibilityIdentifier:](self->_carouselView, "setAccessibilityIdentifier:", CFSTR("HomeCuratedCollectionsCarousel"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsTableViewCell contentView](self, "contentView"));
      objc_msgSend(v18, "addSubview:", self->_carouselView);

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[MKCollectionsCarouselView topAnchor](self->_carouselView, "topAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsTableViewCell contentView](self, "contentView"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "topAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
      v41[0] = v37;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MKCollectionsCarouselView leadingAnchor](self->_carouselView, "leadingAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsTableViewCell contentView](self, "contentView"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, 0.0));
      v41[1] = v33;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MKCollectionsCarouselView trailingAnchor](self->_carouselView, "trailingAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsTableViewCell contentView](self, "contentView"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, -0.0));
      v41[2] = v29;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MKCollectionsCarouselView bottomAnchor](self->_carouselView, "bottomAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsTableViewCell contentView](self, "contentView"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v19));
      v41[3] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MKCollectionsCarouselView heightAnchor](self->_carouselView, "heightAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsTableViewCellModel exploreGuides](*p_cellModel, "exploreGuides"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsTableViewCell cellModel](self, "cellModel"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "curatedCollections"));
      +[MKCollectionsCarouselView horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:](MKCollectionsCarouselView, "horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:", 7, v22 != 0, objc_msgSend(v24, "count") == (id)1);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToConstant:"));
      v41[4] = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 5));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

      -[HomeCuratedCollectionsTableViewCell _updateAnimated:](self, "_updateAnimated:", 0);
    }
  }

}

- (void)resetScrollOffset
{
  -[MKCollectionsCarouselView resetScrollOffset](self->_carouselView, "resetScrollOffset");
}

- (void)_updateAnimated:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsTableViewCellModel curatedCollections](self->_cellModel, "curatedCollections", a3));
  v5 = (void *)v4;
  v6 = &__NSArray0__struct;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  -[MKCollectionsCarouselView updateCollections:](self->_carouselView, "updateCollections:", v7);
  -[MKCollectionsCarouselView displayCollections](self->_carouselView, "displayCollections");
}

- (id)accessibilityIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self);
  return NSStringFromClass(v2);
}

- (void)cellModelDidUpdate:(id)a3
{
  -[HomeCuratedCollectionsTableViewCell _updateAnimated:](self, "_updateAnimated:", 1);
}

- (HomeCuratedCollectionsTableViewCellModel)cellModel
{
  return self->_cellModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);
  objc_storeStrong((id *)&self->_carouselView, 0);
}

@end
