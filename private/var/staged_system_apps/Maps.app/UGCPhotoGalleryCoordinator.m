@implementation UGCPhotoGalleryCoordinator

- (UGCPhotoGalleryCoordinator)init
{
  UGCPhotoGalleryCoordinator *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UGCPhotoGalleryCoordinator;
  v2 = -[UGCPOIEnrichmentCoordinator init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoAttributionPreferencesManager sharedManager](UGCPhotoAttributionPreferencesManager, "sharedManager"));
    objc_msgSend(v3, "addObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoAttributionPreferencesManager sharedManager](UGCPhotoAttributionPreferencesManager, "sharedManager"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)UGCPhotoGalleryCoordinator;
  -[UGCPhotoGalleryCoordinator dealloc](&v4, "dealloc");
}

- (void)present
{
  void *v3;
  void *v4;
  ActionCoordination *v5;
  ActionCoordination *actionCoordinator;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appCoordinator"));
  v5 = (ActionCoordination *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "baseActionCoordinator"));
  actionCoordinator = self->_actionCoordinator;
  self->_actionCoordinator = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == (id)5)
    -[UGCPhotoGalleryCoordinator _startPresentationUsingMacPhotoViewer](self, "_startPresentationUsingMacPhotoViewer");
  else
    -[UGCPhotoGalleryCoordinator _startPresentationUsingIOSPhotoViewer](self, "_startPresentationUsingIOSPhotoViewer");
}

- (void)_startPresentationUsingMacPhotoViewer
{
  MacPlacePhotoViewerScene *v3;
  MacPlacePhotoViewerScene *photoViewerScene;
  MacPlacePhotoViewerConfiguration *v5;
  void *v6;
  void *v7;
  MacPlacePhotoViewerScene *v8;
  void *v9;
  void *v10;
  MacPlacePhotoViewerConfiguration *v11;

  v3 = (MacPlacePhotoViewerScene *)objc_claimAutoreleasedReturnValue(+[MacPlacePhotoViewerScene requestSceneActivation](MacPlacePhotoViewerScene, "requestSceneActivation"));
  photoViewerScene = self->_photoViewerScene;
  self->_photoViewerScene = v3;

  v5 = [MacPlacePhotoViewerConfiguration alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
  v11 = -[MacPlacePhotoViewerConfiguration initWithMapItem:startingContext:](v5, "initWithMapItem:startingContext:", v6, 1);

  -[MacPlacePhotoViewerConfiguration setAlbumIndex:](v11, "setAlbumIndex:", -[UGCPhotoGalleryCoordinator albumIndex](self, "albumIndex"));
  -[MacPlacePhotoViewerConfiguration setSelectedPhotoIndex:](v11, "setSelectedPhotoIndex:", -[UGCPhotoGalleryCoordinator selectedIndex](self, "selectedIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator submissionLookupResult](self, "submissionLookupResult"));
  -[MacPlacePhotoViewerConfiguration setUserSubmissionLookupResult:](v11, "setUserSubmissionLookupResult:", v7);

  v8 = self->_photoViewerScene;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentingViewController](self, "presentingViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_maps_mapsSceneDelegate"));
  -[MacPlacePhotoViewerScene openPhotoGalleryWithConfiguration:sceneDelegate:delegate:](v8, "openPhotoGalleryWithConfiguration:sceneDelegate:delegate:", v11, v10, self);

}

- (void)_startPresentationUsingIOSPhotoViewer
{
  UGCMorePhotosFeedViewController *v3;
  void *v4;
  UGCMorePhotosFeedViewController *v5;
  UGCMorePhotosFeedViewController *galleryViewController;
  void *v7;
  char v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD *v13;
  id v14;
  id location;
  _QWORD v16[5];

  v3 = [UGCMorePhotosFeedViewController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
  v5 = -[UGCMorePhotosFeedViewController initWithMapItem:](v3, "initWithMapItem:", v4);
  galleryViewController = self->_galleryViewController;
  self->_galleryViewController = v5;

  -[UGCMorePhotosFeedViewController setDelegate:](self->_galleryViewController, "setDelegate:", self);
  -[UGCMorePhotosFeedViewController setModalPresentationStyle:](self->_galleryViewController, "setModalPresentationStyle:", 8);
  -[UGCMorePhotosFeedViewController setSelectedAlbumIndex:](self->_galleryViewController, "setSelectedAlbumIndex:", -[UGCPhotoGalleryCoordinator albumIndex](self, "albumIndex"));
  -[UGCMorePhotosFeedViewController setStartingImageIndex:](self->_galleryViewController, "setStartingImageIndex:", -[UGCPhotoGalleryCoordinator selectedIndex](self, "selectedIndex"));
  if (sub_1002A8AA0(self->_galleryViewController) == 5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator delegate](self, "delegate"));
    v8 = objc_opt_respondsToSelector(v7, "poiEnrichmentCoordinator:requestPresentingViewControllerWithBlock:");

  }
  else
  {
    v8 = 0;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100262E64;
  v16[3] = &unk_1011ADFD8;
  v16[4] = self;
  v9 = objc_retainBlock(v16);
  if ((v8 & 1) != 0)
  {
    objc_initWeak(&location, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentationDelegate](self, "presentationDelegate"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100262E84;
    v12[3] = &unk_1011AE000;
    objc_copyWeak(&v14, &location);
    v13 = v9;
    objc_msgSend(v10, "poiEnrichmentCoordinator:requestPresentingViewControllerWithBlock:", self, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentingViewController](self, "presentingViewController"));
    ((void (*)(_QWORD *, void *))v9[2])(v9, v11);

  }
}

- (void)photoThumbnailGalleryViewControllerDidSelectDone:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100262F5C;
  v3[3] = &unk_1011AC860;
  v3[4] = self;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (void)photoThumbnailGalleryViewController:(id)a3 selectedAddPhotosUsingEntryPoint:(int64_t)a4 presentationOptions:(id)a5
{
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  UGCPOIEnrichmentCoordinator *v13;
  UGCPOIEnrichmentCoordinator *poiEnrichmentCoordinator;
  void *v15;
  void *v16;

  v8 = a4 == 2;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
  if (a4 == 1)
    v12 = 1;
  else
    v12 = 2 * v8;
  v13 = (UGCPOIEnrichmentCoordinator *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator photoEmphasizedAddCoordinatorWithMapItem:preferredSourceType:originTarget:](UGCPOIEnrichmentCoordinator, "photoEmphasizedAddCoordinatorWithMapItem:preferredSourceType:originTarget:", v11, v12, CFSTR("PLACECARD_PHOTO_VIEWER_ALL")));
  poiEnrichmentCoordinator = self->_poiEnrichmentCoordinator;
  self->_poiEnrichmentCoordinator = v13;

  -[UGCPOIEnrichmentCoordinator setDelegate:](self->_poiEnrichmentCoordinator, "setDelegate:", self);
  -[UGCPOIEnrichmentCoordinator setPresentingViewController:](self->_poiEnrichmentCoordinator, "setPresentingViewController:", v10);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sourceView"));
  -[UGCPOIEnrichmentCoordinator setAnchoringView:](self->_poiEnrichmentCoordinator, "setAnchoringView:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "progressObserver"));
  -[UGCPOIEnrichmentCoordinator setSubmissionLookupObserver:](self->_poiEnrichmentCoordinator, "setSubmissionLookupObserver:", v16);

  -[UGCPOIEnrichmentCoordinator setPresentationContext:](self->_poiEnrichmentCoordinator, "setPresentationContext:", 1);
  -[UGCPOIEnrichmentCoordinator setPrefersDefaultPresentationOverContainee:](self->_poiEnrichmentCoordinator, "setPrefersDefaultPresentationOverContainee:", 1);
  -[UGCPOIEnrichmentCoordinator present](self->_poiEnrichmentCoordinator, "present");
}

- (void)poiEnrichmentCoordinatorDidFinish:(id)a3
{
  UGCPOIEnrichmentCoordinator *poiEnrichmentCoordinator;

  poiEnrichmentCoordinator = self->_poiEnrichmentCoordinator;
  self->_poiEnrichmentCoordinator = 0;

}

- (void)poiEnrichmentCoordinator:(id)a3 openURL:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator delegate](self, "delegate"));
  objc_msgSend(v6, "poiEnrichmentCoordinator:openURL:", self, v5);

}

- (void)poiEnrichmentCoordinator:(id)a3 requestPresentingViewControllerWithBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentingViewController](self, "presentingViewController"));
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)poiEnrichmentCoordinator:(id)a3 didUpdateUserConsent:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator submissionStatusDelegate](self, "submissionStatusDelegate"));
  objc_msgSend(v7, "poiEnrichmentCoordinator:didUpdateUserConsent:", v6, v4);

}

- (void)poiEnrichmentCoordinatorDidUpdateUserSubmission:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator submissionStatusDelegate](self, "submissionStatusDelegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "poiEnrichmentCoordinatorDidUpdateUserSubmission:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator submissionStatusDelegate](self, "submissionStatusDelegate"));
    objc_msgSend(v6, "poiEnrichmentCoordinatorDidUpdateUserSubmission:", self);

  }
}

- (void)poiEnrichmentCoordinator:(id)a3 didFinishSubmissionLookup:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator submissionStatusDelegate](self, "submissionStatusDelegate"));
  v6 = objc_opt_respondsToSelector(v5, "poiEnrichmentCoordinator:didFinishSubmissionLookup:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator submissionStatusDelegate](self, "submissionStatusDelegate"));
    objc_msgSend(v7, "poiEnrichmentCoordinator:didFinishSubmissionLookup:", self, v8);

  }
}

- (void)photoThumbnailGalleryViewController:(id)a3 selectedPhotoAtIndex:(unint64_t)a4 photoList:(id)a5 albumCategory:(id)a6 imageViewForTransition:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  MUPlacePhotoGalleryViewController *v18;
  MUPlacePhotoGalleryViewController *fullScreenGalleryViewController;
  id v20;
  void *v21;
  id v22;

  v22 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", a4));
  if (objc_msgSend(v15, "needsObfuscationWhenRenderedInFullScreen"))
  {
    -[UGCPhotoGalleryCoordinator _performPunchoutWithPhoto:index:presentingViewController:](self, "_performPunchoutWithPhoto:index:presentingViewController:", v15, a4, v22);
  }
  else
  {
    objc_storeStrong((id *)&self->_galleryPhotoList, a5);
    objc_storeStrong((id *)&self->_imageViewForTransition, a7);
    v16 = objc_alloc((Class)MUPlacePhotoGalleryViewController);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
    v18 = (MUPlacePhotoGalleryViewController *)objc_msgSend(v16, "initWithPhotos:additionalView:scrollToIndex:mapItem:delegate:", v12, 0, a4, v17, self);
    fullScreenGalleryViewController = self->_fullScreenGalleryViewController;
    self->_fullScreenGalleryViewController = v18;

    -[MUPlacePhotoGalleryViewController setEnablePersonalizedAttribution:](self->_fullScreenGalleryViewController, "setEnablePersonalizedAttribution:", objc_msgSend(v13, "categoryType") == (id)2);
    v20 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_fullScreenGalleryViewController);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "navigationController"));
    objc_msgSend(v21, "setNavigationBarHidden:animated:", 1, 0);

    if (sub_1002A8AA0(self->_fullScreenGalleryViewController) != 5)
      objc_msgSend(v20, "setTransitioningDelegate:", self);
    objc_msgSend(v20, "setModalPresentationStyle:", 5);
    -[UGCMorePhotosFeedViewController presentViewController:animated:completion:](self->_galleryViewController, "presentViewController:animated:completion:", v20, 1, 0);

  }
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
    v12 = sub_10026357C;
    v13 = sub_10026358C;
    v14 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100263594;
    v8[3] = &unk_1011AE028;
    v8[4] = &v9;
    -[Result withValue:orError:](userAttributionResult, "withValue:orError:", v8, &stru_1011AE068);
    v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  else
  {
    -[UGCPhotoGalleryCoordinator _fetchUserAttribution](self, "_fetchUserAttribution");
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator submissionLookupResult](self, "submissionLookupResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "previousSubmission"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "images"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_initWeak(&location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoAttributionPreferencesManager sharedManager](UGCPhotoAttributionPreferencesManager, "sharedManager"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1002637DC;
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

- (void)placePhotoGallery:(id)a3 openButtonTappedAtIndex:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (-[NSArray count](self->_galleryPhotoList, "count") > a4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_galleryPhotoList, "objectAtIndexedSubscript:", a4));
    -[UGCPhotoGalleryCoordinator _performPunchoutWithPhoto:index:presentingViewController:](self, "_performPunchoutWithPhoto:index:presentingViewController:", v6, a4, v7);

  }
}

- (void)placePhotoGallery:(id)a3 didSelectDeleteImageAtIndex:(unint64_t)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_galleryPhotoList, "objectAtIndex:", a4));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geoMapItemPhoto"));

  -[UGCPhotoGalleryCoordinator _placePhotoGalleryDidSelectDeleteImage:](self, "_placePhotoGalleryDidSelectDeleteImage:", v6);
}

- (void)_placePhotoGalleryDidSelectDeleteImage:(id)a3
{
  id v4;
  _TtC4Maps26UGCSubmissionLookupManager *v5;
  _TtC4Maps26UGCSubmissionLookupManager *lookupManager;
  _TtC4Maps26UGCSubmissionLookupManager *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(id *, void *, uint64_t);
  void *v15;
  id v16;
  UGCPhotoGalleryCoordinator *v17;
  id v18;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(_TtC4Maps26UGCSubmissionLookupManager);
  lookupManager = self->_lookupManager;
  self->_lookupManager = v5;

  objc_initWeak(&location, self);
  v7 = self->_lookupManager;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
  v9 = objc_msgSend(v8, "_muid");
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100263B94;
  v15 = &unk_1011AE118;
  objc_copyWeak(&v18, &location);
  v10 = v4;
  v16 = v10;
  v17 = self;
  -[UGCSubmissionLookupManager fetchSubmissionWithICloudIDFor:completion:](v7, "fetchSubmissionWithICloudIDFor:completion:", v9, &v12);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentingViewController](self, "presentingViewController", v12, v13, v14, v15));
  objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)placePhotoGalleryDidSelectEditPhotoCredit:(id)a3
{
  ActionCoordination *actionCoordinator;
  id v4;

  actionCoordinator = self->_actionCoordinator;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentingViewController](self, "presentingViewController", a3));
  -[ActionCoordination viewControllerShowPhotoCredit:](actionCoordinator, "viewControllerShowPhotoCredit:", v4);

}

- (void)_performPunchoutWithPhoto:(id)a3 index:(unint64_t)a4 presentingViewController:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UGCPhotoGalleryCoordinator *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attribution"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "providerID"));
  +[GEOAPPortal captureUserAction:target:value:actionRichProviderId:](GEOAPPortal, "captureUserAction:target:value:actionRichProviderId:", 6018, 612, v11, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attribution"));
  if (+[MUPlaceAttributionUtilities shouldPresentStoreProductViewControllerWithAttribution:](MUPlaceAttributionUtilities, "shouldPresentStoreProductViewControllerWithAttribution:", v14))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "appAdamID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "providerID"));
    +[MUPlaceAttributionUtilities presentStoreProductViewControllerWithAppAdamID:bundleIdentifier:presentingViewController:](MUPlaceAttributionUtilities, "presentStoreProductViewControllerWithAppAdamID:bundleIdentifier:presentingViewController:", v15, v16, v9);

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "photoID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "urlsForPhotoWithIdentifier:", v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attribution"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MKPunchoutOptions punchoutOptionsForURLStrings:withAttribution:](MKPunchoutOptions, "punchoutOptionsForURLStrings:withAttribution:", v18, v19));

    if (objc_msgSend(v20, "strategy") == (id)1)
    {
      +[MKAppLaunchController launchAttributionURLs:withAttribution:usingTarget:completionHandler:](MKAppLaunchController, "launchAttributionURLs:withAttribution:usingTarget:completionHandler:", v18, v14, 665, 0);
    }
    else
    {
      v33 = self;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = v18;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v36;
        v31 = v20;
        v32 = v18;
        while (2)
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v36 != v23)
              objc_enumerationMutation(obj);
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i)));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "scheme"));
            if ((objc_msgSend(v26, "isEqualToString:", CFSTR("http")) & 1) != 0
              || (v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "scheme")),
                  v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("https")),
                  v27,
                  v28))
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator delegate](v33, "delegate"));
              objc_msgSend(v29, "poiEnrichmentCoordinator:openURL:", v33, v25);

              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "absoluteString"));
              +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 6050, 665, v30);

              v20 = v31;
              v18 = v32;
              goto LABEL_16;
            }

          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          v20 = v31;
          v18 = v32;
          if (v22)
            continue;
          break;
        }
      }

      +[MKAppLaunchController launchAttributionURLs:withAttribution:usingTarget:completionHandler:](MKAppLaunchController, "launchAttributionURLs:withAttribution:usingTarget:completionHandler:", obj, v14, 665, 0);
    }
LABEL_16:

  }
}

- (void)placePhotoViewerSceneWillDisconnect:(id)a3
{
  MacPlacePhotoViewerScene *photoViewerScene;
  id v5;

  photoViewerScene = self->_photoViewerScene;
  self->_photoViewerScene = 0;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator delegate](self, "delegate"));
  objc_msgSend(v5, "poiEnrichmentCoordinatorDidFinish:", self);

}

- (void)placePhotoGallery:(id)a3 didSelectReportImageAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  UGCReportImageryController *v9;
  void *v10;
  UGCReportImageryController *v11;
  UGCReportImageryController *reportImageryController;
  UGCReportImageryController *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_galleryPhotoList, "objectAtIndex:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoMapItemPhoto"));

  v9 = [UGCReportImageryController alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
  v11 = -[UGCReportImageryController initWithMapItem:reportedPhoto:presentingViewController:](v9, "initWithMapItem:reportedPhoto:presentingViewController:", v10, v8, v6);
  reportImageryController = self->_reportImageryController;
  self->_reportImageryController = v11;

  objc_msgSend(v6, "startAnimatingActivityIndicatorViewForRAP");
  v13 = self->_reportImageryController;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002644A8;
  v15[3] = &unk_1011AE140;
  v16 = v6;
  v14 = v6;
  -[UGCReportImageryController fetchLayoutAndPresentWithCompletion:](v13, "fetchLayoutAndPresentWithCompletion:", v15);

}

- (void)placePhotoGallery:(id)a3 selectedAddPhotoWithEntryPoint:(int64_t)a4 usingPresentationOptions:(id)a5
{
  _BOOL4 v7;
  id v8;
  void *v9;
  uint64_t v10;
  UGCPOIEnrichmentCoordinator *v11;
  UGCPOIEnrichmentCoordinator *poiEnrichmentCoordinator;
  void *v13;
  void *v14;

  v7 = a4 == 2;
  v8 = a3;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2147, 612, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
  if (a4 == 1)
    v10 = 1;
  else
    v10 = 2 * v7;
  v11 = (UGCPOIEnrichmentCoordinator *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator photoEmphasizedAddCoordinatorWithMapItem:preferredSourceType:originTarget:](UGCPOIEnrichmentCoordinator, "photoEmphasizedAddCoordinatorWithMapItem:preferredSourceType:originTarget:", v9, v10, CFSTR("PLACECARD_PHOTO_VIEWER_ALL")));
  poiEnrichmentCoordinator = self->_poiEnrichmentCoordinator;
  self->_poiEnrichmentCoordinator = v11;

  -[UGCPOIEnrichmentCoordinator setDelegate:](self->_poiEnrichmentCoordinator, "setDelegate:", self);
  -[UGCPOIEnrichmentCoordinator setPresentingViewController:](self->_poiEnrichmentCoordinator, "setPresentingViewController:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rightBarButtonItem"));
  -[UGCPOIEnrichmentCoordinator setAnchoringBarButtonItem:](self->_poiEnrichmentCoordinator, "setAnchoringBarButtonItem:", v14);

  -[UGCPOIEnrichmentCoordinator setSubmissionLookupObserver:](self->_poiEnrichmentCoordinator, "setSubmissionLookupObserver:", v8);
  -[UGCPOIEnrichmentCoordinator setPresentationContext:](self->_poiEnrichmentCoordinator, "setPresentationContext:", 1);
  -[UGCPOIEnrichmentCoordinator setPrefersDefaultPresentationOverContainee:](self->_poiEnrichmentCoordinator, "setPrefersDefaultPresentationOverContainee:", 1);
  -[UGCPOIEnrichmentCoordinator present](self->_poiEnrichmentCoordinator, "present");
}

- (id)placePhotoGalleryImageViewForPhotoAtIndex:(unint64_t)a3
{
  return -[UGCMorePhotosFeedViewController imageViewForIndex:](self->_galleryViewController, "imageViewForIndex:", a3);
}

- (void)placePhotoGalleryDidScrollToIndex:(unint64_t)a3
{
  -[UGCReportImageryController cancelPresentation](self->_reportImageryController, "cancelPresentation", a3);
  -[MUPlacePhotoGalleryViewController stopAnimatingActivityIndicatorViewForRAP](self->_fullScreenGalleryViewController, "stopAnimatingActivityIndicatorViewForRAP");
}

- (void)placePhotoGalleryDidScrollLeftToIndex:(unint64_t)a3
{
  -[UGCPhotoGalleryCoordinator _captureUserAction:atIndex:](self, "_captureUserAction:atIndex:", 6048, a3);
  -[UGCMorePhotosFeedViewController scrollToPhotoAtIndex:animated:](self->_galleryViewController, "scrollToPhotoAtIndex:animated:", a3, 0);
}

- (void)placePhotoGalleryDidScrollRightToIndex:(unint64_t)a3
{
  -[UGCPhotoGalleryCoordinator _captureUserAction:atIndex:](self, "_captureUserAction:atIndex:", 6049, a3);
  -[UGCMorePhotosFeedViewController scrollToPhotoAtIndex:animated:](self->_galleryViewController, "scrollToPhotoAtIndex:animated:", a3, 0);
}

- (void)_captureUserAction:(int)a3 atIndex:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), a4));
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v5, 612, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoGalleryCoordinator _attributionAtIndex:](self, "_attributionAtIndex:", a4));
  if (objc_msgSend(v8, "isUserSubmitted"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v11 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    +[GEOAPPortal captureUGCUserAction:target:value:photoSources:](GEOAPPortal, "captureUGCUserAction:target:value:photoSources:", v5, 612, v7, v10);

  }
}

- (id)_attributionAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (-[NSArray count](self->_galleryPhotoList, "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_galleryPhotoList, "objectAtIndexedSubscript:", a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attribution"));

  }
  return v6;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v6 = objc_alloc((Class)UIImageView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageViewForTransition, "image"));
  v8 = objc_msgSend(v6, "initWithImage:", v7);

  objc_msgSend(v8, "setContentMode:", -[UIImageView contentMode](self->_imageViewForTransition, "contentMode"));
  v9 = objc_msgSend(objc_alloc((Class)MUPhotoGalleryTransitionAnimator), "initWithView:transitionView:", self->_imageViewForTransition, v8);

  return v9;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v4 = a3;
  v5 = objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v9 = objc_opt_class(MUPlacePhotoGalleryViewController);
    isKindOfClass = objc_opt_isKindOfClass(v8, v9);

    if ((isKindOfClass & 1) == 0)
    {
      v18 = 0;
LABEL_10:

      goto LABEL_11;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

    if (v12)
    {
      v13 = objc_msgSend(v12, "indexOfVisibleView");
      if (v13 >= (id)-[NSArray count](self->_galleryPhotoList, "count"))
      {
        v18 = 0;
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController imageViewForIndex:](self->_galleryViewController, "imageViewForIndex:", v13));
        v15 = objc_alloc((Class)UIImageView);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "image"));
        v17 = objc_msgSend(v15, "initWithImage:", v16);

        objc_msgSend(v17, "setContentMode:", objc_msgSend(v14, "contentMode"));
        v18 = objc_msgSend(objc_alloc((Class)MUPhotoGalleryTransitionAnimator), "initWithView:transitionView:", v14, v17);

      }
      v6 = v12;
      goto LABEL_10;
    }
  }
  v18 = 0;
LABEL_11:

  return v18;
}

- (unint64_t)albumIndex
{
  return self->_albumIndex;
}

- (void)setAlbumIndex:(unint64_t)a3
{
  self->_albumIndex = a3;
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  self->_selectedIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupManager, 0);
  objc_storeStrong((id *)&self->_userAttributionResult, 0);
  objc_storeStrong((id *)&self->_actionCoordinator, 0);
  objc_storeStrong((id *)&self->_galleryPhotoList, 0);
  objc_storeStrong((id *)&self->_imageViewForTransition, 0);
  objc_storeStrong((id *)&self->_photoViewerScene, 0);
  objc_storeStrong((id *)&self->_reportImageryController, 0);
  objc_storeStrong((id *)&self->_poiEnrichmentCoordinator, 0);
  objc_storeStrong((id *)&self->_galleryViewController, 0);
  objc_storeStrong((id *)&self->_fullScreenGalleryViewController, 0);
}

@end
