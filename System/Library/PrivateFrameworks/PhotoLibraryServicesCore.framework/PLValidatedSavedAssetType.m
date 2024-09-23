@implementation PLValidatedSavedAssetType

+ (unsigned)maskForGuestAsset
{
  return 4096;
}

+ (unsigned)maskForCloudSharedAsset
{
  return 16;
}

+ (id)predicateForIncludeMask:(unsigned __int16)a3 useIndex:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v4 = a4;
  objc_msgSend(a1, "predicateArrayArgumentForMask:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = CFSTR("savedAssetType IN %@");
  else
    v6 = CFSTR("noindex:(savedAssetType) IN %@");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateArrayArgumentForMask:(unsigned __int16)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  unsigned __int16 v16;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__PLValidatedSavedAssetType_predicateArrayArgumentForMask___block_invoke;
  v10[3] = &unk_1E3769DC0;
  v6 = v4;
  v11 = v6;
  v7 = v10;
  v8 = 0;
  v12[0] = v5;
  v12[1] = 3221225472;
  v13 = __PLValidatedSavedAssetTypeForEnabledTypesExecuteBlock_block_invoke;
  v14 = &unk_1E3769DE8;
  v16 = a3;
  v15 = v7;
  do
    v13((uint64_t)v12, word_199EB0B38[v8++]);
  while (v8 != 16);

  return v6;
}

void __59__PLValidatedSavedAssetType_predicateArrayArgumentForMask___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)subpredicatesForExcludeMask:(unsigned __int16)a3
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v9[2];
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  id v13;
  unsigned __int16 v14;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v10 = __57__PLValidatedSavedAssetType_subpredicatesForExcludeMask___block_invoke;
  v11 = &unk_1E3769D98;
  v14 = a3;
  v6 = v5;
  v7 = 0;
  v12 = v6;
  v13 = a1;
  do
    v10((uint64_t)v9, word_199EB0B38[v7++]);
  while (v7 != 16);

  return v6;
}

void __57__PLValidatedSavedAssetType_subpredicatesForExcludeMask___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  if (PLValidatedSavedAssetTypeApplies(*(unsigned __int16 *)(a1 + 48), a2))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "predicateForExcludeSavedAssetType:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

+ (id)predicateForExcludeSavedAssetType:(signed __int16)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(savedAssetType) != %d"), a3);
}

+ (unsigned)maskForPhotoStreamAsset
{
  return 4;
}

+ (unsigned)maskForAllPhotosAlbum
{
  uint64_t v3;

  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 1, 1, 0, 1, 0x101000100000001, v3);
}

+ (unsigned)validatedSavedAssetTypeMaskUnknown:(BOOL)a3 photoBooth:(BOOL)a4 photoStream:(BOOL)a5 camera:(BOOL)a6 cloudShared:(BOOL)a7 cameraConnectionKit:(BOOL)a8 cloudPhotoLibrary:(BOOL)a9 wallpaper_UNUSED:(BOOL)a10 momentShared:(BOOL)a11 placeholder:(BOOL)a12 referenced:(BOOL)a13 alternate:(BOOL)a14 guest:(BOOL)a15 companionSynced:(BOOL)a16 recovered:(BOOL)a17 legacyImport:(BOOL)a18
{
  __int16 v18;
  __int16 v19;
  __int16 v20;
  __int16 v21;
  __int16 v22;
  __int16 v23;
  __int16 v24;
  __int16 v25;
  __int16 v26;
  __int16 v27;
  __int16 v28;
  __int16 v29;
  __int16 v30;
  __int16 v31;
  __int16 v32;
  __int16 v33;
  __int16 v34;
  __int16 v35;

  if (a4)
    v18 = 2;
  else
    v18 = 0;
  v19 = v18 | a3;
  if (a5)
    v20 = 4;
  else
    v20 = 0;
  if (a6)
    v21 = 8;
  else
    v21 = 0;
  v22 = v19 | v20 | v21;
  if (a7)
    v23 = 16;
  else
    v23 = 0;
  if (a8)
    v24 = 32;
  else
    v24 = 0;
  if (a9)
    v25 = 64;
  else
    v25 = 0;
  v26 = v22 | v23 | v24;
  if (a10)
    v27 = 128;
  else
    v27 = 0;
  if (a11)
    v28 = 256;
  else
    v28 = 0;
  if (a12)
    v29 = 512;
  else
    v29 = 0;
  if (a13)
    v30 = 1024;
  else
    v30 = 0;
  if (a14)
    v31 = 2048;
  else
    v31 = 0;
  if (a15)
    v32 = 4096;
  else
    v32 = 0;
  if (a16)
    v33 = 0x2000;
  else
    v33 = 0;
  if (a17)
    v34 = 0x4000;
  else
    v34 = 0;
  if (a18)
    v35 = 0x8000;
  else
    v35 = 0;
  return v26 | v25 | v27 | v28 | v29 | v30 | v31 | v32 | v33 | v34 | v35;
}

+ (unint64_t)mapSavedAssetType:(signed __int16)a3 unknown:(unint64_t)a4 photoBooth:(unint64_t)a5 photoStream:(unint64_t)a6 camera:(unint64_t)a7 cloudShared:(unint64_t)a8 cameraConnectionKit:(unint64_t)a9 cloudPhotoLibrary:(unint64_t)a10 wallpaper_UNUSED:(unint64_t)a11 momentShared:(unint64_t)a12 placeholder:(unint64_t)a13 referenced:(unint64_t)a14 alternate:(unint64_t)a15 guest:(unint64_t)a16 companionSynced:(unint64_t)a17 recovered:(unint64_t)a18 legacyImport:(unint64_t)a19 unrecognized:(unint64_t)a20
{
  int v20;
  NSObject *v22;
  _DWORD v24[2];
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v20 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      return a4;
    case 1:
      a4 = a5;
      break;
    case 2:
      a4 = a6;
      break;
    case 3:
      a4 = a7;
      break;
    case 4:
      a4 = a8;
      break;
    case 5:
      a4 = a9;
      break;
    case 6:
      a4 = a10;
      break;
    case 7:
      a4 = a11;
      break;
    case 8:
      a4 = a12;
      break;
    case 9:
      a4 = a13;
      break;
    case 10:
      a4 = a14;
      break;
    case 11:
      a4 = a15;
      break;
    case 12:
      a4 = a16;
      break;
    case 13:
      a4 = a17;
      break;
    case 14:
      a4 = a18;
      break;
    default:
      if (a3 == 256)
      {
        a4 = a19;
      }
      else
      {
        a4 = a20;
        PLBackendGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          v24[0] = 67109376;
          v24[1] = v20;
          v25 = 2048;
          v26 = a20;
          _os_log_impl(&dword_199DF7000, v22, OS_LOG_TYPE_FAULT, "Unexpected savedAssetType %d, returning %tu", (uint8_t *)v24, 0x12u);
        }

      }
      break;
  }
  return a4;
}

+ (void)executeBlockForSavedAssetType:(signed __int16)a3 unknown:(id)a4 photoBooth:(id)a5 photoStream:(id)a6 camera:(id)a7 cloudShared:(id)a8 cameraConnectionKit:(id)a9 cloudPhotoLibrary:(id)a10 wallpaper_UNUSED:(id)a11 momentShared:(id)a12 placeholder:(id)a13 referenced:(id)a14 alternate:(id)a15 guest:(id)a16 companionSynced:(id)a17 recovered:(id)a18 legacyImport:(id)a19 unrecognized:(id)a20
{
  void (**v24)(void);
  void (**v25)(void);
  void (**v26)(void);
  void (**v27)(void);
  void (**v28)(void);
  void (**v29)(void);
  void (**v30)(void);
  void (**v31)(void);
  void (**v32)(void);
  void *v33;
  void *v34;
  int v35;
  id v36;
  id v37;
  void (**v38)(void);
  void (**v39)(void);
  void (**v40)(void);
  void (**v41)(void);
  void (**v42)(void);
  void (**v43)(void);
  void (**v44)(void);

  v35 = a3;
  v44 = (void (**)(void))a4;
  v37 = a5;
  v36 = a6;
  v24 = (void (**)(void))a7;
  v25 = (void (**)(void))a8;
  v43 = (void (**)(void))a9;
  v42 = (void (**)(void))a10;
  v41 = (void (**)(void))a11;
  v40 = (void (**)(void))a12;
  v39 = (void (**)(void))a13;
  v38 = (void (**)(void))a14;
  v26 = (void (**)(void))a15;
  v27 = (void (**)(void))a16;
  v28 = (void (**)(void))a17;
  v29 = (void (**)(void))a18;
  v30 = (void (**)(void))a19;
  v31 = (void (**)(void))a20;
  v32 = v44;
  v34 = v36;
  v33 = v37;
  switch(v35)
  {
    case 0:
      break;
    case 1:
      v32 = (void (**)(void))v37;
      break;
    case 2:
      v32 = (void (**)(void))v36;
      break;
    case 3:
      v32 = v24;
      break;
    case 4:
      v32 = v25;
      break;
    case 5:
      v32 = v43;
      break;
    case 6:
      v32 = v42;
      break;
    case 7:
      v32 = v41;
      break;
    case 8:
      v32 = v40;
      break;
    case 9:
      v32 = v39;
      break;
    case 10:
      v32 = v38;
      break;
    case 11:
      v32 = v26;
      break;
    case 12:
      v32 = v27;
      break;
    case 13:
      v32 = v28;
      break;
    case 14:
      v32 = v29;
      break;
    default:
      v32 = v30;
      v34 = v36;
      v33 = v37;
      if (v35 != 256)
        v32 = v31;
      break;
  }
  v32[2]();

}

+ (BOOL)allowSavedAssetTypeMutationFrom:(signed __int16)a3 to:(signed __int16)a4
{
  uint64_t v4;
  uint64_t v5;

  if (!a3)
    return 1;
  v4 = a4;
  v5 = a3;
  if (a3 == a4
    || PLValidatedSavedAssetTypeApplies(+[PLValidatedSavedAssetType _maskForCMMMutatingFrom](PLValidatedSavedAssetType, "_maskForCMMMutatingFrom"), a3)&& (PLValidatedSavedAssetTypeApplies(+[PLValidatedSavedAssetType _maskForCMMMutatingTo](PLValidatedSavedAssetType, "_maskForCMMMutatingTo"), v4) & 1) != 0)
  {
    return 1;
  }
  if (PLValidatedSavedAssetTypeApplies(+[PLValidatedSavedAssetType _maskForRecoveredMutatingFrom](PLValidatedSavedAssetType, "_maskForRecoveredMutatingFrom"), v5)&& (PLValidatedSavedAssetTypeApplies(+[PLValidatedSavedAssetType _maskRecoveredForMutatingTo](PLValidatedSavedAssetType, "_maskRecoveredForMutatingTo"), v4) & 1) != 0|| PLValidatedSavedAssetTypeApplies(+[PLValidatedSavedAssetType _maskForGuestMutatingFrom](PLValidatedSavedAssetType, "_maskForGuestMutatingFrom"), v5)&& (PLValidatedSavedAssetTypeApplies(+[PLValidatedSavedAssetType _maskForGuestMutatingTo](PLValidatedSavedAssetType, "_maskForGuestMutatingTo"), v4) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return PFProcessIsLaunchedToExecuteTests();
  }
}

+ (unsigned)_maskForCMMMutatingFrom
{
  return 512;
}

+ (unsigned)_maskForCMMMutatingTo
{
  return 328;
}

+ (unsigned)_maskForRecoveredMutatingFrom
{
  return objc_msgSend(a1, "maskForAssetsEligibleForFileSystemImportSavedAssetTypeUpdate") | 0x4000;
}

+ (unsigned)_maskRecoveredForMutatingTo
{
  return objc_msgSend(a1, "maskForAssetsEligibleForFileSystemImportSavedAssetTypeUpdate") & 0x7FFE | 0x8000;
}

+ (unsigned)_maskForGuestMutatingFrom
{
  return 8;
}

+ (unsigned)_maskForGuestMutatingTo
{
  return 4096;
}

+ (signed)defaultSavedAssetTypeForPhotoKitAssetCreationRequest
{
  return 3;
}

+ (signed)defaultSavedAssetTypeForConsolidatedAssets
{
  return 0;
}

+ (signed)defaultSavedAssetTypeForUnspecifiedImageWriterJobs
{
  return 0;
}

+ (signed)defaultSavedAssetTypeForPLAssetsSaver
{
  return 3;
}

+ (signed)defaultSavedAssetTypeForUnknownFilesystemImportAssets
{
  return 3;
}

+ (signed)defaultSavedAssetTypeForLegacyMigration
{
  return 0;
}

+ (signed)savedAssetTypeForDownloadedPhotoStreamAssets
{
  return 2;
}

+ (signed)savedAssetTypeForPhotoStreamPhotoSavedToCameraRoll
{
  return 3;
}

+ (signed)savedAssetTypeForImportedByCameraConnectionKit
{
  return 5;
}

+ (signed)savedAssetTypeForDuplicateAsAlternateAsset
{
  return 11;
}

+ (signed)savedAssetTypeForReferencedImport
{
  return 10;
}

+ (signed)savedAssetTypeForPlaceholder
{
  return 9;
}

+ (signed)savedAssetTypeForFinderSyncedAsset
{
  return 256;
}

+ (signed)savedAssetTypeForAssetsInCPLAssetsDirectory
{
  return 6;
}

+ (signed)savedAssetTypeForMomentSharedAsset
{
  return 8;
}

+ (signed)savedAssetTypeForCloudPhotoLibraryAsset
{
  return 6;
}

+ (signed)savedAssetTypeForCloudSharedAsset
{
  return 4;
}

+ (signed)savedAssetTypeForAwakeFromInsert
{
  return 0;
}

+ (signed)savedAssetTypeForCameraAsset
{
  return 3;
}

+ (signed)savedAssetTypeForPhotoBoothAsset
{
  return 1;
}

+ (signed)savedAssetTypeForInsertIntoSyndicationLibrary
{
  return 3;
}

+ (signed)savedAssetTypeForPromoteToGuestAsset
{
  return 12;
}

+ (signed)savedAssetTypeForCompanionSyncedAsset
{
  return 13;
}

+ (signed)savedAssetTypeForPromoteToUserLibrary
{
  return 3;
}

+ (signed)savedAssetTypeForRecoveredAsset
{
  return 14;
}

+ (id)predicateForIncludeSavedAssetType:(signed __int16)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(savedAssetType) == %d"), a3);
}

+ (id)predicateForExcludeMask:(unsigned __int16)a3 useIndex:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v4 = a4;
  objc_msgSend(a1, "predicateArrayArgumentForMask:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = CFSTR("NOT (savedAssetType IN %@)");
  else
    v6 = CFSTR("NOT (noindex:(savedAssetType) IN %@)");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForIncludeMask:(unsigned __int16)a3 useIndex:(BOOL)a4 keyPathPrefix:(id)a5
{
  return +[PLValidatedSavedAssetType predicateForIncludeMask:useIndex:keyPathPrefix:formatPrefix:](PLValidatedSavedAssetType, "predicateForIncludeMask:useIndex:keyPathPrefix:formatPrefix:", a3, a4, a5, 0);
}

+ (id)predicateForIncludeMask:(unsigned __int16)a3 useIndex:(BOOL)a4 keyPathPrefix:(id)a5 formatPrefix:(id)a6
{
  _BOOL4 v7;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;

  v7 = a4;
  v8 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(a1, "predicateArrayArgumentForMask:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("noindex:(%K.savedAssetType) IN %@");
  if (v7)
    v13 = CFSTR("%K.savedAssetType IN %@");
  v14 = v13;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v11, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (__CFString *)v15;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v14, v10, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)predicateForExcludeMask:(unsigned __int16)a3 useIndex:(BOOL)a4 keyPathPrefix:(id)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  objc_msgSend(a1, "predicateArrayArgumentForMask:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v10 = CFSTR("NOT %K.savedAssetType IN %@");
  else
    v10 = CFSTR("NOT noindex:(%K.savedAssetType) IN %@");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v10, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)subpredicatesForIncludeMask:(unsigned __int16)a3
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v9[2];
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  id v13;
  unsigned __int16 v14;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v10 = __57__PLValidatedSavedAssetType_subpredicatesForIncludeMask___block_invoke;
  v11 = &unk_1E3769D98;
  v14 = a3;
  v6 = v5;
  v7 = 0;
  v12 = v6;
  v13 = a1;
  do
    v10((uint64_t)v9, word_199EB0B38[v7++]);
  while (v7 != 16);

  return v6;
}

+ (unsigned)maskForUserLibrary
{
  uint64_t v3;

  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 0, 1, 0, 1, 0x100000001, v3);
}

+ (unsigned)maskForAssetsEligibleForCloudKitTransport
{
  uint64_t v3;

  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 0, 1, 0, 1, 16842753, v3);
}

+ (unsigned)maskForAssetsEligibleForCloudKitTransportWithoutMomentSharesAndPlaceholders
{
  return objc_msgSend(a1, "maskForAssetsEligibleForCloudKitTransport") & 0xFCFF;
}

+ (unsigned)maskForCameraAsset
{
  return 8;
}

+ (unsigned)maskForCameraConnectionKitAsset
{
  return 32;
}

+ (unsigned)maskForPhotoBoothAsset
{
  return 2;
}

+ (unsigned)maskForMomentSharedAsset
{
  return 256;
}

+ (unsigned)maskForPlaceholderAsset
{
  return 512;
}

+ (unsigned)maskForCloudPhotoLibraryAsset
{
  return 64;
}

+ (unsigned)maskForCloudSharedBundleScope
{
  return 16;
}

+ (unsigned)maskForReferencedAsset
{
  return 1024;
}

+ (unsigned)maskForFinderSyncedAsset
{
  return 0x8000;
}

+ (unsigned)maskForCompanionSyncedAsset
{
  return 0x2000;
}

+ (unsigned)maskForAssetsIncludedInMoments
{
  uint64_t v3;

  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 1, 1, 0, 1, 0x1000100000001, v3);
}

+ (unsigned)maskForAvalancheSupportedAssets
{
  uint64_t v3;

  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 1, 0, 1, 0x10100000001, v3);
}

+ (unsigned)maskForSmartAlbumExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0x10000, v3);
}

+ (unsigned)maskForPLFetchingAlbumExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0x10001010000, v3);
}

+ (unsigned)maskForVideosAlbumExclusions
{
  return objc_msgSend(a1, "maskForPLFetchingAlbumExclusions") | 4;
}

+ (unsigned)maskForFavoritesAlbumExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 0, 0, 0x10001010000, v3);
}

+ (unsigned)maskForSelfiesAlbumExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0x10001010000, v3);
}

+ (unsigned)maskForRecentlyAddedAlbumExclusions
{
  uint64_t v3;

  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0x10001010000, v3);
}

+ (unsigned)maskForBurstsAlbumExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 0, 0, 0x10001010000, v3);
}

+ (unsigned)maskForPlacesAlbum
{
  uint64_t v3;

  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 1, 1, 0, 1, 0x1010101010001, v3);
}

+ (unsigned)maskForRecentlyEditedAlbumExclusions
{
  uint64_t v3;

  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0x100010001010000, v3);
}

+ (unsigned)maskForRecoveredAlbum
{
  return 0x4000;
}

+ (unsigned)maskForAssetsEligibleForFileSystemImportSavedAssetTypeUpdate
{
  uint64_t v3;

  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 0, 0, 1, 0, 1, 1, v3);
}

+ (unsigned)maskForSharedLibraryExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0x10001010000, v3);
}

+ (unsigned)maskForCouldBeStoredInDCIM
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 0, 1, 0, 1, 0x101010000000001, v3);
}

+ (unsigned)maskForMigrateLegacyVideoAdjustmentsExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 16842753, v3);
}

+ (unsigned)maskForValidSavedAssetTypes
{
  uint64_t v3;

  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 1, 1, 1, 1, 0x101010100010001, v3);
}

+ (unsigned)maskForStoreDemoContent
{
  uint64_t v3;

  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 1, 0, 0, 0x100000000000001, v3);
}

+ (unsigned)maskForPLSyncClientIncompleteAssetExclusions
{
  uint64_t v3;

  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 0x10001010000, v3);
}

+ (unsigned)maskForAddAssetToLibraryScopeIfShareEverythingPolicyEnabled
{
  uint64_t v3;

  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 1, 0, 1, 1, v3);
}

+ (unsigned)maskForIncludeInCPLCounts
{
  uint64_t v3;

  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 1, 1, 1, 1, 1, v3);
}

+ (unsigned)maskForAllowedForAnalysis
{
  uint64_t v3;

  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 0, 1, 0, 1, 0x1010100000001, v3);
}

+ (unsigned)maskForAutoDeleteAssetsUponMomentShareTrash
{
  uint64_t v3;

  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 0, 0, 16842752, v3);
}

+ (unsigned)maskForTriggerRebuildForPathCorruptionExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 0, v3);
}

+ (unsigned)maskForCanDeleteEmptyPathForCorruptAssetsDuringFilesystemImport
{
  uint64_t v3;

  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 1, 1, 0, 1, 0x101010000000100, v3);
}

+ (unsigned)maskForPopulateFaceRegionsExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 16842752, v3);
}

+ (unsigned)maskForGenerateAddedDateExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 16842752, v3);
}

+ (unsigned)maskForFixIncorrectAddedDateExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 16842752, v3);
}

+ (unsigned)maskForTagScreenshotsExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 16842752, v3);
}

+ (unsigned)maskForFixupAssetPersistenceExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 16842752, v3);
}

+ (unsigned)maskForAddingLocalVideoKeyFrameResourceExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0, v3);
}

+ (unsigned)maskForUpdateMogulSubtypeExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 0, 0, 0x100000000, v3);
}

+ (unsigned)maskForNotifyALAssetsLibraryWithChangesExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 0, 0, 0x1000000, v3);
}

+ (unsigned)maskForNotifyALAssetsLibraryWithChangesCloudSharedExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 16842752, v3);
}

+ (unsigned)maskForAssetsExcludedFromOTARestore
{
  uint64_t v3;

  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 16843008, v3);
}

+ (unsigned)maskForCloudPhotoLibrarySizesFromDBExclusions
{
  uint64_t v3;

  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 0x101010000000000, v3);
}

+ (unsigned)maskForSearchIndexExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0x10001010000, v3);
}

+ (unsigned)maskForIsValidForBackup
{
  uint64_t v3;

  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 1, 1, 1, 1, 1, 0x101010100010001, v3);
}

+ (unsigned)maskForIsValidForFileSystemPersistence
{
  uint64_t v3;

  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 1, 1, 0, 1, 0x100010000000101, v3);
}

+ (unsigned)maskForRecoverSupplementalResourcesForAsset
{
  uint64_t v3;

  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 0, 0, 1, 0, 1, 0x101000000000000, v3);
}

+ (unsigned)maskForSuppressPtpInfo
{
  uint64_t v3;

  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 0x10000010100, v3);
}

+ (unsigned)maskForCompleteStateIsRelevant
{
  uint64_t v3;

  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 0, 1, 0, 1, 0x101000100000101, v3);
}

+ (unsigned)maskForLibraryScopeRuleEvaluationExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0x100010001010000, v3);
}

+ (unsigned)maskForAllowedToPromoteToGuestAsset
{
  uint64_t v3;

  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 1, 0, 0, 0x1000000000000, v3);
}

+ (unsigned)maskForAllowedToResetGuestAssetPromotion
{
  uint64_t v3;

  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 1, 0, 0, 0x1000000000000, v3);
}

+ (unsigned)maskForAllowedToPromoteToUserLibrary
{
  uint64_t v3;

  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 0, 0, 0x1000000000000, v3);
}

+ (unsigned)maskForSyndicationSyncWorkerInSyndicationLibrary
{
  __int16 v3;

  v3 = objc_msgSend(a1, "maskForAllowedToPromoteToGuestAsset");
  return objc_msgSend(a1, "maskForGuestAsset") | v3;
}

+ (unsigned)maskForSyndicationIdentifierFetchExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 0, 0, 16842752, v3);
}

+ (unsigned)maskForDuplicateProcessingExclusions
{
  uint64_t v3;

  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 0x101010101010100, v3);
}

+ (unsigned)maskForAssetStackProcessingExclusions
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 0x101010001010100, v3);
}

+ (unsigned)maskForAssetsAllowingLockedResourceTransfer
{
  uint64_t v3;

  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 0, 1, 0, 1, 1, v3);
}

+ (unsigned)maskForAssetsAllowingVirtualFullSizeRender
{
  uint64_t v3;

  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 0, 1, 0, 1, 0x100000001, v3);
}

+ (unsigned)maskForCplQuotaExclusions
{
  uint64_t v3;

  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 0x101010101010000, v3);
}

+ (unsigned)maskForFeatureAvailabilityForSceneAnalysis:(BOOL)a3
{
  _BOOL4 v3;
  __int16 v4;
  __int16 v5;

  v3 = a3;
  v4 = objc_msgSend(a1, "maskForUserLibrary");
  if (v3)
    v5 = -32752;
  else
    v5 = 0x8000;
  return v4 | v5;
}

+ (unsigned)maskForSocialGroupKeyAssetFetch
{
  uint64_t v3;

  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 0, 0, 0x101010001010000, v3);
}

void __57__PLValidatedSavedAssetType_subpredicatesForIncludeMask___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  if (PLValidatedSavedAssetTypeApplies(*(unsigned __int16 *)(a1 + 48), a2))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "predicateForIncludeSavedAssetType:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

@end
