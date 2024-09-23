@implementation STAppAndWebsiteActivityEnabledUserNotificationContext

- (STAppAndWebsiteActivityEnabledUserNotificationContext)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STAppAndWebsiteActivityEnabledUserNotificationContext;
  return -[STUserNotificationContext initWithIdentifier:](&v3, sel_initWithIdentifier_, CFSTR("app_and_website_activity_enabled"));
}

- (STAppAndWebsiteActivityEnabledUserNotificationContext)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STAppAndWebsiteActivityEnabledUserNotificationContext;
  return -[STUserNotificationContext initWithCoder:](&v4, sel_initWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v9[1] = 3221225472;
  v9[2] = __106__STAppAndWebsiteActivityEnabledUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v9[3] = &unk_1E9370C08;
  v10 = a3;
  v11 = a4;
  v8.receiver = self;
  v8.super_class = (Class)STAppAndWebsiteActivityEnabledUserNotificationContext;
  v9[0] = MEMORY[0x1E0C809B0];
  v6 = v11;
  v7 = v10;
  -[STUserNotificationContext customizeNotificationContent:withCompletionBlock:](&v8, sel_customizeNotificationContent_withCompletionBlock_, v7, v9);

}

uint64_t __106__STAppAndWebsiteActivityEnabledUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("AppAndWebsiteActivityEnabledUserNotificationTitle"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTitle:", v2);

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("AppAndWebsiteActivityEnabledUserNotificationBody"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBody:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setShouldSuppressScreenLightUp:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setCategoryIdentifier:", CFSTR("com.apple.screentime.enabled"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)notificationBundleIdentifier
{
  return CFSTR("com.apple.ScreenTimeEnabledNotifications");
}

@end
