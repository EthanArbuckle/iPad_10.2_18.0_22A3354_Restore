@implementation RAPReportComposerViewController

- (RAPReportComposerViewController)initWithReport:(id)a3 categoryQuestion:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  RAPReportComposerViewController *v12;
  RAPReportComposerViewController *v13;
  id v14;
  id completion;
  void ***v16;
  RAPReportComposerCategoryViewController *v17;
  void *v18;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t);
  void *v23;
  id v24;
  id location;
  objc_super v26;
  RAPReportComposerCategoryViewController *v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)RAPReportComposerViewController;
  v12 = -[RAPReportComposerViewController initWithNibName:bundle:](&v26, "initWithNibName:bundle:", 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_report, a3);
    v14 = objc_msgSend(v11, "copy");
    completion = v13->_completion;
    v13->_completion = v14;

    objc_initWeak(&location, v13);
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_1009F4100;
    v23 = &unk_1011DF400;
    objc_copyWeak(&v24, &location);
    v16 = objc_retainBlock(&v20);
    -[RAPReportComposerViewController _registerForPrivacyNotification](v13, "_registerForPrivacyNotification", v20, v21, v22, v23);
    v17 = -[RAPReportComposerCategoryViewController initWithReport:question:completion:]([RAPReportComposerCategoryViewController alloc], "initWithReport:question:completion:", v13->_report, v10, v16);
    v27 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
    -[RAPReportComposerViewController setViewControllers:](v13, "setViewControllers:", v18);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (RAPReportComposerViewController)initWithReport:(id)a3 placecardQuestion:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  RAPReportComposerViewController *v10;
  RAPReportComposerViewController *v11;
  id v12;
  id completion;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RAPReportComposerViewController;
  v10 = -[RAPReportComposerViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", 0, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_report, a3);
    v12 = objc_msgSend(v9, "copy");
    completion = v11->_completion;
    v11->_completion = v12;

    -[RAPReportComposerViewController _registerForPrivacyNotification](v11, "_registerForPrivacyNotification");
  }

  return v11;
}

- (RAPReportComposerViewController)initWithReport:(id)a3 lookAroundQuestion:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  RAPReportComposerViewController *v12;
  RAPReportComposerViewController *v13;
  id v14;
  id completion;
  void ***v16;
  RAPLookAroundInitialCategoriesViewController *v17;
  RAPLookAroundInitialCategoriesViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, uint64_t);
  void *v26;
  id v27;
  id location;
  objc_super v29;
  RAPLookAroundInitialCategoriesViewController *v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)RAPReportComposerViewController;
  v12 = -[RAPReportComposerViewController initWithNibName:bundle:](&v29, "initWithNibName:bundle:", 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_report, a3);
    v14 = objc_msgSend(v11, "copy");
    completion = v13->_completion;
    v13->_completion = v14;

    objc_initWeak(&location, v13);
    v23 = _NSConcreteStackBlock;
    v24 = 3221225472;
    v25 = sub_1009F4480;
    v26 = &unk_1011DF400;
    objc_copyWeak(&v27, &location);
    v16 = objc_retainBlock(&v23);
    v17 = [RAPLookAroundInitialCategoriesViewController alloc];
    v18 = -[RAPLookAroundInitialCategoriesViewController initWithReport:question:completion:](v17, "initWithReport:question:completion:", v9, v10, v16, v23, v24, v25, v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerViewController _cancelButtonWithSelector:](v13, "_cancelButtonWithSelector:", "_exitLookAround"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController navigationItem](v18, "navigationItem"));
    objc_msgSend(v20, "setLeftBarButtonItem:", v19);

    -[RAPReportComposerViewController _registerForPrivacyNotification](v13, "_registerForPrivacyNotification");
    -[RAPReportComposerViewController setOverrideUserInterfaceStyle:](v13, "setOverrideUserInterfaceStyle:", 2);
    v30 = v18;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
    -[RAPReportComposerViewController setViewControllers:](v13, "setViewControllers:", v21);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (RAPReportComposerViewController)initWithReport:(id)a3 curatedCollectionQuestion:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  RAPReportComposerViewController *v12;
  RAPReportComposerViewController *v13;
  id v14;
  id completion;
  id v16;
  _QWORD *v17;
  RAPCuratedCollectionPOISelectionViewController *v18;
  _QWORD *v19;
  RAPCuratedCollectionPOISelectionViewController *v20;
  RAPCuratedCollectionCategoriesViewController *v21;
  RAPCuratedCollectionPOISelectionViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  id v31;
  id location;
  objc_super v33;
  RAPCuratedCollectionPOISelectionViewController *v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)RAPReportComposerViewController;
  v12 = -[RAPReportComposerViewController initWithNibName:bundle:](&v33, "initWithNibName:bundle:", 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_report, a3);
    v14 = objc_retainBlock(v11);
    completion = v13->_completion;
    v13->_completion = v14;

    objc_initWeak(&location, v13);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1009F47E8;
    v29[3] = &unk_1011DF428;
    objc_copyWeak(&v31, &location);
    v16 = v10;
    v30 = v16;
    v17 = objc_retainBlock(v29);
    if (objc_msgSend(v16, "selectedQuestionType") == (id)3)
    {
      v18 = [RAPCuratedCollectionPOISelectionViewController alloc];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1009F4874;
      v28[3] = &unk_1011DF450;
      v19 = v28;
      v28[4] = v17;
      v20 = -[RAPCuratedCollectionPOISelectionViewController initWithReport:parentQuestion:completion:](v18, "initWithReport:parentQuestion:completion:", v9, v16, v28);
    }
    else
    {
      v21 = [RAPCuratedCollectionCategoriesViewController alloc];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1009F4880;
      v27[3] = &unk_1011DF450;
      v19 = v27;
      v27[4] = v17;
      v20 = -[RAPCuratedCollectionCategoriesViewController initWithReport:question:completion:](v21, "initWithReport:question:completion:", v9, v16, v27);
    }
    v22 = v20;

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerViewController _cancelButtonWithSelector:](v13, "_cancelButtonWithSelector:", "_exitCommentCorrections"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionPOISelectionViewController navigationItem](v22, "navigationItem"));
    objc_msgSend(v24, "setLeftBarButtonItem:", v23);

    v34 = v22;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
    -[RAPReportComposerViewController setViewControllers:](v13, "setViewControllers:", v25);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (RAPReportComposerViewController)initWithReport:(id)a3 commentQuestion:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  RAPReportComposerViewController *v12;
  RAPReportComposerViewController *v13;
  id v14;
  id completion;
  RAPReportComposerCommentViewController *v16;
  RAPReportComposerCommentViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, uint64_t);
  void *v25;
  id v26;
  id location;
  objc_super v28;
  RAPReportComposerCommentViewController *v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)RAPReportComposerViewController;
  v12 = -[RAPReportComposerViewController initWithNibName:bundle:](&v28, "initWithNibName:bundle:", 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_report, a3);
    v14 = objc_retainBlock(v11);
    completion = v13->_completion;
    v13->_completion = v14;

    objc_initWeak(&location, v13);
    v16 = [RAPReportComposerCommentViewController alloc];
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_1009F4AB0;
    v25 = &unk_1011DF400;
    objc_copyWeak(&v26, &location);
    v17 = -[RAPReportComposerCommentViewController initWithReport:question:completion:](v16, "initWithReport:question:completion:", v9, v10, &v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerViewController _cancelButtonWithSelector:](v13, "_cancelButtonWithSelector:", "_exitCuratedCollections", v22, v23, v24, v25));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCommentViewController navigationItem](v17, "navigationItem"));
    objc_msgSend(v19, "setLeftBarButtonItem:", v18);

    v29 = v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    -[RAPReportComposerViewController setViewControllers:](v13, "setViewControllers:", v20);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (id)_cancelButtonWithSelector:(SEL)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = objc_alloc((Class)UIBarButtonItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Cancel [Report a Problem Placecard]"), CFSTR("localized string not found"), 0));
  v8 = objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 0, self, a3);

  return v8;
}

- (void)_registerForPrivacyNotification
{
  id v3;

  self->_shouldInstrumentPrivacyCancelOnNextBackAction = 0;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_handlePrivacyCancelledNotification:", CFSTR("RAPUserDidCancelPrivacyAgreementNotification"), 0);

}

- (void)_handlePrivacyCancelledNotification:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerViewController _maps_uiScene](self, "_maps_uiScene"));

  if (v4 == v5)
    self->_shouldInstrumentPrivacyCancelOnNextBackAction = 1;
}

- (void)_capturePrivacyBackActionIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (self->_shouldInstrumentPrivacyCancelOnNextBackAction)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerViewController topViewController](self, "topViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerViewController rootViewController](self, "rootViewController"));

    if (v3 == v4)
      v5 = 10109;
    else
      v5 = 10111;
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v5, 1136, 0);
    self->_shouldInstrumentPrivacyCancelOnNextBackAction = 0;
  }
}

- (void)_exitLookAround
{
  -[RAPReportComposerViewController _capturePrivacyBackActionIfNeeded](self, "_capturePrivacyBackActionIfNeeded");
  -[RAPReportComposerViewController _cancelWithAnalyticsTarget:](self, "_cancelWithAnalyticsTarget:", 1151);
}

- (void)_exitPlaceCorrections
{
  -[RAPReportComposerViewController _capturePrivacyBackActionIfNeeded](self, "_capturePrivacyBackActionIfNeeded");
  -[RAPReportComposerViewController _cancelWithAnalyticsTarget:](self, "_cancelWithAnalyticsTarget:", 1155);
}

- (void)_exitCuratedCollections
{
  -[RAPReportComposerViewController _capturePrivacyBackActionIfNeeded](self, "_capturePrivacyBackActionIfNeeded");
  -[RAPReportComposerViewController _cancelWithAnalyticsTarget:](self, "_cancelWithAnalyticsTarget:", 0);
}

- (void)_exitCommentCorrections
{
  -[RAPReportComposerViewController _capturePrivacyBackActionIfNeeded](self, "_capturePrivacyBackActionIfNeeded");
  -[RAPReportComposerViewController _cancelWithAnalyticsTarget:](self, "_cancelWithAnalyticsTarget:", 0);
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerViewController topViewController](self, "topViewController"));
  if (objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___RAPInstrumentableTarget))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if ((objc_opt_respondsToSelector(v7, "backAction") & 1) != 0)
    v8 = (uint64_t)objc_msgSend(v7, "backAction");
  else
    v8 = 10111;
  if (objc_msgSend(v7, "analyticTarget"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v9, "captureUserAction:onTarget:eventValue:", v8, objc_msgSend(v7, "analyticTarget"), 0);

  }
  -[RAPReportComposerViewController _capturePrivacyBackActionIfNeeded](self, "_capturePrivacyBackActionIfNeeded");
  v13.receiver = self;
  v13.super_class = (Class)RAPReportComposerViewController;
  v10 = -[RAPReportComposerViewController popViewControllerAnimated:](&v13, "popViewControllerAnimated:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (void)_invokeCompletionWithOutcome:(int64_t)a3
{
  void (**completion)(id, RAPReportComposerViewController *, int64_t);
  id v5;

  completion = (void (**)(id, RAPReportComposerViewController *, int64_t))self->_completion;
  if (completion)
  {
    completion[2](completion, self, a3);
    v5 = self->_completion;
    self->_completion = 0;

  }
}

- (void)_sendWithFinalOutcome:(int64_t)a3 acknowledgementOptions:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  UGCCommunityAcknowledgementViewController *v22;
  UGCCommunityAcknowledgementViewController *v23;
  void *v24;
  void *v25;
  void *v26;
  RAPNavigationItemValues *v27;
  void *v28;
  RAPReport *report;
  UGCCommunityAcknowledgementViewController *v30;
  id v31;
  RAPNavigationItemValues *v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  UGCCommunityAcknowledgementViewController *v37;
  id v38;
  RAPNavigationItemValues *v39;
  id v40;
  _QWORD v41[4];
  UGCCommunityAcknowledgementViewController *v42;
  RAPReportComposerViewController *v43;
  int64_t v44;
  _QWORD v45[5];
  _QWORD v46[4];
  id v47[2];
  id location[2];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerViewController topViewController](self, "topViewController"));
  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___RAPInstrumentableTarget))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v35 = v9;
  if (objc_msgSend(v9, "analyticTarget"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self->_report, "initialQuestion"));
    v11 = objc_opt_class(RAPMainQuestion);
    isKindOfClass = objc_opt_isKindOfClass(v10, v11);

    if ((isKindOfClass & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self->_report, "initialQuestion"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectedMenuItem"));
      if (objc_msgSend(v14, "conformsToProtocol:", &OBJC_PROTOCOL___RAPInstrumentableTarget))
        v15 = v14;
      else
        v15 = 0;
      v16 = v15;

      if ((objc_opt_respondsToSelector(v16, "eventValue") & 1) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
        v18 = v6;
        v19 = objc_msgSend(v35, "analyticTarget");
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "eventValue"));
        v21 = v19;
        v6 = v18;
        objc_msgSend(v17, "captureUserAction:onTarget:eventValue:", 2152, v21, v20);

      }
      else
      {
        +[RAPAnalyticsManager captureRAPSendActionFromReport:](RAPAnalyticsManager, "captureRAPSendActionFromReport:", self->_report);
      }

    }
    else
    {
      +[RAPAnalyticsManager captureRAPSendActionFromReport:](RAPAnalyticsManager, "captureRAPSendActionFromReport:", self->_report);
    }
  }
  objc_initWeak(location, self);
  v22 = [UGCCommunityAcknowledgementViewController alloc];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1009F52D8;
  v46[3] = &unk_1011B72B0;
  objc_copyWeak(v47, location);
  v47[1] = (id)a3;
  v34 = v6;
  v23 = -[UGCCommunityAcknowledgementViewController initWithOptions:completion:](v22, "initWithOptions:completion:", v6, v46);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCommunityAcknowledgementViewController navigationItem](v23, "navigationItem"));
  objc_msgSend(v24, "setHidesBackButton:", 1);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerViewController topViewController](self, "topViewController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "navigationItem"));
  v27 = objc_alloc_init(RAPNavigationItemValues);
  -[RAPNavigationItemValues takeValuesFromNavigationItem:](v27, "takeValuesFromNavigationItem:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "view"));
  report = self->_report;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1009F5334;
  v45[3] = &unk_1011DF478;
  v45[4] = self;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1009F5570;
  v41[3] = &unk_1011DF4A0;
  v42 = v23;
  v43 = self;
  v44 = a3;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1009F5650;
  v36[3] = &unk_1011DF4C8;
  v36[4] = self;
  v30 = v42;
  v37 = v30;
  v31 = v26;
  v38 = v31;
  v32 = v27;
  v39 = v32;
  v33 = v28;
  v40 = v33;
  -[RAPReport submitWithPrivacyRequestHandler:willStartSubmitting:didFinishSubmitting:](report, "submitWithPrivacyRequestHandler:willStartSubmitting:didFinishSubmitting:", v45, v41, v36);

  objc_destroyWeak(v47);
  objc_destroyWeak(location);

}

- (void)_cancelWithAnalyticsTarget:(int)a3
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 10109, *(_QWORD *)&a3, 0);
  -[RAPReportComposerViewController _invokeCompletionWithOutcome:](self, "_invokeCompletionWithOutcome:", 0);
}

- (void)segueToViewController:(id)a3
{
  -[RAPReportComposerViewController pushViewController:animated:](self, "pushViewController:animated:", a3, 1);
}

- (void)segueToViewController:(id)a3 afterReturningFromViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllers"));
  v9 = objc_msgSend(v8, "mutableCopy");

  if (v6)
    objc_msgSend(v9, "removeObject:", v6);
  objc_msgSend(v9, "addObject:", v10);
  -[RAPReportComposerViewController setViewControllers:animated:](self, "setViewControllers:animated:", v9, 1);

}

- (void)returnFromViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerViewController navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));
  v6 = objc_msgSend(v5, "indexOfObject:", v14);

  if (v6 && v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v14;
    if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___RAPInstrumentableTarget))
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (objc_msgSend(v9, "analyticTarget"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      objc_msgSend(v10, "captureUserAction:onTarget:eventValue:", 10111, objc_msgSend(v9, "analyticTarget"), 0);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerViewController navigationController](self, "navigationController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewControllers"));
    v13 = objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "trimToLength:", v6);
    -[RAPReportComposerViewController setViewControllers:animated:](self, "setViewControllers:animated:", v13, 1);

  }
}

- (RAPReport)report
{
  return self->_report;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendSpinner, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_report, 0);
}

@end
