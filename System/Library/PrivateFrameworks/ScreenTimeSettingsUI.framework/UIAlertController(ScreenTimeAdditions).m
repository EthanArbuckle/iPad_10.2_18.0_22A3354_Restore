@implementation UIAlertController(ScreenTimeAdditions)

+ (id)alertControllerForFeatureNotAvailable
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("NotAvailableInDemoMode"), &stru_24DB8A1D0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "alertControllerWithTitle:message:preferredStyle:", v2, 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonOK"), &stru_24DB8A1D0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v6);

  return v3;
}

@end
