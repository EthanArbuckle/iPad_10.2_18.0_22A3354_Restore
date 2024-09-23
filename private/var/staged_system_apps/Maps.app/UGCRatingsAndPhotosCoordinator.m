@implementation UGCRatingsAndPhotosCoordinator

- (UGCRatingsAndPhotosCoordinator)init
{
  UGCRatingsAndPhotosCoordinator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UGCRatingsAndPhotosCoordinator;
  result = -[UGCPOIEnrichmentCoordinator init](&v3, "init");
  if (result)
    result->_shouldShowThankYouScreen = 1;
  return result;
}

- (void)present
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)5)
    -[UGCRatingsAndPhotosCoordinator _macOSBasedPresentation](self, "_macOSBasedPresentation");
  else
    -[UGCRatingsAndPhotosCoordinator _iosBasedPresentation](self, "_iosBasedPresentation");
}

- (void)_iosBasedPresentation
{
  -[UGCRatingsAndPhotosCoordinator _startRatingsAndPhotosFlowWithInformedConsentIfNeeded](self, "_startRatingsAndPhotosFlowWithInformedConsentIfNeeded");
}

- (void)_macOSBasedPresentation
{
  _QWORD v3[5];

  if (-[UGCRatingsAndPhotosCoordinator shouldDismissPlacecard](self, "shouldDismissPlacecard")
    && !-[UGCRatingsAndPhotosCoordinator hasPhotoPickerEmphasis](self, "hasPhotoPickerEmphasis"))
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100A46874;
    v3[3] = &unk_1011AC860;
    v3[4] = self;
    -[UGCRatingsAndPhotosCoordinator _dismissPlacecardWithCompletion:](self, "_dismissPlacecardWithCompletion:", v3);
  }
  else
  {
    -[UGCRatingsAndPhotosCoordinator _startRatingsAndPhotosFlowWithInformedConsentIfNeeded](self, "_startRatingsAndPhotosFlowWithInformedConsentIfNeeded");
  }
}

- (BOOL)shouldDismissPlacecard
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v3, "userInterfaceIdiom") == (id)5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator placeCardDismissalDelegate](self, "placeCardDismissalDelegate"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentationDelegate](self, "presentationDelegate"));
      v6 = objc_opt_respondsToSelector(v5, "poiEnrichmentCoordinator:requestPresentingViewControllerWithBlock:");

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6 & 1;
}

- (void)_dismissPlacecardWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location[2];

  v4 = a3;
  if (v4)
  {
    objc_initWeak(location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentationDelegate](self, "presentationDelegate"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100A46A48;
    v6[3] = &unk_1011AE000;
    objc_copyWeak(&v8, location);
    v7 = v4;
    objc_msgSend(v5, "poiEnrichmentCoordinator:requestPresentingViewControllerWithBlock:", self, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0)", (uint8_t *)location, 2u);
  }

}

- (void)_startRatingsAndPhotosFlowWithInformedConsentIfNeeded
{
  if (MapsFeature_IsEnabled_ARPCommunityID(self)
    && GEOConfigGetBOOL(MapsConfig_ARPCommunityIDShouldRemovePrivacyScreenForRatingOnlyFlows, off_1014B4D88)&& !-[UGCRatingsAndPhotosCoordinator hasPhotoPickerEmphasis](self, "hasPhotoPickerEmphasis")&& !-[UGCPOIEnrichmentCoordinator entryPointRequiresARPPrivacyScreenIfNeeded](self, "entryPointRequiresARPPrivacyScreenIfNeeded"))
  {
    -[UGCRatingsAndPhotosCoordinator _startRatingsAndPhotosFlowDependentUponReviewedPlaceLookup](self, "_startRatingsAndPhotosFlowDependentUponReviewedPlaceLookup");
  }
  else
  {
    -[UGCRatingsAndPhotosCoordinator _startRatingsAndPhotosFlowRequiringInformedConsent](self, "_startRatingsAndPhotosFlowRequiringInformedConsent");
  }
}

- (void)_startRatingsAndPhotosFlowRequiringInformedConsent
{
  void *v3;
  int64_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentingViewController](self, "presentingViewController"));
  v4 = -[UGCPOIEnrichmentCoordinator presentationContext](self, "presentationContext");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A46BF0;
  v5[3] = &unk_1011B0AC0;
  objc_copyWeak(&v6, &location);
  +[UGCInformedConsentViewController presentIfNeededWithPresentingViewController:presentationContext:completion:](UGCInformedConsentViewController, "presentIfNeededWithPresentingViewController:presentationContext:completion:", v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_startRatingsAndPhotosFlowDependentUponReviewedPlaceLookup
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
  v4 = objc_msgSend(v3, "_muid");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_geoMapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_identifierHistory"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100A46D90;
  v8[3] = &unk_1011DC2E8;
  objc_copyWeak(&v9, &location);
  +[UGCReviewedPlaceManager fetchReviewedPlaceForMUID:withIdentifierHistory:completion:](UGCReviewedPlaceManager, "fetchReviewedPlaceForMUID:withIdentifierHistory:completion:", v4, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_startPOIEnrichmentFlow
{
  void *v3;
  void *v4;
  void *v5;
  id UInteger;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if ((MapsFeature_IsEnabled_SydneyARP(self, a2) & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_geoMapItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_placeQuestionnaire"));
    UInteger = objc_msgSend(v5, "maximumNumberOfPhotos");

  }
  else
  {
    UInteger = (id)GEOConfigGetUInteger(MapsConfig_UGCMaximumOfAddedPhotosPerSubmission, off_1014B37B8);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCSubmissionLookupResult previousSubmission](self->_existingSubmission, "previousSubmission"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "images"));
  v9 = objc_msgSend(v8, "count");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_geoMapItem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_placeQuestionnaire"));
  v13 = objc_msgSend(v12, "maximumNumberOfPhotos");

  if (-[UGCRatingsAndPhotosCoordinator hasPhotoPickerEmphasis](self, "hasPhotoPickerEmphasis") && UInteger && v9 < v13)
    -[UGCRatingsAndPhotosCoordinator _presentPhotoPickerWithMaxCount:](self, "_presentPhotoPickerWithMaxCount:", UInteger);
  else
    -[UGCRatingsAndPhotosCoordinator _presentPOIEnrichmentViewController](self, "_presentPOIEnrichmentViewController");
}

- (void)_startRatingsAndPhotosFlowWithSubmissionLookup
{
  void *v3;
  id v4;
  _TtC4Maps26UGCSubmissionLookupManager *v5;
  _TtC4Maps26UGCSubmissionLookupManager *lookupManager;
  uint64_t v7;
  _TtC4Maps26UGCSubmissionLookupManager *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  _TtC4Maps26UGCSubmissionLookupManager *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
  v4 = objc_msgSend(v3, "_muid");

  v5 = objc_alloc_init(_TtC4Maps26UGCSubmissionLookupManager);
  lookupManager = self->_lookupManager;
  self->_lookupManager = v5;

  if (MapsFeature_IsEnabled_ARPCommunityID(v7))
  {
    objc_initWeak(&location, self);
    v8 = self->_lookupManager;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_geoMapItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_identifierHistory"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100A470E4;
    v16[3] = &unk_1011DC360;
    objc_copyWeak(&v17, &location);
    -[UGCSubmissionLookupManager fetchSubmissionWithCommunityIDAndICloudIDFor:identifierHistory:clearCache:completion:](v8, "fetchSubmissionWithCommunityIDAndICloudIDFor:identifierHistory:clearCache:completion:", v4, v11, 1, v16);

    v12 = &v17;
  }
  else
  {
    objc_initWeak(&location, self);
    v13 = self->_lookupManager;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100A47148;
    v14[3] = &unk_1011DC360;
    objc_copyWeak(&v15, &location);
    -[UGCSubmissionLookupManager fetchSubmissionWithICloudIDFor:clearCache:completion:](v13, "fetchSubmissionWithICloudIDFor:clearCache:completion:", v4, 1, v14);
    v12 = &v15;
  }
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

- (void)_handleLookupSubmissionCompletion:(id)a3 lookupError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator submissionLookupObserver](self, "submissionLookupObserver"));
  objc_msgSend(v7, "endAnimatingActivityIndicatorWithError:", v6);

  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator submissionStatusDelegate](self, "submissionStatusDelegate"));
    v9 = objc_opt_respondsToSelector(v8, "poiEnrichmentCoordinator:didFinishSubmissionLookup:");

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator submissionStatusDelegate](self, "submissionStatusDelegate"));
      objc_msgSend(v10, "poiEnrichmentCoordinator:didFinishSubmissionLookup:", self, v14);

    }
    -[UGCRatingsAndPhotosCoordinator _failLookupWithError:](self, "_failLookupWithError:", v6);
  }
  else
  {
    -[UGCRatingsAndPhotosCoordinator setExistingSubmission:](self, "setExistingSubmission:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator submissionStatusDelegate](self, "submissionStatusDelegate"));
    v12 = objc_opt_respondsToSelector(v11, "poiEnrichmentCoordinator:didFinishSubmissionLookup:");

    if ((v12 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator submissionStatusDelegate](self, "submissionStatusDelegate"));
      objc_msgSend(v13, "poiEnrichmentCoordinator:didFinishSubmissionLookup:", self, v14);

    }
    -[UGCRatingsAndPhotosCoordinator _startPOIEnrichmentFlow](self, "_startPOIEnrichmentFlow");
  }

}

- (void)_presentPhotoPickerWithMaxCount:(unint64_t)a3
{
  UGCAddPhotosController *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  UGCAddPhotosController *v11;
  UGCAddPhotosController *photoPicker;
  uint8_t v13[16];

  if (self->_photoPicker)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: _photoPicker == ((void *)0)", v13, 2u);
    }
  }
  else
  {
    v5 = [UGCAddPhotosController alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentingViewController](self, "presentingViewController"));
    v7 = -[UGCRatingsAndPhotosCoordinator preferredSourceType](self, "preferredSourceType");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_geoMapItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_placeQuestionnaire"));
    v11 = -[UGCAddPhotosController initWithPresentingViewController:sourceType:multipleSelectionLimit:placeQuestionnaire:delegate:](v5, "initWithPresentingViewController:sourceType:multipleSelectionLimit:placeQuestionnaire:delegate:", v6, v7, a3, v10, self);
    photoPicker = self->_photoPicker;
    self->_photoPicker = v11;

    -[UGCAddPhotosController present](self->_photoPicker, "present");
  }
}

- (void)_presentPOIEnrichmentViewController
{
  void *v3;
  id v4;
  MacUGCPOIEnrichmentEditorViewController *v5;
  UGCPOIEnrichmentEditor *ratingContributionsViewController;
  MacUGCPOIEnrichmentEditorViewController *v7;
  UGCPOIEnrichmentContaineeViewController *v8;
  UGCPOIEnrichmentContaineeViewController *v9;
  UGCPOIEnrichmentContaineeViewController *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[UGCRatingsAndPhotosCoordinator _createPOIEnrichmentFormWithContext](self, "_createPOIEnrichmentFormWithContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)5)
  {
    v5 = -[MacUGCPOIEnrichmentEditorViewController initWithPOIEnrichmentForm:delegate:presentationContext:]([MacUGCPOIEnrichmentEditorViewController alloc], "initWithPOIEnrichmentForm:delegate:presentationContext:", v13, self, -[UGCPOIEnrichmentCoordinator presentationContext](self, "presentationContext"));
    -[MacUGCPOIEnrichmentEditorViewController setModalInPresentation:](v5, "setModalInPresentation:", 1);
    -[MacUGCPOIEnrichmentEditorViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 2);
    -[MacUGCPOIEnrichmentEditorViewController setSuppressRatings:](v5, "setSuppressRatings:", -[UGCRatingsAndPhotosCoordinator suppressRatings](self, "suppressRatings"));
    ratingContributionsViewController = self->_ratingContributionsViewController;
    self->_ratingContributionsViewController = (UGCPOIEnrichmentEditor *)v5;
    v7 = v5;

    v8 = (UGCPOIEnrichmentContaineeViewController *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentingViewController](self, "presentingViewController"));
    v9 = v8;
    v10 = (UGCPOIEnrichmentContaineeViewController *)v7;
LABEL_6:
    -[UGCPOIEnrichmentContaineeViewController presentViewController:animated:completion:](v8, "presentViewController:animated:completion:", v10, 1, 0);
LABEL_9:

    goto LABEL_10;
  }
  v9 = -[UGCPOIEnrichmentContaineeViewController initWithPOIEnrichmentForm:delegate:presentationContext:]([UGCPOIEnrichmentContaineeViewController alloc], "initWithPOIEnrichmentForm:delegate:presentationContext:", v13, self, -[UGCPOIEnrichmentCoordinator presentationContext](self, "presentationContext"));
  objc_storeStrong((id *)&self->_ratingContributionsViewController, v9);
  -[UGCPOIEnrichmentContaineeViewController setSuppressRatings:](v9, "setSuppressRatings:", -[UGCRatingsAndPhotosCoordinator suppressRatings](self, "suppressRatings"));
  if (-[UGCPOIEnrichmentCoordinator prefersDefaultPresentationOverContainee](self, "prefersDefaultPresentationOverContainee"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentingViewController](self, "presentingViewController"));

    if (v11)
    {
      -[UGCPOIEnrichmentContaineeViewController setShowCardBackground:](v9, "setShowCardBackground:", 1);
      -[UGCPOIEnrichmentContaineeViewController setTransitioningDelegate:](v9, "setTransitioningDelegate:", self);
      -[UGCPOIEnrichmentContaineeViewController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 4);
      -[UGCPOIEnrichmentContaineeViewController setModalInPresentation:](v9, "setModalInPresentation:", 1);
      v8 = (UGCPOIEnrichmentContaineeViewController *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentingViewController](self, "presentingViewController"));
      v7 = (MacUGCPOIEnrichmentEditorViewController *)v8;
      v10 = v9;
      goto LABEL_6;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator containerViewController](self, "containerViewController"));

  if (v12)
  {
    v7 = (MacUGCPOIEnrichmentEditorViewController *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator containerViewController](self, "containerViewController"));
    -[MacUGCPOIEnrichmentEditorViewController presentController:animated:](v7, "presentController:animated:", v9, 1);
    goto LABEL_9;
  }
LABEL_10:

  -[UGCPOIEnrichmentEditor setAccessibilityIdentifier:](self->_ratingContributionsViewController, "setAccessibilityIdentifier:", CFSTR("RatingsAndPhotosView"));
}

- (id)_createPOIEnrichmentFormWithContext
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v18;
  uint64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  int64_t v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_geoMapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_placeQuestionnaire"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsAndPhotosCoordinator existingSubmission](self, "existingSubmission"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentSubmissionIdentifier"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsAndPhotosCoordinator existingSubmission](self, "existingSubmission"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "previousSubmission"));

  if (-[UGCRatingsAndPhotosCoordinator isEditingSubmission](self, "isEditingSubmission"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scorecard"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UGCRatingsForm editRatingFormWithPlaceQuestionnaire:existingScorecard:](UGCRatingsForm, "editRatingFormWithPlaceQuestionnaire:existingScorecard:", v5, v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsAndPhotosCoordinator existingSubmission](self, "existingSubmission"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ratingsSubmissionIdentifier"));
    objc_msgSend(v11, "setParentSubmissionIdentifier:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "images"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotosForm editPhotosFormWithPlaceQuestionnaire:previouslySubmittedImages:](UGCPhotosForm, "editPhotosFormWithPlaceQuestionnaire:previouslySubmittedImages:", v5, v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsAndPhotosCoordinator existingSubmission](self, "existingSubmission"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "photosSubmissionIdentifier"));
    objc_msgSend(v15, "setParentSubmissionIdentifier:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
    v19 = objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentForm editPOIEnrichmentFormWithMapItem:parentSubmissionIdentifier:photosForm:ratingsForm:](UGCPOIEnrichmentForm, "editPOIEnrichmentFormWithMapItem:parentSubmissionIdentifier:photosForm:ratingsForm:", v18, v7, v15, v11));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UGCRatingsForm addRatingFormWithPlaceQuestionnaire:](UGCRatingsForm, "addRatingFormWithPlaceQuestionnaire:", v5));
    v20 = -[UGCRatingsAndPhotosCoordinator initialOverallState](self, "initialOverallState");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "overallCategory"));
    objc_msgSend(v21, "setCurrentState:", v20);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotosForm addPhotosFormWithPlaceQuestionnaire:photosWithMetadata:](UGCPhotosForm, "addPhotosFormWithPlaceQuestionnaire:photosWithMetadata:", v5, &__NSArray0__struct));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
    v19 = objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentForm addPOIEnrichmentFormWithMapItem:photosForm:ratingsForm:](UGCPOIEnrichmentForm, "addPOIEnrichmentFormWithMapItem:photosForm:ratingsForm:", v18, v15, v11));
  }
  v22 = (void *)v19;

  if (-[UGCRatingsAndPhotosCoordinator initialOverallState](self, "initialOverallState"))
  {
    v23 = -[UGCRatingsAndPhotosCoordinator initialOverallState](self, "initialOverallState");
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "overallCategory"));
    objc_msgSend(v24, "setCurrentState:", v23);

  }
  objc_msgSend(v15, "addPhotoListWithMetadata:", self->_initialPhotosWithMetadata);

  return v22;
}

- (BOOL)isEditingSubmission
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsAndPhotosCoordinator existingSubmission](self, "existingSubmission"));
  v3 = v2 != 0;

  return v3;
}

- (void)poiEnrichmentEditor:(id)a3 finishedFillingEnrichmentForm:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _TtC4Maps9UGCReport *v10;
  void *v11;
  _TtC4Maps9UGCReport *v12;
  UGCReviewedPlace *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t IsEnabled_SydneyARP;
  unint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  UGCReviewedPlace *v25;
  id v26[2];
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  UGCReviewedPlace *v32;
  id v33[2];
  _QWORD v34[4];
  id v35;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "submissionManager"));

  v10 = [_TtC4Maps9UGCReport alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator mapItem](self, "mapItem"));
  v12 = -[UGCReport initWithReportType:initialForm:mapItem:submitter:](v10, "initWithReportType:initialForm:mapItem:submitter:", 0, v7, v11, v9);

  v13 = -[UGCReport newReviewedPlace](v12, "newReviewedPlace");
  v14 = -[UGCReviewedPlace isDeleted](v13, "isDeleted");
  self->_userHasDeletedSubmission = v14;
  IsEnabled_SydneyARP = MapsFeature_IsEnabled_SydneyARP(v14, v15);
  v17 = IsEnabled_SydneyARP;
  if (MapsFeature_IsEnabled_ARPCommunityID(IsEnabled_SydneyARP))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsAndPhotosCoordinator existingSubmission](self, "existingSubmission"));
    -[UGCReport setShouldMigrateRatingsWithICloud:](v12, "setShouldMigrateRatingsWithICloud:", objc_msgSend(v18, "hasRatingsWithICloud"));

    objc_initWeak(&location, self);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100A47BE4;
    v34[3] = &unk_1011E0838;
    v19 = v6;
    v35 = v19;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100A47BF0;
    v29[3] = &unk_1011E0860;
    objc_copyWeak(v33, &location);
    v30 = v19;
    v31 = v7;
    v33[1] = (id)v17;
    v32 = v13;
    -[UGCReport submitRatingsAndPhotosWithUploadPolicy:progressBlock:completion:](v12, "submitRatingsAndPhotosWithUploadPolicy:progressBlock:completion:", v17, v34, v29);

    objc_destroyWeak(v33);
    v20 = v35;
  }
  else
  {
    objc_initWeak(&location, self);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100A47C68;
    v27[3] = &unk_1011E0838;
    v21 = v6;
    v28 = v21;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100A47C74;
    v22[3] = &unk_1011E0860;
    objc_copyWeak(v26, &location);
    v23 = v21;
    v24 = v7;
    v26[1] = (id)v17;
    v25 = v13;
    -[UGCReport submitRatingsAndPhotosSimultaneouslyUsingDSIDWithUploadPolicy:progressBlock:completion:](v12, "submitRatingsAndPhotosSimultaneouslyUsingDSIDWithUploadPolicy:progressBlock:completion:", v17, v27, v22);

    objc_destroyWeak(v26);
    v20 = v28;
  }

  objc_destroyWeak(&location);
}

- (void)submissionCompletionWithViewController:(id)a3 enrichmentForm:(id)a4 policy:(int64_t)a5 newReviewedPlace:(id)a6 response:(id)a7 error:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  UGCCommunityAcknowledgementViewController *v25;
  void *v26;
  id v27;
  UGCCommunityAcknowledgementViewController *v28;
  UGCCommunityAcknowledgementViewController *thankYouVC;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id location;
  _QWORD v39[5];
  id v40;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v14, "submissionFinishedWithError:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ratingsForm"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "photosForm"));
  -[UGCRatingsAndPhotosCoordinator captureAnalyticsForRatingsForm:photosForm:](self, "captureAnalyticsForRatingsForm:photosForm:", v19, v20);

  if (!v18 && !objc_msgSend(v17, "status"))
  {
    if (!a5)
      -[UGCPOIEnrichmentCoordinator invokeSubmissionUpdate](self, "invokeSubmissionUpdate");
    v21 = sub_100B3A5D4();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v22, "hintRefreshOfType:", 21);

    v23 = objc_opt_class(MacUGCPOIEnrichmentEditorViewController);
    if ((objc_opt_isKindOfClass(v14, v23) & 1) != 0)
    {
      if (self->_userHasDeletedSubmission)
      {
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_100A48044;
        v39[3] = &unk_1011AC8B0;
        v39[4] = self;
        v40 = v16;
        objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, v39);

        goto LABEL_4;
      }
      objc_initWeak(&location, self);
      v25 = [UGCCommunityAcknowledgementViewController alloc];
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[ARPAcknowledgementOptions defaultOptions](ARPAcknowledgementOptions, "defaultOptions"));
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100A48094;
      v34[3] = &unk_1011AFE28;
      v27 = v14;
      v35 = v27;
      objc_copyWeak(&v37, &location);
      v36 = v16;
      v28 = -[UGCCommunityAcknowledgementViewController initWithOptions:completion:](v25, "initWithOptions:completion:", v26, v34);
      thankYouVC = self->_thankYouVC;
      self->_thankYouVC = v28;

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController navigationItem](self->_thankYouVC, "navigationItem"));
      objc_msgSend(v30, "setHidesBackButton:", 1);

      objc_msgSend(v27, "presentViewController:animated:completion:", self->_thankYouVC, 1, 0);
      objc_destroyWeak(&v37);

    }
    else
    {
      v24 = objc_opt_class(UGCPOIEnrichmentContaineeViewController);
      if ((objc_opt_isKindOfClass(v14, v24) & 1) == 0)
        goto LABEL_4;
      objc_initWeak(&location, self);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100A481B4;
      v31[3] = &unk_1011AD1E8;
      objc_copyWeak(&v33, &location);
      v32 = v16;
      -[UGCRatingsAndPhotosCoordinator _dismissPOIEnrichmentEditorWithCompletion:](self, "_dismissPOIEnrichmentEditorWithCompletion:", v31);

      objc_destroyWeak(&v33);
    }
    objc_destroyWeak(&location);
    goto LABEL_4;
  }
  -[UGCRatingsAndPhotosCoordinator _presentFailedToSubmitAlertForResponse:withPresentingViewController:](self, "_presentFailedToSubmitAlertForResponse:withPresentingViewController:", v17, v14);
LABEL_4:

}

- (void)poiEnrichmentEditor:(id)a3 didSelectTermsOfServiceURL:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator delegate](self, "delegate"));
  objc_msgSend(v6, "poiEnrichmentCoordinator:openURL:", self, v5);

}

- (void)captureAnalyticsForRatingsForm:(id)a3 photosForm:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  id v15;
  char v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *j;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *k;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];

  v6 = a3;
  v7 = a4;
  v8 = -[UGCRatingsAndPhotosCoordinator _generateEntryPointForAnalytics:](self, "_generateEntryPointForAnalytics:", -[UGCPOIEnrichmentCoordinator entryPoint](self, "entryPoint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator originTarget](self, "originTarget"));
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 301, 666, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v10, "populateRatingPhotoSubmissionDetailsWithEntryPoint:originTarget:", v8, v9);

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allRatingCategories"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v50;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v13)
          objc_enumerationMutation(v11);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i), "isEdited") & 1) != 0)
        {
          LODWORD(v12) = 1;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  v15 = objc_msgSend(v7, "numberOfAddedPhotos");
  v16 = v12 ^ 1;
  if (!v15)
    v16 = 1;
  if ((v16 & 1) == 0)
  {
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2131, 666, 0);
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 343, 666, 0);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addedPhotos"));
    v18 = 0;
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(_QWORD *)v46 != v20)
            objc_enumerationMutation(v17);
          v18 = v18
              + objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j), "isSuggestedPhoto");
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v19);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
    objc_msgSend(v22, "populatePhotoSubmissionDetailsWithEntryPoint:numberOfPhotos:numberOfARPSuggestedPhotos:originTarget:", v8, objc_msgSend(v7, "numberOfAddedPhotos"), v18, v9);

    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100A48730;
    v38[3] = &unk_1011B2FB0;
    v40 = &v41;
    v39 = v6;
    objc_msgSend(v23, "populateRatingSubmissionDetailsWithEntryPoint:originTarget:specifierBlock:", v8, v9, v38);

LABEL_22:
    _Block_object_dispose(&v41, 8);
    goto LABEL_34;
  }
  if (!objc_msgSend(v7, "numberOfAddedPhotos"))
  {
    if (!(_DWORD)v12)
      goto LABEL_34;
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 343, 666, 0);
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100A4886C;
    v31[3] = &unk_1011B2FB0;
    v33 = &v41;
    v32 = v6;
    objc_msgSend(v30, "populateRatingSubmissionDetailsWithEntryPoint:originTarget:specifierBlock:", v8, v9, v31);

    goto LABEL_22;
  }
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2131, 666, 0);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addedPhotos"));
  v25 = 0;
  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v53, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v26; k = (char *)k + 1)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(v24);
        v25 = v25
            + objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)k), "isSuggestedPhoto");
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v53, 16);
    }
    while (v26);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v29, "populatePhotoSubmissionDetailsWithEntryPoint:numberOfPhotos:numberOfARPSuggestedPhotos:originTarget:", v8, objc_msgSend(v7, "numberOfAddedPhotos"), v25, v9);

LABEL_34:
}

- (int)_generateEntryPointForAnalytics:(int64_t)a3
{
  if (a3 == 3)
    return 2;
  else
    return a3 == 2;
}

- (void)_presentPushNotificationPromptIfNecessary
{
  +[PushNotificationPrompt checkShouldRepeatForUserAction:](PushNotificationPrompt, "checkShouldRepeatForUserAction:", &stru_1011E08A0);
}

- (void)_presentThirdPartyPhotoSharePromptIfNecessaryForReviewedPlace:(id)a3
{
  uint64_t v3;
  id v4;

  v4 = a3;
  if (MapsFeature_IsEnabled_SydneyARP(v4, v3) && objc_msgSend(v4, "numberOfPhotosAdded"))
    +[UGCThirdPartyPhotoSharingSplashViewController checkShouldPresentPhotoSharingSplash:](UGCThirdPartyPhotoSharingSplashViewController, "checkShouldPresentPhotoSharingSplash:", &stru_1011E08E0);

}

- (void)poiEnrichmenEditorDidCancel:(id)a3
{
  _QWORD v3[5];

  self->_shouldShowThankYouScreen = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100A48C84;
  v3[3] = &unk_1011AC860;
  v3[4] = self;
  -[UGCRatingsAndPhotosCoordinator _dismissPOIEnrichmentEditorWithCompletion:](self, "_dismissPOIEnrichmentEditorWithCompletion:", v3);
}

- (void)_presentFailedToSubmitAlertForResponse:(id)a3 withPresentingViewController:(id)a4
{
  _objc_msgSend(a4, "presentSubmissionFailureAlertForResponse:withCancelHandler:", a3, 0);
}

- (void)takePhotoControllerDidCancel:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A48D54;
  v5[3] = &unk_1011AD260;
  objc_copyWeak(&v6, &location);
  -[UGCRatingsAndPhotosCoordinator _dismissPhotoPickerWithCompletion:](self, "_dismissPhotoPickerWithCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)takePhotoController:(id)a3 didSelectPhotosWithMetadata:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v6 = a3;
  v7 = a4;
  -[UGCRatingsAndPhotosCoordinator setInitialPhotosWithMetadata:](self, "setInitialPhotosWithMetadata:", v7);
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100A48E5C;
  v8[3] = &unk_1011AD260;
  objc_copyWeak(&v9, &location);
  -[UGCRatingsAndPhotosCoordinator _dismissPhotoPickerWithCompletion:](self, "_dismissPhotoPickerWithCompletion:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_dismissPhotoPickerWithCompletion:(id)a3
{
  id v4;
  UGCAddPhotosController *photoPicker;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  photoPicker = self->_photoPicker;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100A48F10;
  v7[3] = &unk_1011AE240;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[UGCAddPhotosController dismissWithCompletion:](photoPicker, "dismissWithCompletion:", v7);

}

- (id)addPhotosControllerRequestsAnchoringBarButtonItem:(id)a3
{
  return -[UGCPOIEnrichmentCoordinator anchoringBarButtonItem](self, "anchoringBarButtonItem", a3);
}

- (void)_failLookupWithError:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentingViewController](self, "presentingViewController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100A490B4;
  v6[3] = &unk_1011AD260;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "presentLookupFailureAlertWithCancelHandler:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)_failWithAccountErrorWithPresentingViewController:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A49198;
  v5[3] = &unk_1011AD260;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "presentLoginFailureAlertWithCancelHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)_dismissPOIEnrichmentEditorWithCompletion:(id)a3
{
  id v4;
  _QWORD *v5;
  UGCPOIEnrichmentEditor *ratingContributionsViewController;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  UGCCommunityAcknowledgementViewController *v13;
  void *v14;
  UGCCommunityAcknowledgementViewController *v15;
  UGCCommunityAcknowledgementViewController *thankYouVC;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  UGCRatingsAndPhotosCoordinator *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100A49414;
  v27[3] = &unk_1011AE240;
  v27[4] = self;
  v4 = a3;
  v28 = v4;
  v5 = objc_retainBlock(v27);
  ratingContributionsViewController = self->_ratingContributionsViewController;
  v7 = objc_opt_class(MacUGCPOIEnrichmentEditorViewController);
  if ((objc_opt_isKindOfClass(ratingContributionsViewController, v7) & 1) != 0
    || -[UGCPOIEnrichmentCoordinator prefersDefaultPresentationOverContainee](self, "prefersDefaultPresentationOverContainee")&& (v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentingViewController](self, "presentingViewController")), v8, v8))
  {
    -[UGCPOIEnrichmentEditor dismissViewControllerAnimated:completion:](self->_ratingContributionsViewController, "dismissViewControllerAnimated:completion:", 1, v5);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator containerViewController](self, "containerViewController"));

    if (v9)
    {
      if (MapsFeature_IsEnabled_SydneyARP(v10, v11)
        && self->_shouldShowThankYouScreen
        && !self->_userHasDeletedSubmission)
      {
        v13 = [UGCCommunityAcknowledgementViewController alloc];
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[ARPAcknowledgementOptions defaultOptions](ARPAcknowledgementOptions, "defaultOptions"));
        v21 = _NSConcreteStackBlock;
        v22 = 3221225472;
        v23 = sub_100A49450;
        v24 = &unk_1011AE240;
        v25 = self;
        v26 = v5;
        v15 = -[UGCCommunityAcknowledgementViewController initWithOptions:completion:](v13, "initWithOptions:completion:", v14, &v21);
        thankYouVC = self->_thankYouVC;
        self->_thankYouVC = v15;

        v17 = objc_alloc((Class)UINavigationController);
        v18 = objc_msgSend(v17, "initWithRootViewController:", self->_thankYouVC, v21, v22, v23, v24, v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController navigationItem](self->_thankYouVC, "navigationItem"));
        objc_msgSend(v19, "setHidesBackButton:", 1);

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "presentationController"));
        objc_msgSend(v20, "setDelegate:", self);

        -[UGCPOIEnrichmentEditor presentViewController:animated:completion:](self->_ratingContributionsViewController, "presentViewController:animated:completion:", v18, 1, 0);
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator containeeDelegate](self, "containeeDelegate"));
        objc_msgSend(v12, "containeeViewControllerGoToPreviousState:withSender:", self->_ratingContributionsViewController, 0);

        ((void (*)(_QWORD *))v5[2])(v5);
      }
    }
  }

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  MapsFormSheetPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[MapsFormSheetPresentationController initWithPresentedViewController:presentingViewController:]([MapsFormSheetPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  return v8;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  -[UGCCommunityAcknowledgementViewController triggerCompletionBlock](self->_thankYouVC, "triggerCompletionBlock", a3);
}

- (int64_t)initialOverallState
{
  return self->_initialOverallState;
}

- (void)setInitialOverallState:(int64_t)a3
{
  self->_initialOverallState = a3;
}

- (NSArray)initialPhotosWithMetadata
{
  return self->_initialPhotosWithMetadata;
}

- (void)setInitialPhotosWithMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_initialPhotosWithMetadata, a3);
}

- (BOOL)hasPhotoPickerEmphasis
{
  return self->_hasPhotoPickerEmphasis;
}

- (void)setHasPhotoPickerEmphasis:(BOOL)a3
{
  self->_hasPhotoPickerEmphasis = a3;
}

- (BOOL)suppressRatings
{
  return self->_suppressRatings;
}

- (void)setSuppressRatings:(BOOL)a3
{
  self->_suppressRatings = a3;
}

- (int64_t)preferredSourceType
{
  return self->_preferredSourceType;
}

- (void)setPreferredSourceType:(int64_t)a3
{
  self->_preferredSourceType = a3;
}

- (UGCSubmissionLookupResult)existingSubmission
{
  return self->_existingSubmission;
}

- (void)setExistingSubmission:(id)a3
{
  objc_storeStrong((id *)&self->_existingSubmission, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingSubmission, 0);
  objc_storeStrong((id *)&self->_initialPhotosWithMetadata, 0);
  objc_storeStrong((id *)&self->_lookupManager, 0);
  objc_storeStrong((id *)&self->_photoPicker, 0);
  objc_storeStrong((id *)&self->_thankYouVC, 0);
  objc_storeStrong((id *)&self->_ratingContributionsViewController, 0);
}

@end
