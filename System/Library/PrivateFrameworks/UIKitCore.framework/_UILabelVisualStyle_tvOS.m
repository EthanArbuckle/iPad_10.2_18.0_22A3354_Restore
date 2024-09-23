@implementation _UILabelVisualStyle_tvOS

- (id)defaultFont
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
}

- (void)actionsForInitializationOfLabel:(id)a3
{
  int v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (!_os_feature_enabled_impl())
    goto LABEL_10;
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v4 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    v5 = _UIInternalPreference_UILabelDisableTVAnimationsOnResignActive;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_UILabelDisableTVAnimationsOnResignActive)
    {
      while (v4 >= v5)
      {
        _UIInternalPreferenceSync(v4, &_UIInternalPreference_UILabelDisableTVAnimationsOnResignActive, (uint64_t)CFSTR("UILabelDisableTVAnimationsOnResignActive"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v5 = _UIInternalPreference_UILabelDisableTVAnimationsOnResignActive;
        if (v4 == _UIInternalPreference_UILabelDisableTVAnimationsOnResignActive)
          goto LABEL_11;
      }
      if (byte_1EDDA83E4)
      {
LABEL_10:
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObserver:selector:name:object:", v11, sel__applicationWillResignActiveNotification_, CFSTR("UIApplicationWillResignActiveNotification"), UIApp);
        objc_msgSend(v6, "addObserver:selector:name:object:", v11, sel__applicationDidBecomeActiveNotification_, CFSTR("UIApplicationDidBecomeActiveNotification"), UIApp);

      }
    }
  }
LABEL_11:
  -[_UILabelVisualStyle_tvOS defaultFont](self, "defaultFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v7);

  +[UIColor blackColor](UIColor, "blackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setFallbackTextColor:forUserInterfaceStyle:", v8, 1);

  +[UIColor whiteColor](UIColor, "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setFallbackTextColor:forUserInterfaceStyle:", v9, 2);

  +[UIColor whiteColor](UIColor, "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setFallbackTextColor:forUserInterfaceStyle:", v10, 1000);

}

- (void)actionsForDeallocationOfLabel:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", v4, CFSTR("UIApplicationWillResignActiveNotification"), UIApp);
  objc_msgSend(v5, "removeObserver:name:object:", v4, CFSTR("UIApplicationDidBecomeActiveNotification"), UIApp);

}

- (BOOL)updatesTextColorOnUserInterfaceStyleChanges
{
  return dyld_program_sdk_at_least();
}

- (BOOL)shouldDelayStartMarquee
{
  return 1;
}

- (BOOL)shouldDisableUpdateTextColorOnTraitCollectionChangeForAttributedString:(id)a3 attributes:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (v5 && (_UILabelVisualStyleAttributedStringContainsForegroundColorAttribute(v5) & 1) != 0)
  {
    v7 = 1;
  }
  else if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
