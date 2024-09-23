@implementation SplashScreenViewController

- (SplashScreenViewController)init
{
  void *v3;
  SplashScreenViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  objc_super v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKSplashScreenStrings title](CUIKSplashScreenStrings, "title"));
  v28.receiver = self;
  v28.super_class = (Class)SplashScreenViewController;
  v4 = -[SplashScreenViewController initWithTitle:detailText:icon:](&v28, "initWithTitle:detailText:icon:", v3, 0, 0);

  if (v4)
  {
    -[SplashScreenViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleTitle1, 3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKSplashScreenStrings reminderIntegrationTitle](CUIKSplashScreenStrings, "reminderIntegrationTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKSplashScreenStrings reminderIntegrationText](CUIKSplashScreenStrings, "reminderIntegrationText"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKSplashScreenStrings reminderIntegrationIcon](CUIKSplashScreenStrings, "reminderIntegrationIcon"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v8, v5));
    -[SplashScreenViewController addBulletedListItemWithTitle:description:image:](v4, "addBulletedListItemWithTitle:description:image:", v6, v7, v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if (!v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKSplashScreenStrings monthViewScaleTitle](CUIKSplashScreenStrings, "monthViewScaleTitle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKSplashScreenStrings monthViewScaleText](CUIKSplashScreenStrings, "monthViewScaleText"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKSplashScreenStrings monthViewScaleIcon](CUIKSplashScreenStrings, "monthViewScaleIcon"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v14, v5));
      -[SplashScreenViewController addBulletedListItemWithTitle:description:image:](v4, "addBulletedListItemWithTitle:description:image:", v12, v13, v15);

    }
    if ((+[EKFeatureSet eventsFoundInAppsEnabled](EKFeatureSet, "eventsFoundInAppsEnabled") & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKSplashScreenStrings suggestedEventsTitleText](CUIKSplashScreenStrings, "suggestedEventsTitleText"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKSplashScreenStrings suggestedEventsFeatureText](CUIKSplashScreenStrings, "suggestedEventsFeatureText"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKSplashScreenStrings suggestedEventsIcon](CUIKSplashScreenStrings, "suggestedEventsIcon"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v18, v5));
      -[SplashScreenViewController addBulletedListItemWithTitle:description:image:](v4, "addBulletedListItemWithTitle:description:image:", v16, v17, v19);

    }
    if ((+[EKFeatureSet automaticGeocodingEnabled](EKFeatureSet, "automaticGeocodingEnabled") & 1) == 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKSplashScreenStrings timeToLeaveAndAutomaticGeocodingTitleText](CUIKSplashScreenStrings, "timeToLeaveAndAutomaticGeocodingTitleText"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKSplashScreenStrings timeToLeaveAndAutomaticGeocodingFeatureText](CUIKSplashScreenStrings, "timeToLeaveAndAutomaticGeocodingFeatureText"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKSplashScreenStrings timeToLeaveAndAutomaticGeocodingIcon](CUIKSplashScreenStrings, "timeToLeaveAndAutomaticGeocodingIcon"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v22, v5));
      -[SplashScreenViewController addBulletedListItemWithTitle:description:image:](v4, "addBulletedListItemWithTitle:description:image:", v20, v21, v23);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKSplashScreenStrings continueButtonText](CUIKSplashScreenStrings, "continueButtonText"));
    objc_msgSend(v24, "setTitle:forState:", v25, 0);

    objc_msgSend(v24, "addTarget:action:forControlEvents:", v4, "dismissSplashScreen", 64);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SplashScreenViewController buttonTray](v4, "buttonTray"));
    objc_msgSend(v26, "addButton:", v24);

  }
  return v4;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double Width;
  uint64_t v12;
  double Height;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SplashScreenViewController view](self, "view"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  Width = CGRectGetWidth(v20);
  if (Width < EKUIWidthForWindowSizeParadigm(32, v12))
  {
    v21.origin.x = v4;
    v21.origin.y = v6;
    v21.size.width = v8;
    v21.size.height = v10;
    Height = CGRectGetHeight(v21);
    if (Height < EKUIHeightForWindowSizeParadigm(32, v14))
      return 2;
  }
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  v15 = CGRectGetWidth(v22);
  if (v15 >= EKUIWidthForWindowSizeParadigm(1024, v16))
    return 30;
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  v17 = CGRectGetHeight(v23);
  if (v17 >= EKUIHeightForWindowSizeParadigm(1024, v18))
    return 30;
  else
    return 2;
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)dismissSplashScreen
{
  -[SplashScreenViewController _continueButtonTappedCallback](self, "_continueButtonTappedCallback");
}

- (void)_continueButtonTappedCallback
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  int v6;
  SplashScreenViewController *v7;

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1001B2B70);
  v3 = objc_claimAutoreleasedReturnValue(-[SplashScreenViewController doneBlock](self, "doneBlock"));
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    -[SplashScreenViewController setDoneBlock:](self, "setDoneBlock:", 0);
  }
  else
  {
    v5 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "No 'done' blocked given.  Will not notify that [%@] is done.", (uint8_t *)&v6, 0xCu);
    }
  }

}

- (id)doneBlock
{
  return self->_doneBlock;
}

- (void)setDoneBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_doneBlock, 0);
}

@end
