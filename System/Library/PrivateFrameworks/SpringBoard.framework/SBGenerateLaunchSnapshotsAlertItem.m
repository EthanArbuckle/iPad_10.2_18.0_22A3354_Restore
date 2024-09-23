@implementation SBGenerateLaunchSnapshotsAlertItem

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)behavesSuperModally
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (SBGenerateLaunchSnapshotsAlertItem)initWithHandler:(id)a3
{
  id v4;
  SBGenerateLaunchSnapshotsAlertItem *v5;
  uint64_t v6;
  id handler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBGenerateLaunchSnapshotsAlertItem;
  v5 = -[SBAlertItem init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1D17E5550](v4);
    handler = v5->_handler;
    v5->_handler = (id)v6;

  }
  return v5;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  SBGenerateLaunchSnapshotsAlertItem *v25;
  _QWORD v26[5];
  id v27;

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredStyle:", 0);
  objc_msgSend(v5, "setTitle:", CFSTR("Select Application Type"));
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_splashBoardController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = (void *)MEMORY[0x1E0CEA2E0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke;
  v26[3] = &unk_1E8E9DC88;
  v26[4] = self;
  v11 = v8;
  v27 = v11;
  objc_msgSend(v10, "actionWithTitle:style:handler:", CFSTR("System"), 0, v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v12);

  v13 = (void *)MEMORY[0x1E0CEA2E0];
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v23[3] = &unk_1E8E9DC88;
  v14 = v11;
  v24 = v14;
  v25 = self;
  objc_msgSend(v13, "actionWithTitle:style:handler:", CFSTR("User"), 0, v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v15);

  v16 = (void *)MEMORY[0x1E0CEA2E0];
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke_4;
  v21[3] = &unk_1E8E9DC88;
  v21[4] = self;
  v22 = v14;
  v17 = v14;
  objc_msgSend(v16, "actionWithTitle:style:handler:", CFSTR("All"), 2, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v18);

  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke_5;
  v20[3] = &unk_1E8E9DCB0;
  v20[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v19);

}

void __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "splashBoardSystemApplications");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "regenerateApplications:", v2);

}

void __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "allSplashBoardApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_filter:", &__block_literal_global_26);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "regenerateApplications:", v3);
}

BOOL __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 2;
}

void __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allSplashBoardApplications");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "regenerateApplications:", v2);

}

uint64_t __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deactivate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 16))();
}

- (void)regenerateApplications:(id)a3
{
  id v4;
  SBLaunchSnapshotWaitingAlertItem *v5;
  void *v6;
  void *v7;
  SBLaunchSnapshotWaitingAlertItem *v8;
  _QWORD v9[4];
  SBLaunchSnapshotWaitingAlertItem *v10;
  SBGenerateLaunchSnapshotsAlertItem *v11;

  v4 = a3;
  -[SBAlertItem deactivate](self, "deactivate");
  v5 = objc_alloc_init(SBLaunchSnapshotWaitingAlertItem);
  objc_msgSend(MEMORY[0x1E0DAC210], "activateAlertItem:", v5);
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_splashBoardController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeCachedLaunchImagesForApplications:forgettingApps:", v4, 1);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SBGenerateLaunchSnapshotsAlertItem_regenerateApplications___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v10 = v5;
  v11 = self;
  v8 = v5;
  objc_msgSend(v7, "captureOrUpdateLaunchImagesForApplications:firstImageIsReady:completion:", v4, 0, v9);

}

void __61__SBGenerateLaunchSnapshotsAlertItem_regenerateApplications___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__SBGenerateLaunchSnapshotsAlertItem_regenerateApplications___block_invoke_2;
  v4[3] = &unk_1E8E9E820;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

uint64_t __61__SBGenerateLaunchSnapshotsAlertItem_regenerateApplications___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deactivate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112) + 16))();
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
