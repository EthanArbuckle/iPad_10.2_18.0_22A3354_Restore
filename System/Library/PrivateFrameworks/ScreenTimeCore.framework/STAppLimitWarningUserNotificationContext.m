@implementation STAppLimitWarningUserNotificationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setLimitDisplayName:(id)a3 timeLeft:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setAllowedUnits:", 64);
    objc_msgSend(v7, "setUnitsStyle:", 3);
    objc_msgSend(v7, "stringFromTimeInterval:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v8;
    v10[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUserNotificationContext setLocalizedUserNotificationBodyArguments:](self, "setLocalizedUserNotificationBodyArguments:", v9);

  }
  else
  {
    -[STUserNotificationContext setLocalizedUserNotificationBodyArguments:](self, "setLocalizedUserNotificationBodyArguments:", MEMORY[0x1E0C9AA60]);
  }

}

- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  STAppLimitWarningUserNotificationContext *v11;
  id v12;

  v9[1] = 3221225472;
  v9[2] = __93__STAppLimitWarningUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v9[3] = &unk_1E9370AC8;
  v10 = a3;
  v11 = self;
  v12 = a4;
  v8.receiver = self;
  v8.super_class = (Class)STAppLimitWarningUserNotificationContext;
  v9[0] = MEMORY[0x1E0C809B0];
  v6 = v12;
  v7 = v10;
  -[STUserNotificationContext customizeNotificationContent:withCompletionBlock:](&v8, sel_customizeNotificationContent_withCompletionBlock_, v7, v9);

}

uint64_t __93__STAppLimitWarningUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("AppLimitWarningUserNotificationTitle"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTitle:", v2);

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "localizedUserNotificationBodyArguments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedUserNotificationStringForKey:arguments:", CFSTR("AppLimitWarningUserNotificationBody"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBody:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setInterruptionLevel:", 2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

@end
