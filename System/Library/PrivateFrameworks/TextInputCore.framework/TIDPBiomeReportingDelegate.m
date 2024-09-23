@implementation TIDPBiomeReportingDelegate

- (TIDPBiomeReportingDelegate)init
{
  TIDPBiomeReportingDelegate *v3;
  void *v4;
  void *v5;
  void *v6;
  BMSource *v7;
  BMSource *source;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TIDPBiomeReportingDelegate;
  v3 = -[TIDPBiomeReportingDelegate init](&v10, sel_init);
  if (v3 == self)
  {
    BiomeLibrary();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "Keyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "TokenFrequency");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "source");
    v7 = (BMSource *)objc_claimAutoreleasedReturnValue();
    source = self->_source;
    self->_source = v7;

  }
  return v3;
}

- (BOOL)recordTokenFrequency:(id)a3 withLocale:(id)a4 withTokenType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "_BMEventWithKeyboardTokenFrequency:withLocale:withTokenType:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSource sendEvent:](self->_source, "sendEvent:", v11);
  return 1;
}

- (BOOL)record:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

+ (id)_BMEventWithKeyboardTokenFrequency:(id)a3 withLocale:(id)a4 withTokenType:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v21 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14);
        v16 = objc_alloc(MEMORY[0x1E0D02078]);
        objc_msgSend(v10, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v16, "initWithToken:count:", v15, v17);
        objc_msgSend(v9, "addObject:", v18);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02070]), "initWithTokenFrequencies:locale:tokenType:", v9, v21, BMKeyboardTokenFrequencyTokenTypeFromString());
  return v19;
}

@end
