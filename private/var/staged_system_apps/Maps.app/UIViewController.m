@implementation UIViewController

- (UIViewController)topMostPresentedViewController
{
  UIViewController *v2;
  void *v3;
  UIViewController *v4;
  void *v5;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](v2, "presentedViewController"));

  if (v3)
  {
    do
    {
      v4 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](v2, "presentedViewController"));

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](v4, "presentedViewController"));
      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  return v4;
}

- (void)_maps_presentSimpleAlertWithTitle:(id)a3 message:(id)a4 dismissalActionTitle:(id)a5 dismissalHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("SimpleAlert"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, v10));
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("AlertAction"));
  objc_msgSend(v14, "addAction:", v13);
  -[UIViewController _maps_topMostPresentViewController:animated:completion:](self, "_maps_topMostPresentViewController:animated:completion:", v14, 1, 0);

}

- (void)_maps_presentSimpleAlertWithTitle:(id)a3 message:(id)a4 dismissalActionTitle:(id)a5
{
  -[UIViewController _maps_presentSimpleAlertWithTitle:message:dismissalActionTitle:dismissalHandler:](self, "_maps_presentSimpleAlertWithTitle:message:dismissalActionTitle:dismissalHandler:", a3, a4, a5, 0);
}

- (void)_maps_topMostPresentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController topMostPresentedViewController](self, "topMostPresentedViewController"));
  objc_msgSend(v10, "presentViewController:animated:completion:", v9, v5, v8);

}

- (MapsTheme)theme
{
  void *v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController traitCollection](self, "traitCollection"));
    v6 = objc_msgSend(v5, "userInterfaceStyle") != (id)1;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme sharedTheme](MapsTheme, "sharedTheme"));
    objc_msgSend(v7, "setMapsThemeStyle:", v6);

  }
  return (MapsTheme *)+[MapsTheme sharedTheme](MapsTheme, "sharedTheme");
}

- (id)_maps_uiScene
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));

  return v4;
}

- (id)_maps_mapsSceneDelegate
{
  return -[UIViewController mapsSceneDelegateForViewController:](self, "mapsSceneDelegateForViewController:", self);
}

- (id)_maps_carSceneDelegate
{
  return -[UIViewController carSceneDelegateForViewController:](self, "carSceneDelegateForViewController:", self);
}

- (id)mapsSceneDelegateForViewController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_mapsSceneDelegate"));

  return v4;
}

- (id)carSceneDelegateForViewController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_carSceneDelegate"));

  return v4;
}

- (id)_maps_platformController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "platformController"));

  return v3;
}

+ (id)_maps_viewControllerForRenamingMapItem:(id)a3 saveHandler:(id)a4 cancelHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  MacCollectionRenameViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11 == (id)5)
  {
    v12 = -[MacCollectionRenameViewController initWithMapItem:saveHandler:cancelHandler:]([MacCollectionRenameViewController alloc], "initWithMapItem:saveHandler:cancelHandler:", v7, v8, v9);
    -[MacCollectionRenameViewController setModalPresentationStyle:](v12, "setModalPresentationStyle:", 2);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Name_this_Location"), CFSTR("localized string not found"), 0));

    v12 = (MacCollectionRenameViewController *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v24, 0, 1));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1007DBBA0;
    v30[3] = &unk_1011C8DE8;
    v31 = v7;
    -[MacCollectionRenameViewController addTextFieldWithConfigurationHandler:](v12, "addTextFieldWithConfigurationHandler:", v30);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionRenameViewController textFields](v12, "textFields"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Cancel_Editing_Name_Favorites"), CFSTR("localized string not found"), 0));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1007DBC04;
    v28[3] = &unk_1011AD960;
    v29 = v9;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v17, 1, v28));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Save_Editing_Name_Favorites"), CFSTR("localized string not found"), 0));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1007DBC18;
    v25[3] = &unk_1011AF938;
    v26 = v15;
    v27 = v8;
    v21 = v15;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 0, v25));

    -[MacCollectionRenameViewController addAction:](v12, "addAction:", v18);
    -[MacCollectionRenameViewController addAction:](v12, "addAction:", v22);
    -[MacCollectionRenameViewController setPreferredAction:](v12, "setPreferredAction:", v22);

  }
  return v12;
}

- (void)presentSubmissionFailureAlertForResponse:(id)a3 withCancelHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UGCErrorStringBuilder buildFailToSubmitErrorTitle](UGCErrorStringBuilder, "buildFailToSubmitErrorTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UGCErrorStringBuilder buildFailToSubmitErrorDescription](UGCErrorStringBuilder, "buildFailToSubmitErrorDescription"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK [UGC]"), CFSTR("localized string not found"), 0));

  v16 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UGCCredentialsBuilder buildICloudUserCredentialsWithError:](UGCCredentialsBuilder, "buildICloudUserCredentialsWithError:", &v16));
  v13 = v16;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  v15 = objc_msgSend(v14, "isInternalInstall");

  if (v15 && v13)
    -[UIViewController _presentInternalInstallRadarPromptAlertForUserInfo:response:](self, "_presentInternalInstallRadarPromptAlertForUserInfo:response:", v12, v6);
  else
    -[UIViewController _createAndPresentAlertControllerWithTitle:descriptionText:cancelString:cancelHandler:](self, "_createAndPresentAlertControllerWithTitle:descriptionText:cancelString:cancelHandler:", v8, v9, v11, v7);

}

- (void)presentSavedReportTooNewAlertWithCancelHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Error Saved Report Too New - iOS [UGC]"), CFSTR("localized string not found"), 0));

  if (sub_1002A8AA0(self) == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Error Saved Report Too New - iPadOS [UGC]");
LABEL_5:
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, CFSTR("localized string not found"), 0));

    v12 = (id)v9;
    goto LABEL_6;
  }
  if (sub_1002A8AA0(self) == 5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Error Saved Report Too New - macOS [UGC]");
    goto LABEL_5;
  }
LABEL_6:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK [UGC]"), CFSTR("localized string not found"), 0));

  -[UIViewController _createAndPresentAlertControllerWithTitle:descriptionText:cancelString:cancelHandler:](self, "_createAndPresentAlertControllerWithTitle:descriptionText:cancelString:cancelHandler:", 0, v12, v11, v4);
}

- (void)presentLookupFailureAlertWithCancelHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Error Fetching Submission [UGC]"), CFSTR("localized string not found"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UGCErrorStringBuilder buildBestErrorStringForCurrentNetworkState](UGCErrorStringBuilder, "buildBestErrorStringForCurrentNetworkState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK [UGC]"), CFSTR("localized string not found"), 0));

  -[UIViewController _createAndPresentAlertControllerWithTitle:descriptionText:cancelString:cancelHandler:](self, "_createAndPresentAlertControllerWithTitle:descriptionText:cancelString:cancelHandler:", v9, v6, v8, v4);
}

- (void)presentLoginFailureAlertWithCancelHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Error Signing In [UGC]"), CFSTR("localized string not found"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Error Signing In Description [UGC]"), CFSTR("localized string not found"), 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OK [UGC]"), CFSTR("localized string not found"), 0));

  -[UIViewController _createAndPresentAlertControllerWithTitle:descriptionText:cancelString:cancelHandler:](self, "_createAndPresentAlertControllerWithTitle:descriptionText:cancelString:cancelHandler:", v10, v7, v9, v4);
}

- (void)_createAndPresentAlertControllerWithTitle:(id)a3 descriptionText:(id)a4 cancelString:(id)a5 cancelHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1009B2F18;
  v15[3] = &unk_1011AD960;
  v16 = v10;
  v13 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, v15));

  objc_msgSend(v12, "addAction:", v14);
  -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

}

- (void)_presentInternalInstallRadarPromptAlertForUserInfo:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  MapsRadarDraft *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  v9 = objc_msgSend(v8, "isInternalInstall");

  if (v9)
  {
    v10 = objc_opt_new(MapsRadarDraft);
    -[MapsRadarDraft setTitle:](v10, "setTitle:", CFSTR("[ARP] Submission failure"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userCredentials"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "icloudUserPersonId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userCredentials"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "icloudUserMapsAuthToken"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DSID: %@\nMaps auth token: %@\nResponse: %@"), v12, v14, v7));
    -[MapsRadarDraft setDescriptionText:](v10, "setDescriptionText:", v15);

    -[MapsRadarDraft setClassification:](v10, "setClassification:", 6);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarComponent mapsAppCoreUIComponent](MapsRadarComponent, "mapsAppCoreUIComponent"));
    -[MapsRadarDraft setComponent:](v10, "setComponent:", v16);

    v17 = sub_100431FFC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft descriptionText](v10, "descriptionText"));
      *(_DWORD *)buf = 138412290;
      v22 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Presenting internal alert to file a radar: %@", buf, 0xCu);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
    objc_msgSend(v20, "launchTTRWithRadar:promptTitle:fromViewController:", v10, CFSTR("Failed to submit ratings and photos. Please file a Radar with a recent sysdiagnose."), self);

  }
}

@end
