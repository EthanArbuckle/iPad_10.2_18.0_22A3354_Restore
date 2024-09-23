@implementation SBApplicationSignatureVersionRepairAlertItem

- (SBApplicationSignatureVersionRepairAlertItem)initWithApplication:(id)a3
{
  id v5;
  SBApplicationSignatureVersionRepairAlertItem *v6;
  SBApplicationSignatureVersionRepairAlertItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBApplicationSignatureVersionRepairAlertItem;
  v6 = -[SBAlertItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_application, a3);

  return v7;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SIGNATURE_VERSION_UNSUPPORTED_REPAIR_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplication displayName](self->_application, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v10);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SIGNATURE_VERSION_UNSUPPORTED_REPAIR_BODY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v12);

  v13 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SIGNATURE_VERSION_UNSUPPORTED_REPAIR_ACKNOWLEDGE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __84__SBApplicationSignatureVersionRepairAlertItem_configure_requirePasscodeForActions___block_invoke;
  v23[3] = &unk_1E8E9DCB0;
  v23[4] = self;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v17);
  v18 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("SIGNATURE_VERSION_UNSUPPORTED_REPAIR_CANCEL"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __84__SBApplicationSignatureVersionRepairAlertItem_configure_requirePasscodeForActions___block_invoke_22;
  v22[3] = &unk_1E8E9DCB0;
  v22[4] = self;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v21);
  objc_msgSend(v5, "setPreferredAction:", v17);

}

void __84__SBApplicationSignatureVersionRepairAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[Signature Repair] [%{public}@] Attempting to upgrade repair", buf, 0xCu);

  }
  v4 = objc_alloc(MEMORY[0x1E0CF9DA0]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithBundleID:", v5);

  objc_msgSend(v6, "setExitReason:", 32);
  objc_msgSend(MEMORY[0x1E0CF9DA8], "defaultService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__SBApplicationSignatureVersionRepairAlertItem_configure_requirePasscodeForActions___block_invoke_13;
  v8[3] = &unk_1E8EB25F0;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "repairAppWithOptions:replyHandler:", v6, v8);

  objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

void __84__SBApplicationSignatureVersionRepairAlertItem_configure_requirePasscodeForActions___block_invoke_13(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  int v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("Failed");
    v10 = 138543874;
    v11 = v8;
    v12 = 2114;
    if (a2)
      v9 = CFSTR("Success");
    v13 = v9;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Signature Repair] [%{public}@] Upgrade result: %{public}@ - error: %{public}@.", (uint8_t *)&v10, 0x20u);

  }
}

uint64_t __84__SBApplicationSignatureVersionRepairAlertItem_configure_requirePasscodeForActions___block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)dismissOnLock
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
}

@end
