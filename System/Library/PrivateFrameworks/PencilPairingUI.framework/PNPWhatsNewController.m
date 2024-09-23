@implementation PNPWhatsNewController

+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6
{
  id v9;
  PNPWhatsNewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PNPWhatsNewController *v15;

  v9 = a6;
  v10 = [PNPWhatsNewController alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_TITLE"), &stru_24F4E5CD0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("WELCOME_DETAIL_TEXT"), &stru_24F4E5CD0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PNPWhatsNewController initWithTitle:detailText:icon:](v10, "initWithTitle:detailText:icon:", v12, v14, 0);

  -[PNPWelcomeController setControllerType:buttonType:deviceType:delegate:](v15, "setControllerType:buttonType:deviceType:delegate:", a3, a4, a5, v9);
  return v15;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PNPWhatsNewController;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  -[PNPWhatsNewController configureForType:](self, "configureForType:", -[PNPWelcomeController deviceType](self, "deviceType"));
}

- (void)configureForType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      -[PNPWhatsNewController configureForGeneric](self, "configureForGeneric");
      break;
    case 1:
      -[PNPWhatsNewController configureFor222](self, "configureFor222");
      break;
    case 2:
      -[PNPWhatsNewController configureFor332](self, "configureFor332");
      break;
    case 3:
      -[PNPWhatsNewController configureFor482](self, "configureFor482");
      break;
    case 4:
      -[PNPWhatsNewController configureFor532](self, "configureFor532");
      break;
    default:
      return;
  }
}

- (void)addHoverBullet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PNPWhatsNewController setBulletCount:](self, "setBulletCount:", -[PNPWhatsNewController bulletCount](self, "bulletCount") + 1);
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
  -[PNPWhatsNewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v3, v5, v6);

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

  -[PNPWhatsNewController setBulletCount:](self, "setBulletCount:", -[PNPWhatsNewController bulletCount](self, "bulletCount") + 1);
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
  -[PNPWhatsNewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v3, v8, v9);

}

- (void)addSmarterNotesBullet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PNPWhatsNewController setBulletCount:](self, "setBulletCount:", -[PNPWhatsNewController bulletCount](self, "bulletCount") + 1);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WELCOME_SMARTER_NOTES_TITLE"), &stru_24F4E5CD0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WELCOME_SMARTER_NOTES_DESCRIPTION"), &stru_24F4E5CD0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWelcomeController bundleImageNamed:](self, "bundleImageNamed:", CFSTR("Notes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWhatsNewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v3, v5, v6);

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
    -[PNPWhatsNewController setBulletCount:](self, "setBulletCount:", -[PNPWhatsNewController bulletCount](self, "bulletCount") + 1);
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
    -[PNPWhatsNewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v6, v8, v9);

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

  -[PNPWhatsNewController setBulletCount:](self, "setBulletCount:", -[PNPWhatsNewController bulletCount](self, "bulletCount") + 1);
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
  -[PNPWhatsNewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v3, v5, v6);

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

  -[PNPWhatsNewController setBulletCount:](self, "setBulletCount:", -[PNPWhatsNewController bulletCount](self, "bulletCount") + 1);
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
  -[PNPWhatsNewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v3, v8, v9);

}

- (void)addSqueezeBullet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PNPWhatsNewController setBulletCount:](self, "setBulletCount:", -[PNPWhatsNewController bulletCount](self, "bulletCount") + 1);
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
  -[PNPWhatsNewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v3, v5, v6);

}

- (void)addDoubleTapBulletForPro
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PNPWhatsNewController setBulletCount:](self, "setBulletCount:", -[PNPWhatsNewController bulletCount](self, "bulletCount") + 1);
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
  -[PNPWhatsNewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v3, v5, v6);

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

  -[PNPWhatsNewController setBulletCount:](self, "setBulletCount:", -[PNPWhatsNewController bulletCount](self, "bulletCount") + 1);
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
  -[PNPWhatsNewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v3, v8, v9);

}

- (void)configureFor532
{
  -[PNPWhatsNewController addScribbleBulletIfNecessary](self, "addScribbleBulletIfNecessary");
  -[PNPWhatsNewController addSqueezeBullet](self, "addSqueezeBullet");
  -[PNPWhatsNewController addDoubleTapBulletForPro](self, "addDoubleTapBulletForPro");
  -[PNPWhatsNewController addScreenshotsBulletForPro](self, "addScreenshotsBulletForPro");
}

- (void)tempDoTheNormalThing
{
  if (objc_msgSend(MEMORY[0x24BDE33A0], "isHoverActive"))
    -[PNPWhatsNewController addHoverBullet](self, "addHoverBullet");
  -[PNPWhatsNewController addScribbleBulletIfNecessary](self, "addScribbleBulletIfNecessary");
  -[PNPWhatsNewController addSmarterNotesBullet](self, "addSmarterNotesBullet");
  if (-[PNPWelcomeController deviceType](self, "deviceType") == 2
    || -[PNPWelcomeController deviceType](self, "deviceType") == 4)
  {
    -[PNPWhatsNewController addDoubleTapBullet](self, "addDoubleTapBullet");
  }
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
