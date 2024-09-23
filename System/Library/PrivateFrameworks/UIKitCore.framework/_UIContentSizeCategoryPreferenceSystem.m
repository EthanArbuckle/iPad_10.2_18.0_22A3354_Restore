@implementation _UIContentSizeCategoryPreferenceSystem

- (id)initAsSystem
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIContentSizeCategoryPreferenceSystem;
  result = -[UIContentSizeCategoryPreference initWithContentSizeCategory:](&v3, sel_initWithContentSizeCategory_, CFSTR("_UICTContentSizeCategoryUnspecified"));
  if (result)
  {
    *((_BYTE *)result + 24) = 0;
    *((_BYTE *)result + 25) = 0;
    *((_BYTE *)result + 26) = 0;
  }
  return result;
}

- (void)_beginObservingPreferredContentSizeChangedNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  id v5;

  if (!self->_observingNotification)
  {
    self->_observingNotification = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_preferredContentSizeChangedCallback, CFSTR("ApplePreferredContentSizeCategoryChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)_preferredContentSizeChangedCallback, CFSTR("AppleCarPlayPreferredContentSizeCategoryChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__postContentSizeCategoryDidChangeNotification, *MEMORY[0x1E0DDE0A0], 0);

  }
}

- (void)_readAndObservePreferences
{
  -[_UIContentSizeCategoryPreferenceSystem _updateContentSizeCategoriesFromUserDefaultsPostingNotification:](self, "_updateContentSizeCategoriesFromUserDefaultsPostingNotification:", 0);
  -[_UIContentSizeCategoryPreferenceSystem _beginObservingPreferredContentSizeChangedNotification](self, "_beginObservingPreferredContentSizeChangedNotification");
}

- (void)_updateContentSizeCategoriesFromUserDefaultsPostingNotification:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;

  v3 = a3;
  v5 = 0;
  v6 = 0;
  objc_msgSend((id)objc_opt_class(), "_populateUserDefaultsContentSizeCategory:carPlay:", &v6, &v5);
  -[_UIContentSizeCategoryPreferenceSystem _updateContentSizeCategory:carPlay:postingNotification:](self, "_updateContentSizeCategory:carPlay:postingNotification:", v6, v5, v3);

}

- (void)_updateContentSizeCategory:(id)a3 carPlay:(id)a4 postingNotification:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  __CFString *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  UIContentSizeCategory lhs;

  v5 = a5;
  v8 = a4;
  _UIContentSizeCategoryPreferenceSafeContentSizeCategory(a3);
  lhs = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue();
  if (_UIApplicationIsApplicationWidgetExtension()
    && UIContentSizeCategoryCompareToCategory(lhs, CFSTR("UICTContentSizeCategoryAccessibilityL")) != NSOrderedAscending)
  {
    v9 = CFSTR("UICTContentSizeCategoryAccessibilityL");

    lhs = &v9->isa;
  }
  -[UIContentSizeCategoryPreference preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", lhs);

  if ((v11 & 1) == 0)
  {
    -[_UIContentSizeCategoryPreferenceSystem setPreferredContentSizeCategory:](self, "setPreferredContentSizeCategory:", lhs);
    if (_UIScreenHasScreens())
      +[UIScreen _enumerateScreensWithBlock:](UIScreen, "_enumerateScreensWithBlock:", &__block_literal_global_542);
    if (v5)
      -[_UIContentSizeCategoryPreferenceSystem _postContentSizeCategoryDidChangeNotification](self, "_postContentSizeCategoryDidChangeNotification");
  }
  _UIContentSizeCategoryPreferenceSafeContentSizeCategory(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIContentSizeCategoryPreference preferredContentSizeCategoryCarPlay](self, "preferredContentSizeCategoryCarPlay");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", v12);

  if ((v14 & 1) == 0)
  {
    -[UIContentSizeCategoryPreference setPreferredContentSizeCategoryCarPlay:](self, "setPreferredContentSizeCategoryCarPlay:", v12);
    if (_UIScreenHasScreens())
      +[UIScreen _enumerateScreensWithBlock:](UIScreen, "_enumerateScreensWithBlock:", &__block_literal_global_58_2);
  }

}

- (void)setPreferredContentSizeCategory:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;
  objc_super v10;

  v4 = a3;
  if (!self->_didCheckForPreferredContentSizeCategoryOverride)
  {
    if (_UIApplicationIsExtension())
    {
      self->_didCheckForPreferredContentSizeCategoryOverride = 1;
      self->_applicationOverridesPreferredContentSizeCategory = 0;
    }
    else if (UIApp)
    {
      v5 = +[UIApplication instanceMethodForSelector:](UIApplication, "instanceMethodForSelector:", sel_preferredContentSizeCategory);
      if (v5)
      {
        if (v5 != objc_msgSend((id)UIApp, "methodForSelector:", sel_preferredContentSizeCategory))
          self->_applicationOverridesPreferredContentSizeCategory = 1;
        self->_didCheckForPreferredContentSizeCategoryOverride = 1;
      }
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)_UIContentSizeCategoryPreferenceSystem;
  -[UIContentSizeCategoryPreference setPreferredContentSizeCategory:](&v10, sel_setPreferredContentSizeCategory_, v4);
  if (self->_applicationOverridesPreferredContentSizeCategory)
  {
    objc_msgSend((id)UIApp, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIContentSizeCategoryPreference preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

    if ((v8 & 1) == 0)
    {
      v9.receiver = self;
      v9.super_class = (Class)_UIContentSizeCategoryPreferenceSystem;
      -[UIContentSizeCategoryPreference setPreferredContentSizeCategory:](&v9, sel_setPreferredContentSizeCategory_, v6);
    }
  }
  else
  {
    v6 = v4;
  }

}

- (void)checkForChanges
{
  if (!self->_overridePreferences)
    -[_UIContentSizeCategoryPreferenceSystem _updateContentSizeCategoriesFromUserDefaultsPostingNotification:](self, "_updateContentSizeCategoriesFromUserDefaultsPostingNotification:", 1);
}

- (void)dealloc
{
  objc_super v3;

  -[_UIContentSizeCategoryPreferenceSystem _endObservingPreferredContentSizeChangedNotification](self, "_endObservingPreferredContentSizeChangedNotification");
  v3.receiver = self;
  v3.super_class = (Class)_UIContentSizeCategoryPreferenceSystem;
  -[_UIContentSizeCategoryPreferenceSystem dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_overridePreferences)
    v5 = CFSTR("(overriding) ");
  else
    v5 = &stru_1E16EDF20;
  -[UIContentSizeCategoryPreference preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentSizeCategoryPreference preferredContentSizeCategoryCarPlay](self, "preferredContentSizeCategoryCarPlay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@%@ carplay=%@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setOverridePreferences:(id)a3
{
  id v5;
  void *v6;
  UIContentSizeCategoryPreference *overridePreferences;
  id v8;
  id v9;
  id v10;
  id v11;

  v5 = a3;
  v6 = v5;
  v10 = 0;
  v11 = 0;
  overridePreferences = self->_overridePreferences;
  if (v5)
  {
    if ((objc_msgSend(v5, "isEqual:", overridePreferences) & 1) != 0)
    {
      -[UIContentSizeCategoryPreference preferredContentSizeCategory](self, "preferredContentSizeCategory");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v8;
      -[UIContentSizeCategoryPreference preferredContentSizeCategoryCarPlay](self, "preferredContentSizeCategoryCarPlay");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v9;
    }
    else
    {
      objc_storeStrong((id *)&self->_overridePreferences, a3);
      objc_msgSend(v6, "preferredContentSizeCategory");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v8;
      objc_msgSend(v6, "preferredContentSizeCategoryCarPlay");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8
        && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v8, CFSTR("_UICTContentSizeCategoryUnspecified")) == NSOrderedSame)
      {
        -[UIContentSizeCategoryPreference preferredContentSizeCategory](self, "preferredContentSizeCategory", v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        v8 = v11;
      }
      if (v9
        && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v9, CFSTR("_UICTContentSizeCategoryUnspecified")) == NSOrderedSame)
      {
        -[UIContentSizeCategoryPreference preferredContentSizeCategoryCarPlay](self, "preferredContentSizeCategoryCarPlay");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        v9 = v10;
      }
    }
  }
  else
  {
    self->_overridePreferences = 0;

    objc_msgSend((id)objc_opt_class(), "_populateUserDefaultsContentSizeCategory:carPlay:", &v11, &v10);
    v9 = v10;
    v8 = v11;
  }
  -[_UIContentSizeCategoryPreferenceSystem _updateContentSizeCategory:carPlay:postingNotification:](self, "_updateContentSizeCategory:carPlay:postingNotification:", v8, v9, 1, v10);

}

- (void)_postContentSizeCategoryDidChangeNotification
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (!dyld_program_sdk_at_least())
  {
    v3 = (id)UIApp;
    goto LABEL_5;
  }
  if (_UIScreenHasScreens())
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4 = v3;
    goto LABEL_7;
  }
  v4 = 0;
LABEL_7:
  -[UIContentSizeCategoryPreference preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = CFSTR("UIContentSizeCategoryNewValueKey");
    -[UIContentSizeCategoryPreference preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v10[1] = CFSTR("UIContentSizeCategoryTextLegibilityEnabledKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _AXSEnhanceTextLegibilityEnabled() != 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("UIContentSizeCategoryDidChangeNotification"), v4, v9);

  }
}

- (void)_endObservingPreferredContentSizeChangedNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  id v5;

  if (self->_observingNotification)
  {
    self->_observingNotification = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("ApplePreferredContentSizeCategoryChangedNotification"), 0);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v4, self, CFSTR("AppleCarPlayPreferredContentSizeCategoryChangedNotification"), 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DDE0A0], 0);

  }
}

- (UIContentSizeCategoryPreference)overridePreferences
{
  return self->_overridePreferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridePreferences, 0);
}

@end
