@implementation STDeviceDowntimeUserNotificationContext

- (STDeviceDowntimeUserNotificationContext)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STDeviceDowntimeUserNotificationContext;
  return -[STUserNotificationContext initWithIdentifier:](&v3, sel_initWithIdentifier_, CFSTR("device_downtime"));
}

- (STDeviceDowntimeUserNotificationContext)initWithCoder:(id)a3
{
  id v4;
  STDeviceDowntimeUserNotificationContext *v5;
  uint64_t v6;
  NSString *localizedUserNotificationBodyKey;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STDeviceDowntimeUserNotificationContext;
  v5 = -[STUserNotificationContext initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedUserNotificationBodyKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    localizedUserNotificationBodyKey = v5->_localizedUserNotificationBodyKey;
    v5->_localizedUserNotificationBodyKey = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STDeviceDowntimeUserNotificationContext;
  v4 = a3;
  -[STUserNotificationContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedUserNotificationBodyKey, CFSTR("localizedUserNotificationBodyKey"), v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setEndDateComponents:(id)a3 referenceDate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0C99DC8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "currentLocale");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[STDeviceDowntimeUserNotificationContext setEndDateComponents:referenceDate:locale:](self, "setEndDateComponents:referenceDate:locale:", v8, v7, v9);

}

- (void)setEndDateComponents:(id)a3 referenceDate:(id)a4 locale:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v43;
  id v44;

  v44 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocale:", v8);
  objc_msgSend(v9, "nextDateAfterDate:matchingComponents:options:", v7, v44, 1024);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setLocale:", v8);
  objc_msgSend(v10, "setFormattingContext:", 5);
  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "containsString:", CFSTR("H")))
  {

    v12 = CFSTR("jmm");
  }
  else
  {
    v13 = objc_msgSend(v11, "containsString:", CFSTR("k"));

    v12 = CFSTR("jmm");
    if ((v13 & 1) == 0 && !objc_msgSend(v44, "minute"))
      v12 = CFSTR("j");
  }
  objc_msgSend(v10, "setLocalizedDateFormatFromTemplate:", v12);
  v14 = v43;
  objc_msgSend(v10, "stringFromDate:", v43);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v41, 0);
  v16 = objc_msgSend(v44, "weekday");
  objc_msgSend(v9, "components:fromDate:", 608, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "weekday");
  if (v16 == v18)
  {
    v19 = v8;
    v20 = v43;
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setLocale:", v19);

    objc_msgSend(v21, "setLocalizedDateFormatFromTemplate:", CFSTR("J"));
    objc_msgSend(v21, "stringFromDate:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "integerValue");
    v24 = CFSTR("DeviceDowntimeNotificationBody");
    if (v23 == 1)
      v24 = CFSTR("DeviceDowntimeNotificationBody1AMPM");
    v25 = v24;
  }
  else
  {
    v26 = v18;
    v40 = v7;
    v27 = objc_msgSend(v9, "maximumRangeOfUnit:", 512);
    if (v26 == v28)
      v29 = v27;
    else
      v29 = v26 + 1;
    v39 = v29;
    v30 = v8;
    v31 = v43;
    v32 = (void *)objc_opt_new();
    objc_msgSend(v32, "setLocale:", v30);

    objc_msgSend(v32, "setLocalizedDateFormatFromTemplate:", CFSTR("J"));
    objc_msgSend(v32, "stringFromDate:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_msgSend(v33, "integerValue");
    if (v16 == v39)
    {
      v35 = CFSTR("DeviceDowntimeNotificationBodyTomorrow");
      if (v34 == 1)
        v35 = CFSTR("DeviceDowntimeNotificationBody1AMPMTomorrow");
      v25 = v35;
    }
    else
    {
      v36 = CFSTR("DeviceDowntimeNotificationBodyWeekdayFormat");
      if (v34 == 1)
        v36 = CFSTR("DeviceDowntimeNotificationBody1AMPMWeekdayFormat");
      v25 = v36;
      objc_msgSend(v9, "weekdaySymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", v16 - 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "addObject:", v38);
    }
    v7 = v40;
    v14 = v43;
  }
  -[STDeviceDowntimeUserNotificationContext setLocalizedUserNotificationBodyKey:](self, "setLocalizedUserNotificationBodyKey:", v25);
  -[STUserNotificationContext setLocalizedUserNotificationBodyArguments:](self, "setLocalizedUserNotificationBodyArguments:", v15);

}

- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  STDeviceDowntimeUserNotificationContext *v11;
  id v12;

  v9[1] = 3221225472;
  v9[2] = __92__STDeviceDowntimeUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v9[3] = &unk_1E9370AC8;
  v10 = a3;
  v11 = self;
  v12 = a4;
  v8.receiver = self;
  v8.super_class = (Class)STDeviceDowntimeUserNotificationContext;
  v9[0] = MEMORY[0x1E0C809B0];
  v6 = v12;
  v7 = v10;
  -[STUserNotificationContext customizeNotificationContent:withCompletionBlock:](&v8, sel_customizeNotificationContent_withCompletionBlock_, v7, v9);

}

uint64_t __92__STDeviceDowntimeUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "localizedUserNotificationBodyKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "localizedUserNotificationBodyArguments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedUserNotificationStringForKey:arguments:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBody:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setShouldHideDate:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setShouldSuppressDefaultAction:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setShouldSuppressScreenLightUp:", 1);
  objc_msgSend(MEMORY[0x1E0CEC738], "iconForSystemImageNamed:", CFSTR("hourglass.tophalf.fill"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setIcon:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setSound:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCategoryIdentifier:", CFSTR("com.apple.screentime.downtime"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)destinations
{
  return &unk_1E938D9E8;
}

- (id)notificationBundleIdentifier
{
  return CFSTR("com.apple.ScreenTimeDowntimeNotifications");
}

- (NSString)localizedUserNotificationBodyKey
{
  return self->_localizedUserNotificationBodyKey;
}

- (void)setLocalizedUserNotificationBodyKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedUserNotificationBodyKey, 0);
}

@end
