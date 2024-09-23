@implementation _UIFeedbackPreferences

- (_UIFeedbackPreferences)init
{
  _UIFeedbackPreferences *v2;
  _UIFeedbackPreferences *v3;
  uint64_t v4;
  NSMutableDictionary *enabledFeedbackTypes;
  uint64_t v6;
  NSDictionary *defaultFeedbackTypes;
  _UIFeedbackPreferences *v8;
  objc_super v10;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)_UIFeedbackPreferences;
  v2 = -[_UIFeedbackPreferences init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UIFeedbackPreferences setUserDefaults:](v2, "setUserDefaults:", 0);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    enabledFeedbackTypes = v3->_enabledFeedbackTypes;
    v3->_enabledFeedbackTypes = (NSMutableDictionary *)v4;

    v11[0] = CFSTR("effects");
    v11[1] = CFSTR("keyboard");
    v12[0] = &unk_1E1A97A40;
    v12[1] = &unk_1E1A97A40;
    v11[2] = CFSTR("lock");
    v11[3] = CFSTR("effects-keyboardclicks");
    v12[2] = &unk_1E1A97A40;
    v12[3] = &unk_1E1A97A40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
    v6 = objc_claimAutoreleasedReturnValue();
    defaultFeedbackTypes = v3->_defaultFeedbackTypes;
    v3->_defaultFeedbackTypes = (NSDictionary *)v6;

    -[_UIFeedbackPreferences _startObservingDefaults](v3, "_startObservingDefaults");
    v8 = v3;
  }

  return v3;
}

- (void)setUserDefaults:(id)a3
{
  NSUserDefaults *v4;
  NSUserDefaults *userDefaults;

  v4 = (NSUserDefaults *)a3;
  if (!v4)
    v4 = (NSUserDefaults *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.preferences.sounds"));
  userDefaults = self->_userDefaults;
  self->_userDefaults = v4;

}

+ (id)sharedPreferences
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43___UIFeedbackPreferences_sharedPreferences__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_1030 != -1)
    dispatch_once(&_MergedGlobals_1030, block);
  return (id)qword_1ECD7D900;
}

- (unint64_t)enabledFeedbackTypesForCategory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[_UIFeedbackPreferences _categoryForNullableCategory:](self, "_categoryForNullableCategory:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_enabledFeedbackTypes, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[_UIFeedbackPreferences _setEnabledFeedbackTypes:forCategory:postNotification:](self, "_setEnabledFeedbackTypes:forCategory:postNotification:", -[_UIFeedbackPreferences _enabledFeedbackTypesForCategory:](self, "_enabledFeedbackTypesForCategory:", v4), v4, 0);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_enabledFeedbackTypes, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

- (id)_categoryForNullableCategory:(id)a3
{
  if (a3)
    return a3;
  else
    return CFSTR("effects");
}

- (void)_setEnabledFeedbackTypes:(unint64_t)a3 forCategory:(id)a4 postNotification:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = a5;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  objc_msgSend(v8, "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_enabledFeedbackTypes, "setObject:forKeyedSubscript:", v10, v9);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("_UIFeedbackPreferencesDidChangeNotification"), self);

  }
}

- (void)_startObservingDefaults
{
  void (**v3)(void *, _QWORD, uint64_t);
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD aBlock[5];
  _BYTE v16[128];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49___UIFeedbackPreferences__startObservingDefaults__block_invoke;
  aBlock[3] = &unk_1E16C5E88;
  aBlock[4] = self;
  v3 = (void (**)(void *, _QWORD, uint64_t))_Block_copy(aBlock);
  v17[0] = CFSTR("effects");
  v17[1] = CFSTR("keyboard");
  v17[2] = CFSTR("lock");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        v3[2](v3, v9, 1);
        v3[2](v3, v9, 2);
        v3[2](v3, v9, 4);
        v3[2](v3, v9, 8);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", (_QWORD)v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__accessibilityForceTouchChanged_, CFSTR("UIAccessibilityForceTouchStatusChangedNotification"), 0);

}

- (id)_defaultKeyForCategoryKey:(id)a3 type:(unint64_t)a4
{
  const __CFString *v4;
  const __CFString *v5;

  v4 = CFSTR("pencil-haptic");
  v5 = CFSTR("haptic");
  if (a4 == 8)
    v5 = CFSTR("trackpad-haptic");
  if (a4 != 4)
    v4 = v5;
  if (a4 == 1)
    v4 = CFSTR("audio");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), a3, v4);
}

- (unint64_t)_defaultFeedbackTypesForCategory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v17;

  -[_UIFeedbackPreferences _categoryForNullableCategory:](self, "_categoryForNullableCategory:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFeedbackPreferences _categoryKeyForCategory:type:](self, "_categoryKeyForCategory:type:", v4, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFeedbackPreferences _categoryKeyForCategory:type:](self, "_categoryKeyForCategory:type:", v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFeedbackPreferences _categoryKeyForCategory:type:](self, "_categoryKeyForCategory:type:", v4, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFeedbackPreferences _categoryKeyForCategory:type:](self, "_categoryKeyForCategory:type:", v4, 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_defaultFeedbackTypes, "objectForKeyedSubscript:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  -[NSDictionary objectForKeyedSubscript:](self->_defaultFeedbackTypes, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue") & 4 | v9 & 1;
  -[NSDictionary objectForKeyedSubscript:](self->_defaultFeedbackTypes, "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue") & 8;
  -[NSDictionary objectForKeyedSubscript:](self->_defaultFeedbackTypes, "objectForKeyedSubscript:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11 | v13 | objc_msgSend(v14, "unsignedIntegerValue") & 2;

  return v15;
}

- (unint64_t)_enabledFeedbackTypesForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  int v17;
  unint64_t v18;
  unint64_t v20;

  v4 = a3;
  -[_UIFeedbackPreferences _categoryKeyForCategory:type:](self, "_categoryKeyForCategory:type:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFeedbackPreferences _categoryKeyForCategory:type:](self, "_categoryKeyForCategory:type:", v4, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFeedbackPreferences _categoryKeyForCategory:type:](self, "_categoryKeyForCategory:type:", v4, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFeedbackPreferences _categoryKeyForCategory:type:](self, "_categoryKeyForCategory:type:", v4, 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[_UIFeedbackPreferences _defaultFeedbackTypesForCategory:](self, "_defaultFeedbackTypesForCategory:", v4);
  -[NSUserDefaults synchronize](self->_userDefaults, "synchronize");
  -[_UIFeedbackPreferences _updateEnabledFeedbackTypes:forKey:type:](self, "_updateEnabledFeedbackTypes:forKey:type:", &v20, v5, 1);
  -[_UIFeedbackPreferences _updateEnabledFeedbackTypes:forKey:type:](self, "_updateEnabledFeedbackTypes:forKey:type:", &v20, v6, 2);
  -[_UIFeedbackPreferences _updateEnabledFeedbackTypes:forKey:type:](self, "_updateEnabledFeedbackTypes:forKey:type:", &v20, v7, 4);
  -[_UIFeedbackPreferences _updateEnabledFeedbackTypes:forKey:type:](self, "_updateEnabledFeedbackTypes:forKey:type:", &v20, v8, 8);
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_feedbackSupportLevel");
  v11 = v20;

  if (v10 <= 1 && (v11 & 1) == 0)
    v20 = 0;
  v12 = (__CFString *)v4;
  v13 = v12;
  if (v12 == CFSTR("3DTouch"))
    goto LABEL_17;
  if (!v12)
    goto LABEL_13;
  v14 = -[__CFString isEqual:](v12, "isEqual:", CFSTR("3DTouch"));

  if (v14)
  {
LABEL_17:
    if (_AXSForceTouchEnabled())
      v20 |= 2uLL;
  }
  v15 = v13;
  if (v15 == CFSTR("effects-keyboardclicks"))
  {
LABEL_12:
    -[_UIFeedbackPreferences _updateEnabledFeedbackTypes:forKey:type:](self, "_updateEnabledFeedbackTypes:forKey:type:", &v20, CFSTR("effects"), 2);
    -[_UIFeedbackPreferences _updateEnabledFeedbackTypes:forKey:type:](self, "_updateEnabledFeedbackTypes:forKey:type:", &v20, CFSTR("keyboard"), 1);
    goto LABEL_14;
  }
  v16 = v15;
  if (!v15)
  {
LABEL_13:

    goto LABEL_14;
  }
  v17 = -[__CFString isEqual:](v15, "isEqual:", CFSTR("effects-keyboardclicks"));

  if (v17)
    goto LABEL_12;
LABEL_14:
  v18 = v20;

  return v18;
}

- (id)_categoryKeyForCategory:(id)a3 type:(unint64_t)a4
{
  __CFString *v5;
  __CFString *v6;
  char v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  int v11;

  v5 = (__CFString *)a3;
  v6 = v5;
  if (v5 == CFSTR("3DTouch"))
  {
    v8 = CFSTR("effects");
    goto LABEL_11;
  }
  if (!v5)
    goto LABEL_10;
  v7 = -[__CFString isEqual:](v5, "isEqual:", CFSTR("3DTouch"));

  v8 = CFSTR("effects");
  if ((v7 & 1) != 0)
    goto LABEL_11;
  v9 = v6;
  if (v9 != CFSTR("effects-keyboardclicks"))
  {
    v10 = v9;
    v11 = -[__CFString isEqual:](v9, "isEqual:", CFSTR("effects-keyboardclicks"));

    if (!v11)
    {
LABEL_10:
      v8 = v6;
      goto LABEL_11;
    }
  }
  if (a4 == 1)
    v8 = CFSTR("keyboard");
LABEL_11:

  return v8;
}

- (void)_updateEnabledFeedbackTypes:(unint64_t *)a3 forKey:(id)a4 type:(unint64_t)a5
{
  id v8;
  __CFString *v9;
  __CFString *v10;
  char v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;

  v8 = a4;
  v15 = v8;
  if (a5 != 1
    || (v9 = (__CFString *)v8, v8 = v15, v9 != CFSTR("effects"))
    && ((v10 = v9) == 0
     || (v11 = -[__CFString isEqual:](v9, "isEqual:", CFSTR("effects")), v10, v8 = v15, (v11 & 1) == 0)))
  {
    -[_UIFeedbackPreferences _defaultKeyForCategoryKey:type:](self, "_defaultKeyForCategoryKey:type:", v8, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (-[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", v12))
        v14 = *a3 | a5;
      else
        v14 = *a3 & ~a5;
      *a3 = v14;
    }

    v8 = v15;
  }

}

- (void)_setEnabledFeedbackTypes:(unint64_t)a3 forCategory:(id)a4
{
  -[_UIFeedbackPreferences _setEnabledFeedbackTypes:forCategory:postNotification:](self, "_setEnabledFeedbackTypes:forCategory:postNotification:", a3, a4, 1);
}

- (void)_invalidate
{
  id v3;

  -[NSMutableDictionary removeAllObjects](self->_enabledFeedbackTypes, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("_UIFeedbackPreferencesDidChangeNotification"), self);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if (self->_userDefaults == a4)
  {
    -[_UIFeedbackPreferences _invalidate](self, "_invalidate", a3);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIFeedbackPreferences;
    -[_UIFeedbackPreferences observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3);
  }
}

- (NSDictionary)defaultFeedbackTypes
{
  return self->_defaultFeedbackTypes;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_defaultFeedbackTypes, 0);
  objc_storeStrong((id *)&self->_enabledFeedbackTypes, 0);
}

@end
