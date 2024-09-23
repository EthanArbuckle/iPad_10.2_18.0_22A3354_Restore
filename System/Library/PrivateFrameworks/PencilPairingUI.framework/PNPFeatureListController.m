@implementation PNPFeatureListController

+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  PNPFeatureListController *v11;
  void *v12;
  void *v13;
  PNPFeatureListController *v14;
  void *v15;
  uint64_t v16;
  PNPFeatureListController *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v8 = a6;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("WELCOME_TITLE"), &stru_24F4E5CD0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [PNPFeatureListController alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("WELCOME_DETAIL_TEXT"), &stru_24F4E5CD0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PNPFeatureListController initWithTitle:detailText:icon:](v11, "initWithTitle:detailText:icon:", v10, v13, 0);

  if (a5 == 4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("WELCOME_TITLE_PRO"), &stru_24F4E5CD0, CFSTR("PencilPairingSqueeze-B532"));
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = [PNPFeatureListController alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("WELCOME_DETAIL_TEXT_PRO"), &stru_24F4E5CD0, CFSTR("PencilPairingSqueeze-B532"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PNPFeatureListController initWithTitle:detailText:icon:](v17, "initWithTitle:detailText:icon:", v16, v19, 0);

    v10 = (void *)v16;
    v14 = (PNPFeatureListController *)v20;
  }
  -[PNPWelcomeController setControllerType:buttonType:deviceType:delegate:](v14, "setControllerType:buttonType:deviceType:delegate:", a3, a4, a5, v8);

  return v14;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PNPFeatureListController;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  -[PNPFeatureListController configureForType:](self, "configureForType:", -[PNPWelcomeController deviceType](self, "deviceType"));
}

- (void)configureForType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      -[PNPFeatureListController configureForGeneric](self, "configureForGeneric");
      break;
    case 1:
      -[PNPFeatureListController configureFor222](self, "configureFor222");
      break;
    case 2:
      -[PNPFeatureListController configureFor332](self, "configureFor332");
      break;
    case 3:
      -[PNPFeatureListController configureFor482](self, "configureFor482");
      break;
    case 4:
      -[PNPFeatureListController configureFor532](self, "configureFor532");
      break;
    default:
      return;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PNPFeatureListController;
  -[PNPFeatureListController viewWillAppear:](&v5, sel_viewWillAppear_, 1);
  -[PNPFeatureListController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PNPFeatureListController;
  -[PNPFeatureListController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[PNPFeatureListController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)configureFor532
{
  -[PNPFeatureListController addSqueezeBullet](self, "addSqueezeBullet");
  -[PNPFeatureListController addDoubleTapBulletForPro](self, "addDoubleTapBulletForPro");
  -[PNPFeatureListController addScribbleBulletIfNecessary](self, "addScribbleBulletIfNecessary");
  -[PNPFeatureListController addScreenshotsBulletForPro](self, "addScreenshotsBulletForPro");
}

- (void)addHoverBullet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PNPFeatureListController setBulletCount:](self, "setBulletCount:", -[PNPFeatureListController bulletCount](self, "bulletCount") + 1);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PENCIL_HOVER_PREVIEW_TITLE"), &stru_24F4E5CD0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PENCIL_HOVER_PREVIEW_DESCRIPTION"), &stru_24F4E5CD0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWelcomeController bundleImageNamed:](self, "bundleImageNamed:", CFSTR("Preview"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPFeatureListController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v3, v5, v6);

}

- (void)addQuickNoteBullet
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  -[PNPFeatureListController setBulletCount:](self, "setBulletCount:", -[PNPFeatureListController bulletCount](self, "bulletCount") + 1);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("WELCOME_NOTES_TITLE"), &stru_24F4E5CD0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PNPWelcomeController isRTL](self, "isRTL");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("WELCOME_NOTES_DESCRIPTION_RTOL");
  else
    v7 = CFSTR("WELCOME_NOTES_DESCRIPTION");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24F4E5CD0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWelcomeController bundleImageNamed:](self, "bundleImageNamed:", CFSTR("Notes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPFeatureListController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v3, v8, v9);

}

- (BOOL)addScribbleBulletIfNecessary
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDE33F0], "sharedSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportedKeyboardLocaleExists");

  if (v4)
  {
    -[PNPFeatureListController setBulletCount:](self, "setBulletCount:", -[PNPFeatureListController bulletCount](self, "bulletCount") + 1);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WELCOME_SCRIBBLE_TITLE"), &stru_24F4E5CD0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WELCOME_SCRIBBLE_DESCRIPTION"), &stru_24F4E5CD0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPWelcomeController bundleImageNamed:](self, "bundleImageNamed:", CFSTR("welcome_scribble"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPFeatureListController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v6, v8, v9);

  }
  return v4;
}

- (void)addDoubleTapBullet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PNPFeatureListController setBulletCount:](self, "setBulletCount:", -[PNPFeatureListController bulletCount](self, "bulletCount") + 1);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WELCOME_SWITCH_TOOLS_TITLE"), &stru_24F4E5CD0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WELCOME_SWITCH_TOOLS_DESCRIPTION"), &stru_24F4E5CD0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWelcomeController bundleImageNamed:](self, "bundleImageNamed:", CFSTR("welcome_double_tap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPFeatureListController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v3, v5, v6);

}

- (void)addScreenshotsBullet
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  -[PNPFeatureListController setBulletCount:](self, "setBulletCount:", -[PNPFeatureListController bulletCount](self, "bulletCount") + 1);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("WELCOME_SCREENSHOT_TITLE"), &stru_24F4E5CD0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PNPWelcomeController isRTL](self, "isRTL");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("WELCOME_SCREENSHOT_DESCRIPTION_RTOL");
  else
    v7 = CFSTR("WELCOME_SCREENSHOT_DESCRIPTION");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24F4E5CD0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWelcomeController bundleImageNamed:](self, "bundleImageNamed:", CFSTR("welcome_swipe"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPFeatureListController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v3, v8, v9);

}

- (void)addSqueezeBullet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PNPFeatureListController setBulletCount:](self, "setBulletCount:", -[PNPFeatureListController bulletCount](self, "bulletCount") + 1);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WELCOME_SQUEEZE_TITLE"), &stru_24F4E5CD0, CFSTR("PencilPairingSqueeze-B532"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WELCOME_SQUEEZE_DESCRIPTION"), &stru_24F4E5CD0, CFSTR("PencilPairingSqueeze-B532"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWelcomeController bundleImageNamed:](self, "bundleImageNamed:", CFSTR("welcome_squeeze"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPFeatureListController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v3, v5, v6);

}

- (void)addDoubleTapBulletForPro
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PNPFeatureListController setBulletCount:](self, "setBulletCount:", -[PNPFeatureListController bulletCount](self, "bulletCount") + 1);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WELCOME_SWITCH_TOOLS_TITLE"), &stru_24F4E5CD0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WELCOME_SWITCH_TOOLS_DESCRIPTION_PRO"), &stru_24F4E5CD0, CFSTR("PencilPairingSqueeze-B532"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWelcomeController bundleImageNamed:](self, "bundleImageNamed:", CFSTR("welcome_double_tap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPFeatureListController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v3, v5, v6);

}

- (void)addScreenshotsBulletForPro
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  -[PNPFeatureListController setBulletCount:](self, "setBulletCount:", -[PNPFeatureListController bulletCount](self, "bulletCount") + 1);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("WELCOME_SCREENSHOT_TITLE"), &stru_24F4E5CD0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PNPWelcomeController isRTL](self, "isRTL");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("WELCOME_SCREENSHOT_DESCRIPTION_RTOL_PRO");
  else
    v7 = CFSTR("WELCOME_SCREENSHOT_DESCRIPTION_PRO");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24F4E5CD0, CFSTR("PencilPairingSqueeze-B532"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWelcomeController bundleImageNamed:](self, "bundleImageNamed:", CFSTR("welcome_swipe"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPFeatureListController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v3, v8, v9);

}

- (void)tempDoTheNormalThing
{
  int v3;
  char v4;

  v3 = objc_msgSend(MEMORY[0x24BDE33A0], "isHoverActive");
  v4 = v3;
  if (v3)
    -[PNPFeatureListController addHoverBullet](self, "addHoverBullet");
  -[PNPFeatureListController addQuickNoteBullet](self, "addQuickNoteBullet");
  -[PNPFeatureListController addScribbleBulletIfNecessary](self, "addScribbleBulletIfNecessary");
  if (-[PNPWelcomeController deviceType](self, "deviceType") == 2)
    -[PNPFeatureListController addDoubleTapBullet](self, "addDoubleTapBullet");
  if ((v4 & 1) == 0)
    -[PNPFeatureListController addScreenshotsBullet](self, "addScreenshotsBullet");
}

- (int64_t)bulletCount
{
  return self->_bulletCount;
}

- (void)setBulletCount:(int64_t)a3
{
  self->_bulletCount = a3;
}

@end
