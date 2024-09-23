@implementation SUScriptSoftwareApplication

- (SUScriptSoftwareApplication)initWithApplication:(id)a3
{
  SUScriptSoftwareApplication *v4;

  v4 = -[SUScriptObject init](self, "init");
  if (v4)
    v4->_application = (ISSoftwareApplication *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptSoftwareApplication;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (void)checkInAppPurchaseQueueWithAccountID:(id)a3 environment:(id)a4
{
  id v7;
  char isKindOfClass;
  id v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = 0;
    if (a4)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        v7 = a4;
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_12;
      }
    }
  }
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = objc_alloc_init(MEMORY[0x24BEB1FF8]);
    objc_msgSend(v9, "setBagType:", objc_msgSend(v7, "isEqualToString:", -[SUScriptSoftwareApplication environmentSandbox](self, "environmentSandbox")));
    objc_msgSend(v9, "setUserIdentifier:", a3);
    -[SUScriptSoftwareApplication bundleID](self, "bundleID");
    SSCheckInAppPurchaseQueue();

    return;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (int64_t)launchWithURL:(id)a3 options:(id)a4 suspended:(id)a5
{
  OpaqueJSContext *v9;
  void *v10;
  unsigned int v11;
  void *v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a5 = 0;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_21;
  }
  if (a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = (void *)MEMORY[0x24BDFA950];
      goto LABEL_23;
    }
  }
  if (a5 && (objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_21:
    v13 = (void *)MEMORY[0x24BDFA950];
LABEL_23:
    objc_msgSend(v13, "throwException:", CFSTR("Invalid argument"));
    return 0;
  }
  v9 = -[SUScriptObject copyJavaScriptContext](self, "copyJavaScriptContext");
  v10 = (void *)objc_msgSend(a4, "copyArrayOrDictionaryWithContext:", v9);
  if (a3)
    a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3);
  -[ISSoftwareApplication bundleIdentifier](self->_application, "bundleIdentifier");
  objc_msgSend(a5, "BOOLValue");
  v11 = SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions();

  if (v9)
    JSGlobalContextRelease(v9);
  return v11;
}

- (NSNumber)adamID
{
  return (NSNumber *)-[ISSoftwareApplication itemIdentifier](self->_application, "itemIdentifier");
}

- (NSString)bundleID
{
  return (NSString *)-[ISSoftwareApplication bundleIdentifier](self->_application, "bundleIdentifier");
}

- (NSString)bundleShortVersionString
{
  return (NSString *)-[ISSoftwareApplication bundleShortVersionString](self->_application, "bundleShortVersionString");
}

- (NSString)bundleVersion
{
  return (NSString *)-[ISSoftwareApplication bundleVersion](self->_application, "bundleVersion");
}

- (id)_className
{
  return CFSTR("iTunesSoftwareApplication");
}

- (NSNumber)dsID
{
  return (NSNumber *)-[ISSoftwareApplication accountDSID](self->_application, "accountDSID");
}

- (NSNumber)ratingRank
{
  return (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend((id)-[ISSoftwareApplication contentRating](self->_application, "contentRating"), "rank"));
}

- (NSString)ratingSystem
{
  return (NSString *)objc_msgSend(MEMORY[0x24BEB1E58], "stringForRatingSystem:", objc_msgSend((id)-[ISSoftwareApplication contentRating](self->_application, "contentRating"), "ratingSystem"));
}

- (NSString)softwareType
{
  return (NSString *)-[ISSoftwareApplication softwareType](self->_application, "softwareType");
}

- (NSString)storeFrontID
{
  return (NSString *)objc_msgSend((id)-[ISSoftwareApplication storeFrontIdentifier](self->_application, "storeFrontIdentifier"), "stringValue");
}

- (NSNumber)versionID
{
  return (NSNumber *)-[ISSoftwareApplication versionIdentifier](self->_application, "versionIdentifier");
}

- (NSString)environmentProduction
{
  return (NSString *)CFSTR("production");
}

- (NSString)environmentSandbox
{
  return (NSString *)CFSTR("sandbox");
}

- (int64_t)launchResultApplicationDisabled
{
  return 8;
}

- (int64_t)launchResultApplicationNotFound
{
  return 7;
}

- (int64_t)launchResultInvalidArgument
{
  return 2;
}

- (int64_t)launchResultLaunchOrSuspendInProgress
{
  return 6;
}

- (int64_t)launchResultLocked
{
  return 3;
}

- (int64_t)launchResultLockedOut
{
  return 4;
}

- (int64_t)launchResultSecurityPolicy
{
  return 9;
}

- (int64_t)launchResultSpringBoardUnavailable
{
  return 1;
}

- (int64_t)launchResultSuccess
{
  return 0;
}

- (int64_t)launchResultSyncing
{
  return 5;
}

- (NSString)softwareTypeNewsstand
{
  return (NSString *)*MEMORY[0x24BEB2478];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_6, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSoftwareApplication;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_4, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSoftwareApplication;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptSoftwareApplication;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_6, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_4 = (uint64_t)sel_checkInAppPurchaseQueueWithAccountID_environment_;
    *(_QWORD *)algn_255186038 = CFSTR("checkInAppPurchaseQueue");
    qword_255186040 = (uint64_t)sel_launchWithURL_options_suspended_;
    unk_255186048 = CFSTR("launch");
    __KeyMapping_6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("adamID"), CFSTR("bundleID"), CFSTR("bundleID"), CFSTR("bundleShortVersionString"), CFSTR("bundleShortVersionString"), CFSTR("bundleVersion"), CFSTR("bundleVersion"), CFSTR("dsID"), CFSTR("dsID"), CFSTR("ratingRank"), CFSTR("ratingRank"), CFSTR("ratingSystem"), CFSTR("ratingSystem"), CFSTR("softwareType"), CFSTR("softwareType"), CFSTR("storeFrontID"), CFSTR("storeFrontID"),
                       CFSTR("versionID"),
                       CFSTR("versionID"),
                       CFSTR("ENVIRONMENT_PRODUCTION"),
                       CFSTR("environmentProduction"),
                       CFSTR("ENVIRONMENT_SANDBOX"),
                       CFSTR("environmentSandbox"),
                       CFSTR("LAUNCH_RESULT_APP_DISABLED"),
                       CFSTR("launchResultApplicationDisabled"),
                       CFSTR("LAUNCH_RESULT_APP_NOT_FOUND"),
                       CFSTR("launchResultApplicationNotFound"),
                       CFSTR("LAUNCH_RESULT_INVALID_ARGUMENT"),
                       CFSTR("launchResultInvalidArgument"),
                       CFSTR("LAUNCH_RESULT_LAUNCH_OR_SUSPEND_IN_PROGRESS"),
                       CFSTR("launchResultLaunchOrSuspendInProgress"),
                       CFSTR("LAUNCH_RESULT_LOCKED"),
                       CFSTR("launchResultLocked"),
                       CFSTR("LAUNCH_RESULT_LOCKED_OUT"),
                       CFSTR("launchResultLockedOut"),
                       CFSTR("LAUNCH_RESULT_SECURITY_POLICY"),
                       CFSTR("launchResultSecurityPolicy"),
                       CFSTR("LAUNCH_RESULT_SPRINGBOARD_UNAVAILABLE"),
                       CFSTR("launchResultSpringBoardUnavailable"),
                       CFSTR("LAUNCH_RESULT_SUCCESS"),
                       CFSTR("launchResultSuccess"),
                       CFSTR("LAUNCH_RESULT_SYNCING"),
                       CFSTR("launchResultSyncing"),
                       CFSTR("SOFTWARE_TYPE_NEWSSTAND"),
                       CFSTR("softwareTypeNewsstand"),
                       0);
  }
}

@end
