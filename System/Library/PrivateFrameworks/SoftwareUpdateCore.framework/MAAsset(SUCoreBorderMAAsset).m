@implementation MAAsset(SUCoreBorderMAAsset)

+ (void)SUCoreBorder_startCatalogDownload:()SUCoreBorderMAAsset options:completionWithError:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "begin:atFunction:", CFSTR("ma"), CFSTR("startCatalogDownload"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D4E038];
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MADownloadResultAtBegin:withCompletion:", v11, v9);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __94__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_startCatalogDownload_options_completionWithError___block_invoke;
    v13[3] = &unk_1EA877F98;
    v14 = v9;
    objc_msgSend(v12, "startCatalogDownload:options:completionWithError:", v7, v8, v13);

  }
}

+ (void)SUCoreBorder_cancelCatalogDownload:()SUCoreBorderMAAsset completionWithCancelResult:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "begin:atFunction:", CFSTR("ma"), CFSTR("cancelCatalogDownload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D4E038];
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MACancelDownloadResultAtBegin:withCompletion:", v8, v6);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __94__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_cancelCatalogDownload_completionWithCancelResult___block_invoke;
    v10[3] = &unk_1EA877FC0;
    v11 = v6;
    objc_msgSend(v9, "cancelCatalogDownload:then:", v5, v10);

  }
}

- (void)SUCoreBorder_startDownload:()SUCoreBorderMAAsset completionWithError:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "begin:atFunction:", CFSTR("ma"), CFSTR("startDownload"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MADownloadResultAtBegin:withCompletion:", v9, v7);
  }
  else
  {
    objc_msgSend(v6, "sessionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_prepAndSendDownloadStartedSplunkEvent:", v10);

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_startDownload_completionWithError___block_invoke;
    v11[3] = &unk_1EA877FE8;
    v11[4] = a1;
    v12 = v6;
    v13 = v7;
    objc_msgSend(a1, "startDownload:completionWithError:", v12, v11);

  }
}

- (void)SUCoreBorder_purgeWithError:()SUCoreBorderMAAsset
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "begin:atFunction:", CFSTR("ma"), CFSTR("purgeWithError"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MAPurgeResultAtBegin:withCompletion:", v6, v4);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_purgeWithError___block_invoke;
    v7[3] = &unk_1EA877F98;
    v8 = v4;
    objc_msgSend(a1, "purgeWithError:", v7);

  }
}

- (void)SUCoreBorder_cancelDownload:()SUCoreBorderMAAsset
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "begin:atFunction:", CFSTR("ma"), CFSTR("cancelDownload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MACancelDownloadResultAtBegin:withCompletion:", v6, v4);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_cancelDownload___block_invoke;
    v7[3] = &unk_1EA877FC0;
    v8 = v4;
    objc_msgSend(a1, "cancelDownload:", v7);

  }
}

- (void)SUCoreBorder_configDownload:()SUCoreBorderMAAsset completion:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "begin:atFunction:", CFSTR("ma"), CFSTR("configDownload"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MAOperationResultAtBegin:withCompletion:", v9, v7);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_configDownload_completion___block_invoke;
    v10[3] = &unk_1EA877FC0;
    v11 = v7;
    objc_msgSend(a1, "configDownload:completion:", v6, v10);

  }
}

- (uint64_t)SUCoreBorder_refreshState
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "begin:atFunction:", CFSTR("ma"), CFSTR("refreshState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MABoolResultAtBegin:", v3);
  }
  else
  {
    v4 = objc_msgSend(a1, "refreshState");
    objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "end:atFunction:", CFSTR("ma"), CFSTR("refreshState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v4 = objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MABoolResultAtEnd:withResult:", v6, v4);

  }
  return v4;
}

- (uint64_t)SUCoreBorder_state
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "begin:atFunction:", CFSTR("ma"), CFSTR("state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MAAssetState:", v3);
  }
  else
  {
    v4 = objc_msgSend(a1, "state");
    objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "end:atFunction:", CFSTR("ma"), CFSTR("state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v4 = objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MAAssetState:", v6);

  }
  return v4;
}

- (id)SUCoreBorder_attributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "begin:atFunction:", CFSTR("ma"), CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MAAttributesAtBegin:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "attributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "end:atFunction:", CFSTR("ma"), CFSTR("attributes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MAAttributesAtEnd:withBaseAttributes:", v6, v4);
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }

  }
  return v4;
}

+ (id)SUCoreBorder_loadSync:()SUCoreBorderMAAsset allowingDifferences:withPurpose:error:simulateForDescriptor:simulateForType:
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v27;
  id v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "begin:atFunction:", CFSTR("ma"), CFSTR("loadSync"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MAAssetResultAtBegin:withDescriptor:type:error:", v18, v16, a8, a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = v14;
    v28 = v13;
    v20 = v13;
    v21 = a6;
    objc_msgSend(MEMORY[0x1E0D4E038], "loadSync:allowingDifferences:withPurpose:error:", v20, v14, v15, a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "end:atFunction:", CFSTR("ma"), CFSTR("loadSync"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MAAssetResultAtEnd:withDescriptor:type:withResult:error:", v24, v16, a8, v22, v21);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = v22;
    }
    v19 = v25;

    v14 = v27;
    v13 = v28;
  }

  return v19;
}

+ (void)_SUCoreBorder_MADownloadResultAtBegin:()SUCoreBorderMAAsset withCompletion:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint64_t v19;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "simAction");
  if (v7 == 3)
  {
    v9 = 0;
    v10 = 0;
  }
  else
  {
    if (v7 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 3;
      objc_msgSend(v8, "generateError:ofDomain:withCode:", CFSTR("_SUCoreBorder_MADownloadResultAtBegin"), CFSTR("com.apple.MobileAssetError.Download"), 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v5);
      objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MADownloadResultAtBegin"), v11, 8113, 0);

      v10 = 0;
      v9 = 35;
    }

  }
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "completionQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MADownloadResultAtBegin_withCompletion___block_invoke;
  block[3] = &unk_1EA878010;
  v18 = v6;
  v19 = v9;
  v17 = v10;
  v14 = v10;
  v15 = v6;
  dispatch_async(v13, block);

}

+ (void)_SUCoreBorder_MADownloadResultAtEnd:()SUCoreBorderMAAsset withResult:withError:withCompletion:
{
  id v9;
  void (**v10)(id, uint64_t, void *);
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a5;
  v10 = a6;
  v11 = objc_msgSend(v15, "simAction");
  if (v11 == 3)
  {
    a4 = 0;
    v13 = 0;
    v12 = v9;
  }
  else
  {
    if (v11 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      a4 = 3;
      objc_msgSend(v12, "generateError:ofDomain:withCode:", CFSTR("_SUCoreBorder_MADownloadResultAtEnd"), CFSTR("com.apple.MobileAssetError.Download"), 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v15);
      objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MADownloadResultAtEnd"), v14, 8113, 0);
      v13 = v9;
    }

  }
  v10[2](v10, a4, v13);

}

+ (void)_SUCoreBorder_MAPurgeResultAtBegin:()SUCoreBorderMAAsset withCompletion:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint64_t v19;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "simAction");
  if (v7 == 3)
  {
    v9 = 0;
    v10 = 0;
  }
  else
  {
    if (v7 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 5;
      objc_msgSend(v8, "generateError:ofDomain:withCode:", CFSTR("_SUCoreBorder_MAPurgeResultAtBegin"), CFSTR("com.apple.MobileAssetError.Purge"), 5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v5);
      objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MAPurgeResultAtBegin"), v11, 8113, 0);

      v10 = 0;
      v9 = 6;
    }

  }
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "completionQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MAPurgeResultAtBegin_withCompletion___block_invoke;
  block[3] = &unk_1EA878010;
  v18 = v6;
  v19 = v9;
  v17 = v10;
  v14 = v10;
  v15 = v6;
  dispatch_async(v13, block);

}

+ (void)_SUCoreBorder_MAPurgeResultAtEnd:()SUCoreBorderMAAsset withResult:withError:withCompletion:
{
  id v9;
  void (**v10)(id, uint64_t, void *);
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a5;
  v10 = a6;
  v11 = objc_msgSend(v15, "simAction");
  if (v11 == 3)
  {
    a4 = 0;
    v13 = 0;
    v12 = v9;
  }
  else
  {
    if (v11 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      a4 = 5;
      objc_msgSend(v12, "generateError:ofDomain:withCode:", CFSTR("_SUCoreBorder_MAPurgeResultAtEnd"), CFSTR("com.apple.MobileAssetError.Purge"), 5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v15);
      objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MAPurgeResultAtEnd"), v14, 8113, 0);
      v13 = v9;
    }

  }
  v10[2](v10, a4, v13);

}

+ (void)_SUCoreBorder_MACancelDownloadResultAtBegin:()SUCoreBorderMAAsset withCompletion:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "simAction");
  if (v7 == 1)
  {
    v8 = 4;
  }
  else if (v7 == 3)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v5);
    objc_msgSend(v9, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MACancelDownloadResultAtBegin"), v10, 8113, 0);

    v8 = 5;
  }
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "completionQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MACancelDownloadResultAtBegin_withCompletion___block_invoke;
  block[3] = &unk_1EA878038;
  v15 = v6;
  v16 = v8;
  v13 = v6;
  dispatch_async(v12, block);

}

+ (void)_SUCoreBorder_MACancelDownloadResultAtEnd:()SUCoreBorderMAAsset withResult:withCompletion:
{
  void (**v7)(id, uint64_t);
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a5;
  v8 = objc_msgSend(v11, "simAction");
  if (v8 == 1)
  {
    a4 = 4;
  }
  else if (v8 == 3)
  {
    a4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v11);
    objc_msgSend(v9, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MACancelDownloadResultAtEnd"), v10, 8113, 0);

  }
  v7[2](v7, a4);

}

+ (void)_SUCoreBorder_MAOperationResultAtBegin:()SUCoreBorderMAAsset withCompletion:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "simAction");
  if (v7 == 1)
  {
    v8 = 2;
  }
  else if (v7 == 3)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v5);
    objc_msgSend(v9, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MAOperationResultAtBegin"), v10, 8113, 0);

    v8 = 4;
  }
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "completionQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MAOperationResultAtBegin_withCompletion___block_invoke;
  block[3] = &unk_1EA878038;
  v15 = v6;
  v16 = v8;
  v13 = v6;
  dispatch_async(v12, block);

}

+ (void)_SUCoreBorder_MAOperationResultAtEnd:()SUCoreBorderMAAsset withResult:withCompletion:
{
  void (**v7)(id, uint64_t);
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a5;
  v8 = objc_msgSend(v11, "simAction");
  if (v8 == 1)
  {
    a4 = 2;
  }
  else if (v8 == 3)
  {
    a4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v11);
    objc_msgSend(v9, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MAOperationResultAtEnd"), v10, 8113, 0);

  }
  v7[2](v7, a4);

}

+ (uint64_t)_SUCoreBorder_MABoolResultAtBegin:()SUCoreBorderMAAsset
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "simAction");
  if (v4 == 1)
    goto LABEL_5;
  if (v4 != 3)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v3);
    objc_msgSend(v6, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MABoolResultAtBegin"), v7, 8113, 0);

LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v5 = 1;
LABEL_6:

  return v5;
}

+ (uint64_t)_SUCoreBorder_MABoolResultAtEnd:()SUCoreBorderMAAsset withResult:
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = objc_msgSend(v5, "simAction");
  if (v6 == 1)
  {
    a4 = 0;
  }
  else if (v6 == 3)
  {
    a4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v5);
    objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MABoolResultAtEnd"), v8, 8113, 0);

  }
  return a4;
}

+ (id)_SUCoreBorder_MAAssetResultAtBegin:()SUCoreBorderMAAsset withDescriptor:type:error:
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = objc_msgSend(v10, "simAction");
  if (v12 == 3)
  {
    objc_msgSend(a1, "_getSimulatedAssetForDescriptor:type:", v11, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v12 == 1)
    {
      objc_msgSend(v10, "buildErrorWithDescription:", CFSTR("SUCoreError created by _SUCoreBorder_MAAssetResultAtBegin"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      if (!a6)
        goto LABEL_9;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v10);
    objc_msgSend(v15, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MAAssetResultAtBegin"), v16, 8113, 0);

    v14 = 0;
  }
  v13 = 0;
  if (a6)
LABEL_8:
    *a6 = objc_retainAutorelease(v13);
LABEL_9:

  return v14;
}

+ (id)_SUCoreBorder_MAAssetResultAtEnd:()SUCoreBorderMAAsset withDescriptor:type:withResult:error:
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (a7)
    v15 = *a7;
  else
    v15 = 0;
  v16 = v15;
  v17 = objc_msgSend(v12, "simAction");
  if (v17 == 3)
  {
    objc_msgSend(a1, "_getSimulatedAssetForDescriptor:type:", v13, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v16;
    v16 = 0;
  }
  else if (v17 == 1)
  {

    objc_msgSend(v12, "buildErrorWithDescription:", CFSTR("SUCoreError created by _SUCoreBorder_MAAssetResultAtEnd"));
    v18 = 0;
    v19 = v16;
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v12);
    objc_msgSend(v19, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MAAssetResultAtEnd"), v20, 8113, 0);

    v18 = v14;
  }

  if (a7)
    *a7 = objc_retainAutorelease(v16);

  return v18;
}

+ (uint64_t)_SUCoreBorder_MAAssetState:()SUCoreBorderMAAsset
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "simAction") != 3)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v3);
    objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MAAssetState"), v8, 8113, 0);

    v6 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v3, "assetState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("MAUnknown"));

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v3, "assetState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("MANotPresent"));

    if ((v10 & 1) != 0)
    {
      v6 = 1;
      goto LABEL_17;
    }
    objc_msgSend(v3, "assetState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("MAInstalled"));

    if ((v12 & 1) != 0)
    {
      v6 = 2;
      goto LABEL_17;
    }
    objc_msgSend(v3, "assetState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("MAInstalledNotInCatalog"));

    if ((v14 & 1) != 0)
    {
      v6 = 3;
      goto LABEL_17;
    }
    objc_msgSend(v3, "assetState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("MADownloading"));

    if ((v16 & 1) != 0)
    {
      v6 = 4;
      goto LABEL_17;
    }
    objc_msgSend(v3, "assetState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("MARequiredByOs"));

    if ((v18 & 1) != 0)
    {
      v6 = 5;
      goto LABEL_17;
    }
    objc_msgSend(v3, "assetState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("MAInstalledWithOs"));

    if ((v20 & 1) != 0)
    {
      v6 = 6;
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event asset state, event: %@"), v3);
    objc_msgSend(v25, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MAAssetState"), v26, 8113, 0);

  }
  v6 = 0;
LABEL_17:
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "oslog");
  v22 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "assetState");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v23;
    v29 = 2048;
    v30 = v6;
    _os_log_impl(&dword_1DDFDD000, v22, OS_LOG_TYPE_DEFAULT, "[BORDER_MA_STATE] using simulated state:%@ (enum:%ld)", buf, 0x16u);

  }
LABEL_20:

  return v6;
}

+ (id)_SUCoreBorder_MAAttributesAtBegin:()SUCoreBorderMAAsset
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "simAction");
  if (v4 == 3)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v3, "assetAttributesPlist");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithContentsOfFile:", v8);

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "[BORDER_MA_ATTRIBUTES] using simulated attributes:%@", buf, 0xCu);
    }

  }
  else
  {
    if (v4 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "oslog");
      v6 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DDFDD000, v6, OS_LOG_TYPE_DEFAULT, "[BORDER_MA_ATTRIBUTES] simulating missing attributes", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v6 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v3);
      -[NSObject trackAnomaly:forReason:withResult:withError:](v6, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MAAttributesAtBegin"), v12, 8113, 0);

    }
    v9 = 0;
  }

  return v9;
}

+ (id)_SUCoreBorder_MAAttributesAtEnd:()SUCoreBorderMAAsset withBaseAttributes:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "simAction");
  if (v7 == 3)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v6);
    v11 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v5, "assetAttributesPlist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithContentsOfFile:", v12);

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "oslog");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl(&dword_1DDFDD000, v15, OS_LOG_TYPE_DEFAULT, "[BORDER_MA_ATTRIBUTES] simulating additional/replaced attributes:%@", buf, 0xCu);
    }

    objc_msgSend(v10, "addEntriesFromDictionary:", v13);
  }
  else
  {
    if (v7 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "oslog");
      v9 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "[BORDER_MA_ATTRIBUTES] simulating missing attributes", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v9 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v5);
      -[NSObject trackAnomaly:forReason:withResult:withError:](v9, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MAAttributesAtEnd"), v16, 8113, 0);

    }
    v10 = 0;
  }

  return v10;
}

+ (id)_getSimulatedAssetForDescriptor:()SUCoreBorderMAAsset type:
{
  id v5;
  void *v6;
  void *v7;
  int isUpdateBrainAssetType;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = v5;
  if (a4 == 2)
  {
    objc_msgSend(v5, "documentationAssetType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "productBuildVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "productVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentationID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentationAssetPurpose");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _getNewDocumentationMAAssetAttributesDictionary(v9, v10, v11, v13, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_9;
  }
  if (a4 != 1)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", CFSTR("_getSimulatedAssetForDescriptor"), CFSTR("unsupported SUCoreBorderMobileAssetType"), 8113, 0);
    v15 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v5, "softwareUpdateAssetType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isUpdateBrainAssetType = _isUpdateBrainAssetType(v7);

  objc_msgSend(v6, "softwareUpdateAssetType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "productBuildVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isUpdateBrainAssetType)
  {
    objc_msgSend(v6, "productVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "releaseType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prerequisiteBuild");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prerequisiteOSVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "softwareUpdateAssetPurpose");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _getNewSoftwareUpdateMAAssetAttributesDictionary(v9, v10, v11, v13, v14, v16, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  objc_msgSend(v6, "softwareUpdateAssetPurpose");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _getNewUpdateBrainMAAssetAttributesDictionary(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  if (!v12)
  {
    v15 = 0;
    goto LABEL_13;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E038]), "initWithAttributes:", v12);
LABEL_11:

LABEL_13:
  return v15;
}

- (void)_setCommonSplunkFields:()SUCoreBorderMAAsset withSessionId:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("_DownloadSize"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (void *)*MEMORY[0x1E0DA8B60];
  if (v17)
    v10 = v17;
  else
    v10 = (id)*MEMORY[0x1E0DA8B60];
  objc_msgSend(v7, "setSafeObject:forKey:", v10, *MEMORY[0x1E0DA8B00]);
  objc_msgSend(a1, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("AssetType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = v12;
  else
    v13 = v9;
  objc_msgSend(v7, "setSafeObject:forKey:", v13, *MEMORY[0x1E0DA8AE0]);
  objc_msgSend(a1, "attributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("Build"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v16 = v15;
  else
    v16 = v9;
  objc_msgSend(v7, "setSafeObject:forKey:", v16, *MEMORY[0x1E0DA8B48]);
  objc_msgSend(v7, "setSafeObject:forKey:", v6, *MEMORY[0x1E0DA8B58]);

}

- (void)_prepAndSendDownloadStartedSplunkEvent:()SUCoreBorderMAAsset
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_opt_new();
  objc_msgSend(v6, "setSafeObject:forKey:", *MEMORY[0x1E0DA8B40], *MEMORY[0x1E0DA8B18]);
  objc_msgSend(a1, "_setCommonSplunkFields:withSessionId:", v6, v4);

  objc_msgSend(MEMORY[0x1E0DA8950], "sharedReporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendEvent:", v6);

}

- (void)_prepAndSendDownloadFinishedSplunkEvent:()SUCoreBorderMAAsset withError:withSessionId:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setSafeObject:forKey:", *MEMORY[0x1E0DA8B38], *MEMORY[0x1E0DA8B18]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSafeObject:forKey:", v10, *MEMORY[0x1E0DA8AF8]);

  if (a3)
  {
    objc_msgSend(v13, "checkedNameForCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSafeObject:forKey:", v11, *MEMORY[0x1E0DA8AF0]);

  }
  objc_msgSend(a1, "_setCommonSplunkFields:withSessionId:", v9, v8);
  objc_msgSend(MEMORY[0x1E0DA8950], "sharedReporter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendEvent:", v9);

}

@end
