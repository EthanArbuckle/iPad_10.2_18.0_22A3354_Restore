@implementation NSFileProviderManager(BRCAdditions)

- (void)br_removeDomain:()BRCAdditions sync:completionHandler:
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__NSFileProviderManager_BRCAdditions__br_removeDomain_sync_completionHandler___block_invoke;
  v10[3] = &unk_24FE483B0;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "br_removeDomain:options:sync:completionHandler:", a3, 0, a4, v10);

}

- (void)_br_removeDomain:()BRCAdditions options:retries:completionHandler:
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22[3];
  id location;

  v10 = a3;
  v11 = a6;
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentPersona");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userPersonaUniqueString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, a1);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __90__NSFileProviderManager_BRCAdditions___br_removeDomain_options_retries_completionHandler___block_invoke;
  v18[3] = &unk_24FE48400;
  v15 = v11;
  v21 = v15;
  v22[1] = a5;
  objc_copyWeak(v22, &location);
  v16 = v14;
  v19 = v16;
  v17 = v10;
  v20 = v17;
  v22[2] = a4;
  objc_msgSend(a1, "removeDomain:options:completionHandler:", v17, a4, v18);

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

}

- (uint64_t)br_removeDomain:()BRCAdditions options:completionHandler:
{
  return objc_msgSend(a1, "_br_removeDomain:options:retries:completionHandler:", a3, a4, 1, a5);
}

- (void)br_removeDomain:()BRCAdditions options:sync:completionHandler:
{
  id v10;
  void (**v11)(id, _QWORD, id);
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(id, _QWORD, id);
  uint64_t *v22;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  if (a5)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__45;
    v32 = __Block_byref_object_dispose__45;
    v33 = 0;
    v12 = (void *)MEMORY[0x24BE176A8];
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "xpcConnectionFailureRetries");
    v27 = 0;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __86__NSFileProviderManager_BRCAdditions__br_removeDomain_options_sync_completionHandler___block_invoke;
    v23[3] = &unk_24FE48428;
    v23[4] = a1;
    v15 = v10;
    v24 = v15;
    v25 = &v28;
    v26 = a4;
    LODWORD(v12) = objc_msgSend(v12, "executeXPCWithMaxRetries:error:block:", v14, &v27, v23);
    v16 = v27;

    if ((_DWORD)v12)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[NSFileProviderManager(BRCAdditions) br_removeDomain:options:sync:completionHandler:].cold.1((uint64_t)v15, (uint64_t)v17, v18);
    }
    else
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v35 = v15;
        v36 = 2112;
        v37 = v16;
        v38 = 2112;
        v39 = v17;
        _os_log_error_impl(&dword_230455000, v18, (os_log_type_t)0x90u, "[ERROR] couldn't remove domain %@ in a sync way: %@%@", buf, 0x20u);
      }
    }

    v11[2](v11, v29[5], v16);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__45;
    v32 = __Block_byref_object_dispose__45;
    v33 = 0;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __86__NSFileProviderManager_BRCAdditions__br_removeDomain_options_sync_completionHandler___block_invoke_6;
    v19[3] = &unk_24FE48450;
    v22 = &v28;
    v20 = v10;
    v21 = v11;
    objc_msgSend(a1, "br_removeDomain:options:completionHandler:", v20, a4, v19);

    _Block_object_dispose(&v28, 8);
  }

}

+ (uint64_t)br_importDomain:()BRCAdditions forProviderIdentifier:fromDirectoryAtURL:error:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x24BE176A8];
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "xpcConnectionFailureRetries");
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __102__NSFileProviderManager_BRCAdditions__br_importDomain_forProviderIdentifier_fromDirectoryAtURL_error___block_invoke;
  v20[3] = &unk_24FE48478;
  v21 = v9;
  v22 = v10;
  v23 = v11;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  v18 = objc_msgSend(v12, "executeXPCWithMaxRetries:error:block:", v14, a6, v20);

  return v18;
}

+ (uint64_t)br_importDomain:()BRCAdditions forProviderIdentifier:fromDirectoryAtURL:knownFolders:error:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)MEMORY[0x24BE176A8];
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "xpcConnectionFailureRetries");
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __115__NSFileProviderManager_BRCAdditions__br_importDomain_forProviderIdentifier_fromDirectoryAtURL_knownFolders_error___block_invoke;
  v24[3] = &unk_24FE484A0;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v28 = v14;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  v21 = v11;
  v22 = objc_msgSend(v15, "executeXPCWithMaxRetries:error:block:", v17, a7, v24);

  return v22;
}

+ (uint64_t)br_addDomain:()BRCAdditions forProviderIdentifier:error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x24BE176A8];
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "xpcConnectionFailureRetries");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __80__NSFileProviderManager_BRCAdditions__br_addDomain_forProviderIdentifier_error___block_invoke;
  v16[3] = &unk_24FE484C8;
  v17 = v7;
  v18 = v8;
  v12 = v8;
  v13 = v7;
  v14 = objc_msgSend(v9, "executeXPCWithMaxRetries:error:block:", v11, a5, v16);

  return v14;
}

- (void)br_addDomain:()BRCAdditions completionHandler:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BE176A8];
  v8 = a4;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "xpcConnectionFailureRetries");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70__NSFileProviderManager_BRCAdditions__br_addDomain_completionHandler___block_invoke;
  v12[3] = &unk_24FE45DC8;
  v12[4] = a1;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v7, "executeAsyncXPCWithMaxRetries:completion:xpcInvokeBlock:", v10, v8, v12);

}

- (void)br_signalEnumeratorForContainerItemIdentifier:()BRCAdditions completionHandler:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BE176A8];
  v8 = a4;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "xpcConnectionFailureRetries");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __103__NSFileProviderManager_BRCAdditions__br_signalEnumeratorForContainerItemIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_24FE45DC8;
  v12[4] = a1;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v7, "executeAsyncXPCWithMaxRetries:completion:xpcInvokeBlock:", v10, v8, v12);

}

- (uint64_t)br_signalWorkingSetEnumeratorWithCompletionHandler:()BRCAdditions
{
  return objc_msgSend(a1, "br_signalEnumeratorForContainerItemIdentifier:completionHandler:", *MEMORY[0x24BDC8238], a3);
}

- (void)br_removeDomain:()BRCAdditions options:sync:completionHandler:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_230455000, a2, a3, "[DEBUG] Successfully removed domain %@ in a sync way%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_0();
}

@end
