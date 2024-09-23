@implementation WGWidgetVisibilityManager

- (void)_widgetVisibilityPreferencesChanged
{
  if (-[WGWidgetVisibilityManager _updateWidgetVisibilityPreferences](self, "_updateWidgetVisibilityPreferences"))
    -[WGWidgetVisibilityManager _widgetVisibilityChanged](self, "_widgetVisibilityChanged");
}

- (BOOL)_updateWidgetVisibilityPreferences
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_visibilityOverridenIdentifiers;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 |= -[WGWidgetVisibilityManager _updateWidgetVisibilityPreference:](self, "_updateWidgetVisibilityPreference:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6 & 1;
}

- (BOOL)_updateWidgetVisibilityPreference:(id)a3
{
  __CFString *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  _BOOL8 v9;
  int v10;
  NSMutableDictionary *visibilityPreferenceByIdentifier;
  void *v12;
  char v13;
  Boolean keyExistsAndHasValidFormat;

  v4 = (__CFString *)a3;
  -[NSMutableDictionary objectForKey:](self->_visibilityPreferenceByIdentifier, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");
  keyExistsAndHasValidFormat = 0;
  if (_os_feature_enabled_impl()
    && (WGWidgetVisibilityManagerFirstPartyAvocadoBlackList(),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsObject:", v4),
        v7,
        v8))
  {
    v9 = 0;
    keyExistsAndHasValidFormat = 1;
  }
  else
  {
    v9 = CFPreferencesGetAppBooleanValue(CFSTR("SBIconVisibility"), v4, &keyExistsAndHasValidFormat) != 0;
    v10 = keyExistsAndHasValidFormat;
    if (!keyExistsAndHasValidFormat)
      goto LABEL_6;
  }
  visibilityPreferenceByIdentifier = self->_visibilityPreferenceByIdentifier;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](visibilityPreferenceByIdentifier, "setObject:forKey:", v12, v4);

  v10 = keyExistsAndHasValidFormat;
LABEL_6:
  v13 = v10 != (v5 != 0) || v6 != v9;

  return v13;
}

- (WGWidgetVisibilityManager)init
{
  WGWidgetVisibilityManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *widgetTagsByIdentifier;
  NSMutableDictionary *v5;
  NSMutableDictionary *extensionHashByIdentifier;
  NSMutableDictionary *v7;
  NSMutableDictionary *mobileGestaltAnswerByWidgetTag;
  NSMutableSet *v9;
  NSMutableSet *mobileGestaltQuestions;
  NSMutableDictionary *v11;
  NSMutableDictionary *visibilityDefaultValueByIdentifier;
  NSMutableSet *v13;
  NSMutableSet *visibilityOverridenIdentifiers;
  NSMutableDictionary *v15;
  NSMutableDictionary *visibilityPreferenceByIdentifier;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)WGWidgetVisibilityManager;
  v2 = -[WGWidgetVisibilityManager init](&v18, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    widgetTagsByIdentifier = v2->_widgetTagsByIdentifier;
    v2->_widgetTagsByIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    extensionHashByIdentifier = v2->_extensionHashByIdentifier;
    v2->_extensionHashByIdentifier = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mobileGestaltAnswerByWidgetTag = v2->_mobileGestaltAnswerByWidgetTag;
    v2->_mobileGestaltAnswerByWidgetTag = v7;

    v2->_mobileGestaltNotificationToken = (MGNotificationTokenStruct *)-1;
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mobileGestaltQuestions = v2->_mobileGestaltQuestions;
    v2->_mobileGestaltQuestions = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    visibilityDefaultValueByIdentifier = v2->_visibilityDefaultValueByIdentifier;
    v2->_visibilityDefaultValueByIdentifier = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    visibilityOverridenIdentifiers = v2->_visibilityOverridenIdentifiers;
    v2->_visibilityOverridenIdentifiers = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    visibilityPreferenceByIdentifier = v2->_visibilityPreferenceByIdentifier;
    v2->_visibilityPreferenceByIdentifier = v15;

    -[WGWidgetVisibilityManager _registerForVisiblityPreferenceChanges](v2, "_registerForVisiblityPreferenceChanges");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_mobileGestaltNotificationToken != (MGNotificationTokenStruct *)-1)
    MGCancelNotifications();
  -[WGWidgetVisibilityManager _unregisterForVisiblityPreferenceChanges](self, "_unregisterForVisiblityPreferenceChanges");
  v3.receiver = self;
  v3.super_class = (Class)WGWidgetVisibilityManager;
  -[WGWidgetVisibilityManager dealloc](&v3, sel_dealloc);
}

- (BOOL)isWidgetWithIdentifierVisible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  char v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  -[NSMutableDictionary objectForKey:](self->_widgetTagsByIdentifier, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__WGWidgetVisibilityManager_isWidgetWithIdentifierVisible___block_invoke;
  v13[3] = &unk_24D731440;
  v13[4] = self;
  v13[5] = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v13);
  if (*((_BYTE *)v15 + 24)
    && -[NSMutableSet containsObject:](self->_visibilityOverridenIdentifiers, "containsObject:", v4))
  {
    -[NSMutableDictionary objectForKey:](self->_visibilityPreferenceByIdentifier, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "BOOLValue");
      *((_BYTE *)v15 + 24) = v8;
    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_visibilityDefaultValueByIdentifier, "objectForKey:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");
      *((_BYTE *)v15 + 24) = v10;

    }
  }
  v11 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __59__WGWidgetVisibilityManager_isWidgetWithIdentifierVisible___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  char v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    if (a4)
      *a4 = 1;
  }
}

- (void)updateVisibilityForExtensions:(id)a3
{
  -[WGWidgetVisibilityManager _updateWidgetTagsAndVisibilityForExtensions:](self, "_updateWidgetTagsAndVisibilityForExtensions:", a3);
  -[WGWidgetVisibilityManager _updateMobileGestaltQuestions](self, "_updateMobileGestaltQuestions");
}

- (void)setDelegate:(id)a3
{
  WGWidgetVisibilityDelegate **p_delegate;
  id v5;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_delegateRespondsToWidgetVisibilityDidChange = p_delegate & 1;
}

- (id)_widgetTagsForWidgetExtensionInfoDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("SBAppTags"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && MGIsQuestionValid())
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_allWidgetTags
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableDictionary count](self->_widgetTagsByIdentifier, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSMutableDictionary allValues](self->_widgetTagsByIdentifier, "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_updateWidgetTagsAndVisibilityForExtensions:(id)a3
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
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary allKeys](self->_extensionHashByIdentifier, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_extensionHashByIdentifier, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "hash"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqual:", v14) & 1) == 0)
          -[WGWidgetVisibilityManager _updateWidgetTagsAndIconVisibilityForExtension:](self, "_updateWidgetTagsAndIconVisibilityForExtension:", v11);
        -[NSMutableDictionary setObject:forKey:](self->_extensionHashByIdentifier, "setObject:forKey:", v14, v12);
        objc_msgSend(v6, "removeObject:", v12);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        -[NSMutableSet removeObject:](self->_visibilityOverridenIdentifiers, "removeObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v17);
  }

  -[NSMutableDictionary removeObjectsForKeys:](self->_widgetTagsByIdentifier, "removeObjectsForKeys:", v15);
  -[NSMutableDictionary removeObjectsForKeys:](self->_extensionHashByIdentifier, "removeObjectsForKeys:", v15);
  -[NSMutableDictionary removeObjectsForKeys:](self->_visibilityDefaultValueByIdentifier, "removeObjectsForKeys:", v15);
  -[NSMutableDictionary removeObjectsForKeys:](self->_visibilityPreferenceByIdentifier, "removeObjectsForKeys:", v15);

}

- (void)_updateWidgetTagsAndIconVisibilityForExtension:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  NSMutableDictionary *visibilityDefaultValueByIdentifier;
  void *v14;
  void *v15;
  int v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.")))
  {
    objc_msgSend(v17, "infoDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[WGWidgetVisibilityManager _widgetTagsForWidgetExtensionInfoDictionary:](self, "_widgetTagsForWidgetExtensionInfoDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[NSMutableDictionary setObject:forKey:](self->_widgetTagsByIdentifier, "setObject:forKey:", v6, v4);
  objc_msgSend(v5, "objectForKey:", CFSTR("SBIconVisibilitySetByAppPreference"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    -[NSMutableSet addObject:](self->_visibilityOverridenIdentifiers, "addObject:", v4);
    objc_msgSend(v5, "objectForKey:", CFSTR("SBIconVisibilityDefaultVisible"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[NSMutableDictionary setObject:forKey:](self->_visibilityDefaultValueByIdentifier, "setObject:forKey:", v9, v4);
    }
    else
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("SBIconVisibilityDefaultVisibleInstallTypes"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((MGGetBoolAnswer() & 1) != 0)
        {
          v11 = CFSTR("internal");
        }
        else if (MGGetBoolAnswer())
        {
          v11 = CFSTR("carrier");
        }
        else
        {
          v11 = CFSTR("user");
        }
        v12 = objc_msgSend(v10, "containsObject:", v11);
        visibilityDefaultValueByIdentifier = self->_visibilityDefaultValueByIdentifier;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](visibilityDefaultValueByIdentifier, "setObject:forKey:", v14, v4);

      }
    }
    -[WGWidgetVisibilityManager _updateWidgetVisibilityPreference:](self, "_updateWidgetVisibilityPreference:", v4);

  }
  if (_os_feature_enabled_impl())
  {
    WGWidgetVisibilityManagerFirstPartyAvocadoBlackList();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", v4);

    if (v16)
    {
      -[NSMutableSet addObject:](self->_visibilityOverridenIdentifiers, "addObject:", v4);
      -[WGWidgetVisibilityManager _updateWidgetVisibilityPreference:](self, "_updateWidgetVisibilityPreference:", v4);
    }
  }

}

- (void)_updateMobileGestaltQuestions
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  const __CFBoolean *v10;
  const __CFBoolean *v11;
  CFTypeID v12;
  _BOOL8 v13;
  NSMutableDictionary *mobileGestaltAnswerByWidgetTag;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void *v23;
  id v24;
  id location;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[WGWidgetVisibilityManager _allWidgetTags](self, "_allWidgetTags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet isEqualToSet:](self->_mobileGestaltQuestions, "isEqualToSet:", v3) & 1) == 0)
  {
    -[NSMutableDictionary removeAllObjects](self->_mobileGestaltAnswerByWidgetTag, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->_mobileGestaltQuestions, "removeAllObjects");
    if (self->_mobileGestaltNotificationToken != (MGNotificationTokenStruct *)-1)
      MGCancelNotifications();
    if (objc_msgSend(v3, "count"))
    {
      -[NSMutableSet unionSet:](self->_mobileGestaltQuestions, "unionSet:", v3);
      objc_initWeak(&location, self);
      -[NSMutableSet allObjects](self->_mobileGestaltQuestions, "allObjects");
      v4 = MEMORY[0x24BDAC9B8];
      v20 = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __58__WGWidgetVisibilityManager__updateMobileGestaltQuestions__block_invoke;
      v23 = &unk_24D731468;
      objc_copyWeak(&v24, &location);
      self->_mobileGestaltNotificationToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();

      objc_msgSend(v3, "allObjects");
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v5 = (id)MGCopyMultipleAnswers();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v17 != v7)
              objc_enumerationMutation(v5);
            v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
            v10 = (const __CFBoolean *)objc_msgSend(v5, "objectForKey:", v9);
            v11 = v10;
            if (v10)
            {
              v12 = CFGetTypeID(v10);
              v13 = v12 == CFBooleanGetTypeID() && CFBooleanGetValue(v11) != 0;
              mobileGestaltAnswerByWidgetTag = self->_mobileGestaltAnswerByWidgetTag;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](mobileGestaltAnswerByWidgetTag, "setObject:forKey:", v15, v9);

            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
        }
        while (v6);
      }

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_mobileGestaltNotificationToken = (MGNotificationTokenStruct *)-1;
    }
  }

}

void __58__WGWidgetVisibilityManager__updateMobileGestaltQuestions__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  const void *v5;
  void *v6;
  void *v7;
  int v8;
  CFTypeID v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  id WeakRetained;

  v4 = MGCopyAnswer();
  if (v4)
  {
    v5 = (const void *)v4;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_mobileGestaltAnswerByWidgetTag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    v9 = CFGetTypeID(v5);
    if (v9 == CFBooleanGetTypeID())
    {
      v10 = CFBooleanGetValue((CFBooleanRef)v5) != 0;
      if (v8 == v10)
        goto LABEL_9;
    }
    else
    {
      if ((v8 & 1) == 0)
      {
LABEL_9:
        CFRelease(v5);

        return;
      }
      v10 = 0;
    }
    objc_msgSend(WeakRetained, "_mobileGestaltAnswerByWidgetTag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, a2);

    objc_msgSend(WeakRetained, "_widgetVisibilityChanged");
    goto LABEL_9;
  }
}

- (void)_registerForVisiblityPreferenceChanges
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)NCWidgetVisibilityPreferencesChanged, CFSTR("com.apple.springboard.appIconVisibilityPreferencesChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_unregisterForVisiblityPreferenceChanges
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.springboard.appIconVisibilityPreferencesChanged"), 0);
}

- (void)_widgetVisibilityChanged
{
  id WeakRetained;

  if (self->_delegateRespondsToWidgetVisibilityDidChange)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "widgetVisibilityDidChange");

  }
}

- (WGWidgetVisibilityDelegate)delegate
{
  return (WGWidgetVisibilityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableDictionary)_mobileGestaltAnswerByWidgetTag
{
  return self->_mobileGestaltAnswerByWidgetTag;
}

- (void)setMobileGestaltAnswerByWidgetTag:(id)a3
{
  objc_storeStrong((id *)&self->_mobileGestaltAnswerByWidgetTag, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mobileGestaltQuestions, 0);
  objc_storeStrong((id *)&self->_visibilityOverridenIdentifiers, 0);
  objc_storeStrong((id *)&self->_visibilityPreferenceByIdentifier, 0);
  objc_storeStrong((id *)&self->_visibilityDefaultValueByIdentifier, 0);
  objc_storeStrong((id *)&self->_mobileGestaltAnswerByWidgetTag, 0);
  objc_storeStrong((id *)&self->_extensionHashByIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetTagsByIdentifier, 0);
}

@end
