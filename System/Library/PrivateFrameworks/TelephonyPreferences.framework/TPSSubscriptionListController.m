@implementation TPSSubscriptionListController

- (id)specifiers
{
  TPSSubscriptionListController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  id obj;
  uint64_t v24;
  void *v25;
  TPSSubscriptionListController *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v2 = self;
  v32 = *MEMORY[0x1E0C80C00];
  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[TPSListController subscriptions](v2, "subscriptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v22 = v3;
      v26 = v2;
      -[TPSSubscriptionListController specifier](v2, "specifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v6, "propertyForKey:", CFSTR("TPSSpecifierSubscriptionDetailControllerKey"));

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      obj = v5;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v8)
      {
        v9 = v8;
        v24 = *(_QWORD *)v28;
        v10 = *MEMORY[0x1E0D80930];
        v11 = *MEMORY[0x1E0D80780];
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v28 != v24)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            v14 = (void *)MEMORY[0x1E0D804E8];
            objc_msgSend(v13, "tps_localizedLabel");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, 0, 0, 0, v7, 2, 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "setProperty:forKey:", v13, v10);
            objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_1EA2CE0A0, v26, 0, 0, v7, 2, 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "setProperty:forKey:", v13, v10);
            objc_msgSend(v17, "setProperty:forKey:", objc_opt_class(), v11);
            objc_msgSend(v13, "userDefaultVoice");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v16) = objc_msgSend(v18, "BOOLValue");

            if ((_DWORD)v16)
              objc_msgSend(v25, "insertObject:atIndex:", v17, 0);
            else
              objc_msgSend(v25, "addObject:", v17);

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v9);
      }

      v19 = objc_msgSend(v25, "copy");
      v2 = v26;
      v3 = v22;
      v20 = *(Class *)((char *)&v26->super.super.super.super.super.super.isa + v22);
      *(Class *)((char *)&v26->super.super.super.super.super.super.isa + v22) = (Class)v19;

    }
    v4 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

@end
