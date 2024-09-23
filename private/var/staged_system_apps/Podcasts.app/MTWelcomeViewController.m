@implementation MTWelcomeViewController

- (MTWelcomeViewController)init
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MTWelcomeViewController *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  id v27;
  id v28;
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
  void *v40;
  void *v42;
  _QWORD v43[4];
  id v44;
  id location;
  objc_super v46;
  objc_super v47;
  objc_super v48;
  _QWORD v49[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("WELCOME_START_LINK"), &stru_1004C6D40, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[OBPrivacyLinkController linkWithBundleIdentifier:](OBPrivacyLinkController, "linkWithBundleIdentifier:", kMTPodcastsPrivacyIdentifier));
  objc_msgSend(v4, "setModalPresentationStyle:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("MTWelcomeVersion")));

  if (!os_feature_enabled_ponderosa() || v42)
  {
    v12 = objc_alloc((Class)AMSUIOnboardingFeature);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("square.and.arrow.up.badge.clock")));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageWithRenderingMode:", 2));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("WELCOME_TITLE_A"), &stru_1004C6D40, 0));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("WELCOME_DESCRIPTION_A"), &stru_1004C6D40, 0));
    v27 = objc_msgSend(v12, "initWithImage:titleText:descriptionText:", v35, v38, v37);
    v49[0] = v27;
    v14 = objc_alloc((Class)AMSUIOnboardingFeature);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("magnifyingglass")));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "imageWithRenderingMode:", 2));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("WELCOME_TITLE_B"), &stru_1004C6D40, 0));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("WELCOME_DESCRIPTION_B"), &stru_1004C6D40, 0));
    v28 = objc_msgSend(v14, "initWithImage:titleText:descriptionText:", v32, v31, v30);
    v49[1] = v28;
    v15 = objc_alloc((Class)AMSUIOnboardingFeature);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("list.bullet")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "imageWithRenderingMode:", 2));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("WELCOME_TITLE_C"), &stru_1004C6D40, 0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("WELCOME_DESCRIPTION_C"), &stru_1004C6D40, 0));
    v21 = objc_msgSend(v15, "initWithImage:titleText:descriptionText:", v16, v18, v20);
    v49[2] = v21;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 3));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WELCOME_HEADER_TITLE"), &stru_1004C6D40, 0));
    v47.receiver = self;
    v47.super_class = (Class)MTWelcomeViewController;
    v11 = -[MTWelcomeViewController initWithTitleText:features:primaryButtonText:privacyLinkController:](&v47, "initWithTitleText:features:primaryButtonText:privacyLinkController:", v8, v6, v3, v4);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("welcome_app_icon")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WELCOME_FIRST_TIME_USER_TITLE"), &stru_1004C6D40, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("WELCOME_FIRST_TIME_USER_DESCRIPTION"), &stru_1004C6D40, 0));
    v48.receiver = self;
    v48.super_class = (Class)MTWelcomeViewController;
    v11 = -[MTWelcomeViewController initWithHeaderImage:titleText:descriptionText:primaryButtonText:privacyLinkController:](&v48, "initWithHeaderImage:titleText:descriptionText:primaryButtonText:privacyLinkController:", v6, v8, v10, v3, v4);

  }
  v46.receiver = v11;
  v46.super_class = (Class)MTWelcomeViewController;
  v22 = -[MTWelcomeViewController welcomeController](&v46, "welcomeController");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "headerView"));
  LODWORD(v25) = 0;
  objc_msgSend(v24, "setTitleHyphenationFactor:", v25);

  if (v11)
  {
    objc_initWeak(&location, v11);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100109E68;
    v43[3] = &unk_1004AB6D8;
    objc_copyWeak(&v44, &location);
    -[MTWelcomeViewController setPrimaryButtonCallback:](v11, "setPrimaryButtonCallback:", v43);
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (MTWelcomeViewController)initWithMetricsSender:(id)a3
{
  id v5;
  MTWelcomeViewController *v6;
  MTWelcomeViewController *v7;

  v5 = a3;
  v6 = -[MTWelcomeViewController init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_metricsSender, a3);

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTWelcomeViewController;
  v3 = -[MTWelcomeViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  v4 = _MTLogCategoryPrivacy(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Welcome VC will appear", v6, 2u);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTWelcomeViewController;
  -[MTWelcomeViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTWelcomeViewController metricsSender](self, "metricsSender"));
  objc_msgSend(v4, "welcomeControllerDidAppear");

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  uint8_t v13[16];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTWelcomeViewController;
  -[MTWelcomeViewController viewWillDisappear:](&v14, "viewWillDisappear:", a3);
  v4 = -[MTWelcomeViewController acknowledged](self, "acknowledged");
  v5 = v4;
  v6 = _MTLogCategoryPrivacy(v4);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      v9 = "Welcome screen dismissed after user acknowledgement";
      v10 = v8;
      v11 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, v13, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v13 = 0;
    v9 = "WelcomeVC dismissed but user HAS NOT ACKNOWLEDGED";
    v10 = v8;
    v11 = OS_LOG_TYPE_FAULT;
    goto LABEL_6;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTWelcomeViewController metricsSender](self, "metricsSender"));
  objc_msgSend(v12, "welcomeControllerWillDisappear");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTWelcomeViewController;
  -[MTWelcomeViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTWelcomeViewController metricsSender](self, "metricsSender"));
  objc_msgSend(v4, "welcomeControllerDidDisappear");

}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)didTapStartButton
{
  _QWORD v3[5];

  +[MTWelcomeUtil markWelcomeAsShown](MTWelcomeUtil, "markWelcomeAsShown");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10010A17C;
  v3[3] = &unk_1004A6200;
  v3[4] = self;
  -[MTWelcomeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (void)addAcknowledgementCompletionBlock:(id)a3
{
  id v4;
  NSMutableArray *acknowledgementCompletionBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    acknowledgementCompletionBlocks = self->_acknowledgementCompletionBlocks;
    v10 = v4;
    if (!acknowledgementCompletionBlocks)
    {
      v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v7 = self->_acknowledgementCompletionBlocks;
      self->_acknowledgementCompletionBlocks = v6;

      acknowledgementCompletionBlocks = self->_acknowledgementCompletionBlocks;
    }
    v8 = objc_msgSend(v10, "copy");
    v9 = objc_retainBlock(v8);
    -[NSMutableArray addObject:](acknowledgementCompletionBlocks, "addObject:", v9);

    v4 = v10;
  }

}

- (void)performAcknowledgementCompletionBlocks
{
  id v3;

  v3 = -[NSMutableArray copy](self->_acknowledgementCompletionBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_acknowledgementCompletionBlocks, "removeAllObjects");
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &stru_1004AB6F8);

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  MTWelcomeViewController *v7;
  id v8;
  uint64_t v9;
  MTWelcomeViewController *v10;
  MTWelcomeViewController *v11;
  MTWelcomeViewController *v12;
  void *v13;
  MTWelcomeViewController *v14;
  id v15;

  v7 = (MTWelcomeViewController *)a3;
  v8 = a4;
  v9 = objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    v10 = v7;
  else
    v10 = 0;
  v11 = v10;
  v12 = v11;
  if (v7 == self
    || (v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTWelcomeViewController viewControllers](v11, "viewControllers")),
        v14 = (MTWelcomeViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject")),
        v14,
        v13,
        v14 == self))
  {
    v15 = objc_msgSend(objc_alloc((Class)UIPresentationController), "initWithPresentedViewController:presentingViewController:", v7, v8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSMutableArray)acknowledgementCompletionBlocks
{
  return self->_acknowledgementCompletionBlocks;
}

- (MTWelcomeViewControllerMetricsSender)metricsSender
{
  return self->_metricsSender;
}

- (BOOL)acknowledged
{
  return self->_acknowledged;
}

- (void)setAcknowledged:(BOOL)a3
{
  self->_acknowledged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsSender, 0);
  objc_storeStrong((id *)&self->_acknowledgementCompletionBlocks, 0);
}

@end
