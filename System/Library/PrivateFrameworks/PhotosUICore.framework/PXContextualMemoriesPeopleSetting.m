@implementation PXContextualMemoriesPeopleSetting

- (PXContextualMemoriesPeopleSetting)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXContextualMemoriesPeopleSetting;
  return -[PXContextualMemoriesPeopleSetting init](&v3, sel_init);
}

- (NSString)headerTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("People"), &stru_1E5149688, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)title
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const __CFString *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXContextualMemoriesPeopleSetting peopleNames](self, "peopleNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        if (-v7 == i)
          v10 = CFSTR("• %@");
        else
          v10 = CFSTR("\n• %@");
        objc_msgSend(v3, "appendFormat:", v10, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v7 += v6;
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSString *)v3;
}

- (void)resetToDefault
{
  id v2;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  px_dispatch_on_main_queue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

- (void)requestPeopleNamesUpdateSinceDate:(id)a3 withCompletionHandler:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (NSArray)peopleNames
{
  return self->_peopleNames;
}

- (void)setPeopleNames:(id)a3
{
  objc_storeStrong((id *)&self->_peopleNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleNames, 0);
}

void __51__PXContextualMemoriesPeopleSetting_resetToDefault__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPeopleNames:", MEMORY[0x1E0C9AA60]);
  v1 = (void *)objc_opt_new();
  objc_msgSend(v1, "peopleProximityDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "requestPeopleNamesUpdateSinceDate:withCompletionHandler:", v2, &__block_literal_global_5748);

}

@end
