@implementation UGCInformedConsentViewController

+ (void)presentIfNeededWithPresentingViewController:(id)a3 presentationContext:(int64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  UGCInformedConsentViewController *v11;
  uint8_t v12[16];

  v7 = a3;
  v8 = a5;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v8)
  {
    if (MKGetHasUserConsentedToAddingContributions(v8, v9) == 1)
    {
      v10[2](v10, 1, 0);
    }
    else
    {
      v11 = -[UGCInformedConsentViewController initWithCompletion:]([UGCInformedConsentViewController alloc], "initWithCompletion:", v10);
      -[UGCInformedConsentViewController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 2);
      -[UGCInformedConsentViewController setPresentationContext:](v11, "setPresentationContext:", a4);
      if (sub_1002A8AA0(v11) == 5)
        objc_msgSend(v7, "presentViewController:animated:completion:", v11, 1, 0);
      else
        objc_msgSend(v7, "_maps_topMostPresentViewController:animated:completion:", v11, 1, 0);

    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0)", v12, 2u);
  }

}

- (UGCInformedConsentViewController)initWithCompletion:(id)a3
{
  id v4;
  int IsEnabled_ARPCommunityID;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  UGCInformedConsentViewController *v10;
  id v11;
  id completion;
  objc_super v14;

  v4 = a3;
  IsEnabled_ARPCommunityID = MapsFeature_IsEnabled_ARPCommunityID(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = v6;
  if (IsEnabled_ARPCommunityID)
    v8 = CFSTR("Contributing Photos to Maps [UGC]");
  else
    v8 = CFSTR("Introducing Ratings and Photos [UGC]");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, CFSTR("localized string not found"), 0));

  v14.receiver = self;
  v14.super_class = (Class)UGCInformedConsentViewController;
  v10 = -[UGCInformedConsentViewController initWithTitle:detailText:icon:](&v14, "initWithTitle:detailText:icon:", v9, 0, 0);
  if (v10)
  {
    v11 = objc_msgSend(v4, "copy");
    completion = v10->_completion;
    v10->_completion = v11;

  }
  return v10;
}

- (void)_captureUserAction:(int)a3 withValue:(id)a4
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", *(_QWORD *)&a3, 698, a4);
}

- (void)viewDidLoad
{
  int64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UGCInformedConsentViewController;
  -[UGCInformedConsentViewController viewDidLoad](&v6, "viewDidLoad");
  -[UGCInformedConsentViewController _setupPrivacyController](self, "_setupPrivacyController");
  v3 = -[UGCInformedConsentViewController presentationContext](self, "presentationContext");
  v4 = CFSTR("placecard");
  if (v3 != 1)
    v4 = 0;
  if (v3 == 2)
    v5 = CFSTR("suggestion");
  else
    v5 = v4;
  -[UGCInformedConsentViewController _captureUserAction:withValue:](self, "_captureUserAction:withValue:", 45, v5);
}

- (void)_setupPrivacyController
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Share Your Experience [UGC]"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Share Your Experience Description [UGC]"), CFSTR("localized string not found"), 0));

  v7 = objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("hand.thumbsup")));
  if ((MapsFeature_IsEnabled_ARPCommunityID(v7) & 1) == 0)
    -[UGCInformedConsentViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v4, v6, v7);
  v37 = (void *)v7;
  v38 = (void *)v6;
  v39 = (void *)v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Siri Suggestions [UGC]"), CFSTR("localized string not found"), 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Siri Suggestions Description [UGC]"), CFSTR("localized string not found"), 0));

  v35 = (void *)v11;
  v36 = (void *)v9;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("location")));
  -[UGCInformedConsentViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Photo Credit [UGC]"), CFSTR("localized string not found"), 0));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Photo Credit Description [UGC]"), CFSTR("localized string not found"), 0));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("camera.badge.ellipsis")));
  v32 = (void *)v15;
  v33 = (void *)v13;
  -[UGCInformedConsentViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Community Safety [UGC]"), CFSTR("localized string not found"), 0));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Community Safety Description [UGC]"), CFSTR("localized string not found"), 0));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("person.3")));
  if ((MapsFeature_IsEnabled_ARPCommunityID(v21) & 1) == 0)
    -[UGCInformedConsentViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v18, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Continue [UGC]"), CFSTR("localized string not found"), 0));
  objc_msgSend(v22, "setTitle:forState:", v24, 0);

  objc_msgSend(v22, "addTarget:action:forControlEvents:", self, "_continuePressed", 64);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Not Now [UGC]"), CFSTR("localized string not found"), 0));
  objc_msgSend(v25, "setTitle:forState:", v27, 0);

  objc_msgSend(v25, "addTarget:action:forControlEvents:", self, "_notNowPressed", 64);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInformedConsentViewController buttonTray](self, "buttonTray"));
  v40 = CFSTR("com.apple.onboarding.ratingsAndPhotos");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
  objc_msgSend(v28, "setPrivacyLinkForBundles:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInformedConsentViewController buttonTray](self, "buttonTray"));
  objc_msgSend(v30, "addButton:", v22);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInformedConsentViewController buttonTray](self, "buttonTray"));
  objc_msgSend(v31, "addButton:", v25);

}

- (void)_continuePressed
{
  -[UGCInformedConsentViewController _captureUserAction:withValue:](self, "_captureUserAction:withValue:", 98, 0);
  -[UGCInformedConsentViewController _invokeCompletionWithHasGivenConsent:](self, "_invokeCompletionWithHasGivenConsent:", 1);
}

- (void)_notNowPressed
{
  -[UGCInformedConsentViewController _captureUserAction:withValue:](self, "_captureUserAction:withValue:", 25, 0);
  -[UGCInformedConsentViewController _invokeCompletionWithHasGivenConsent:](self, "_invokeCompletionWithHasGivenConsent:", 0);
}

- (void)_invokeCompletionWithHasGivenConsent:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t HasUserConsentedToAddingContributions;
  char v6;
  char v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;
  char v11;
  id location;

  v3 = a3;
  HasUserConsentedToAddingContributions = MKGetHasUserConsentedToAddingContributions(self, a2);
  MKSetHasUserConsentedToAddingContributions(v3);
  +[RatingRequestHomeAvailability setHasShownTipKitAlertOnProactiveTray](RatingRequestHomeAvailability, "setHasShownTipKitAlertOnProactiveTray");
  v6 = HasUserConsentedToAddingContributions != 2 || v3;
  v7 = (HasUserConsentedToAddingContributions != 1 || ~v3) & v6;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100941280;
  v8[3] = &unk_1011B0A98;
  objc_copyWeak(&v9, &location);
  v10 = v3;
  v11 = v7;
  -[UGCInformedConsentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (int64_t)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(int64_t)a3
{
  self->_presentationContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
