@implementation TIPreferencesAnalyzerRegistry

- (TIPreferencesAnalyzerRegistry)init
{
  TIPreferencesAnalyzerRegistry *v2;
  NSMutableArray *v3;
  NSMutableArray *registry;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIPreferencesAnalyzerRegistry;
  v2 = -[TIPreferencesAnalyzerRegistry init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    registry = v2->_registry;
    v2->_registry = v3;

    v5 = *MEMORY[0x1E0DBE1D8];
    v6 = MEMORY[0x1E0C9AAB0];
    -[TIPreferencesAnalyzerRegistry _registerPreference:domain:defaultValue:reportingMode:](v2, "_registerPreference:domain:defaultValue:reportingMode:", *MEMORY[0x1E0DBE1D8], CFSTR("com.apple.keyboard.preferences"), MEMORY[0x1E0C9AAB0], 2);
    -[TIPreferencesAnalyzerRegistry _registerPreference:domain:defaultValue:reportingMode:](v2, "_registerPreference:domain:defaultValue:reportingMode:", *MEMORY[0x1E0DBE450], CFSTR("com.apple.InputModePreferences"), v6, 1);
    -[TIPreferencesAnalyzerRegistry _registerPreference:domain:defaultValue:reportingMode:](v2, "_registerPreference:domain:defaultValue:reportingMode:", v5, CFSTR("com.apple.keyboard.preferences"), v6, 1);
    -[TIPreferencesAnalyzerRegistry _registerPreference:domain:defaultValue:reportingMode:](v2, "_registerPreference:domain:defaultValue:reportingMode:", *MEMORY[0x1E0DBE2C0], CFSTR("com.apple.keyboard.preferences"), v6, 1);
    -[TIPreferencesAnalyzerRegistry _registerPreference:domain:defaultValue:reportingMode:](v2, "_registerPreference:domain:defaultValue:reportingMode:", *MEMORY[0x1E0DBE448], CFSTR("com.apple.keyboard.preferences"), MEMORY[0x1E0C9AAA0], 1);
    -[TIPreferencesAnalyzerRegistry _registerPreference:domain:defaultValue:reportingMode:](v2, "_registerPreference:domain:defaultValue:reportingMode:", *MEMORY[0x1E0DBE1C8], CFSTR("com.apple.preferences.sounds"), v6, 1);
    -[TIPreferencesAnalyzerRegistry _registerPreference:domain:defaultValue:reportingMode:](v2, "_registerPreference:domain:defaultValue:reportingMode:", *MEMORY[0x1E0DBE1B0], CFSTR("com.apple.keyboard.preferences"), v6, 1);
    -[TIPreferencesAnalyzerRegistry _registerPreference:domain:defaultValue:reportingMode:](v2, "_registerPreference:domain:defaultValue:reportingMode:", *MEMORY[0x1E0DBDEC8], CFSTR("com.apple.assistant.support"), v6, 1);
    -[TIPreferencesAnalyzerRegistry _registerPreference:domain:defaultValue:reportingMode:](v2, "_registerPreference:domain:defaultValue:reportingMode:", *MEMORY[0x1E0DBE470], CFSTR("com.apple.InputModePreferences"), &unk_1EA140510, 1);
    -[TIPreferencesAnalyzerRegistry _registerPreference:domain:defaultValue:reportingMode:](v2, "_registerPreference:domain:defaultValue:reportingMode:", *MEMORY[0x1E0DBDED0], CFSTR("com.apple.assistant.support"), v6, 1);
  }
  return v2;
}

- (void)enumerateRegisteredPreferencesUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *registry;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  registry = self->_registry;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__TIPreferencesAnalyzerRegistry_enumerateRegisteredPreferencesUsingBlock___block_invoke;
  v7[3] = &unk_1EA105508;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](registry, "enumerateObjectsUsingBlock:", v7);

}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_registry, "count");
}

- (void)_registerPreference:(id)a3 domain:(id)a4 defaultValue:(id)a5 reportingMode:(int)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  _TIPreferencesAnalyzerProperty *v13;

  if (a3)
  {
    if (a4)
    {
      v7 = *(_QWORD *)&a6;
      v10 = a5;
      v11 = a4;
      v12 = a3;
      v13 = -[_TIPreferencesAnalyzerProperty initWithKey:domain:defaultValue:reportingMode:]([_TIPreferencesAnalyzerProperty alloc], "initWithKey:domain:defaultValue:reportingMode:", v12, v11, v10, v7);

      -[NSMutableArray addObject:](self->_registry, "addObject:", v13);
    }
  }
}

- (NSMutableArray)registry
{
  return self->_registry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registry, 0);
}

void __74__TIPreferencesAnalyzerRegistry_enumerateRegisteredPreferencesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "domain");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "reportingMode");

  (*(void (**)(uint64_t, id, void *, void *, uint64_t, uint64_t))(v5 + 16))(v5, v10, v7, v8, v9, a4);
}

@end
