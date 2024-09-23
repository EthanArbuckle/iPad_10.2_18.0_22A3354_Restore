@implementation SBAppDeniedAlertItem

- (SBAppDeniedAlertItem)initWithApp:(id)a3
{
  id v5;
  SBAppDeniedAlertItem *v6;
  SBAppDeniedAlertItem *v7;

  v5 = a3;
  v6 = -[SBAlertItem init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_application, a3);

  return v7;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D4E408]);
  -[SBApplication bundleIdentifier](self->_application, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithBundleIdentifier:", v7);

  if (v8)
  {
    objc_msgSend(v8, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v9);

    objc_msgSend(v8, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMessage:", v10);

    v11 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(v8, "deleteAppButtonText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __60__SBAppDeniedAlertItem_configure_requirePasscodeForActions___block_invoke;
    v27[3] = &unk_1E8E9DC88;
    v27[4] = self;
    v14 = v8;
    v28 = v14;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 2, v27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(v14, "learnMoreButtonText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = __60__SBAppDeniedAlertItem_configure_requirePasscodeForActions___block_invoke_2;
    v25[3] = &unk_1E8E9DC88;
    v25[4] = self;
    v18 = v14;
    v26 = v18;
    objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(v18, "cancelButtonText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __60__SBAppDeniedAlertItem_configure_requirePasscodeForActions___block_invoke_3;
    v24[3] = &unk_1E8E9DCB0;
    v24[4] = self;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addAction:", v15);
    objc_msgSend(v5, "addAction:", v19);
    objc_msgSend(v5, "addAction:", v22);
    objc_msgSend(v5, "setPreferredAction:", v15);

  }
  else
  {
    SBLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[SBAppDeniedAlertItem configure:requirePasscodeForActions:].cold.1(v23);

  }
}

uint64_t __60__SBAppDeniedAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
  return objc_msgSend(*(id *)(a1 + 40), "deleteAppHandler");
}

void __60__SBAppDeniedAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
  objc_msgSend(*(id *)(a1 + 40), "learnMoreURL");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  SBWorkspaceActivateApplicationFromURL(v2, 0, 0);

}

uint64_t __60__SBAppDeniedAlertItem_configure_requirePasscodeForActions___block_invoke_3(uint64_t a1)
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

- (void)configure:(os_log_t)log requirePasscodeForActions:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Failed to initialize MISAppDeniedAlert", v1, 2u);
}

@end
