@implementation ICQUIiCloudPlusSpecifierProvider

- (ICQUIiCloudPlusSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5;
  ICQUIiCloudPlusSpecifierProvider *v6;
  ICQUIiCloudPlusSpecifierProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQUIiCloudPlusSpecifierProvider;
  v6 = -[ICQUIiCloudPlusSpecifierProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountManager, a3);

  return v7;
}

- (id)account
{
  void *v2;
  void *v3;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)specifiers
{
  NSArray *specifiers;
  NSArray *v4;
  NSArray *v5;

  specifiers = self->_specifiers;
  if (!specifiers)
  {
    -[ICQUIiCloudPlusSpecifierProvider _buildiCloudPlusSpecifiers](self, "_buildiCloudPlusSpecifiers");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_specifiers;
    self->_specifiers = v4;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (id)_buildiCloudPlusSpecifiers
{
  id v3;
  void *v4;
  void *v5;
  ICQCloudStorageSummary *v6;
  ICQCloudStorageSummary *storageSummary;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  ICQUIiCloudPlusSpecifierProvider *v19;
  id v20;

  v3 = objc_alloc(MEMORY[0x24BEC72A8]);
  -[ICQUIiCloudPlusSpecifierProvider account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithAccount:", v4);

  objc_msgSend(v5, "cachedStorageSummary");
  v6 = (ICQCloudStorageSummary *)objc_claimAutoreleasedReturnValue();
  storageSummary = self->_storageSummary;
  self->_storageSummary = v6;

  -[ICQCloudStorageSummary subscriptionInfo](self->_storageSummary, "subscriptionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isiCloudPlusSubscriber"))
  {
    _ICQGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICQUIiCloudPlusSpecifierProvider _buildiCloudPlusSpecifiers].cold.1(v9);

    v10 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v8, "specifiersInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __62__ICQUIiCloudPlusSpecifierProvider__buildiCloudPlusSpecifiers__block_invoke;
    v18 = &unk_24E3F38E8;
    v19 = self;
    v20 = v11;
    v13 = v11;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v15);

    v10 = (void *)objc_msgSend(v13, "copy", v15, v16, v17, v18, v19);
  }

  return v10;
}

void __62__ICQUIiCloudPlusSpecifierProvider__buildiCloudPlusSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v10 = a2;
  objc_msgSend(v10, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ICLOUD_PLUS_CELL"));

  if (v4)
  {
    v5 = v10;
    objc_msgSend(*(id *)(a1 + 32), "_buildiCloudPlusGroupTitleSpecifierFrom:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    objc_msgSend(v5, "featureList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __62__ICQUIiCloudPlusSpecifierProvider__buildiCloudPlusSpecifiers__block_invoke_2;
    v11[3] = &unk_24E3F38C0;
    v8 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v5;
    v13 = v8;
    v9 = v5;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  }
}

void __62__ICQUIiCloudPlusSpecifierProvider__buildiCloudPlusSpecifiers__block_invoke_2(id *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a1[4], "_buildiCloudPlusFeatureSpecifiersFrom:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "featureList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") - 1;

  if (v6 == a3)
  {
    objc_msgSend(v8, "setProperty:forKey:", MEMORY[0x24BDBD1C8], CFSTR("LAST_ITEM_KEY"));
    v7 = &unk_24E435FF8;
  }
  else
  {
    v7 = &unk_24E436008;
  }
  objc_msgSend(v8, "setProperty:forKey:", v7, *MEMORY[0x24BE75D10]);
  objc_msgSend(a1[6], "addObject:", v8);

}

- (id)_buildiCloudPlusGroupTitleSpecifierFrom:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BE75590];
  v5 = a3;
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("ICLOUD_PLUS_FEATURE_HEADER_CELL"), self, 0, 0, 0, 4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v6, "setProperty:forKey:", &unk_24E435E48, *MEMORY[0x24BE75860]);
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75D50]);
  return v6;
}

- (id)_buildiCloudPlusFeatureSpecifiersFrom:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BE75590];
  v5 = a3;
  objc_msgSend(v5, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, -1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v5, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x24BE75D50]);

  objc_msgSend(v7, "setProperty:forKey:", &unk_24E435E48, *MEMORY[0x24BE75860]);
  objc_msgSend(v7, "setTarget:", v5);
  objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B88]);
  objc_msgSend(v5, "iconURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[_ICQUIHelperFunctions scaledImageURL:](_ICQUIHelperFunctions, "scaledImageURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x24BE75B98]);

  return v7;
}

- (AAUISpecifierProviderDelegate)delegate
{
  return (AAUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storageSummary, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)_buildiCloudPlusSpecifiers
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "Upgrade to iCloud+ specifiers were requested for iCloud+ user. Returning no specifiers.", v1, 2u);
}

@end
