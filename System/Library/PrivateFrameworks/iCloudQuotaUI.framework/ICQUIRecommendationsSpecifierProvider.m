@implementation ICQUIRecommendationsSpecifierProvider

- (ICQUIRecommendationsSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5;
  ICQUIRecommendationsSpecifierProvider *v6;
  ICQUIRecommendationsSpecifierProvider *v7;
  _TtC13iCloudQuotaUI29RecommendationAnalyticsHelper *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _TtC13iCloudQuotaUI29RecommendationAnalyticsHelper *recommendationAnalyticsHelper;
  _TtC13iCloudQuotaUI25RecommendationsController *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _TtC13iCloudQuotaUI25RecommendationsController *recommendationsController;
  NSString *recommendedForYouTitle;
  NSString *recommendedForYouSubtitle;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ICQUIRecommendationsSpecifierProvider;
  v6 = -[ICQUIRecommendationsSpecifierProvider init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    v8 = [_TtC13iCloudQuotaUI29RecommendationAnalyticsHelper alloc];
    -[AIDAAccountManager accounts](v7->_accountManager, "accounts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BE06080];
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[RecommendationAnalyticsHelper initWithAccount:](v8, "initWithAccount:", v11);
    recommendationAnalyticsHelper = v7->_recommendationAnalyticsHelper;
    v7->_recommendationAnalyticsHelper = (_TtC13iCloudQuotaUI29RecommendationAnalyticsHelper *)v12;

    v14 = [_TtC13iCloudQuotaUI25RecommendationsController alloc];
    -[AIDAAccountManager accounts](v7->_accountManager, "accounts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[RecommendationsController initWithAccount:](v14, "initWithAccount:", v16);
    recommendationsController = v7->_recommendationsController;
    v7->_recommendationsController = (_TtC13iCloudQuotaUI25RecommendationsController *)v17;

    recommendedForYouTitle = v7->_recommendedForYouTitle;
    v7->_recommendedForYouTitle = 0;

    recommendedForYouSubtitle = v7->_recommendedForYouSubtitle;
    v7->_recommendedForYouSubtitle = 0;

  }
  return v7;
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ICQUIRecommendationsSpecifierProvider account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "aa_isAccountClass:", *MEMORY[0x24BE047F0]) & 1) != 0)
  {
    -[ICQUIRecommendationsSpecifierProvider account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "aa_isManagedAppleID");

    if (!v7)
    {
      objc_storeWeak((id *)&self->_delegate, v4);
      -[RecommendationsController setSubtitleControllerDelegate:](self->_recommendationsController, "setSubtitleControllerDelegate:", self);
      -[RecommendationsController refresh](self->_recommendationsController, "refresh");
      goto LABEL_8;
    }
  }
  else
  {

  }
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[ICQUIRecommendationsSpecifierProvider account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "aa_isPrimaryAccount");
    -[ICQUIRecommendationsSpecifierProvider account](self, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = 67109376;
    v12[1] = v10;
    v13 = 1024;
    v14 = objc_msgSend(v11, "aa_isManagedAppleID");
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Recommendations for account type isPrimary: %d, isMAID: %d is not supported. bailing.", (uint8_t *)v12, 0xEu);

  }
LABEL_8:

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
  void *v3;
  void *v4;
  int v5;
  NSArray *specifiers;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PSSpecifier *v12;
  PSSpecifier *recommendationsSpecifier;
  NSString *recommendedForYouTitle;
  NSObject *v15;
  void *v17;
  void *v18;
  NSString *recommendedForYouSubtitle;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  NSArray *v24;
  uint8_t buf[16];

  -[ICQUIRecommendationsSpecifierProvider account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "aa_isAccountClass:", *MEMORY[0x24BE047F0]) & 1) != 0)
  {
    -[ICQUIRecommendationsSpecifierProvider account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "aa_isManagedAppleID");

    if (!v5)
    {
      specifiers = self->_specifiers;
      if (!specifiers)
      {
        v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        v9 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("RECOMMENDED_FOR_YOU_TITLE"), &stru_24E400750, CFSTR("Localizable"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, 0, objc_opt_class(), 2, 0);
        v12 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
        recommendationsSpecifier = self->_recommendationsSpecifier;
        self->_recommendationsSpecifier = v12;

        -[PSSpecifier setControllerLoadAction:](self->_recommendationsSpecifier, "setControllerLoadAction:", sel__openRecommendationsViewController_);
        -[PSSpecifier setObject:forKeyedSubscript:](self->_recommendationsSpecifier, "setObject:forKeyedSubscript:", self->_accountManager, CFSTR("icloudAccountManager"));
        -[PSSpecifier setObject:forKeyedSubscript:](self->_recommendationsSpecifier, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
        recommendedForYouTitle = self->_recommendedForYouTitle;
        if (recommendedForYouTitle)
        {
          -[PSSpecifier setObject:forKeyedSubscript:](self->_recommendationsSpecifier, "setObject:forKeyedSubscript:", recommendedForYouTitle, *MEMORY[0x24BE75D50]);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("RECOMMENDED_FOR_YOU_TITLE"), &stru_24E400750, CFSTR("Localizable"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[PSSpecifier setObject:forKeyedSubscript:](self->_recommendationsSpecifier, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE75D50]);

        }
        recommendedForYouSubtitle = self->_recommendedForYouSubtitle;
        if (recommendedForYouSubtitle)
        {
          -[PSSpecifier setObject:forKeyedSubscript:](self->_recommendationsSpecifier, "setObject:forKeyedSubscript:", recommendedForYouSubtitle, *MEMORY[0x24BE75D28]);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("RECOMMENDED_FOR_YOU_SUBTITLE_LOADING"), &stru_24E400750, CFSTR("Localizable"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PSSpecifier setObject:forKeyedSubscript:](self->_recommendationsSpecifier, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BE75D28]);

        }
        objc_msgSend(MEMORY[0x24BEBD640], "icqBundleImageNamed:", CFSTR("RecommendationsRowIcon"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifier setObject:forKeyedSubscript:](self->_recommendationsSpecifier, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE75AC8]);
        objc_msgSend(v7, "addObject:", self->_recommendationsSpecifier);
        v23 = (NSArray *)objc_msgSend(v7, "copy");
        v24 = self->_specifiers;
        self->_specifiers = v23;

        specifiers = self->_specifiers;
      }
      return specifiers;
    }
  }
  else
  {

  }
  _ICQGetLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "Recommendation specifier was requested for non-primary, maid accounts. Returning no specifiers.", buf, 2u);
  }

  return (NSArray *)0;
}

- (void)_openRecommendationsViewController:(id)a3
{
  _TtC13iCloudQuotaUI29RecommendationAnalyticsHelper *recommendationAnalyticsHelper;
  id v5;
  void *v6;
  id WeakRetained;
  id v8;

  recommendationAnalyticsHelper = self->_recommendationAnalyticsHelper;
  v5 = a3;
  -[RecommendationAnalyticsHelper sendRecommendedForYouTapEventWithCompletionHandler:](recommendationAnalyticsHelper, "sendRecommendedForYouTapEventWithCompletionHandler:", &__block_literal_global_20);
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  CreateDetailControllerInstanceWithClass();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setController:", self->_recommendationsController);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v8);
  objc_msgSend(v8, "setSpecifier:", v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "specifierProvider:showViewController:", self, v6);

}

void __76__ICQUIRecommendationsSpecifierProvider__openRecommendationsViewController___block_invoke()
{
  NSObject *v0;

  _ICQGetLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __76__ICQUIRecommendationsSpecifierProvider__openRecommendationsViewController___block_invoke_cold_1(v0);

}

- (BOOL)handleURL:(id)a3
{
  _BOOL4 v4;

  v4 = -[ICQUIRecommendationsSpecifierProvider _handleRecommendationsURL:](self, "_handleRecommendationsURL:", a3);
  if (v4)
    -[ICQUIRecommendationsSpecifierProvider _openRecommendationsViewController:](self, "_openRecommendationsViewController:", self->_recommendationsSpecifier);
  return v4;
}

- (BOOL)_handleRecommendationsURL:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  id v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Recource dictionary %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("path"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsString:", CFSTR("RECOMMENDATIONS"));
  if (v6)
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v11 = 138412290;
      v12 = v8;
      v9 = v8;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "%@ Received a recommendations url.", (uint8_t *)&v11, 0xCu);

    }
  }

  return v6;
}

- (void)_reloadSpecifiers
{
  void *v3;
  id v4;

  v4 = (id)-[NSArray copy](self->_specifiers, "copy");
  -[ICQUIRecommendationsSpecifierProvider setSpecifiers:](self, "setSpecifiers:", 0);
  -[ICQUIRecommendationsSpecifierProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, v4, 0);

}

- (void)recommendationsChangedWithTitle:(id)a3 subtitle:(id)a4
{
  NSString *v6;
  NSString *v7;
  NSString *recommendedForYouTitle;
  NSString *v9;
  NSString *recommendedForYouSubtitle;
  NSString *v11;
  _QWORD block[5];

  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  recommendedForYouTitle = self->_recommendedForYouTitle;
  self->_recommendedForYouTitle = v6;
  v9 = v6;

  recommendedForYouSubtitle = self->_recommendedForYouSubtitle;
  self->_recommendedForYouSubtitle = v7;
  v11 = v7;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__ICQUIRecommendationsSpecifierProvider_recommendationsChangedWithTitle_subtitle___block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __82__ICQUIRecommendationsSpecifierProvider_recommendationsChangedWithTitle_subtitle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSpecifiers");
}

- (AAUISpecifierProviderDelegate)delegate
{
  return (AAUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recommendedForYouSubtitle, 0);
  objc_storeStrong((id *)&self->_recommendedForYouTitle, 0);
  objc_storeStrong((id *)&self->_recommendationsController, 0);
  objc_storeStrong((id *)&self->_recommendationAnalyticsHelper, 0);
  objc_storeStrong((id *)&self->_recommendationsSpecifier, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

void __76__ICQUIRecommendationsSpecifierProvider__openRecommendationsViewController___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21F2CC000, log, OS_LOG_TYPE_DEBUG, "Sending recommendation specifier tapped event.", v1, 2u);
}

@end
