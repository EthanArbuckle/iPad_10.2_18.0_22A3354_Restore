@implementation SUSettingsUserDefaults

+ (id)allDefaults
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&allDefaults_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)allDefaults_defaultsDeclarations;
}

void __37__SUSettingsUserDefaults_allDefaults__block_invoke()
{
  id v0;
  void *v1;
  SUSettingsUserDefaultsEntry *v2;
  SUSettingsUserDefaultsEntry *v3;
  SUSettingsUserDefaultsEntry *v4;
  SUSettingsUserDefaultsEntry *v5;
  SUSettingsUserDefaultsEntry *v6;
  SUSettingsUserDefaultsEntry *v7;
  SUSettingsUserDefaultsEntry *v8;
  SUSettingsUserDefaultsEntry *v9;
  SUSettingsUserDefaultsEntry *v10;
  _QWORD v11[9];
  _QWORD v12[10];

  v12[9] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("SUBypassSystemRootWarning");
  v10 = -[SUSettingsUserDefaultsEntry initWithType:key:description:]([SUSettingsUserDefaultsEntry alloc], "initWithType:key:description:");
  v12[0] = v10;
  v11[1] = CFSTR("SUKeepPreviousMockingKitSesson");
  v9 = -[SUSettingsUserDefaultsEntry initWithType:key:description:]([SUSettingsUserDefaultsEntry alloc], "initWithType:key:description:", 0, CFSTR("SUKeepPreviousMockingKitSesson"), CFSTR("Whether Mocking Kit test plans sessions should be kept alive after the end of the test execution."));
  v12[1] = v9;
  v11[2] = CFSTR("SUSkipMockingKitPIDValidation");
  v8 = -[SUSettingsUserDefaultsEntry initWithType:key:description:]([SUSettingsUserDefaultsEntry alloc], "initWithType:key:description:", 0, CFSTR("SUSkipMockingKitPIDValidation"), CFSTR("Whether Mocking Kit test plans sessions should be kept bypass the Process ID validation."));
  v12[2] = v8;
  v11[3] = CFSTR("SUShowComingSoonTip");
  v7 = -[SUSettingsUserDefaultsEntry initWithType:key:description:]([SUSettingsUserDefaultsEntry alloc], "initWithType:key:description:", 0, CFSTR("SUShowComingSoonTip"), CFSTR("Indicates whether the \"Coming Soon\" tip should be forcely shown regardless of its "));
  v12[3] = v7;
  v11[4] = CFSTR("SURecoveryOSProfileStatus");
  v6 = -[SUSettingsUserDefaultsEntry initWithType:key:description:]([SUSettingsUserDefaultsEntry alloc], "initWithType:key:description:", 0, CFSTR("SURecoveryOSProfileStatus"), CFSTR("Indicates whether RecoveryOS profile is installed so the user will be able to get the status Constellation display criterias"));
  v12[4] = v6;
  v11[5] = CFSTR("SUHideComingSoonTip");
  v5 = -[SUSettingsUserDefaultsEntry initWithType:key:description:]([SUSettingsUserDefaultsEntry alloc], "initWithType:key:description:", 0, CFSTR("SUHideComingSoonTip"), CFSTR("Indicates whether the \"Coming Soon\" tip should be forcely hidden regardless of its Constellation display criterias"));
  v12[5] = v5;
  v11[6] = CFSTR("SUComingSoonTipTitle");
  v4 = -[SUSettingsUserDefaultsEntry initWithType:key:description:]([SUSettingsUserDefaultsEntry alloc], "initWithType:key:description:");
  v12[6] = v4;
  v11[7] = CFSTR("SUComingSoonTipMessage");
  v3 = -[SUSettingsUserDefaultsEntry initWithType:key:description:]([SUSettingsUserDefaultsEntry alloc], "initWithType:key:description:", 2, CFSTR("SUComingSoonTipMessage"), CFSTR("The message body for the \"Coming Soon\" tip. This field will override the value returned by Constellation."));
  v12[7] = v3;
  v11[8] = CFSTR("SUComingSoonTipLearnMoreLink");
  v2 = -[SUSettingsUserDefaultsEntry initWithType:key:description:]([SUSettingsUserDefaultsEntry alloc], "initWithType:key:description:", 2, CFSTR("SUComingSoonTipLearnMoreLink"), CFSTR("The action URL that will be opened by the \"Learn More\" link, referenced in the \"Coming Soon\" tip. This field will override the value returned by Constellation."));
  v12[8] = v2;
  v0 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 9);
  v1 = (void *)allDefaults_defaultsDeclarations;
  allDefaults_defaultsDeclarations = (uint64_t)v0;

}

- (BOOL)shouldBypassSystemRootWarning
{
  id v3;
  BOOL v4;
  id v5[2];
  SUSettingsUserDefaults *v6;

  v6 = self;
  v5[1] = (id)a2;
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v5[0] = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SUBypassSystemRootWarning"));

  v4 = -[SUSettingsUserDefaults BOOLForEntry:](v6, "BOOLForEntry:", v5[0]);
  objc_storeStrong(v5, 0);
  return v4;
}

- (void)shouldBypassSystemRootWarning:(BOOL)a3
{
  id v3;
  id v4;
  BOOL v5;
  SEL v6;
  SUSettingsUserDefaults *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v4 = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SUBypassSystemRootWarning"));

  -[SUSettingsUserDefaults setBool:forEntry:](v7, "setBool:forEntry:", v5, v4);
  objc_storeStrong(&v4, 0);
}

- (BOOL)shouldKeepPreviousMockingKitSession
{
  id v3;
  BOOL v4;
  id v5[2];
  SUSettingsUserDefaults *v6;

  v6 = self;
  v5[1] = (id)a2;
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v5[0] = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SUKeepPreviousMockingKitSesson"));

  v4 = -[SUSettingsUserDefaults BOOLForEntry:](v6, "BOOLForEntry:", v5[0]);
  objc_storeStrong(v5, 0);
  return v4;
}

- (void)shouldKeepPreviousMockingKitSession:(BOOL)a3
{
  id v3;
  id v4;
  BOOL v5;
  SEL v6;
  SUSettingsUserDefaults *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v4 = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SUKeepPreviousMockingKitSesson"));

  -[SUSettingsUserDefaults setBool:forEntry:](v7, "setBool:forEntry:", v5, v4);
  objc_storeStrong(&v4, 0);
}

- (BOOL)shouldSkipMockingKitPIDValidation
{
  id v3;
  BOOL v4;
  id v5[2];
  SUSettingsUserDefaults *v6;

  v6 = self;
  v5[1] = (id)a2;
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v5[0] = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SUSkipMockingKitPIDValidation"));

  v4 = -[SUSettingsUserDefaults BOOLForEntry:](v6, "BOOLForEntry:", v5[0]);
  objc_storeStrong(v5, 0);
  return v4;
}

- (void)shouldSkipMockingKitPIDValidation:(BOOL)a3
{
  id v3;
  id v4;
  BOOL v5;
  SEL v6;
  SUSettingsUserDefaults *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v4 = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SUSkipMockingKitPIDValidation"));

  -[SUSettingsUserDefaults setBool:forEntry:](v7, "setBool:forEntry:", v5, v4);
  objc_storeStrong(&v4, 0);
}

- (BOOL)isNeRDProfileStatusInstalled
{
  id v3;
  BOOL v4;
  id v5[2];
  SUSettingsUserDefaults *v6;

  v6 = self;
  v5[1] = (id)a2;
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v5[0] = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SURecoveryOSProfileStatus"));

  v4 = -[SUSettingsUserDefaults BOOLForEntry:](v6, "BOOLForEntry:", v5[0]);
  objc_storeStrong(v5, 0);
  return v4;
}

- (void)isNeRDProfileStatusInstalled:(BOOL)a3
{
  id v3;
  id v4;
  BOOL v5;
  SEL v6;
  SUSettingsUserDefaults *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v4 = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SURecoveryOSProfileStatus"));

  -[SUSettingsUserDefaults setBool:forEntry:](v7, "setBool:forEntry:", v5, v4);
  objc_storeStrong(&v4, 0);
}

- (BOOL)shouldShowComingSoonTip
{
  id v3;
  BOOL v4;
  id v5[2];
  SUSettingsUserDefaults *v6;

  v6 = self;
  v5[1] = (id)a2;
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v5[0] = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SUShowComingSoonTip"));

  v4 = -[SUSettingsUserDefaults BOOLForEntry:](v6, "BOOLForEntry:", v5[0]);
  objc_storeStrong(v5, 0);
  return v4;
}

- (void)shouldShowComingSoonTip:(BOOL)a3
{
  id v3;
  id v4;
  BOOL v5;
  SEL v6;
  SUSettingsUserDefaults *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v4 = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SUShowComingSoonTip"));

  -[SUSettingsUserDefaults setBool:forEntry:](v7, "setBool:forEntry:", v5, v4);
  objc_storeStrong(&v4, 0);
}

- (BOOL)shouldHideComingSoonTip
{
  id v3;
  BOOL v4;
  id v5[2];
  SUSettingsUserDefaults *v6;

  v6 = self;
  v5[1] = (id)a2;
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v5[0] = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SUHideComingSoonTip"));

  v4 = -[SUSettingsUserDefaults BOOLForEntry:](v6, "BOOLForEntry:", v5[0]);
  objc_storeStrong(v5, 0);
  return v4;
}

- (void)shouldHideComingSoonTip:(BOOL)a3
{
  id v3;
  id v4;
  BOOL v5;
  SEL v6;
  SUSettingsUserDefaults *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v4 = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SUHideComingSoonTip"));

  -[SUSettingsUserDefaults setBool:forEntry:](v7, "setBool:forEntry:", v5, v4);
  objc_storeStrong(&v4, 0);
}

- (NSString)comingSoonTipTitle
{
  id v3;
  id v4;
  id v5[2];
  SUSettingsUserDefaults *v6;

  v6 = self;
  v5[1] = (id)a2;
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v5[0] = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SUComingSoonTipTitle"));

  v4 = -[SUSettingsUserDefaults stringForEntry:](v6, "stringForEntry:", v5[0]);
  objc_storeStrong(v5, 0);
  return (NSString *)v4;
}

- (void)comingSoonTipTitle:(id)a3
{
  id v3;
  id v4;
  id location[2];
  SUSettingsUserDefaults *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v4 = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SUComingSoonTipTitle"));

  -[SUSettingsUserDefaults setString:forEntry:](v6, "setString:forEntry:", location[0], v4);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (NSString)comingSoonTipMessage
{
  id v3;
  id v4;
  id v5[2];
  SUSettingsUserDefaults *v6;

  v6 = self;
  v5[1] = (id)a2;
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v5[0] = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SUComingSoonTipMessage"));

  v4 = -[SUSettingsUserDefaults stringForEntry:](v6, "stringForEntry:", v5[0]);
  objc_storeStrong(v5, 0);
  return (NSString *)v4;
}

- (void)comingSoonTipMessage:(id)a3
{
  id v3;
  id v4;
  id location[2];
  SUSettingsUserDefaults *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v4 = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SUComingSoonTipMessage"));

  -[SUSettingsUserDefaults setString:forEntry:](v6, "setString:forEntry:", location[0], v4);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (NSString)comingSoonTipLearnMoreLink
{
  id v3;
  id v4;
  id v5[2];
  SUSettingsUserDefaults *v6;

  v6 = self;
  v5[1] = (id)a2;
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v5[0] = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SUComingSoonTipLearnMoreLink"));

  v4 = -[SUSettingsUserDefaults stringForEntry:](v6, "stringForEntry:", v5[0]);
  objc_storeStrong(v5, 0);
  return (NSString *)v4;
}

- (void)comingSoonTipLearnMoreLink:(id)a3
{
  id v3;
  id v4;
  id location[2];
  SUSettingsUserDefaults *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v4 = (id)objc_msgSend(v3, "objectForKey:", CFSTR("SUComingSoonTipLearnMoreLink"));

  -[SUSettingsUserDefaults setString:forEntry:](v6, "setString:forEntry:", location[0], v4);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

+ (id)sharedDefaults
{
  uint64_t obj;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  SEL v9;
  id v10;
  id location;
  dispatch_once_t *v12;

  v10 = a1;
  v9 = a2;
  obj = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __40__SUSettingsUserDefaults_sharedDefaults__block_invoke;
  v7 = &__block_descriptor_40_e5_v8__0l;
  v8 = a1;
  v12 = (dispatch_once_t *)&sharedDefaults_onceToken;
  location = 0;
  objc_storeStrong(&location, &obj);
  if (*v12 != -1)
    dispatch_once(v12, location);
  objc_storeStrong(&location, 0);
  return (id)sharedDefaults_sharedInstance;
}

void __40__SUSettingsUserDefaults_sharedDefaults__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedDefaults_sharedInstance;
  sharedDefaults_sharedInstance = (uint64_t)v1;

}

- (SUSettingsUserDefaults)init
{
  uint64_t v2;
  NSUserDefaults *userDefaults;
  SUSettingsUserDefaults *v5;
  SUSettingsUserDefaults *v6;
  objc_super v7;
  SEL v8;
  SUSettingsUserDefaults *v9;

  v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)SUSettingsUserDefaults;
  v6 = -[SUSettingsUserDefaults init](&v7, sel_init);
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.softwareupdatesettings"));
    userDefaults = v9->_userDefaults;
    v9->_userDefaults = (NSUserDefaults *)v2;

  }
  v5 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (BOOL)containsKey:(id)a3
{
  id v3;
  id v5;
  BOOL v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v3 = (id)objc_msgSend(v5, "objectForKey:", location[0]);
  v6 = v3 != 0;

  objc_storeStrong(location, 0);
  return v6;
}

- (BOOL)defaultsContainsKey:(id)a3
{
  id v3;
  NSUserDefaults *userDefaults;
  id v6;
  id v7;
  id v8;
  id location[2];
  SUSettingsUserDefaults *v10;
  BOOL v11;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = (id)objc_msgSend((id)objc_opt_class(), "allDefaults");
  v8 = (id)objc_msgSend(v7, "objectForKey:", location[0]);

  if (v8)
  {
    userDefaults = v10->_userDefaults;
    v6 = (id)objc_msgSend(v8, "key");
    v3 = -[NSUserDefaults objectForKey:](userDefaults, "objectForKey:");
    v11 = v3 != 0;

  }
  else
  {
    v11 = 0;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (void)reset
{
  -[NSUserDefaults removePersistentDomainForName:](self->_userDefaults, "removePersistentDomainForName:", CFSTR("com.apple.softwareupdatesettings"), a2, self);
}

- (BOOL)BOOLForEntry:(id)a3
{
  int v4;
  SUSettingsUserDefaults *v5;
  id v6;
  id v7;
  id location[2];
  SUSettingsUserDefaults *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = v9;
  v6 = (id)objc_msgSend(location[0], "key");
  v7 = -[SUSettingsUserDefaults objectForKey:ofClass:](v5, "objectForKey:ofClass:", v6, objc_opt_class());

  if (v7)
    v4 = objc_msgSend(v7, "BOOLValue") & 1;
  else
    v4 = 0;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v4 != 0;
}

- (id)numberForEntry:(id)a3
{
  SUSettingsUserDefaults *v4;
  id v5;
  id v6;
  id location[2];
  SUSettingsUserDefaults *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = v8;
  v5 = (id)objc_msgSend(location[0], "key");
  v6 = -[SUSettingsUserDefaults objectForKey:ofClass:](v4, "objectForKey:ofClass:", v5, objc_opt_class());

  objc_storeStrong(location, 0);
  return v6;
}

- (id)stringForEntry:(id)a3
{
  SUSettingsUserDefaults *v4;
  id v5;
  id v6;
  id location[2];
  SUSettingsUserDefaults *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = v8;
  v5 = (id)objc_msgSend(location[0], "key");
  v6 = -[SUSettingsUserDefaults objectForKey:ofClass:](v4, "objectForKey:ofClass:", v5, objc_opt_class());

  objc_storeStrong(location, 0);
  return v6;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  id v5;
  id location[2];
  SUSettingsUserDefaults *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)-[NSUserDefaults valueForKey:](v7->_userDefaults, "valueForKey:", location[0]);
  objc_storeStrong(location, 0);
  return v5;
}

- (void)setString:(id)a3 forEntry:(id)a4
{
  id v5;
  SUSettingsUserDefaults *v6;
  id v7;
  id v8;
  id location[2];
  SUSettingsUserDefaults *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v6 = v10;
  v5 = location[0];
  v7 = (id)objc_msgSend(v8, "key");
  -[SUSettingsUserDefaults setObject:forKey:](v6, "setObject:forKey:", v5);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)setBool:(BOOL)a3 forEntry:(id)a4
{
  SUSettingsUserDefaults *v4;
  id v5;
  id v6;
  id location;
  BOOL v8;
  SEL v9;
  SUSettingsUserDefaults *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = v10;
  v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v5 = (id)objc_msgSend(location, "key");
  -[SUSettingsUserDefaults setObject:forKey:](v4, "setObject:forKey:", v6);

  objc_storeStrong(&location, 0);
}

- (void)setNumber:(id)a3 forEntry:(id)a4
{
  id v5;
  SUSettingsUserDefaults *v6;
  id v7;
  id v8;
  id location[2];
  SUSettingsUserDefaults *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v6 = v10;
  v5 = location[0];
  v7 = (id)objc_msgSend(v8, "key");
  -[SUSettingsUserDefaults setObject:forKey:](v6, "setObject:forKey:", v5);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v5;
  id location[2];
  SUSettingsUserDefaults *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[NSUserDefaults setObject:forKey:](v7->_userDefaults, "setObject:forKey:", location[0], v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)removeEntry:(id)a3
{
  NSUserDefaults *userDefaults;
  id v4;
  id location[2];
  SUSettingsUserDefaults *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  userDefaults = v6->_userDefaults;
  v4 = (id)objc_msgSend(location[0], "key");
  -[NSUserDefaults removeObjectForKey:](userDefaults, "removeObjectForKey:");

  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
