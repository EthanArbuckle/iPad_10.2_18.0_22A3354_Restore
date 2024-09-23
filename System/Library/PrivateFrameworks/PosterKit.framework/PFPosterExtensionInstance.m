@implementation PFPosterExtensionInstance

void __74__PFPosterExtensionInstance_PRAdditions__pr_acquireAssetUpdaterWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  uint64_t v14;
  void *v15;
  _OWORD v16[2];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0D016E0];
    if (v5)
      objc_msgSend(v5, "auditToken");
    else
      memset(v16, 0, sizeof(v16));
    objc_msgSend(v7, "tokenFromAuditToken:", v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0D87DF8];
    objc_msgSend(*(id *)(a1 + 32), "processIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "targetWithProcessIdentity:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[PRUpdatingService updatingServiceWithProcess:auditToken:target:](PRUpdatingService, "updatingServiceWithProcess:auditToken:target:", v5, v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "addInstanceObserver:", v12);

    v14 = *(_QWORD *)(a1 + 40);
    +[PRUpdatingService updatingServiceWithProcess:auditToken:target:](PRUpdatingService, "updatingServiceWithProcess:auditToken:target:", v5, v8, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v15, 0);

  }
}

@end
