@implementation MapsWelcomeScreenViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)hasDisplayedCurrentWelcomeScreen
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (uint64_t)objc_msgSend(v2, "integerForKey:", CFSTR("kMapsWelcomeScreenKey"));

  return v3 > 3;
}

+ (void)_markWelcomeScreenAsDisplayed
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "setInteger:forKey:", 4, CFSTR("kMapsWelcomeScreenKey"));

}

+ (void)presentWelcomeScreenIfNecessaryInScene:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  id v9;
  NSObject *v10;
  int BOOL;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  uint8_t v31[16];
  uint8_t v32[16];
  __int16 v33;
  uint8_t v34[2];
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if ((objc_msgSend(UIApp, "launchedToTest") & 1) != 0)
    goto LABEL_6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  if ((objc_msgSend(v8, "isMultiUser") & 1) == 0
    && (objc_msgSend(a1, "hasDisplayedCurrentWelcomeScreen") & 1) == 0
    && !GEOConfigGetBOOL(MapsConfig_PreventAllLaunchAlerts, off_1014B48C8))
  {
    BOOL = GEOConfigGetBOOL(MapsConfig_MapsWelcomeScreenIsDisabledForRelease, off_1014B5188);

    if (BOOL)
      goto LABEL_6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
    v13 = objc_opt_class(MapsSceneDelegate);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      v14 = v12;
    else
      v14 = 0;
    v15 = v14;

    if (v15)
    {
      if (byte_1014D1E00 != 1)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "countryCode"));

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[WelcomeScreenConfiguration configurationForCountryCode:](WelcomeScreenConfiguration, "configurationForCountryCode:", v22));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bullets"));
        v25 = objc_msgSend(v24, "count");

        v26 = sub_100431A4C();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
        if (v25)
        {
          if (v28)
          {
            *(_WORD *)v31 = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "MapsWelcomeScreen: presenting alert", v31, 2u);
          }

          v29 = (void *)objc_claimAutoreleasedReturnValue(+[MapsWelcomeScreenViewController welcomeControllerWithConfiguration:block:](MapsWelcomeScreenViewController, "welcomeControllerWithConfiguration:block:", v23, v7));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "chromeViewController"));
          objc_msgSend(v29, "setModalPresentationStyle:", 2);
          objc_msgSend(v29, "setModalInPresentation:", 1);
          objc_msgSend(v30, "_maps_topMostPresentViewController:animated:completion:", v29, 1, 0);
          byte_1014D1E00 = 1;

        }
        else
        {
          if (v28)
          {
            *(_WORD *)v32 = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "MapsWelcomeScreen: no bullets to show for current country/platform/FF configuration", v32, 2u);
          }

          +[MapsWelcomeScreenViewController _markWelcomeScreenAsDisplayed](MapsWelcomeScreenViewController, "_markWelcomeScreenAsDisplayed");
          v7[2](v7);
        }

        goto LABEL_32;
      }
      v16 = sub_100431A4C();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v33 = 0;
        v18 = "MapsWelcomeScreen: is currently being presented";
        v19 = (uint8_t *)&v33;
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v18, v19, 2u);
      }
    }
    else
    {
      v20 = sub_100431A4C();
      v17 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v34 = 0;
        v18 = "MapsWelcomeScreen: not valid scene for display";
        v19 = v34;
        goto LABEL_22;
      }
    }

    v7[2](v7);
LABEL_32:

    goto LABEL_11;
  }

LABEL_6:
  v9 = sub_100431A4C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "MapsWelcomeScreen: no need to be displayed", buf, 2u);
  }

  if (GEOConfigGetBOOL(MapsConfig_MapsWelcomeScreenIsDisabledForRelease, off_1014B5188))
    +[MapsWelcomeScreenViewController _markWelcomeScreenAsDisplayed](MapsWelcomeScreenViewController, "_markWelcomeScreenAsDisplayed");
  v7[2](v7);
LABEL_11:

}

+ (id)welcomeControllerWithConfiguration:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id location;
  const __CFString *v37;
  _BYTE v38[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc((Class)OBWelcomeController);
  v28 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  v9 = objc_msgSend(v7, "initWithTitle:detailText:icon:", v8, 0, 0);

  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Welcome Screen] Continue"), CFSTR("localized string not found"), 0));
  objc_msgSend(v10, "setTitle:forState:", v12, 0);

  objc_initWeak(&location, v9);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100255DA8;
  v33[3] = &unk_1011ADA28;
  objc_copyWeak(&v35, &location);
  v27 = v6;
  v34 = v27;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v33));
  objc_msgSend(v10, "addAction:forControlEvents:", v13, 0x2000);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "buttonTray"));
  objc_msgSend(v14, "addButton:", v10);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bullets"));
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "body"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "image"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tintColor"));
        objc_msgSend(v9, "addBulletedListItemWithTitle:description:image:tintColor:", v20, v21, v22, v23);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v16);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "buttonTray"));
  v37 = CFSTR("com.apple.onboarding.maps");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
  objc_msgSend(v24, "setPrivacyLinkForBundles:", v25);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

  return v9;
}

+ (BOOL)mapsWelcomeCurrentlyBeingPresented
{
  return byte_1014D1E00;
}

@end
