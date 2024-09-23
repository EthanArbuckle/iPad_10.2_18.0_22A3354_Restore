@implementation SUNetworkLockoutViewController

- (SUNetworkLockoutViewController)init
{
  objc_super v4;

  -[SUNetworkLockoutViewController setSection:](self, "setSection:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SUNetworkLockoutViewController;
  return -[SULockoutViewController init](&v4, sel_init);
}

- (void)setLocalizationBundle:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUNetworkLockoutViewController;
  -[SULockoutViewController setLocalizationBundle:](&v4, sel_setLocalizationBundle_, a3);
  -[SUNetworkLockoutViewController _reloadUserInterface](self, "_reloadUserInterface");
}

- (void)setSection:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUNetworkLockoutViewController;
  -[SUViewController setSection:](&v4, sel_setSection_, a3);
  -[SUNetworkLockoutViewController _reloadUserInterface](self, "_reloadUserInterface");
}

- (void)loadView
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SUNetworkLockoutViewController;
  -[SULockoutViewController loadView](&v2, sel_loadView);
}

- (void)_reloadUserInterface
{
  NSBundle *v3;
  NSBundle *v4;
  id v5;
  uint64_t v6;
  NSBundle *v7;
  const __CFString *v8;
  int v9;
  NSBundle *v10;
  const __CFString *v11;
  int v12;

  v3 = -[SULockoutViewController localizationBundle](self, "localizationBundle");
  if (v3)
  {
    v4 = v3;
    v5 = -[UIViewController section](self, "section");
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
    v7 = -[SULockoutViewController localizationBundle](self, "localizationBundle");
    if (v6 == 1)
      v8 = CFSTR("NO_STORE_MAIN_K48");
    else
      v8 = CFSTR("NO_STORE_MAIN");
    -[SULockoutViewController setMessageTitle:](self, "setMessageTitle:", -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", v8, &stru_24DE83F60, 0));
    -[SULockoutViewController setImage:](self, "setImage:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("StoreOfflineGraphic"), v4));
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice"), "supportsDeviceCapability:", 0) & 1) != 0)
    {
      if (v5 && objc_msgSend(v5, "minimumNetworkType") > 999 || (MGGetBoolAnswer() & 1) == 0)
      {
        v12 = MGGetBoolAnswer();
        v10 = -[SULockoutViewController localizationBundle](self, "localizationBundle");
        if (v12)
          v11 = CFSTR("NO_STORE_SUB_WLAN");
        else
          v11 = CFSTR("NO_STORE_SUB");
      }
      else
      {
        v9 = MGGetBoolAnswer();
        v10 = -[SULockoutViewController localizationBundle](self, "localizationBundle");
        if (v9)
          v11 = CFSTR("NO_STORE_SUB_CELLULAR_WLAN");
        else
          v11 = CFSTR("NO_STORE_SUB_CELLULAR");
      }
    }
    else
    {
      v10 = -[SULockoutViewController localizationBundle](self, "localizationBundle");
      v11 = CFSTR("NO_STORE_SUB_NO_WIFI");
    }
    -[SULockoutViewController setMessageBody:](self, "setMessageBody:", -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", v11, &stru_24DE83F60, 0));
  }
}

@end
