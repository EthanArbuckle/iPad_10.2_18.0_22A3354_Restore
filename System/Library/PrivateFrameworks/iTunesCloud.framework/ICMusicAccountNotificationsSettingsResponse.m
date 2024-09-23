@implementation ICMusicAccountNotificationsSettingsResponse

- (ICMusicAccountNotificationsSettingsResponse)initWithResponseDictionary:(id)a3
{
  id v5;
  ICMusicAccountNotificationsSettingsResponse *v6;
  ICMusicAccountNotificationsSettingsResponse *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICMusicAccountNotificationsSettingsResponse;
  v6 = -[ICMusicAccountNotificationsSettingsResponse init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_responseDictionary, a3);
    v7->_wasSuccessful = 0;
    objc_msgSend(v5, "objectForKey:", CFSTR("status"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      v7->_wasSuccessful = objc_msgSend(v8, "isEqualToString:", CFSTR("success"));

  }
  return v7;
}

- (NSArray)settingsSwitches
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  ICMusicAccountNotificationsSettingsSwitch *v16;
  ICMusicAccountNotificationsSettingsSwitch *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("sections"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_NSIsNSArray() || !objc_msgSend(v4, "count"))
    goto LABEL_18;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _NSIsNSDictionary();

  v7 = 0;
  if (!v6)
    goto LABEL_19;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("sectionId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.Music.main")) & 1) == 0)
  {

LABEL_18:
    v7 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("settings"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 && _NSIsNSArray())
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v7;
    v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v7);
          v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14);
          if (_NSIsNSDictionary())
          {
            v16 = [ICMusicAccountNotificationsSettingsSwitch alloc];
            v17 = -[ICMusicAccountNotificationsSettingsSwitch initWithItemResponseDictionary:](v16, "initWithItemResponseDictionary:", v15, (_QWORD)v19);
            objc_msgSend(v3, "addObject:", v17);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

  }
LABEL_19:

  return (NSArray *)v3;
}

- (BOOL)wasSuccessful
{
  return self->_wasSuccessful;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

+ (id)createResponseBodyWithSwitches:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, ICMusicAccountNotificationsSettingsSwitchIdentifierKey);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "isToggled"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, ICMusicAccountNotificationsSettingsSwitchIsToggledKey);

        objc_msgSend(v4, "addObject:", v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v4, CFSTR("settings"), 0);
  return v13;
}

@end
