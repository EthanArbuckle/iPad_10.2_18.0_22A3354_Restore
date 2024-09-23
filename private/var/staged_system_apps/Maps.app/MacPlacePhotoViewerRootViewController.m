@implementation MacPlacePhotoViewerRootViewController

- (MKMapItem)mapItem
{
  return -[MacPlacePhotoViewerConfiguration mapItem](self->_configuration, "mapItem");
}

- (MacPlacePhotoViewerRootViewController)initWithConfiguration:(id)a3 sceneDelegate:(id)a4
{
  id v7;
  id v8;
  MacPlacePhotoViewerRootViewController *v9;
  MacPlacePhotoViewerRootViewController *v10;
  id *p_configuration;
  PhotoViewerToolbarController *v12;
  void *v13;
  PhotoViewerToolbarController *v14;
  PhotoViewerToolbarController *toolbarController;
  RAPPlacecardImageryLayoutManager *v16;
  void *v17;
  RAPPlacecardImageryLayoutManager *v18;
  RAPPlacecardImageryLayoutManager *reportImageryLayoutManager;
  RAPPresenter *v20;
  RAPPresenter *rapPresenter;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  MUPlacePhotoGalleryViewController *photoGalleryViewController;
  void *v27;
  objc_super v29;

  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)MacPlacePhotoViewerRootViewController;
  v9 = -[MacPlacePhotoViewerRootViewController initWithNibName:bundle:](&v29, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    p_configuration = (id *)&v9->_configuration;
    objc_storeStrong((id *)&v9->_configuration, a3);
    v12 = [PhotoViewerToolbarController alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_configuration, "mapItem"));
    v14 = -[PhotoViewerToolbarController initWithMapItem:](v12, "initWithMapItem:", v13);
    toolbarController = v10->_toolbarController;
    v10->_toolbarController = v14;

    -[PhotoViewerToolbarController setDelegate:](v10->_toolbarController, "setDelegate:", v10);
    v16 = [RAPPlacecardImageryLayoutManager alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[RAPPlacecardImageryIssueItem defaultIssueItems](RAPPlacecardImageryIssueItem, "defaultIssueItems"));
    v18 = -[RAPPlacecardImageryLayoutManager initWithDefaultItems:](v16, "initWithDefaultItems:", v17);
    reportImageryLayoutManager = v10->_reportImageryLayoutManager;
    v10->_reportImageryLayoutManager = v18;

    objc_storeStrong((id *)&v10->_mapsSceneDelegate, a4);
    v20 = -[RAPPresenter initWithSceneDelegate:]([RAPPresenter alloc], "initWithSceneDelegate:", v10->_mapsSceneDelegate);
    rapPresenter = v10->_rapPresenter;
    v10->_rapPresenter = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "photoGalleryViewController"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "delegate"));
    objc_storeWeak((id *)&v10->_underlyingGalleryDelegate, v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "photoGalleryViewController"));
    objc_msgSend(v24, "setDelegate:", v10);

    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "photoGalleryViewController"));
    photoGalleryViewController = v10->_photoGalleryViewController;
    v10->_photoGalleryViewController = (MUPlacePhotoGalleryViewController *)v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "photoGalleryViewController"));
    -[PhotoViewerToolbarController setSuppressPhotoGrid:](v10->_toolbarController, "setSuppressPhotoGrid:", v27 != 0);

    -[MacPlacePhotoViewerRootViewController setContext:](v10, "setContext:", objc_msgSend(*p_configuration, "startingContext"));
  }

  return v10;
}

- (void)viewDidLoad
{
  UGCMorePhotosFeedViewController *v3;
  void *v4;
  UGCMorePhotosFeedViewController *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  int64_t v11;
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
  void *v22;
  double v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)MacPlacePhotoViewerRootViewController;
  -[MacPlacePhotoViewerRootViewController viewDidLoad](&v26, "viewDidLoad");
  v3 = [UGCMorePhotosFeedViewController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController mapItem](self, "mapItem"));
  v5 = -[UGCMorePhotosFeedViewController initWithMapItem:](v3, "initWithMapItem:", v4);
  -[MacPlacePhotoViewerRootViewController setPhotoThumbnailViewController:](self, "setPhotoThumbnailViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoThumbnailViewController](self, "photoThumbnailViewController"));
  objc_msgSend(v6, "setDelegate:", self);

  v7 = -[MacPlacePhotoViewerConfiguration albumIndex](self->_configuration, "albumIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoThumbnailViewController](self, "photoThumbnailViewController"));
  objc_msgSend(v8, "setSelectedAlbumIndex:", v7);

  v9 = -[MacPlacePhotoViewerConfiguration selectedPhotoIndex](self->_configuration, "selectedPhotoIndex");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoThumbnailViewController](self, "photoThumbnailViewController"));
  objc_msgSend(v10, "setStartingImageIndex:", v9);

  v11 = -[MacPlacePhotoViewerRootViewController context](self, "context");
  if (v11 == 2)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoGalleryViewController](self, "photoGalleryViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));

    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoGalleryViewController](self, "photoGalleryViewController"));
    -[MacPlacePhotoViewerRootViewController addChildViewController:](self, "addChildViewController:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController view](self, "view"));
    objc_msgSend(v19, "addSubview:", v13);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoGalleryViewController](self, "photoGalleryViewController"));
  }
  else
  {
    if (v11 != 1)
      return;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoThumbnailViewController](self, "photoThumbnailViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));

    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoThumbnailViewController](self, "photoThumbnailViewController"));
    -[MacPlacePhotoViewerRootViewController addChildViewController:](self, "addChildViewController:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController view](self, "view"));
    objc_msgSend(v15, "addSubview:", v13);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoThumbnailViewController](self, "photoThumbnailViewController"));
  }
  v20 = v16;
  objc_msgSend(v16, "didMoveToParentViewController:", self);

  if (v13)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController view](self, "view"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "safeAreaLayoutGuide"));
    LODWORD(v23) = 1148846080;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_maps_constraintsEqualToEdgesOfLayoutGuide:priority:", v22, v23));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

  }
}

- (id)placePhotoGalleryImageViewForPhotoAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController underlyingGalleryDelegate](self, "underlyingGalleryDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placePhotoGalleryImageViewForPhotoAtIndex:", a3));

  return v5;
}

- (void)photoViewerToolbarController:(id)a3 selectedReportAnIssueItem:(id)a4
{
  id v5;
  void *v6;
  RAPPlacecardImageryContextImpl *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  RAPPlacecardImageryContextImpl *v12;
  id v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoGalleryViewController](self, "photoGalleryViewController"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentPhoto"));

  v7 = [RAPPlacecardImageryContextImpl alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController mapItem](self, "mapItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geoMapItemPhoto"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "largestPhotoURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
  v12 = -[RAPPlacecardImageryContextImpl initWithMapItem:photo:selectedPhotoURL:](v7, "initWithMapItem:photo:selectedPhotoURL:", v8, v9, v11);

  -[RAPPresenter presentPlacecardImageryRAPWithContext:selectedIssueItem:completion:](self->_rapPresenter, "presentPlacecardImageryRAPWithContext:selectedIssueItem:completion:", v12, v5, 0);
}

- (id)photoViewerToolbarControllerGetCurrentPhoto:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoGalleryViewController](self, "photoGalleryViewController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentPhoto"));

  return v4;
}

- (void)placePhotoGallery:(id)a3 willCloseAtIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController underlyingGalleryDelegate](self, "underlyingGalleryDelegate"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v7, a2);

  if ((a2 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController underlyingGalleryDelegate](self, "underlyingGalleryDelegate"));
    objc_msgSend(v8, "placePhotoGallery:willCloseAtIndex:", v9, a4);

  }
}

- (void)placePhotoGalleryDidCloseAtIndex:(unint64_t)a3
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController underlyingGalleryDelegate](self, "underlyingGalleryDelegate"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v6, a2);

  if ((a2 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController underlyingGalleryDelegate](self, "underlyingGalleryDelegate"));
    objc_msgSend(v7, "placePhotoGalleryDidCloseAtIndex:", a3);

  }
}

- (void)placePhotoGalleryAdditionalViewTapped:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController underlyingGalleryDelegate](self, "underlyingGalleryDelegate"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v5, a2);

  if ((a2 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController underlyingGalleryDelegate](self, "underlyingGalleryDelegate"));
    objc_msgSend(v6, "placePhotoGalleryAdditionalViewTapped:", v7);

  }
}

- (void)placePhotoGallery:(id)a3 attributionViewTappedAtIndex:(unint64_t)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController underlyingGalleryDelegate](self, "underlyingGalleryDelegate"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v8, a2);

  if ((a2 & 1) != 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController underlyingGalleryDelegate](self, "underlyingGalleryDelegate"));
    objc_msgSend(v9, "placePhotoGallery:attributionViewTappedAtIndex:", v7, a4);
  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentPhoto"));
    -[MacPlacePhotoViewerRootViewController _performPunchoutWithPhoto:index:presentingViewController:](self, "_performPunchoutWithPhoto:index:presentingViewController:");
  }

}

- (void)_performPunchoutWithPhoto:(id)a3 index:(unint64_t)a4 presentingViewController:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attribution"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "providerID"));
  +[GEOAPPortal captureUserAction:target:value:actionRichProviderId:](GEOAPPortal, "captureUserAction:target:value:actionRichProviderId:", 6018, 612, v8, v10);

  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attribution"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "photoID"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "urlsForPhotoWithIdentifier:", v11));
  +[MKAppLaunchController launchAttributionURLs:withAttribution:completionHandler:](MKAppLaunchController, "launchAttributionURLs:withAttribution:completionHandler:", v12, v13, 0);

}

- (void)placePhotoGalleryDidScrollLeftToIndex:(unint64_t)a3
{
  void *v6;
  id v7;

  -[MacPlacePhotoViewerRootViewController _updateScrollButtonsWithIndex:](self, "_updateScrollButtonsWithIndex:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController underlyingGalleryDelegate](self, "underlyingGalleryDelegate"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v6, a2);

  if ((a2 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController underlyingGalleryDelegate](self, "underlyingGalleryDelegate"));
    objc_msgSend(v7, "placePhotoGalleryDidScrollLeftToIndex:", a3);
  }
  else
  {
    -[MacPlacePhotoViewerRootViewController _logUGCAction:withIndex:](self, "_logUGCAction:withIndex:", 6048, a3);
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoThumbnailViewController](self, "photoThumbnailViewController"));
    objc_msgSend(v7, "scrollToPhotoAtIndex:animated:", a3, 0);
  }

}

- (void)placePhotoGalleryDidScrollRightToIndex:(unint64_t)a3
{
  void *v6;
  id v7;

  -[MacPlacePhotoViewerRootViewController _updateScrollButtonsWithIndex:](self, "_updateScrollButtonsWithIndex:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController underlyingGalleryDelegate](self, "underlyingGalleryDelegate"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v6, a2);

  if ((a2 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController underlyingGalleryDelegate](self, "underlyingGalleryDelegate"));
    objc_msgSend(v7, "placePhotoGalleryDidScrollRightToIndex:", a3);
  }
  else
  {
    -[MacPlacePhotoViewerRootViewController _logUGCAction:withIndex:](self, "_logUGCAction:withIndex:", 6049, a3);
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoThumbnailViewController](self, "photoThumbnailViewController"));
    objc_msgSend(v7, "scrollToPhotoAtIndex:animated:", a3, 0);
  }

}

- (void)placePhotoGalleryDidScrollToIndex:(unint64_t)a3
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController underlyingGalleryDelegate](self, "underlyingGalleryDelegate"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v6, a2);

  if ((a2 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController underlyingGalleryDelegate](self, "underlyingGalleryDelegate"));
    objc_msgSend(v7, "placePhotoGalleryDidScrollToIndex:", a3);

  }
}

- (void)placePhotoGallery:(id)a3 openButtonTappedAtIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController underlyingGalleryDelegate](self, "underlyingGalleryDelegate"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v7, a2);

  if ((a2 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController underlyingGalleryDelegate](self, "underlyingGalleryDelegate"));
    objc_msgSend(v8, "placePhotoGallery:openButtonTappedAtIndex:", v14, a4);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentPhoto"));
    v8 = v9;
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attribution"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "photoID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "urlsForPhotoWithIdentifier:", v11));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attribution"));
      +[MKAppLaunchController launchAttributionURLs:withAttribution:usingTarget:completionHandler:](MKAppLaunchController, "launchAttributionURLs:withAttribution:usingTarget:completionHandler:", v12, v13, 665, 0);

    }
  }

}

- (void)placePhotoGalleryDidFinishDismissing:(id)a3
{
  -[MacPlacePhotoViewerRootViewController setPhotoGalleryViewController:](self, "setPhotoGalleryViewController:", 0);
}

- (id)placePhotoGalleryRequestsUserAttribution:(id)a3
{
  id v4;
  Result *userAttributionResult;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  userAttributionResult = self->_userAttributionResult;
  if (userAttributionResult)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = sub_1002E1A1C;
    v13 = sub_1002E1A2C;
    v14 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002E1A34;
    v8[3] = &unk_1011AE028;
    v8[4] = &v9;
    -[Result withValue:orError:](userAttributionResult, "withValue:orError:", v8, &stru_1011B09A8);
    v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  else
  {
    -[MacPlacePhotoViewerRootViewController _fetchUserAttribution](self, "_fetchUserAttribution");
    v6 = objc_msgSend(objc_alloc((Class)MUPlaceUserAttributionViewModel), "initWithAttributionName:", &stru_1011EB268);
  }

  return v6;
}

- (void)_fetchUserAttribution
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  Result *v11;
  Result *userAttributionResult;
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerConfiguration userSubmissionLookupResult](self->_configuration, "userSubmissionLookupResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "previousSubmission"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "images"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_initWeak(&location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoAttributionPreferencesManager sharedManager](UGCPhotoAttributionPreferencesManager, "sharedManager"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1002E1C88;
    v14[3] = &unk_1011AE090;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v8, "photoAttributionPreferencesWithCompletion:", v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = GEOErrorDomain(v7);
    v13 = (id)objc_claimAutoreleasedReturnValue(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, -6, 0));
    v11 = (Result *)objc_claimAutoreleasedReturnValue(+[Result resultWithError:](Result, "resultWithError:", v10));
    userAttributionResult = self->_userAttributionResult;
    self->_userAttributionResult = v11;

  }
}

- (void)photoThumbnailGalleryViewController:(id)a3 selectedPhotoAtIndex:(unint64_t)a4 photoList:(id)a5 albumCategory:(id)a6 imageViewForTransition:(id)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", a4));
  if (objc_msgSend(v13, "needsObfuscationWhenRenderedInFullScreen"))
  {
    -[MacPlacePhotoViewerRootViewController _performPunchoutWithPhoto:index:presentingViewController:](self, "_performPunchoutWithPhoto:index:presentingViewController:", v13, a4, v22);
  }
  else
  {
    v14 = objc_alloc((Class)MUPlacePhotoGalleryViewController);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController mapItem](self, "mapItem"));
    v16 = objc_msgSend(v14, "initWithPhotos:additionalView:scrollToIndex:mapItem:delegate:", v11, 0, a4, v15, self);
    -[MacPlacePhotoViewerRootViewController setPhotoGalleryViewController:](self, "setPhotoGalleryViewController:", v16);

    v17 = objc_msgSend(v12, "categoryType") == (id)2;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoGalleryViewController](self, "photoGalleryViewController"));
    objc_msgSend(v18, "setEnablePersonalizedAttribution:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoGalleryViewController](self, "photoGalleryViewController"));
    objc_msgSend(v19, "setDelegate:", self);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoGalleryViewController](self, "photoGalleryViewController"));
    objc_msgSend(v20, "setModalPresentationStyle:", 8);

    -[MacPlacePhotoViewerRootViewController setContext:](self, "setContext:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoGalleryViewController](self, "photoGalleryViewController"));
    -[MacPlacePhotoViewerRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v21, 1, 0);

  }
}

- (void)setContext:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController toolbarController](self, "toolbarController"));
  objc_msgSend(v4, "setContext:", a3);

}

- (int64_t)context
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController toolbarController](self, "toolbarController"));
  v3 = objc_msgSend(v2, "context");

  return (int64_t)v3;
}

- (id)userUploadedDataProviderForThumbnailGallery:(id)a3
{
  return -[MacPlacePhotoViewerConfiguration userSubmissionLookupResult](self->_configuration, "userSubmissionLookupResult", a3);
}

- (void)photoViewerToolbarControllerTappedAddPhoto:(id)a3
{
  -[MacPlacePhotoViewerRootViewController _logAction:withValue:](self, "_logAction:withValue:", 2147, 0);
}

- (void)photoViewerToolbarControllerTappedLeft:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoGalleryViewController](self, "photoGalleryViewController", a3));
  objc_msgSend(v3, "scrollLeft");

}

- (void)photoViewerToolbarControllerTappedRight:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoGalleryViewController](self, "photoGalleryViewController", a3));
  objc_msgSend(v3, "scrollRight");

}

- (void)photoViewerToolbarControllerTappedMorePhotos:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[MacPlacePhotoViewerRootViewController setContext:](self, "setContext:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoGalleryViewController](self, "photoGalleryViewController"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002E2108;
  v5[3] = &unk_1011AC860;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

- (UIViewController)topmostViewController
{
  void *v3;
  MacPlacePhotoViewerRootViewController *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoGalleryViewController](self, "photoGalleryViewController"));

  if (v3)
    v4 = (MacPlacePhotoViewerRootViewController *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoGalleryViewController](self, "photoGalleryViewController"));
  else
    v4 = self;
  return (UIViewController *)v4;
}

- (void)_logUGCAction:(int)a3 withIndex:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = *(_QWORD *)&a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController photoGalleryViewController](self, "photoGalleryViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentPhoto"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attribution"));

  if (objc_msgSend(v8, "isUserSubmitted"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v11 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    +[GEOAPPortal captureUGCUserAction:target:value:photoSources:](GEOAPPortal, "captureUGCUserAction:target:value:photoSources:", v5, 612, 0, v10);

  }
}

- (void)_logAction:(int)a3 withValue:(id)a4
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", *(_QWORD *)&a3, 612, a4);
}

- (MacPlacePhotoViewerActionDelegate)delegate
{
  return (MacPlacePhotoViewerActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MacPlacePhotoViewerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (UGCMorePhotosFeedViewController)photoThumbnailViewController
{
  return self->_photoThumbnailViewController;
}

- (void)setPhotoThumbnailViewController:(id)a3
{
  objc_storeStrong((id *)&self->_photoThumbnailViewController, a3);
}

- (MUPlacePhotoGalleryViewController)photoGalleryViewController
{
  return self->_photoGalleryViewController;
}

- (void)setPhotoGalleryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_photoGalleryViewController, a3);
}

- (PhotoViewerToolbarController)toolbarController
{
  return self->_toolbarController;
}

- (void)setToolbarController:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarController, a3);
}

- (UGCReportImageryController)reportImageryController
{
  return self->_reportImageryController;
}

- (void)setReportImageryController:(id)a3
{
  objc_storeStrong((id *)&self->_reportImageryController, a3);
}

- (RAPPlacecardImageryLayoutManager)reportImageryLayoutManager
{
  return self->_reportImageryLayoutManager;
}

- (void)setReportImageryLayoutManager:(id)a3
{
  objc_storeStrong((id *)&self->_reportImageryLayoutManager, a3);
}

- (RAPPresenter)rapPresenter
{
  return self->_rapPresenter;
}

- (void)setRapPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_rapPresenter, a3);
}

- (MapsSceneDelegate)mapsSceneDelegate
{
  return self->_mapsSceneDelegate;
}

- (void)setMapsSceneDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_mapsSceneDelegate, a3);
}

- (MUPlacePhotoGalleryViewControllerDelegate)underlyingGalleryDelegate
{
  return (MUPlacePhotoGalleryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_underlyingGalleryDelegate);
}

- (void)setUnderlyingGalleryDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_underlyingGalleryDelegate, a3);
}

- (Result)userAttributionResult
{
  return self->_userAttributionResult;
}

- (void)setUserAttributionResult:(id)a3
{
  objc_storeStrong((id *)&self->_userAttributionResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAttributionResult, 0);
  objc_destroyWeak((id *)&self->_underlyingGalleryDelegate);
  objc_storeStrong((id *)&self->_mapsSceneDelegate, 0);
  objc_storeStrong((id *)&self->_rapPresenter, 0);
  objc_storeStrong((id *)&self->_reportImageryLayoutManager, 0);
  objc_storeStrong((id *)&self->_reportImageryController, 0);
  objc_storeStrong((id *)&self->_toolbarController, 0);
  objc_storeStrong((id *)&self->_photoGalleryViewController, 0);
  objc_storeStrong((id *)&self->_photoThumbnailViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
