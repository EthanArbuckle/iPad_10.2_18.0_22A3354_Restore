@implementation UGCCallToActionViewProvider

- (UGCCallToActionViewProvider)initWithDelegate:(id)a3
{
  id v4;
  UGCCallToActionViewProvider *v5;
  UGCCallToActionViewProvider *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UGCCallToActionViewProvider;
  v5 = -[UGCCallToActionViewProvider init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "submissionManager"));
    objc_msgSend(v8, "addObserver:", v6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UGCSubmissionLookupManager cancelIfNeeded](self->_lookupManager, "cancelIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "submissionManager"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)UGCCallToActionViewProvider;
  -[UGCCallToActionViewProvider dealloc](&v5, "dealloc");
}

- (MUPlaceCallToActionAppearance)submissionStatusAppearance
{
  void *v3;
  int64_t v4;
  uint64_t v5;

  if (-[UGCCallToActionViewProvider isResolving](self, "isResolving"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MUPlaceCallToActionAppearance userRecommendedLoadingAppearance](MUPlaceCallToActionAppearance, "userRecommendedLoadingAppearance"));
  }
  else if (-[UGCCallToActionViewProvider hasUserAlreadyRatedThisPlace](self, "hasUserAlreadyRatedThisPlace"))
  {
    if (-[UGCCallToActionViewProvider currentRatingCategoryState](self, "currentRatingCategoryState")
      || (v3 = -[UGCCallToActionViewProvider numberOfPhotosAddedForSubmission](self, "numberOfPhotosAddedForSubmission")) != 0)
    {
      v4 = -[UGCCallToActionViewProvider currentRatingCategoryState](self, "currentRatingCategoryState");
      if (v4 == 2)
        v5 = 2;
      else
        v5 = v4 == 1;
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[MUPlaceCallToActionAppearance userRecommendedAppearanceForRatingState:numberOfPhotosAdded:](MUPlaceCallToActionAppearance, "userRecommendedAppearanceForRatingState:numberOfPhotosAdded:", v5, -[UGCCallToActionViewProvider numberOfPhotosAddedForSubmission](self, "numberOfPhotosAddedForSubmission")));
    }
  }
  else
  {
    v3 = 0;
  }
  return (MUPlaceCallToActionAppearance *)v3;
}

- (BOOL)canAddRatingOrPhoto
{
  return +[MKPOIEnrichmentAvailibility shouldShowCallToActionForMapItem:](MKPOIEnrichmentAvailibility, "shouldShowCallToActionForMapItem:", self->_mapItem);
}

- (void)setMapItem:(id)a3
{
  MKMapItem *v5;
  MKMapItem *v6;

  v5 = (MKMapItem *)a3;
  if (self->_mapItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    -[UGCCallToActionViewProvider _restart](self, "_restart");
    v5 = v6;
  }

}

- (void)setAlwaysRefinesUserSubmission:(BOOL)a3
{
  if (self->_alwaysRefinesUserSubmission != a3)
  {
    self->_alwaysRefinesUserSubmission = a3;
    -[UGCCallToActionViewProvider _restart](self, "_restart");
  }
}

- (void)_restart
{
  id WeakRetained;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[UGCCallToActionViewProvider cancel](self, "cancel");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "callToActionViewProviderDidFinishClearingExistingState:", self);

  -[UGCCallToActionViewProvider _resolveForCurrentState](self, "_resolveForCurrentState");
}

- (void)_resolveForCurrentState
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id buf;
  _QWORD v16[5];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = sub_10043310C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Resolving current state", (uint8_t *)&buf, 2u);
  }

  if (-[MKMapItem _muid](self->_mapItem, "_muid"))
  {
    -[UGCCallToActionViewProvider setIsResolving:](self, "setIsResolving:", 1);
    if (-[UGCCallToActionViewProvider canAddRatingOrPhoto](self, "canAddRatingOrPhoto"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "callToActionViewProviderInitialLoadingStateDidChange:", self);

      objc_initWeak(&buf, self);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10092D78C;
      v11[3] = &unk_1011DC2E8;
      v6 = &v12;
      objc_copyWeak(&v12, &buf);
      -[UGCCallToActionViewProvider _resolveForEditWithCompletion:](self, "_resolveForEditWithCompletion:", v11);
    }
    else
    {
      v9 = sub_10043310C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "This POI does not support ratings/photos.  Will not show CTA but will check if we reviewed this place", (uint8_t *)&buf, 2u);
      }

      objc_initWeak(&buf, self);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10092D558;
      v13[3] = &unk_1011DC2E8;
      v6 = &v14;
      objc_copyWeak(&v14, &buf);
      -[UGCCallToActionViewProvider _resolveForEditWithCompletion:](self, "_resolveForEditWithCompletion:", v13);
    }
    objc_destroyWeak(v6);
    objc_destroyWeak(&buf);
  }
  else
  {
    v7 = sub_10043310C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Map item does not have MUID. Early exit.", (uint8_t *)&buf, 2u);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10092D518;
    v16[3] = &unk_1011AC860;
    v16[4] = self;
    -[UGCCallToActionViewProvider _finishResolvingWithBlock:](self, "_finishResolvingWithBlock:", v16);
  }
}

- (void)_resolveForEditWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location[2];

  v4 = a3;
  if (v4)
  {
    objc_initWeak(location, self);
    v5 = -[MKMapItem _muid](self->_mapItem, "_muid");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_identifierHistory"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10092DB24;
    v8[3] = &unk_1011DC338;
    v8[4] = self;
    v9 = v4;
    objc_copyWeak(&v10, location);
    +[UGCReviewedPlaceManager fetchReviewedPlaceForMUID:withIdentifierHistory:completion:](UGCReviewedPlaceManager, "fetchReviewedPlaceForMUID:withIdentifierHistory:completion:", v5, v7, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(location);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0)", (uint8_t *)location, 2u);
  }

}

- (void)resolveForUserEdit
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[UGCCallToActionViewProvider cancel](self, "cancel");
  -[UGCCallToActionViewProvider _resolveForCurrentState](self, "_resolveForCurrentState");
}

- (void)cancel
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[UGCSubmissionLookupManager cancelIfNeeded](self->_lookupManager, "cancelIfNeeded");
  -[UGCCallToActionViewProvider setHasUserAlreadyRatedThisPlace:](self, "setHasUserAlreadyRatedThisPlace:", 0);
  -[UGCCallToActionViewProvider setCurrentRatingCategoryState:](self, "setCurrentRatingCategoryState:", 0);
  -[UGCCallToActionViewProvider setNumberOfPhotosAddedForSubmission:](self, "setNumberOfPhotosAddedForSubmission:", 0);
  -[UGCCallToActionViewProvider setLookupResult:](self, "setLookupResult:", 0);
  -[UGCCallToActionViewProvider setIsResolving:](self, "setIsResolving:", 0);
  -[UGCCallToActionViewProvider setFirstPhotoURL:](self, "setFirstPhotoURL:", 0);
}

- (void)updateWithFetchedLookupResult:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  uint8_t v7[16];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (objc_msgSend(v4, "status") == (id)1)
  {
    -[UGCCallToActionViewProvider cancel](self, "cancel");
    -[UGCCallToActionViewProvider setHasUserAlreadyRatedThisPlace:](self, "setHasUserAlreadyRatedThisPlace:", 1);
    -[UGCCallToActionViewProvider setLookupResult:](self, "setLookupResult:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "previousSubmission"));
    -[UGCCallToActionViewProvider _updateWithPOIEnrichment:](self, "_updateWithPOIEnrichment:", v5);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "callToActionViewProviderDidFinishResolvingEditState:", self);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: lookupResult.status == UGCSubmissionLookupStatusSuccess", v7, 2u);
  }

}

- (void)refineUserSubmissionForMapItem:(id)a3
{
  id v4;
  _TtC4Maps26UGCSubmissionLookupManager *v5;
  _TtC4Maps26UGCSubmissionLookupManager *lookupManager;
  uint64_t v7;
  _TtC4Maps26UGCSubmissionLookupManager *v8;
  id v9;
  void *v10;
  void *v11;
  id *v12;
  _TtC4Maps26UGCSubmissionLookupManager *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[UGCSubmissionLookupManager cancelIfNeeded](self->_lookupManager, "cancelIfNeeded");
  v5 = objc_alloc_init(_TtC4Maps26UGCSubmissionLookupManager);
  lookupManager = self->_lookupManager;
  self->_lookupManager = v5;

  if (MapsFeature_IsEnabled_ARPCommunityID(v7))
  {
    objc_initWeak(&location, self);
    v8 = self->_lookupManager;
    v9 = objc_msgSend(v4, "_muid");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_geoMapItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_identifierHistory"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10092E058;
    v17[3] = &unk_1011DC360;
    objc_copyWeak(&v18, &location);
    -[UGCSubmissionLookupManager fetchSubmissionWithCommunityIDAndICloudIDFor:identifierHistory:completion:](v8, "fetchSubmissionWithCommunityIDAndICloudIDFor:identifierHistory:completion:", v9, v11, v17);

    v12 = &v18;
  }
  else
  {
    objc_initWeak(&location, self);
    v13 = self->_lookupManager;
    v14 = objc_msgSend(v4, "_muid");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10092E15C;
    v15[3] = &unk_1011DC360;
    objc_copyWeak(&v16, &location);
    -[UGCSubmissionLookupManager fetchSubmissionWithICloudIDFor:completion:](v13, "fetchSubmissionWithICloudIDFor:completion:", v14, v15);
    v12 = &v16;
  }
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

}

- (void)_handleLookupSubmissionCompletion:(id)a3 lookupError:(id)a4
{
  void *v5;
  void (*v6)(uint64_t);
  void ***v7;
  id v8;
  void **v9;
  void **v10;

  v8 = a3;
  -[UGCCallToActionViewProvider setLookupResult:](self, "setLookupResult:", v8);
  if (objc_msgSend(v8, "status") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "previousSubmission"));
    -[UGCCallToActionViewProvider _updateWithPOIEnrichment:](self, "_updateWithPOIEnrichment:", v5);

    v10 = _NSConcreteStackBlock;
    v6 = sub_10092E31C;
    v7 = &v10;
  }
  else
  {
    v9 = _NSConcreteStackBlock;
    v6 = sub_10092E35C;
    v7 = &v9;
  }
  v7[1] = (void **)3221225472;
  v7[2] = (void **)v6;
  v7[3] = (void **)&unk_1011AC860;
  v7[4] = (void **)&self->super.isa;
  -[UGCCallToActionViewProvider _finishResolvingWithBlock:](self, "_finishResolvingWithBlock:");

}

- (void)_updateWithPOIEnrichment:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "scorecard"));
  v5 = objc_msgSend(v4, "hasRecommended");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "scorecard"));
    if (objc_msgSend(v6, "recommended"))
      v7 = 2;
    else
      v7 = 1;
    -[UGCCallToActionViewProvider setCurrentRatingCategoryState:](self, "setCurrentRatingCategoryState:", v7);

  }
  else
  {
    -[UGCCallToActionViewProvider setCurrentRatingCategoryState:](self, "setCurrentRatingCategoryState:", 0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "images"));
  -[UGCCallToActionViewProvider setNumberOfPhotosAddedForSubmission:](self, "setNumberOfPhotosAddedForSubmission:", objc_msgSend(v8, "count"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "images"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

  v11 = objc_claimAutoreleasedReturnValue(-[UGCCallToActionViewProvider firstPhotoURL](self, "firstPhotoURL"));
  v12 = v11 | v10;

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCallToActionViewProvider firstPhotoURL](self, "firstPhotoURL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "absoluteString"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "url"));
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "url"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v17));
      -[UGCCallToActionViewProvider setFirstPhotoURL:](self, "setFirstPhotoURL:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "imageId"));
      -[UGCCallToActionViewProvider setFirstPhotoID:](self, "setFirstPhotoID:", v19);

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCallToActionViewProvider firstPhotoURL](self, "firstPhotoURL"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "imageId"));
      objc_msgSend(WeakRetained, "callToActionViewProviderDidUpdateWithPreferredUserUploadedPhoto:photoID:numberOfPhotos:", v21, v22, -[UGCCallToActionViewProvider numberOfPhotosAddedForSubmission](self, "numberOfPhotosAddedForSubmission"));

    }
  }

}

- (void)_retrievePhotoURLWithCompletion:(id)a3
{
  void (**v4)(id, void *, void *, unint64_t);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _TtC4Maps26UGCSubmissionLookupManager *v10;
  _TtC4Maps26UGCSubmissionLookupManager *lookupManager;
  _TtC4Maps26UGCSubmissionLookupManager *v12;
  _QWORD v13[4];
  void (**v14)(id, void *, void *, unint64_t);
  id v15;
  id location;

  v4 = (void (**)(id, void *, void *, unint64_t))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCallToActionViewProvider firstPhotoURL](self, "firstPhotoURL"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCallToActionViewProvider firstPhotoURL](self, "firstPhotoURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCallToActionViewProvider firstPhotoID](self, "firstPhotoID"));
    v4[2](v4, v6, v7, -[UGCCallToActionViewProvider numberOfPhotosAddedForSubmission](self, "numberOfPhotosAddedForSubmission"));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCallToActionViewProvider mapItem](self, "mapItem"));
    v9 = objc_msgSend(v8, "_muid");

    -[UGCSubmissionLookupManager cancelIfNeeded](self->_lookupManager, "cancelIfNeeded");
    v10 = objc_alloc_init(_TtC4Maps26UGCSubmissionLookupManager);
    lookupManager = self->_lookupManager;
    self->_lookupManager = v10;

    objc_initWeak(&location, self);
    v12 = self->_lookupManager;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10092E720;
    v13[3] = &unk_1011DC388;
    objc_copyWeak(&v15, &location);
    v14 = v4;
    -[UGCSubmissionLookupManager fetchSubmissionWithICloudIDFor:completion:](v12, "fetchSubmissionWithICloudIDFor:completion:", v9, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

- (void)_finishResolvingWithBlock:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UGCCallToActionViewProvider setIsResolving:](self, "setIsResolving:", 0);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (void)feedbackSubmissionManagerCompletedSubmissionWithMUID:(unint64_t)a3 withError:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  unint64_t v13;
  __int16 v14;
  id v15;

  v6 = a4;
  if (MapsFeature_IsEnabled_SydneyARP(v6, v7))
  {
    v8 = sub_10043310C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 134218242;
      v13 = a3;
      v14 = 2112;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FeedbackSubmissionManager did complete photo submission for muid: %llu error: %@", (uint8_t *)&v12, 0x16u);
    }

    if (!v6)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCallToActionViewProvider mapItem](self, "mapItem"));
      v11 = objc_msgSend(v10, "_muid");

      if (v11 == (id)a3)
        -[UGCCallToActionViewProvider resolveForUserEdit](self, "resolveForUserEdit");
    }
  }

}

- (UGCSubmissionLookupResult)lookupResult
{
  return self->_lookupResult;
}

- (void)setLookupResult:(id)a3
{
  objc_storeStrong((id *)&self->_lookupResult, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (BOOL)alwaysRefinesUserSubmission
{
  return self->_alwaysRefinesUserSubmission;
}

- (BOOL)hasUserAlreadyRatedThisPlace
{
  return self->_hasUserAlreadyRatedThisPlace;
}

- (void)setHasUserAlreadyRatedThisPlace:(BOOL)a3
{
  self->_hasUserAlreadyRatedThisPlace = a3;
}

- (int64_t)currentRatingCategoryState
{
  return self->_currentRatingCategoryState;
}

- (void)setCurrentRatingCategoryState:(int64_t)a3
{
  self->_currentRatingCategoryState = a3;
}

- (unint64_t)numberOfPhotosAddedForSubmission
{
  return self->_numberOfPhotosAddedForSubmission;
}

- (void)setNumberOfPhotosAddedForSubmission:(unint64_t)a3
{
  self->_numberOfPhotosAddedForSubmission = a3;
}

- (NSURL)firstPhotoURL
{
  return self->_firstPhotoURL;
}

- (void)setFirstPhotoURL:(id)a3
{
  objc_storeStrong((id *)&self->_firstPhotoURL, a3);
}

- (NSString)firstPhotoID
{
  return self->_firstPhotoID;
}

- (void)setFirstPhotoID:(id)a3
{
  objc_storeStrong((id *)&self->_firstPhotoID, a3);
}

- (BOOL)isResolving
{
  return self->_isResolving;
}

- (void)setIsResolving:(BOOL)a3
{
  self->_isResolving = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPhotoID, 0);
  objc_storeStrong((id *)&self->_firstPhotoURL, 0);
  objc_storeStrong((id *)&self->_lookupResult, 0);
  objc_storeStrong((id *)&self->_lookupManager, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
