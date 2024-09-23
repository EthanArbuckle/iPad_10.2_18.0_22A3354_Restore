@implementation UGCThirdPartyPhotoSharingSplashViewController

+ (void)checkShouldPresentPhotoSharingSplash:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100BEF910;
  v4[3] = &unk_1011E8D00;
  v5 = a3;
  v3 = v5;
  +[UGCReviewedPlaceManager fetchAllHistoryObjectsWithPhotosFromStorageWithCompletion:](UGCReviewedPlaceManager, "fetchAllHistoryObjectsWithPhotosFromStorageWithCompletion:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UGCThirdPartyPhotoSharingSplashViewController;
  -[UGCThirdPartyPhotoSharingSplashViewController viewDidLoad](&v13, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCThirdPartyPhotoSharingSplashViewController presentationController](self, "presentationController"));
  objc_msgSend(v3, "setDelegate:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCThirdPartyPhotoSharingSplashViewController _obViewController](self, "_obViewController"));
  -[UGCThirdPartyPhotoSharingSplashViewController addChildViewController:](self, "addChildViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCThirdPartyPhotoSharingSplashViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "addSubview:", v6);

  objc_msgSend(v4, "didMoveToParentViewController:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCThirdPartyPhotoSharingSplashViewController view](self, "view"));
  LODWORD(v10) = 1148846080;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_constraintsEqualToEdgesOfView:priority:", v9, v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (id)_obViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[UGC] Third Party Photo Sharing title"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[UGC] Third Party Photo Sharing subtitle"), CFSTR("localized string not found"), 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("photo.on.rectangle.angled")));
  v8 = objc_msgSend(objc_alloc((Class)OBWelcomeController), "initWithTitle:detailText:icon:", v4, v6, v7);
  objc_msgSend(v8, "setModalPresentationStyle:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[UGC] Allow button"), CFSTR("localized string not found"), 0));
  objc_msgSend(v9, "setTitle:forState:", v11, 0);

  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, "_sharePressed", 64);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "buttonTray"));
  objc_msgSend(v12, "addButton:", v9);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("[UGC] Don’t Allow button"), CFSTR("localized string not found"), 0));
  objc_msgSend(v13, "setTitle:forState:", v15, 0);

  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, "_noThanksPressed", 64);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "buttonTray"));
  objc_msgSend(v16, "addButton:", v13);

  return v8;
}

- (void)_sharePressed
{
  -[UGCThirdPartyPhotoSharingSplashViewController _setThirdPartyPhotoShareEnabled:](self, "_setThirdPartyPhotoShareEnabled:", 1);
}

- (void)_noThanksPressed
{
  -[UGCThirdPartyPhotoSharingSplashViewController _setThirdPartyPhotoShareEnabled:](self, "_setThirdPartyPhotoShareEnabled:", 0);
}

- (void)_setThirdPartyPhotoShareEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UGCThirdPartyPhotoSharingPreferencesManager sharedManager](UGCThirdPartyPhotoSharingPreferencesManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCThirdPartyPhotoSharingSplashViewController thirdPartyPhotoSharingPreference](self, "thirdPartyPhotoSharingPreference"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "version"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100BEFF00;
  v8[3] = &unk_1011BDC88;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "updateThirdPartyPhotoSharingPreferences:versionID:completion:", v3, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (GEORPThirdPartyPhotoSharingPreference)thirdPartyPhotoSharingPreference
{
  return self->_thirdPartyPhotoSharingPreference;
}

- (void)setThirdPartyPhotoSharingPreference:(id)a3
{
  objc_storeStrong((id *)&self->_thirdPartyPhotoSharingPreference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyPhotoSharingPreference, 0);
}

@end
