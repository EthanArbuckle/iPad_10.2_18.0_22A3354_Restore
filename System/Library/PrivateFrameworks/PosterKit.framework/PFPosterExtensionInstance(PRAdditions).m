@implementation PFPosterExtensionInstance(PRAdditions)

- (id)pr_reloadDescriptorOperationQueue
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const void *key;

  key = a2;
  v3 = a1;
  objc_sync_enter(v3);
  objc_getAssociatedObject(v3, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "instanceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "processIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.posterboard.reloadDescriptorsQueue-%@-%@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v8);

    objc_msgSend(v4, "setQualityOfService:", 25);
    objc_msgSend(v4, "setMaxConcurrentOperationCount:", 1);
    objc_setAssociatedObject(v3, &key, v4, (void *)1);

  }
  objc_sync_exit(v3);

  return v4;
}

- (id)pr_refreshConfigurationOperationQueue
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const void *key;

  key = a2;
  v3 = a1;
  objc_sync_enter(v3);
  objc_getAssociatedObject(v3, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "instanceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "processIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.posterboard.refreshConfigurationQueue-%@-%@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v8);

    objc_msgSend(v4, "setQualityOfService:", 25);
    objc_msgSend(v4, "setMaxConcurrentOperationCount:", 1);
    objc_setAssociatedObject(v3, &key, v4, (void *)1);

  }
  objc_sync_exit(v3);

  return v4;
}

- (id)pr_assetUpdaterWithError:()PRAdditions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  objc_msgSend(a1, "bootupExtensionInstanceWithError:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0D016E0];
    objc_msgSend(v2, "auditToken");
    objc_msgSend(v4, "tokenFromAuditToken:", &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0D87DF8];
    objc_msgSend(a1, "processIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetWithProcessIdentity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[PRUpdatingService updatingServiceWithProcess:auditToken:target:](PRUpdatingService, "updatingServiceWithProcess:auditToken:target:", v3, v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addInstanceObserver:", v9);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)pr_acquireAssetUpdaterWithBlock:()PRAdditions
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, a1);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__PFPosterExtensionInstance_PRAdditions__pr_acquireAssetUpdaterWithBlock___block_invoke;
  v6[3] = &unk_1E21854A8;
  v5 = v4;
  v6[4] = a1;
  v7 = v5;
  objc_copyWeak(&v8, &location);
  objc_msgSend(a1, "bootupExtensionInstance:", v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

- (id)pr_reloadDescriptorOperations
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "pr_reloadDescriptorOperationQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "operations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)pr_addReloadDescriptorOperation:()PRAdditions
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "pr_refreshConfigurationOperationQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperation:", v4);

}

- (id)pr_refreshConfigurationOperations
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "pr_refreshConfigurationOperationQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "operations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)pr_addRefreshConfigurationOperation:()PRAdditions waitUntilFinished:
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "pr_refreshConfigurationOperationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addOperations:waitUntilFinished:", v8, a4);
}

@end
