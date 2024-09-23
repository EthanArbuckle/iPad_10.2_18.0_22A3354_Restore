@implementation NSExtension(SafariFoundationExtras)

- (id)sf_bundleIdentifierForContainingApp
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_plugIn");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "containingUrl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithURL:allowPlaceholder:error:", v2, 0, 0);
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_sf_addHandlerForRequestIdentifier:()SafariFoundationExtras withBlock:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  char v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&registrationLock);
    v19 = 0;
    getFinishHandlersForExtension(a1, &v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x212BBA4A8](v8);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v6);

    if (v19)
    {
      objc_initWeak(&location, a1);
      v11 = MEMORY[0x24BDAC760];
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __84__NSExtension_SafariFoundationExtras___sf_addHandlerForRequestIdentifier_withBlock___block_invoke;
      v16[3] = &unk_24C935D48;
      objc_copyWeak(&v17, &location);
      objc_msgSend(a1, "setRequestCompletionBlock:", v16);
      v14[0] = v11;
      v14[1] = 3221225472;
      v14[2] = __84__NSExtension_SafariFoundationExtras___sf_addHandlerForRequestIdentifier_withBlock___block_invoke_2;
      v14[3] = &unk_24C935D70;
      objc_copyWeak(&v15, &location);
      objc_msgSend(a1, "setRequestCancellationBlock:", v14);
      v12[0] = v11;
      v12[1] = 3221225472;
      v12[2] = __84__NSExtension_SafariFoundationExtras___sf_addHandlerForRequestIdentifier_withBlock___block_invoke_3;
      v12[3] = &unk_24C935D98;
      objc_copyWeak(&v13, &location);
      objc_msgSend(a1, "setRequestInterruptionBlock:", v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&registrationLock);

  }
}

- (BOOL)_sf_credentialProviderExtensionNeedsToDeclarePasswordSupport
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  unsigned int v7;
  _BOOL8 v8;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v2 = objc_alloc(MEMORY[0x24BDC1528]);
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v4 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:error:", v3, &v14);
  v5 = v14;

  if (v5)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NSExtension(SafariFoundationExtras) _sf_credentialProviderExtensionNeedsToDeclarePasswordSupport].cold.1((uint64_t)v5, v6);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v4, "platform") - 1;
  if (v7 > 0xB || ((0xC63u >> v7) & 1) == 0)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v10 = qword_20E388870[v7];
  objc_msgSend(v4, "SDKVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length"))
    v8 = v10 <= (int)objc_msgSend(v13, "intValue");
  else
    v8 = 0;

LABEL_7:
  return v8;
}

- (void)_sf_credentialProviderExtensionNeedsToDeclarePasswordSupport
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20E365000, a2, OS_LOG_TYPE_ERROR, "Failed to get application extension record: %@", (uint8_t *)&v2, 0xCu);
}

@end
