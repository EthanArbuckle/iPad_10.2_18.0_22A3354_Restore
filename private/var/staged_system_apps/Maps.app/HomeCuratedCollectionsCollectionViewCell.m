@implementation HomeCuratedCollectionsCollectionViewCell

+ (double)estimatedCellHeight
{
  return 202.0;
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
  id v22;
  MKCollectionsCarouselView *v23;
  void *v24;
  id v25;
  id v26;
  MKCollectionsCarouselView *v27;
  id v28;
  void *v29;
  _QWORD v30[2];

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

      -[MKCollectionsCarouselView setAccessibilityIdentifier:](self->_carouselView, "setAccessibilityIdentifier:", CFSTR("HomeCuratedCollectionsCarousel"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsCollectionViewCell contentView](self, "contentView"));
      objc_msgSend(v18, "addSubview:", self->_carouselView);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsTableViewCellModel exploreGuides](*p_cellModel, "exploreGuides"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsCollectionViewCell cellModel](self, "cellModel"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "curatedCollections"));
      +[MKCollectionsCarouselView horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:](MKCollectionsCarouselView, "horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:", 7, v19 != 0, objc_msgSend(v21, "count") == (id)1);

      v22 = objc_alloc((Class)MUEdgeLayout);
      v23 = self->_carouselView;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsCollectionViewCell contentView](self, "contentView"));
      v25 = objc_msgSend(v22, "initWithItem:container:", v23, v24);

      v26 = objc_alloc((Class)MUSizeLayout);
      v27 = self->_carouselView;
      +[MUSizeLayout useIntrinsicContentSize](MUSizeLayout, "useIntrinsicContentSize");
      v28 = objc_msgSend(v26, "initWithItem:size:", v27);
      v30[0] = v25;
      v30[1] = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
      +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v29);

      -[HomeCuratedCollectionsCollectionViewCell _updateAnimated:](self, "_updateAnimated:", 0);
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

- (void)cellModelDidUpdate:(id)a3
{
  -[HomeCuratedCollectionsCollectionViewCell _updateAnimated:](self, "_updateAnimated:", 1);
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
