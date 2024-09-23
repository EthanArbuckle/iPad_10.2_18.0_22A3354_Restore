@implementation NCDigestOnboardingNavigationController

+ (id)navigationControllerWithOnboardingDelegate:(id)a3 deferButtonText:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NCDigestOnboardingNavigationController _initWithWithOnboardingDelegate:deferButtonText:previousBundleIdentifiersSelection:previousDeliveryTimesSelection:entrySource:]([NCDigestOnboardingNavigationController alloc], "_initWithWithOnboardingDelegate:deferButtonText:previousBundleIdentifiersSelection:previousDeliveryTimesSelection:entrySource:", v6, v5, 0, 0, 1);

  return v7;
}

+ (id)navigationControllerWithOnboardingDelegate:(id)a3 deferButtonText:(id)a4 previousBundleIdentifiersSelection:(id)a5 previousDeliveryTimesSelection:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[NCDigestOnboardingNavigationController _initWithWithOnboardingDelegate:deferButtonText:previousBundleIdentifiersSelection:previousDeliveryTimesSelection:entrySource:]([NCDigestOnboardingNavigationController alloc], "_initWithWithOnboardingDelegate:deferButtonText:previousBundleIdentifiersSelection:previousDeliveryTimesSelection:entrySource:", v12, v11, v10, v9, 0);

  return v13;
}

- (id)_initWithWithOnboardingDelegate:(id)a3 deferButtonText:(id)a4 previousBundleIdentifiersSelection:(id)a5 previousDeliveryTimesSelection:(id)a6 entrySource:(int)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NCDigestOnboardingNavigationController *v17;
  NCDigestOnboardingNavigationController *v18;
  void *v19;
  void *v20;
  NSSet *shownAppBundleIdentifiers;
  NSDate *v22;
  NSDate *startTime;
  void *v24;
  id v26;
  _QWORD v27[4];
  NCDigestOnboardingNavigationController *v28;
  id v29;
  id location;
  objc_super v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  +[NCDigestOnboardingIntroductionViewController introductionViewControllerWithDeferButtonText:](NCDigestOnboardingIntroductionViewController, "introductionViewControllerWithDeferButtonText:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31.receiver = self;
  v31.super_class = (Class)NCDigestOnboardingNavigationController;
  v17 = -[NCDigestOnboardingNavigationController initWithRootViewController:](&v31, sel_initWithRootViewController_, v16);
  v18 = v17;
  if (v17)
  {
    v26 = v15;
    -[NCModalNavigationController setPresenterDelegate:](v17, "setPresenterDelegate:", v12);
    NCUserNotificationsUIKitFrameworkBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ONBOARDING_INTRODUCTION_NEXT_BUTTON"), &stru_1E8D21F60, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNextButtonText:", v20);

    objc_msgSend(v16, "setDelegate:", v18);
    objc_storeStrong((id *)&v18->_deliveryTimes, a6);
    objc_storeStrong((id *)&v18->_appBundleIdentifiers, a5);
    v18->_entrySource = a7;
    shownAppBundleIdentifiers = v18->_shownAppBundleIdentifiers;
    v18->_shownAppBundleIdentifiers = 0;

    v18->_appPickerShowMoreButtonWasPressed = 0;
    v18->_userDeferredOnboarding = 0;
    v18->_finalUIShown = 0;
    v18->_userFinishedOnboarding = 0;
    v22 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    startTime = v18->_startTime;
    v18->_startTime = v22;

    v18->_waitingToPresentAppPicker = 0;
    v18->_deliveryTimesMutated = 0;
    v18->_appBundleIdentifiersMutated = 0;
    objc_initWeak(&location, v18);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __168__NCDigestOnboardingNavigationController__initWithWithOnboardingDelegate_deferButtonText_previousBundleIdentifiersSelection_previousDeliveryTimesSelection_entrySource___block_invoke;
    v27[3] = &unk_1E8D1F3C0;
    objc_copyWeak(&v29, &location);
    v28 = v18;
    +[NCAppPickerContentProvider providerWithPreviousBundleIdentifiersSelection:numDaysForAverageNotificationCount:onMainQueue:](NCAppPickerContentProvider, "providerWithPreviousBundleIdentifiersSelection:numDaysForAverageNotificationCount:onMainQueue:", v14, v24, v27);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
    v15 = v26;
  }

  return v18;
}

void __168__NCDigestOnboardingNavigationController__initWithWithOnboardingDelegate_deferButtonText_previousBundleIdentifiersSelection_previousDeliveryTimesSelection_entrySource___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  _BYTE *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong((id *)WeakRetained + 186, a2);
    if (v5[1496])
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "isBeingDismissed") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_pushToAppPicker");
        v5[1496] = 0;
      }
    }
  }

}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCDigestOnboardingNavigationController;
  -[NCDigestOnboardingNavigationController pushViewController:animated:](&v7, sel_pushViewController_animated_, a3, a4);
  -[NCDigestOnboardingNavigationController navigationBar](self, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (id)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = a3;
  -[NCDigestOnboardingNavigationController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCDigestOnboardingNavigationController _saveStateOfOnboardingViewController:](self, "_saveStateOfOnboardingViewController:", v6);

  v8.receiver = self;
  v8.super_class = (Class)NCDigestOnboardingNavigationController;
  -[NCDigestOnboardingNavigationController popViewControllerAnimated:](&v8, sel_popViewControllerAnimated_, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCDigestOnboardingNavigationController;
  -[NCDigestOnboardingNavigationController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  -[NCModalNavigationController presenterDelegate](self, "presenterDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_userFinishedOnboarding && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCDigestOnboardingNavigationController viewControllers](self, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCDigestOnboardingNavigationController _saveStateOfOnboardingViewController:](self, "_saveStateOfOnboardingViewController:", v6);

    objc_msgSend(v4, "digestOnboardingNavigationController:didChangeDeliveryTimesActiveSelection:appBundleIdentifiersActiveSelection:", self, self->_deliveryTimes, self->_appBundleIdentifiers);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  uint64_t userDeferredOnboarding;
  NSSet *shownAppBundleIdentifiers;
  NSSet *v9;
  NSSet *v10;
  id v11;
  void *v12;
  NSArray *deliveryTimes;
  objc_class *v14;
  NSArray *v15;
  id v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NCDigestOnboardingNavigationController;
  -[NCModalNavigationController viewDidDisappear:](&v17, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", self->_startTime);
  v6 = v5;
  if (self->_userFinishedOnboarding)
    userDeferredOnboarding = 2;
  else
    userDeferredOnboarding = self->_userDeferredOnboarding;
  shownAppBundleIdentifiers = self->_shownAppBundleIdentifiers;
  if (shownAppBundleIdentifiers)
    v9 = shownAppBundleIdentifiers;
  else
    v9 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
  v10 = v9;
  if (self->_appBundleIdentifiers && self->_appBundleIdentifiersMutated)
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", self->_appBundleIdentifiers);
  else
    v11 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v12 = v11;
  if (self->_deliveryTimesMutated)
    deliveryTimes = self->_deliveryTimes;
  else
    deliveryTimes = 0;
  v14 = (objc_class *)MEMORY[0x1E0CF8DB0];
  v15 = deliveryTimes;
  v16 = objc_alloc_init(v14);
  objc_msgSend(v16, "logDigestOnboardingWithEntrySource:digestSetupOutcome:finalUIShown:timeTaken:didSelectShowMore:numDaysForAverageNotificationCount:shownApps:appsAddedToDigest:deliveryTimes:", self->_entrySource, userDeferredOnboarding, self->_finalUIShown, self->_appPickerShowMoreButtonWasPressed, 14, v10, v6, v12, v15);

}

- (void)onboardingViewControllerNextButtonTapped:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NCDigestOnboardingNavigationController _saveStateOfOnboardingViewController:](self, "_saveStateOfOnboardingViewController:", v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self->_contentProvider)
      -[NCDigestOnboardingNavigationController _pushToAppPicker](self, "_pushToAppPicker");
    else
      self->_waitingToPresentAppPicker = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[NCSchedulerViewController schedulerWithDeliveryTimes:](NCSchedulerViewController, "schedulerWithDeliveryTimes:", self->_deliveryTimes);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDelegate:", self);
      -[NCDigestOnboardingNavigationController pushViewController:animated:](self, "pushViewController:animated:", v4, 1);
    }
    else
    {
      self->_userFinishedOnboarding = 1;
      -[NCModalNavigationController presenterDelegate](self, "presenterDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v4, "digestOnboardingNavigationController:didScheduleDigestDeliveryTimes:forAppBundleIdentifiers:", self, self->_deliveryTimes, self->_appBundleIdentifiers);
      -[NCDigestOnboardingNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    }

  }
}

- (void)_pushToAppPicker
{
  id v3;

  +[NCAppPickerViewController appPickerViewControllerWithContentProvider:](NCAppPickerViewController, "appPickerViewControllerWithContentProvider:", self->_contentProvider);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);
  -[NCDigestOnboardingNavigationController pushViewController:animated:](self, "pushViewController:animated:", v3, 1);

}

- (void)onboardingViewControllerDidDeferSetup:(id)a3
{
  id v4;

  self->_userDeferredOnboarding = 1;
  -[NCModalNavigationController presenterDelegate](self, "presenterDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "digestOnboardingNavigationControllerDidDeferSetup:", self);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_saveStateOfOnboardingViewController:(id)a3
{
  NSArray *v4;
  NSArray *deliveryTimes;
  int v6;
  NSArray *v7;
  NSArray *appBundleIdentifiers;
  NSSet *v9;
  NSSet *shownAppBundleIdentifiers;
  id v11;

  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "deliveryTimes");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    deliveryTimes = self->_deliveryTimes;
    self->_deliveryTimes = v4;

    self->_deliveryTimesMutated = 1;
    v6 = 2;
LABEL_5:
    self->_finalUIShown = v6;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "selectedBundleIdentifiers");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    appBundleIdentifiers = self->_appBundleIdentifiers;
    self->_appBundleIdentifiers = v7;

    v6 = 1;
    self->_appBundleIdentifiersMutated = 1;
    objc_msgSend(v11, "shownBundleIdentifiers");
    v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
    shownAppBundleIdentifiers = self->_shownAppBundleIdentifiers;
    self->_shownAppBundleIdentifiers = v9;

    self->_appPickerShowMoreButtonWasPressed = objc_msgSend(v11, "showMoreButtonWasPressed");
    goto LABEL_5;
  }
LABEL_6:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_shownAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_deliveryTimes, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifiers, 0);
}

@end
