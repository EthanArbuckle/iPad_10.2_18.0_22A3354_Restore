@implementation STDowntimeWarningUserNotificationContext

- (STDowntimeWarningUserNotificationContext)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STDowntimeWarningUserNotificationContext;
  return -[STUserNotificationContext initWithIdentifier:](&v3, sel_initWithIdentifier_, CFSTR("device_downtime_warning"));
}

- (STDowntimeWarningUserNotificationContext)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STDowntimeWarningUserNotificationContext;
  return -[STUserNotificationContext initWithCoder:](&v4, sel_initWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setTimeLeft:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setAllowedUnits:", 64);
  objc_msgSend(v5, "setUnitsStyle:", 3);
  objc_msgSend(v5, "stringFromTimeInterval:", ceil(a3 / 60.0) * 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUserNotificationContext setLocalizedUserNotificationBodyArguments:](self, "setLocalizedUserNotificationBodyArguments:", v7);

}

- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  STDowntimeWarningUserNotificationContext *v11;
  id v12;

  v9[1] = 3221225472;
  v9[2] = __93__STDowntimeWarningUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v9[3] = &unk_1E9370AC8;
  v10 = a3;
  v11 = self;
  v12 = a4;
  v8.receiver = self;
  v8.super_class = (Class)STDowntimeWarningUserNotificationContext;
  v9[0] = MEMORY[0x1E0C809B0];
  v6 = v12;
  v7 = v10;
  -[STUserNotificationContext customizeNotificationContent:withCompletionBlock:](&v8, sel_customizeNotificationContent_withCompletionBlock_, v7, v9);

}

uint64_t __93__STDowntimeWarningUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  float v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("DowntimeWarningUserNotificationTitle"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTitle:", v2);

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "localizedUserNotificationBodyArguments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedUserNotificationStringForKey:arguments:", CFSTR("DowntimeWarningUserNotificationBody"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBody:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setInterruptionLevel:", 2);
  objc_msgSend(*(id *)(a1 + 32), "setShouldSuppressScreenLightUp:", 1);
  BKSDisplayBrightnessGetCurrent();
  if (v6 == 0.0)
    objc_msgSend(*(id *)(a1 + 32), "setSound:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

@end
