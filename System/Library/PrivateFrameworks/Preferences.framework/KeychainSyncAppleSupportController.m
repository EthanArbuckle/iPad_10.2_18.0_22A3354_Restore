@implementation KeychainSyncAppleSupportController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KeychainSyncAppleSupportController;
  -[PSListController viewDidLoad](&v6, sel_viewDidLoad);
  PS_LocalizedStringForKeychainSync(CFSTR("CONTACTING_APPLE_SUPPORT_BUDDY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncViewController setTitle:](self, "setTitle:", v3);

  -[PSListController table](self, "table");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (id)specifiers
{
  NSArray *specifiers;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  specifiers = self->super.super._specifiers;
  if (!specifiers)
  {
    v8.receiver = self;
    v8.super_class = (Class)KeychainSyncAppleSupportController;
    v4 = -[PSKeychainSyncViewController specifiers](&v8, sel_specifiers);
    -[PSKeychainSyncViewController groupSpecifier](self, "groupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PS_LocalizedStringForKeychainSync(CFSTR("APPLE_SUPPORT_VERIFICATION_DETAILS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProperty:forKey:", v6, CFSTR("footerText"));

    specifiers = self->super.super._specifiers;
  }
  return specifiers;
}

@end
