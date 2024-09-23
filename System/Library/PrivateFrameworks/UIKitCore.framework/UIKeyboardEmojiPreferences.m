@implementation UIKeyboardEmojiPreferences

+ (id)sharedInstance
{
  if (qword_1ECD7EFA0 != -1)
    dispatch_once(&qword_1ECD7EFA0, &__block_literal_global_342);
  return (id)qword_1ECD7EF98;
}

void __44__UIKeyboardEmojiPreferences_sharedInstance__block_invoke()
{
  UIKeyboardEmojiPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(UIKeyboardEmojiPreferences);
  v1 = (void *)qword_1ECD7EF98;
  qword_1ECD7EF98 = (uint64_t)v0;

}

- (void)readEmojiDefaults
{
  -[EMFEmojiPreferencesClient readEmojiDefaults](self->_preferencesClient, "readEmojiDefaults");
}

- (void)writeEmojiDefaults
{
  -[EMFEmojiPreferencesClient _disconnect](self->_preferencesClient, "_disconnect");
}

- (UIKeyboardEmojiPreferences)init
{
  UIKeyboardEmojiPreferences *v2;
  uint64_t v3;
  EMFEmojiPreferencesClient *preferencesClient;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *clientDispatchQueue;
  void *v8;
  NSArray *localRecentsWithClient;
  NSArray *localRecentsWithoutClient;
  void *v11;
  UIKeyboardEmojiPreferences *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardEmojiPreferences;
  v2 = -[UIKeyboardEmojiPreferences init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)getEMFEmojiPreferencesClientClass()), "_initWithoutConnection");
    preferencesClient = v2->_preferencesClient;
    v2->_preferencesClient = (EMFEmojiPreferencesClient *)v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.UIKit.emoji-client", v5);
    clientDispatchQueue = v2->_clientDispatchQueue;
    v2->_clientDispatchQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_handleSuspend_, CFSTR("UIApplicationSuspendedNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_handleWrite_, CFSTR("UIKeyboardWillHideNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_handleWrite_, CFSTR("UIKeyboardWillChangeFrameNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_handleRead_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_handleRead_, CFSTR("UIKeyboardWillShowNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_handleBackground_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_preferencesControllerChanged_, *MEMORY[0x1E0DBE478], 0);
    -[EMFEmojiPreferencesClient readEmojiDefaults](v2->_preferencesClient, "readEmojiDefaults");
    localRecentsWithClient = v2->_localRecentsWithClient;
    v2->_localRecentsWithClient = 0;

    localRecentsWithoutClient = v2->_localRecentsWithoutClient;
    v2->_localRecentsWithoutClient = 0;

    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_deviceWasLockedWhenKeyboardWasShown = objc_msgSend(v11, "deviceStateIsLocked");

    v12 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  EMFEmojiPreferencesClient *preferencesClient;
  NSArray *localRecentsWithClient;
  NSArray *localRecentsWithoutClient;
  OS_dispatch_queue *clientDispatchQueue;
  objc_super v9;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("UIApplicationSuspendedNotification");
  v10[1] = CFSTR("UIKeyboardWillHideNotification");
  v10[2] = CFSTR("UIKeyboardWillChangeFrameNotification");
  v10[3] = CFSTR("UIApplicationWillEnterForegroundNotification");
  v10[4] = CFSTR("UIKeyboardWillShowNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  -[UIKeyboardEmojiPreferences writeEmojiDefaults](self, "writeEmojiDefaults");
  preferencesClient = self->_preferencesClient;
  self->_preferencesClient = 0;

  localRecentsWithClient = self->_localRecentsWithClient;
  self->_localRecentsWithClient = 0;

  localRecentsWithoutClient = self->_localRecentsWithoutClient;
  self->_localRecentsWithoutClient = 0;

  clientDispatchQueue = self->_clientDispatchQueue;
  self->_clientDispatchQueue = 0;

  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardEmojiPreferences;
  -[UIKeyboardEmojiPreferences dealloc](&v9, sel_dealloc);
}

- (void)clearEmojiKeyboardPreferenceClient
{
  EMFEmojiPreferencesClient *preferencesClient;

  -[UIKeyboardEmojiPreferences writeEmojiDefaults](self, "writeEmojiDefaults");
  -[UIKeyboardEmojiPreferences clearLocalRecentsCache](self, "clearLocalRecentsCache");
  preferencesClient = self->_preferencesClient;
  self->_preferencesClient = 0;

}

- (void)handleWrite:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("UIKeyboardIsLocalUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) != 0
    || (objc_msgSend(v9, "name"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("UIKeyboardWillChangeFrameNotification")),
        v7,
        v8))
  {
    -[UIKeyboardEmojiPreferences writeEmojiDefaults](self, "writeEmojiDefaults");
  }

}

- (void)handleRead:(id)a3
{
  -[UIKeyboardEmojiPreferences readEmojiDefaults](self, "readEmojiDefaults", a3);
  -[UIKeyboardEmojiPreferences _updateCachedDeviceLockState](self, "_updateCachedDeviceLockState");
}

- (void)handleBackground:(id)a3
{
  -[UIKeyboardEmojiPreferences setHasCheckedMemojiPreference:](self, "setHasCheckedMemojiPreference:", 0);
}

- (EMFEmojiPreferencesClient)preferencesClient
{
  EMFEmojiPreferencesClient *preferencesClient;
  EMFEmojiPreferencesClient *v4;
  EMFEmojiPreferencesClient *v5;

  preferencesClient = self->_preferencesClient;
  if (!preferencesClient)
  {
    v4 = (EMFEmojiPreferencesClient *)objc_msgSend(objc_alloc((Class)getEMFEmojiPreferencesClientClass()), "_initWithoutConnection");
    v5 = self->_preferencesClient;
    self->_preferencesClient = v4;

    preferencesClient = self->_preferencesClient;
  }
  return preferencesClient;
}

- (BOOL)hasDisplayedSkinToneHelp
{
  void *v2;
  char v3;

  -[UIKeyboardEmojiPreferences preferencesClient](self, "preferencesClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasDisplayedSkinToneHelp");

  return v3;
}

- (void)didDisplaySkinToneHelp
{
  id v2;

  -[UIKeyboardEmojiPreferences preferencesClient](self, "preferencesClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDisplaySkinToneHelp");

}

- (unint64_t)maximumRecentsCount
{
  void *v2;
  unint64_t v3;

  -[UIKeyboardEmojiPreferences preferencesClient](self, "preferencesClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumRecentsCount");

  return v3;
}

- (void)setMaximumRecentsCount:(unint64_t)a3
{
  id v4;

  -[UIKeyboardEmojiPreferences preferencesClient](self, "preferencesClient");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumRecentsCount:", a3);

}

- (void)setEmojiCategoryDefaultsIndex:(int64_t)a3 forCategory:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = a4;
  -[UIKeyboardEmojiPreferences preferencesClient](self, "preferencesClient");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "categoryType");

  +[UIKeyboardEmojiCategory emojiCategoryStringForCategoryType:](UIKeyboardEmojiCategory, "emojiCategoryStringForCategoryType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didViewEmojiIndex:forCategory:", a3, v8);

}

- (int64_t)emojiCategoryDefaultsIndex:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int64_t v8;

  v4 = a3;
  -[UIKeyboardEmojiPreferences preferencesClient](self, "preferencesClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "categoryType");

  +[UIKeyboardEmojiCategory emojiCategoryStringForCategoryType:](UIKeyboardEmojiCategory, "emojiCategoryStringForCategoryType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "previouslyUsedIndexInCategory:", v7);

  return v8;
}

- (NSArray)recents
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v2 = (void *)getEMFEmojiPreferencesClass_softClass;
  v20 = getEMFEmojiPreferencesClass_softClass;
  if (!getEMFEmojiPreferencesClass_softClass)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __getEMFEmojiPreferencesClass_block_invoke;
    v16[3] = &unk_1E16B14C0;
    v16[4] = &v17;
    __getEMFEmojiPreferencesClass_block_invoke((uint64_t)v16);
    v2 = (void *)v18[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v3, "_recentEmojiStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        +[UIKeyboardEmoji emojiWithString:withVariantMask:](UIKeyboardEmoji, "emojiWithString:withVariantMask:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), +[UIKeyboardEmojiCategory hasVariantsForEmoji:](UIKeyboardEmojiCategory, "hasVariantsForEmoji:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v21, 16);
    }
    while (v7);
  }

  return (NSArray *)v5;
}

- (void)clearLocalRecentsCache
{
  NSArray *localRecentsWithClient;
  NSArray *localRecentsWithoutClient;

  localRecentsWithClient = self->_localRecentsWithClient;
  self->_localRecentsWithClient = 0;

  localRecentsWithoutClient = self->_localRecentsWithoutClient;
  self->_localRecentsWithoutClient = 0;

}

- (void)refreshLocalRecents
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *localRecentsWithClient;
  NSArray *v8;
  NSArray *localRecentsWithoutClient;
  id v10;

  -[UIKeyboardEmojiPreferences preferencesClient](self, "preferencesClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIKeyboardEmojiPreferences preferencesClient](self, "preferencesClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recentEmojis");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)objc_msgSend(v5, "copy");
    localRecentsWithClient = self->_localRecentsWithClient;
    self->_localRecentsWithClient = v6;

  }
  else
  {
    v4 = self->_localRecentsWithClient;
    self->_localRecentsWithClient = 0;
  }

  -[UIKeyboardEmojiPreferences recents](self, "recents");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (NSArray *)objc_msgSend(v10, "copy");
  localRecentsWithoutClient = self->_localRecentsWithoutClient;
  self->_localRecentsWithoutClient = v8;

}

- (id)recentEmojiAtIndex:(int64_t)a3 size:(unint64_t *)a4
{
  void *v7;
  NSArray *localRecentsWithClient;
  void *v9;
  void *v10;
  NSArray *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *v16;

  -[UIKeyboardEmojiPreferences preferencesClient](self, "preferencesClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v11 = self->_localRecentsWithoutClient;
    v9 = v11;
    if (a4)
      *a4 = -[NSArray count](v11, "count");
    if (objc_msgSend(v9, "count") <= (unint64_t)a3)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v9, "objectAtIndex:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "emojiString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_15;
  }
  localRecentsWithClient = self->_localRecentsWithClient;
  if (localRecentsWithClient)
  {
    if (!a4)
      goto LABEL_5;
    goto LABEL_4;
  }
  -[UIKeyboardEmojiPreferences preferencesClient](self, "preferencesClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recentEmojis");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (NSArray *)objc_msgSend(v14, "copy");
  v16 = self->_localRecentsWithClient;
  self->_localRecentsWithClient = v15;

  localRecentsWithClient = self->_localRecentsWithClient;
  if (a4)
  {
LABEL_4:
    *a4 = -[NSArray count](localRecentsWithClient, "count");
    localRecentsWithClient = self->_localRecentsWithClient;
  }
LABEL_5:
  if (-[NSArray count](localRecentsWithClient, "count") > a3)
  {
    -[NSArray objectAtIndex:](self->_localRecentsWithClient, "objectAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

    return v10;
  }
  v10 = 0;
  return v10;
}

- (BOOL)shouldShowRecents
{
  return !self->_deviceWasLockedWhenKeyboardWasShown;
}

- (BOOL)memojiSettingEnabled
{
  void *v3;
  void *v4;

  if (!-[UIKeyboardEmojiPreferences hasCheckedMemojiPreference](self, "hasCheckedMemojiPreference"))
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferencesActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiPreferences setSupportsMemoji:](self, "setSupportsMemoji:", objc_msgSend(v4, "BOOLForPreferenceKey:", CFSTR("ShowStickers")));

    -[UIKeyboardEmojiPreferences setHasCheckedMemojiPreference:](self, "setHasCheckedMemojiPreference:", 1);
  }
  return -[UIKeyboardEmojiPreferences supportsMemoji](self, "supportsMemoji");
}

- (void)preferencesControllerChanged:(id)a3
{
  -[UIKeyboardEmojiPreferences setHasCheckedMemojiPreference:](self, "setHasCheckedMemojiPreference:", 0);
}

- (BOOL)deviceSupportsMemoji
{
  void *v2;
  int v3;

  if (qword_1ECD7EFA8 != -1)
    dispatch_once(&qword_1ECD7EFA8, &__block_literal_global_161_0);
  if (_MergedGlobals_1129)
  {
    +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.springboard")) & 1) != 0)
      LOBYTE(v3) = 0;
    else
      v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.MobileSMS.MessagesNotificationExtension")) ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)emojiWithoutDuplicateRecents:(id)a3
{
  id v4;
  NSArray *localRecentsWithClient;
  NSArray *v6;
  NSArray *v7;
  NSArray *localRecentsWithoutClient;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  NSArray *v19;
  NSArray *v20;

  v4 = a3;
  if (self->_preferencesClient)
  {
    localRecentsWithClient = self->_localRecentsWithClient;
    if (localRecentsWithClient)
    {
      v6 = localRecentsWithClient;
LABEL_5:
      v7 = 0;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_5;
  }
  localRecentsWithoutClient = self->_localRecentsWithoutClient;
  if (localRecentsWithoutClient)
  {
    v9 = localRecentsWithoutClient;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v9;
  v6 = 0;
LABEL_10:
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __59__UIKeyboardEmojiPreferences_emojiWithoutDuplicateRecents___block_invoke;
  v18 = &unk_1E16D5B48;
  v19 = v7;
  v20 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v12, v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __59__UIKeyboardEmojiPreferences_emojiWithoutDuplicateRecents___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id EMFEmojiTokenClass_0;
  void *v9;
  int v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "emojiString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v3;
  }
  else
  {
    EMFEmojiTokenClass_0 = getEMFEmojiTokenClass_0();
    objc_msgSend(v5, "emojiString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(EMFEmojiTokenClass_0, "emojiTokenWithString:localeData:", v9, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(void **)(a1 + 40);
  }
  v10 = objc_msgSend(v7, "containsObject:", v6);

  return v10 ^ 1u;
}

- (NSDictionary)skinToneBaseKeyPreferences
{
  return 0;
}

- (BOOL)hasLastUsedVariantForEmojiString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(getEMFEmojiTokenClass_0(), "emojiTokenWithString:localeData:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardEmojiPreferences preferencesClient](self, "preferencesClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "hasLastUsedVariantForEmoji:", v5);

  return (char)v4;
}

- (id)lastUsedVariantEmojiForEmojiString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(getEMFEmojiTokenClass_0(), "emojiTokenWithString:localeData:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "supportsSkinToneVariants") & 1) != 0)
  {
    -[UIKeyboardEmojiPreferences preferencesClient](self, "preferencesClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastUsedVariantEmojiForEmoji:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "string");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v4;
  }

  return v8;
}

- (int64_t)selectedCategoryType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIKeyboardEmojiPreferences preferencesClient](self, "preferencesClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previouslyUsedCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[UIKeyboardEmojiCategory emojiCategoryTypeForCategoryString:](UIKeyboardEmojiCategory, "emojiCategoryTypeForCategoryString:", v3);

  return v4;
}

- (void)emojiUsed:(id)a3
{
  -[UIKeyboardEmojiPreferences emojiUsed:language:](self, "emojiUsed:language:", a3, 0);
}

- (void)emojiUsed:(id)a3 language:(id)a4
{
  -[UIKeyboardEmojiPreferences emojiUsed:language:completion:](self, "emojiUsed:language:completion:", a3, a4, 0);
}

- (void)emojiUsed:(id)a3 language:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *clientDispatchQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  TIStatisticGetKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

  clientDispatchQueue = self->_clientDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__UIKeyboardEmojiPreferences_emojiUsed_language_completion___block_invoke;
  block[3] = &unk_1E16B47A8;
  block[4] = self;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  dispatch_async(clientDispatchQueue, block);

}

void __60__UIKeyboardEmojiPreferences_emojiUsed_language_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "emojiString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = 0;
  objc_msgSend(v2, "_usageForEmoji:language:associatedText:resultIndex:isFromRecentsCategory:isFromEmojiSearch:isFromCandidateBar:completionHandler:", v4, *(_QWORD *)(a1 + 48), 0, 0, objc_msgSend(*(id *)(a1 + 40), "isFromRecentsCategory"), objc_msgSend(*(id *)(a1 + 40), "isFromEmojiSearch"), v3, 0);

}

- (void)emojiPredicted:(id)a3 typingName:(id)a4 language:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v12 = a3;
  TIStatisticGetKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

  LOBYTE(v11) = 1;
  -[UIKeyboardEmojiPreferences _usageForEmoji:language:associatedText:resultIndex:isFromRecentsCategory:isFromEmojiSearch:isFromCandidateBar:completionHandler:](self, "_usageForEmoji:language:associatedText:resultIndex:isFromRecentsCategory:isFromEmojiSearch:isFromCandidateBar:completionHandler:", v12, v8, v9, 0, 0, 0, v11, 0);

}

- (id)typingNameForEmoji:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (a4)
  {
    v7 = a4;
    objc_msgSend(getEMFEmojiLocaleDataClass(), "emojiLocaleDataWithLocaleIdentifier:", v7);
    a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(getEMFEmojiTokenClass_0(), "emojiTokenWithString:localeData:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiPreferences preferencesClient](self, "preferencesClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "typingNameForEmoji:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)emojiUsedFromEmojiKeyboardPalette:(id)a3 inputModeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *clientDispatchQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  TIStatisticGetKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

  clientDispatchQueue = self->_clientDispatchQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __102__UIKeyboardEmojiPreferences_emojiUsedFromEmojiKeyboardPalette_inputModeIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E16B4420;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(clientDispatchQueue, v16);

}

void __102__UIKeyboardEmojiPreferences_emojiUsedFromEmojiKeyboardPalette_inputModeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "emojiString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = 0;
  objc_msgSend(v2, "_usageForEmoji:language:associatedText:resultIndex:isFromRecentsCategory:isFromEmojiSearch:isFromCandidateBar:completionHandler:", v4, *(_QWORD *)(a1 + 48), 0, 0, objc_msgSend(*(id *)(a1 + 40), "isFromRecentsCategory"), 0, v3, *(_QWORD *)(a1 + 56));

}

- (void)emojiUsedFromEmojiKeyboardSearch:(id)a3 inputModeIdentifier:(id)a4 resultIndex:(id)a5 query:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *clientDispatchQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  clientDispatchQueue = self->_clientDispatchQueue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __119__UIKeyboardEmojiPreferences_emojiUsedFromEmojiKeyboardSearch_inputModeIdentifier_resultIndex_query_completionHandler___block_invoke;
  v23[3] = &unk_1E16D5B70;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v15;
  v27 = v14;
  v28 = v16;
  v18 = v16;
  v19 = v14;
  v20 = v15;
  v21 = v13;
  v22 = v12;
  dispatch_async(clientDispatchQueue, v23);

}

void __119__UIKeyboardEmojiPreferences_emojiUsedFromEmojiKeyboardSearch_inputModeIdentifier_resultIndex_query_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "emojiString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = 0;
  objc_msgSend(v2, "_usageForEmoji:language:associatedText:resultIndex:isFromRecentsCategory:isFromEmojiSearch:isFromCandidateBar:completionHandler:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0, 1, v3, *(_QWORD *)(a1 + 72));

}

- (void)_usageForEmoji:(id)a3 language:(id)a4 associatedText:(id)a5 resultIndex:(id)a6 isFromRecentsCategory:(BOOL)a7 isFromEmojiSearch:(BOOL)a8 isFromCandidateBar:(BOOL)a9 completionHandler:(id)a10
{
  _BOOL4 v10;
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  void *v28;
  id v29;
  id v30;

  v10 = a8;
  v11 = a7;
  v30 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a10;
  if (v16)
  {
    objc_msgSend(getEMFEmojiLocaleDataClass(), "emojiLocaleDataWithLocaleIdentifier:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(getEMFEmojiTokenClass_0(), "emojiTokenWithString:localeData:", v30, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v29 = v18;
    v22 = v17;
    v23 = v11;
    -[UIKeyboardEmojiPreferences preferencesClient](self, "preferencesClient");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v10)
    {
      v17 = v22;
      v26 = v22;
      v18 = v29;
      objc_msgSend(v24, "didUseEmojiInEmojiKeyboardSearch:finalQuery:resultIndex:", v21, v26, v29);
    }
    else if (a9)
    {
      v27 = objc_opt_respondsToSelector();

      -[UIKeyboardEmojiPreferences preferencesClient](self, "preferencesClient");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v28;
      v17 = v22;
      v18 = v29;
      if ((v27 & 1) != 0)
        objc_msgSend(v28, "didUseEmojiInKeyboardCandidateBar:candidatePosition:replacementContext:", v21, v29, v17);
      else
        objc_msgSend(v28, "didUseEmojiInKeyboardCandidateBar:replacementContext:", v21, v17);
    }
    else
    {
      objc_msgSend(v24, "didUseEmojiInEmojiKeyboardPalette:wasFromRecentsSection:", v21, v23);
      v17 = v22;
      v18 = v29;
    }

    if (v19)
      dispatch_async(MEMORY[0x1E0C80D38], v19);
  }

}

- (void)_updateCachedDeviceLockState
{
  id v3;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self->_deviceWasLockedWhenKeyboardWasShown = objc_msgSend(v3, "deviceStateIsLocked");

}

- (BOOL)hasCheckedMemojiPreference
{
  return self->_hasCheckedMemojiPreference;
}

- (void)setHasCheckedMemojiPreference:(BOOL)a3
{
  self->_hasCheckedMemojiPreference = a3;
}

- (BOOL)supportsMemoji
{
  return self->_supportsMemoji;
}

- (void)setSupportsMemoji:(BOOL)a3
{
  self->_supportsMemoji = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localRecentsWithoutClient, 0);
  objc_storeStrong((id *)&self->_localRecentsWithClient, 0);
  objc_storeStrong((id *)&self->_clientDispatchQueue, 0);
  objc_storeStrong((id *)&self->_preferencesClient, 0);
}

@end
