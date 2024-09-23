@implementation STRootViewControllerProvider

+ (id)rootViewControllerForDSID:(id)a3
{
  id v3;
  STRootViewModelCoordinator *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  STRootViewController *v10;
  STRootViewController *v11;

  v3 = a3;
  v4 = -[STRootViewModelCoordinator initWithUserDSID:deviceIdentifier:usageReportType:usageContext:]([STRootViewModelCoordinator alloc], "initWithUserDSID:deviceIdentifier:usageReportType:usageContext:", v3, 0, 0, 0);

  if (!_os_feature_enabled_impl())
    goto LABEL_6;
  -[STRootViewModelCoordinator viewModel](v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "me");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isRemoteUser") & 1) == 0)
  {

    goto LABEL_6;
  }
  -[STRootViewModelCoordinator viewModel](v4, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "me");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isManaged");

  if ((v9 & 1) != 0)
  {
LABEL_6:
    v10 = -[STRootViewController initWithRootViewModelCoordinator:]([STRootViewController alloc], "initWithRootViewModelCoordinator:", v4);
    goto LABEL_7;
  }
  v10 = (STRootViewController *)objc_opt_new();
LABEL_7:
  v11 = v10;

  return v11;
}

+ (void)requestRootViewControllerForDSID:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  STRootViewModelCoordinator *v12;
  STRootViewController *v13;
  void *v14;
  void *v15;
  id v16;
  STRootViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  STIntroductionController *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  STRootViewModelCoordinator *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  STRootViewController *v34;
  STRootViewController *v35;
  void (**v36)(id, void *);
  id v37;
  _QWORD v38[4];
  STRootViewModelCoordinator *v39;
  STRootViewController *v40;
  void (**v41)(id, void *);
  char v42;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v27 = v7;
    v28 = -[STRootViewModelCoordinator initWithUserDSID:deviceIdentifier:usageReportType:usageContext:]([STRootViewModelCoordinator alloc], "initWithUserDSID:deviceIdentifier:usageReportType:usageContext:", v27, 0, 0, 0);
    if (_os_feature_enabled_impl())
    {
      -[STRootViewModelCoordinator viewModel](v28, "viewModel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "me");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v30, "isRemoteUser") & 1) != 0)
      {
        -[STRootViewModelCoordinator viewModel](v28, "viewModel");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "me");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isManaged");

        if ((v33 & 1) == 0)
        {
          v34 = (STRootViewController *)objc_opt_new();
LABEL_14:
          v35 = v34;

          v9[2](v9, v35);
          goto LABEL_15;
        }
      }
      else
      {

      }
    }
    v34 = -[STRootViewController initWithRootViewModelCoordinator:]([STRootViewController alloc], "initWithRootViewModelCoordinator:", v28);
    goto LABEL_14;
  }
  v37 = v8;
  +[STUsageDetailsViewModelCoordinator defaultDeviceIdentifierForChild:](STUsageDetailsViewModelCoordinator, "defaultDeviceIdentifierForChild:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUsageDetailsViewModelCoordinator defaultUsageReportTypeForChild:](STUsageDetailsViewModelCoordinator, "defaultUsageReportTypeForChild:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[STRootViewModelCoordinator initWithUserDSID:deviceIdentifier:usageReportType:usageContext:]([STRootViewModelCoordinator alloc], "initWithUserDSID:deviceIdentifier:usageReportType:usageContext:", v7, v10, v11, 0);
  v13 = -[STRootViewController initWithRootViewModelCoordinator:]([STRootViewController alloc], "initWithRootViewModelCoordinator:", v12);
  -[STRootViewModelCoordinator viewModel](v12, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "me");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isRemoteUser") & 1) == 0)
  {

    goto LABEL_10;
  }
  -[STRootViewModelCoordinator viewModel](v12, "viewModel");
  v36 = v9;
  v16 = v7;
  v17 = v13;
  v18 = v11;
  v19 = v10;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "me");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isManaged");

  v10 = v19;
  v11 = v18;
  v13 = v17;
  v7 = v16;
  v9 = v36;

  if ((v22 & 1) != 0)
  {
LABEL_10:
    v9[2](v9, v13);
    v8 = v37;
    goto LABEL_11;
  }
  -[STRootViewModelCoordinator setHasShownMiniBuddy:](v12, "setHasShownMiniBuddy:", 1);
  v23 = -[STIntroductionController initWithNewUserRootViewModelCoordinator:]([STIntroductionController alloc], "initWithNewUserRootViewModelCoordinator:", v12);
  -[STRootViewModelCoordinator viewModel](v12, "viewModel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "me");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isRemoteUser");

  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __108__STRootViewControllerProvider_requestRootViewControllerForDSID_presentingViewController_completionHandler___block_invoke;
  v38[3] = &unk_24DB88630;
  v39 = v12;
  v41 = v36;
  v42 = v26;
  v40 = v13;
  -[STIntroductionController setCompletionBlock:](v23, "setCompletionBlock:", v38);
  v8 = v37;
  -[STIntroductionController presentOverViewController:](v23, "presentOverViewController:", v37);

LABEL_11:
LABEL_15:

}

void __108__STRootViewControllerProvider_requestRootViewControllerForDSID_presentingViewController_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "parentalControlsPasscode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recoveryAltDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __108__STRootViewControllerProvider_requestRootViewControllerForDSID_presentingViewController_completionHandler___block_invoke_2;
    v10[3] = &unk_24DB88608;
    v14 = *(id *)(a1 + 48);
    v15 = *(_BYTE *)(a1 + 56);
    v11 = v6;
    v12 = *(id *)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v7, "enableManagementWithPIN:recoveryAltDSID:completionHandler:", v8, v9, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __108__STRootViewControllerProvider_requestRootViewControllerForDSID_presentingViewController_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      __108__STRootViewControllerProvider_requestRootViewControllerForDSID_presentingViewController_completionHandler___block_invoke_2_cold_1((uint64_t)v3);
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    if (*(_BYTE *)(a1 + 64) || objc_msgSend(*(id *)(a1 + 32), "deviceForChild"))
      objc_msgSend(*(id *)(a1 + 40), "applyIntroductionViewModel:withCompletionHandler:", *(_QWORD *)(a1 + 32), 0);
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v4();

}

void __108__STRootViewControllerProvider_requestRootViewControllerForDSID_presentingViewController_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138543362;
  v2 = a1;
  _os_log_fault_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Failed to enable Screen Time remote management of child: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end
