@implementation RelatedCollectionsSectionTableViewCell

- (RelatedCollectionsSectionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RelatedCollectionsSectionTableViewCell *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RelatedCollectionsSectionTableViewCell;
  v4 = -[RelatedSectionTableViewCell initWithStyle:reuseIdentifier:](&v8, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v6, "setBackgroundColor:", v5);

  }
  return v4;
}

- (void)setPlaceCollections:(id)a3 delegate:(id)a4
{
  unint64_t count;
  id v7;
  NSArray *v8;
  NSArray *placeCollections;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_storeWeak((id *)&self->_delegate, a4);
  count = self->_count;
  v7 = objc_msgSend(v14, "count");
  v8 = (NSArray *)objc_msgSend(v14, "copy");
  placeCollections = self->_placeCollections;
  self->_placeCollections = v8;

  self->_count = -[NSArray count](self->_placeCollections, "count");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell carouselView](self, "carouselView"));

  if ((id)count != v7)
  {
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell carouselView](self, "carouselView"));
      objc_msgSend(v12, "removeFromSuperview");

    }
    goto LABEL_6;
  }
  if (!v10)
  {
LABEL_6:
    -[RelatedCollectionsSectionTableViewCell initializeCarouselUsingPlaceCollection:carouselRoutingDelegate:](self, "initializeCarouselUsingPlaceCollection:carouselRoutingDelegate:", v14, self);
    goto LABEL_7;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell carouselView](self, "carouselView"));
  objc_msgSend(v11, "updateCollections:", self->_placeCollections);

LABEL_7:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell carouselView](self, "carouselView"));
  objc_msgSend(v13, "displayCollections");

}

- (void)initializeCarouselUsingPlaceCollection:(id)a3 carouselRoutingDelegate:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSArray *placeCollections;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
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
  _QWORD v40[5];

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)MKCollectionsCarouselView);
  placeCollections = self->_placeCollections;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  v11 = objc_msgSend(v8, "initCollectionsCarouselViewWithContext:withPlaceCollections:usingSyncCoordinator:withRoutingDelegate:withScrollViewDelegate:withAnalyticsDelegate:exploreGuides:", 4, placeCollections, v10, v6, self, self, 0);

  -[RelatedCollectionsSectionTableViewCell setCarouselView:](self, "setCarouselView:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell carouselView](self, "carouselView"));
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell contentView](self, "contentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell carouselView](self, "carouselView"));
  objc_msgSend(v13, "addSubview:", v14);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell carouselView](self, "carouselView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell contentView](self, "contentView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v40[0] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell carouselView](self, "carouselView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell contentView](self, "contentView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v40[1] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell carouselView](self, "carouselView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSectionTableViewCell sectionNameLabel](self, "sectionNameLabel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v40[2] = v25;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell carouselView](self, "carouselView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  v40[3] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell carouselView](self, "carouselView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "heightAnchor"));
  v22 = objc_msgSend(v7, "count");

  +[MKCollectionsCarouselView horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:](MKCollectionsCarouselView, "horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:", 4, 0, v22 == (id)1);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToConstant:"));
  v40[4] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RelatedCollectionsSectionTableViewCell;
  -[RelatedSectionTableViewCell prepareForReuse](&v3, "prepareForReuse");
  -[RelatedCollectionsSectionTableViewCell setPlaceCollections:](self, "setPlaceCollections:", 0);
  -[RelatedCollectionsSectionTableViewCell setDelegate:](self, "setDelegate:", 0);
}

+ (double)cellHeightWithCollectionsCount:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", UIFontTextStyleSubheadline));
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 20.0);
  v6 = v5;
  +[MKCollectionsCarouselView horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:](MKCollectionsCarouselView, "horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:", 4, 0, a3 == 1);
  v8 = v6 + v7 + 16.0;

  return v8;
}

- (void)routeToCuratedCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell delegate](self, "delegate"));
  objc_msgSend(v5, "relatedSectionRouteToCuratedCollection:", v4);

}

- (void)collectionsCarouselDidRouteToCollectionId:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell delegate](self, "delegate"));
  objc_msgSend(v9, "relatedSectionTappedOnCollectionId:atIndex:isSaved:", v8, a4, v5);

}

- (void)collectionsCarouselDidScrollForward
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell delegate](self, "delegate"));
  objc_msgSend(v2, "relatedSectionTableViewCellDidScrollForward");

}

- (void)collectionsCarouselDidScrollBackward
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RelatedCollectionsSectionTableViewCell delegate](self, "delegate"));
  objc_msgSend(v2, "relatedSectionTableViewCellDidScrollBackward");

}

- (MKCollectionsCarouselView)carouselView
{
  return self->_carouselView;
}

- (void)setCarouselView:(id)a3
{
  objc_storeStrong((id *)&self->_carouselView, a3);
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void)setPlaceCollections:(id)a3
{
  objc_storeStrong((id *)&self->_placeCollections, a3);
}

- (RelatedSectionTableViewCellDelegate)delegate
{
  return (RelatedSectionTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeCollections, 0);
  objc_storeStrong((id *)&self->_carouselView, 0);
}

@end
