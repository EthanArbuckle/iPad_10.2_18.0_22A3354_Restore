@implementation VUIDebugMetricsGladiatorsRulesets

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VUIDebugMetricsGladiatorsRulesets_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, block);
  return (id)sharedInstance_sharedInstance_0;
}

void __51__VUIDebugMetricsGladiatorsRulesets_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v1;

}

- (VUIDebugMetricsGladiatorsRulesets)init
{
  VUIDebugMetricsGladiatorsRulesets *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, void *);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VUIDebugMetricsGladiatorsRulesets;
  v2 = -[VUIDebugMetricsGladiatorsRulesets init](&v19, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend(CFSTR("https://ae-validator-service.amp.apple.com"), "stringByAppendingString:", CFSTR("/v1/cache/manifest/"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("com.apple.amp.ae.validator.manifest.Video.AllRulesets"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithString:", v5);

    v7 = objc_alloc_init(MEMORY[0x1E0CB37A8]);
    objc_msgSend(v7, "setHTTPMethod:", CFSTR("GET"));
    objc_msgSend(v7, "addValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    objc_msgSend(v7, "setURL:", v6);
    v8 = (void *)MEMORY[0x1E0CB39F0];
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sessionWithConfiguration:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, v2);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __41__VUIDebugMetricsGladiatorsRulesets_init__block_invoke;
    v16 = &unk_1E9F99B00;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v10, "dataTaskWithRequest:completionHandler:", v7, &v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume", v13, v14, v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __41__VUIDebugMetricsGladiatorsRulesets_init__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v7)
  {
    objc_msgSend(v7, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error in Gladiator rulesset Response %@"), v10);

  }
  else
  {
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v28);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v28;
    v13 = v12;
    if (v12)
    {
      NSLog(CFSTR("Error Parsing Gladiator JSON response %@"), v12);
    }
    else
    {
      v23 = v11;
      objc_msgSend(v11, "valueForKey:", CFSTR("rulesets"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "valueForKey:", CFSTR("name"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v21);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v18);
      }

      v22 = (void *)objc_msgSend(v15, "copy");
      objc_msgSend(WeakRetained, "setRulesets:", v22);

      v13 = 0;
      v11 = v23;
    }

  }
}

- (NSArray)rulesets
{
  return self->_rulesets;
}

- (void)setRulesets:(id)a3
{
  objc_storeStrong((id *)&self->_rulesets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rulesets, 0);
}

@end
