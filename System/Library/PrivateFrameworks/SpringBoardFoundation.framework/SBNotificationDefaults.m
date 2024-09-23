@implementation SBNotificationDefaults

+ (id)standardDefaults
{
  if (standardDefaults___once != -1)
    dispatch_once(&standardDefaults___once, &__block_literal_global_39);
  return (id)standardDefaults___instance;
}

void __42__SBNotificationDefaults_standardDefaults__block_invoke()
{
  SBNotificationDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(SBNotificationDefaults);
  v1 = (void *)standardDefaults___instance;
  standardDefaults___instance = (uint64_t)v0;

}

- (void)_bindAndRegisterDefaults
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "displayIDsWithBadgingEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBDisplayIDsWithBadgingEnabled"), 0, 12);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "legacyAlarmList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("AlarmList"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldTestBannerPlayTextTone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("SBTestBannerPlaysTextTone"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "dontSuppressForPrivacyWhenUnlocked");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("SBBulletinDontSuppressForPrivacyWhenUnlocked"), v6, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "alwaysAllowDefaultAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("SBAlwaysAllowDefaultAction"), v6, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "alwaysAllowLongLookGesture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("SBAlwaysAllowLongLookGesture"), v6, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "alwaysSpeakNotifications");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v10, CFSTR("NCAlwaysSpeakNotifications"), v6, 1);

}

@end
