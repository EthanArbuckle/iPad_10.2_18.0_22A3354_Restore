@implementation SBWebClipEligibilityAlertItem

- (SBWebClipEligibilityAlertItem)initWithWebClip:(id)a3
{
  id v5;
  SBWebClipEligibilityAlertItem *v6;
  SBWebClipEligibilityAlertItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBWebClipEligibilityAlertItem;
  v6 = -[SBAlertItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_webClip, a3);

  return v7;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[SBWebClipEligibilityAlertItem webClip](self, "webClip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __69__SBWebClipEligibilityAlertItem_configure_requirePasscodeForActions___block_invoke;
  v22[3] = &unk_1E8EA1598;
  objc_copyWeak(&v24, &location);
  v8 = v7;
  v23 = v8;
  objc_msgSend(v6, "eligibilityAlert:", v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v10);

  objc_msgSend(v9, "message");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v11);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v9, "actions", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "copy");
        objc_msgSend(v5, "addAction:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }

  objc_msgSend(v9, "preferredAction");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredAction:", v17);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __69__SBWebClipEligibilityAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "deactivateForReason:", 2);

  if (a2)
    SBWorkspaceActivateApplicationFromURL(*(void **)(a1 + 32), 0, &__block_literal_global_19);
}

uint64_t __69__SBWebClipEligibilityAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSource:", 1);
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (BOOL)dismissOnLock
{
  return 1;
}

- (UIWebClip)webClip
{
  return self->_webClip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webClip, 0);
}

@end
