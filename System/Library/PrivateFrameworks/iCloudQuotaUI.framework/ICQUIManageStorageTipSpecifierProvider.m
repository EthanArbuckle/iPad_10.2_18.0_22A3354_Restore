@implementation ICQUIManageStorageTipSpecifierProvider

- (ICQUIManageStorageTipSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4 summary:(id)a5
{
  id v8;
  uint64_t v9;
  ICQUIManageStorageTipSpecifierProvider *v10;
  ICQUIManageStorageTipSpecifierProvider *v11;
  void *v12;
  objc_super v14;

  v8 = a5;
  v9 = *MEMORY[0x24BEC7240];
  v14.receiver = self;
  v14.super_class = (Class)ICQUIManageStorageTipSpecifierProvider;
  v10 = -[ICQUITipSpecifierProvider initWithAccountManager:presenter:sectionAnchorIdentifier:showUpwardPointingTips:](&v14, sel_initWithAccountManager_presenter_sectionAnchorIdentifier_showUpwardPointingTips_, a3, a4, v9, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_storageSummary, v8);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, sel__fetchStorageSummaryAndRefreshSpecifiers, CFSTR("QuotaDidChange"), 0);

  }
  return v11;
}

- (id)account
{
  void *v2;
  void *v3;
  void *v4;

  -[ICQUIManageStorageTipSpecifierProvider valueForKey:](self, "valueForKey:", CFSTR("_accountManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)specifiers
{
  NSArray *specifiers;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  specifiers = self->_specifiers;
  if (!specifiers)
  {
    -[ICQUIManageStorageTipSpecifierProvider storageSummary](self, "storageSummary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUIManageStorageTipSpecifierProvider manageStorageSpecifiersForSummary:](self, "manageStorageSpecifiersForSummary:", v4);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_specifiers;
    self->_specifiers = v5;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (id)manageStorageSpecifiersForSummary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  ICQUIManageStorageTipViewModel *v8;
  void *v9;
  void *v10;
  void *v11;
  ICQUIManageStorageTipViewModel *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "manageStoragePage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tips");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = [ICQUIManageStorageTipViewModel alloc];
    objc_msgSend(v4, "manageStoragePage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tips");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ICQUIManageStorageTipViewModel initWithTipInfo:](v8, "initWithTipInfo:", v11);
    -[ICQUITipSpecifierProvider setViewModel:](self, "setViewModel:", v12);

    -[ICQUITipSpecifierProvider _tipSpecifiers](self, "_tipSpecifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)setSpecifiers:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v5 = (void *)-[NSArray copy](self->_specifiers, "copy");
    objc_storeStrong((id *)&self->_specifiers, a3);
    -[ICQUITipSpecifierProvider delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, v5, 1);

  }
  else
  {
    -[ICQUIManageStorageTipSpecifierProvider _fetchStorageSummaryAndRefreshSpecifiers](self, "_fetchStorageSummaryAndRefreshSpecifiers");
  }

}

- (void)_refreshTipsWithSummary:(id)a3
{
  NSArray *specifiers;
  void *v5;
  id v6;

  -[ICQUIManageStorageTipSpecifierProvider setStorageSummary:](self, "setStorageSummary:", a3);
  v6 = (id)-[NSArray copy](self->_specifiers, "copy");
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  -[ICQUITipSpecifierProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, v6, 1);

}

- (void)_fetchStorageSummaryAndRefreshSpecifiers
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v3 = objc_alloc(MEMORY[0x24BEC72A8]);
  -[ICQUIManageStorageTipSpecifierProvider account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "initWithAccount:", v4);

  v5 = (void *)v8[5];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __82__ICQUIManageStorageTipSpecifierProvider__fetchStorageSummaryAndRefreshSpecifiers__block_invoke;
  v6[3] = &unk_24E3F3938;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v5, "fetchStorageSummaryWithCompletion:", v6);
  _Block_object_dispose(&v7, 8);

}

void __82__ICQUIManageStorageTipSpecifierProvider__fetchStorageSummaryAndRefreshSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  __int128 v7;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__ICQUIManageStorageTipSpecifierProvider__fetchStorageSummaryAndRefreshSpecifiers__block_invoke_2;
  block[3] = &unk_24E3F3910;
  v6 = v3;
  v7 = *(_OWORD *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __82__ICQUIManageStorageTipSpecifierProvider__fetchStorageSummaryAndRefreshSpecifiers__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "_refreshTipsWithSummary:");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (ICQCloudStorageSummary)storageSummary
{
  return (ICQCloudStorageSummary *)objc_loadWeakRetained((id *)&self->_storageSummary);
}

- (void)setStorageSummary:(id)a3
{
  objc_storeWeak((id *)&self->_storageSummary, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storageSummary);
  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end
