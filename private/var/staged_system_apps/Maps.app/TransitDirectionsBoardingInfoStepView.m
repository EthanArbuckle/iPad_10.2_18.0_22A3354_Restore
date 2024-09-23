@implementation TransitDirectionsBoardingInfoStepView

- (void)_createSubviews
{
  TransitDirectionsBoardingInfoListView *v3;
  TransitDirectionsBoardingInfoListView *boardingInfoListView;
  TransitDirectionsBoardingInfoListView *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  MUPagingScrollControlsView *scrollControlsView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TransitDirectionsBoardingInfoStepView;
  -[TransitDirectionsStepView _createSubviews](&v11, "_createSubviews");
  v3 = -[TransitDirectionsBoardingInfoListView initWithFrame:]([TransitDirectionsBoardingInfoListView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  boardingInfoListView = self->_boardingInfoListView;
  self->_boardingInfoListView = v3;

  -[TransitDirectionsBoardingInfoListView setTranslatesAutoresizingMaskIntoConstraints:](self->_boardingInfoListView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TransitDirectionsBoardingInfoListView setClipsToBounds:](self->_boardingInfoListView, "setClipsToBounds:", 0);
  -[TransitDirectionsBoardingInfoListView setTargetForAnalytics:](self->_boardingInfoListView, "setTargetForAnalytics:", 606);
  v5 = self->_boardingInfoListView;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TransitDirectionsBoardingInfoListView defaultFinalButtonTitle](TransitDirectionsBoardingInfoListView, "defaultFinalButtonTitle"));
  -[TransitDirectionsBoardingInfoListView setFinalButtonTitle:target:action:](v5, "setFinalButtonTitle:target:action:", v6, self, "_scheduleButtonTapped:");

  -[TransitDirectionsBoardingInfoStepView addSubview:](self, "addSubview:", self->_boardingInfoListView);
  if (sub_1002A8AA0(self) == 5)
  {
    v7 = objc_alloc((Class)MUPagingScrollControlsView);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoListView _scrollView](self->_boardingInfoListView, "_scrollView"));
    v9 = objc_msgSend(v7, "initWithHorizontalScrollView:", v8);

    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TransitDirectionsBoardingInfoStepView addSubview:](self, "addSubview:", v9);
    scrollControlsView = self->_scrollControlsView;
    self->_scrollControlsView = (MUPagingScrollControlsView *)v9;

  }
}

- (id)_initialConstraints
{
  id v3;
  void *v4;
  void *v5;
  MUPagingScrollControlsView *scrollControlsView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MUPagingScrollControlsView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  void *v36;
  void *v37;
  void *v38;
  id v39;
  objc_super v40;
  _QWORD v41[4];
  _QWORD v42[4];

  v40.receiver = self;
  v40.super_class = (Class)TransitDirectionsBoardingInfoStepView;
  v3 = -[TransitDirectionsStepView _initialConstraints](&v40, "_initialConstraints");
  v39 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoListView leadingAnchor](self->_boardingInfoListView, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
  v37 = v4;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:"));
  v42[0] = v32;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoListView topAnchor](self->_boardingInfoListView, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
  v31 = v5;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:"));
  v42[1] = v28;
  scrollControlsView = self->_scrollControlsView;
  if (scrollControlsView)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStepView trailingAnchor](self, "trailingAnchor"));
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoListView trailingAnchor](self->_boardingInfoListView, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  v42[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoListView bottomAnchor](self->_boardingInfoListView, "bottomAnchor"));
  -[TransitDirectionsBoardingInfoListView _contentBottomAnchorAdjustment](self->_boardingInfoListView, "_contentBottomAnchorAdjustment");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12));
  v42[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 4));
  objc_msgSend(v39, "addObjectsFromArray:", v14);

  if (!scrollControlsView)
  {

    v7 = v27;
  }

  v15 = self->_scrollControlsView;
  if (v15)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MUPagingScrollControlsView leadingAnchor](v15, "leadingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStepView leadingAnchor](self, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v36, 3.0));
    v41[0] = v34;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MUPagingScrollControlsView topAnchor](self->_scrollControlsView, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoListView topAnchor](self->_boardingInfoListView, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    v41[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStepView trailingAnchor](self, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MUPagingScrollControlsView trailingAnchor](self->_scrollControlsView, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 3.0));
    v41[2] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoListView bottomAnchor](self->_boardingInfoListView, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MUPagingScrollControlsView bottomAnchor](self->_scrollControlsView, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
    v41[3] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 4));
    objc_msgSend(v39, "addObjectsFromArray:", v25);

  }
  return v39;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsBoardingInfoStepView;
  -[TransitDirectionsStepView setHighlighted:](&v5, "setHighlighted:");
  -[TransitDirectionsBoardingInfoListView setHighlighted:](self->_boardingInfoListView, "setHighlighted:", v3);
}

- (void)_scheduleButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStepView boardingInfoDelegate](self, "boardingInfoDelegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentItem"));
  objc_msgSend(v6, "transitDirectionsBoardingInfoStepView:didSelectScheduleForItem:", self, v5);

}

- (void)configureWithItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  TransitDirectionsBoardingInfoListView *boardingInfoListView;
  _BOOL8 v13;
  void *v14;
  TransitDirectionsBoardingInfoListView *v15;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TransitDirectionsBoardingInfoStepView;
  -[TransitDirectionsStepView configureWithItem:](&v17, "configureWithItem:", v4);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "matchingRouteStep"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "segment"));
  v8 = objc_opt_class(GEOComposedTransitTripRouteSegment);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "transitLine"));
  boardingInfoListView = self->_boardingInfoListView;
  if (v11)
    v13 = objc_msgSend(v11, "departureTimeDisplayStyle") == (id)1;
  else
    v13 = 0;
  -[TransitDirectionsBoardingInfoListView setDropPastDepartures:](boardingInfoListView, "setDropPastDepartures:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "boardingInfo"));

  v15 = self->_boardingInfoListView;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "boardingInfo"));
    -[TransitDirectionsBoardingInfoListView setBoardingInfo:](v15, "setBoardingInfo:", v16);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preboardingStrings"));
    -[TransitDirectionsBoardingInfoListView setPreboardingStrings:](v15, "setPreboardingStrings:", v16);
  }

}

- (void)setUseNavigationMetrics:(BOOL)a3
{
  TransitDirectionsBoardingInfoListView *boardingInfoListView;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsBoardingInfoStepView;
  -[TransitDirectionsStepView setUseNavigationMetrics:](&v6, "setUseNavigationMetrics:", a3);
  boardingInfoListView = self->_boardingInfoListView;
  if (-[TransitDirectionsStepView useNavigationMetrics](self, "useNavigationMetrics"))
    v5 = 610;
  else
    v5 = 606;
  -[TransitDirectionsBoardingInfoListView setTargetForAnalytics:](boardingInfoListView, "setTargetForAnalytics:", v5);
}

- (void)_updateNavigationStateAlpha:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsBoardingInfoStepView;
  -[TransitDirectionsStepView _updateNavigationStateAlpha:](&v5, "_updateNavigationStateAlpha:");
  -[TransitDirectionsBoardingInfoListView setAlpha:](self->_boardingInfoListView, "setAlpha:", a3);
}

- (TransitDirectionsBoardingInfoStepViewDelegate)boardingInfoDelegate
{
  return (TransitDirectionsBoardingInfoStepViewDelegate *)objc_loadWeakRetained((id *)&self->_boardingInfoDelegate);
}

- (void)setBoardingInfoDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_boardingInfoDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_boardingInfoDelegate);
  objc_storeStrong((id *)&self->_scrollControlsView, 0);
  objc_storeStrong((id *)&self->_boardingInfoListView, 0);
}

@end
