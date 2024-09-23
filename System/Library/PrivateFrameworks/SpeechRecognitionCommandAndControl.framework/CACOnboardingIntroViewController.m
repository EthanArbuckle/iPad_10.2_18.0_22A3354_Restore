@implementation CACOnboardingIntroViewController

+ (id)defaultControllerWithStyle:(unint64_t)a3
{
  void *v4;
  const __CFString *v5;
  void *v6;
  CACOnboardingIntroViewController *v7;

  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("Onboarding.Title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((AXDeviceIsPhone() & 1) != 0)
  {
    v5 = CFSTR("Onboarding.Description_iPhone");
  }
  else if (AXDeviceIsPad())
  {
    v5 = CFSTR("Onboarding.Description_iPad");
  }
  else
  {
    v5 = CFSTR("Onboarding.Description_AppleVision");
  }
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CACOnboardingIntroViewController initWithTitle:detailText:icon:style:]([CACOnboardingIntroViewController alloc], "initWithTitle:detailText:icon:style:", v4, v6, 0, a3);

  return v7;
}

- (CACOnboardingIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 style:(unint64_t)a6
{
  CACOnboardingIntroViewController *v7;
  CACOnboardingIntroViewController *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v10;
  double v11;
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
  void *v27;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CACOnboardingIntroViewController;
  v7 = -[CACOnboardingIntroViewController initWithTitle:detailText:icon:](&v30, sel_initWithTitle_detailText_icon_, a3, a4, 0);
  v8 = v7;
  if (v7)
  {
    v7->_style = a6;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)_languageChanged_0, CFSTR("CACNotificationLanguageChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "userInterfaceIdiom") == 1)
      v11 = 60.0;
    else
      v11 = 40.0;

    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:scale:", 5, 2, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("appstore"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("paperplane.fill"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageWithSymbolConfiguration:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("doc.on.clipboard.fill"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageWithSymbolConfiguration:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("Onboarding.Navigating.Title"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("Onboarding.Navigating.Description"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACOnboardingIntroViewController addBulletedListItemWithTitle:description:image:](v8, "addBulletedListItemWithTitle:description:image:", v18, v19, v13);

    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("Onboarding.Interaction.Title"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("Onboarding.Interaction.Description"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACOnboardingIntroViewController addBulletedListItemWithTitle:description:image:](v8, "addBulletedListItemWithTitle:description:image:", v20, v21, v15);

    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("Onboarding.TextEditing.Title"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("Onboarding.TextEditing.Description"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACOnboardingIntroViewController addBulletedListItemWithTitle:description:image:](v8, "addBulletedListItemWithTitle:description:image:", v22, v23, v17);

    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommonStrings.Continue"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTitle:forState:", v25, 0);

    objc_msgSend(v24, "addTarget:action:forControlEvents:", v8, sel_enableVoiceControlAndMoveToCommandsOverview, 64);
    -[CACOnboardingIntroViewController setMainButton:](v8, "setMainButton:", v24);
    -[CACOnboardingIntroViewController buttonTray](v8, "buttonTray");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addButton:", v24);

    if (!-[CACOnboardingIntroViewController style](v8, "style"))
    {
      objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v27, "addTarget:action:forControlEvents:", v8, sel_presentLanguageSelection, 64);
      -[CACOnboardingIntroViewController setLinkButton:](v8, "setLinkButton:", v27);
      -[CACOnboardingIntroViewController configureLanguageButton](v8, "configureLanguageButton");
      -[CACOnboardingIntroViewController buttonTray](v8, "buttonTray");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addButton:", v27);

    }
    -[CACOnboardingIntroViewController configureDownloadCaption](v8, "configureDownloadCaption");

  }
  return v8;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("CACNotificationLanguageChanged"), 0);
  v4.receiver = self;
  v4.super_class = (Class)CACOnboardingIntroViewController;
  -[CACOnboardingIntroViewController dealloc](&v4, sel_dealloc);
}

- (void)configureDownloadCaption
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  id v11;

  if (!-[CACOnboardingIntroViewController style](self, "style"))
  {
    +[CACLanguageAssetManager downloadedLocaleIdentifiers](CACLanguageAssetManager, "downloadedLocaleIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bestLocaleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "containsObject:", v5);

    if (v6)
    {
      -[CACOnboardingIntroViewController buttonTray](self, "buttonTray");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCaptionText:", &stru_24F2ADCC8);
    }
    else
    {
      v7 = MGGetBoolAnswer();
      v8 = CFSTR("AssetDownload.InstallConfirmationDescription_WiFi");
      if (v7)
        v8 = CFSTR("AssetDownload.InstallConfirmationDescription_WLAN");
      v9 = v8;
      -[CACOnboardingIntroViewController buttonTray](self, "buttonTray");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setCaptionText:", v10);
    }

  }
}

- (void)configureLanguageButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestLocaleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACLocaleUtilities localizedDisplayStringForLocaleIdentifier:](CACLocaleUtilities, "localizedDisplayStringForLocaleIdentifier:", v4);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ "), v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("arrowtriangle.right.circle.fill"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACOnboardingIntroViewController linkButton](self, "linkButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithTintColor:renderingMode:", v8, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CACOnboardingIntroViewController linkButton](self, "linkButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v5, 0);

  -[CACOnboardingIntroViewController linkButton](self, "linkButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:forState:", v9, 0);

  -[CACOnboardingIntroViewController linkButton](self, "linkButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setImagePlacement:", 8);
  -[CACOnboardingIntroViewController linkButton](self, "linkButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConfiguration:", v13);

}

- (void)enableVoiceControlAndMoveToCommandsOverview
{
  void *v3;
  void *v4;
  void *v5;
  CACOnboardingCommandsDetailViewController *v6;
  void *v7;
  void *v8;
  CACOnboardingCommandsDetailViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("Onboarding.BrowseCommands.Subtitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACLocaleUtilities siriLocaleUIStringForKey:](CACLocaleUtilities, "siriLocaleUIStringForKey:", CFSTR("Onboarding.HeySiriTurnOnVoiceControl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), 0, v5);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v6 = [CACOnboardingCommandsDetailViewController alloc];
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("Onboarding.BrowseCommands.Title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACOnboardingCommandGroup allCommandGroups](CACOnboardingCommandGroup, "allCommandGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CACOnboardingCommandsDetailViewController initWithTitle:detailText:commandGroups:](v6, "initWithTitle:detailText:commandGroups:", v7, v13, v8);

  if (-[CACOnboardingIntroViewController style](self, "style"))
  {
    if (-[CACOnboardingIntroViewController style](self, "style") == 1)
      -[CACOnboardingCommandsDetailViewController setSkipAnalytics:](v9, "setSkipAnalytics:", 1);
  }
  else
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDidShowOnboarding:", 1);

    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCommandAndControlEnabled:", 1);

  }
  -[CACOnboardingIntroViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pushViewController:animated:", v9, 1);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CACOnboardingIntroViewController;
  -[OBBaseWelcomeController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_dismissWelcomeController);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

}

- (void)dismissWelcomeController
{
  -[CACOnboardingIntroViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_47);
}

- (void)presentLanguageSelection
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x24BEBD7A0]);
  +[CACLanguageSelectionViewController defaultControllerWithStyle:](CACLanguageSelectionViewController, "defaultControllerWithStyle:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "initWithRootViewController:", v4);

  -[CACOnboardingIntroViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)languageDidChange
{
  -[CACOnboardingIntroViewController configureLanguageButton](self, "configureLanguageButton");
  -[CACOnboardingIntroViewController configureDownloadCaption](self, "configureDownloadCaption");
}

- (BOOL)shouldInlineButtonTray
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (OBTrayButton)mainButton
{
  return self->_mainButton;
}

- (void)setMainButton:(id)a3
{
  objc_storeStrong((id *)&self->_mainButton, a3);
}

- (OBTrayButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
  objc_storeStrong((id *)&self->_linkButton, a3);
}

- (CACOnboardingCommandsTableViewController)onboardingTVC
{
  return self->_onboardingTVC;
}

- (void)setOnboardingTVC:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingTVC, a3);
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingTVC, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_mainButton, 0);
}

@end
