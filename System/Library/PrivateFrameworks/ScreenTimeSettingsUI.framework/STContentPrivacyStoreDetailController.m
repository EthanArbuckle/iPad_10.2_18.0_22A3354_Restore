@implementation STContentPrivacyStoreDetailController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STContentPrivacyStoreDetailController;
  -[STContentPrivacyStoreDetailController viewDidLoad](&v7, sel_viewDidLoad);
  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STContentPrivacyStoreDetailController isEligibleForAppDistribution](self, "isEligibleForAppDistribution"))
    v5 = CFSTR("AppsInstallationsAndPurchasesSpecifierName");
  else
    v5 = CFSTR("ITunesAppStorePurchasesSpecifierName");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_24DB8A1D0, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyStoreDetailController setTitle:](self, "setTitle:", v6);

}

- (id)specifiers
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;

  v3 = -[STContentPrivacyStoreDetailController isEligibleForAppDistribution](self, "isEligibleForAppDistribution");
  -[STContentPrivacyStoreDetailController contentPrivacyController](self, "contentPrivacyController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "distributionStoreDetailSpecifiers");
  else
    objc_msgSend(v4, "storeDetailSpecifiers");
  v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v7 = (int)*MEMORY[0x24BE756E0];
  v8 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v7);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v7) = v6;

  return *(id *)((char *)&self->super.super.super.super.super.super.super.isa + v7);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  char v19;
  objc_super v20;
  id v21;
  objc_super v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  -[STContentPrivacyStoreDetailController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyStoreDetailController getGroupSpecifierForSpecifier:](self, "getGroupSpecifierForSpecifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE75DA0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[STPINListViewController shouldShowPINSheetForSpecifier:](self, "shouldShowPINSheetForSpecifier:", v8))
    {
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __75__STContentPrivacyStoreDetailController_tableView_didSelectRowAtIndexPath___block_invoke;
      v23[3] = &unk_24DB86E30;
      v23[4] = self;
      v24 = v11;
      v25 = v10;
      v26 = v6;
      v27 = v7;
      -[PSListController st_showPINSheetWithCompletion:](self, "st_showPINSheetWithCompletion:", v23);

    }
    else
    {
      -[STPINListViewController coordinator](self, "coordinator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentPrivacyCoordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "saveRestrictionValue:forItem:completionHandler:", v11, v10, &__block_literal_global_23);

      v22.receiver = self;
      v22.super_class = (Class)STContentPrivacyStoreDetailController;
      -[STPINListViewController tableView:didSelectRowAtIndexPath:](&v22, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(MEMORY[0x24BE84498], "sharedController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE84498], "sharedController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "viewContext");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        v19 = objc_msgSend(v14, "saveContext:error:", v16, &v21);
        v17 = v21;

        if ((v19 & 1) == 0)
        {
          +[STUILog communicationSafety](STUILog, "communicationSafety");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            -[STContentPrivacyStoreDetailController tableView:didSelectRowAtIndexPath:].cold.1();

        }
      }
    }

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)STContentPrivacyStoreDetailController;
    -[STPINListViewController tableView:didSelectRowAtIndexPath:](&v20, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  }

}

id *__75__STContentPrivacyStoreDetailController_tableView_didSelectRowAtIndexPath___block_invoke(id *result, int a2)
{
  id *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  objc_super v7;

  if (a2)
  {
    v2 = result;
    objc_msgSend(result[4], "coordinator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentPrivacyCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "saveRestrictionValue:forItem:completionHandler:", v2[5], v2[6], &__block_literal_global_6);

    v5 = v2[7];
    v6 = v2[8];
    v7.receiver = v2[4];
    v7.super_class = (Class)STContentPrivacyStoreDetailController;
    return (id *)objc_msgSendSuper2(&v7, sel_tableView_didSelectRowAtIndexPath_, v5, v6);
  }
  return result;
}

- (BOOL)isEligibleForAppDistribution
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  -[STPINListViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "me");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isRemoteUser") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[STPINListViewController coordinator](self, "coordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentPrivacyCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "isEligibleForAppDistribution");

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[STPINListViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("contentPrivacyCoordinator.viewModel.isLoaded"), CFSTR("KVOContextContentPrivacyStoreDetailController"));

  v4.receiver = self;
  v4.super_class = (Class)STContentPrivacyStoreDetailController;
  -[STListViewController dealloc](&v4, sel_dealloc);
}

- (void)setCoordinator:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)STContentPrivacyStoreDetailController;
    -[STPINListViewController setCoordinator:](&v7, sel_setCoordinator_, v4);
  }
  else
  {
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("contentPrivacyCoordinator.viewModel.isLoaded"), CFSTR("KVOContextContentPrivacyStoreDetailController"));
    v7.receiver = self;
    v7.super_class = (Class)STContentPrivacyStoreDetailController;
    -[STPINListViewController setCoordinator:](&v7, sel_setCoordinator_, v4);
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("contentPrivacyCoordinator.viewModel.isLoaded"), 1, CFSTR("KVOContextContentPrivacyStoreDetailController"));
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  objc_super v16;

  v10 = a5;
  if (a6 == CFSTR("KVOContextContentPrivacyStoreDetailController"))
  {
    v12 = a3;
    -[STPINListViewController coordinator](self, "coordinator");

    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("contentPrivacyCoordinator.viewModel.isLoaded"));
    if (v13)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {

        v14 = 0;
      }
      -[STContentPrivacyStoreDetailController _isLoadedDidChange:](self, "_isLoadedDidChange:", objc_msgSend(v14, "BOOLValue"));

    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)STContentPrivacyStoreDetailController;
    v11 = a3;
    -[STListViewController observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v11, a4, v10, a6);

  }
}

- (void)_isLoadedDidChange:(BOOL)a3
{
  if (a3)
    -[STContentPrivacyStoreDetailController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)didCancelEnteringPIN
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STContentPrivacyStoreDetailController;
  -[STPINListViewController didCancelEnteringPIN](&v3, sel_didCancelEnteringPIN);
  -[STContentPrivacyStoreDetailController reloadSpecifiers](self, "reloadSpecifiers");
}

- (STContentPrivacyListController)contentPrivacyController
{
  return (STContentPrivacyListController *)objc_loadWeakRetained((id *)&self->_contentPrivacyController);
}

- (void)setContentPrivacyController:(id)a3
{
  objc_storeWeak((id *)&self->_contentPrivacyController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentPrivacyController);
}

- (void)tableView:didSelectRowAtIndexPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "Failed to save ContentPrivacyListController settings: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
