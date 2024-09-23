@implementation PLModelMigrationAction

void __95__PLModelMigrationAction_RevalidateFaceAreaPoints_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v9;
  void *v10;
  uint64_t v11;
  id obj;
  _QWORD v13[6];

  v7 = a2;
  objc_msgSend(v7, "revalidateFaceAreaPoints");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__PLModelMigrationAction_RevalidateFaceAreaPoints_performActionWithManagedObjectContext_error___block_invoke_2;
  v13[3] = &unk_1E3674C18;
  v13[4] = *(_QWORD *)(a1 + 32);
  v13[5] = a3;
  if (__ROR8__(0x1CAC083126E978D5 * a3, 3) <= 0x4189374BC6A7EFuLL && a3 != 0)
    __95__PLModelMigrationAction_RevalidateFaceAreaPoints_performActionWithManagedObjectContext_error___block_invoke_2((uint64_t)v13);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 1)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "addedDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v11 + 40);
    LODWORD(v9) = objc_msgSend(v9, "isCancelledWithResumeMarker:error:", v10, &obj);
    objc_storeStrong((id *)(v11 + 40), obj);

    if ((_DWORD)v9)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 2;
      *a4 = 1;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);

}

void __95__PLModelMigrationAction_RevalidateFaceAreaPoints_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  _OWORD *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  _OWORD v13[32];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    PLMigrationGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

    if (v5)
    {
      memset(v13, 0, sizeof(v13));
      PLMigrationGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
      v7 = *(_QWORD *)(a1 + 40);
      v11 = 134217984;
      v12 = v7;
      LODWORD(v10) = 12;
      v8 = (_OWORD *)_os_log_send_and_compose_impl();

      objc_msgSend(*(id *)(a1 + 32), "logger", &v11, v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logWithMessage:fromCodeLocation:type:", v8, "PLModelMigrationActionBackground.m", 214, 1);

      if (v8 != v13)
        free(v8);
    }
  }
}

void __102__PLModelMigrationAction_CinematicVideoPopulateDepthType_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[6];
  id obj;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(v7, "metadataFromMediaPropertiesOrOriginalResource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "setDepthTypeFromMetadata:", v8);
  }
  else
  {
    PLMigrationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "No metadata associated with asset: %{public}@", buf, 0xCu);

    }
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 1)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v7, "addedDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v13 + 40);
    LODWORD(v11) = objc_msgSend(v11, "isCancelledWithResumeMarker:error:", v12, &obj);
    objc_storeStrong((id *)(v13 + 40), obj);

    if ((_DWORD)v11)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 2;
      *a4 = 1;
    }
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102__PLModelMigrationAction_CinematicVideoPopulateDepthType_performActionWithManagedObjectContext_error___block_invoke_149;
  v15[3] = &unk_1E3674C18;
  v15[4] = *(_QWORD *)(a1 + 32);
  v15[5] = a3;
  if (__ROR8__(0x1CAC083126E978D5 * a3, 3) <= 0x4189374BC6A7EFuLL && a3 != 0)
    __102__PLModelMigrationAction_CinematicVideoPopulateDepthType_performActionWithManagedObjectContext_error___block_invoke_149((uint64_t)v15);
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);

}

void __102__PLModelMigrationAction_CinematicVideoPopulateDepthType_performActionWithManagedObjectContext_error___block_invoke_149(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  _OWORD *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  _OWORD v13[32];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    PLMigrationGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

    if (v5)
    {
      memset(v13, 0, sizeof(v13));
      PLMigrationGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
      v7 = *(_QWORD *)(a1 + 40);
      v11 = 134217984;
      v12 = v7;
      LODWORD(v10) = 12;
      v8 = (_OWORD *)_os_log_send_and_compose_impl();

      objc_msgSend(*(id *)(a1 + 32), "logger", &v11, v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logWithMessage:fromCodeLocation:type:", v8, "PLModelMigrationActionBackground.m", 315, 1);

      if (v8 != v13)
        free(v8);
    }
  }
}

void __85__PLModelMigrationAction_updateACVideos_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[6];
  id obj;

  v7 = a2;
  objc_msgSend(v7, "metadataFromMediaPropertiesOrOriginalResource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isActionCam"))
    objc_msgSend(v7, "setKindSubtype:", 104);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 1)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "addedDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v11 + 40);
    LODWORD(v9) = objc_msgSend(v9, "isCancelledWithResumeMarker:error:", v10, &obj);
    objc_storeStrong((id *)(v11 + 40), obj);

    if ((_DWORD)v9)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 2;
      *a4 = 1;
    }
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__PLModelMigrationAction_updateACVideos_performActionWithManagedObjectContext_error___block_invoke_2;
  v13[3] = &unk_1E3674C18;
  v13[4] = *(_QWORD *)(a1 + 32);
  v13[5] = a3;
  if (__ROR8__(0x1CAC083126E978D5 * a3, 3) <= 0x4189374BC6A7EFuLL && a3 != 0)
    __85__PLModelMigrationAction_updateACVideos_performActionWithManagedObjectContext_error___block_invoke_2((uint64_t)v13);
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);

}

void __85__PLModelMigrationAction_updateACVideos_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  _OWORD *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  _OWORD v13[32];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    PLMigrationGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

    if (v5)
    {
      memset(v13, 0, sizeof(v13));
      PLMigrationGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
      v7 = *(_QWORD *)(a1 + 40);
      v11 = 134217984;
      v12 = v7;
      LODWORD(v10) = 12;
      v8 = (_OWORD *)_os_log_send_and_compose_impl();

      objc_msgSend(*(id *)(a1 + 32), "logger", &v11, v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logWithMessage:fromCodeLocation:type:", v8, "PLModelMigrationActionBackground.m", 416, 1);

      if (v8 != v13)
        free(v8);
    }
  }
}

void __88__PLModelMigrationAction_RebuildHighlights_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

BOOL __95__PLModelMigrationAction_RemoveAllPurgeableClones_performActionWithManagedObjectContext_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _BOOL8 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v32;
  id v33;
  id v34;

  v3 = a2;
  v4 = (void *)a1[4];
  v34 = 0;
  v5 = objc_msgSend(v4, "isCancelledWithResumeMarker:error:", 0, &v34);
  v6 = v34;
  v7 = v6;
  if (!v5)
  {
    v12 = a1[5];
    v33 = 0;
    objc_msgSend(v3, "resourceValuesForKeys:error:", v12, &v33);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v33;
    v11 = v14;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0C99A08]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLValue");

      if (!v16)
      {
        v10 = 1;
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(v3, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v17, "length") >= a1[9])
      {
        v20 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v17, "substringToIndex:", a1[9]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v20, "initWithUUIDString:", v21);
        objc_msgSend(v22, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          v24 = (void *)a1[4];
          v25 = a1[6];
          v32 = 0;
          v26 = objc_msgSend(v24, "removePurgableClonesForAssetUUID:withMOC:error:", v23, v25, &v32);
          v27 = v32;
          *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v26;
          v28 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
          v10 = v28 == 1;
          if (v28 != 1)
          {
            v29 = *(_QWORD *)(a1[8] + 8);
            v30 = *(void **)(v29 + 40);
            *(_QWORD *)(v29 + 40) = v27;
            v27 = v30;
          }

        }
        else
        {
          v10 = 1;
        }

      }
      else
      {
        v10 = 1;
      }
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 3;
      v18 = *(_QWORD *)(a1[8] + 8);
      v19 = v14;
      v10 = 0;
      v17 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v19;
    }

    goto LABEL_16;
  }
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 2;
  v8 = *(_QWORD *)(a1[8] + 8);
  v9 = v6;
  v10 = 0;
  v11 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v9;
LABEL_17:

  return v10;
}

void __107__PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[6];
  id obj;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_processForRepairWithAsset:repairCount:", v7, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 1)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "addedDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v10 + 40);
    LODWORD(v8) = objc_msgSend(v8, "isCancelledWithResumeMarker:error:", v9, &obj);
    objc_storeStrong((id *)(v10 + 40), obj);

    if ((_DWORD)v8)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
      *a4 = 1;
    }
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets_performActionWithManagedObjectContext_error___block_invoke_2;
  v12[3] = &unk_1E3674C18;
  v12[4] = *(_QWORD *)(a1 + 32);
  v12[5] = a3;
  if (__ROR8__(0x1CAC083126E978D5 * a3, 3) <= 0x4189374BC6A7EFuLL && a3 != 0)
    __107__PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets_performActionWithManagedObjectContext_error___block_invoke_2((uint64_t)v12);
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);

}

void __107__PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  _OWORD *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  _OWORD v13[32];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    PLMigrationGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

    if (v5)
    {
      memset(v13, 0, sizeof(v13));
      PLMigrationGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
      v7 = *(_QWORD *)(a1 + 40);
      v11 = 134217984;
      v12 = v7;
      LODWORD(v10) = 12;
      v8 = (_OWORD *)_os_log_send_and_compose_impl();

      objc_msgSend(*(id *)(a1 + 32), "logger", &v11, v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logWithMessage:fromCodeLocation:type:", v8, "PLModelMigrationActionBackground.m", 709, 1);

      if (v8 != v13)
        free(v8);
    }
  }
}

uint64_t __100__PLModelMigrationAction_ReevaluatePanoramaImageAssets_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updatePanoramosityWithMetadata:", 0);
}

id __106__PLModelMigrationAction_setInitialIsDetectedScreenshotValue_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __106__PLModelMigrationAction_setInitialIsDetectedScreenshotValue_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __106__PLModelMigrationAction_setInitialIsDetectedScreenshotValue_performActionWithManagedObjectContext_error___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  id obj;

  v6 = a3;
  objc_msgSend(v6, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)a1[4];
  v9 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v8, "isCancelledWithResumeMarker:error:", v7, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "recalculateIsDetectedScreenshot");
    ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    v11 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
    objc_msgSend(v11, "setCompletedUnitCount:", objc_msgSend(v11, "completedUnitCount") + 1);
  }

}

id __107__PLModelMigrationAction_dedupeResourcesWithSimilarCompactUTI_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __107__PLModelMigrationAction_dedupeResourcesWithSimilarCompactUTI_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __107__PLModelMigrationAction_dedupeResourcesWithSimilarCompactUTI_performActionWithManagedObjectContext_error___block_invoke_3(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  int IsEqual;
  void *v28;
  void *v29;
  int v30;
  _QWORD *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  NSObject *v36;
  void *v37;
  void *v38;
  _OWORD *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id obj;
  int v54;
  void *v55;
  __int16 v56;
  void *v57;
  _OWORD v58[32];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v47 = a2;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)a1[4];
  v10 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v9, "isCancelledWithResumeMarker:error:", v8, &obj);
  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    v48 = a1;
    objc_msgSend(v7, "uniformTypeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = PLFileTypeFromIdentifier(v13);

    if (v14)
    {
      v45 = v12;
      v46 = v8;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      objc_msgSend(v7, "asset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "modernResources");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v50 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            objc_msgSend(v21, "objectID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "objectID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v22, "isEqual:", v23);

            if ((v24 & 1) == 0 && (objc_msgSend(v21, "isDeleted") & 1) == 0)
            {
              objc_msgSend(v21, "fingerprint");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "fingerprint");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              IsEqual = PLObjectIsEqual();

              if (IsEqual)
              {
                objc_msgSend(v21, "dataStoreKey");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "dataStoreKey");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = PLObjectIsEqual();

                if (v30)
                {
                  if (PLResourceIdentityIsEqual(v21, v7))
                  {
                    v31 = v48;
                    objc_msgSend((id)v48[4], "logger");
                    v32 = objc_claimAutoreleasedReturnValue();
                    if (v32)
                    {
                      v33 = (void *)v32;
                      PLMigrationGetLog();
                      v34 = objc_claimAutoreleasedReturnValue();
                      v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

                      v31 = v48;
                      if (v35)
                      {
                        memset(v58, 0, sizeof(v58));
                        PLMigrationGetLog();
                        v36 = objc_claimAutoreleasedReturnValue();
                        os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
                        objc_msgSend(v7, "objectID");
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v21, "objectID");
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        v54 = 138543618;
                        v55 = v37;
                        v56 = 2114;
                        v57 = v38;
                        LODWORD(v44) = 22;
                        v39 = (_OWORD *)_os_log_send_and_compose_impl();

                        v31 = v48;
                        objc_msgSend((id)v48[4], "logger", &v54, v44);
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v40, "logWithMessage:fromCodeLocation:type:", v39, "PLModelMigrationActionBackground.m", 938, 0);

                        if (v39 != v58)
                          free(v39);
                      }
                    }
                    objc_msgSend(v47, "deleteObject:", v7);
                    ++*(_QWORD *)(*(_QWORD *)(v31[7] + 8) + 24);
                    objc_msgSend(v7, "asset");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    v42 = PLCanIncludeResourceInHints(v7, v41);

                    if (v42)
                    {
                      objc_msgSend(v7, "asset");
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v43, "recalculateImageRequestHints");

                    }
                  }
                }
              }
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        }
        while (v18);
      }

      v12 = v45;
      v8 = v46;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(v48[8] + 8) + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(v48[8] + 8) + 40), "completedUnitCount") + 1);

  }
}

id __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  id v17;
  id obj;

  v6 = a3;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)a1[4];
  v10 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v9, "isCancelledWithResumeMarker:error:", v8, &obj);
  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "_pl_map:", &__block_literal_global_259);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a1[5];
    v14 = *(_QWORD *)(a1[6] + 8);
    v17 = *(id *)(v14 + 40);
    v15 = +[PLSocialGroupAssetContainment updateAndSaveAssetPersonEdgesForAssetsWithIDs:inContext:error:](PLSocialGroupAssetContainment, "updateAndSaveAssetPersonEdgesForAssetsWithIDs:inContext:error:", v12, v13, &v17);
    objc_storeStrong((id *)(v14 + 40), v17);
    if (!v15)
      *a4 = 1;
    v16 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
    objc_msgSend(v16, "setCompletedUnitCount:", objc_msgSend(v16, "completedUnitCount") + objc_msgSend(v6, "count"));

  }
}

void __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke_263(uint64_t a1)
{
  void *v2;
  BOOL v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  __int128 *v10;
  void *v11;
  void *v12;
  __int128 *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  int v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v3 = +[PLSocialGroup runAssetContainmentOnAllSocialGroupsInContext:error:](PLSocialGroup, "runAssetContainmentOnAllSocialGroupsInContext:error:", v2, &v20);
  v4 = v20;

  objc_msgSend(*(id *)(a1 + 40), "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    if (!v5)
      goto LABEL_10;
    PLMigrationGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (!v8)
      goto LABEL_10;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v30 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v23 = 0u;
    PLMigrationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    LOWORD(v21) = 0;
    LODWORD(v19) = 2;
    v10 = (__int128 *)_os_log_send_and_compose_impl();

    objc_msgSend(*(id *)(a1 + 40), "logger", &v21, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v10;
    v14 = 1020;
    v15 = 0;
  }
  else
  {
    if (!v5)
      goto LABEL_10;
    PLMigrationGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

    if (!v17)
      goto LABEL_10;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v30 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v23 = 0u;
    PLMigrationGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    v21 = 138412290;
    v22 = v4;
    LODWORD(v19) = 12;
    v10 = (__int128 *)_os_log_send_and_compose_impl();

    objc_msgSend(*(id *)(a1 + 40), "logger", &v21, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v10;
    v14 = 1018;
    v15 = 16;
  }
  objc_msgSend(v11, "logWithMessage:fromCodeLocation:type:", v13, "PLModelMigrationActionBackground.m", v14, v15);

  if (v10 != &v23)
    free(v10);
LABEL_10:

}

uint64_t __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

id __98__PLModelMigrationAction_UpdateAssetAdjustmentsState_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __98__PLModelMigrationAction_UpdateAssetAdjustmentsState_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __98__PLModelMigrationAction_UpdateAssetAdjustmentsState_performActionWithManagedObjectContext_error___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  id obj;

  v6 = a3;
  v7 = (void *)a1[4];
  v8 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "isCancelledWithResumeMarker:error:", 0, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "updateAssetAdjustmentsStateIfNeededFromAdjustmentFile");
    ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    v10 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);
  }

}

void __93__PLModelMigrationAction_UpdateAssetAdjustmentsState_isResetAfterRebuildRequiredWithLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id obj;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("adjustmentsState"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(v4, "setResultType:", 4);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v6, "countForFetchRequest:error:", v4, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLMigrationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to get count of Asset.adjustmentsState. Error: %@", buf, 0xCu);
    }

  }
}

id __101__PLModelMigrationAction_setInitialIsRecentlySavedValue_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __101__PLModelMigrationAction_setInitialIsRecentlySavedValue_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __101__PLModelMigrationAction_setInitialIsRecentlySavedValue_performActionWithManagedObjectContext_error___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  id obj;

  v6 = a3;
  objc_msgSend(v6, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)a1[4];
  v9 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v8, "isCancelledWithResumeMarker:error:", v7, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "recalculateIsRecentlySaved");
    ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    v11 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
    objc_msgSend(v11, "setCompletedUnitCount:", objc_msgSend(v11, "completedUnitCount") + 1);
  }

}

id __122__PLModelMigrationAction_setInitialhasPeopleSceneMidOrGreaterConfidenceValue_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __122__PLModelMigrationAction_setInitialhasPeopleSceneMidOrGreaterConfidenceValue_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __122__PLModelMigrationAction_setInitialhasPeopleSceneMidOrGreaterConfidenceValue_performActionWithManagedObjectContext_error___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  id obj;

  v6 = a3;
  objc_msgSend(v6, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)a1[4];
  v9 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v8, "isCancelledWithResumeMarker:error:", v7, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "recalculatehasPeopleSceneMidOrGreaterConfidence");
    ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    v11 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
    objc_msgSend(v11, "setCompletedUnitCount:", objc_msgSend(v11, "completedUnitCount") + 1);
  }

}

void __104__PLModelMigrationAction_AddMissingExtendedAttributes_2024_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "metadataFromMediaPropertiesOrOriginalResource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  v6 = +[PLModelMigrationActionUtility processExtendedAttributesWithAction:asset:metadata:error:](PLModelMigrationActionUtility, "processExtendedAttributesWithAction:asset:metadata:error:", v5, v3, v4, &v8);
  v7 = v8;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateSleetPropertiesForAsset:metadata:", v3, v4);
    objc_msgSend(*(id *)(a1 + 32), "updateSpatialPropertiesForAsset:metadata:", v3, v4);
  }

}

void __102__PLModelMigrationAction_AddMissingAdjustedMediaMetadata_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "additionalAttributes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(v3, "setMediaMetadataData:", 0);

}

void __99__PLModelMigrationAction_SetPrivacyStateOnSmartAlbums_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id obj;

  v6 = a2;
  objc_msgSend(v6, "userQueryData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLQueryHandler constructQueryFromData:](PLQueryHandler, "constructQueryFromData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[PLQueryHandler includesHiddenAssetsInQuery:](PLQueryHandler, "includesHiddenAssetsInQuery:", v8))
    objc_msgSend(v6, "setPrivacyState:", 1);
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v9, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);

}

void __122__PLModelMigrationAction_RemovePeopleMergeCandidatesForConfidenceComputation_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "personUUID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v30 = v4;
  objc_msgSend(v4, "mergeCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v7)
  {
    v8 = v7;
    v32 = 0;
    v9 = *(_QWORD *)v36;
    v31 = v6;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x19AEC1554]();
        if (!objc_msgSend(v11, "verifiedType"))
        {
          objc_msgSend(v11, "mergeCandidates");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "count") == 1)
          {
            objc_msgSend(v11, "mergeCandidates");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "anyObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "personUUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v33, "isEqualToString:", v16);

            if (v17)
            {
              PLMigrationGetLog();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v11, "personUUID");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v40 = v33;
                v41 = 2114;
                v42 = v19;
                _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Removing merge candidate relationship between %{public}@ and %{public}@", buf, 0x16u);

              }
              v20 = v32;
              if (!v32)
              {
                objc_msgSend(v30, "mutableMergeCandidates");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
              }
              v32 = v20;
              objc_msgSend(v20, "removeObject:", v11);
              objc_msgSend(v11, "associatedFaceGroup");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setPersonBuilderState:", 1);

              objc_msgSend(v11, "mergeCandidatesWithConfidence");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "count");

              if (v23)
              {
                objc_msgSend(v11, "mutableMergeCandidatesWithConfidence");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "removeAllObjects");

                objc_msgSend(v11, "setMergeCandidateConfidence:", 0.0);
              }
            }
            v6 = v31;
          }
          else
          {

          }
        }
        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v8);
  }
  else
  {
    v32 = 0;
  }

  v25 = *(void **)(a1 + 32);
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v26 + 40);
  v27 = objc_msgSend(v25, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v26 + 40), obj);
  if (v27)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);

}

uint64_t __113__PLModelMigrationAction_ResetSharedLibrarySharingSuggestionsAssets_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  int v8;
  id obj;

  PLLibraryScopeAssetRemoveSuggestedByClientType(a2);
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v6, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  return objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __134__PLModelMigrationAction_UpdateDuplicateAssetVisibilityStateMostRelevant_updateKeyAssetVisibilityStateWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  id obj;

  objc_msgSend(a2, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "duplicateAssetVisibilityState") == 1)
    objc_msgSend(v7, "setDuplicateAssetVisibilityState:", 2);
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v8, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);

}

uint64_t __155__PLModelMigrationAction_PopulateInitialSharedAssetCollectionStats__recalculateSharedAssetContainerValuesForEntityNamed_propertiesToFetch_inContext_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recalculateSharedAssetContainerCachedValues");
}

void __120__PLModelMigrationAction_RepairUnknownAssetTypeAndUnsupportedPlaybackStyle_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  id obj;

  v6 = a2;
  if (objc_msgSend(v6, "kind") == 3)
  {
    objc_msgSend(v6, "originalUniformTypeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[PLManagedAsset assetTypeFromUniformTypeIdentifier:](PLManagedAsset, "assetTypeFromUniformTypeIdentifier:", v7);

    if ((_DWORD)v8 == 3)
    {
      v9 = a1 + 56;
    }
    else
    {
      objc_msgSend(v6, "setKind:", v8);
      v9 = a1 + 48;
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 24);
  }
  if (objc_msgSend(v6, "kind") != 3 && !objc_msgSend(v6, "playbackStyle"))
  {
    objc_msgSend(v6, "setPlaybackStyle:", +[PLManagedAsset defaultPlaybackStyleFromAssetType:subtype:playbackVariation:](PLManagedAsset, "defaultPlaybackStyleFromAssetType:subtype:playbackVariation:", objc_msgSend(v6, "kind"), objc_msgSend(v6, "kindSubtype"), objc_msgSend(v6, "playbackVariation")));
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  }
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v11 + 40);
  v12 = objc_msgSend(v10, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);

}

void __90__PLModelMigrationAction_DeleteOrphanedFaces_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  id obj;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v6);
  }
  objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);

}

void __114__PLModelMigrationAction_FixUnpushedVideoComplementResourcesAfterFDR_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  id obj;

  v6 = a2;
  objc_msgSend(v6, "masterResourceForCPLType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "masterResourceForCPLType:", 18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cplFileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "fileExistsAtPath:", v11);

  objc_msgSend(v6, "master");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "cloudLocalState") == 3)
  {
    if (objc_msgSend(v7, "cloudLocalState") == 3)
    {
      if (objc_msgSend(v8, "cloudLocalState") != 1)
        v12 = 0;

      if (v12 != 1)
        goto LABEL_15;
LABEL_12:
      objc_msgSend(v6, "setCloudLocalState:", 0);
      objc_msgSend(v6, "master");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCloudLocalState:", 0);

      objc_msgSend(v8, "setCloudLocalState:", 0);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      goto LABEL_15;
    }
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(v6, "master");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "cloudLocalState") != 1 || objc_msgSend(v7, "cloudLocalState") != 3)
  {

    goto LABEL_14;
  }
  if (objc_msgSend(v8, "cloudLocalState") != 1)
    LOBYTE(v12) = 0;

  if ((v12 & 1) != 0)
    goto LABEL_12;
LABEL_15:
  v16 = *(void **)(a1 + 32);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v17 + 40);
  v18 = objc_msgSend(v16, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v17 + 40), obj);
  if (v18)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);

}

void __129__PLModelMigrationAction_MigrateSuggestedByClientTypeCameraSmartSharing_performActionWithManagedObjectContext_error_shouldForce___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  id obj;

  v6 = a2;
  if ((objc_msgSend(v6, "libraryScopeShareState") & 0x18) == 8)
  {
    PLLibraryScopeAssetRemoveSuggestedByClientType(v6);
    v7 = v6;
    objc_msgSend(v7, "setLibraryScopeShareState:", objc_msgSend(v7, "libraryScopeShareState") | 4);

    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v8, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);

}

void __94__PLModelMigrationAction_UnTrashSharedDuplicates_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  id obj;

  v6 = a2;
  objc_msgSend(v6, "master");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectIDsForRelationshipNamed:", CFSTR("assets"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 >= 2)
  {
    objc_msgSend(v6, "unTrash");
    if (objc_msgSend(v6, "cloudLocalState") == 4)
    {
      objc_msgSend(v6, "setUploadAttempts:", 0);
      objc_msgSend(v6, "setLastUploadAttemptDate:", 0);
    }
    objc_msgSend(v6, "setCloudLocalState:", 0);
    objc_msgSend(v6, "persistMetadataToFilesystem");
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v11 + 40);
  v12 = objc_msgSend(v10, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);

}

void __115__PLModelMigrationAction_UpdateDuplicateProcessingState_processAssetStateMap_pendingParentUnitCount_context_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  __int16 v8;
  unsigned __int16 v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  id obj;

  v6 = a2;
  objc_msgSend(v6, "additionalAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "duplicateDetectorPerceptualProcessingState");

  v9 = objc_msgSend(*(id *)(a1 + 32), "shortValue") | v8;
  objc_msgSend(v6, "additionalAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDuplicateDetectorPerceptualProcessingState:", v9);

  objc_msgSend(v6, "additionalAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsDuplicateDetectorPerceptualProcessingState:", 16);

  if (v12)
  {
    v13 = *(void **)(a1 + 40);
    objc_msgSend(v6, "objectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
  objc_msgSend(v6, "additionalAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsDuplicateDetectorPerceptualProcessingState:", 64);

  if (v16)
  {
    v17 = *(void **)(a1 + 40);
    objc_msgSend(v6, "objectID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v18);

  }
  v19 = *(void **)(a1 + 48);
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v20 + 40);
  v21 = objc_msgSend(v19, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v20 + 40), obj);
  if (v21)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "completedUnitCount") + 1);

}

id __101__PLModelMigrationAction_GenerateMemoryStartAndEndDates_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __101__PLModelMigrationAction_GenerateMemoryStartAndEndDates_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __101__PLModelMigrationAction_GenerateMemoryStartAndEndDates_performActionWithManagedObjectContext_error___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  id obj;

  v6 = a3;
  v7 = (void *)a1[4];
  v8 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "recalculateStartAndEndDates");
    ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    v10 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);
  }

}

id __115__PLModelMigrationAction_moveLocalVersionTokenFromPlistToGlobalValues_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  _OWORD *v13;
  void *v14;
  uint64_t v15;
  id v16;
  int v17;
  id v18;
  _OWORD v19[32];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3710];
  v3 = objc_opt_class();
  v4 = *(_QWORD *)(a1 + 32);
  v16 = 0;
  objc_msgSend(v2, "unarchivedObjectOfClass:fromData:error:", v3, v4, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      PLMigrationGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

      if (v11)
      {
        memset(v19, 0, sizeof(v19));
        PLMigrationGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
        v17 = 138412290;
        v18 = v6;
        LODWORD(v15) = 12;
        v13 = (_OWORD *)_os_log_send_and_compose_impl();

        objc_msgSend(*(id *)(a1 + 40), "logger", &v17, v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "logWithMessage:fromCodeLocation:type:", v13, "PLModelMigrationActions_18000.m", 234, 16);

        if (v13 != v19)
          free(v13);
      }
    }
  }

  return v5;
}

id __96__PLModelMigrationAction_RenameGraphNodeValueNames_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __96__PLModelMigrationAction_RenameGraphNodeValueNames_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTotalUnitCount:", objc_msgSend(a2, "count"));
}

void __96__PLModelMigrationAction_RenameGraphNodeValueNames_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v8, "valueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v8, "setValueName:", v7);

    }
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);

  }
}

id __115__PLModelMigrationAction_MigrateMemoryPendingStateStoryToCreationType_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __115__PLModelMigrationAction_MigrateMemoryPendingStateStoryToCreationType_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __115__PLModelMigrationAction_MigrateMemoryPendingStateStoryToCreationType_performActionWithManagedObjectContext_error___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  id obj;

  v6 = a3;
  v7 = (void *)a1[4];
  v8 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "setPendingState:", 0);
    objc_msgSend(v6, "setCreationType:", 1);
    ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    v10 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);
  }

}

id __96__PLModelMigrationAction_RemoveRejectedMemberLabel_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __96__PLModelMigrationAction_RemoveRejectedMemberLabel_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __96__PLModelMigrationAction_RemoveRejectedMemberLabel_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  id obj;

  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "setEdges:", 0);
    objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v6);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);
  }

}

id __106__PLModelMigrationAction_UpdatePlaybackControlBadgeAttribute_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __106__PLModelMigrationAction_UpdatePlaybackControlBadgeAttribute_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __106__PLModelMigrationAction_UpdatePlaybackControlBadgeAttribute_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "packedBadgeAttributes");
  if (v4 != (v4 | 0x20))
    objc_msgSend(v6, "setPackedBadgeAttributes:");
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v5, "setCompletedUnitCount:", objc_msgSend(v5, "completedUnitCount") + 1);

}

id __98__PLModelMigrationAction_RemoveLabelsFromSyndication_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __98__PLModelMigrationAction_RemoveLabelsFromSyndication_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __98__PLModelMigrationAction_RemoveLabelsFromSyndication_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  id obj;

  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "setEdges:", 0);
    objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v6);
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);
  }

}

id __117__PLModelMigrationAction_DeletePLGeneratedAssetDescriptionNodesAndLabel_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __117__PLModelMigrationAction_DeletePLGeneratedAssetDescriptionNodesAndLabel_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __117__PLModelMigrationAction_DeletePLGeneratedAssetDescriptionNodesAndLabel_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  id obj;

  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v6);
  }

}

id __105__PLModelMigrationAction_FixSignExtended32bSceneIdentifiers_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __105__PLModelMigrationAction_FixSignExtended32bSceneIdentifiers_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __105__PLModelMigrationAction_FixSignExtended32bSceneIdentifiers_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "sceneIdentifier") >> 32)
    objc_msgSend(v5, "setSceneIdentifier:", objc_msgSend(v5, "sceneIdentifier"));
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v4, "setCompletedUnitCount:", objc_msgSend(v4, "completedUnitCount") + 1);

}

id __107__PLModelMigrationAction_ReKeyResourcesIncorrectlyStoredAsM4A_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __107__PLModelMigrationAction_ReKeyResourcesIncorrectlyStoredAsM4A_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __107__PLModelMigrationAction_ReKeyResourcesIncorrectlyStoredAsM4A_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  unsigned int *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _OWORD *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id obj;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  _OWORD v37[32];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "dataStoreKeyData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v37[0]) = 0;
    objc_msgSend(v10, "getBytes:length:", v37, 1);
    if (LOBYTE(v37[0]) >= 0x10u)
      v11 = 16;
    else
      v11 = LOBYTE(v37[0]);

    if (v11 == 3)
    {
      v12 = objc_alloc(MEMORY[0x1E0C99DF0]);
      objc_msgSend(v6, "dataStoreKeyData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithData:", v13);

      v15 = objc_retainAutorelease(v14);
      v16 = (unsigned int *)objc_msgSend(v15, "mutableBytes");
      v17 = *v16 | ((unint64_t)*((unsigned __int16 *)v16 + 2) << 32);
      if ((v17 & 0x7F8000000000) == 0xE0000000000)
      {
        v18 = v17 & 0xFFFF807FFFFFFFFFLL;
        *v16 = v18;
        *((_WORD *)v16 + 2) = (v18 | 0xC0000000000) >> 32;
        objc_msgSend(v6, "setDataStoreKeyData:", v15);
        objc_msgSend(*(id *)(a1 + 32), "logger");
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (void *)v19;
          PLMigrationGetLog();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

          if (v22)
          {
            memset(v37, 0, sizeof(v37));
            PLMigrationGetLog();
            v23 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
            objc_msgSend(v6, "objectID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "dataStoreKey");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "assetID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "fileURLForAssetID:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = 138412546;
            v34 = v24;
            v35 = 2112;
            v36 = v27;
            LODWORD(v31) = 22;
            v28 = (_OWORD *)_os_log_send_and_compose_impl();

            objc_msgSend(*(id *)(a1 + 32), "logger", &v33, v31);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActions_18000.m", 672, 0);

            if (v28 != v37)
              free(v28);
          }
        }
        v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        objc_msgSend(v30, "setCompletedUnitCount:", objc_msgSend(v30, "completedUnitCount") + 1);
      }

    }
  }

}

id __97__PLModelMigrationAction_DeleteDanglingPLGraphEdges_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __97__PLModelMigrationAction_DeleteDanglingPLGraphEdges_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __97__PLModelMigrationAction_DeleteDanglingPLGraphEdges_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "deleteObject:");
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return objc_msgSend(v3, "setCompletedUnitCount:", objc_msgSend(v3, "completedUnitCount") + 1);
}

id __99__PLModelMigrationAction_RemoveUnverifiedSocialGroups_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __99__PLModelMigrationAction_RemoveUnverifiedSocialGroups_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __99__PLModelMigrationAction_RemoveUnverifiedSocialGroups_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  id obj;

  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    v10 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSocialGroup, "newNodeContainerWithNode:", v6);
    if (!objc_msgSend(v10, "socialGroupVerifiedType"))
      objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v6);
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(v11, "setCompletedUnitCount:", objc_msgSend(v11, "completedUnitCount") + 1);

  }
}

id __107__PLModelMigrationAction_PopulateCloudFeedEntryIsMine__migrateEntriesWithFetchRequest_moc_progress_result___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __107__PLModelMigrationAction_PopulateCloudFeedEntryIsMine__migrateEntriesWithFetchRequest_moc_progress_result___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(a3, "recalcIsMine");
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
}

id __88__PLModelMigrationAction_PopulateKeyAssets_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __88__PLModelMigrationAction_PopulateKeyAssets_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __88__PLModelMigrationAction_PopulateKeyAssets_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  id obj;

  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "refreshObject:mergeChanges:", v6, 1);
    objc_msgSend(v6, "updateKeyAssetsIfNeeded");
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);
  }

}

id __110__PLModelMigrationAction_ReevaluateAllowedForAnalysisForGPAssets_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __110__PLModelMigrationAction_ReevaluateAllowedForAnalysisForGPAssets_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __110__PLModelMigrationAction_ReevaluateAllowedForAnalysisForGPAssets_performActionWithManagedObjectContext_error___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;

  v6 = a3;
  v7 = (void *)a1[4];
  v8 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "additionalAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateAllowedForAnalysis");

    v12 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
    objc_msgSend(v12, "setCompletedUnitCount:", objc_msgSend(v12, "completedUnitCount") + 1);
  }

}

id __106__PLModelMigrationAction_FixComputeSyncResourceFileExtension_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __106__PLModelMigrationAction_FixComputeSyncResourceFileExtension_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __106__PLModelMigrationAction_FixComputeSyncResourceFileExtension_performActionWithManagedObjectContext_error___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;

  v6 = a3;
  v7 = (void *)a1[4];
  v8 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "cloudLastOnDemandDownloadDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "fileExistsAtPath:", v14);

    if (v15)
    {
      objc_msgSend(v6, "fileURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pathForComputeSyncWrapperFile");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "moveItemAtPath:toPath:error:", v17, v18, 0);

    }
    objc_msgSend(v11, "updateComputeSyncResourceAfterDownloadWithResource:onDemandDownload:", v6, v10 != 0);
    v19 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
    objc_msgSend(v19, "setCompletedUnitCount:", objc_msgSend(v19, "completedUnitCount") + 1);

  }
}

id __100__PLModelMigrationAction_UpdateTripHighlightDateTitles_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __100__PLModelMigrationAction_UpdateTripHighlightDateTitles_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __100__PLModelMigrationAction_UpdateTripHighlightDateTitles_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  +[PLPhotosHighlightGenerator updateTitlesForHighlight:dateRangeTitleGenerator:options:](PLPhotosHighlightGenerator, "updateTitlesForHighlight:dateRangeTitleGenerator:options:", a3, *(_QWORD *)(a1 + 32), 0);
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  return objc_msgSend(v4, "setCompletedUnitCount:", objc_msgSend(v4, "completedUnitCount") + 1);
}

id __96__PLModelMigrationAction_DeleteInvalidSocialGroups_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __96__PLModelMigrationAction_DeleteInvalidSocialGroups_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __96__PLModelMigrationAction_DeleteInvalidSocialGroups_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSocialGroup, "newNodeContainerWithNode:");
  objc_msgSend(v4, "members");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "deleteObject:", v8);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v7, "completedUnitCount") + 1);

}

id __99__PLModelMigrationAction_UpdateHighlightCollageAssets_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __99__PLModelMigrationAction_UpdateHighlightCollageAssets_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __99__PLModelMigrationAction_UpdateHighlightCollageAssets_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;

  objc_msgSend(a3, "recalculateCollageAssets");
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return objc_msgSend(v4, "setCompletedUnitCount:", objc_msgSend(v4, "completedUnitCount") + 1);
}

id __98__PLModelMigrationAction_FixBlankPhotosFromVideoMode_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __98__PLModelMigrationAction_FixBlankPhotosFromVideoMode_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __98__PLModelMigrationAction_FixBlankPhotosFromVideoMode_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "modernResources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 != 2)
    goto LABEL_19;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v6, "modernResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v10)
  {

LABEL_19:
    v13 = 0;
    goto LABEL_24;
  }
  v11 = v10;
  v25 = a1;
  v26 = v6;
  v27 = v5;
  v12 = 0;
  v13 = 0;
  v14 = *(_QWORD *)v30;
  v28 = (void *)*MEMORY[0x1E0CEC530];
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v30 != v14)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      if (objc_msgSend(v16, "recipeID", v25) == 65938)
      {
        v17 = v16;

        v13 = v17;
      }
      else
      {
        v18 = v9;
        objc_msgSend(v16, "uniformTypeIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 == v21)
        {
          objc_msgSend(v16, "fileURL");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v23 != 0;

        }
        else
        {
          v22 = 0;
        }

        v12 |= v22;
        v9 = v18;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  }
  while (v11);

  if (v13)
  {
    objc_msgSend(v13, "dataStoreKeyData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v26;
    if (v24)
    {

    }
    else if (((objc_msgSend(v13, "localAvailability") == -1) & v12) == 1)
    {
      objc_msgSend(v26, "setAdjustmentsState:", 0);
      objc_msgSend(v13, "deleteResource");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v25 + 32) + 8) + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v25 + 32) + 8) + 40), "completedUnitCount") + 1);
    }
    v5 = v27;
  }
  else
  {
    v6 = v26;
    v5 = v27;
  }
LABEL_24:

}

id __106__PLModelMigrationAction_InstallComputeSyncResourcesIfNeeded_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __106__PLModelMigrationAction_InstallComputeSyncResourcesIfNeeded_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __106__PLModelMigrationAction_InstallComputeSyncResourcesIfNeeded_performActionWithManagedObjectContext_error___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  id obj;

  v6 = a3;
  v7 = (void *)a1[4];
  v8 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "installFullStageComputeSyncResourceIfNeeded"))
      ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    v11 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
    objc_msgSend(v11, "setCompletedUnitCount:", objc_msgSend(v11, "completedUnitCount") + 1);

  }
}

void __124__PLModelMigrationAction_ReprocessInvalidDuplicateHashes_removeDuplicateHashesAndResetAlbumsWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "additionalAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneprint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "duplicateMatchingData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToData:", *(_QWORD *)(a1 + 32)))
  {

LABEL_4:
    objc_msgSend(v9, "removeFromDuplicateAlbum");
    objc_msgSend(v9, "resetSceneAnalysisStates");
    objc_msgSend(v9, "additionalAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDuplicateMatchingData:duplicateMatchingAlternateData:processingSucceeded:", 0, 0, 1);

    goto LABEL_5;
  }
  objc_msgSend(v4, "duplicateMatchingAlternateData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToData:", *(_QWORD *)(a1 + 40));

  if (v7)
    goto LABEL_4;
LABEL_5:

}

void __114__PLModelMigrationAction_ResetCustomSocialGroupDataForRejectedGroups_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id obj;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSocialGroup, "newNodeContainerWithNode:", a2);
  if (objc_msgSend(v3, "socialGroupVerifiedType") == -1)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    obj = *(id *)(v4 + 40);
    v5 = objc_msgSend(v3, "resetCustomDataWithError:", &obj);
    objc_storeStrong((id *)(v4 + 40), obj);
    if ((v5 & 1) == 0)
    {
      PLMigrationGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "uuid");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        v11 = v7;
        v12 = 2112;
        v13 = v8;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "PLModelMigrationAction_ResetCustomSocialGroupDataForRejectedGroups: error removing custom data for socialGroup with UUID: %@. Error: %@", buf, 0x16u);

      }
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
  }

}

uint64_t __104__PLModelMigrationAction_UpdateEditSuggestionImageRecipeID_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "setRecipeID:", 66137);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __103__PLModelMigrationAction_updateBrokenStyleableFromRebuild_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "metadataFromMediaPropertiesOrOriginalResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "smartStyleIsReversible");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
    {
      objc_msgSend(v8, "additionalAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSleetIsReversible:", 1);

      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
    }
  }

}

void __86__PLModelMigrationAction_ResetHighlights_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __100__PLModelMigrationAction_PromoteLeftoverDeferredAssets_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id obj;

  v6 = a2;
  objc_msgSend(v6, "setLocalAvailabilityTarget:", 1);
  objc_msgSend(v6, "setLocalAvailability:", 0xFFFFFFFFLL);
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundJobService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "signalBackgroundProcessingNeededOnLibrary:", v7);

  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v11 + 40);
  LODWORD(v9) = objc_msgSend(v10, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v11 + 40), obj);
  if ((_DWORD)v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);

}

uint64_t __124__PLModelMigrationAction_FixResourcesIncorrectlyAssignedToSyndicationDataStore_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  objc_msgSend(v3, "setDataStoreClassID:", 2);
  objc_msgSend(v3, "setDataStoreSubtype:", 3);
  if (objc_msgSend(v3, "isLocallyAvailable"))
    v4 = 1;
  else
    v4 = 0xFFFFFFFFLL;
  objc_msgSend(v3, "setLocalAvailability:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
}

uint64_t __105__PLModelMigrationAction_MigrateProResPackedBadgeAttributes_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  int v8;
  id obj;

  objc_msgSend(a2, "setProResBadgeAttribute:", 1);
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v6, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  return objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __124__PLModelMigrationAction_RelocateBundleScopeData_updateResourceFilePathWithManagedObjectContext_bundleScope_progress_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLPrimaryResourceDataStoreFilePathKey *v12;
  void *v13;
  void *v14;
  void *v15;
  PLPrimaryResourceDataStoreFilePathKey *v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "dataStoreKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoDirectoryWithType:", *(unsigned __int8 *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "legacyPrefixPathWithType:", *(unsigned __int8 *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "hasPrefix:", v7))
    {
      objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v7, "length"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingPathComponent:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = [PLPrimaryResourceDataStoreFilePathKey alloc];
      objc_msgSend(v18, "asset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "assetID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "libraryID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PLPrimaryResourceDataStoreFilePathKey initWithFilePath:andLibraryID:](v12, "initWithFilePath:andLibraryID:", v11, v15);

      -[PLPrimaryResourceDataStoreFilePathKey keyData](v16, "keyData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setDataStoreKeyData:", v17);

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);

}

uint64_t __100__PLModelMigrationAction_SetDefaultFaceAnalysisVersion_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id obj;

  objc_msgSend(a2, "additionalAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFaceAnalysisVersion:", *(__int16 *)(a1 + 64));

  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  return objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __125__PLModelMigrationAction_FixBackgroundResourceWorkerModifyingIncorrectResources_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  id obj;

  v6 = a2;
  objc_msgSend(v6, "dataStoreKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v6;
  if (v7)
  {
    v9 = 1;
  }
  else
  {
    if (objc_msgSend(v6, "dataStoreSubtype") == 1)
    {
      objc_msgSend(v6, "asset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pathForOriginalFile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "markAsLocallyAvailableWithFilePath:", v11);

      goto LABEL_7;
    }
    v8 = v6;
    v9 = 0xFFFFFFFFLL;
  }
  objc_msgSend(v8, "setLocalAvailability:", v9);
LABEL_7:
  v12 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v13 + 40);
  v14 = objc_msgSend(v12, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v13 + 40), obj);
  if (v14)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);

}

void __88__PLModelMigrationAction_ResetGraphPersons_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "resetAllFacesToDefault");
  if (objc_msgSend(v5, "isValidForPersistence"))
  {
    objc_msgSend(v5, "personUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pathManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLPersistedPersonMetadata deleteMetadataFileForPersonUUID:pathManager:](PLPersistedPersonMetadata, "deleteMetadataFileForPersonUUID:pathManager:", v3, v4);

  }
  objc_msgSend(v5, "deletePersonWithReason:", 2);
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);

}

void __109__PLModelMigrationAction_FixPackedBadgeAttributesForRAWPlusJPEG_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "asset");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recalculateRAWBadgeAttribute");
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);

}

void __193__PLModelMigrationAction_DeletePetPersonsAndDetectedFaces_deleteManagedObjectsWithManagedObjectContext_entity_predicate_pendingParentUnitCount_deletedIdentifiers_entityIdentifierKeyPath_error___block_invoke(uint64_t a1, void *a2)
{
  NSString *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = *(NSString **)(a1 + 32);
  if (v3)
  {
    NSSelectorFromString(v3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = *(void **)(a1 + 40);
      objc_msgSend(v6, "valueForKey:", *(_QWORD *)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v5);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "deletePersonWithReason:", 8);
  else
    objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v6);
  objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "completedUnitCount") + 1);

}

void __101__PLModelMigrationAction_PushAssetsWithPetSyncableFaces_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _OWORD *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  id obj;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  _OWORD v27[32];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "assetForFace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "cloudLocalState") == 4)
    {
      objc_msgSend(v8, "setUploadAttempts:", 0);
      objc_msgSend(v8, "setLastUploadAttemptDate:", 0);
    }
    objc_msgSend(v8, "setCloudLocalState:", 0);
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      PLMigrationGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

      if (v12)
      {
        memset(v27, 0, sizeof(v27));
        PLMigrationGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        objc_msgSend(v8, "scopedIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v14;
        v25 = 2114;
        v26 = v15;
        LODWORD(v21) = 22;
        v16 = (_OWORD *)_os_log_send_and_compose_impl();

        objc_msgSend(*(id *)(a1 + 32), "logger", &v23, v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logWithMessage:fromCodeLocation:type:", v16, "PLModelMigrationActions_17000.m", 336, 0);

        if (v16 != v27)
          free(v16);
      }
    }
  }
  v18 = *(void **)(a1 + 32);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v19 + 40);
  v20 = objc_msgSend(v18, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v19 + 40), obj);
  if (v20)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);

}

id __106__PLModelMigrationAction_MergeDetectedFacesAndDetectedTorsos_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __106__PLModelMigrationAction_MergeDetectedFacesAndDetectedTorsos_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __106__PLModelMigrationAction_MergeDetectedFacesAndDetectedTorsos_performActionWithManagedObjectContext_error___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  id obj;

  v6 = a3;
  objc_msgSend(v6, "personForTorso");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "personForTorso");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPersonForFace:", v8);

    objc_msgSend(v6, "migration_setPersonForTorso:", 0);
  }
  objc_msgSend(v6, "assetForTorso");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "assetForTorso");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAssetForFace:", v10);

    objc_msgSend(v6, "migration_setAssetForTorso:", 0);
  }
  v11 = (void *)a1[4];
  v12 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v12 + 40);
  v13 = objc_msgSend(v11, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v12 + 40), obj);
  if (v13)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  v14 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  objc_msgSend(v14, "setCompletedUnitCount:", objc_msgSend(v14, "completedUnitCount") + 1);

}

id __109__PLModelMigrationAction_CopyStickerConfidenceScoreToAssetTable_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __109__PLModelMigrationAction_CopyStickerConfidenceScoreToAssetTable_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __109__PLModelMigrationAction_CopyStickerConfidenceScoreToAssetTable_performActionWithManagedObjectContext_error___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id obj;

  v6 = a3;
  objc_msgSend(v6, "mediaAnalysisAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visualSearchAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stickerConfidenceScore");
  v10 = v9;

  LODWORD(v11) = v10;
  objc_msgSend(v6, "setStickerConfidenceScore:", v11);

  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v12 = (void *)a1[4];
  v13 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v13 + 40);
  LODWORD(v7) = objc_msgSend(v12, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v13 + 40), obj);
  if ((_DWORD)v7)
  {
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 2;
    *a4 = 1;
  }
  v14 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
  return objc_msgSend(v14, "setCompletedUnitCount:", objc_msgSend(v14, "completedUnitCount") + 1);
}

id __111__PLModelMigrationAction_FixupDefaultStickerConfidenceScoreValues_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __111__PLModelMigrationAction_FixupDefaultStickerConfidenceScoreValues_performActionWithManagedObjectContext_error___block_invoke_2(double a1, uint64_t a2, uint64_t a3, void *a4)
{
  LODWORD(a1) = -1.0;
  return objc_msgSend(a4, "setStickerConfidenceScore:", a1);
}

id __100__PLModelMigrationAction_LibraryScopeTrashedStateFixup_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __100__PLModelMigrationAction_LibraryScopeTrashedStateFixup_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __100__PLModelMigrationAction_LibraryScopeTrashedStateFixup_performActionWithManagedObjectContext_error___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  id obj;

  objc_msgSend(a3, "untrash");
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v6 = (void *)a1[4];
  v7 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v6, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 2;
    *a4 = 1;
  }
  v9 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
  return objc_msgSend(v9, "setCompletedUnitCount:", objc_msgSend(v9, "completedUnitCount") + 1);
}

id __103__PLModelMigrationAction_PopulatePersonCloudDetectionType_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __103__PLModelMigrationAction_PopulatePersonCloudDetectionType_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __103__PLModelMigrationAction_PopulatePersonCloudDetectionType_performActionWithManagedObjectContext_error___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  id obj;

  v6 = a3;
  v7 = (void *)a1[4];
  v8 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "setCloudDetectionType:", objc_msgSend(v6, "detectionType"));
    v10 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);
  }

}

- (id)actionName
{
  return CFSTR("MigrationAction");
}

void __94__PLModelMigrationAction_CreateManualIndexes_createManualIndexesDropBeforeCreate_pathManager___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  sqlite3 *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP INDEX IF EXISTS %@;"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(sqlite3 **)(a1 + 32);
  v5 = objc_retainAutorelease(v3);
  sqlite3_exec(v4, (const char *)objc_msgSend(v5, "UTF8String"), 0, 0, 0);

}

void __94__PLModelMigrationAction_CreateManualIndexes_createManualIndexesDropBeforeCreate_pathManager___block_invoke_2(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  id v9;
  int v10;
  const __CFString *v11;
  void *v12;
  sqlite3 *v13;
  id v14;
  NSObject *v15;
  int v16;
  char *errmsg;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  int v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a1[4];
  v9 = a3;
  v10 = objc_msgSend(v7, "hasSuffix:", v8);
  v11 = &stru_1E36789C0;
  if (v10)
    v11 = CFSTR("UNIQUE");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE %@ INDEX IF NOT EXISTS %@ ON %@;"), v11, v7, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  errmsg = 0;
  v13 = (sqlite3 *)a1[7];
  v14 = objc_retainAutorelease(v12);
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = sqlite3_exec(v13, (const char *)objc_msgSend(v14, "UTF8String"), 0, 0, &errmsg);
  if (*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    PLMigrationGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
      *(_DWORD *)buf = 138543874;
      v19 = v7;
      v20 = 1024;
      v21 = v16;
      v22 = 2080;
      v23 = errmsg;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "*** Error creating manual index: %{public}@ %d %s", buf, 0x1Cu);
    }

    if (errmsg)
      sqlite3_free(errmsg);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __102__PLModelMigrationAction_RepairSingletons__repairRootFolderFixedOrderKeysInStore_context_pathManager___block_invoke(uint64_t a1)
{
  void *v2;
  PLRelationshipOrderKeyManager *v3;
  PLRelationshipOrderKeyManager *v4;
  uint64_t v5;
  uint64_t v6;
  id (*v7)(uint64_t, uint64_t);
  void *v8;
  id v9;
  id v10;

  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedFolder, "albumWithKind:inManagedObjectContext:", 3999, *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [PLRelationshipOrderKeyManager alloc];
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __102__PLModelMigrationAction_RepairSingletons__repairRootFolderFixedOrderKeysInStore_context_pathManager___block_invoke_2;
  v8 = &unk_1E3677508;
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v4 = -[PLRelationshipOrderKeyManager initWithGenerateContextBlock:](v3, "initWithGenerateContextBlock:", &v5);
  objc_msgSend(v2, "enforceFixedOrderKeyComplianceWithRelationshipOrderManager:", v4, v5, v6, v7, v8);

}

id __102__PLModelMigrationAction_RepairSingletons__repairRootFolderFixedOrderKeysInStore_context_pathManager___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLManagedObjectContextForMigrationActionWithCoordinator(v4, v5, *(void **)(a1 + 40), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
