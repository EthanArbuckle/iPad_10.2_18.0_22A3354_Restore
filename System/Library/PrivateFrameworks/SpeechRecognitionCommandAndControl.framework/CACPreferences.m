@implementation CACPreferences

+ (id)sharedPreferences
{
  if (sharedPreferences_staticManagerInstanceSetup != -1)
    dispatch_once(&sharedPreferences_staticManagerInstanceSetup, &__block_literal_global_27);
  return (id)sCACPreferences;
}

void __35__CACPreferences_sharedPreferences__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sCACPreferences;
  sCACPreferences = v0;

}

- (CACPreferences)init
{
  CACPreferences *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v4;
  NSMutableDictionary *builtInLocalizedCommandStringsByLocaleIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CACPreferences;
  v2 = -[CACPreferences init](&v7, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_handleNotification, CFSTR("CACNotificationLanguageChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = objc_opt_new();
    builtInLocalizedCommandStringsByLocaleIdentifier = v2->_builtInLocalizedCommandStringsByLocaleIdentifier;
    v2->_builtInLocalizedCommandStringsByLocaleIdentifier = (NSMutableDictionary *)v4;

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("CACNotificationLanguageChanged"), 0);
  v4.receiver = self;
  v4.super_class = (Class)CACPreferences;
  -[CACPreferences dealloc](&v4, sel_dealloc);
}

- (BOOL)commandAndControlIsEnabled
{
  return _AXSCommandAndControlEnabled() != 0;
}

- (void)setCommandAndControlEnabled:(BOOL)a3
{
  _AXSCommandAndControlSetEnabled();
}

- (void)setLocaleIdentifier:(id)a3
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  +[CACLocaleUtilities normalizedLocaleIdentifier:](CACLocaleUtilities, "normalizedLocaleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("CACLocaleIdentifier"), v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CACNotificationLanguageChanged"), 0, 0, 1u);
}

- (id)bestLocaleIdentifier
{
  __CFString *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  _BOOL4 v23;
  void *v24;
  void *v26;
  void *v27;
  uint8_t buf[4];
  __CFString *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  v3 = (__CFString *)CFPreferencesCopyAppValue(CFSTR("CACLocaleIdentifier"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  -[CACPreferences userSelectableLocaleIdentifiers](self, "userSelectableLocaleIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[CACLocaleUtilities isLocaleIdentifier:containedInLocaleIdentifiers:](CACLocaleUtilities, "isLocaleIdentifier:containedInLocaleIdentifiers:", v3, v4);

  if (!v5)
  {

    goto LABEL_5;
  }
  if (!v3)
  {
LABEL_5:
    v6 = (void *)MEMORY[0x24BDD1488];
    -[CACPreferences userSelectableLocaleIdentifiers](self, "userSelectableLocaleIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_24F2CF578, "arrayByAddingObjectsFromArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredLocalizationsFromArray:forPreferences:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "firstObject");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CACLogPreferences();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = (void *)MEMORY[0x24BDD17C8];
        -[CACPreferences userSelectableLocaleIdentifiers](self, "userSelectableLocaleIdentifiers");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_24F2CF590, "arrayByAddingObjectsFromArray:", v27);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR(","));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("[%@]"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR(","));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("[%@]"), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v29 = v3;
        v30 = 2112;
        v31 = v14;
        v32 = 2112;
        v33 = v18;
        _os_log_impl(&dword_229A40000, v11, OS_LOG_TYPE_INFO, "BestLocaleIdentifier %@ by calling preferredLocalizationsFromArray:%@ from:%@", buf, 0x20u);

      }
      if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("zxx")))
      {

      }
      else if (v3)
      {
        goto LABEL_12;
      }
    }
    v3 = CFSTR("en_US");
LABEL_12:
    if (+[CACLocaleUtilities isSameLocaleIdentifier:secondLocaleIdentifier:](CACLocaleUtilities, "isSameLocaleIdentifier:secondLocaleIdentifier:", v3, CFSTR("zh_CN")))
    {
      objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "languageCode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[CACLocaleUtilities isSameLocaleIdentifier:secondLocaleIdentifier:](CACLocaleUtilities, "isSameLocaleIdentifier:secondLocaleIdentifier:", v20, CFSTR("yue_CN")))
      {
        -[CACPreferences userSelectableLocaleIdentifiers](self, "userSelectableLocaleIdentifiers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = CFSTR("yue_CN");
        v23 = +[CACLocaleUtilities isLocaleIdentifier:containedInLocaleIdentifiers:](CACLocaleUtilities, "isLocaleIdentifier:containedInLocaleIdentifiers:", CFSTR("yue_CN"), v21);

        v19 = v3;
        if (!v23)
          goto LABEL_18;
      }
      else
      {

        v22 = v3;
      }

      v3 = (__CFString *)v22;
    }
LABEL_18:

  }
  +[CACLocaleUtilities normalizedLocaleIdentifier:](CACLocaleUtilities, "normalizedLocaleIdentifier:", v3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)userSelectableLocaleIdentifiers
{
  if (userSelectableLocaleIdentifiers_userSelectableLanguagesInit != -1)
    dispatch_once(&userSelectableLocaleIdentifiers_userSelectableLanguagesInit, &__block_literal_global_204_0);
  return (id)userSelectableLocaleIdentifiers_sUserSelectableLocaleIdentifiers;
}

void __49__CACPreferences_userSelectableLocaleIdentifiers__block_invoke()
{
  void *v0;
  const void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  char *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id obj;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[24];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v1 = (const void *)RXGetSupportedQuasarLocaleIdentifiers();
  v2 = (void *)CFRetain(v1);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v38 != v5)
          objc_enumerationMutation(v2);
        +[CACLocaleUtilities normalizedLocaleIdentifier:](CACLocaleUtilities, "normalizedLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "addObject:", v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v4);
  }

  CACLogPreferences();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __49__CACPreferences_userSelectableLocaleIdentifiers__block_invoke_cold_2(v0);
  v29 = v0;

  v9 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(MEMORY[0x24BDBCEA0], "systemLanguages");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    v13 = *MEMORY[0x24BDBCAE8];
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLocaleIdentifierFromString:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          objc_msgSend(MEMORY[0x24BDBCEA0], "addLikelySubtagsForLocaleIdentifier:", v15);
          v18 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v18;
        }
        +[CACLocaleUtilities normalizedLocaleIdentifier:](CACLocaleUtilities, "normalizedLocaleIdentifier:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "addObject:", v19);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v11);
  }

  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __49__CACPreferences_userSelectableLocaleIdentifiers__block_invoke_216;
  v31[3] = &unk_24F2AC618;
  v20 = v9;
  v32 = v20;
  +[؋ enumerateKeysAndObjectsUsingBlock:](&unk_24F2CF620, "enumerateKeysAndObjectsUsingBlock:", v31);
  CACLogPreferences();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    __49__CACPreferences_userSelectableLocaleIdentifiers__block_invoke_cold_1(v20, v21, buf);
    v22 = *(char **)buf;
  }
  else
  {
    v22 = sel_compare_;
  }

  v23 = (void *)objc_msgSend(v29, "mutableCopy");
  objc_msgSend(v23, "intersectSet:", v20);
  objc_msgSend(v23, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sortedArrayUsingSelector:", v22);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)userSelectableLocaleIdentifiers_sUserSelectableLocaleIdentifiers;
  userSelectableLocaleIdentifiers_sUserSelectableLocaleIdentifiers = v25;

  CACLogPreferences();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)userSelectableLocaleIdentifiers_sUserSelectableLocaleIdentifiers, "componentsJoinedByString:", CFSTR(", "));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v28;
    _os_log_impl(&dword_229A40000, v27, OS_LOG_TYPE_INFO, "userSelectableLocaleIdentifiers: [%@]", buf, 0xCu);

  }
}

void __49__CACPreferences_userSelectableLocaleIdentifiers__block_invoke_216(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", a3))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (void)setAdditionalLoggingForCommands:(BOOL)a3
{
  CFPropertyListRef *v3;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("CACAddDebuggingInfoToRecentCommands"), *v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
}

- (BOOL)additionalLoggingForCommands
{
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("CACAddDebuggingInfoToRecentCommands"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat))
  {
    v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v2 = 1;
  }
  return !v2;
}

- (id)attentionAwareAction
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  v2 = (__CFString *)CFPreferencesCopyAppValue(CFSTR("CACAttentionAwareAction"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  v3 = v2;
  if (!v2)
    v2 = CFSTR("None");
  v4 = v2;

  return v4;
}

- (void)setAttentionAwareAction:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;

  CFPreferencesSetAppValue(CFSTR("CACAttentionAwareAction"), a3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CACNotificationAttentionBasedSettingsChanged"), 0, 0, 1u);
}

- (BOOL)sleepOnAttentionLost
{
  void *v2;
  char v3;

  -[CACPreferences attentionAwareAction](self, "attentionAwareAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SleepAndWake"));

  return v3;
}

- (void)setSleepOnAttentionLost:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("SleepAndWake");
  else
    v3 = CFSTR("None");
  -[CACPreferences setAttentionAwareAction:](self, "setAttentionAwareAction:", v3);
}

- (BOOL)wakeOnAttentionGained
{
  void *v2;
  char v3;

  -[CACPreferences attentionAwareAction](self, "attentionAwareAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SleepAndWake"));

  return v3;
}

- (void)setWakeOnAttentionGained:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("SleepAndWake");
  else
    v3 = CFSTR("None");
  -[CACPreferences setAttentionAwareAction:](self, "setAttentionAwareAction:", v3);
}

- (id)alwaysShowOverlayType
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  v2 = (__CFString *)CFPreferencesCopyAppValue(CFSTR("CACAlwaysShowOverlay"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  v3 = v2;
  if (!v2)
    v2 = CFSTR("None");
  v4 = v2;

  return v4;
}

- (void)setAlwaysShowOverlayType:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;

  CFPreferencesSetAppValue(CFSTR("CACAlwaysShowOverlay"), a3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("NotificationAlwaysShowOverlayTypeSettingsChanged"), 0, 0, 1u);
}

- (BOOL)playSoundUponRecognition
{
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("CACPlaySoundUponRecognition"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat))
  {
    v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v2 = 1;
  }
  return !v2;
}

- (void)setPlaySoundUponRecognition:(BOOL)a3
{
  CFPropertyListRef *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("CACPlaySoundUponRecognition"), *v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("NotificationPlaySoundUponRecognitionSettingsChanged"), 0, 0, 1u);
}

- (BOOL)showTextResponseUponRecognition
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CACShowTextResponseUponRecognition"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

- (void)setShowTextResponseUponRecognition:(BOOL)a3
{
  CFPropertyListRef *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("CACShowTextResponseUponRecognition"), *v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("NotificationShowTextResponseUponRecognitionSettingsChanged"), 0, 0, 1u);
}

- (BOOL)didShowOnboarding
{
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("CACDidShowOnboarding"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat))
  {
    v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v2 = 1;
  }
  return !v2;
}

- (void)setDidShowOnboarding:(BOOL)a3
{
  CFPropertyListRef *v3;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("CACDidShowOnboarding"), *v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
}

- (BOOL)donationTipKitSeen
{
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("CACDonationTipKitSeen"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat))
  {
    v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v2 = 1;
  }
  return !v2;
}

- (void)setDonationTipKitSeen:(BOOL)a3
{
  CFPropertyListRef *v3;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("CACDonationTipKitSeen"), *v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
}

- (id)textDisambiguationStrategy
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  v2 = (__CFString *)CFPreferencesCopyAppValue(CFSTR("CACTextDisambiguationStrategy"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  v3 = v2;
  if (!v2)
    v2 = CFSTR("ShowNumbers");
  v4 = v2;

  return v4;
}

- (void)setTextDisambiguationStrategy:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("CACTextDisambiguationStrategy"), a3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
}

- (id)vocabularyEntries
{
  void *v2;
  CFPropertyListRef v3;
  const void *v4;
  CFTypeID v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesAppSynchronize(CFSTR("com.apple.SpeechRecognitionCore.Vocabulary"));
  v3 = CFPreferencesCopyAppValue(CFSTR("CACVocabularyEntries"), CFSTR("com.apple.SpeechRecognitionCore.Vocabulary"));
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFArrayGetTypeID())
      objc_msgSend(v2, "addObjectsFromArray:", v4);
    CFRelease(v4);
  }
  return v2;
}

- (id)vocabularyEntriesForLocaleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CACPreferences vocabularyEntries](self, "vocabularyEntries", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", CFSTR("LocaleIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12
          && +[CACLocaleUtilities isSameLocaleIdentifier:secondLocaleIdentifier:](CACLocaleUtilities, "isSameLocaleIdentifier:secondLocaleIdentifier:", v4, CFSTR("en_US"))|| +[CACLocaleUtilities isSameLocaleIdentifier:secondLocaleIdentifier:](CACLocaleUtilities, "isSameLocaleIdentifier:secondLocaleIdentifier:", v4, v12))
        {
          objc_msgSend(v5, "addObject:", v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)setVocabularyEntries:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (a3)
  {
    CFPreferencesSetAppValue(CFSTR("CACVocabularyEntries"), a3, CFSTR("com.apple.SpeechRecognitionCore.Vocabulary"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.SpeechRecognitionCore.Vocabulary"));
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("NotificationVocabularyEntriesSettingsChanged"), 0, 0, 1u);
  }
}

- (void)setVocabularyEntries:(id)a3 forLocaleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[CACPreferences vocabularyEntries](self, "vocabularyEntries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(v8, "objectAtIndex:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("LocaleIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11
          && +[CACLocaleUtilities isSameLocaleIdentifier:secondLocaleIdentifier:](CACLocaleUtilities, "isSameLocaleIdentifier:secondLocaleIdentifier:", v7, CFSTR("en_US"))|| +[CACLocaleUtilities isSameLocaleIdentifier:secondLocaleIdentifier:](CACLocaleUtilities, "isSameLocaleIdentifier:secondLocaleIdentifier:", v7, v11))
        {
          objc_msgSend(v8, "removeObjectAtIndex:", v9);
        }
        else
        {
          ++v9;
        }

      }
      while (v9 < objc_msgSend(v8, "count"));
    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v19 = v6;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v17, "objectForKey:", CFSTR("LocaleIdentifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18
            && +[CACLocaleUtilities isSameLocaleIdentifier:secondLocaleIdentifier:](CACLocaleUtilities, "isSameLocaleIdentifier:secondLocaleIdentifier:", v7, CFSTR("en_US"))|| +[CACLocaleUtilities isSameLocaleIdentifier:secondLocaleIdentifier:](CACLocaleUtilities, "isSameLocaleIdentifier:secondLocaleIdentifier:", v7, v18))
          {
            objc_msgSend(v8, "addObject:", v17);
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

    -[CACPreferences setVocabularyEntries:](self, "setVocabularyEntries:", v8);
    v6 = v19;
  }

}

- (void)addVocabularyEntryWithString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CACPreferences bestLocaleIdentifier](self, "bestLocaleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CACPreferences addVocabularyEntryWithString:forLocaleIdentifier:](self, "addVocabularyEntryWithString:forLocaleIdentifier:", v4, v5);

}

- (void)addVocabularyEntryWithString:(id)a3 forLocaleIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[3];
  _QWORD v23[3];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[CACPreferences vocabularyEntriesForLocaleIdentifier:](self, "vocabularyEntriesForLocaleIdentifier:", v7);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "objectForKey:", CFSTR("Text"), (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v6);

          if ((v14 & 1) != 0)
          {

            goto LABEL_12;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        if (v10)
          continue;
        break;
      }
    }

    v23[0] = v6;
    v22[0] = CFSTR("Text");
    v22[1] = CFSTR("CreationDate");
    v15 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = CFSTR("LocaleIdentifier");
    v23[1] = v16;
    v23[2] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v17);

    -[CACPreferences setVocabularyEntries:forLocaleIdentifier:](self, "setVocabularyEntries:forLocaleIdentifier:", v8, v7);
LABEL_12:

  }
}

- (id)getPronsFromIPA:(id)a3
{
  return &stru_24F2ADCC8;
}

- (void)addVocabularyEntryWithWord:(id)a3 IPAs:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  _QWORD v26[4];
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  CACLogPreferences();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v6;
    v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_229A40000, v8, OS_LOG_TYPE_INFO, "Adding vocabulary entry for word %@ ipas %@ ", buf, 0x16u);
  }

  -[CACPreferences bestLocaleIdentifier](self, "bestLocaleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v20 = v7;
    -[CACPreferences vocabularyEntriesForLocaleIdentifier:](self, "vocabularyEntriesForLocaleIdentifier:", v9);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v14), "objectForKey:", CFSTR("Text"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v6);

          if ((v16 & 1) != 0)
          {

            v7 = v20;
            goto LABEL_14;
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        if (v12)
          continue;
        break;
      }
    }

    v25[0] = CFSTR("Text");
    v25[1] = CFSTR("TextIPAs");
    v7 = v20;
    v26[0] = v6;
    v26[1] = v20;
    v25[2] = CFSTR("CreationDate");
    v17 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    objc_msgSend(v17, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = CFSTR("LocaleIdentifier");
    v26[2] = v18;
    v26[3] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v19);

    -[CACPreferences setVocabularyEntries:forLocaleIdentifier:](self, "setVocabularyEntries:forLocaleIdentifier:", v10, v9);
LABEL_14:

  }
}

- (id)localeIdentifiersRepresentedByAllVocabularyEntries
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CACPreferences vocabularyEntries](self, "vocabularyEntries", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "objectForKey:", CFSTR("LocaleIdentifier"));
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = (const __CFString *)v9;
        else
          v11 = CFSTR("en_US");
        objc_msgSend(v3, "addObject:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)fixMissingLocalesForVocabularyEntriesIfNecessary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  CACPreferences *v22;
  uint64_t v23;
  uint64_t v24;
  id obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (!CFPreferencesGetAppBooleanValue(CFSTR("CACDidFixMissingVocabLocales"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), 0))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[CACPreferences vocabularyEntries](self, "vocabularyEntries");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v3)
    {
      v4 = v3;
      v22 = self;
      v5 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v36 != v5)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "objectForKey:", CFSTR("LocaleIdentifier"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v7)
          {

            +[CACLanguageAssetManager downloadedLocaleIdentifiers](CACLanguageAssetManager, "downloadedLocaleIdentifiers");
            obj = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            -[CACPreferences vocabularyEntries](v22, "vocabularyEntries");
            v26 = (id)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
            if (v9)
            {
              v10 = v9;
              v11 = *(_QWORD *)v32;
              v23 = *(_QWORD *)v32;
              do
              {
                v12 = 0;
                v24 = v10;
                do
                {
                  if (*(_QWORD *)v32 != v11)
                    objc_enumerationMutation(v26);
                  v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v12);
                  objc_msgSend(v13, "objectForKey:", CFSTR("LocaleIdentifier"));
                  v14 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v14)
                  {
                    objc_msgSend(v8, "addObject:", v13);
                  }
                  else
                  {
                    v29 = 0u;
                    v30 = 0u;
                    v27 = 0u;
                    v28 = 0u;
                    v15 = obj;
                    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
                    if (v16)
                    {
                      v17 = v16;
                      v18 = *(_QWORD *)v28;
                      do
                      {
                        for (j = 0; j != v17; ++j)
                        {
                          if (*(_QWORD *)v28 != v18)
                            objc_enumerationMutation(v15);
                          v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
                          v21 = (void *)objc_msgSend(v13, "mutableCopy");
                          objc_msgSend(v21, "setObject:forKey:", v20, CFSTR("LocaleIdentifier"));
                          objc_msgSend(v8, "addObject:", v21);

                        }
                        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
                      }
                      while (v17);
                    }

                    v11 = v23;
                    v10 = v24;
                  }
                  ++v12;
                }
                while (v12 != v10);
                v10 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
              }
              while (v10);
            }

            -[CACPreferences setVocabularyEntries:](v22, "setVocabularyEntries:", v8);
            goto LABEL_29;
          }
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_29:

    CFPreferencesSetAppValue(CFSTR("CACDidFixMissingVocabLocales"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  }
}

- (id)userHintsHistory
{
  void *v2;
  CFPropertyListRef v3;
  const void *v4;
  CFTypeID v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  v3 = CFPreferencesCopyAppValue(CFSTR("CACUserHintsHistory"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFDictionaryGetTypeID())
      objc_msgSend(v2, "addEntriesFromDictionary:", v4);
    CFRelease(v4);
  }
  return v2;
}

- (void)setUserHintsHistory:(id)a3
{
  id v3;

  if (a3)
  {
    v3 = a3;
    _CFPreferencesSetFileProtectionClass();
    CFPreferencesSetAppValue(CFSTR("CACUserHintsHistory"), v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));

    CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  }
}

- (int64_t)userHintsFeatures
{
  CFPropertyListRef v2;
  void *v3;
  CFTypeID v4;
  int64_t v5;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  v2 = CFPreferencesCopyAppValue(CFSTR("CACUserHintsFeatures"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  if (!v2)
    return 3;
  v3 = (void *)v2;
  v4 = CFGetTypeID(v2);
  if (v4 == CFNumberGetTypeID())
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 3;
  CFRelease(v3);
  return v5;
}

- (void)setUserHintsFeatures:(int64_t)a3
{
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("CACUserHintsFeatures"), v5, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CACNotificationUserHintsSettingsChanged"), 0, 0, 1u);
  if (!a3)
    -[CACPreferences removeUserCommandHistory](self, "removeUserCommandHistory");
}

- (BOOL)overlayFadingEnabled
{
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("CACOverlayFadingEnabled"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat))
  {
    v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v2 = 1;
  }
  return !v2;
}

- (void)setOverlayFadingEnabled:(BOOL)a3
{
  CFPropertyListRef *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("CACOverlayFadingEnabled"), *v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CACNotificationOverlayFadingSettingsChanged"), 0, 0, 1u);
}

- (double)overlayFadeDelay
{
  CFPropertyListRef v2;
  void *v3;
  CFTypeID v4;
  double v5;
  double v6;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  v2 = CFPreferencesCopyAppValue(CFSTR("CACOverlayFadeDelay"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  if (!v2)
    return 2.0;
  v3 = (void *)v2;
  v4 = CFGetTypeID(v2);
  v5 = 2.0;
  if (v4 == CFNumberGetTypeID())
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v6;
  }
  CFRelease(v3);
  return v5;
}

- (void)setOverlayFadeDelay:(double)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;

  CFPreferencesSetAppValue(CFSTR("CACOverlayFadeDelay"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CACNotificationOverlayFadingSettingsChanged"), 0, 0, 1u);
}

- (float)overlayFadeOpacity
{
  CFPropertyListRef v2;
  void *v3;
  CFTypeID v4;
  double v5;
  double v6;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  v2 = CFPreferencesCopyAppValue(CFSTR("CACOverlayFadeOpacity"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = CFGetTypeID(v2);
    v5 = 0.25;
    if (v4 == CFNumberGetTypeID())
    {
      objc_msgSend(v3, "doubleValue");
      v5 = v6;
    }
    CFRelease(v3);
  }
  else
  {
    return 0.25;
  }
  return v5;
}

- (void)setOverlayFadeOpacity:(float)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;

  CFPreferencesSetAppValue(CFSTR("CACOverlayFadeOpacity"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CACNotificationOverlayFadingSettingsChanged"), 0, 0, 1u);
}

- (BOOL)gridOverlayCustomColumnsEnabled
{
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("CACGridOverlayUseCustomColumns"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat))
  {
    v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v2 = 1;
  }
  return !v2;
}

- (void)setGridOverlayCustomColumnsEnabled:(BOOL)a3
{
  CFPropertyListRef *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("CACGridOverlayUseCustomColumns"), *v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CACNotificationGridOverlaySettingsChanged"), 0, 0, 1u);
}

- (BOOL)gridOverlayCustomRowsEnabled
{
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("CACGridOverlayUseCustomRows"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat))
  {
    v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v2 = 1;
  }
  return !v2;
}

- (void)setGridOverlayCustomRowsEnabled:(BOOL)a3
{
  CFPropertyListRef *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("CACGridOverlayUseCustomRows"), *v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CACNotificationGridOverlaySettingsChanged"), 0, 0, 1u);
}

- (int64_t)gridOverlayCustomColumnsCount
{
  CFPropertyListRef v2;
  void *v3;
  CFTypeID v4;
  int64_t v5;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  v2 = CFPreferencesCopyAppValue(CFSTR("CACGridOverlayDesiredColumns"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  if (!v2)
    return 4;
  v3 = (void *)v2;
  v4 = CFGetTypeID(v2);
  if (v4 == CFNumberGetTypeID())
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 4;
  CFRelease(v3);
  return v5;
}

- (void)setGridOverlayCustomColumnsCount:(int64_t)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;

  CFPreferencesSetAppValue(CFSTR("CACGridOverlayDesiredColumns"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CACNotificationGridOverlaySettingsChanged"), 0, 0, 1u);
}

- (int64_t)gridOverlayCustomRowsCount
{
  CFPropertyListRef v2;
  void *v3;
  CFTypeID v4;
  int64_t v5;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  v2 = CFPreferencesCopyAppValue(CFSTR("CACGridOverlayDesiredRows"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  if (!v2)
    return 6;
  v3 = (void *)v2;
  v4 = CFGetTypeID(v2);
  if (v4 == CFNumberGetTypeID())
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 6;
  CFRelease(v3);
  return v5;
}

- (void)setGridOverlayCustomRowsCount:(int64_t)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;

  CFPreferencesSetAppValue(CFSTR("CACGridOverlayDesiredRows"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CACNotificationGridOverlaySettingsChanged"), 0, 0, 1u);
}

- (int64_t)gridOverlayMaxLevel
{
  CFPropertyListRef v2;
  void *v3;
  CFTypeID v4;
  int64_t v5;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  v2 = CFPreferencesCopyAppValue(CFSTR("CACGridOverlayMaxLevel"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  if (!v2)
    return 3;
  v3 = (void *)v2;
  v4 = CFGetTypeID(v2);
  if (v4 == CFNumberGetTypeID())
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 3;
  CFRelease(v3);
  return v5;
}

- (void)setGridOverlayMaxLevel:(int64_t)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;

  CFPreferencesSetAppValue(CFSTR("CACGridOverlayMaxLevel"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CACNotificationGridOverlaySettingsChanged"), 0, 0, 1u);
}

- (BOOL)gridOverlayPressOnFirstLevelEnabled
{
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("CACGridOverlayPressOnFirstLevel"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat))
  {
    v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v2 = 1;
  }
  return !v2;
}

- (void)setGridOverlayPressOnFirstLevelEnabled:(BOOL)a3
{
  CFPropertyListRef *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("CACGridOverlayPressOnFirstLevel"), *v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CACNotificationGridOverlaySettingsChanged"), 0, 0, 1u);
}

- (BOOL)gridOverlayMaxDensityEnabled
{
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("CACGridOverlayUseMaxDensity"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat))
  {
    v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v2 = 1;
  }
  return !v2;
}

- (void)setGridOverlayMaxDensityEnabled:(BOOL)a3
{
  CFPropertyListRef *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("CACGridOverlayUseMaxDensity"), *v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CACNotificationGridOverlaySettingsChanged"), 0, 0, 1u);
}

- (BOOL)gridOverlayShowsNumbersInTopLeft
{
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("CACGridOverlayShowsNumbersInTopLeft"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat))
  {
    v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v2 = 1;
  }
  return !v2;
}

- (void)setGridOverlayShowsNumbersInTopLeft:(BOOL)a3
{
  CFPropertyListRef *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("CACGridOverlayShowsNumbersInTopLeft"), *v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CACNotificationGridOverlaySettingsChanged"), 0, 0, 1u);
}

- (BOOL)allowLetterKeysAsTapCommands
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CACKeyboardLetterKeysAsCommands"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

- (void)setAllowLetterKeysAsTapCommands:(BOOL)a3
{
  CFPropertyListRef *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("CACKeyboardLetterKeysAsCommands"), *v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CACNotificationKeyboardSettingsChanged"), 0, 0, 1u);
}

- (id)targetApplicationProperties
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  return (id)(id)CFPreferencesCopyAppValue(CFSTR("CACTargetApplications"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
}

- (void)setTargetApplicationProperties:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("CACTargetApplications"), a3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
}

- (BOOL)isEnabledForCommandIdentifier:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[CACPreferences _propertiesForIdentifier:](self, "_propertiesForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Enabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(v4, "BOOLValue");
    else
      v5 = 0;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)isConfirmationRequiredForCommandIdentifier:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[CACPreferences _propertiesForIdentifier:](self, "_propertiesForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ConfirmationRequired"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (id)propertiesForCommandIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CACPreferences bestLocaleIdentifier](self, "bestLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACPreferences propertiesForCommandIdentifier:localeIdentifier:](self, "propertiesForCommandIdentifier:localeIdentifier:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)propertiesForCommandIdentifier:(id)a3 localeIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  CACPreferences *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CACPreferences _propertiesForIdentifier:](self, "_propertiesForIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("CustomType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CACPreferences _mutablePropertiesForIdentifier:create:](self, "_mutablePropertiesForIdentifier:create:", v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("CustomCommands"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v42 = v10;
      v44 = v7;
      v12 = (void *)objc_opt_new();
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      objc_msgSend(v11, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v46 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(v11, "objectForKey:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            +[CACLocaleUtilities normalizedLocaleIdentifier:](CACLocaleUtilities, "normalizedLocaleIdentifier:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v19, v20);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        }
        while (v15);
      }

      v10 = v42;
      objc_msgSend(v42, "setObject:forKey:", v12, CFSTR("CustomCommands"));
LABEL_28:
      v7 = v44;
      goto LABEL_31;
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("CustomTextLocalized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v40 = self;
      v41 = v6;
      v43 = v10;
      v44 = v7;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      objc_msgSend(v12, "allKeys");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v50;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v50 != v31)
              objc_enumerationMutation(v28);
            v33 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
            objc_msgSend(v12, "objectForKey:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setObject:forKey:", v35, v33);

            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        }
        while (v30);
      }

      v36 = (void *)MEMORY[0x24BDBCED8];
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "dictionaryWithObjectsAndKeys:", v37, CFSTR("CustomTextLocalized"), 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v43;
      if (objc_msgSend(v27, "count"))
      {
        objc_msgSend(v38, "setObject:forKey:", v27, CFSTR("CustomCommands"));
        objc_msgSend(v43, "setObject:forKey:", v27, CFSTR("CustomCommands"));
      }
      v6 = v41;
      -[CACPreferences setProperties:forCommandIdentifier:](v40, "setProperties:forCommandIdentifier:", v38, v41);
      objc_msgSend(v43, "removeObjectForKey:", CFSTR("CustomTextLocalized"));

      goto LABEL_28;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEAFED8], "sharedSpokenCommandUtilities");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "commandStringsTableForLocaleIdentifier:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEAFED0], "activeTargetTypes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0;
    objc_msgSend(v11, "languageModelDictionaryForCommandIdentifier:targetTypes:parsingErrorString:", v6, v22, &v53);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[CACPreferences builtInCommandsStringsTableForLocaleIdentifier:](self, "builtInCommandsStringsTableForLocaleIdentifier:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "spokenStringPermutationsOfLanguageModelDictionary:stringsTable:restrictPermutationsToShortestAndLongest:", v12, v23, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count"))
    {
      -[CACPreferences _mutablePropertiesForIdentifier:create:](self, "_mutablePropertiesForIdentifier:create:", v6, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v24, CFSTR("BuiltInStrings"));
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.search"), v6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
        objc_msgSend(v10, "setObject:forKey:", v26, CFSTR("SearchAlternates"));

    }
    else
    {
      v10 = 0;
    }

  }
LABEL_31:

  return v10;
}

- (void)setProperties:(id)a3 forCommandIdentifier:(id)a4
{
  -[CACPreferences setProperties:forCommandIdentifier:client:](self, "setProperties:forCommandIdentifier:client:", a3, a4, 0);
}

- (void)setProperties:(id)a3 forCommandIdentifier:(id)a4 client:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  CACPreferences *v18;
  _BOOL4 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v19 = a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v17 = a4;
  v18 = self;
  -[CACPreferences _mutablePropertiesForIdentifier:create:](self, "_mutablePropertiesForIdentifier:create:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 == v16)
          objc_msgSend(v8, "removeObjectForKey:", v14);
        else
          objc_msgSend(v8, "setObject:forKey:", v15, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  -[CACPreferences _setProperties:forIdentifier:client:](v18, "_setProperties:forIdentifier:client:", v8, v17, v19);
}

- (void)removePropertiesForCommandIdentifier:(id)a3
{
  -[CACPreferences _setProperties:forIdentifier:client:](self, "_setProperties:forIdentifier:client:", 0, a3, 0);
}

- (id)uniqueCustomCommandIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Custom.%lf"), CFAbsoluteTimeGetCurrent());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACPreferences _propertiesForIdentifier:](self, "_propertiesForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Custom.%lf"), CFAbsoluteTimeGetCurrent());
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[CACPreferences _propertiesForIdentifier:](self, "_propertiesForIdentifier:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v5;
    }
    while (v6);
  }
  else
  {
    v5 = v3;
  }
  return v5;
}

- (void)beginPropertyTransaction
{
  NSMutableArray *v3;
  NSMutableArray *propertyTransactions;
  id v5;

  if (!self->_propertyTransactions)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    propertyTransactions = self->_propertyTransactions;
    self->_propertyTransactions = v3;

  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObject:atIndex:](self->_propertyTransactions, "insertObject:atIndex:", v5, 0);
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands"));

}

- (void)_propertyTransactionSynchronize
{
  _QWORD block[5];

  if (!self->_propertyTransactions)
    CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands"));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__CACPreferences__propertyTransactionSynchronize__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  if (_propertyTransactionSynchronize_sSetUpDefaultCommandSettings != -1)
    dispatch_once(&_propertyTransactionSynchronize_sSetUpDefaultCommandSettings, block);
}

uint64_t __49__CACPreferences__propertyTransactionSynchronize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeDefaultCommandSettingsIfNecessary");
}

- (void)_propertyTransactionPostNotification:(id)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *name;

  name = (__CFString *)a3;
  v6 = a4;
  -[NSMutableArray objectAtIndex:](self->_propertyTransactions, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "addObject:", name);
  }
  else
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, name, v6, 0, 1u);
  }

}

- (void)endPropertyTransaction
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSMutableArray *propertyTransactions;
  void *v7;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands"));
  -[NSMutableArray objectAtIndex:](self->_propertyTransactions, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v7 = v3;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_340);
    -[NSMutableArray removeObjectAtIndex:](self->_propertyTransactions, "removeObjectAtIndex:", 0);
    v5 = -[NSMutableArray count](self->_propertyTransactions, "count");
    v4 = v7;
    if (!v5)
    {
      propertyTransactions = self->_propertyTransactions;
      self->_propertyTransactions = 0;

      v4 = v7;
    }
  }

}

void __40__CACPreferences_endPropertyTransaction__block_invoke(uint64_t a1, void *a2)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *name;

  name = a2;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);

}

- (id)_allPropertyIdentifiers
{
  -[CACPreferences _propertyTransactionSynchronize](self, "_propertyTransactionSynchronize");
  return CFPreferencesCopyKeyList(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

- (id)_propertiesForIdentifier:(id)a3
{
  __CFString *v4;
  void *v5;

  v4 = (__CFString *)a3;
  -[CACPreferences _propertyTransactionSynchronize](self, "_propertyTransactionSynchronize");
  v5 = (void *)CFPreferencesCopyAppValue(v4, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands"));

  return v5;
}

- (id)_mutablePropertiesForIdentifier:(id)a3 create:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[CACPreferences _propertiesForIdentifier:](self, "_propertiesForIdentifier:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a4 || v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("Enabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("Enabled"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_setProperties:(id)a3 forIdentifier:(id)a4 client:(BOOL)a5
{
  _BOOL4 v5;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const void *v16;
  const __CFString *v17;
  __CFString *v18;
  id v19;

  v5 = a5;
  v19 = a3;
  v8 = (__CFString *)a4;
  objc_msgSend(v19, "objectForKey:", CFSTR("Enabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "BOOLValue"))
  {
    v11 = (id)objc_msgSend(v19, "mutableCopy");

    objc_msgSend(v11, "removeObjectForKey:", CFSTR("Enabled"));
    v12 = v19;
    v13 = v11;
  }
  else
  {
    v11 = 0;
    v12 = v19;
    v13 = v19;
  }
  objc_msgSend(v12, "objectForKey:", CFSTR("CustomType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (!v11)
    {
      v11 = (id)objc_msgSend(v19, "mutableCopy");

      v13 = v11;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("CustomModifyDate"));

  }
  if (objc_msgSend(v13, "count"))
    v16 = v13;
  else
    v16 = 0;
  CFPreferencesSetAppValue(v8, v16, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands"));
  -[CACPreferences _propertyTransactionSynchronize](self, "_propertyTransactionSynchronize");
  if (v5)
    v17 = CFSTR("CACNotificationClientCommandsSettingsChanged");
  else
    v17 = CFSTR("CACNotificationCommandsSettingsChanged");
  if (v5)
    v18 = v8;
  else
    v18 = 0;
  -[CACPreferences _propertyTransactionPostNotification:identifier:](self, "_propertyTransactionPostNotification:identifier:", v17, v18);

}

- (void)_writeDefaultCommandSettingsIfNecessary
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CFArrayRef v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  const __CFString *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBCE70]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("DefaultCommandSettings"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithContentsOfFile:", v4);

  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands"));
    v8 = CFPreferencesCopyKeyList(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v5, "allKeys", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v9);
          v15 = *(const __CFString **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((-[__CFArray containsObject:](v8, "containsObject:", v15) & 1) == 0)
          {
            objc_msgSend(v5, "objectForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            CFPreferencesSetAppValue(v15, v16, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands"));

            v12 = 1;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);

      if ((v12 & 1) != 0)
        CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands"));
    }
    else
    {

    }
  }

}

+ (id)_builtinCommandsCatalogURL
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("BuiltinCommandsCatalog"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_suffixedURLsForURL:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v23 = (id)objc_opt_new();
  objc_msgSend(v3, "URLByDeletingLastPathComponent");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v24 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByDeletingPathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v4;
  objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v12, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if ((v15 & 1) == 0)
        {
          objc_msgSend(v12, "path");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "path");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "hasPrefix:", v17);

          if (v18)
          {
            objc_msgSend(v12, "pathExtension");
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = (void *)v19;
            if (!(v24 | v19)
              || (v24 == 0) == (v19 == 0) && objc_msgSend((id)v24, "isEqualToString:", v19))
            {
              objc_msgSend(v23, "addObject:", v12);
            }

          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  return v23;
}

- (id)builtInCommandsTable
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__CACPreferences_builtInCommandsTable__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  if (builtInCommandsTable_builtInCommandsTableCacheSetup != -1)
    dispatch_once(&builtInCommandsTable_builtInCommandsTableCacheSetup, block);
  return self->_builtInCommandsTableCache;
}

void __38__CACPreferences_builtInCommandsTable__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "_builtinCommandsCatalogURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:", v2);
  CACLogPreferences();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __38__CACPreferences_builtInCommandsTable__block_invoke_cold_1(v2);

  v18 = a1;
  v17 = v2;
  objc_msgSend((id)objc_opt_class(), "_suffixedURLsForURL:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      v10 = (void *)v3;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:", v11);
        CACLogPreferences();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "lastPathComponent");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v24 = v14;
          _os_log_impl(&dword_229A40000, v13, OS_LOG_TYPE_DEFAULT, "Loaded commands override table: %@", buf, 0xCu);

        }
        objc_msgSend(v12, "dictionaryByMergingEntriesFromDictionary:", v10);
        v3 = objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = (void *)v3;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v7);
  }
  v15 = *(_QWORD *)(v18 + 32);
  v16 = *(void **)(v15 + 8);
  *(_QWORD *)(v15 + 8) = v3;

}

- (id)builtInCommandsStringsTableForLocaleIdentifier:(id)a3
{
  id v4;
  CACPreferences *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  CACPreferences *v16;
  id v17;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](v5->_builtInLocalizedCommandStringsByLocaleIdentifier, "objectForKey:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  v20 = (id)v6;
  if (!v6)
  {
    v19 = v4;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEAFED8], "sharedSpokenCommandUtilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "commandStringsTableForLocaleIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend((id)AllValidCommandParameterIdentifiers(), "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BEAFED0], "activeTargetTypes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", v13, CFSTR("NAME"), v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "length"))
            objc_msgSend(v20, "setObject:forKey:", v15, v13);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    if (v20)
    {
      v16 = v5;
      objc_sync_enter(v16);
      -[NSMutableDictionary setObject:forKey:](v5->_builtInLocalizedCommandStringsByLocaleIdentifier, "setObject:forKey:", v20, v19);
      v17 = v20;
      objc_sync_exit(v16);

    }
    v4 = v19;
  }

  return v20;
}

- (void)_flushBuiltInCommandsStringsTable
{
  CACPreferences *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](obj->_builtInLocalizedCommandStringsByLocaleIdentifier, "removeAllObjects");
  objc_sync_exit(obj);

}

- (id)availableCommandSetIdentifiers
{
  void *v2;
  void *v3;

  -[CACPreferences builtInCommandsTable](self, "builtInCommandsTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("OrderedCommandSetIdentifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)displayNameForCommandSetIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.DisplayName"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_24F2ADCC8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hidePreferencesForCommandSetIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CACPreferences builtInCommandsTable](self, "builtInCommandsTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("CommandSets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("HideInPreferences"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(v8, "BOOLValue");
  else
    v9 = 0;

  return v9;
}

- (id)enabledCommandIdentifiersForCommandSetIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CACPreferences bestLocaleIdentifier](self, "bestLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACPreferences _commandIdentifiersForCommandSetIdentifier:localeIdentifier:enabledOnly:](self, "_commandIdentifiersForCommandSetIdentifier:localeIdentifier:enabledOnly:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)commandIdentifiersForCommandSetIdentifier:(id)a3 localeIdentifier:(id)a4
{
  return -[CACPreferences _commandIdentifiersForCommandSetIdentifier:localeIdentifier:enabledOnly:](self, "_commandIdentifiersForCommandSetIdentifier:localeIdentifier:enabledOnly:", a3, a4, 0);
}

- (id)_commandIdentifiersForCommandSetIdentifier:(id)a3 localeIdentifier:(id)a4 enabledOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  id v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("Custom")))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[CACPreferences _allPropertyIdentifiers](self, "_allPropertyIdentifiers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v10)
    {
      v11 = v10;
      v27 = v8;
      v12 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          -[CACPreferences _propertiesForIdentifier:](self, "_propertiesForIdentifier:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", CFSTR("CustomType"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16
            && (!v5 || -[CACPreferences isEnabledForCommandIdentifier:](self, "isEnabledForCommandIdentifier:", v14)))
          {
            objc_msgSend(v29, "addObject:", v14);
          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v11);
      v8 = v27;
    }
  }
  else
  {
    -[CACPreferences builtInCommandsTable](self, "builtInCommandsTable");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("CommandSets"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v19;
    objc_msgSend(v19, "objectForKey:", CFSTR("CommandIdentifiers"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
          if (-[CACPreferences isCommandIdentifier:availableForLocaleIdentifier:](self, "isCommandIdentifier:availableForLocaleIdentifier:", v25, v9)&& (!v5 || -[CACPreferences isEnabledForCommandIdentifier:](self, "isEnabledForCommandIdentifier:", v25)))
          {
            objc_msgSend(v29, "addObject:", v25);
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v22);
    }

  }
  return v29;
}

- (BOOL)isCommandIdentifier:(id)a3 availableForLocaleIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BEAFED8], "sharedSpokenCommandUtilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commandStringsTableForLocaleIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(v8, "isSupportedCommandIdentifier:forLocaleIdentifier:", v5, v6);
  else
    v9 = 1;

  return v9;
}

- (id)setOfApplicationIdentifiersUsedByCustomCommands
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CACPreferences _allPropertyIdentifiers](self, "_allPropertyIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        -[CACPreferences _propertiesForIdentifier:](self, "_propertiesForIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("CustomType"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "objectForKey:", CFSTR("CustomScope"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10 && (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.speech.SystemWideScope")) & 1) == 0)
            objc_msgSend(v13, "addObject:", v11);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  return v13;
}

- (id)allCustomCommandProperties
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CACPreferences _allPropertyIdentifiers](self, "_allPropertyIdentifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[CACPreferences _propertiesForIdentifier:](self, "_propertiesForIdentifier:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("CustomType"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v3, "setObject:forKey:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)addOrUpdateCommandPropertiesFromImportedTable:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const __CFString *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(const __CFString **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        CFPreferencesSetAppValue(v10, v11, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands"));

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[CACPreferences _propertyTransactionSynchronize](self, "_propertyTransactionSynchronize");
  -[CACPreferences _propertyTransactionPostNotification:identifier:](self, "_propertyTransactionPostNotification:identifier:", CFSTR("CACNotificationCommandsSettingsChanged"), 0);

}

- (void)deleteAllCustomCommandEntries
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CACPreferences allCustomCommandProperties](self, "allCustomCommandProperties", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        CFPreferencesSetAppValue(*(CFStringRef *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 0, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[CACPreferences _propertyTransactionSynchronize](self, "_propertyTransactionSynchronize");
  -[CACPreferences _propertyTransactionPostNotification:identifier:](self, "_propertyTransactionPostNotification:identifier:", CFSTR("CACNotificationCommandsSettingsChanged"), 0);
}

- (BOOL)phoneticVocabularyShowDebugUI
{
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("CACPhoneticVocabularyShowDebugUI"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat))
  {
    v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v2 = 1;
  }
  return !v2;
}

- (void)setPhoneticVocabularyShowDebugUI:(BOOL)a3
{
  CFPropertyListRef *v3;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("CACPhoneticVocabularyShowDebugUI"), *v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
}

- (BOOL)phoneticVocabularySkipPickingPronunciation
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CACPhoneticVocabularySkipPickingPronunciation"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

- (void)setPhoneticVocabularySkipPickingPronunciation:(BOOL)a3
{
  CFPropertyListRef *v3;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("CACPhoneticVocabularySkipPickingPronunciation"), *v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
}

- (BOOL)phoneticVocabularyShowUserFacingIPAToggle
{
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("CACPhoneticVocabularyShowUserFacingIPAToggle"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat))
  {
    v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v2 = 1;
  }
  return !v2;
}

- (void)setPhoneticVocabularyShowUserFacingIPAToggle:(BOOL)a3
{
  CFPropertyListRef *v3;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("CACPhoneticVocabularyShowUserFacingIPAToggle"), *v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
}

- (BOOL)phoneticVocabularyShowUserFacingIPA
{
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("CACPhoneticVocabularyShowUserFacingIPA"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat))
  {
    v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v2 = 1;
  }
  return !v2;
}

- (void)setPhoneticVocabularyShowUserFacingIPA:(BOOL)a3
{
  CFPropertyListRef *v3;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("CACPhoneticVocabularyShowUserFacingIPA"), *v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
}

- (double)lastCommandDate
{
  CFPropertyListRef v2;
  void *v3;
  double v4;
  double v5;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  v2 = CFPreferencesCopyAppValue(CFSTR("CACLastCommandDate"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  if (!v2)
    return 0.0;
  v3 = (void *)v2;
  v4 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "doubleValue");
    v4 = v5;
  }
  CFRelease(v3);
  return v4;
}

- (void)setLastCommandDate:(double)a3
{
  _CFPreferencesSetFileProtectionClass();
  CFPreferencesSetAppValue(CFSTR("CACLastCommandDate"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
}

- (int64_t)correctionCount
{
  CFPropertyListRef v2;
  void *v3;
  double v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  v2 = CFPreferencesCopyAppValue(CFSTR("CACCorrectionCount"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = 0.0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (double)(int)objc_msgSend(v3, "intValue");
    CFRelease(v3);
  }
  else
  {
    return (uint64_t)0.0;
  }
  return (uint64_t)v4;
}

- (void)setCorrectionCount:(int64_t)a3
{
  _CFPreferencesSetFileProtectionClass();
  CFPreferencesSetAppValue(CFSTR("CACCorrectionCount"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
}

- (int64_t)messageTracesSinceLastReport
{
  CFPropertyListRef v2;
  void *v3;
  double v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  v2 = CFPreferencesCopyAppValue(CFSTR("CACMessageTracesSinceLastReport"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = 0.0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (double)(int)objc_msgSend(v3, "intValue");
    CFRelease(v3);
  }
  else
  {
    return (uint64_t)0.0;
  }
  return (uint64_t)v4;
}

- (void)setMessageTracesSinceLastReport:(int64_t)a3
{
  _CFPreferencesSetFileProtectionClass();
  CFPreferencesSetAppValue(CFSTR("CACMessageTracesSinceLastReport"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
}

- (id)commandCounts
{
  void *v2;
  CFPropertyListRef v3;
  const void *v4;
  CFTypeID v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  v3 = CFPreferencesCopyAppValue(CFSTR("CACCommandCounts"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFDictionaryGetTypeID())
      objc_msgSend(v2, "addEntriesFromDictionary:", v4);
    CFRelease(v4);
  }
  return v2;
}

- (void)setCommandCounts:(id)a3
{
  id v3;

  if (a3)
  {
    v3 = a3;
    _CFPreferencesSetFileProtectionClass();
    CFPreferencesSetAppValue(CFSTR("CACCommandCounts"), v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));

    CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  }
}

- (id)targetApplicationCounts
{
  void *v2;
  CFPropertyListRef v3;
  const void *v4;
  CFTypeID v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  v3 = CFPreferencesCopyAppValue(CFSTR("CACTargetApplicationCounts"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFDictionaryGetTypeID())
      objc_msgSend(v2, "addEntriesFromDictionary:", v4);
    CFRelease(v4);
  }
  return v2;
}

- (void)setTargetApplicationCounts:(id)a3
{
  id v3;

  if (a3)
  {
    v3 = a3;
    _CFPreferencesSetFileProtectionClass();
    CFPreferencesSetAppValue(CFSTR("CACTargetApplicationCounts"), v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));

    CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  }
}

- (id)recentCommandEntries
{
  void *v2;
  CFPropertyListRef v3;
  const void *v4;
  CFTypeID v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  v3 = CFPreferencesCopyAppValue(CFSTR("CACRecentCommands"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFArrayGetTypeID())
      objc_msgSend(v2, "addObjectsFromArray:", v4);
    CFRelease(v4);
  }
  return v2;
}

- (void)setRecentCommandEntries:(id)a3
{
  id v3;

  if (a3)
  {
    v3 = a3;
    _CFPreferencesSetFileProtectionClass();
    CFPreferencesSetAppValue(CFSTR("CACRecentCommands"), v3, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));

    CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  }
}

- (id)divertedCommandsLogPath
{
  CFPropertyListRef v2;
  void *v3;
  CFTypeID v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  v2 = CFPreferencesCopyAppValue(CFSTR("CACDivertCommandsToLogPath"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  v3 = (void *)v2;
  if (v2)
  {
    v4 = CFGetTypeID(v2);
    if (v4 != CFStringGetTypeID())
    {
      CFRelease(v3);
      v3 = 0;
    }
  }
  return v3;
}

- (BOOL)forceAllCommandsToBeActive
{
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  keyExistsAndHasValidFormat = 0;
  return CFPreferencesGetAppBooleanValue(CFSTR("CACForceAllCommandsToBeActive"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"), &keyExistsAndHasValidFormat) != 0;
}

- (BOOL)usingAutomationMode
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.SpeechRecognitionCore.speechrecognitiond"));
  return CFPreferencesGetAppIntegerValue(CFSTR("RXDebugAutomationMode"), CFSTR("com.apple.SpeechRecognitionCore.speechrecognitiond"), 0) > 0;
}

- (id)externalContextOverrideFilePath
{
  CFPropertyListRef v2;
  void *v3;
  CFTypeID v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  v2 = CFPreferencesCopyAppValue(CFSTR("CACExternalContextOverrideFilePath"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  v3 = (void *)v2;
  if (v2)
  {
    v4 = CFGetTypeID(v2);
    if (v4 != CFStringGetTypeID())
    {
      CFRelease(v3);
      v3 = 0;
    }
  }
  return v3;
}

- (id)rawCustomCommandsPreferencesDictionary
{
  return CFPreferencesCopyMultiple(0, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

- (void)removeUserCommandHistory
{
  _CFPreferencesSetFileProtectionClass();
  CFPreferencesSetAppValue(CFSTR("CACRecentCommands"), 0, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  CFPreferencesSetAppValue(CFSTR("CACCommandCounts"), 0, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  CFPreferencesSetAppValue(CFSTR("CACUserHintsHistory"), 0, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
}

- (BOOL)shouldDisableDeviceIdleTimer
{
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.SpeechRecognitionCore.Utility"));
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("CACPrefsUtilityDisableDeviceIdleTimerKey"), CFSTR("com.apple.SpeechRecognitionCore.Utility"), &keyExistsAndHasValidFormat))
  {
    v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v2 = 1;
  }
  return !v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyTransactions, 0);
  objc_storeStrong((id *)&self->_builtInLocalizedCommandStringsByLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_builtInCommandsTableCache, 0);
}

void __49__CACPreferences_userSelectableLocaleIdentifiers__block_invoke_cold_1(void *a1, NSObject *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = sel_compare_;
  objc_msgSend(v5, "sortedArrayUsingSelector:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412290;
  v8 = v6;
  _os_log_debug_impl(&dword_229A40000, a2, OS_LOG_TYPE_DEBUG, "supportedDeviceLocaleIDs: %@", (uint8_t *)&v7, 0xCu);

  OUTLINED_FUNCTION_3();
}

void __49__CACPreferences_userSelectableLocaleIdentifiers__block_invoke_cold_2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "allObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sortedArrayUsingSelector:", sel_compare_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_229A40000, v3, v4, "supportedQuasarLocaleIDs: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

void __38__CACPreferences_builtInCommandsTable__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_229A40000, v2, v3, "Loaded commands table: %@", v4, v5, v6, v7, 2u);

}

@end
