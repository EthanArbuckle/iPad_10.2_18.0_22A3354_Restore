@implementation MAAutoAsset(SUCoreBorderMAAutoAsset)

+ (void)_generateSimulatedResults:()SUCoreBorderMAAutoAsset bytes:
{
  if (a3)
    *a3 = MEMORY[0x1E0C9AA70];
  if (a4)
    *a4 = &unk_1EA89AB38;
}

+ (void)_SUCoreBorder_stageDetermineResultAtBegin:()SUCoreBorderMAAutoAsset withCompletion:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "simAction");
  if (v8 == 3)
  {
    v29 = 0;
    v28 = 0;
    objc_msgSend(a1, "_generateSimulatedResults:bytes:", &v29, &v28);
    v12 = v29;
    v13 = v28;
    v14 = 0;
  }
  else
  {
    if (v8 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 6801;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v6);
      objc_msgSend(v15, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_stageDetermineResultAtBegin"), v16, 8113, 0);

      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 6106;
    }
    objc_msgSend(v9, "generateError:ofDomain:withCode:", CFSTR("_SUCoreBorder_stageDetermineResultAtBegin"), CFSTR("com.apple.MobileAssetError.AutoAsset"), v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    v13 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "completionQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageDetermineResultAtBegin_withCompletion___block_invoke;
  block[3] = &unk_1EA878060;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v7;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = v7;
  dispatch_async(v18, block);

}

+ (void)_SUCoreBorder_stageDetermineResultAtEnd:()SUCoreBorderMAAutoAsset assets:bytes:error:withCompletion:
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = v12;
  v16 = v13;
  v17 = objc_msgSend(v11, "simAction");
  if (v17 == 3)
  {
    v36 = v16;
    v37 = v15;
    objc_msgSend(a1, "_generateSimulatedResults:bytes:", &v37, &v36);
    v20 = v37;

    v21 = v36;
    v19 = 0;
  }
  else if (v17 == 1)
  {

    objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "generateError:ofDomain:withCode:", CFSTR("_SUCoreBorder_stageDetermineResultAtEnd"), CFSTR("com.apple.MobileAssetError.AutoAsset"), 6801);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    v21 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v11);
    objc_msgSend(v22, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_stageDetermineResultAtEnd"), v23, 8113, 0);

    objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "generateError:ofDomain:withCode:", CFSTR("_SUCoreBorder_stageDetermineResultAtEnd"), CFSTR("com.apple.MobileAssetError.AutoAsset"), 6106);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v15;
    v21 = v16;
  }
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "completionQueue");
  v26 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageDetermineResultAtEnd_assets_bytes_error_withCompletion___block_invoke;
  block[3] = &unk_1EA878060;
  v32 = v20;
  v33 = v21;
  v34 = v19;
  v35 = v14;
  v27 = v14;
  v28 = v20;
  v29 = v21;
  v30 = v19;
  dispatch_async(v26, block);

}

+ (void)SUCoreBorder_stageDetermineGroupsAvailableForUpdate:()SUCoreBorderMAAutoAsset completion:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void *)MEMORY[0x1E0DA8988];
  v7 = a4;
  objc_msgSend(v6, "sharedSimulator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "begin:atFunction:", CFSTR("ma"), CFSTR("stageDetermineGroupsAvailableForUpdate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(a1, "_SUCoreBorder_stageDetermineResultAtBegin:withCompletion:", v9, v7);
  else
    objc_msgSend(MEMORY[0x1E0D4E060], "stageDetermineGroupsAvailableForUpdate:completion:", v10, v7);

}

+ (void)_SUCoreBorder_stageDownloadAtBegin:()SUCoreBorderMAAutoAsset withCompletion:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "simAction");
  if (v8 == 3)
  {
    v29 = 0;
    v28 = 0;
    objc_msgSend(a1, "_generateSimulatedResults:bytes:", &v29, &v28);
    v12 = v29;
    v13 = v28;
    v14 = 0;
  }
  else
  {
    if (v8 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 6801;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v6);
      objc_msgSend(v15, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_stageDownloadAtBegin"), v16, 8113, 0);

      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 6106;
    }
    objc_msgSend(v9, "generateError:ofDomain:withCode:", CFSTR("_SUCoreBorder_stageDownloadAtBegin"), CFSTR("com.apple.MobileAssetError.AutoAsset"), v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    v13 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "completionQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageDownloadAtBegin_withCompletion___block_invoke;
  block[3] = &unk_1EA878060;
  v24 = v13;
  v25 = v12;
  v26 = v14;
  v27 = v7;
  v19 = v14;
  v20 = v12;
  v21 = v13;
  v22 = v7;
  dispatch_async(v18, block);

}

+ (void)_SUCoreBorder_stageDownloadAtEnd:()SUCoreBorderMAAutoAsset assets:bytes:error:withCompletion:
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = v12;
  v16 = v13;
  v17 = objc_msgSend(v11, "simAction");
  if (v17 == 3)
  {
    v36 = v16;
    v37 = v15;
    objc_msgSend(a1, "_generateSimulatedResults:bytes:", &v37, &v36);
    v20 = v37;

    v21 = v36;
    v19 = 0;
  }
  else if (v17 == 1)
  {

    objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "generateError:ofDomain:withCode:", CFSTR("_SUCoreBorder_stageDownloadAtEnd"), CFSTR("com.apple.MobileAssetError.AutoAsset"), 6801);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    v21 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v11);
    objc_msgSend(v22, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_stageDownloadAtEnd"), v23, 8113, 0);

    objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "generateError:ofDomain:withCode:", CFSTR("_SUCoreBorder_stageDownloadAtEnd"), CFSTR("com.apple.MobileAssetError.AutoAsset"), 6106);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v15;
    v21 = v16;
  }
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "completionQueue");
  v26 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageDownloadAtEnd_assets_bytes_error_withCompletion___block_invoke;
  block[3] = &unk_1EA878060;
  v32 = v21;
  v33 = v20;
  v34 = v19;
  v35 = v14;
  v27 = v14;
  v28 = v21;
  v29 = v20;
  v30 = v19;
  dispatch_async(v26, block);

}

+ (void)SUCoreBorder_stageDownloadGroups:()SUCoreBorderMAAutoAsset awaitingAllGroups:withStagingTimeout:reportingProgress:completion:
{
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0DA8988];
  v14 = a7;
  objc_msgSend(v13, "sharedSimulator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "begin:atFunction:", CFSTR("ma"), CFSTR("stageDownloadGroups"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(a1, "_SUCoreBorder_stageDownloadAtBegin:withCompletion:", v16, v14);
  else
    objc_msgSend(MEMORY[0x1E0D4E060], "stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:", v17, a4, a5, v12, v14);

}

+ (void)_SUCoreBorder_stageCancelAtBegin:()SUCoreBorderMAAutoAsset withCompletion:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "simAction");
  if (v7 == 3)
  {
    v11 = 0;
  }
  else
  {
    if (v7 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 6801;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v5);
      objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_stageCancelAtBegin"), v13, 8113, 0);

      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 6106;
    }
    objc_msgSend(v8, "generateError:ofDomain:withCode:", CFSTR("_SUCoreBorder_stageCancelAtBegin"), CFSTR("com.apple.MobileAssetError.AutoAsset"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "completionQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageCancelAtBegin_withCompletion___block_invoke;
  block[3] = &unk_1EA878088;
  v19 = v11;
  v20 = v6;
  v16 = v11;
  v17 = v6;
  dispatch_async(v15, block);

}

+ (void)_SUCoreBorder_stageCancelAtEnd:()SUCoreBorderMAAutoAsset operationError:withCompletion:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;

  v6 = a3;
  v7 = a5;
  v8 = objc_msgSend(v6, "simAction");
  if (v8 == 3)
  {
    v12 = 0;
  }
  else
  {
    if (v8 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 6801;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v6);
      objc_msgSend(v13, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_stageCancelAtEnd"), v14, 8113, 0);

      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 6106;
    }
    objc_msgSend(v9, "generateError:ofDomain:withCode:", CFSTR("_SUCoreBorder_stageCancelAtEnd"), CFSTR("com.apple.MobileAssetError.AutoAsset"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "completionQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageCancelAtEnd_operationError_withCompletion___block_invoke;
  block[3] = &unk_1EA878088;
  v20 = v12;
  v21 = v7;
  v17 = v7;
  v18 = v12;
  dispatch_async(v16, block);

}

+ (void)SUCoreBorder_stageCancelOperation:()SUCoreBorderMAAutoAsset
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0DA8988];
  v5 = a3;
  objc_msgSend(v4, "sharedSimulator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "begin:atFunction:", CFSTR("ma"), CFSTR("stageCancelOperation"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(a1, "_SUCoreBorder_stageCancelAtBegin:withCompletion:", v7, v5);
  else
    objc_msgSend(MEMORY[0x1E0D4E060], "stageCancelOperation:", v5);

}

+ (void)_SUCoreBorder_stagePurgeAllAtBegin:()SUCoreBorderMAAutoAsset withCompletion:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "simAction");
  if (v7 == 3)
  {
    v11 = 0;
  }
  else
  {
    if (v7 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 6801;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v5);
      objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_stagePurgeAllAtBegin"), v13, 8113, 0);

      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 6106;
    }
    objc_msgSend(v8, "generateError:ofDomain:withCode:", CFSTR("_SUCoreBorder_stagePurgeAllAtBegin"), CFSTR("com.apple.MobileAssetError.AutoAsset"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "completionQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stagePurgeAllAtBegin_withCompletion___block_invoke;
  block[3] = &unk_1EA878088;
  v19 = v11;
  v20 = v6;
  v16 = v11;
  v17 = v6;
  dispatch_async(v15, block);

}

+ (void)_SUCoreBorder_stagePurgeAllAtEnd:()SUCoreBorderMAAutoAsset operationError:withCompletion:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;

  v6 = a3;
  v7 = a5;
  v8 = objc_msgSend(v6, "simAction");
  if (v8 == 3)
  {
    v12 = 0;
  }
  else
  {
    if (v8 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 6801;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v6);
      objc_msgSend(v13, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_stagePurgeAllAtEnd"), v14, 8113, 0);

      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 6106;
    }
    objc_msgSend(v9, "generateError:ofDomain:withCode:", CFSTR("_SUCoreBorder_stagePurgeAllAtEnd"), CFSTR("com.apple.MobileAssetError.AutoAsset"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "completionQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stagePurgeAllAtEnd_operationError_withCompletion___block_invoke;
  block[3] = &unk_1EA878088;
  v20 = v12;
  v21 = v7;
  v17 = v7;
  v18 = v12;
  dispatch_async(v16, block);

}

+ (void)SUCoreBorder_stagePurgeAll:()SUCoreBorderMAAutoAsset
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "begin:atFunction:", CFSTR("ma"), CFSTR("stagePurgeAll"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "_SUCoreBorder_stageCancelAtBegin:withCompletion:", v6, v4);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0D4E060];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__MAAutoAsset_SUCoreBorderMAAutoAsset__SUCoreBorder_stagePurgeAll___block_invoke;
    v8[3] = &unk_1EA8780B0;
    v9 = v4;
    v10 = a1;
    objc_msgSend(v7, "stagePurgeAll:", v8);

  }
}

@end
