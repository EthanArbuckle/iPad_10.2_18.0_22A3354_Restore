@implementation _UIPrototypingSettingsManager

+ (id)sharedManager
{
  if (qword_1ECD81D98 != -1)
    dispatch_once(&qword_1ECD81D98, &__block_literal_global_588);
  return (id)_MergedGlobals_1274;
}

- (_UIPrototypingSettingsManager)init
{
  _UIPrototypingSettingsManager *v2;
  uint64_t v3;
  NSMutableDictionary *storedSettings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPrototypingSettingsManager;
  v2 = -[_UIPrototypingSettingsManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    storedSettings = v2->_storedSettings;
    v2->_storedSettings = (NSMutableDictionary *)v3;

    -[_UIPrototypingSettingsManager synchronizeStoredSettings](v2, "synchronizeStoredSettings");
  }
  return v2;
}

- (id)settingOfType:(int64_t)a3 withName:(id)a4
{
  id v6;
  void *v7;
  _UIPrototypingValue *v8;
  void *v9;

  v6 = a4;
  -[_UIPrototypingSettingsManager storedSettings](self, "storedSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (_UIPrototypingValue *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = objc_alloc_init(_UIPrototypingValue);
    -[_UIPrototypingValue setType:](v8, "setType:", a3);
    -[_UIPrototypingValue setName:](v8, "setName:", v6);
    -[_UIPrototypingSettingsManager storedSettings](self, "storedSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

  }
  return v8;
}

- (NSArray)allSettings
{
  void *v2;
  void *v3;

  -[_UIPrototypingSettingsManager storedSettings](self, "storedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)synchronizeStoredSettings
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("_UIKitStoredPrototypingValues"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58___UIPrototypingSettingsManager_synchronizeStoredSettings__block_invoke;
    v12[3] = &unk_1E16C55B8;
    v12[4] = self;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPrototypingSettingsManager storedSettings](self, "storedSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __58___UIPrototypingSettingsManager_synchronizeStoredSettings__block_invoke_2;
  v10[3] = &unk_1E16E7D70;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("_UIKitStoredPrototypingValues"));

}

- (void)deleteAllStoredSettings
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("_UIKitStoredPrototypingValues"));

  -[_UIPrototypingSettingsManager storedSettings](self, "storedSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (NSMutableDictionary)storedSettings
{
  return self->_storedSettings;
}

- (void)setStoredSettings:(id)a3
{
  objc_storeStrong((id *)&self->_storedSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedSettings, 0);
}

@end
