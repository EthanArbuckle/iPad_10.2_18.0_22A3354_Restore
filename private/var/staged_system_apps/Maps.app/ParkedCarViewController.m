@implementation ParkedCarViewController

- (UIScrollViewDelegate)scrollViewDelegate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarViewController scrollView](self, "scrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  return (UIScrollViewDelegate *)v3;
}

- (void)setScrollViewDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ParkedCarViewController scrollView](self, "scrollView"));
  objc_msgSend(v5, "setDelegate:", v4);

}

- (double)heightForContentAboveTitle
{
  return 0.0;
}

+ (double)headerHeightInMinimalMode
{
  double result;

  +[MUPlaceHeaderView minimalModeHeight](MUPlaceHeaderView, "minimalModeHeight");
  return result;
}

- (void)hideTitle:(BOOL)a3
{
  -[ParkedCarHeaderSectionController hideTitle:](self->_headerSectionController, "hideTitle:", a3);
}

- (double)currentHeight
{
  double v2;

  -[MUScrollableStackView contentSize](self->_contentStackView, "contentSize");
  return v2;
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  -[MUScrollableStackView _mapsui_scrollToTopAnimated:](self->_contentStackView, "_mapsui_scrollToTopAnimated:", a3);
}

- (UIScrollView)scrollView
{
  -[ParkedCarViewController _loadStackViewIfNeeded](self, "_loadStackViewIfNeeded");
  return (UIScrollView *)self->_contentStackView;
}

- (void)setContentAlpha:(double)a3
{
  if (self->_contentAlpha != a3)
  {
    self->_contentAlpha = a3;
    -[ParkedCarViewController _loadStackViewIfNeeded](self, "_loadStackViewIfNeeded");
    -[ParkedCarViewController _updateContentAlpha:](self, "_updateContentAlpha:", self->_contentAlpha);
  }
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (void)_updateContentAlpha:(double)a3
{
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  ParkedCarHeaderSectionController *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_sectionControllers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(ParkedCarHeaderSectionController **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9);
        if (v10 != self->_headerSectionController)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarHeaderSectionController sectionView](v10, "sectionView", (_QWORD)v12));
          objc_msgSend(v11, "setAlpha:", a3);

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  ParkedCarHeaderButtonsSectionController *v6;
  ParkedCarDetailsSectionController *v7;
  ParkedCarFooterActionsSectionController *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  MUScrollableStackView *contentStackView;
  void *v15;
  ParkedCarHeaderSectionController *headerSectionController;
  ParkedCarHeaderSectionController *v17;
  ParkedCarDetailsSectionController *detailsSectionController;
  ParkedCarDetailsSectionController *v19;
  NSArray *v20;
  NSArray *sectionControllers;
  void *v22;
  ParkedCarHeaderSectionController *v23;
  ParkedCarHeaderButtonsSectionController *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];

  v29.receiver = self;
  v29.super_class = (Class)ParkedCarViewController;
  -[ParkedCarViewController viewDidLoad](&v29, "viewDidLoad");
  -[ParkedCarViewController _loadStackViewIfNeeded](self, "_loadStackViewIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarViewController view](self, "view"));
  objc_msgSend(v3, "addSubview:", self->_contentStackView);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarViewController view](self, "view"));
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("ParkedCarView"));

  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 4);
  v23 = -[ParkedCarHeaderSectionController initWithParkedCar:]([ParkedCarHeaderSectionController alloc], "initWithParkedCar:", self->_parkedCar);
  objc_msgSend(v5, "addObject:");
  v6 = -[ParkedCarHeaderButtonsSectionController initWithParkedCar:]([ParkedCarHeaderButtonsSectionController alloc], "initWithParkedCar:", self->_parkedCar);
  -[ParkedCarHeaderButtonsSectionController setActionDelegate:](v6, "setActionDelegate:", self);
  v24 = v6;
  objc_msgSend(v5, "addObject:", v6);
  v7 = -[ParkedCarDetailsSectionController initWithParkedCar:]([ParkedCarDetailsSectionController alloc], "initWithParkedCar:", self->_parkedCar);
  -[ParkedCarDetailsSectionController setTextFieldDelegate:](v7, "setTextFieldDelegate:", self);
  -[ParkedCarDetailsSectionController setDetailsDelegate:](v7, "setDetailsDelegate:", self);
  objc_msgSend(v5, "addObject:", v7);
  v8 = -[ParkedCarFooterActionsSectionController initWithParkedCar:]([ParkedCarFooterActionsSectionController alloc], "initWithParkedCar:", self->_parkedCar);
  -[ParkedCarFooterActionsSectionController setActionDelegate:](v8, "setActionDelegate:", self);
  objc_msgSend(v5, "addObject:", v8);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        contentStackView = self->_contentStackView;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v13), "sectionView"));
        -[MUScrollableStackView addArrangedSubview:](contentStackView, "addArrangedSubview:", v15);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v11);
  }

  headerSectionController = self->_headerSectionController;
  self->_headerSectionController = v23;
  v17 = v23;

  detailsSectionController = self->_detailsSectionController;
  self->_detailsSectionController = v7;
  v19 = v7;

  v20 = (NSArray *)objc_msgSend(v9, "copy");
  sectionControllers = self->_sectionControllers;
  self->_sectionControllers = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v22, "addObserver:selector:name:object:", self, "_locationApprovalDidChange:", MKLocationManagerApprovalDidChangeNotification, 0);

}

- (void)_loadStackViewIfNeeded
{
  MUScrollableStackView *v3;
  MUScrollableStackView *contentStackView;

  if (!self->_contentStackView)
  {
    v3 = (MUScrollableStackView *)objc_msgSend(objc_alloc((Class)MUScrollableStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    contentStackView = self->_contentStackView;
    self->_contentStackView = v3;

    -[MUScrollableStackView setSpacing:](self->_contentStackView, "setSpacing:", 16.0);
    -[MUScrollableStackView setAlwaysBounceVertical:](self->_contentStackView, "setAlwaysBounceVertical:", 1);
    -[MUScrollableStackView setScrollEnabled:](self->_contentStackView, "setScrollEnabled:", 1);
    -[MUScrollableStackView setKeyboardDismissMode:](self->_contentStackView, "setKeyboardDismissMode:", 1);
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ParkedCarViewController;
  -[ParkedCarViewController viewDidLayoutSubviews](&v4, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  -[MUScrollableStackView setFrame:](self->_contentStackView, "setFrame:");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ParkedCarViewController;
  -[ParkedCarViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[ParkedCarViewController _updateSectionControllerState:](self, "_updateSectionControllerState:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ParkedCarViewController;
  -[ParkedCarViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[ParkedCarViewController _updateSectionControllerState:](self, "_updateSectionControllerState:", 0);
}

- (void)_updateSectionControllerState:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_sectionControllers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "setActive:", v3, (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_locationApprovalDidChange:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager", a3));
  if ((objc_msgSend(v5, "isAuthorizedForPreciseLocation") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarViewController parkedCarDelegate](self, "parkedCarDelegate"));
    objc_msgSend(v4, "parkedCarViewControllerDidRequestDismissal:", self);

  }
}

- (void)setParkedCar:(id)a3
{
  ParkedCar *v5;
  ParkedCar *v6;
  ParkedCar **p_parkedCar;
  ParkedCar *parkedCar;
  void *v9;
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = (ParkedCar *)a3;
  v6 = v5;
  p_parkedCar = &self->_parkedCar;
  parkedCar = self->_parkedCar;
  if (parkedCar == v5)
    goto LABEL_17;
  if (!v5 || parkedCar)
  {
    if (v5 || !parkedCar)
      goto LABEL_9;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
    objc_msgSend(v9, "removeParkedCarObserver:", self);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
    objc_msgSend(v9, "addParkedCarObserver:", self);
  }

LABEL_9:
  objc_storeStrong((id *)&self->_parkedCar, a3);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_sectionControllers;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "setParkedCar:", *p_parkedCar, (_QWORD)v15);
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

LABEL_17:
}

- (void)dismissTextField
{
  -[ParkedCarDetailsSectionController resignNotesTextField](self->_detailsSectionController, "resignNotesTextField");
}

- (void)parkedCarManager:(id)a3 didUpdateParkedCar:(id)a4
{
  _QWORD block[5];

  if (self->_parkedCar == a4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007A4978;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)performAction:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      -[ParkedCarViewController _showLocationRefinement](self, "_showLocationRefinement");
      break;
    case 2:
      -[ParkedCarViewController _showCamera](self, "_showCamera");
      break;
    case 1:
      -[ParkedCarDetailsSectionController activateNotesTextField](self->_detailsSectionController, "activateNotesTextField");
      break;
  }
}

- (void)_handlePhotoTap
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  FullscreenImageViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  FullscreenImageViewController *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCar image](self->_parkedCar, "image"));
  if (v3)
    v4 = 6006;
  else
    v4 = 6029;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  LODWORD(v11) = 1;
  objc_msgSend(v5, "capturePlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:", v4, 201, 0, 0, 0xFFFFFFFFLL, 0, CFAbsoluteTimeGetCurrent(), 0, 0, 0, 0, v11, 0, 0, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCar image](self->_parkedCar, "image"));
  if (v6)
  {
    v7 = [FullscreenImageViewController alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCar image](self->_parkedCar, "image"));
    v12 = -[FullscreenImageViewController initWithImage:scrollable:](v7, "initWithImage:scrollable:", v8, 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Parked Car [Photo Viewer]"), CFSTR("localized string not found"), 0));
    -[FullscreenImageViewController setTitle:](v12, "setTitle:", v10);

    -[FullscreenImageViewController setTransitioningDelegate:](v12, "setTransitioningDelegate:", self);
    -[FullscreenImageViewController setModalPresentationStyle:](v12, "setModalPresentationStyle:", 0);
    -[ParkedCarViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

  }
  else
  {
    -[ParkedCarViewController _showCamera](self, "_showCamera");
  }
}

- (void)_showLocationRefinement
{
  ParkedCarLocationRefinementViewController *v3;
  id v4;
  id v5;

  v5 = objc_alloc_init((Class)MKMapCamera);
  -[ParkedCar coordinate](self->_parkedCar, "coordinate");
  objc_msgSend(v5, "setCenterCoordinate:");
  objc_msgSend(v5, "setAltitude:", 1000.0);
  v3 = -[ParkedCarLocationRefinementViewController initWithCamera:parkedCar:]([ParkedCarLocationRefinementViewController alloc], "initWithCamera:parkedCar:", v5, self->_parkedCar);
  -[LocationRefinementViewController setDelegate:](v3, "setDelegate:", self);
  -[ParkedCarLocationRefinementViewController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 2);
  v4 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v3);
  -[ParkedCarViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_showCamera
{
  void *v3;
  id v4;

  v4 = objc_alloc_init((Class)UIImagePickerController);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setSourceType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_imagePickerDidRetake:", _UIImagePickerControllerUserDidRejectItemNotification, 0);

  -[ParkedCarViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
}

- (void)_imagePickerDidRetake:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 6031, 620, 0);

}

- (void)_getDirections
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  LODWORD(v16) = 1;
  objc_msgSend(v3, "capturePlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:", 6003, 201, 0, 0, 0xFFFFFFFFLL, 0, CFAbsoluteTimeGetCurrent(), 0, 0, 0, 0, v16, 0, 0, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));

  if (v17
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager")), v6 = objc_msgSend(v5, "isAuthorizedForPreciseLocation"), v5, v6))
  {
    objc_msgSend(v17, "coordinate");
    v8 = v7;
    v10 = v9;
    v11 = -[ParkedCar coordinate](self->_parkedCar, "coordinate");
    v14 = 2 * (GEOCalculateDistance(v11, v8, v10, v12, v13) <= 5000.0);
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarViewController parkedCarDelegate](self, "parkedCarDelegate"));
  objc_msgSend(v15, "parkerCarViewControllerDidSelectDoDirections:transportType:", self, v14);

}

- (void)_editLocationTapped
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  LODWORD(v4) = 1;
  objc_msgSend(v3, "capturePlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:", 6027, 201, 0, 0, 0xFFFFFFFFLL, 0, CFAbsoluteTimeGetCurrent(), 0, 0, 0, 0, v4, 0, 0, 0);

  -[ParkedCarViewController _showLocationRefinement](self, "_showLocationRefinement");
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6;
  uint64_t v7;
  char isKindOfClass;
  FullscreenImageViewControllerZoomAnimationController *v9;
  void *v10;
  FullscreenImageViewControllerZoomAnimationController *v11;

  v6 = a3;
  v7 = objc_opt_class(FullscreenImageViewController);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = [FullscreenImageViewControllerZoomAnimationController alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarDetailsSectionController photoImageView](self->_detailsSectionController, "photoImageView"));
    v11 = -[FullscreenImageViewControllerZoomAnimationController initWithOriginalImageView:](v9, "initWithOriginalImageView:", v10);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  uint64_t v5;
  char isKindOfClass;
  FullscreenImageViewControllerZoomAnimationController *v7;
  void *v8;
  FullscreenImageViewControllerZoomAnimationController *v9;

  v4 = a3;
  v5 = objc_opt_class(FullscreenImageViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = [FullscreenImageViewControllerZoomAnimationController alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarDetailsSectionController photoImageView](self->_detailsSectionController, "photoImageView"));
    v9 = -[FullscreenImageViewControllerZoomAnimationController initWithOriginalImageView:](v7, "initWithOriginalImageView:", v8);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)textFieldRowViewDidBeginEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MUScrollableStackView *contentStackView;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  LODWORD(v8) = 1;
  objc_msgSend(v5, "capturePlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:", 6032, 201, 0, 0, 0xFFFFFFFFLL, 0, CFAbsoluteTimeGetCurrent(), 0, 0, 0, 0, v8, 0, 0, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarViewController parkedCarDelegate](self, "parkedCarDelegate"));
  objc_msgSend(v6, "parkedCarViewControllerDidBeginEditing:", self);

  contentStackView = self->_contentStackView;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textView"));

  objc_msgSend(v9, "frame");
  -[MUScrollableStackView scrollRectToVisible:animated:](contentStackView, "scrollRectToVisible:animated:", 1);

}

- (void)textFieldRowViewDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentTextFieldValue"));

  objc_msgSend(v6, "setNotes:forParkedCar:", v5, self->_parkedCar);
}

- (void)textFieldRowViewDidChange:(id)a3
{
  MUScrollableStackView *contentStackView;
  id v4;

  contentStackView = self->_contentStackView;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "textView"));
  -[MUScrollableStackView _maps_scrollTextViewSelectedRangeVisible:](contentStackView, "_maps_scrollTextViewSelectedRangeVisible:", v4);

}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "removeObserver:name:object:", self, _UIImagePickerControllerUserDidRejectItemNotification, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v9, "captureUserAction:onTarget:eventValue:", 17, 620, 0);

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", UIImagePickerControllerOriginalImage));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
  objc_msgSend(v10, "setImage:forParkedCar:", v11, self->_parkedCar);

  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, _UIImagePickerControllerUserDidRejectItemNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 18, 620, 0);

  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)locationRefinementViewController:(id)a3 didSelectCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  uint64_t v7;
  id v8;

  longitude = a4.longitude;
  latitude = a4.latitude;
  if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:", a3))v7 = 2;
  else
    v7 = 1;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
  objc_msgSend(v8, "setCoordinate:referenceFrame:forParkedCar:", v7, self->_parkedCar, latitude, longitude);

}

- (void)parkedCarHeaderButtonsSectionControllerRequestsDirections:(id)a3
{
  -[ParkedCarViewController _getDirections](self, "_getDirections", a3);
}

- (void)parkedCarHeaderButtonsSectionControllerRequestsEditLocation:(id)a3
{
  -[ParkedCarViewController _editLocationTapped](self, "_editLocationTapped", a3);
}

- (void)parkedCarDetailsSectionControllerDidTapAddPhotos:(id)a3
{
  -[ParkedCarViewController _handlePhotoTap](self, "_handlePhotoTap", a3);
}

- (void)parkedCarDetailsSectionControllerDidTapViewPhoto:(id)a3
{
  -[ParkedCarViewController _handlePhotoTap](self, "_handlePhotoTap", a3);
}

- (void)parkedCarDetailsSectionControllerDidRemovePhoto:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarViewController parkedCar](self, "parkedCar"));
  objc_msgSend(v5, "removeImageForParkedCar:", v4);

}

- (void)parkedCarFooterActionsSectionControllerDidShareLocation:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ParkedCarViewController parkedCarDelegate](self, "parkedCarDelegate", a3));
  objc_msgSend(v4, "parkedCarViewControllerDidSelectShare:", self);

}

- (void)parkedCarFooterActionsSectionControllerDidRemoveParkedCar:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  LODWORD(v6) = 1;
  objc_msgSend(v4, "capturePlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:", 6033, 201, 0, 0, 0xFFFFFFFFLL, 0, CFAbsoluteTimeGetCurrent(), 0, 0, 0, 0, v6, 0, 0, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
  objc_msgSend(v5, "removeParkedCar");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarViewController parkedCarDelegate](self, "parkedCarDelegate"));
  objc_msgSend(v7, "parkedCarViewControllerDidRequestDismissal:", self);

}

- (void)instrumentDismissAction
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 4, 201, 0);

}

- (id)draggableContent
{
  return 0;
}

- (UIView)draggableHeaderView
{
  return 0;
}

- (UIView)viewForHeaderContainmentString
{
  return 0;
}

- (void)updateHeaderTrailingConstant
{
  -[ParkedCarHeaderSectionController updateTrailingConstraint](self->_headerSectionController, "updateTrailingConstraint");
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (void)setAutomobileOptions:(id)a3
{
  objc_storeStrong((id *)&self->_automobileOptions, a3);
}

- (GEOCyclingOptions)cyclingOptions
{
  return self->_cyclingOptions;
}

- (void)setCyclingOptions:(id)a3
{
  objc_storeStrong((id *)&self->_cyclingOptions, a3);
}

- (GEOTransitOptions)transitOptions
{
  return self->_transitOptions;
}

- (void)setTransitOptions:(id)a3
{
  objc_storeStrong((id *)&self->_transitOptions, a3);
}

- (GEOWalkingOptions)walkingOptions
{
  return self->_walkingOptions;
}

- (void)setWalkingOptions:(id)a3
{
  objc_storeStrong((id *)&self->_walkingOptions, a3);
}

- (ParkedCarViewControllerDelegate)parkedCarDelegate
{
  return (ParkedCarViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_parkedCarDelegate);
}

- (void)setParkedCarDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_parkedCarDelegate, a3);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (ParkedCar)parkedCar
{
  return self->_parkedCar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parkedCar, 0);
  objc_destroyWeak((id *)&self->_parkedCarDelegate);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong((id *)&self->_detailsSectionController, 0);
  objc_storeStrong((id *)&self->_headerSectionController, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
}

@end
