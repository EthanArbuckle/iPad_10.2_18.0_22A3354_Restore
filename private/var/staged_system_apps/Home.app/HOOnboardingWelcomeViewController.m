@implementation HOOnboardingWelcomeViewController

- (HOOnboardingWelcomeViewController)initWithDelegate:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  HOOnboardingWelcomeViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  uint64_t v34;
  OBTrayButton *continueButton;
  OBTrayButton *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  objc_super v41;

  v4 = a3;
  v5 = sub_10000D7E0(CFSTR("HOWelcomeView_Title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v41.receiver = self;
  v41.super_class = (Class)HOOnboardingWelcomeViewController;
  v7 = -[HOOnboardingWelcomeViewController initWithTitle:detailText:icon:](&v41, "initWithTitle:detailText:icon:", v6, 0, 0);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("HomeWelcomeIcon_Control")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageWithRenderingMode:", 2));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithTintColor:", v10));

    v12 = sub_10000D7E0(CFSTR("HOWelcomeView_Subtitle_Control"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = sub_10000D7E0(CFSTR("HOWelcomeView_Description_Control"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[HOOnboardingWelcomeViewController addBulletedListItemWithTitle:description:image:](v7, "addBulletedListItemWithTitle:description:image:", v13, v15, v11);

    v16 = sub_10000D7E0(CFSTR("HOWelcomeView_Subtitle_Automate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = sub_10000D7E0(CFSTR("HOWelcomeView_Description_Automate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("HomeWelcomeIcon_Automation")));
    -[HOOnboardingWelcomeViewController addBulletedListItemWithTitle:description:image:](v7, "addBulletedListItemWithTitle:description:image:", v17, v19, v20);

    v21 = sub_10000D7E0(CFSTR("HOWelcomeView_Subtitle_Share"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = sub_10000D7E0(CFSTR("HOWelcomeView_Description_Share"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("HomeWelcomeIcon_Share")));
    -[HOOnboardingWelcomeViewController addBulletedListItemWithTitle:description:image:](v7, "addBulletedListItemWithTitle:description:image:", v22, v24, v25);

    v26 = sub_10000D7E0(CFSTR("HOWelcomeView_Subtitle_ActivityHistory"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = sub_10000D7E0(CFSTR("HOWelcomeView_Description_ActivityHistory"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("HomeWelcomIcon_ActivityHistory")));
    -[HOOnboardingWelcomeViewController addBulletedListItemWithTitle:description:image:](v7, "addBulletedListItemWithTitle:description:image:", v27, v29, v30);

    if ((+[HFUtilities isAMac](HFUtilities, "isAMac") & 1) != 0
      || +[HFUtilities isAVisionPro](HFUtilities, "isAVisionPro"))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingWelcomeViewController buttonTray](v7, "buttonTray"));
      v32 = sub_10000D7E0(CFSTR("HOWelcomeView_FinePrint_AddAccessories"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      objc_msgSend(v31, "addCaptionText:", v33);

    }
    v34 = objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
    continueButton = v7->_continueButton;
    v7->_continueButton = (OBTrayButton *)v34;

    -[OBTrayButton setTranslatesAutoresizingMaskIntoConstraints:](v7->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v36 = v7->_continueButton;
    v37 = sub_10000D7E0(CFSTR("HOWelcomeView_Button_Continue"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    -[OBTrayButton setTitle:forState:](v36, "setTitle:forState:", v38, 0);

    -[OBTrayButton addTarget:action:forControlEvents:](v7->_continueButton, "addTarget:action:forControlEvents:", v7, "_continue:", 64);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingWelcomeViewController buttonTray](v7, "buttonTray"));
    objc_msgSend(v39, "addButton:", v7->_continueButton);

    -[HOOnboardingWelcomeViewController setModalInPresentation:](v7, "setModalInPresentation:", 1);
    -[HOOnboardingWelcomeViewController setDelegate:](v7, "setDelegate:", v4);

  }
  return v7;
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
  HOOnboardingWelcomeViewController *v13;
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

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingWelcomeViewController delegate](self, "delegate"));
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

- (UILabel)addAccessoryFromiOSLabel
{
  return self->_addAccessoryFromiOSLabel;
}

- (void)setAddAccessoryFromiOSLabel:(id)a3
{
  objc_storeStrong((id *)&self->_addAccessoryFromiOSLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addAccessoryFromiOSLabel, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_destroyWeak((id *)&self->navigationBarDelegate);
  objc_destroyWeak((id *)&self->delegate);
}

@end
