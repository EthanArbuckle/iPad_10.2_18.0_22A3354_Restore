@implementation _UIFeedbackGeneratorConfiguration

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)_setupIfNecessary
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  int v7;
  void *v8;
  uint64_t v9;
  void (**preparationBlock)(id, _UIFeedbackGeneratorConfiguration *);
  void *v11;
  void *v12;

  v3 = -[_UIFeedbackGeneratorConfiguration isSetup](self, "isSetup");
  if (!v3)
  {
    -[_UIFeedbackGeneratorConfiguration setSetup:](self, "setSetup:", 1);
    if (-[_UIFeedbackGeneratorConfiguration requiredSupportLevel](self, "requiredSupportLevel") == -1)
    {
      v6 = 0;
    }
    else
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "_feedbackSupportLevel");
      v6 = v5 >= -[_UIFeedbackGeneratorConfiguration requiredSupportLevel](self, "requiredSupportLevel");

    }
    if (-[_UIFeedbackGeneratorConfiguration requiredPeripheralSupportLevel](self, "requiredPeripheralSupportLevel") == -1)
      v7 = objc_msgSend((id)objc_opt_class(), "_enableHIDFeedbackForAllGenerators") ^ 1;
    else
      v7 = 0;
    if (((v6 | v7) & 1) == 0)
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[UIDevice _peripheralFeedbackSupportLevel]((uint64_t)v8);
      v6 = v9 >= -[_UIFeedbackGeneratorConfiguration requiredPeripheralSupportLevel](self, "requiredPeripheralSupportLevel");

    }
    if ((_UIFeedbackEngineSupportsAll() & 1) != 0 || v6)
    {
      preparationBlock = (void (**)(id, _UIFeedbackGeneratorConfiguration *))self->_preparationBlock;
      if (preparationBlock)
        preparationBlock[2](preparationBlock, self);
      else
        -[_UIFeedbackGeneratorConfiguration setSettingsEnabled:](self, "setSettingsEnabled:", 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIFeedbackPreferences sharedPreferences](_UIFeedbackPreferences, "sharedPreferences");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__preferencesUpdated_, 8077320000, v12);

    }
    else
    {
      -[_UIFeedbackGeneratorConfiguration setSettingsEnabled:](self, "setSettingsEnabled:", 0);
    }
    -[_UIFeedbackGeneratorConfiguration _updateEnabled](self, "_updateEnabled");
  }
  return !v3;
}

+ (id)_configurationWithKey:(id)a3 requiredSupportLevel:(int64_t)a4 preparationBlock:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setActivationStyle:", 2);
  objc_msgSend(v10, "set_stats_key:", v9);

  objc_msgSend(v10, "setPreparationBlock:", v8);
  objc_msgSend(v10, "setSettingsEnabled:", 1);
  objc_msgSend(v10, "setRequiredSupportLevel:", a4);
  return v10;
}

- (void)set_stats_key:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setRequiredSupportLevel:(int64_t)a3
{
  self->_requiredSupportLevel = a3;
}

- (void)setActivationStyle:(int64_t)a3
{
  self->_activationStyle = a3;
}

- (void)setSettingsEnabled:(BOOL)a3
{
  if (self->_settingsEnabled != a3)
  {
    self->_settingsEnabled = a3;
    if (-[_UIFeedbackGeneratorConfiguration isSetup](self, "isSetup"))
      -[_UIFeedbackGeneratorConfiguration _updateEnabled](self, "_updateEnabled");
  }
}

- (void)setOutputMode:(int64_t)a3
{
  if (self->_outputMode != a3)
  {
    self->_outputMode = a3;
    if (-[_UIFeedbackGeneratorConfiguration isSetup](self, "isSetup"))
      -[_UIFeedbackGeneratorConfiguration _updateEnabled](self, "_updateEnabled");
  }
}

- (BOOL)isSetup
{
  return self->_setup;
}

- (void)setPreparationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (_UIFeedbackGeneratorConfiguration)init
{
  _UIFeedbackGeneratorConfiguration *v2;
  objc_class *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFeedbackGeneratorConfiguration;
  v2 = -[_UIFeedbackGeneratorConfiguration init](&v6, sel_init);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFeedbackGeneratorConfiguration set_stats_key:](v2, "set_stats_key:", v4);

  -[_UIFeedbackGeneratorConfiguration setOutputMode:](v2, "setOutputMode:", 1);
  -[_UIFeedbackGeneratorConfiguration setRequiredSupportLevel:](v2, "setRequiredSupportLevel:", 0);
  -[_UIFeedbackGeneratorConfiguration setRequiredPeripheralSupportLevel:](v2, "setRequiredPeripheralSupportLevel:", -1);
  return v2;
}

- (void)setRequiredPeripheralSupportLevel:(int64_t)a3
{
  self->_requiredPeripheralSupportLevel = a3;
}

+ (id)_configurationWithKey:(id)a3 preparationBlock:(id)a4
{
  return (id)objc_msgSend(a1, "_configurationWithKey:requiredSupportLevel:preparationBlock:", a3, 0, a4);
}

- (BOOL)defaultEnabled
{
  void *v2;
  BOOL v3;

  +[_UIFeedbackPreferences sharedPreferences](_UIFeedbackPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enabledFeedbackTypesForCategory:", 0) != 0;

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)_updateEnabled
{
  -[_UIFeedbackGeneratorConfiguration setEnabled:](self, "setEnabled:", -[_UIFeedbackGeneratorConfiguration _shouldEnable](self, "_shouldEnable"));
}

- (BOOL)_shouldEnable
{
  int64_t v3;
  int v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[_UIFeedbackGeneratorConfiguration outputMode](self, "outputMode");
  if (!v3)
    goto LABEL_16;
  v4 = v3;
  v5 = -[_UIFeedbackGeneratorConfiguration settingsEnabled](self, "settingsEnabled");
  LOBYTE(v6) = v5;
  if ((~v4 & 3) == 0 || !v5)
    return v6;
  if (-[_UIFeedbackGeneratorConfiguration defaultEnabled](self, "defaultEnabled"))
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  if (!-[_UIFeedbackGeneratorConfiguration isSetup](self, "isSetup"))
  {
LABEL_16:
    LOBYTE(v6) = 0;
    return v6;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[_UIFeedbackGeneratorConfiguration usedFeedbacks](self, "usedFeedbacks", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v7);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "hapticOutputMode");
        if ((~(objc_msgSend(v10, "audioOutputMode") | v11) & 3) == 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_19;
        }
      }
      v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_19:

  return v6;
}

- (int64_t)outputMode
{
  return self->_outputMode;
}

- (BOOL)settingsEnabled
{
  return self->_settingsEnabled;
}

- (void)setSetup:(BOOL)a3
{
  self->_setup = a3;
}

- (int64_t)requiredSupportLevel
{
  return self->_requiredSupportLevel;
}

- (int64_t)requiredPeripheralSupportLevel
{
  return self->_requiredPeripheralSupportLevel;
}

+ (BOOL)_enableHIDFeedbackForAllGenerators
{
  int v2;
  BOOL v3;
  int v5;

  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v2 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (v5 = _UIInternalPreference_EnableHIDFeedbackForAllGenerators,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_EnableHIDFeedbackForAllGenerators))
  {
    v3 = 0;
  }
  else
  {
    do
    {
      v3 = v2 < v5;
      if (v2 < v5)
        break;
      _UIInternalPreferenceSync(v2, &_UIInternalPreference_EnableHIDFeedbackForAllGenerators, (uint64_t)CFSTR("EnableHIDFeedbackForAllGenerators"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      v5 = _UIInternalPreference_EnableHIDFeedbackForAllGenerators;
    }
    while (v2 != _UIInternalPreference_EnableHIDFeedbackForAllGenerators);
  }
  return byte_1EDDA7F84 && v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__stats_key, 0);
  objc_storeStrong((id *)&self->_usage, 0);
  objc_storeStrong((id *)&self->_clientClass, 0);
  objc_storeStrong(&self->_preparationBlock, 0);
  objc_storeStrong((id *)&self->_usedFeedbacks, 0);
}

- (id)tweakedConfigurationForCaller:(id)a3 usage:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[_UIFeedbackGeneratorConfiguration tweakedConfigurationForClass:usage:](self, "tweakedConfigurationForClass:usage:", objc_opt_class(), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_setup)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIFeedbackPreferences sharedPreferences](_UIFeedbackPreferences, "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, 8077320000, v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)_UIFeedbackGeneratorConfiguration;
  -[_UIFeedbackGeneratorConfiguration dealloc](&v5, sel_dealloc);
}

- (NSString)_stats_key
{
  return self->__stats_key;
}

- (id)_updateFeedbackForOutputMode:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  int64_t v7;
  _QWORD v9[7];
  _QWORD v10[3];
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = -[_UIFeedbackGeneratorConfiguration outputMode](self, "outputMode");
  if (v5 == 1)
  {
    v6 = v4;
  }
  else
  {
    v7 = v5;
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__77;
    v16 = __Block_byref_object_dispose__77;
    v17 = v4;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 1;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66___UIFeedbackGeneratorConfiguration__updateFeedbackForOutputMode___block_invoke;
    v9[3] = &unk_1E16C5220;
    v9[5] = v10;
    v9[6] = v7;
    v9[4] = &v12;
    __66___UIFeedbackGeneratorConfiguration__updateFeedbackForOutputMode___block_invoke(v9, 1);
    __66___UIFeedbackGeneratorConfiguration__updateFeedbackForOutputMode___block_invoke(v9, 2);
    v6 = (id)v13[5];
    _Block_object_dispose(v10, 8);
    _Block_object_dispose(&v12, 8);

  }
  return v6;
}

- (NSSet)usedFeedbacks
{
  NSSet *usedFeedbacks;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __objc2_class **v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  __objc2_class **v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  NSSet *v18;
  NSSet *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  usedFeedbacks = self->_usedFeedbacks;
  if (!usedFeedbacks)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[_UIFeedbackGeneratorConfiguration feedbackKeyPaths](self, "feedbackKeyPaths");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      v9 = off_1E167C000;
      v10 = 0x1E0C99000uLL;
      v11 = 0x1E0C99000uLL;
      v21 = v5;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          -[_UIFeedbackGeneratorConfiguration valueForKeyPath:](self, "valueForKeyPath:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v4, "addObject:", v13);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v4, "addObjectsFromArray:", v13);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v13, "allValues");
                  v14 = v9;
                  v15 = v10;
                  v16 = v11;
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "addObjectsFromArray:", v17);

                  v11 = v16;
                  v10 = v15;
                  v9 = v14;
                  v5 = v21;
                }
              }
            }
          }

          ++v12;
        }
        while (v7 != v12);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v7);
    }

    -[_UIFeedbackGeneratorConfiguration _updateFeedbacksForOutputMode:](self, "_updateFeedbacksForOutputMode:", v4);
    v18 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v19 = self->_usedFeedbacks;
    self->_usedFeedbacks = v18;

    usedFeedbacks = self->_usedFeedbacks;
  }
  return usedFeedbacks;
}

- (NSArray)feedbackKeyPaths
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)_updateFeedbacksForOutputMode:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_UIFeedbackGeneratorConfiguration outputMode](self, "outputMode") == 1)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
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
          -[_UIFeedbackGeneratorConfiguration _updateFeedbackForOutputMode:](self, "_updateFeedbackForOutputMode:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  return v5;
}

+ (id)defaultConfiguration
{
  return objc_alloc_init((Class)a1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = objc_msgSend(self->_preparationBlock, "copy");
  v6 = (void *)*((_QWORD *)v4 + 3);
  *((_QWORD *)v4 + 3) = v5;

  objc_storeStrong((id *)v4 + 4, self->_clientClass);
  v7 = -[NSString copy](self->_usage, "copy");
  v8 = (void *)*((_QWORD *)v4 + 5);
  *((_QWORD *)v4 + 5) = v7;

  *((_BYTE *)v4 + 8) = self->_settingsEnabled;
  *((_QWORD *)v4 + 8) = self->_activationStyle;
  *((_QWORD *)v4 + 6) = self->_requiredSupportLevel;
  *((_QWORD *)v4 + 7) = self->_requiredPeripheralSupportLevel;
  *((_QWORD *)v4 + 9) = self->_outputMode;
  v9 = -[NSString copy](self->__stats_key, "copy");
  v10 = (void *)*((_QWORD *)v4 + 10);
  *((_QWORD *)v4 + 10) = v9;

  if (-[_UIFeedbackGeneratorConfiguration isSetup](self, "isSetup"))
  {
    *((_BYTE *)v4 + 9) = 1;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[_UIFeedbackGeneratorConfiguration feedbackKeyPaths](self, "feedbackKeyPaths");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          -[_UIFeedbackGeneratorConfiguration valueForKeyPath:](self, "valueForKeyPath:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v4, "setValue:forKeyPath:", v17, v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v13);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[_UIFeedbackGeneratorConfiguration hidFeedbackPatternNameKeyPaths](self, "hidFeedbackPatternNameKeyPaths", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
          -[_UIFeedbackGeneratorConfiguration valueForKeyPath:](self, "valueForKeyPath:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            objc_msgSend(v4, "setValue:forKeyPath:", v24, v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v20);
    }

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  BOOL v27;
  char v28;
  BOOL v29;
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
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[_UIFeedbackGeneratorConfiguration feedbackKeyPaths](self, "feedbackKeyPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v36 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          -[_UIFeedbackGeneratorConfiguration valueForKeyPath:](self, "valueForKeyPath:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "valueForKeyPath:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v12;
          v15 = v13;
          if (v14 == v15)
          {

          }
          else
          {
            v16 = v15;
            if (v14)
              v17 = v15 == 0;
            else
              v17 = 1;
            if (v17)
            {
LABEL_34:

LABEL_35:
              v29 = 0;
              goto LABEL_36;
            }
            v18 = objc_msgSend(v14, "isEqual:", v15);

            if ((v18 & 1) == 0)
              goto LABEL_35;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v8)
          continue;
        break;
      }
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[_UIFeedbackGeneratorConfiguration hidFeedbackPatternNameKeyPaths](self, "hidFeedbackPatternNameKeyPaths", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v6);
          v23 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
          -[_UIFeedbackGeneratorConfiguration valueForKeyPath:](self, "valueForKeyPath:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "valueForKeyPath:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v24;
          v26 = v25;
          if (v14 == v26)
          {

          }
          else
          {
            v16 = v26;
            if (v14)
              v27 = v26 == 0;
            else
              v27 = 1;
            if (v27)
              goto LABEL_34;
            v28 = objc_msgSend(v14, "isEqual:", v26);

            if ((v28 & 1) == 0)
              goto LABEL_35;
          }
        }
        v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        v29 = 1;
      }
      while (v20);
    }
    else
    {
      v29 = 1;
    }
LABEL_36:

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_isEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  NSStringFromSelector(sel_activationStyle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  NSStringFromSelector(sel_requiredSupportLevel);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)descriptionKey
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;

  if (self->_clientClass && -[NSString length](self->_usage, "length"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass(self->_clientClass);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v4, self->_usage);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSArray)hidFeedbackPatternNameKeyPaths
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_enableHIDFeedbackForAllGenerators")
    && (objc_opt_respondsToSelector() & 1) == 0)
  {
    +[_UIFeedbackBackBoardHIDPattern feedbackPatternWithName:deviceType:senderID:](_UIFeedbackBackBoardHIDPattern, "feedbackPatternWithName:deviceType:senderID:", 0x1E1720800, a4, a5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v7;
  }
  v9 = v8;

  return v9;
}

+ (id)_disabledConfiguration
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setSettingsEnabled:", 0);
  return v2;
}

- (id)preparationBlock
{
  return self->_preparationBlock;
}

- (Class)clientClass
{
  return self->_clientClass;
}

- (void)setClientClass:(Class)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)usage
{
  return self->_usage;
}

- (void)setUsage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)activationStyle
{
  return self->_activationStyle;
}

@end
