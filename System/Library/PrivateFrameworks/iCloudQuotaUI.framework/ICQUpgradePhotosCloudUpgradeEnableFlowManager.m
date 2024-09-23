@implementation ICQUpgradePhotosCloudUpgradeEnableFlowManager

- (void)_performPageButtonActionWithParameters:(id)a3 completion:(id)a4
{
  id v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;

  v8[1] = 3221225472;
  v8[2] = __99__ICQUpgradePhotosCloudUpgradeEnableFlowManager__performPageButtonActionWithParameters_completion___block_invoke;
  v8[3] = &unk_24E3F54F8;
  v9 = a4;
  v7.receiver = self;
  v7.super_class = (Class)ICQUpgradePhotosCloudUpgradeEnableFlowManager;
  v8[0] = MEMORY[0x24BDAC760];
  v6 = v9;
  -[ICQUpgradeCloudStorageFlowManager _performPageButtonActionWithParameters:completion:](&v7, sel__performPageButtonActionWithParameters_completion_, a3, v8);

}

void __99__ICQUpgradePhotosCloudUpgradeEnableFlowManager__performPageButtonActionWithParameters_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "PhotosCloudUpgradeEnable -- upgrade succeeded, now attempting to enable iCPL", (uint8_t *)&v9, 2u);
    }

    +[ICQUIPhotosHelper enableCloudPhotosLibraryWithCompletion:](ICQUIPhotosHelper, "enableCloudPhotosLibraryWithCompletion:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v7)
    {
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "PhotosCloudUpgradeEnable -- upgrade failed with error %{public}@", (uint8_t *)&v9, 0xCu);
    }

    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "skipping attempt to enable iCPL", (uint8_t *)&v9, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
