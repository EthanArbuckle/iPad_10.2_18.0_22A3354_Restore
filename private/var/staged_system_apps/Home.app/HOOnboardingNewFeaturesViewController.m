@implementation HOOnboardingNewFeaturesViewController

+ (int64_t)newFeaturesOnboardingVersion
{
  return 5;
}

- (HOOnboardingNewFeaturesViewController)initWithDelegate:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  HOOnboardingNewFeaturesViewController *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  OBTrayButton *continueButton;
  OBTrayButton *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v4 = a3;
  v5 = sub_10000C6B8(CFSTR("HONewFeaturesView_Title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v30.receiver = self;
  v30.super_class = (Class)HOOnboardingNewFeaturesViewController;
  v7 = -[HOOnboardingNewFeaturesViewController initWithTitle:detailText:icon:](&v30, "initWithTitle:detailText:icon:", v6, 0, 0);

  if (v7)
  {
    v8 = sub_10000C6B8(CFSTR("HONewFeaturesView_Subtitle_ControlCenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = sub_10000C6B8(CFSTR("HONewFeaturesView_Description_ControlCenter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("NewFeatures_ControlCenter")));
    -[HOOnboardingNewFeaturesViewController addBulletedListItemWithTitle:description:image:](v7, "addBulletedListItemWithTitle:description:image:", v9, v11, v12);

    v13 = sub_10000C6B8(CFSTR("HONewFeaturesView_Subtitle_AccessoriesOnWatch"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = sub_10000C6B8(CFSTR("HONewFeaturesView_Description_AccessoriesOnWatch"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("NewFeatures_Watch")));
    -[HOOnboardingNewFeaturesViewController addBulletedListItemWithTitle:description:image:](v7, "addBulletedListItemWithTitle:description:image:", v14, v16, v17);

    v18 = sub_10000C6B8(CFSTR("HONewFeaturesView_Subtitle_RestrictedGuest"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = sub_10000C6B8(CFSTR("HONewFeaturesView_Description_RestrictedGuest"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("NewFeatures_RestrictedGuest")));
    -[HOOnboardingNewFeaturesViewController addBulletedListItemWithTitle:description:image:](v7, "addBulletedListItemWithTitle:description:image:", v19, v21, v22);

    v23 = objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
    continueButton = v7->_continueButton;
    v7->_continueButton = (OBTrayButton *)v23;

    -[OBTrayButton setTranslatesAutoresizingMaskIntoConstraints:](v7->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v25 = v7->_continueButton;
    v26 = sub_10000C6B8(CFSTR("HONewFeaturesView_Button_Continue"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    -[OBTrayButton setTitle:forState:](v25, "setTitle:forState:", v27, 0);

    -[OBTrayButton addTarget:action:forControlEvents:](v7->_continueButton, "addTarget:action:forControlEvents:", v7, "_continue:", 64);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingNewFeaturesViewController buttonTray](v7, "buttonTray"));
    objc_msgSend(v28, "addButton:", v7->_continueButton);

    -[HOOnboardingNewFeaturesViewController setModalInPresentation:](v7, "setModalInPresentation:", 1);
    -[HOOnboardingNewFeaturesViewController setDelegate:](v7, "setDelegate:", v4);
  }

  return v7;
}

- (void)nextButtonPressed
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOOnboardingNewFeaturesViewController.m"), 89, CFSTR("We aren't supposed to have a next button..."));

}

- (void)_continue:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  HOOnboardingNewFeaturesViewController *v13;
  __int16 v14;
  void *v15;

  v5 = HFLogForCategory(68);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v12, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "homeManager"));
  objc_msgSend(v10, "hf_enableEventLogOnboardingFlag");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingNewFeaturesViewController delegate](self, "delegate"));
  objc_msgSend(v11, "childViewControllerDidFinish:", self);

}

- (HOOnboardingChildViewControllerDelegate)delegate
{
  return (HOOnboardingChildViewControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (HOOnboardingChildViewControllerNavigationBarDelegate)navigationBarDelegate
{
  return (HOOnboardingChildViewControllerNavigationBarDelegate *)objc_loadWeakRetained((id *)&self->navigationBarDelegate);
}

- (void)setNavigationBarDelegate:(id)a3
{
  objc_storeWeak((id *)&self->navigationBarDelegate, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_destroyWeak((id *)&self->navigationBarDelegate);
  objc_destroyWeak((id *)&self->delegate);
}

@end
