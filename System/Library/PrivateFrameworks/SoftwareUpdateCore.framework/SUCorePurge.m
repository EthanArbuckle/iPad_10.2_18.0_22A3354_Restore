@implementation SUCorePurge

+ (void)previousUpdateState:(BOOL *)a3 tetheredRestore:(BOOL *)a4 failedBackward:(BOOL *)a5 failedForward:(BOOL *)a6
{
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[12];
  unsigned int v26;

  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("purge.PreviousUpdateState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  +[SUCorePurge _trackPurgeBegin:](SUCorePurge, "_trackPurgeBegin:", CFSTR("MSURetrievePreviousUpdateState"));
  if (SUCoreBorder_MSURetrievePreviousUpdateState())
  {
    switch(v26)
    {
      case 0u:
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "oslog");
        v12 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "[PURGE] MSU previous update state:kMSUUpdateStateNone [tethered restore]", buf, 2u);
        }

        if (!a4)
          goto LABEL_30;
        v13 = 0;
        *a4 = 1;
        break;
      case 1u:
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "oslog");
        v21 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_1DDFDD000, v21, OS_LOG_TYPE_DEFAULT, "[PURGE] MSU previous update state:kMSUUpdateStateSuccessful [successful OTA]", v24, 2u);
        }

        if (!a3)
          goto LABEL_30;
        v13 = 0;
        *a3 = 1;
        break;
      case 2u:
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "oslog");
        v16 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_1DDFDD000, v16, OS_LOG_TYPE_DEFAULT, "[PURGE] MSU previous update state:kMSUUpdateStateFailedBackward [OTA attempt failed back to previous OS]", v23, 2u);
        }

        if (!a5)
          goto LABEL_30;
        v13 = 0;
        *a5 = 1;
        break;
      case 3u:
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "oslog");
        v18 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_1DDFDD000, v18, OS_LOG_TYPE_DEFAULT, "[PURGE] MSU previous update state:kMSUUpdateStateFailedForward [OTA attempt encountered failure but continued to the new OS]", v22, 2u);
        }

        if (a6)
        {
          v13 = 0;
          *a6 = 1;
        }
        else
        {
LABEL_30:
          v13 = 0;
        }
        break;
      default:
        objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown previous update state: %d"), v26);
        objc_msgSend(v14, "buildError:underlying:description:", 8116, 0, v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "buildError:underlying:description:", 8802, 0, CFSTR("MSURetrievePreviousUpdateState failed to provide state"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  }
  +[SUCorePurge _trackPurgeEnd:withResult:withError:](SUCorePurge, "_trackPurgeEnd:withResult:withError:", CFSTR("MSURetrievePreviousUpdateState"), objc_msgSend(v13, "code"), v13);
  objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v10, CFSTR("purge.PreviousUpdateState"));

}

+ (void)checkForExistingPrepare:(id)a3
{
  objc_msgSend(a1, "checkForExistingPrepareWithCompletionQueue:completion:", 0, a3);
}

+ (void)checkForExistingPrepareWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("purge.CheckForExistingPrepare"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "buildError:underlying:description:", 8113, 0, CFSTR("checkForExistingPrepare not yet supported by MSU SPI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trackError:forReason:withResult:withError:", CFSTR("[PURGE]"), CFSTR("checkForExistingPrepare not yet supported"), 8113, v9);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectCompletionQueue:", v5);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__SUCorePurge_checkForExistingPrepareWithCompletionQueue_completion___block_invoke;
    block[3] = &unk_1EA877E80;
    v16 = v6;
    v14 = v9;
    v15 = v7;
    dispatch_async(v12, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v7, CFSTR("purge.CheckForExistingPrepare"));
  }

}

uint64_t __69__SUCorePurge_checkForExistingPrepareWithCompletionQueue_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("purge.CheckForExistingPrepare"));
}

+ (void)checkForExistingAssetsWithPolicy:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "checkForExistingAssetsWithPolicy:withCompletionQueue:completion:", a3, 0, a4);
}

+ (void)checkForExistingAssetsWithPolicy:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0DA8920];
  v10 = a3;
  objc_msgSend(v9, "beginTransactionWithName:", CFSTR("purge.CheckForExistingAssets"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "copy");

  objc_msgSend(v12, "softwareUpdateAssetType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke;
  v18[3] = &unk_1EA879480;
  v19 = v12;
  v20 = v7;
  v21 = v11;
  v22 = v8;
  v14 = v11;
  v15 = v7;
  v16 = v8;
  v17 = v12;
  +[SUCorePurge checkForAssetsOfType:withCompletionQueue:completion:](SUCorePurge, "checkForAssetsOfType:withCompletionQueue:completion:", v13, 0, v18);

}

void __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "documentationAssetType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke_2;
  v10[3] = &unk_1EA879458;
  v15 = a1[7];
  v11 = v6;
  v12 = a1[5];
  v13 = v5;
  v14 = a1[6];
  v8 = v5;
  v9 = v6;
  +[SUCorePurge checkForAssetsOfType:withCompletionQueue:completion:](SUCorePurge, "checkForAssetsOfType:withCompletionQueue:completion:", v7, 0, v10);

}

void __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 64))
  {
    v7 = *(id *)(a1 + 32);
    v8 = v7;
    if (v6 && !v7)
      v8 = v6;
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectCompletionQueue:", *(_QWORD *)(a1 + 40));
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke_3;
    block[3] = &unk_1EA878A08;
    v17 = *(id *)(a1 + 64);
    v13 = v5;
    v14 = *(id *)(a1 + 48);
    v15 = v8;
    v16 = *(id *)(a1 + 56);
    v11 = v8;
    dispatch_async(v10, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 56), CFSTR("purge.CheckForExistingAssets"));
  }

}

uint64_t __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 56), CFSTR("purge.CheckForExistingAssets"));
}

+ (void)checkForAssetsOfType:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "checkForAssetsOfType:withCompletionQueue:completion:", a3, 0, a4);
}

+ (void)checkForAssetsOfType:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "waitedOperationQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SUCorePurge_checkForAssetsOfType_withCompletionQueue_completion___block_invoke;
  block[3] = &unk_1EA878968;
  v17 = v8;
  v18 = v9;
  v16 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v7;
  dispatch_async(v11, block);

}

void __67__SUCorePurge_checkForAssetsOfType_withCompletionQueue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setDoNotBlockBeforeFirstUnlock:", 1);
  objc_msgSend(v2, "returnTypes:", 1);
  v3 = objc_msgSend(v2, "queryMetaDataSync");
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to query for installed %@ assets (MAQuery domain)"), *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buildError:underlying:description:", v4, 0, v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trackError:forReason:withResult:withError:", CFSTR("[PURGE]"), v5, v4, v7);

    v9 = 0;
    if (!*(_QWORD *)(a1 + 48))
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_msgSend(v2, "assetIds");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "oslog");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v9, "count");
    v13 = *(_QWORD *)(a1 + 32);
    v14 = objc_msgSend(v9, "count");
    v15 = CFSTR("s");
    *(_DWORD *)buf = 134218754;
    v23 = v12;
    v24 = 2114;
    if (v14 == 1)
      v15 = &stru_1EA87A8E8;
    v25 = v13;
    v26 = 2114;
    v27 = v15;
    v28 = 2114;
    v29 = v9;
    _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "[PURGE] MobileAsset found %ld installed %{public}@ asset%{public}@, assetIDs: %{public}@", buf, 0x2Au);
  }

  if (*(_QWORD *)(a1 + 48))
  {
    if (v9 && !objc_msgSend(v9, "count"))
    {

      v7 = 0;
      v9 = 0;
    }
    else
    {
      v7 = 0;
    }
LABEL_14:
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "selectCompletionQueue:", *(_QWORD *)(a1 + 40));
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__SUCorePurge_checkForAssetsOfType_withCompletionQueue_completion___block_invoke_214;
    block[3] = &unk_1EA877E80;
    v21 = *(id *)(a1 + 48);
    v9 = v9;
    v19 = v9;
    v7 = v7;
    v20 = v7;
    dispatch_async(v17, block);

    goto LABEL_15;
  }
  v7 = 0;
LABEL_15:

}

uint64_t __67__SUCorePurge_checkForAssetsOfType_withCompletionQueue_completion___block_invoke_214(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)removeAllUpdateContent:(id)a3
{
  objc_msgSend(a1, "removeAllUpdateContentWithCompletionQueue:completion:", 0, a3);
}

+ (void)removeAllUpdateContentWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buildError:underlying:description:", 8123, 0, CFSTR("removeAllUpdateContent method has been deprecated, use removeAllUpdateContentWithPolicy instead"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trackError:forReason:withResult:withError:", CFSTR("PURGE"), CFSTR("removeAllUpdateContent method has been deprecated, use removeAllUpdateContentWithPolicy instead"), 8123, v8);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectCompletionQueue:", v5);
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__SUCorePurge_removeAllUpdateContentWithCompletionQueue_completion___block_invoke;
    v12[3] = &unk_1EA878088;
    v14 = v6;
    v13 = v8;
    dispatch_async(v11, v12);

  }
}

uint64_t __68__SUCorePurge_removeAllUpdateContentWithCompletionQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)removeAllUpdateContentWithPolicy:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "removeAllUpdateContentWithPolicy:completionQueue:completion:", a3, 0, a4);
}

+ (void)removeAllUpdateContentWithPolicy:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("purge.RemoveAllUpdateContentWithPolicy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "waitedOperationQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke;
  v17[3] = &unk_1EA878060;
  v18 = v8;
  v19 = v10;
  v20 = v7;
  v21 = v9;
  v13 = v7;
  v14 = v10;
  v15 = v8;
  v16 = v9;
  dispatch_async(v12, v17);

}

void __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__6;
  v30 = __Block_byref_object_dispose__6;
  v2 = MEMORY[0x1E0C809B0];
  v31 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_219;
  v22[3] = &unk_1EA8794A8;
  v25 = a1[7];
  v23 = a1[4];
  v24 = a1[5];
  v3 = (void *)MEMORY[0x1DF0E6BC4](v22);
  +[SUCorePurge _trackPurgeBegin:](SUCorePurge, "_trackPurgeBegin:", CFSTR("MSUPurgeSuspendedUpdate"));
  SUCoreBorder_MSUPurgeSuspendedUpdate();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v27[5];
  v27[5] = v4;

  v6 = objc_msgSend((id)v27[5], "code");
  +[SUCorePurge _trackPurgeEnd:withResult:withError:](SUCorePurge, "_trackPurgeEnd:withResult:withError:", CFSTR("MSUPurgeSuspendedUpdate"), v6, v27[5]);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oslog");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[6], "assetTypeSummary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v9;
    _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "[PURGE] removeAllUpdateContentWithPolicy is using provided policy asset types: %{public}@", buf, 0xCu);

  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1[6], "softwareUpdateAssetType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1[6], "softwareUpdateAssetType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

  }
  objc_msgSend(a1[6], "documentationAssetType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(a1[6], "documentationAssetType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v14);

  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "oslog");
  v16 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v33 = v10;
    _os_log_impl(&dword_1DDFDD000, v16, OS_LOG_TYPE_DEFAULT, "[PURGE] removing all assets with types: %{public}@", buf, 0xCu);
  }

  +[SUCorePurge _trackPurgeBegin:](SUCorePurge, "_trackPurgeBegin:", CFSTR("MAPurgeAll"));
  v18[0] = v2;
  v18[1] = 3221225472;
  v18[2] = __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_222;
  v18[3] = &unk_1EA8794D0;
  v21 = &v26;
  v19 = a1[6];
  v17 = v3;
  v20 = v17;
  SUCoreBorder_MAPurgeAll(v10, v18);

  _Block_object_dispose(&v26, 8);
}

void __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_219(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectCompletionQueue:", *(_QWORD *)(a1 + 32));
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_2;
    block[3] = &unk_1EA877E80;
    v9 = *(id *)(a1 + 48);
    v7 = v3;
    v8 = *(id *)(a1 + 40);
    dispatch_async(v5, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("purge.RemoveAllUpdateContentWithPolicy"));
  }

}

uint64_t __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("purge.RemoveAllUpdateContentWithPolicy"));
}

void __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_222(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  int v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  __int128 v14;
  _QWORD v15[4];
  __int128 v16;
  uint8_t buf[16];

  v4 = a2;
  +[SUCorePurge _trackPurgeEnd:withResult:withError:](SUCorePurge, "_trackPurgeEnd:withResult:withError:", CFSTR("MAPurgeAll"), objc_msgSend(v4, "code"), v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  if (!v7)
    objc_storeStrong(v6, a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "enablePreSUStaging");
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "oslog");
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "[PURGE] PreSUStaging: removing all staged assets", buf, 2u);
    }

    +[SUCorePurge _trackPurgeBegin:](SUCorePurge, "_trackPurgeBegin:", CFSTR("stagePurgeAll"));
    v12 = (void *)MEMORY[0x1E0D4E060];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_224;
    v15[3] = &unk_1EA877F70;
    v14 = *(_OWORD *)(a1 + 40);
    v13 = (id)v14;
    v16 = v14;
    objc_msgSend(v12, "SUCoreBorder_stagePurgeAll:", v15);

  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "[PURGE] PreSUStaging: disabled by policy; nothing to purge",
        buf,
        2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_224(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  +[SUCorePurge _trackPurgeEnd:withResult:withError:](SUCorePurge, "_trackPurgeEnd:withResult:withError:", CFSTR("stagePurgeAll"), objc_msgSend(v7, "code"), v7);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(_QWORD *)(v4 + 40);
  v5 = (id *)(v4 + 40);
  if (!v6)
    objc_storeStrong(v5, a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (void)removeAllAssetsOfType:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "removeAllAssetsOfType:withCompletionQueue:completion:", a3, 0, a4);
}

+ (void)removeAllAssetsOfType:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v8 = (objc_class *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (id)objc_msgSend([v8 alloc], "initWithObjects:", v11, 0);

  objc_msgSend(a1, "removeAllAssetsOfTypes:withCompletionQueue:completion:", v12, v10, v9);
}

+ (void)removeAllAssetsOfTypes:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "removeAllAssetsOfTypes:withCompletionQueue:completion:", a3, 0, a4);
}

+ (void)removeAllAssetsOfTypes:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("purge.RemoveAssetsOfType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "oslog");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v7;
    _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "[PURGE] removing all assets with types: %{public}@", buf, 0xCu);
  }

  +[SUCorePurge _trackPurgeBegin:](SUCorePurge, "_trackPurgeBegin:", CFSTR("MAPurgeAll"));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__SUCorePurge_removeAllAssetsOfTypes_withCompletionQueue_completion___block_invoke;
  v16[3] = &unk_1EA8794A8;
  v18 = v10;
  v19 = v9;
  v17 = v8;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  SUCoreBorder_MAPurgeAll(v7, v16);

}

void __69__SUCorePurge_removeAllAssetsOfTypes_withCompletionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  +[SUCorePurge _trackPurgeEnd:withResult:withError:](SUCorePurge, "_trackPurgeEnd:withResult:withError:", CFSTR("MAPurgeAll"), objc_msgSend(v3, "code"), v3);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectCompletionQueue:", *(_QWORD *)(a1 + 32));
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__SUCorePurge_removeAllAssetsOfTypes_withCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_1EA877E80;
    v9 = *(id *)(a1 + 48);
    v7 = v3;
    v8 = *(id *)(a1 + 40);
    dispatch_async(v5, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("purge.RemoveAssetsOfType"));
  }

}

uint64_t __69__SUCorePurge_removeAllAssetsOfTypes_withCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("purge.RemoveAssetsOfType"));
}

+ (void)_trackPurgeBegin:(id)a3
{
  +[SUCorePurge _trackPurgeBegin:withIdentifier:](SUCorePurge, "_trackPurgeBegin:withIdentifier:", a3, 0);
}

+ (void)_trackPurgeBegin:(id)a3 withIdentifier:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0DA8938];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedDiag");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackBegin:atLevel:forModule:withIdentifier:", v7, 1, CFSTR("purge"), v6);

}

+ (void)_trackPurgeEnd:(id)a3
{
  +[SUCorePurge _trackPurgeEnd:withIdentifier:withResult:withError:](SUCorePurge, "_trackPurgeEnd:withIdentifier:withResult:withError:", a3, 0, 0, 0);
}

+ (void)_trackPurgeEnd:(id)a3 withIdentifier:(id)a4
{
  +[SUCorePurge _trackPurgeEnd:withIdentifier:withResult:withError:](SUCorePurge, "_trackPurgeEnd:withIdentifier:withResult:withError:", a3, a4, 0, 0);
}

+ (void)_trackPurgeEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5
{
  +[SUCorePurge _trackPurgeEnd:withIdentifier:withResult:withError:](SUCorePurge, "_trackPurgeEnd:withIdentifier:withResult:withError:", a3, 0, a4, a5);
}

+ (void)_trackPurgeEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = (void *)MEMORY[0x1E0DA8938];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "sharedDiag");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trackEnd:atLevel:forModule:withIdentifier:withResult:withError:", v12, 1, CFSTR("purge"), v11, a5, v10);

}

@end
