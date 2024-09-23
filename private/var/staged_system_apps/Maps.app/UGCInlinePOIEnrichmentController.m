@implementation UGCInlinePOIEnrichmentController

- (UGCInlinePOIEnrichmentController)initWithMapItem:(id)a3
{
  id v5;
  UGCInlinePOIEnrichmentController *v6;
  UGCInlinePOIEnrichmentController *v7;
  uint64_t v8;
  MKLocationManager *locationManager;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UGCInlinePOIEnrichmentController;
  v6 = -[UGCInlinePOIEnrichmentController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[MKLocationManager unretainedUGCInstance](MKLocationManager, "unretainedUGCInstance"));
    locationManager = v7->_locationManager;
    v7->_locationManager = (MKLocationManager *)v8;

  }
  return v7;
}

- (void)setSubmissionStatus:(id)a3
{
  MUPlaceCallToActionAppearance *v5;
  MUPlaceCallToActionAppearance *v6;
  unsigned __int8 v7;
  MUPlaceCallToActionAppearance *v8;

  v5 = (MUPlaceCallToActionAppearance *)a3;
  v6 = v5;
  if (self->_submissionStatus != v5)
  {
    v8 = v5;
    v7 = -[MUPlaceCallToActionAppearance isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_submissionStatus, a3);
      -[UGCInlinePOIEnrichmentViewController setFormInteractionEnabled:](self->_inlineViewController, "setFormInteractionEnabled:", -[UGCInlinePOIEnrichmentController _isLoading](self, "_isLoading") ^ 1);
      v6 = v8;
    }
  }

}

- (void)setLookupResult:(id)a3
{
  UGCSubmissionLookupResult *v5;
  UGCSubmissionLookupResult *v6;
  unsigned __int8 v7;
  UGCSubmissionLookupResult *v8;

  v5 = (UGCSubmissionLookupResult *)a3;
  v6 = v5;
  if (self->_lookupResult != v5)
  {
    v8 = v5;
    v7 = -[UGCSubmissionLookupResult isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lookupResult, a3);
      -[UGCInlinePOIEnrichmentController _reloadInlineViewController](self, "_reloadInlineViewController");
      v6 = v8;
    }
  }

}

- (UIViewController)contentViewController
{
  UIViewController *contentViewController;
  UIViewController *v4;
  UIViewController *v5;

  contentViewController = self->_contentViewController;
  if (!contentViewController)
  {
    v4 = (UIViewController *)objc_alloc_init((Class)UIViewController);
    v5 = self->_contentViewController;
    self->_contentViewController = v4;

    -[UIViewController _mapsui_resetViewLayoutMargins](self->_contentViewController, "_mapsui_resetViewLayoutMargins");
    -[UGCInlinePOIEnrichmentController _reloadInlineViewController](self, "_reloadInlineViewController");
    contentViewController = self->_contentViewController;
  }
  return contentViewController;
}

- (BOOL)_isLoading
{
  MUPlaceCallToActionAppearance *submissionStatus;

  submissionStatus = self->_submissionStatus;
  if (submissionStatus)
    LOBYTE(submissionStatus) = -[MUPlaceCallToActionAppearance type](submissionStatus, "type") == (id)5;
  return (char)submissionStatus;
}

- (id)_previousSubmission
{
  UGCSubmissionLookupResult *lookupResult;

  lookupResult = self->_lookupResult;
  if (lookupResult)
  {
    if ((id)-[UGCSubmissionLookupResult status](lookupResult, "status") == (id)1)
      lookupResult = (UGCSubmissionLookupResult *)objc_claimAutoreleasedReturnValue(-[UGCSubmissionLookupResult previousSubmission](self->_lookupResult, "previousSubmission"));
    else
      lookupResult = 0;
  }
  return lookupResult;
}

- (void)_reloadInlineViewController
{
  UGCInlinePOIEnrichmentViewController *inlineViewController;
  void *v4;
  UGCInlinePOIEnrichmentViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UGCPOIEnrichmentForm *v18;
  void *v19;
  void *v20;
  void *v21;
  UGCPOIEnrichmentForm *poiEnrichmentForm;
  UGCPOIEnrichmentForm *v23;
  UGCInlinePOIEnrichmentViewController *v24;
  UGCInlinePOIEnrichmentViewController *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;

  inlineViewController = self->_inlineViewController;
  if (inlineViewController)
  {
    -[UGCInlinePOIEnrichmentViewController willMoveToParentViewController:](inlineViewController, "willMoveToParentViewController:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentViewController view](self->_inlineViewController, "view"));
    objc_msgSend(v4, "removeFromSuperview");

    -[UGCInlinePOIEnrichmentViewController removeFromParentViewController](self->_inlineViewController, "removeFromParentViewController");
    v5 = self->_inlineViewController;
    self->_inlineViewController = 0;

  }
  v33 = (id)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController _previousSubmission](self, "_previousSubmission"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController mapItem](self, "mapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_geoMapItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_placeQuestionnaire"));
  if (v33)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "scorecard"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UGCRatingsForm editRatingFormWithPlaceQuestionnaire:existingScorecard:](UGCRatingsForm, "editRatingFormWithPlaceQuestionnaire:existingScorecard:", v8, v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController mapItem](self, "mapItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_geoMapItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_placeQuestionnaire"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "images"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotosForm editPhotosFormWithPlaceQuestionnaire:previouslySubmittedImages:](UGCPhotosForm, "editPhotosFormWithPlaceQuestionnaire:previouslySubmittedImages:", v13, v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController mapItem](self, "mapItem"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UGCSubmissionLookupResult parentSubmissionIdentifier](self->_lookupResult, "parentSubmissionIdentifier"));
    v18 = (UGCPOIEnrichmentForm *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentForm editPOIEnrichmentFormWithMapItem:parentSubmissionIdentifier:photosForm:ratingsForm:](UGCPOIEnrichmentForm, "editPOIEnrichmentFormWithMapItem:parentSubmissionIdentifier:photosForm:ratingsForm:", v16, v17, v15, v10));

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UGCRatingsForm addRatingFormWithPlaceQuestionnaire:](UGCRatingsForm, "addRatingFormWithPlaceQuestionnaire:", v8));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController mapItem](self, "mapItem"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_geoMapItem"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_placeQuestionnaire"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotosForm addPhotosFormWithPlaceQuestionnaire:photosWithMetadata:](UGCPhotosForm, "addPhotosFormWithPlaceQuestionnaire:photosWithMetadata:", v21, &__NSArray0__struct));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController mapItem](self, "mapItem"));
    v18 = (UGCPOIEnrichmentForm *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentForm addPOIEnrichmentFormWithMapItem:photosForm:ratingsForm:](UGCPOIEnrichmentForm, "addPOIEnrichmentFormWithMapItem:photosForm:ratingsForm:", v16, v15, v10));
  }

  poiEnrichmentForm = self->_poiEnrichmentForm;
  self->_poiEnrichmentForm = v18;
  v23 = v18;

  v24 = -[UGCInlinePOIEnrichmentViewController initWithPOIEnrichmentForm:]([UGCInlinePOIEnrichmentViewController alloc], "initWithPOIEnrichmentForm:", v23);
  v25 = self->_inlineViewController;
  self->_inlineViewController = v24;

  -[UGCInlinePOIEnrichmentViewController setEnrichmentController:](self->_inlineViewController, "setEnrichmentController:", self);
  -[UGCInlinePOIEnrichmentViewController setFormInteractionEnabled:](self->_inlineViewController, "setFormInteractionEnabled:", -[UGCInlinePOIEnrichmentController _isLoading](self, "_isLoading") ^ 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentViewController view](self->_inlineViewController, "view"));
  objc_msgSend(v26, "setPreservesSuperviewLayoutMargins:", 1);

  -[UIViewController addChildViewController:](self->_contentViewController, "addChildViewController:", self->_inlineViewController);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_contentViewController, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentViewController view](self->_inlineViewController, "view"));
  objc_msgSend(v27, "addSubview:", v28);

  -[UGCInlinePOIEnrichmentViewController didMoveToParentViewController:](self->_inlineViewController, "didMoveToParentViewController:", self->_contentViewController);
  v29 = objc_alloc((Class)MUEdgeLayout);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentViewController view](self->_inlineViewController, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_contentViewController, "view"));

  v32 = objc_msgSend(v29, "initWithItem:container:", v30, v31);
  objc_msgSend(v32, "activate");

}

- (void)submitForCurrentState
{
  -[UGCInlinePOIEnrichmentController _submitWithUploadPolicy:completion:](self, "_submitWithUploadPolicy:completion:", 1, &stru_1011B2F38);
}

- (void)_submitWithUploadPolicy:(int64_t)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  _TtC4Maps9UGCReport *v9;
  UGCPOIEnrichmentForm *poiEnrichmentForm;
  void *v11;
  _TtC4Maps9UGCReport *v12;
  id inited;
  _QWORD *v14;
  id *v15;
  id v16;
  NSObject *v17;
  const char *v18;
  id v19;
  _QWORD v20[6];
  id v21;
  _QWORD v22[6];
  id v23;
  id location[2];

  v6 = (void (**)(_QWORD))a4;
  if (!-[UGCPOIEnrichmentForm isEdited](self->_poiEnrichmentForm, "isEdited"))
  {
    v16 = sub_100371A04();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      v18 = "The form is not edited so not submitting";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v18, (uint8_t *)location, 2u);
    }
LABEL_10:

    v6[2](v6);
    goto LABEL_13;
  }
  if (!-[UGCPOIEnrichmentForm isComplete](self->_poiEnrichmentForm, "isComplete"))
  {
    v19 = sub_100371A04();
    v17 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      v18 = "The form is not complete so bailing";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "submissionManager"));

  v9 = [_TtC4Maps9UGCReport alloc];
  poiEnrichmentForm = self->_poiEnrichmentForm;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController mapItem](self, "mapItem"));
  v12 = -[UGCReport initWithReportType:initialForm:mapItem:submitter:](v9, "initWithReportType:initialForm:mapItem:submitter:", 0, poiEnrichmentForm, v11, v8);

  inited = objc_initWeak(location, self);
  if (MapsFeature_IsEnabled_ARPCommunityID(inited))
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100371CB0;
    v22[3] = &unk_1011B2F60;
    v14 = v22;
    v15 = &v23;
    objc_copyWeak(&v23, location);
    v22[4] = self;
    v22[5] = v6;
    -[UGCReport submitRatingsAndPhotosWithUploadPolicy:progressBlock:completion:](v12, "submitRatingsAndPhotosWithUploadPolicy:progressBlock:completion:", a3, 0, v22);
  }
  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100371DD0;
    v20[3] = &unk_1011B2F60;
    v14 = v20;
    v15 = &v21;
    objc_copyWeak(&v21, location);
    v20[4] = self;
    v20[5] = v6;
    -[UGCReport submitRatingsAndPhotosSimultaneouslyUsingDSIDWithUploadPolicy:progressBlock:completion:](v12, "submitRatingsAndPhotosSimultaneouslyUsingDSIDWithUploadPolicy:progressBlock:completion:", a3, 0, v20);
  }

  objc_destroyWeak(v15);
  objc_destroyWeak(location);

LABEL_13:
}

- (void)presentInformedConsentIfNeededWithCompletion:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100371F94;
  v7[3] = &unk_1011B2F88;
  v8 = v4;
  v6 = v4;
  +[UGCInformedConsentViewController presentIfNeededWithPresentingViewController:presentationContext:completion:](UGCInformedConsentViewController, "presentIfNeededWithPresentingViewController:presentationContext:completion:", WeakRetained, 1, v7);

}

- (void)requestAddPhotosWithSourceType:(int64_t)a3 presentationOptions:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController mapItem](self, "mapItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator photoEmphasizedAddCoordinatorWithMapItem:preferredSourceType:originTarget:suppressRatings:](UGCPOIEnrichmentCoordinator, "photoEmphasizedAddCoordinatorWithMapItem:preferredSourceType:originTarget:suppressRatings:", v7, a3, CFSTR("PLACECARD_BUSINESS_INFO"), 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceView"));
  objc_msgSend(v8, "setAnchoringView:", v9);

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003720E4;
  v11[3] = &unk_1011AD1E8;
  objc_copyWeak(&v13, &location);
  v10 = v8;
  v12 = v10;
  -[UGCInlinePOIEnrichmentController _submitWithUploadPolicy:completion:](self, "_submitWithUploadPolicy:completion:", 0, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)captureUserActionForRatingState:(int64_t)a3 value:(id)a4 target:(int)a5
{
  uint64_t v5;
  unsigned int v7;
  uint64_t v8;
  id v9;
  id v10;

  v5 = *(_QWORD *)&a5;
  if (a3 == 1)
    v7 = 298;
  else
    v7 = 0;
  if (a3 == 2)
    v8 = 299;
  else
    v8 = v7;
  v9 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController analyticsController](self, "analyticsController"));
  objc_msgSend(v10, "instrumentAction:target:eventValue:moduleType:feedbackType:", v8, v5, v9, 6, 0);

}

- (void)captureUserAction:(int)a3 value:(id)a4 target:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController analyticsController](self, "analyticsController"));
  objc_msgSend(v9, "instrumentAction:target:eventValue:moduleType:feedbackType:", v6, v5, v8, 6, 0);

}

- (void)captureAnalyticsForRatingsForm:(id)a3 photosForm:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void **v25;
  uint64_t v26;
  BOOL (*v27)(uint64_t, _QWORD *, BOOL *);
  void *v28;
  id v29;
  uint64_t *v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController analyticsController](self, "analyticsController"));
  objc_msgSend(v8, "instrumentAction:target:eventValue:moduleType:feedbackType:", 301, 201, 0, 6, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v9, "populateRatingPhotoSubmissionDetailsWithEntryPoint:originTarget:", 2, CFSTR("PLACECARD_INLINE"));

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allRatingCategories"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v10);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i), "isEdited") & 1) != 0)
        {
          LODWORD(v11) = 1;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  v14 = objc_msgSend(v7, "numberOfAddedPhotos");
  v15 = v11 ^ 1;
  if (!v14)
    v15 = 1;
  if ((v15 & 1) != 0)
  {
    if (objc_msgSend(v7, "numberOfAddedPhotos"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController analyticsController](self, "analyticsController"));
      objc_msgSend(v20, "instrumentAction:target:eventValue:moduleType:feedbackType:", 2131, 201, 0, 6, 0);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
      objc_msgSend(v21, "populatePhotoSubmissionDetailsWithEntryPoint:numberOfPhotos:numberOfARPSuggestedPhotos:originTarget:", 2, objc_msgSend(v7, "numberOfAddedPhotos"), 0, CFSTR("PLACECARD_INLINE"));

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController analyticsController](self, "analyticsController"));
      objc_msgSend(v22, "instrumentAction:target:eventValue:moduleType:feedbackType:", 2131, 201, 0, 6, 0);

      goto LABEL_20;
    }
    if (!(_DWORD)v11)
      goto LABEL_20;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
    v25 = _NSConcreteStackBlock;
    v26 = 3221225472;
    v27 = sub_100372794;
    v28 = &unk_1011B2FB0;
    v30 = &v34;
    v29 = v6;
    objc_msgSend(v23, "populateRatingSubmissionDetailsWithEntryPoint:originTarget:specifierBlock:", 2, CFSTR("PLACECARD_INLINE"), &v25);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController analyticsController](self, "analyticsController", v25, v26, v27, v28));
    objc_msgSend(v24, "instrumentAction:target:eventValue:moduleType:feedbackType:", 343, 201, 0, 6, 0);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
    objc_msgSend(v16, "populatePhotoSubmissionDetailsWithEntryPoint:numberOfPhotos:numberOfARPSuggestedPhotos:originTarget:", 2, objc_msgSend(v7, "numberOfAddedPhotos"), 0, CFSTR("PLACECARD_INLINE"));

    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100372658;
    v31[3] = &unk_1011B2FB0;
    v33 = &v34;
    v32 = v6;
    objc_msgSend(v17, "populateRatingSubmissionDetailsWithEntryPoint:originTarget:specifierBlock:", 2, CFSTR("PLACECARD_INLINE"), v31);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController analyticsController](self, "analyticsController"));
    objc_msgSend(v18, "instrumentAction:target:eventValue:moduleType:feedbackType:", 2131, 201, 0, 6, 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController analyticsController](self, "analyticsController"));
    objc_msgSend(v19, "instrumentAction:target:eventValue:moduleType:feedbackType:", 343, 201, 0, 6, 0);

  }
  _Block_object_dispose(&v34, 8);
LABEL_20:

}

- (void)openTermsOfServiceURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController delegate](self, "delegate"));
  objc_msgSend(v5, "inlinePOIEnrichmentController:didSelectTermsOfServiceURL:", self, v4);

}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (UGCInlinePOIEnrichmentControllerDelegate)delegate
{
  return (UGCInlinePOIEnrichmentControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (MUPlaceCardAnalyticsController)analyticsController
{
  return (MUPlaceCardAnalyticsController *)objc_loadWeakRetained((id *)&self->_analyticsController);
}

- (void)setAnalyticsController:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsController, a3);
}

- (MUPlaceCallToActionAppearance)submissionStatus
{
  return self->_submissionStatus;
}

- (UGCSubmissionLookupResult)lookupResult
{
  return self->_lookupResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupResult, 0);
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_destroyWeak((id *)&self->_analyticsController);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_poiEnrichmentForm, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_inlineViewController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
