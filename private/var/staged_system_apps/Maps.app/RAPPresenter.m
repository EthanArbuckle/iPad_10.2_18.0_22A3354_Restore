@implementation RAPPresenter

- (RAPPresenter)initWithSceneDelegate:(id)a3
{
  id v4;
  RAPPresenter *v5;
  RAPPresenter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RAPPresenter;
  v5 = -[RAPPresenter init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_sceneDelegate, v4);

  return v6;
}

- (BOOL)presentOfflineAlertIfNecessaryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v6 = objc_msgSend(v5, "isUsingOfflineMaps");

  if (v6)
  {
    v7 = sub_100432F4C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Attempting to report an issue while using Offline Maps. Presenting error alert.", buf, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v10 = objc_msgSend(v9, "isUsingForcedOfflineMaps");

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = v11;
    if (v10)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("REPORT_AN_ISSUE_FORCED_OFFLINE_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = v14;
      v16 = CFSTR("REPORT_AN_ISSUE_FORCED_OFFLINE_ALERT_MESSAGE");
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("REPORT_AN_ISSUE_OFFLINE_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = v14;
      v16 = CFSTR("REPORT_AN_ISSUE_OFFLINE_ALERT_MESSAGE");
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, CFSTR("localized string not found"), CFSTR("Offline")));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v13, v17, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("REPORT_AN_ISSUE_OFFLINE_ALERT_ACTION"), CFSTR("localized string not found"), CFSTR("Offline")));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100C42D70;
    v23[3] = &unk_1011AD960;
    v24 = v4;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 1, v23));
    objc_msgSend(v18, "addAction:", v21);

    -[RAPPresenter presentViewController:animated:](self, "presentViewController:animated:", v18, 1);
  }

  return v6;
}

- (void)presentAddAPlaceFromPlacecardWithEditingContext:(id)a3 overriddenUserInterfaceStyle:(int64_t)a4 shouldShowDetailedFlow:(BOOL)a5 sourceView:(id)a6 entryPoint:(int)a7 completion:(id)a8
{
  uint64_t v9;
  _BOOL4 v11;
  id v13;
  id v14;
  id v15;
  void *v16;
  RAPAppStateCreator *v17;
  id WeakRetained;
  RAPAppStateCreator *v19;
  _QWORD v20[4];
  id v21;
  RAPPresenter *v22;
  id v23;
  id v24;
  int v25;

  v9 = *(_QWORD *)&a7;
  v11 = a5;
  v13 = a3;
  v14 = a6;
  v15 = a8;
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", v15))
  {
    if (v11)
    {
      -[RAPPresenter _presentAddAPlaceFromEntryPoint:withEditingBlock:completion:](self, "_presentAddAPlaceFromEntryPoint:withEditingBlock:completion:", v9, v13, v15);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
      objc_msgSend(v16, "setUserInteractionEnabled:", 0);

      v17 = [RAPAppStateCreator alloc];
      WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
      v19 = -[RAPAppStateCreator initWithSceneDelegate:](v17, "initWithSceneDelegate:", WeakRetained);

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100C42EDC;
      v20[3] = &unk_1011E9AA8;
      v21 = v14;
      v22 = self;
      v23 = v13;
      v25 = v9;
      v24 = v15;
      -[RAPAppStateCreator createReportAProblemAppStateWithCompletion:](v19, "createReportAProblemAppStateWithCompletion:", v20);

    }
  }

}

- (void)presentReportAProblemFromPlaceCardViewController:(id)a3 editingContext:(id)a4 overriddenUserInterfaceStyle:(int64_t)a5 sourceView:(id)a6 entryPoint:(int)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  RAPAppStateCreator *v18;
  id WeakRetained;
  RAPAppStateCreator *v20;
  _QWORD v21[4];
  id v22;
  RAPPresenter *v23;
  id v24;
  id v25;
  id v26;
  int v27;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a8;
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", v16))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "window"));
    objc_msgSend(v17, "setUserInteractionEnabled:", 0);

    v18 = [RAPAppStateCreator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    v20 = -[RAPAppStateCreator initWithSceneDelegate:](v18, "initWithSceneDelegate:", WeakRetained);

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100C4316C;
    v21[3] = &unk_1011E9AD0;
    v22 = v15;
    v25 = v14;
    v23 = self;
    v27 = a7;
    v24 = v13;
    v26 = v16;
    -[RAPAppStateCreator createReportAProblemAppStateWithCompletion:](v20, "createReportAProblemAppStateWithCompletion:", v21);

  }
}

- (void)_dismissReportComposerWithSender:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    (*((void (**)(id))v7 + 2))(v7);
  v9 = v6;
  v10 = objc_opt_class(UIViewController);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100C43B48;
    v15[3] = &unk_1011AC860;
    v15[4] = self;
    objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, v15);
  }
  else
  {
    v13 = sub_100432F4C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Attempting to dismiss an object %@ that is not a view controller. Early return.", buf, 0xCu);
    }

  }
}

- (void)_dismissSender:(id)a3 withGesture:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  void *v11;
  id v12;
  MapsSceneDelegate **p_sceneDelegate;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char isKindOfClass;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  _QWORD v26[4];
  void (**v27)(_QWORD);
  uint8_t buf[4];
  id v29;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  v10 = objc_opt_class(UIViewController);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
    v11 = v8;
  else
    v11 = 0;
  v12 = v11;
  if (v12)
  {
    if (v9 && v6)
      v9[2](v9);
    p_sceneDelegate = &self->_sceneDelegate;
    WeakRetained = objc_loadWeakRetained((id *)p_sceneDelegate);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "appCoordinator"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "baseActionCoordinator"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentViewController"));
    v18 = objc_opt_class(RAPWebBundleContaineeViewController);
    isKindOfClass = objc_opt_isKindOfClass(v17, v18);

    if ((isKindOfClass & 1) != 0)
    {
      if (!v6)
      {
        v20 = objc_loadWeakRetained((id *)p_sceneDelegate);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "appCoordinator"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "baseActionCoordinator"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "containerViewController"));
        objc_msgSend(v23, "popLastViewControllerAnimated:", 1);

      }
      if (v9)
        v9[2](v9);
    }
    else
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100C43D90;
      v26[3] = &unk_1011ADA00;
      v27 = v9;
      objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, v26);

    }
  }
  else
  {
    v24 = sub_100432F4C();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Attempting to dismiss an object %@ that is not a view controller. Early return.", buf, 0xCu);
    }

  }
}

- (void)_presentReportComposerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  RAPReportComposerViewController *reportComposer;
  _QWORD v9[4];
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = v4;
  if (self->_reportComposer)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100C43EAC;
    v11[3] = &unk_1011AE240;
    v11[4] = self;
    v12 = v4;
    v6 = objc_retainBlock(v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerViewController presentingViewController](self->_reportComposer, "presentingViewController"));

    if (v7)
    {
      reportComposer = self->_reportComposer;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100C43FFC;
      v9[3] = &unk_1011ADA00;
      v10 = v6;
      -[RAPReportComposerViewController dismissViewControllerAnimated:completion:](reportComposer, "dismissViewControllerAnimated:completion:", 1, v9);

    }
    else
    {
      ((void (*)(_QWORD *))v6[2])(v6);
    }

  }
}

- (void)_presentWebBundleWithReport:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100C440AC;
  v9[3] = &unk_1011E9AF8;
  v10 = a4;
  v6 = v10;
  v7 = a3;
  v8 = objc_retainBlock(v9);
  -[RAPPresenter _presentWebBundleWithReport:withOutcomeCompletion:](self, "_presentWebBundleWithReport:withOutcomeCompletion:", v7, v8);

}

- (void)_presentWebBundleWithReport:(id)a3 withOutcomeCompletion:(id)a4
{
  -[RAPPresenter _presentWebBundleViewControllerWithReport:completion:](self, "_presentWebBundleViewControllerWithReport:completion:", a3, a4);
}

- (void)_presentWebBundleViewControllerWithReport:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void ***v9;
  RAPWebBundleContaineeViewController *v10;
  RAPWebBundleContaineeViewController *v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  id WeakRetained;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t, uint64_t);
  void *v20;
  RAPPresenter *v21;
  id v22;
  id v23;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_100C44298;
  v20 = &unk_1011E9B48;
  objc_copyWeak(&v23, &location);
  v8 = v7;
  v21 = self;
  v22 = v8;
  v9 = objc_retainBlock(&v17);
  v10 = [RAPWebBundleContaineeViewController alloc];
  v11 = -[RAPWebBundleContaineeViewController initWithReport:completion:](v10, "initWithReport:completion:", v6, v9, v17, v18, v19, v20);
  -[RAPWebBundleContaineeViewController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 2);
  -[RAPWebBundleContaineeViewController setModalInPresentation:](v11, "setModalInPresentation:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "initialQuestion"));
  v13 = objc_opt_class(RAPWebBundleQuestion);
  isKindOfClass = objc_opt_isKindOfClass(v12, v13);

  if ((isKindOfClass & 1) != 0)
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "initialQuestion"));
  else
    v15 = 0;
  if (sub_1002A8AA0(v11) == 5 || (char *)objc_msgSend(v15, "questionType") - 13 > (char *)7)
  {
    -[RAPPresenter presentViewController:animated:](self, "presentViewController:animated:", v11, 1);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    objc_msgSend(WeakRetained, "presentFromContainerViewController:animated:", v11, 1);

  }
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)_presentPushNotificationPromptIfNecessary
{
  +[PushNotificationPrompt checkShouldRepeatForUserAction:](PushNotificationPrompt, "checkShouldRepeatForUserAction:", &stru_1011E9B68);
}

- (void)_presentLightweightFeedbackAcknowledgmentScreen
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Thanks for your feedback [Report an Issue]"), CFSTR("localized string not found"), 0));

  +[ActionValidationController presentDefaultValidationActionWithTitle:inWindow:](ActionValidationController, "presentDefaultValidationActionWithTitle:inWindow:", v6, v7);
}

- (void)presentReportAProblemFromTransitLineCardWithEditingContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  RAPAppStateCreator *v8;
  id WeakRetained;
  RAPAppStateCreator *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", v7))
  {
    v8 = [RAPAppStateCreator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    v10 = -[RAPAppStateCreator initWithSceneDelegate:](v8, "initWithSceneDelegate:", WeakRetained);

    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100C44748;
    v11[3] = &unk_1011E9B90;
    v12 = v6;
    objc_copyWeak(&v14, &location);
    v13 = v7;
    -[RAPAppStateCreator createReportAProblemAppStateWithCompletion:](v10, "createReportAProblemAppStateWithCompletion:", v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

- (void)presentReportAProblemByEditingContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  RAPAppStateCreator *v10;
  id WeakRetained;
  RAPAppStateCreator *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerViewController view](self->_reportComposer, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
    objc_msgSend(v9, "setUserInteractionEnabled:", 0);

    v10 = [RAPAppStateCreator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    v12 = -[RAPAppStateCreator initWithSceneDelegate:](v10, "initWithSceneDelegate:", WeakRetained);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100C4496C;
    v13[3] = &unk_1011E9BB8;
    v13[4] = self;
    v14 = v6;
    v15 = v7;
    -[RAPAppStateCreator createReportAProblemAppStateWithCompletion:](v12, "createReportAProblemAppStateWithCompletion:", v13);

  }
}

- (void)presentReportAProblemAndPrefetchShortcutsWithEditingContext:(id)a3 completion:(id)a4
{
  -[RAPPresenter _presentReportAProblemAndPrefetchShortcutsWithEditingContext:displayIncidentReports:completion:](self, "_presentReportAProblemAndPrefetchShortcutsWithEditingContext:displayIncidentReports:completion:", a3, 0, a4);
}

- (void)presentIncidentsReportOptions
{
  -[RAPPresenter _presentReportAProblemAndPrefetchShortcutsWithEditingContext:displayIncidentReports:completion:](self, "_presentReportAProblemAndPrefetchShortcutsWithEditingContext:displayIncidentReports:completion:", 0, 1, 0);
}

- (void)presentAddMissingDataOfType:(int64_t)a3 fromPlacecardWithEditingContext:(id)a4
{
  id v6;
  RAPAppStateCreator *v7;
  id WeakRetained;
  RAPAppStateCreator *v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v6 = a4;
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", 0))
  {
    v7 = [RAPAppStateCreator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    v9 = -[RAPAppStateCreator initWithSceneDelegate:](v7, "initWithSceneDelegate:", WeakRetained);

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100C44AE8;
    v10[3] = &unk_1011E9BE0;
    v10[4] = self;
    v11 = v6;
    v12 = a3;
    -[RAPAppStateCreator createReportAProblemAppStateWithCompletion:](v9, "createReportAProblemAppStateWithCompletion:", v10);

  }
}

- (void)presentEditPlaceDetailsOfType:(int64_t)a3 fromPlacecardWithEditingContext:(id)a4
{
  id v6;
  RAPAppStateCreator *v7;
  id WeakRetained;
  RAPAppStateCreator *v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v6 = a4;
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", 0))
  {
    v7 = [RAPAppStateCreator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    v9 = -[RAPAppStateCreator initWithSceneDelegate:](v7, "initWithSceneDelegate:", WeakRetained);

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100C44D14;
    v10[3] = &unk_1011E9BE0;
    v10[4] = self;
    v11 = v6;
    v12 = a3;
    -[RAPAppStateCreator createReportAProblemAppStateWithCompletion:](v9, "createReportAProblemAppStateWithCompletion:", v10);

  }
}

- (void)_presentReportAProblemAndPrefetchShortcutsWithEditingContext:(id)a3 displayIncidentReports:(BOOL)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  RAPAppStateCreator *v10;
  id WeakRetained;
  RAPAppStateCreator *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  v7 = a5;
  if (a4)
  {
    if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerViewController view](self->_reportComposer, "view"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
      objc_msgSend(v9, "setUserInteractionEnabled:", 0);

      v10 = [RAPAppStateCreator alloc];
      WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
      v12 = -[RAPAppStateCreator initWithSceneDelegate:](v10, "initWithSceneDelegate:", WeakRetained);

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100C44FAC;
      v16[3] = &unk_1011E9CF8;
      v16[4] = self;
      v17 = v7;
      -[RAPAppStateCreator createReportAProblemAppStateAndPrefetchShortcutsWithCompletion:](v12, "createReportAProblemAppStateAndPrefetchShortcutsWithCompletion:", v16);

    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appCoordinator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "baseActionCoordinator"));
    objc_msgSend(v15, "viewControllerShowReports:", 0);

  }
}

- (void)_presentReportComposerWithAppState:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  RAPReport *v8;
  void *v9;
  RAPReport *v10;
  void *v11;
  RAPReportComposerViewController *v12;
  id v13;
  RAPReportComposerViewController *v14;
  RAPReportComposerViewController *reportComposer;
  void **v16;
  uint64_t v17;
  id (*v18)(uint64_t, uint64_t);
  void *v19;
  RAPPresenter *v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = [RAPReport alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPresenter submissionManager](self, "submissionManager"));
  v10 = -[RAPReport initWithContext:submitter:](v8, "initWithContext:submitter:", v7, v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RAPMenuQuestion menuForReport:state:onlyShowIncidents:](RAPMenuQuestion, "menuForReport:state:onlyShowIncidents:", v10, v7, 1));
  -[RAPReport setInitialQuestion:](v10, "setInitialQuestion:", v11);
  v12 = [RAPReportComposerViewController alloc];
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_100C45160;
  v19 = &unk_1011E9C08;
  v20 = self;
  v21 = v6;
  v13 = v6;
  v14 = -[RAPReportComposerViewController initWithReport:categoryQuestion:completion:](v12, "initWithReport:categoryQuestion:completion:", v10, v11, &v16);
  reportComposer = self->_reportComposer;
  self->_reportComposer = v14;

  -[RAPPresenter _presentReportComposerWithCompletion:](self, "_presentReportComposerWithCompletion:", v13, v16, v17, v18, v19, v20);
}

- (void)representReportAProblemIfCurrentlyOngoingAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[RAPReportComposerViewController setModalPresentationStyle:](self->_reportComposer, "setModalPresentationStyle:", 2);
  -[RAPReportComposerViewController setModalInPresentation:](self->_reportComposer, "setModalInPresentation:", 1);
  -[RAPPresenter presentViewController:animated:](self, "presentViewController:animated:", self->_reportComposer, v3);
}

- (void)presentReportAProblemFromSettingsWithCompletion:(id)a3
{
  -[RAPPresenter presentReportAProblemAndPrefetchShortcutsWithEditingContext:completion:](self, "presentReportAProblemAndPrefetchShortcutsWithEditingContext:completion:", 0, a3);
}

- (void)presentReportAProblemWithCompletion:(id)a3
{
  -[RAPPresenter presentReportAProblemAndPrefetchShortcutsWithEditingContext:completion:](self, "presentReportAProblemAndPrefetchShortcutsWithEditingContext:completion:", 0, a3);
}

- (void)_presentAddAPlaceFromEntryPoint:(int)a3 withEditingBlock:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  RAPAppStateCreator *v11;
  id WeakRetained;
  RAPAppStateCreator *v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  id v17;
  int v18;
  id location;
  _QWORD v20[4];
  id v21;

  v8 = a4;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100C45360;
  v20[3] = &unk_1011ADA00;
  v9 = a5;
  v21 = v9;
  v10 = objc_retainBlock(v20);
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", v9))
  {
    objc_initWeak(&location, self);
    v11 = [RAPAppStateCreator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    v13 = -[RAPAppStateCreator initWithSceneDelegate:](v11, "initWithSceneDelegate:", WeakRetained);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100C45374;
    v14[3] = &unk_1011E9C58;
    v15 = v8;
    objc_copyWeak(&v17, &location);
    v18 = a3;
    v16 = v10;
    -[RAPAppStateCreator createReportAProblemAppStateWithCompletion:](v13, "createReportAProblemAppStateWithCompletion:", v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (void)presentRAPWebBundleQuestionType:(int64_t)a3 mapItem:(id)a4 fromEntryPoint:(int)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  unsigned __int8 v12;
  RAPAppStateCreator *v13;
  id WeakRetained;
  RAPAppStateCreator *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19[2];
  int v20;
  id location;
  _QWORD v22[5];
  id v23;

  v10 = a4;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100C456DC;
  v22[3] = &unk_1011ACAD0;
  v11 = a6;
  v22[4] = self;
  v23 = v11;
  v12 = -[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", v22);

  if ((v12 & 1) == 0)
  {
    v13 = [RAPAppStateCreator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    v15 = -[RAPAppStateCreator initWithSceneDelegate:](v13, "initWithSceneDelegate:", WeakRetained);

    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100C456F4;
    v16[3] = &unk_1011E9C80;
    objc_copyWeak(v19, &location);
    v19[1] = (id)a3;
    v20 = a5;
    v17 = v10;
    v18 = v11;
    -[RAPAppStateCreator createReportAProblemAppStateWithCompletion:](v15, "createReportAProblemAppStateWithCompletion:", v16);

    objc_destroyWeak(v19);
    objc_destroyWeak(&location);

  }
}

- (void)presentRAPWebBundleWithMapItem:(id)a3 fromEntryPoint:(int)a4 completion:(id)a5
{
  id v8;
  id v9;
  unsigned __int8 v10;
  RAPAppStateCreator *v11;
  id WeakRetained;
  RAPAppStateCreator *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  int v18;
  id location;
  _QWORD v20[5];
  id v21;

  v8 = a3;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100C4599C;
  v20[3] = &unk_1011ACAD0;
  v9 = a5;
  v20[4] = self;
  v21 = v9;
  v10 = -[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", v20);

  if ((v10 & 1) == 0)
  {
    v11 = [RAPAppStateCreator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    v13 = -[RAPAppStateCreator initWithSceneDelegate:](v11, "initWithSceneDelegate:", WeakRetained);

    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100C459B4;
    v14[3] = &unk_1011E9CA8;
    objc_copyWeak(&v17, &location);
    v15 = v8;
    v18 = a4;
    v16 = v9;
    -[RAPAppStateCreator createReportAProblemAppStateWithCompletion:](v13, "createReportAProblemAppStateWithCompletion:", v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
}

- (void)_presentChooseAPlaceWithAppState:(id)a3 entryPoint:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapCamera"));
  objc_msgSend(v7, "centerCoordinate");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapCamera"));

  objc_msgSend(v10, "centerCoordinate");
  v12 = v11;

  v13 = GEOCoordinateRegionMakeWithDistance(v9, v12, 50.0, 50.0);
  v20 = objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithCoordinateRegion:", v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[RAPSearchAutocompleteViewController poiAutocompleteViewControllerWithBoundedMapRegion:excludedMUIDs:](RAPSearchAutocompleteViewController, "poiAutocompleteViewControllerWithBoundedMapRegion:excludedMUIDs:", v20, &__NSArray0__struct));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("[RAP] Choose a Place"), CFSTR("localized string not found"), 0));
  objc_msgSend(v17, "setTitleText:", v19);

  objc_msgSend(v17, "setEntryPoint:", v4);
  -[RAPPresenter _presentAutocompleteViewController:forItemKind:](self, "_presentAutocompleteViewController:forItemKind:", v17, 0);

}

- (void)_presentAutocompleteViewController:(id)a3 forItemKind:(int64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setModalInPresentation:", 1);
  v6 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v5);

  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  -[RAPPresenter presentViewController:animated:](self, "presentViewController:animated:", v6, 1);

}

- (void)rapSearchAutocompleteViewController:(id)a3 finishedPickingAutocompleteResult:(id)a4 isAutocompleteResult:(BOOL)a5
{
  id v7;
  id v8;
  RAPAppStateCreator *v9;
  id WeakRetained;
  RAPAppStateCreator *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v7 = a3;
  v8 = a4;
  v9 = [RAPAppStateCreator alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  v11 = -[RAPAppStateCreator initWithSceneDelegate:](v9, "initWithSceneDelegate:", WeakRetained);

  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100C45E04;
  v14[3] = &unk_1011E9CD0;
  objc_copyWeak(&v17, &location);
  v12 = v7;
  v15 = v12;
  v13 = v8;
  v16 = v13;
  -[RAPAppStateCreator createReportAProblemAppStateWithCompletion:](v11, "createReportAProblemAppStateWithCompletion:", v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)rapSearchAutocompleteViewControllerDidCancel:(id)a3
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2003, 32, 0);
}

- (void)presentAddAPlaceWithCompletion:(id)a3
{
  -[RAPPresenter presentAddAPlaceFromEntryPoint:completion:](self, "presentAddAPlaceFromEntryPoint:completion:", 39, a3);
}

- (void)presentAddAPlaceFromEntryPoint:(int)a3 completion:(id)a4
{
  -[RAPPresenter _presentAddAPlaceFromEntryPoint:withEditingBlock:completion:](self, "_presentAddAPlaceFromEntryPoint:withEditingBlock:completion:", *(_QWORD *)&a3, 0, a4);
}

- (void)_createInitialNavigationRapStateWithCompletion:(id)a3
{
  id v4;
  RAPAppStateCreator *v5;
  id WeakRetained;
  RAPAppStateCreator *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = [RAPAppStateCreator alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  v7 = -[RAPAppStateCreator initWithSceneDelegate:](v5, "initWithSceneDelegate:", WeakRetained);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100C46014;
  v9[3] = &unk_1011E9CF8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[RAPAppStateCreator createReportAProblemAppStateWithCompletion:](v7, "createReportAProblemAppStateWithCompletion:", v9);

}

- (void)presentRouteListReportFromEntryPoint:(int)a3
{
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  int v9;
  id buf[2];

  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", 0))
  {
    v5 = sub_100431F8C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will try to present route list flow.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100C463B4;
    v7[3] = &unk_1011E9D20;
    objc_copyWeak(&v8, buf);
    v9 = a3;
    v7[4] = self;
    -[RAPPresenter _createInitialNavigationRapStateWithCompletion:](self, "_createInitialNavigationRapStateWithCompletion:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

- (void)presentCurrentRouteIssueWithReport:(id)a3 fromEntryPoint:(int)a4
{
  -[RAPPresenter presentCurrentRouteIssueWithReport:fromEntryPoint:usingContaineePresentation:](self, "presentCurrentRouteIssueWithReport:fromEntryPoint:usingContaineePresentation:", a3, *(_QWORD *)&a4, 0);
}

- (void)presentCurrentRouteIssueWithReport:(id)a3 fromEntryPoint:(int)a4 usingContaineePresentation:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _QWORD *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  _QWORD *v15;
  id v16;
  uint8_t v17[8];
  _QWORD v18[5];
  id v19;
  int v20;
  BOOL v21;
  id buf[2];

  v8 = a3;
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", 0))
  {
    v9 = sub_100431F8C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Will try to present single route flow.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100C466EC;
    v18[3] = &unk_1011E9D48;
    objc_copyWeak(&v19, buf);
    v20 = a4;
    v21 = a5;
    v18[4] = self;
    v11 = objc_retainBlock(v18);
    if (v8)
    {
      v12 = sub_100431F8C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "A report was passed to us so we'll present it without creating a new one.", v17, 2u);
      }

      ((void (*)(_QWORD *, id))v11[2])(v11, v8);
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100C4684C;
      v14[3] = &unk_1011E9D70;
      objc_copyWeak(&v16, buf);
      v15 = v11;
      -[RAPPresenter _createInitialNavigationRapStateWithCompletion:](self, "_createInitialNavigationRapStateWithCompletion:", v14);

      objc_destroyWeak(&v16);
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(buf);
  }

}

- (void)presentReportAProblemForRouteWithAppState:(id)a3
{
  id v4;
  RAPReport *v5;
  void *v6;
  RAPReport *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  RAPWebBundleQuestion *v13;
  RAPDirectionsReportContaineeViewController *v14;
  id v15;
  id v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v4 = a3;
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", 0))
  {
    v5 = [RAPReport alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPresenter submissionManager](self, "submissionManager"));
    v7 = -[RAPReport initWithContext:submitter:](v5, "initWithContext:submitter:", v4, v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport combinedUserPath](v7, "combinedUserPath"));
    objc_msgSend(v8, "addNativePath:", 37);

    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](v7, "_context"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "directionsHistory"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recording"));

      if (v12)
      {
        v13 = -[RAPWebBundleQuestion initWithReport:directionsRecording:]([RAPWebBundleQuestion alloc], "initWithReport:directionsRecording:", v7, v12);
        -[RAPReport setInitialQuestion:](v7, "setInitialQuestion:", v13);
        v14 = -[RAPDirectionsReportContaineeViewController initWithReport:directionsReportContext:]([RAPDirectionsReportContaineeViewController alloc], "initWithReport:directionsReportContext:", v7, 0);
        -[RAPPresenter presentViewController:animated:](self, "presentViewController:animated:", v14, 1);

      }
      else
      {
        v16 = sub_100431F8C();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Can't present after nav flow because the latest route doesn't have a route recording.", v18, 2u);
        }

        v12 = 0;
      }
    }
    else
    {
      v15 = sub_100431F8C();
      v12 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to create report. Will abort RAP.", buf, 2u);
      }
    }

  }
}

- (void)presentReportAProblemForRouteFromEntryPoint:(int)a3
{
  -[RAPPresenter presentCurrentRouteIssueWithReport:fromEntryPoint:](self, "presentCurrentRouteIssueWithReport:fromEntryPoint:", 0, *(_QWORD *)&a3);
}

- (void)presentLookAroundRAPWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  RAPAppStateCreator *v8;
  id WeakRetained;
  RAPAppStateCreator *v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", v7))
  {
    v8 = [RAPAppStateCreator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    v10 = -[RAPAppStateCreator initWithSceneDelegate:](v8, "initWithSceneDelegate:", WeakRetained);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100C46C18;
    v11[3] = &unk_1011E9CF8;
    v11[4] = self;
    v12 = v7;
    -[RAPAppStateCreator createLookAroundReportAProblemAppStateWithLookAroundContext:completion:](v10, "createLookAroundReportAProblemAppStateWithLookAroundContext:completion:", v6, v11);

  }
}

- (void)presentPlacecardImageryRAPWithContext:(id)a3 selectedIssueItem:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  RAPAppStateCreator *v11;
  id WeakRetained;
  RAPAppStateCreator *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", v10))
  {
    v11 = [RAPAppStateCreator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    v13 = -[RAPAppStateCreator initWithSceneDelegate:](v11, "initWithSceneDelegate:", WeakRetained);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100C46E50;
    v14[3] = &unk_1011E9D98;
    v14[4] = self;
    v15 = v9;
    v16 = v10;
    -[RAPAppStateCreator createPlacecardImageryReportAProblemAppStateWithContext:completion:](v13, "createPlacecardImageryReportAProblemAppStateWithContext:completion:", v8, v14);

  }
}

- (void)presentPlacecardImageryRAPWithContext:(id)a3 layoutManager:(id)a4 popoverPresentationBlock:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RAPAppStateCreator *v14;
  id WeakRetained;
  RAPAppStateCreator *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", v13))
  {
    v14 = [RAPAppStateCreator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    v16 = -[RAPAppStateCreator initWithSceneDelegate:](v14, "initWithSceneDelegate:", WeakRetained);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100C47050;
    v17[3] = &unk_1011E9DE8;
    v17[4] = self;
    v18 = v11;
    v19 = v12;
    v20 = v13;
    -[RAPAppStateCreator createPlacecardImageryReportAProblemAppStateWithContext:completion:](v16, "createPlacecardImageryReportAProblemAppStateWithContext:completion:", v10, v17);

  }
}

- (void)_presentPlacecardImageryCommentViewControllerWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  RAPReportComposerViewController *v11;
  id v12;
  RAPReportComposerViewController *v13;
  RAPReportComposerViewController *reportComposer;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = [RAPReportComposerViewController alloc];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100C4741C;
  v15[3] = &unk_1011E9E10;
  objc_copyWeak(&v17, &location);
  v12 = v10;
  v16 = v12;
  v13 = -[RAPReportComposerViewController initWithReport:commentQuestion:completion:](v11, "initWithReport:commentQuestion:completion:", v8, v9, v15);
  reportComposer = self->_reportComposer;
  self->_reportComposer = v13;

  -[RAPPresenter _presentReportComposerWithCompletion:](self, "_presentReportComposerWithCompletion:", v12);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)_submitLightweightReport:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  RAPPresenter *v10;
  id v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100C47520;
  v8[3] = &unk_1011E9E78;
  v9 = a3;
  v10 = self;
  v11 = a4;
  v6 = v11;
  v7 = v9;
  +[RAPPrivacy performPrivacyCheckWithAppearance:completion:](RAPPrivacy, "performPrivacyCheckWithAppearance:completion:", 1, v8);

}

- (void)presentAddAPlaceViewControllerFromEntryPoint:(int)a3 withAppState:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  RAPReport *v9;
  void *v10;
  RAPReport *v11;
  void *v12;
  int BOOL;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  RAPWebBundleQuestion *v21;
  void *v22;
  void *v23;
  RAPWebBundleQuestion *v24;
  id v25;

  v6 = *(_QWORD *)&a3;
  v25 = a4;
  v8 = a5;
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", v8))
  {
    v9 = [RAPReport alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPresenter submissionManager](self, "submissionManager"));
    v11 = -[RAPReport initWithContext:submitter:](v9, "initWithContext:submitter:", v25, v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport combinedUserPath](v11, "combinedUserPath"));
    objc_msgSend(v12, "addNativePath:", v6);

    BOOL = GEOConfigGetBOOL(MapKitConfig_RAPFlowReportSomethingMissing[0], MapKitConfig_RAPFlowReportSomethingMissing[1]);
    v14 = objc_msgSend(v25, "isSprMap");
    v15 = 5;
    if (v14)
      v15 = 6;
    v16 = 3;
    if (v14)
      v16 = 4;
    if (BOOL)
      v17 = v15;
    else
      v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](v11, "_context"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "reportedPlace"));
    v20 = objc_msgSend(v19, "source");

    if (v20 == (id)1)
    {
      if (objc_msgSend(v25, "isSprMap"))
        v17 = 8;
      else
        v17 = 7;
    }
    v21 = [RAPWebBundleQuestion alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](v11, "_context"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "reportedPlace"));
    v24 = -[RAPWebBundleQuestion initWithReport:place:questionType:](v21, "initWithReport:place:questionType:", v11, v23, v17);

    -[RAPReport setInitialQuestion:](v11, "setInitialQuestion:", v24);
    -[RAPPresenter _presentWebBundleWithReport:completion:](self, "_presentWebBundleWithReport:completion:", v11, v8);

  }
}

- (void)presentCuratedCollectionRAPWithContext:(id)a3 sourceView:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  RAPAppStateCreator *v11;
  id WeakRetained;
  RAPAppStateCreator *v13;
  _QWORD v14[4];
  id v15;
  RAPPresenter *v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", v10))
  {
    v11 = [RAPAppStateCreator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    v13 = -[RAPAppStateCreator initWithSceneDelegate:](v11, "initWithSceneDelegate:", WeakRetained);

    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100C478E8;
    v14[3] = &unk_1011E9EC8;
    objc_copyWeak(&v18, &location);
    v17 = v10;
    v15 = v9;
    v16 = self;
    -[RAPAppStateCreator createCuratedCollectionReportAProblemAppStateWithContext:completion:](v13, "createCuratedCollectionReportAProblemAppStateWithContext:completion:", v8, v14);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
}

- (id)submissionManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "submissionManager"));

  return v3;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  dispatch_time_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  BOOL v18;
  _QWORD block[5];
  id v20;
  BOOL v21;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentingViewController"));

    if (!v8)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "topMostPresentedViewController"));

      if (v10
        && ((objc_msgSend(v10, "isBeingDismissed") & 1) != 0
         || objc_msgSend(v10, "isBeingPresented")))
      {
        v11 = dispatch_time(0, 100000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100C48334;
        block[3] = &unk_1011AC838;
        block[4] = self;
        v20 = v7;
        v21 = v4;
        dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);
        v12 = v20;
      }
      else
      {
        if (!-[RAPPresenter _isMACPlaceCardViewController:tryingToPresent:](self, "_isMACPlaceCardViewController:tryingToPresent:", v10, v7))
        {
          v15 = objc_loadWeakRetained((id *)&self->_sceneDelegate);
          objc_msgSend(v15, "presentViewController:animated:", v7, v4);

          goto LABEL_11;
        }
        v13 = v10;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "placeCardDelegate"));
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100C48344;
        v16[3] = &unk_1011AC838;
        v16[4] = self;
        v17 = v7;
        v18 = v4;
        objc_msgSend(v14, "placeCardViewController:dismissAnimated:completion:", v13, 1, v16);

        v12 = v17;
      }

LABEL_11:
    }
  }

}

- (BOOL)_isMACPlaceCardViewController:(id)a3 tryingToPresent:(id)a4
{
  id v4;
  uint64_t v5;
  char isKindOfClass;

  v4 = a3;
  if (sub_1002A8AA0(v4) == 5)
  {
    v5 = objc_opt_class(PlaceCardViewController);
    isKindOfClass = objc_opt_isKindOfClass(v4, v5);
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)presentAddToMapsFromSearchEntryPoint:(int)a3 result:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  RAPAppStateCreator *v10;
  id WeakRetained;
  RAPAppStateCreator *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  int v17;
  id location;

  v8 = a4;
  v9 = a5;
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", v9))
  {
    objc_initWeak(&location, self);
    v10 = [RAPAppStateCreator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    v12 = -[RAPAppStateCreator initWithSceneDelegate:](v10, "initWithSceneDelegate:", WeakRetained);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100C48528;
    v13[3] = &unk_1011E9CA8;
    objc_copyWeak(&v16, &location);
    v17 = a3;
    v14 = v8;
    v15 = v9;
    -[RAPAppStateCreator createReportAProblemAppStateWithCompletion:](v12, "createReportAProblemAppStateWithCompletion:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

- (void)presentAddToMapsFromSearchEntryPoint:(int)a3 result:(id)a4 withAppState:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  RAPReport *v12;
  void *v13;
  RAPReport *v14;
  void *v15;
  RAPWebBundleQuestion *v16;
  id v17;

  v8 = *(_QWORD *)&a3;
  v17 = a4;
  v10 = a5;
  v11 = a6;
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", v11))
  {
    v12 = [RAPReport alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPresenter submissionManager](self, "submissionManager"));
    v14 = -[RAPReport initWithContext:submitter:](v12, "initWithContext:submitter:", v10, v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport combinedUserPath](v14, "combinedUserPath"));
    objc_msgSend(v15, "addNativePath:", v8);

    v16 = -[RAPWebBundleQuestion initWithReport:place:questionType:]([RAPWebBundleQuestion alloc], "initWithReport:place:questionType:", v14, v17, 28);
    -[RAPReport setInitialQuestion:](v14, "setInitialQuestion:", v16);
    -[RAPPresenter _presentWebBundleWithReport:completion:](self, "_presentWebBundleWithReport:completion:", v14, v11);

  }
}

- (void)presentPlaceEnrichmentRAPWithTarget:(int)a3 fromPlacecardWithEditingContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  RAPAppStateCreator *v10;
  id WeakRetained;
  RAPAppStateCreator *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  int v17;
  id location;

  v8 = a4;
  v9 = a5;
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", v9))
  {
    objc_initWeak(&location, self);
    v10 = [RAPAppStateCreator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    v12 = -[RAPAppStateCreator initWithSceneDelegate:](v10, "initWithSceneDelegate:", WeakRetained);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100C48960;
    v13[3] = &unk_1011E9C58;
    v14 = v8;
    objc_copyWeak(&v16, &location);
    v17 = a3;
    v15 = v9;
    -[RAPAppStateCreator createReportAProblemAppStateWithCompletion:](v12, "createReportAProblemAppStateWithCompletion:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

- (void)presentPlaceEnrichmentRAPWithTarget:(int)a3 withAppState:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  RAPReport *v9;
  void *v10;
  RAPReport *v11;
  void *v12;
  RAPWebBundleQuestion *v13;
  void *v14;
  void *v15;
  RAPWebBundleQuestion *v16;
  id v17;

  v6 = *(_QWORD *)&a3;
  v17 = a4;
  v8 = a5;
  if (!-[RAPPresenter presentOfflineAlertIfNecessaryWithCompletion:](self, "presentOfflineAlertIfNecessaryWithCompletion:", v8))
  {
    v9 = [RAPReport alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPresenter submissionManager](self, "submissionManager"));
    v11 = -[RAPReport initWithContext:submitter:](v9, "initWithContext:submitter:", v17, v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport combinedUserPath](v11, "combinedUserPath"));
    objc_msgSend(v12, "addNativePath:", v6);

    v13 = [RAPWebBundleQuestion alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](v11, "_context"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "reportedPlace"));
    v16 = -[RAPWebBundleQuestion initWithReport:place:poiCorrectionType:questionType:](v13, "initWithReport:place:poiCorrectionType:questionType:", v11, v15, 2, 29);

    -[RAPReport setInitialQuestion:](v11, "setInitialQuestion:", v16);
    -[RAPPresenter _presentWebBundleWithReport:completion:](self, "_presentWebBundleWithReport:completion:", v11, v8);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneDelegate);
  objc_storeStrong((id *)&self->_placecardImageryController, 0);
  objc_storeStrong((id *)&self->_reportComposer, 0);
}

@end
