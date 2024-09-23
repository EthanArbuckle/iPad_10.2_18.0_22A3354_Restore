@implementation UGCPOIEnrichmentViewController

- (UGCPOIEnrichmentViewController)initWithPOIEnrichmentForm:(id)a3 presentationContext:(int64_t)a4
{
  id v7;
  UGCPOIEnrichmentViewController *v8;
  UGCPOIEnrichmentViewController *v9;
  void *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UGCPOIEnrichmentViewController;
  v8 = -[UGCPOIEnrichmentViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    v8->_scrollEnabled = 1;
    v8->_formInteractionEnabled = 1;
    objc_storeStrong((id *)&v8->_poiEnrichmentForm, a3);
    v9->_presentationContext = a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentForm photosForm](v9->_poiEnrichmentForm, "photosForm"));
    objc_msgSend(v10, "addObserver:", v9);

  }
  return v9;
}

- (NSArray)sectionControllers
{
  UGCRatingsSectionController *v3;
  void *v4;
  void *v5;
  UGCRatingsSectionController *v6;
  UGCRatingsSectionController *ratingsSectionController;
  UGCPhotosSectionController *v8;
  void *v9;
  void *v10;
  UGCPhotosSectionController *v11;
  UGCPhotosSectionController *photosSectionController;
  UGCUserInformationSectionController *v13;
  UGCUserInformationSectionController *userInfoSectionController;
  _BOOL8 v15;
  _BOOL4 v16;
  int IsEnabled_ARPCommunityID;
  unsigned int v18;
  UGCPhotosSectionController **v19;
  uint64_t v20;
  UGCPhotosSectionController *v21;
  UGCUserInformationSectionController *v22;
  UGCUserInformationSectionController *v23;
  UGCPhotosSectionController *v24;
  UGCRatingsSectionController *v25;
  void *v26;
  UGCPhotosSectionController *v27;
  unsigned __int8 v28;
  UGCPhotosSectionController *v29;
  UGCPhotosSectionController *v31;
  _QWORD v32[3];
  _QWORD v33[2];
  _QWORD v34[3];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];
  _QWORD v38[2];
  _QWORD v39[2];
  UGCPhotosSectionController *v40;

  if (!self->_ratingsSectionController)
  {
    v3 = [UGCRatingsSectionController alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentForm ratingsForm](self->_poiEnrichmentForm, "ratingsForm"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentForm mapItem](self->_poiEnrichmentForm, "mapItem"));
    v6 = -[UGCRatingsSectionController initWithRatingsForm:mapItem:analyticsDelegate:](v3, "initWithRatingsForm:mapItem:analyticsDelegate:", v4, v5, self);
    ratingsSectionController = self->_ratingsSectionController;
    self->_ratingsSectionController = v6;

    -[UGCRatingsSectionController setDelegate:](self->_ratingsSectionController, "setDelegate:", self);
  }
  if (!self->_photosSectionController)
  {
    v8 = [UGCPhotosSectionController alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentForm photosForm](self->_poiEnrichmentForm, "photosForm"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentForm mapItem](self->_poiEnrichmentForm, "mapItem"));
    v11 = -[UGCPhotosSectionController initWithPhotosForm:mapItem:presentingViewController:deferAddPhotoPresentationToParent:analyticsDelegate:showSuggestedPhotos:](v8, "initWithPhotosForm:mapItem:presentingViewController:deferAddPhotoPresentationToParent:analyticsDelegate:showSuggestedPhotos:", v9, v10, self, -[UGCPOIEnrichmentViewController defersPhotoPresentationToParent](self, "defersPhotoPresentationToParent"), self, !self->_isInlineMode);
    photosSectionController = self->_photosSectionController;
    self->_photosSectionController = v11;

    -[UGCPhotosSectionController setDelegate:](self->_photosSectionController, "setDelegate:", self);
  }
  if (!self->_userInfoSectionController)
  {
    v13 = -[UGCUserInformationSectionController initWithInsetGrouped:]([UGCUserInformationSectionController alloc], "initWithInsetGrouped:", -[UGCPOIEnrichmentViewController useTopPromotedAndInsetGroupedNutritionLabel](self, "useTopPromotedAndInsetGroupedNutritionLabel"));
    userInfoSectionController = self->_userInfoSectionController;
    self->_userInfoSectionController = v13;

    -[UGCUserInformationSectionController setDelegate:](self->_userInfoSectionController, "setDelegate:", self);
  }
  v15 = -[UGCPOIEnrichmentViewController suppressRatings](self, "suppressRatings");
  v16 = v15;
  IsEnabled_ARPCommunityID = MapsFeature_IsEnabled_ARPCommunityID(v15);
  v18 = -[UGCPOIEnrichmentViewController useTopPromotedAndInsetGroupedNutritionLabel](self, "useTopPromotedAndInsetGroupedNutritionLabel");
  if (!IsEnabled_ARPCommunityID)
  {
    if (v18)
    {
      if (v16)
      {
        v21 = self->_photosSectionController;
        v35[0] = self->_userInfoSectionController;
        v35[1] = v21;
        v19 = (UGCPhotosSectionController **)v35;
LABEL_19:
        v20 = 2;
        return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, v20));
      }
      v25 = self->_ratingsSectionController;
      v34[0] = self->_userInfoSectionController;
      v34[1] = v25;
      v34[2] = self->_photosSectionController;
      v19 = (UGCPhotosSectionController **)v34;
    }
    else
    {
      if (v16)
      {
        v23 = self->_userInfoSectionController;
        v33[0] = self->_photosSectionController;
        v33[1] = v23;
        v19 = (UGCPhotosSectionController **)v33;
        goto LABEL_19;
      }
      v27 = self->_photosSectionController;
      v32[0] = self->_ratingsSectionController;
      v32[1] = v27;
      v32[2] = self->_userInfoSectionController;
      v19 = (UGCPhotosSectionController **)v32;
    }
LABEL_26:
    v20 = 3;
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, v20));
  }
  if (!v18)
  {
    if (v16)
    {
      v22 = self->_userInfoSectionController;
      v38[0] = self->_photosSectionController;
      v38[1] = v22;
      v19 = (UGCPhotosSectionController **)v38;
      goto LABEL_19;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentForm photosForm](self->_poiEnrichmentForm, "photosForm"));
    if (objc_msgSend(v26, "numberOfAddedPhotos"))
    {

    }
    else
    {
      v28 = -[UGCPOIEnrichmentViewController hasTransitionedToPhotoCarousel](self, "hasTransitionedToPhotoCarousel");

      if ((v28 & 1) == 0)
      {
        v31 = self->_photosSectionController;
        v36[0] = self->_ratingsSectionController;
        v36[1] = v31;
        v19 = (UGCPhotosSectionController **)v36;
        goto LABEL_19;
      }
    }
    v29 = self->_photosSectionController;
    v37[0] = self->_ratingsSectionController;
    v37[1] = v29;
    v37[2] = self->_userInfoSectionController;
    v19 = (UGCPhotosSectionController **)v37;
    goto LABEL_26;
  }
  if (!v16)
  {
    v24 = self->_photosSectionController;
    v39[0] = self->_ratingsSectionController;
    v39[1] = v24;
    v19 = (UGCPhotosSectionController **)v39;
    goto LABEL_19;
  }
  v40 = self->_photosSectionController;
  v19 = &v40;
  v20 = 1;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, v20));
}

- (void)_setupSubviews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double y;
  double width;
  double height;
  UIScrollView *v10;
  UIScrollView *scrollView;
  uint64_t v12;
  UIScrollView *v13;
  void *v14;
  UIView *v15;
  UIView *contentView;
  MUStackLayout *v17;
  MUStackLayout *stackLayout;

  -[UGCPOIEnrichmentViewController _mapsui_resetViewLayoutMargins](self, "_mapsui_resetViewLayoutMargins");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self, "view"));
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("UGCPOIEnrichmentView"));

  v6 = objc_alloc((Class)UIScrollView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v10 = (UIScrollView *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  scrollView = self->_scrollView;
  self->_scrollView = v10;

  -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", self->_scrollEnabled);
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[UIScrollView _mapsui_resetLayoutMargins](self->_scrollView, "_mapsui_resetLayoutMargins");
  v12 = sub_1002A8AA0(self);
  v13 = self->_scrollView;
  if (v12 == 5)
  {
    -[UIScrollView setPreservesSuperviewLayoutMargins:](v13, "setPreservesSuperviewLayoutMargins:", 1);
  }
  else
  {
    -[UIScrollView setPreservesSuperviewLayoutMargins:](v13, "setPreservesSuperviewLayoutMargins:", 0);
    -[UIScrollView setDirectionalLayoutMargins:](self->_scrollView, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
    -[UIScrollView setContentInsetAdjustmentBehavior:](self->_scrollView, "setContentInsetAdjustmentBehavior:", 3);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self, "view"));
  objc_msgSend(v14, "addSubview:", self->_scrollView);

  v15 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  contentView = self->_contentView;
  self->_contentView = v15;

  -[UIView _mapsui_resetLayoutMarginsWithPreservesSuperview:](self->_contentView, "_mapsui_resetLayoutMarginsWithPreservesSuperview:", 1);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_contentView);
  v17 = (MUStackLayout *)objc_msgSend(objc_alloc((Class)MUStackLayout), "initWithContainer:axis:", self->_contentView, 1);
  stackLayout = self->_stackLayout;
  self->_stackLayout = v17;

  -[UGCPOIEnrichmentViewController _updateRowItems](self, "_updateRowItems");
  -[UGCPOIEnrichmentViewController _updateScrollViewHairlinesAnimated:](self, "_updateScrollViewHairlinesAnimated:", 0);
}

- (void)_setupConstraints
{
  id v3;
  UIScrollView *scrollView;
  void *v5;
  id v6;
  id v7;
  UIView *contentView;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];

  v3 = objc_alloc((Class)MUEdgeLayout);
  scrollView = self->_scrollView;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self, "view"));
  v6 = objc_msgSend(v3, "initWithItem:container:", scrollView, v5);

  v7 = objc_alloc((Class)MUEdgeLayout);
  contentView = self->_contentView;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide"));
  v10 = objc_msgSend(v7, "initWithItem:container:", contentView, v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "widthAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView frameLayoutGuide](self->_scrollView, "frameLayoutGuide"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "widthAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));

  v19[0] = self->_stackLayout;
  v19[1] = v6;
  v19[2] = v10;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 3));
  v18 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  +[NSLayoutConstraint _mapsui_activateLayouts:constraints:](NSLayoutConstraint, "_mapsui_activateLayouts:constraints:", v16, v17);

}

- (void)_updateConstraints
{
  _BOOL4 scrollEnabled;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *heightConstraint;
  double v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *v12;

  -[NSLayoutConstraint setActive:](self->_heightConstraint, "setActive:", 0);
  scrollEnabled = self->_scrollEnabled;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView frameLayoutGuide](self->_scrollView, "frameLayoutGuide"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "heightAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  if (scrollEnabled)
  {
    v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintGreaterThanOrEqualToAnchor:", v7));
    heightConstraint = self->_heightConstraint;
    self->_heightConstraint = v8;

    LODWORD(v10) = 1112276992;
    -[NSLayoutConstraint setPriority:](self->_heightConstraint, "setPriority:", v10);
  }
  else
  {
    v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
    v12 = self->_heightConstraint;
    self->_heightConstraint = v11;

  }
  -[NSLayoutConstraint setActive:](self->_heightConstraint, "setActive:", 1);
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];

  v12.receiver = self;
  v12.super_class = (Class)UGCPOIEnrichmentViewController;
  -[UGCPOIEnrichmentViewController viewDidLoad](&v12, "viewDidLoad");
  -[UGCPOIEnrichmentViewController _setupSubviews](self, "_setupSubviews");
  -[UGCPOIEnrichmentViewController _setupConstraints](self, "_setupConstraints");
  -[UGCPOIEnrichmentViewController _updateConstraints](self, "_updateConstraints");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController sectionControllers](self, "sectionControllers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "setFormInteractionEnabled:", self->_formInteractionEnabled);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

  if (!-[UGCPOIEnrichmentViewController isInlineMode](self, "isInlineMode"))
    -[UGCPOIEnrichmentViewController captureUserAction:](self, "captureUserAction:", 2142);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UGCPOIEnrichmentViewController;
  -[UGCPOIEnrichmentViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[UGCPOIEnrichmentViewController _updateScrollViewHairlinesAnimated:](self, "_updateScrollViewHairlinesAnimated:", 0);
}

- (void)setIsInlineMode:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_isInlineMode = a3;
  -[UGCPOIEnrichmentViewController setScrollEnabled:](self, "setScrollEnabled:", !a3);
  -[UGCPOIEnrichmentViewController setDefersPhotoPresentationToParent:](self, "setDefersPhotoPresentationToParent:", v3);
  -[UGCPOIEnrichmentViewController setUseTopPromotedAndInsetGroupedNutritionLabel:](self, "setUseTopPromotedAndInsetGroupedNutritionLabel:", v3);
}

- (void)setScrollEnabled:(BOOL)a3
{
  if (self->_scrollEnabled != a3)
  {
    self->_scrollEnabled = a3;
    if (-[UGCPOIEnrichmentViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", self->_scrollEnabled);
      -[UGCPOIEnrichmentViewController _updateConstraints](self, "_updateConstraints");
    }
    -[UGCPOIEnrichmentViewController _updateScrollViewHairlinesAnimated:](self, "_updateScrollViewHairlinesAnimated:", 0);
  }
}

- (void)setFormInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (self->_formInteractionEnabled != a3)
  {
    v3 = a3;
    self->_formInteractionEnabled = a3;
    if (-[UGCPOIEnrichmentViewController isViewLoaded](self, "isViewLoaded"))
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController sectionControllers](self, "sectionControllers", 0));
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "setFormInteractionEnabled:", v3);
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
  }
}

- (void)_updateRowItems
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  MUStackLayout *stackLayout;
  MUStackLayout *v16;
  double v17;
  void *v18;
  id v19;
  MUStackLayout *v20;
  void *v21;
  void *v22;
  double top;
  double leading;
  double bottom;
  double trailing;
  NSArray *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  void *v32;
  NSArray *v33;
  NSArray *rowViews;
  id obj;
  uint64_t v36;
  id v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[MUStackLayout prepare](self->_stackLayout, "prepare");
  -[MUStackLayout setArrangedLayoutItems:](self->_stackLayout, "setArrangedLayoutItems:", &__NSArray0__struct);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController sectionControllers](self, "sectionControllers"));
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v48;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v48 != v36)
          objc_enumerationMutation(obj);
        v38 = v4;
        v5 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v4);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rowItems"));
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(_QWORD *)v44 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rowView"));
              if ((objc_msgSend(v12, "isHidden") & 1) == 0)
              {
                objc_msgSend(v12, "setPreservesSuperviewLayoutMargins:", 1);
                objc_msgSend(v3, "addObject:", v12);
                -[UIView addSubview:](self->_contentView, "addSubview:", v12);
                -[MUStackLayout addArrangedLayoutItem:](self->_stackLayout, "addArrangedLayoutItem:", v12);
                objc_msgSend(v11, "bottomSpacing");
                if (v13 > 0.0)
                {
                  v14 = v3;
                  stackLayout = self->_stackLayout;
                  objc_msgSend(v11, "bottomSpacing");
                  v16 = stackLayout;
                  v3 = v14;
                  -[MUStackLayout setPadding:forArrangedLayoutItem:](v16, "setPadding:forArrangedLayoutItem:", v12, 0.0, 0.0, v17, 0.0);
                }
              }

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          }
          while (v8);
        }

        v4 = v38 + 1;
      }
      while ((id)(v38 + 1) != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v37);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MUStackLayout arrangedLayoutItems](self->_stackLayout, "arrangedLayoutItems"));
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    if (self->_scrollEnabled && sub_1002A8AA0(self) != 5)
    {
      v20 = self->_stackLayout;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MUStackLayout arrangedLayoutItems](v20, "arrangedLayoutItems"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastObject"));
      top = 0.0;
      leading = 0.0;
      bottom = 12.0;
      trailing = 0.0;
    }
    else
    {
      v20 = self->_stackLayout;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MUStackLayout arrangedLayoutItems](v20, "arrangedLayoutItems"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastObject"));
      top = NSDirectionalEdgeInsetsZero.top;
      leading = NSDirectionalEdgeInsetsZero.leading;
      bottom = NSDirectionalEdgeInsetsZero.bottom;
      trailing = NSDirectionalEdgeInsetsZero.trailing;
    }
    -[MUStackLayout setPadding:forArrangedLayoutItem:](v20, "setPadding:forArrangedLayoutItem:", v22, top, leading, bottom, trailing);

  }
  -[MUStackLayout activate](self->_stackLayout, "activate");
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v27 = self->_rowViews;
  v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(_QWORD *)v40 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)j);
        if ((objc_msgSend(v3, "containsObject:", v32) & 1) == 0)
          objc_msgSend(v32, "removeFromSuperview");
      }
      v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v29);
  }

  v33 = (NSArray *)objc_msgSend(v3, "copy");
  rowViews = self->_rowViews;
  self->_rowViews = v33;

}

- (void)_updateScrollViewHairlinesAnimated:(BOOL)a3
{
  _BOOL8 v3;
  UGCHairlineView *topScrollHairline;
  UGCHairlineView *v6;
  UGCHairlineView *v7;
  void *v8;
  id v9;
  UGCHairlineView *v10;
  UGCHairlineView *v11;
  UGCHairlineView *v12;
  UGCHairlineView *bottomScrollHairline;
  void *v14;
  id v15;
  unsigned __int8 v16;
  double v17;
  double v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];

  v3 = a3;
  if (-[UGCPOIEnrichmentViewController isViewLoaded](self, "isViewLoaded"))
  {
    topScrollHairline = self->_topScrollHairline;
    if (self->_scrollEnabled)
    {
      if (!topScrollHairline)
      {
        v6 = -[UGCHairlineView initWithFrame:]([UGCHairlineView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        v7 = self->_topScrollHairline;
        self->_topScrollHairline = v6;

        v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self, "view"));
        objc_msgSend(v8, "addSubview:", self->_topScrollHairline);

        v9 = objc_msgSend(objc_alloc((Class)MUEdgeLayout), "initWithItem:container:", self->_topScrollHairline, self->_scrollView);
        objc_msgSend(v9, "setEdges:", 11);
        objc_msgSend(v9, "activate");

      }
      if (!self->_bottomScrollHairline)
      {
        v12 = -[UGCHairlineView initWithFrame:]([UGCHairlineView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        bottomScrollHairline = self->_bottomScrollHairline;
        self->_bottomScrollHairline = v12;

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self, "view"));
        objc_msgSend(v14, "addSubview:", self->_bottomScrollHairline);

        v15 = objc_msgSend(objc_alloc((Class)MUEdgeLayout), "initWithItem:container:", self->_bottomScrollHairline, self->_scrollView);
        objc_msgSend(v15, "setEdges:", 14);
        objc_msgSend(v15, "activate");

      }
      v16 = -[UIScrollView _maps_edgesObscuringContentIncludingContentInsets:](self->_scrollView, "_maps_edgesObscuringContentIncludingContentInsets:", 0);
      v21[4] = self;
      v22[0] = _NSConcreteStackBlock;
      if ((v16 & 1) != 0)
        v17 = 1.0;
      else
        v17 = 0.0;
      v22[1] = 3221225472;
      v22[2] = sub_10079F468;
      v22[3] = &unk_1011B22D8;
      v22[4] = self;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10079F47C;
      v21[3] = &unk_1011B2300;
      +[UIScrollView _maps_updateHairlineAlpha:animated:getter:setter:](UIScrollView, "_maps_updateHairlineAlpha:animated:getter:setter:", v3, v22, v21, v17);
      if ((v16 & 4) != 0)
        v18 = 1.0;
      else
        v18 = 0.0;
      v19[4] = self;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10079F490;
      v20[3] = &unk_1011B22D8;
      v20[4] = self;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10079F4A4;
      v19[3] = &unk_1011B2300;
      +[UIScrollView _maps_updateHairlineAlpha:animated:getter:setter:](UIScrollView, "_maps_updateHairlineAlpha:animated:getter:setter:", v3, v20, v19, v18);
    }
    else
    {
      -[UGCHairlineView removeFromSuperview](topScrollHairline, "removeFromSuperview");
      v10 = self->_topScrollHairline;
      self->_topScrollHairline = 0;

      -[UGCHairlineView removeFromSuperview](self->_bottomScrollHairline, "removeFromSuperview");
      v11 = self->_bottomScrollHairline;
      self->_bottomScrollHairline = 0;

    }
  }
}

- (void)submissionFinishedWithError:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (!a3)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController sectionControllers](self, "sectionControllers", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "handleSuccessfulSubmission");
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)sectionControllerDidUpdateRowItems:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[UGCPOIEnrichmentViewController _updateRowItems](self, "_updateRowItems", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "contentDidUpdate");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController delegate](self, "delegate"));
    objc_msgSend(v6, "contentDidUpdate");

  }
}

- (void)photosSectionController:(id)a3 willShowPhotoCarousel:(BOOL)a4
{
  if (-[UGCPOIEnrichmentViewController hasTransitionedToPhotoCarousel](self, "hasTransitionedToPhotoCarousel", a3) != a4)
  {
    -[UGCPOIEnrichmentViewController setHasTransitionedToPhotoCarousel:](self, "setHasTransitionedToPhotoCarousel:", 1);
    -[UGCPOIEnrichmentViewController _updateRowItems](self, "_updateRowItems");
  }
}

- (void)sectionControllerRequestsLegalAttribution:(id)a3
{
  uint64_t String;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  String = GEOConfigGetString(MapsConfig_LagunaBeachUserSubmissionTermsOfServiceURL, off_1014B3B78);
  v5 = objc_claimAutoreleasedReturnValue(String);
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController delegate](self, "delegate"));
  LOBYTE(v5) = objc_opt_respondsToSelector(v6, "poiEnrichmentViewController:didSelectTermsOfServiceURL:");

  if ((v5 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController delegate](self, "delegate"));
    objc_msgSend(v7, "poiEnrichmentViewController:didSelectTermsOfServiceURL:", self, v8);
  }
  else
  {
    v7 = objc_msgSend(objc_alloc((Class)SFSafariViewController), "initWithURL:", v8);
    -[UGCPOIEnrichmentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }

}

- (void)ratingsSectionController:(id)a3 presentInformedConsentIfNeededWithCompletion:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void (**v8)(id, uint64_t);

  v8 = (void (**)(id, uint64_t))a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "poiEnrichmentViewController:presentInformedConsentIfNeededWithCompletion:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController delegate](self, "delegate"));
    objc_msgSend(v7, "poiEnrichmentViewController:presentInformedConsentIfNeededWithCompletion:", self, v8);

  }
  else if (v8)
  {
    v8[2](v8, 1);
  }

}

- (void)ratingsSectionController:(id)a3 userActionCapturedForRatingCategoryState:(int64_t)a4 value:(id)a5
{
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "poiEnrichmentViewController:captureUserActionForRatingCategoryState:value:target:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController delegate](self, "delegate"));
    objc_msgSend(v9, "poiEnrichmentViewController:captureUserActionForRatingCategoryState:value:target:", self, a4, v10, -[UGCPOIEnrichmentViewController currentTarget](self, "currentTarget"));

  }
}

- (void)photosSectionController:(id)a3 selectedAddPhotosUsingSourceType:(int64_t)a4 presentationOptions:(id)a5
{
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a5;
  if (-[UGCPOIEnrichmentViewController defersPhotoPresentationToParent](self, "defersPhotoPresentationToParent"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController delegate](self, "delegate"));
    v8 = objc_opt_respondsToSelector(v7, "poiEnrichmentViewController:didSelectAddPhotosUsingSourceType:presentationOptions:");

    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController delegate](self, "delegate"));
      objc_msgSend(v9, "poiEnrichmentViewController:didSelectAddPhotosUsingSourceType:presentationOptions:", self, a4, v10);

    }
  }

}

- (void)photosSectionController:(id)a3 userActionCapturedForAction:(int)a4 value:(id)a5
{
  uint64_t v5;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)&a4;
  v10 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "poiEnrichmentViewController:captureUserAction:value:target:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController delegate](self, "delegate"));
    objc_msgSend(v9, "poiEnrichmentViewController:captureUserAction:value:target:", self, v5, v10, -[UGCPOIEnrichmentViewController currentTarget](self, "currentTarget"));

  }
}

- (int)currentTarget
{
  unint64_t v2;

  v2 = -[UGCPOIEnrichmentViewController presentationContext](self, "presentationContext");
  if (v2 > 2)
    return 0;
  else
    return dword_100E3A538[v2];
}

- (void)captureUserAction:(int)a3
{
  -[UGCPOIEnrichmentViewController captureUserAction:withValue:](self, "captureUserAction:withValue:", *(_QWORD *)&a3, 0);
}

- (void)captureUserAction:(int)a3 withValue:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v4, -[UGCPOIEnrichmentViewController currentTarget](self, "currentTarget"), v6);

}

- (void)scrollViewDidScroll:(id)a3
{
  -[UGCPOIEnrichmentViewController _updateScrollViewHairlinesAnimated:](self, "_updateScrollViewHairlinesAnimated:", 1);
}

- (UGCPOIEnrichmentViewControllerDelegate)delegate
{
  return (UGCPOIEnrichmentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)presentationContext
{
  return self->_presentationContext;
}

- (BOOL)isScrollEnabled
{
  return self->_scrollEnabled;
}

- (BOOL)isInlineMode
{
  return self->_isInlineMode;
}

- (BOOL)defersPhotoPresentationToParent
{
  return self->_defersPhotoPresentationToParent;
}

- (void)setDefersPhotoPresentationToParent:(BOOL)a3
{
  self->_defersPhotoPresentationToParent = a3;
}

- (BOOL)useTopPromotedAndInsetGroupedNutritionLabel
{
  return self->_useTopPromotedAndInsetGroupedNutritionLabel;
}

- (void)setUseTopPromotedAndInsetGroupedNutritionLabel:(BOOL)a3
{
  self->_useTopPromotedAndInsetGroupedNutritionLabel = a3;
}

- (BOOL)suppressRatings
{
  return self->_suppressRatings;
}

- (void)setSuppressRatings:(BOOL)a3
{
  self->_suppressRatings = a3;
}

- (BOOL)deferPhotoPresentationToParent
{
  return self->_deferPhotoPresentationToParent;
}

- (void)setDeferPhotoPresentationToParent:(BOOL)a3
{
  self->_deferPhotoPresentationToParent = a3;
}

- (BOOL)formInteractionEnabled
{
  return self->_formInteractionEnabled;
}

- (BOOL)hasTransitionedToPhotoCarousel
{
  return self->_hasTransitionedToPhotoCarousel;
}

- (void)setHasTransitionedToPhotoCarousel:(BOOL)a3
{
  self->_hasTransitionedToPhotoCarousel = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomScrollHairline, 0);
  objc_storeStrong((id *)&self->_topScrollHairline, 0);
  objc_storeStrong((id *)&self->_userInfoSectionController, 0);
  objc_storeStrong((id *)&self->_photosSectionController, 0);
  objc_storeStrong((id *)&self->_ratingsSectionController, 0);
  objc_storeStrong((id *)&self->_poiEnrichmentForm, 0);
  objc_storeStrong((id *)&self->_rowViews, 0);
  objc_storeStrong((id *)&self->_stackLayout, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

- (void)logCancelAction
{
  -[UGCPOIEnrichmentViewController captureUserAction:](self, "captureUserAction:", 2135);
}

- (void)logDoneAction
{
  -[UGCPOIEnrichmentViewController captureUserAction:](self, "captureUserAction:", 2133);
}

@end
