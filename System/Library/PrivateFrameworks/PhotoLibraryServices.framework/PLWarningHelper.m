@implementation PLWarningHelper

- (PLWarningHelper)initWithPhotoLibrary:(id)a3
{
  id v5;
  PLWarningHelper *v6;
  PLWarningHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLWarningHelper;
  v6 = -[PLWarningHelper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_photoLibrary, a3);

  return v7;
}

- (void)getWarningTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 forAssets:(id)a6 operation:(int64_t)a7 clientName:(id)a8
{
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v18 = a8;
  v14 = a6;
  PLSuffixForItems();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "count");

  if (v16 != 1)
  {
    objc_msgSend(v15, "stringByAppendingString:", CFSTR("S"));
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v17;
  }
  -[PLWarningHelper _getWarningTitle:message:buttonTitle:forItemSuffix:count:operation:clientName:](self, "_getWarningTitle:message:buttonTitle:forItemSuffix:count:operation:clientName:", a3, a4, a5, v15, v16, a7, v18);

}

- (void)_getWarningTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 forItemSuffix:(id)a6 count:(unint64_t)a7 operation:(int64_t)a8 clientName:(id)a9
{
  const __CFString *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a9;
  if (a8)
    v14 = 0;
  else
    v14 = CFSTR("HIDE");
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = a6;
  objc_msgSend(v15, "stringWithFormat:", CFSTR("WARNING_TITLE_%@_%@_CLIENT"), v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PLServicesLocalizedFrameworkString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  PFStringWithValidatedFormat();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING_BUTTON_%@_%@"), v14, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  PLServicesLocalizedFrameworkString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    *a3 = objc_retainAutorelease(v19);
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v21);

}

- (BOOL)_isExitingSharedLibrary
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PLWarningHelper photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLLibraryScope activeLibraryScopeInManagedObjectContext:](PLLibraryScope, "activeLibraryScopeInManagedObjectContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "exitState") != 0;
  else
    v5 = 0;

  return v5;
}

- (unint64_t)_assetsInLibraryScopeCountFromAssets:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLWarningHelper _isExitingSharedLibrary](self, "_isExitingSharedLibrary"))
  {
    v5 = 0;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v5 = 0;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "libraryScope", (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            ++v5;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)_hasAssetsInLibraryScope:(id)a3
{
  return -[PLWarningHelper _assetsInLibraryScopeCountFromAssets:](self, "_assetsInLibraryScopeCountFromAssets:", a3) != 0;
}

- (void)getDeletionWarningTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 forAssets:(id)a6 syndicationAssetCount:(int64_t)a7 clientName:(id)a8 style:(int64_t)a9
{
  id v15;

  v15 = a8;
  -[PLWarningHelper set_assets:](self, "set_assets:", a6);
  -[PLWarningHelper set_syndicationAssetCount:](self, "set_syndicationAssetCount:", a7);
  -[PLWarningHelper set_clientName:](self, "set_clientName:", v15);

  -[PLWarningHelper set_style:](self, "set_style:", a9);
  -[PLWarningHelper _getDeletionWarningTitle:message:buttonTitle:](self, "_getDeletionWarningTitle:message:buttonTitle:", a3, a4, a5);
}

- (void)_getDeletionWarningTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5
{
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  id *v20;
  const __CFString *v21;
  __CFString *v22;
  BOOL v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;

  -[PLWarningHelper _assets](self, "_assets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLWarningHelper _style](self, "_style");
  v39 = objc_msgSend(v9, "count");
  -[PLWarningHelper _cloudSharedWarningTextForAssets:](self, "_cloudSharedWarningTextForAssets:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v11;
  if (v11)
  {
    v36 = v11;
  }
  else
  {
    v38 = 0;
    -[PLWarningHelper getAvalancheDeleteWarning:actualDeletionCount:forAssets:](self, "getAvalancheDeleteWarning:actualDeletionCount:forAssets:", &v38, &v39, v9);
    v12 = v38;
    -[PLWarningHelper _usedElsewhereWarningTextForAssets:actualDeletionCount:](self, "_usedElsewhereWarningTextForAssets:actualDeletionCount:", v9, v39);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12 && v13)
    {
      if (v10 > 1)
      {
        v16 = 0;
      }
      else
      {
        PLServicesLocalizedFrameworkString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v34 = v12;
      v35 = v14;
      PFLocalizedStringWithValidatedFormat();
      v36 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v12)
        v15 = v12;
      else
        v15 = (void *)v13;
      v36 = v15;
    }

  }
  PLSuffixForItems();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLWarningHelper _hasAssetsInLibraryScope:](self, "_hasAssetsInLibraryScope:", v9))
  {
    PLServicesSharedLibraryLocalizedFrameworkString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = a4;
    v20 = a5;
    v21 = CFSTR("DELETE_BUTTON_TITLE_");
    if (v10)
      v21 = 0;
    if (v10 == 1)
      v22 = CFSTR("DELETE_BUTTON_COMPACT_TITLE_");
    else
      v22 = (__CFString *)v21;
    v23 = v10 == 1;
    if (v39 == 1)
      v24 = &stru_1E36789C0;
    else
      v24 = CFSTR("S");
    -[__CFString stringByAppendingFormat:](v22, "stringByAppendingFormat:", CFSTR("%@%@"), v17, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PLServicesLocalizedFrameworkString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 || v39 == 1)
    {
      v27 = v26;
    }
    else
    {
      v34 = (id)v39;
      PFLocalizedStringWithValidatedFormat();
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v27;

    a5 = v20;
    a4 = v19;
  }
  -[PLWarningHelper _clientName](self, "_clientName", v34, v35);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "length"))
  {
    v29 = a4;
    if (v39 == 1)
      v30 = &stru_1E36789C0;
    else
      v30 = CFSTR("S");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_WARNING_TITLE_CLIENT_%@%@"), v17, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PLServicesLocalizedFrameworkString();
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    PFLocalizedStringWithValidatedFormat();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = v29;

    if (a3)
      goto LABEL_37;
  }
  else
  {
    v33 = 0;
    if (a3)
LABEL_37:
      *a3 = objc_retainAutorelease(v33);
  }
  if (a4)
    *a4 = objc_retainAutorelease(v36);
  if (a5)
    *a5 = objc_retainAutorelease(v18);

}

- (void)getExpungeWarningMessage:(id *)a3 buttonTitle:(id *)a4 forAssets:(id)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v9 = a5;
  v10 = objc_msgSend(v9, "count");
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLWarningHelper.m"), 233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outMessage"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLWarningHelper.m"), 234, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outButtonTitle"));

LABEL_3:
  if (v10 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLWarningHelper.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCount > 0"));

  }
  v11 = PLAssetTypeForItems();
  v12 = -[PLPhotoLibrary isCloudPhotoLibraryEnabled](self->_photoLibrary, "isCloudPhotoLibraryEnabled");
  -[PLWarningHelper _contributorsForAssets:](self, "_contributorsForAssets:", v9);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  DCIM_currentDeviceModelName();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLWarningHelper _getExpungeWarningMessage:buttonTitle:forAssetCount:assetType:iCPLEnabled:contributors:deviceModelName:](self, "_getExpungeWarningMessage:buttonTitle:forAssetCount:assetType:iCPLEnabled:contributors:deviceModelName:", a3, a4, v10, v11, v12, v17, v13);

}

- (id)_myAssetsFromAssets:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "shareState", (_QWORD)v12) == 1)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_contributorsForAssets:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasLibraryScope", (_QWORD)v13))
        {
          objc_msgSend(v10, "libraryScopeContributors");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_getExpungeWarningMessage:(id *)a3 buttonTitle:(id *)a4 forAssetCount:(int64_t)a5 assetType:(signed __int16)a6 iCPLEnabled:(BOOL)a7 contributors:(id)a8 deviceModelName:(id)a9
{
  _BOOL4 v9;
  id v13;
  id v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id *v26;
  const __CFString *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  __CFString *v41;
  id *v42;
  id *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v9 = a7;
  v49 = *MEMORY[0x1E0C80C00];
  v13 = a8;
  v14 = a9;
  PLLocalizedKeyForAssetType();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = &stru_1E36789C0;
  if (a5 > 1)
    v16 = CFSTR("S");
  v17 = v16;
  v18 = objc_msgSend(v13, "count");
  if (v9)
  {
    if (v18 < 3)
    {
      if (v18 == 2)
      {
        v28 = v14;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v29 = v13;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (v30)
        {
          v31 = v30;
          v43 = a4;
          v32 = *(_QWORD *)v45;
          while (2)
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v45 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
              if ((objc_msgSend(v34, "isCurrentUser") & 1) == 0)
              {
                objc_msgSend(v34, "shortName");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_27;
              }
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
            if (v31)
              continue;
            break;
          }
          v35 = 0;
LABEL_27:
          a4 = v43;
        }
        else
        {
          v35 = 0;
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SHAREDLIBRARY_EXPUNGE_MC_WARNING_FOR_CONTRIBUTOR_%%@_%@%@"), v15, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        PLServicesSharedLibraryLocalizedFrameworkString();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        PFLocalizedStringWithValidatedFormat();
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v28;
        goto LABEL_30;
      }
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("EXPUNGE_%@%@_WARNING_MESSAGE_WITH_ICLOUD_ON"), v15, v17);
      PLServicesLocalizedFrameworkString();
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SHAREDLIBRARY_EXPUNGE_MC_WARNING_%@%@"), v15, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      PLServicesSharedLibraryLocalizedFrameworkString();
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v20;
LABEL_30:
    PLServicesLocalizedFrameworkString();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  v42 = a3;
  v21 = v17;
  v41 = v17;
  v22 = v15;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("EXPUNGE_%@%@_WARNING_MESSAGE_WITH_ICLOUD_OFF"), v15, v41);
  PLServicesLocalizedFrameworkString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v13;
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("iPhone")) & 1) != 0)
  {
    v25 = v14;
    v26 = a4;
    v27 = CFSTR("IPHONE");
  }
  else
  {
    v26 = a4;
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("iPad")) & 1) != 0)
    {
      v25 = v14;
      v27 = CFSTR("IPAD");
    }
    else
    {
      v25 = v14;
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("iPod touch")))
        v27 = CFSTR("IPOD_TOUCH");
      else
        v27 = CFSTR("DEVICE");
    }
  }
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("EXPUNGE_BUTTON_TITLE_VIDEO_WITH_ICLOUD_OFF_%@"), v27);
  PLServicesLocalizedFrameworkString();
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  a4 = v26;
  a3 = v42;
  v14 = v25;
  v13 = v24;
  v15 = v22;
  v17 = v21;
LABEL_31:
  v39 = objc_retainAutorelease(v23);
  *a3 = v39;
  v40 = objc_retainAutorelease(v37);
  *a4 = v40;

}

- (void)getAvalancheDeleteWarning:(id *)a3 actualDeletionCount:(int64_t *)a4 forAssets:(id)a5
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t i;
  void *v11;
  void *v12;
  PLAvalanche *v13;
  void *v14;
  PLAvalanche *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v41;
  uint64_t v42;
  id obj;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a5;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v6)
  {
    v7 = v6;
    v44 = 0;
    v45 = 0;
    v46 = 0;
    v41 = 0;
    v8 = *(_QWORD *)v52;
    v9 = CFSTR("Error fetching avalanche with UUID: %@ for asset %@");
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v52 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        if (objc_msgSend(v11, "isAvalancheStackPhoto")
          && objc_msgSend(v11, "isPartOfBurst"))
        {
          objc_msgSend(v11, "avalancheUUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12
            && (v13 = [PLAvalanche alloc],
                objc_msgSend(v11, "photoLibrary"),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v15 = -[PLAvalanche initWithUUID:photoLibrary:](v13, "initWithUUID:photoLibrary:", v12, v14),
                v14,
                v15))
          {
            v16 = v44;
            if (!v44)
            {
              v17 = v9;
              v18 = (void *)MEMORY[0x1E0C99E08];
              v19 = objc_msgSend(v5, "count");
              v20 = v18;
              v9 = v17;
              objc_msgSend(v20, "dictionaryWithCapacity:", v19);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v44 = v16;
            objc_msgSend(v16, "setObject:forKey:", v15, v12);
            ++v41;
            v21 = -[PLAvalanche assetsCount](v15, "assetsCount");
            -[PLAvalanche userFavorites](v15, "userFavorites");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "count");

            v45 += v23;
            v46 = v21 + v46 - v23;

          }
          else
          {
            NSLog(&v9->isa, v12, v11);
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v7);
  }
  else
  {
    v44 = 0;
    v45 = 0;
    v46 = 0;
    v41 = 0;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v5;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (!v24)
  {
    v42 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    goto LABEL_39;
  }
  v25 = v24;
  v42 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v29 = *(_QWORD *)v48;
  do
  {
    for (j = 0; j != v25; ++j)
    {
      if (*(_QWORD *)v48 != v29)
        objc_enumerationMutation(obj);
      v31 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
      if (!objc_msgSend(v31, "isAvalancheStackPhoto") || (objc_msgSend(v31, "isPartOfBurst") & 1) == 0)
      {
        v32 = objc_msgSend(v31, "avalanchePickType");
        if ((v32 & 8) != 0)
        {
          objc_msgSend(v31, "avalancheUUID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectForKey:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            v35 = 0;
            --v45;
            ++v46;
LABEL_34:
            v28 += v35;
            continue;
          }
        }
        if (objc_msgSend(v31, "isPhoto"))
          ++v26;
        else
          v42 += objc_msgSend(v31, "isVideo");
        ++v27;
        if ((v32 & 8) != 0)
        {
          v35 = 1;
          goto LABEL_34;
        }
      }
    }
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  }
  while (v25);
LABEL_39:

  if (a4)
    *a4 = v46 + v27;
  if (a3)
  {
    v36 = 3;
    if (v27 >= 1 && (v26 < 1 || v42 <= 0))
    {
      if (v42 > 0)
        v37 = 1;
      else
        v37 = 3;
      if (v26 > 0)
        v37 = 0;
      if (v26 | v42)
        v36 = v37;
      else
        v36 = 3;
    }
    -[PLWarningHelper _avalancheDeleteWarningForAvalancheStacksCount:nonAvalancheItemsToDeleteCount:nonAvalancheItemsToDeleteType:avalanchePhotosToDeleteCount:survivingAvalancheFavoritesCount:avalancheUnrelatedFavoritesCount:assetCount:](self, "_avalancheDeleteWarningForAvalancheStacksCount:nonAvalancheItemsToDeleteCount:nonAvalancheItemsToDeleteType:avalanchePhotosToDeleteCount:survivingAvalancheFavoritesCount:avalancheUnrelatedFavoritesCount:assetCount:", v41, v27, v36, v46, v45, v28, objc_msgSend(obj, "count"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

}

- (id)_avalancheDeleteWarningForAvalancheStacksCount:(int64_t)a3 nonAvalancheItemsToDeleteCount:(int64_t)a4 nonAvalancheItemsToDeleteType:(signed __int16)a5 avalanchePhotosToDeleteCount:(int64_t)a6 survivingAvalancheFavoritesCount:(int64_t)a7 avalancheUnrelatedFavoritesCount:(int64_t)a8 assetCount:(int64_t)a9
{
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  _BOOL4 v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  char v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  _BOOL4 v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  const __CFString *v34;
  _BOOL4 v35;
  BOOL v36;
  _BOOL4 v37;
  char v38;
  char v39;
  char v40;
  id v41;
  _BOOL4 v42;
  BOOL v43;
  _BOOL4 v44;
  BOOL v45;
  _BOOL4 v46;
  char v47;
  char v48;
  id v49;
  uint64_t v50;
  char v52;
  _BOOL4 v53;
  BOOL v54;
  int v55;
  BOOL v56;
  _BOOL4 v57;
  char v58;
  char v59;
  char v60;
  _BOOL4 v61;
  BOOL v62;
  int v63;
  char v64;
  char v65;
  _BOOL4 v66;
  BOOL v67;
  int v68;
  char v69;

  if (a3 >= 1 && !a4)
  {
    v14 = CFSTR("N");
    if (a7 < 1)
    {
      if (a6 == 1)
        v23 = CFSTR("1");
      else
        v23 = CFSTR("N");
      if (a3 == 1)
        v14 = CFSTR("1");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_CONF_AVALANCHE_STACKS_ONLY_%@_%@"), v23, v14);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      PLServicesLocalizedFrameworkString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (((unint64_t)a3 < 2 || a6 < 2) && (unint64_t)a3 < 2 && a6 < 2)
        goto LABEL_131;
    }
    else
    {
      if (a3 == 1)
        v15 = CFSTR("1");
      else
        v15 = CFSTR("N");
      if (a6 == 1)
        v16 = CFSTR("1");
      else
        v16 = CFSTR("N");
      if (a7 == 1)
      {
        v14 = CFSTR("1");
        v17 = 0;
      }
      else
      {
        v17 = a6 > 1;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_CONF_AVALANCHE_STACKS_ONLY_KEEP_FAVORITES_%@_%@_%@"), v14, v16, v15);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      PLServicesLocalizedFrameworkString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)a3 < 2 || !v17)
      {
        v24 = !v17;
        if (a3 != 1)
          v24 = 1;
        if ((v24 & 1) != 0)
        {
          v36 = a6 != 1 || a7 == 1;
          v37 = !v36;
          if ((unint64_t)a3 < 2 || !v37)
          {
            v40 = !v37;
            if (a3 != 1)
              v40 = 1;
            if ((v40 & 1) != 0)
            {
              v45 = a6 > 1 && a7 == 1;
              v46 = v45;
              if ((unint64_t)a3 < 2 || !v46)
              {
                v47 = !v46;
                if (a3 != 1)
                  v47 = 1;
                if ((v47 & 1) != 0 && ((unint64_t)a3 < 2 || a6 != 1 || a7 != 1))
                {
LABEL_131:
                  v41 = v19;
                  goto LABEL_101;
                }
              }
            }
          }
        }
      }
    }
    PFLocalizedStringWithValidatedFormat();
    v41 = (id)objc_claimAutoreleasedReturnValue();
LABEL_101:
    v21 = v41;

LABEL_138:
    return v21;
  }
  if (a3 < 1 || a4 < 1)
  {
    v21 = 0;
    if (!a3 && a8 >= 1)
    {
      if (a8 == a9)
      {
        v22 = CFSTR("N");
        if (a8 == 1)
          v22 = CFSTR("1");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_CONF_AVALANCHE_FAVORITES_ONLY_%@"), v22);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = CFSTR("DELETE_CONF_AVALANCHE_FAVORITES_ONLY_SOME");
      }
      PLServicesLocalizedFrameworkString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_138;
    }
    return v21;
  }
  if (a5 > 3)
    v20 = 0;
  else
    v20 = off_1E3664B58[(unsigned __int16)a5];
  v25 = CFSTR("N");
  if (a7 < 1)
  {
    if (a4 == 1)
      v33 = CFSTR("1");
    else
      v33 = CFSTR("N");
    if (a3 == 1)
      v34 = CFSTR("1");
    else
      v34 = CFSTR("N");
    if (a6 == 1)
      v25 = CFSTR("1");
    v35 = a6 > 1 && (unint64_t)a3 > 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_CONF_AVALANCHE_STACKS_AND_OTHERS_%@_%@_%@%@"), v25, v34, v33, v20);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PLServicesLocalizedFrameworkString();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)a4 < 2 || !v35)
    {
      v39 = !v35;
      if (a4 != 1)
        v39 = 1;
      if ((v39 & 1) != 0)
      {
        v43 = a3 != 1 || a6 <= 1;
        v44 = !v43;
        if ((unint64_t)a4 < 2 || !v44)
        {
          v52 = !v44;
          if (a4 != 1)
            v52 = 1;
          if ((v52 & 1) != 0)
          {
            v56 = (unint64_t)a3 > 1 && a6 == 1;
            v57 = v56;
            if ((unint64_t)a4 < 2 || !v57)
            {
              v59 = !v57;
              if (a4 != 1)
                v59 = 1;
              if ((v59 & 1) != 0 && ((unint64_t)a4 < 2 || a3 != 1 || a6 != 1))
                goto LABEL_221;
            }
          }
        }
      }
    }
LABEL_135:
    PFLocalizedStringWithValidatedFormat();
    v49 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_136;
  }
  if (a4 == 1)
    v26 = CFSTR("1");
  else
    v26 = CFSTR("N");
  if (a6 == 1)
    v27 = CFSTR("1");
  else
    v27 = CFSTR("N");
  if (a7 == 1)
    v28 = CFSTR("1");
  else
    v28 = CFSTR("N");
  v29 = a7 != 1 && a6 > 1;
  if (a3 == 1)
    v25 = CFSTR("1");
  v30 = (unint64_t)a3 > 1 && v29;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_CONF_AVALANCHE_STACKS_AND_OTHERS_KEEP_FAVORITES_%@_%@_%@_%@%@"), v28, v27, v25, v26, v20);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  PLServicesLocalizedFrameworkString();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a4 >= 2 && v30)
    goto LABEL_135;
  v38 = !v30;
  if (a4 != 1)
    v38 = 1;
  if ((v38 & 1) == 0)
    goto LABEL_135;
  v42 = a3 == 1 && v29;
  if ((unint64_t)a4 >= 2 && v42)
    goto LABEL_135;
  v48 = !v42;
  if (a4 != 1)
    v48 = 1;
  if ((v48 & 1) == 0)
    goto LABEL_135;
  v53 = (unint64_t)a3 > 1;
  v54 = a6 != 1 || a7 == 1;
  v55 = !v54;
  if (v54)
    v53 = 0;
  if ((unint64_t)a4 >= 2 && v53)
    goto LABEL_135;
  v58 = !v53;
  if (a4 != 1)
    v58 = 1;
  if ((v58 & 1) == 0)
    goto LABEL_135;
  if (a3 != 1)
    v55 = 0;
  if ((unint64_t)a4 >= 2 && v55)
    goto LABEL_135;
  v60 = v55 ^ 1;
  if (a4 != 1)
    v60 = 1;
  if ((v60 & 1) == 0)
    goto LABEL_135;
  v61 = (unint64_t)a3 > 1;
  v62 = a6 > 1 && a7 == 1;
  v63 = v62;
  if (!v62)
    v61 = 0;
  if ((unint64_t)a4 >= 2 && v61)
    goto LABEL_135;
  v64 = !v61;
  if (a4 != 1)
    v64 = 1;
  if ((v64 & 1) == 0)
    goto LABEL_135;
  if (a3 != 1)
    v63 = 0;
  if ((unint64_t)a4 >= 2 && v63)
    goto LABEL_135;
  v65 = v63 ^ 1;
  if (a4 != 1)
    v65 = 1;
  if ((v65 & 1) == 0)
    goto LABEL_135;
  v66 = (unint64_t)a3 > 1;
  v67 = a6 == 1 && a7 == 1;
  v68 = v67;
  if (!v67)
    v66 = 0;
  if ((unint64_t)a4 >= 2 && v66)
    goto LABEL_135;
  v69 = !v66;
  if (a4 != 1)
    v69 = 1;
  if ((v69 & 1) == 0)
    goto LABEL_135;
  if (a3 != 1)
    v68 = 0;
  if ((unint64_t)a4 >= 2 && v68)
    goto LABEL_135;
LABEL_221:
  v49 = v32;
  v32 = v49;
LABEL_136:
  v21 = v49;

  if (a8 >= 1)
  {
    PLServicesLocalizedFrameworkString();
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PFStringWithValidatedFormat();
    v50 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v50;
    goto LABEL_138;
  }
  return v21;
}

- (id)_cloudSharedWarningTextForAssets:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "isCloudSharedAsset", (_QWORD)v15) & 1) != 0)
        {

          v11 = PLAssetTypeForItems();
          objc_msgSend(v4, "lastObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "cloudShareAlbum");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "localizedTitle");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          -[PLWarningHelper _cloudSharedWarningTextForAssetCount:assetType:albumTitle:](self, "_cloudSharedWarningTextForAssetCount:assetType:albumTitle:", objc_msgSend(v4, "count"), v11, v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
  v10 = v4;
LABEL_11:

  return v9;
}

- (id)_cloudSharedWarningTextForAssetCount:(int64_t)a3 assetType:(signed __int16)a4 albumTitle:(id)a5
{
  id v6;
  void *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a5;
  PLLocalizedKeyForAssetType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (a3 == 1)
    v9 = CFSTR("DELETE_SHARED_STREAM_%@_WARNING");
  else
    v9 = CFSTR("DELETE_SHARED_STREAM_%@S_WARNING");
  v10 = (void *)objc_msgSend(v8, "initWithFormat:", v9, v7);
  PLServicesLocalizedFrameworkString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PFStringWithValidatedFormat();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_usedElsewhereWarningTextForAssets:(id)a3 actualDeletionCount:(int64_t)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  __int16 v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  v7 = -[PLWarningHelper _assetsInLibraryScopeCountFromAssets:](self, "_assetsInLibraryScopeCountFromAssets:", v6);
  v8 = objc_msgSend(v6, "count");
  v24 = 0;
  -[PLWarningHelper photoLibrary](self, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countOfLocalAlbumsContainingAssets:assetsInSomeAlbumCount:", v6, &v24);

  v11 = -[PLWarningHelper _syndicationAssetCount](self, "_syndicationAssetCount");
  v12 = v11;
  if (v11 >= v8)
    v13 = 0;
  else
    v13 = v11;
  v14 = v8 - v13;
  if (v11 >= a4)
    v15 = 0;
  else
    v15 = v11;
  v16 = a4 - v15;
  if (v11 < 1)
  {
    v17 = a4;
  }
  else
  {
    v8 = v14;
    v17 = v16;
  }
  v18 = PLAssetTypeForItems();
  -[PLWarningHelper _myAssetsFromAssets:](self, "_myAssetsFromAssets:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLWarningHelper _contributorsForAssets:](self, "_contributorsForAssets:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v23) = v18;
  -[PLWarningHelper _usedElsewhereWarningTextForAssetCount:inLibraryScopeCount:myAssets:contributors:inSomeAlbumCount:affectedLocalAlbumsCount:assetType:actualDeletionCount:syndicationAssetCount:](self, "_usedElsewhereWarningTextForAssetCount:inLibraryScopeCount:myAssets:contributors:inSomeAlbumCount:affectedLocalAlbumsCount:assetType:actualDeletionCount:syndicationAssetCount:", v8, v7, v19, v20, v24, v10, v23, v17, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_usedElsewhereWarningTextForAssetCount:(int64_t)a3 inLibraryScopeCount:(int64_t)a4 myAssets:(id)a5 contributors:(id)a6 inSomeAlbumCount:(int64_t)a7 affectedLocalAlbumsCount:(int64_t)a8 assetType:(signed __int16)a9 actualDeletionCount:(int64_t)a10 syndicationAssetCount:(int64_t)a11
{
  id v16;
  id v17;
  void *v18;
  int v19;
  const __CFString *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  int v28;
  const __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  BOOL v38;
  int v39;
  char v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  id v56;
  void *v58;
  uint64_t v59;
  id v60;
  __CFString *v61;
  id obj;
  void *v63;
  void *v64;
  unint64_t v65;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v16 = a5;
  v17 = a6;
  PLLocalizedKeyForAssetType();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = -[PLPhotoLibrary isCloudPhotoLibraryEnabled](self->_photoLibrary, "isCloudPhotoLibraryEnabled");
  v65 = objc_msgSend(v17, "count");
  v19 = (int)a6;
  if ((_DWORD)a6)
  {
    if (a10 <= 1)
      v20 = &stru_1E36789C0;
    else
      v20 = CFSTR("S");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_WARNING_ICLOUDPHOTO_%@%@"), v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == a3)
    {
      if (a4 <= 1)
        v22 = &stru_1E36789C0;
      else
        v22 = CFSTR("S");
      v23 = v22;
      if (objc_msgSend(v16, "count") == a4)
      {
        if (v65 >= 3)
        {
          v24 = (void *)MEMORY[0x1E0CB3940];
LABEL_30:
          objc_msgSend(v24, "stringWithFormat:", CFSTR("SHAREDLIBRARY_DELETE_MC_WARNING_%@%@"), v18, v23);
LABEL_43:
          v35 = objc_claimAutoreleasedReturnValue();

          v68 = 0;
LABEL_44:
          v21 = (void *)v35;

          goto LABEL_45;
        }
        if (v65 == 2)
        {
          v61 = v23;
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          obj = v17;
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
          if (v30)
          {
            v31 = v30;
            v63 = v18;
            v60 = v16;
            v32 = *(_QWORD *)v70;
            while (2)
            {
              for (i = 0; i != v31; ++i)
              {
                if (*(_QWORD *)v70 != v32)
                  objc_enumerationMutation(obj);
                v34 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
                if ((objc_msgSend(v34, "isCurrentUser") & 1) == 0)
                {
                  objc_msgSend(v34, "shortName");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_83;
                }
              }
              v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
              if (v31)
                continue;
              break;
            }
            v68 = 0;
LABEL_83:
            v16 = v60;
            v18 = v63;
          }
          else
          {
            v68 = 0;
          }

          v23 = v61;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SHAREDLIBRARY_DELETE_MC_WARNING_FOR_CONTRIBUTOR_%%@_%@%@"), v18, v61);
          v35 = objc_claimAutoreleasedReturnValue();

          goto LABEL_44;
        }
        v24 = (void *)MEMORY[0x1E0CB3940];
      }
      else
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        if (v65 >= 2)
          goto LABEL_30;
      }
      objc_msgSend(v24, "stringWithFormat:", CFSTR("SHAREDLIBRARY_DELETE_WARNING_ICLOUD_%@%@"), v18, v23);
      goto LABEL_43;
    }
    if (a4 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SHAREDLIBRARY_DELETE_WARNING_ICLOUD_MIXED_%@S"), v18);
      v27 = objc_claimAutoreleasedReturnValue();

      v68 = 0;
      v28 = 1;
      v21 = (void *)v27;
      goto LABEL_46;
    }
LABEL_28:
    v68 = 0;
LABEL_45:
    v28 = 1;
    goto LABEL_46;
  }
  if (a7 >= 1)
  {
    v25 = CFSTR("S");
    if (a8 == 1)
      v26 = &stru_1E36789C0;
    else
      v26 = CFSTR("S");
    if (a7 < a3 || a10 > a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_WARNING_ALBUM%@_SOME_%@S"), v26, v18, v59);
    }
    else
    {
      if (a3 == 1)
        v25 = &stru_1E36789C0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_WARNING_ALBUM%@_%@%@"), v26, v18, v25);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  v29 = &stru_1E36789C0;
  if (a10 > 1)
    v29 = CFSTR("S");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_WARNING_NO_ICLOUDPHOTO_%@%@"), v18, v29);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  v28 = 0;
LABEL_46:
  if (!v21)
  {
    v42 = 0;
    v39 = v19;
    v43 = 0;
    goto LABEL_70;
  }
  if (a11 > 0)
    v36 = v28;
  else
    v36 = 0;
  if (v36 == 1)
  {
    objc_msgSend(v21, "stringByAppendingString:", CFSTR("_SYNDICATION"));
    v37 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v37;
  }
  v38 = a4 == a3;
  v39 = v19;
  if (v38)
    v40 = v19 ^ 1;
  else
    v40 = 1;
  if ((v40 & 1) == 0)
  {
    if (v65 < 3)
    {
      PLServicesSharedLibraryLocalizedFrameworkString();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_66:
      PFLocalizedStringWithValidatedFormat();
      v44 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    }
    PLServicesSharedLibraryLocalizedFrameworkString();
    v41 = objc_claimAutoreleasedReturnValue();
LABEL_65:
    v43 = (void *)v41;
    goto LABEL_66;
  }
  if (a4 < 1 || ((v19 ^ 1) & 1) != 0)
  {
    PLServicesLocalizedFrameworkString();
    v41 = objc_claimAutoreleasedReturnValue();
    goto LABEL_65;
  }
  PLServicesSharedLibraryLocalizedFrameworkString();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v36 & 1) != 0)
  {
    v43 = 0;
    goto LABEL_68;
  }
  PFLocalizedStringWithValidatedFormat();
  v44 = objc_claimAutoreleasedReturnValue();
  v43 = v42;
LABEL_67:
  v42 = (void *)v44;
LABEL_68:
  if (a8 != 1)
  {
    PFLocalizedStringWithValidatedFormat();
    v45 = objc_claimAutoreleasedReturnValue();

    v42 = (void *)v45;
  }
LABEL_70:
  if (a11 >= 1)
  {
    v67 = v43;
    v46 = CFSTR("S");
    if (a11 == 1)
      v46 = &stru_1E36789C0;
    v64 = v18;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_WARNING_SYNDICATION_COMBINED_%@%@"), v18, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    PLServicesLocalizedFrameworkString();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "length"))
    {
      PLServicesLocalizedFrameworkString();
      v49 = objc_claimAutoreleasedReturnValue();
      PFStringWithValidatedFormat();
      v50 = (id)objc_claimAutoreleasedReturnValue();

      v42 = (void *)v49;
    }
    else
    {
      v50 = v48;
    }

    if (a4 >= 1 && ((v39 ^ 1) & 1) == 0)
    {
      PLServicesLocalizedFrameworkString();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      PLServicesSharedLibraryLocalizedFrameworkString();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      PFLocalizedStringWithValidatedFormat();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      PFStringWithValidatedFormat();
      v53 = v17;
      v54 = v16;
      v55 = objc_claimAutoreleasedReturnValue();

      v50 = (id)v55;
      v16 = v54;
      v17 = v53;
    }

    v42 = v50;
    v18 = v64;
    v43 = v67;
  }
  v56 = v42;

  return v56;
}

- (void)getDeletionWarningTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 forAlbums:(id)a6 folders:(id)a7 clientName:(id)a8 style:(int64_t)a9
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  id *v45;
  char v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v55;
  id *v57;
  id *v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v13 = a6;
  v14 = a7;
  v15 = a8;
  v16 = objc_msgSend(v13, "count");
  v60 = v14;
  v17 = objc_msgSend(v14, "count");
  v18 = v17 + v16;
  if (!(v17 + v16))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLWarningHelper.m"), 793, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("totalCount > 0"));

  }
  v57 = a4;
  v58 = a5;
  if (v17)
  {
    if (v16)
    {
      if (v16 == 1 && v17 == 1)
      {
        v59 = 0;
        v16 = 0x7FFFFFFFFFFFFFFFLL;
        v55 = 1;
        v19 = 0x7FFFFFFFFFFFFFFFLL;
        v20 = CFSTR("ALBUM_FOLDER");
      }
      else
      {
        v19 = 0x7FFFFFFFFFFFFFFFLL;
        if (v16 == 1)
        {
          v59 = 0;
          v55 = 1;
          v16 = v17;
          v20 = CFSTR("ALBUM_FOLDERS");
        }
        else
        {
          v59 = 0;
          if (v17 == 1)
            v20 = CFSTR("ALBUMS_FOLDER");
          else
            v20 = CFSTR("ALBUMS_FOLDERS");
          if (v17 != 1)
            v19 = v17;
          v55 = 1;
        }
      }
    }
    else if (v17 == 1)
    {
      objc_msgSend(v14, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "title");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = 0;
      v16 = 0x7FFFFFFFFFFFFFFFLL;
      v19 = 0x7FFFFFFFFFFFFFFFLL;
      v20 = CFSTR("FOLDER");
    }
    else
    {
      v55 = 0;
      v59 = 0;
      v19 = 0x7FFFFFFFFFFFFFFFLL;
      v16 = v17;
      v20 = CFSTR("FOLDERS");
    }
  }
  else if (v16 == 1)
  {
    objc_msgSend(v13, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "title");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = 0;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    v19 = 0x7FFFFFFFFFFFFFFFLL;
    v20 = CFSTR("ALBUM");
  }
  else
  {
    v55 = 0;
    v59 = 0;
    v19 = 0x7FFFFFFFFFFFFFFFLL;
    v20 = CFSTR("ALBUMS");
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v23 = v13;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v66;
    while (2)
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v66 != v26)
          objc_enumerationMutation(v23);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "isEmpty"))
        {
          v33 = 0;
          v28 = v23;
          goto LABEL_42;
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      if (v25)
        continue;
      break;
    }
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v28 = v60;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v62;
    while (2)
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v62 != v31)
          objc_enumerationMutation(v28);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "isEmpty"))
        {
          v33 = 0;
          goto LABEL_42;
        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      v33 = 1;
      if (v30)
        continue;
      break;
    }
  }
  else
  {
    v33 = 1;
  }
LABEL_42:

  if (v18 == 1)
  {
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_WARNING_TITLE_CLIENT_%@"), v20);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      PLServicesLocalizedFrameworkString();
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      PFStringWithValidatedFormat();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v33 & 1) != 0)
      {
        v37 = 0;
      }
      else
      {
        PLServicesLocalizedFrameworkString();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v39 = &stru_1E36789C0;
      if (v33)
        v39 = CFSTR("_EMPTY");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_WARNING_MESSAGE_%@%@"), v20, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      PLServicesLocalizedFrameworkString();
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      PFStringWithValidatedFormat();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_WARNING_TITLE_%@"), v20);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      PLServicesLocalizedFrameworkString();
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      PFStringWithValidatedFormat();
      v36 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_61:
    v45 = a3;
    goto LABEL_62;
  }
  if (!v15)
  {
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLWarningHelper.m"), 872, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemCount != NSNotFound"));

    }
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLWarningHelper.m"), 873, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondItemCount == NSNotFound"));

    }
    v43 = &stru_1E36789C0;
    if (v33)
      v43 = CFSTR("_EMPTY");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_WARNING_TITLE_MULTIPLE_%@%@"), v20, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    PLServicesLocalizedFrameworkString();
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    PFLocalizedStringWithValidatedFormat();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    goto LABEL_61;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_WARNING_TITLE_CLIENT_%@"), v20);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  PLServicesLocalizedFrameworkString();
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLWarningHelper.m"), 883, CFSTR("invalid number of items"));

  }
  PFLocalizedStringWithValidatedFormat();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = a3;
  if ((v33 & 1) != 0)
  {
    v37 = 0;
  }
  else
  {
    PLServicesLocalizedFrameworkString();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_62:

  v46 = v55 ^ 1;
  if (a9 == 1)
    v46 = 0;
  if ((v46 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_WARNING_BUTTON_%@"), v20);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    PLServicesLocalizedFrameworkString();
    v47 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLServicesLocalizedFrameworkString();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v45)
    *v45 = objc_retainAutorelease(v36);
  if (v57)
    *v57 = objc_retainAutorelease(v37);
  if (v58)
    *v58 = objc_retainAutorelease(v47);

}

- (id)allWarningMessageCombinations
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__PLWarningHelper_allWarningMessageCombinations__block_invoke;
  v13[3] = &unk_1E3673FA0;
  v14 = v3;
  v8 = v4;
  v9 = 3221225472;
  v10 = __48__PLWarningHelper_allWarningMessageCombinations__block_invoke_2;
  v11 = &unk_1E3674480;
  v12 = v14;
  v5 = v14;
  -[PLWarningHelper _enumerateWarningMessagesUsingBlock:sectionBlock:](self, "_enumerateWarningMessagesUsingBlock:sectionBlock:", v13, &v8);
  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11);

  return v6;
}

- (void)enumerateWarningMessagesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[3];
  char v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PLWarningHelper_enumerateWarningMessagesUsingBlock___block_invoke;
  v6[3] = &unk_1E36648C8;
  v8 = v9;
  v5 = v4;
  v7 = v5;
  -[PLWarningHelper _enumerateWarningMessagesUsingBlock:sectionBlock:](self, "_enumerateWarningMessagesUsingBlock:sectionBlock:", v6, &__block_literal_global_19171);

  _Block_object_dispose(v9, 8);
}

- (void)_enumerateWarningMessagesUsingBlock:(id)a3 sectionBlock:(id)a4
{
  id v6;
  void (*v7)(void);
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;

  v6 = a3;
  v7 = (void (*)(void))*((_QWORD *)a4 + 2);
  v8 = a4;
  v7();
  v9 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke;
  v23[3] = &unk_1E3664958;
  v23[4] = self;
  v25 = 0;
  v10 = v6;
  v24 = v10;
  -[PLWarningHelper _enumerateTestItemCountsUsingBlock:](self, "_enumerateTestItemCountsUsingBlock:", v23);

  (*((void (**)(id, const __CFString *))a4 + 2))(v8, CFSTR("Expunge"));
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_3;
  v21[3] = &unk_1E36649F8;
  v21[4] = self;
  v11 = v10;
  v22 = v11;
  -[PLWarningHelper _enumerateTestItemCountsUsingBlock:](self, "_enumerateTestItemCountsUsingBlock:", v21);
  (*((void (**)(id, const __CFString *))a4 + 2))(v8, CFSTR("Avalanche"));
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_7;
  v19[3] = &unk_1E36649F8;
  v19[4] = self;
  v12 = v11;
  v20 = v12;
  -[PLWarningHelper _enumerateTestItemCountsUsingBlock:](self, "_enumerateTestItemCountsUsingBlock:", v19);
  (*((void (**)(id, const __CFString *))a4 + 2))(v8, CFSTR("Cloud Shared"));
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_14;
  v17[3] = &unk_1E36649F8;
  v17[4] = self;
  v13 = v12;
  v18 = v13;
  -[PLWarningHelper _enumerateTestItemCountsUsingBlock:](self, "_enumerateTestItemCountsUsingBlock:", v17);
  (*((void (**)(id, const __CFString *))a4 + 2))(v8, CFSTR("Deletion"));

  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_16;
  v15[3] = &unk_1E36649F8;
  v15[4] = self;
  v16 = v13;
  v14 = v13;
  -[PLWarningHelper _enumerateTestItemCountsUsingBlock:](self, "_enumerateTestItemCountsUsingBlock:", v15);

}

- (void)_enumerateTestBooleansUsingBlock:(id)a3
{
  void (*v4)(void);
  id v5;

  v4 = (void (*)(void))*((_QWORD *)a3 + 2);
  v5 = a3;
  v4();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, 1);

}

- (void)_enumerateTestItemCountsUsingBlock:(id)a3
{
  void (*v4)(void);
  id v5;

  v4 = (void (*)(void))*((_QWORD *)a3 + 2);
  v5 = a3;
  v4();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, 2);
  (*((void (**)(id, uint64_t))a3 + 2))(v5, 1000);

}

- (void)_enumerateTestOtherItemCountsUsingBlock:(id)a3
{
  void (*v4)(void);
  id v5;

  v4 = (void (*)(void))*((_QWORD *)a3 + 2);
  v5 = a3;
  v4();
  -[PLWarningHelper _enumerateTestItemCountsUsingBlock:](self, "_enumerateTestItemCountsUsingBlock:", v5);

}

- (void)_enumerateTestAssetTypesUsingBlock:(id)a3
{
  void (*v4)(void);
  id v5;

  v4 = (void (*)(void))*((_QWORD *)a3 + 2);
  v5 = a3;
  v4();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, 1);
  (*((void (**)(id, uint64_t))a3 + 2))(v5, 3);

}

- (void)_enumerateTestDeviceModelNamesUsingBlock:(id)a3
{
  void (*v4)(void);
  id v5;

  v4 = (void (*)(void))*((_QWORD *)a3 + 2);
  v5 = a3;
  v4();
  (*((void (**)(id, const __CFString *))a3 + 2))(v5, CFSTR("iPad"));
  (*((void (**)(id, const __CFString *))a3 + 2))(v5, CFSTR("iPod touch"));
  (*((void (**)(id, const __CFString *))a3 + 2))(v5, CFSTR("other"));

}

- (NSArray)_assets
{
  return self->__assets;
}

- (void)set_assets:(id)a3
{
  objc_storeStrong((id *)&self->__assets, a3);
}

- (int64_t)_syndicationAssetCount
{
  return self->__syndicationAssetCount;
}

- (void)set_syndicationAssetCount:(int64_t)a3
{
  self->__syndicationAssetCount = a3;
}

- (NSString)_clientName
{
  return self->__clientName;
}

- (void)set_clientName:(id)a3
{
  objc_storeStrong((id *)&self->__clientName, a3);
}

- (int64_t)_style
{
  return self->__style;
}

- (void)set_style:(int64_t)a3
{
  self->__style = a3;
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->__clientName, 0);
  objc_storeStrong((id *)&self->__assets, 0);
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_2;
  v4[3] = &unk_1E3664930;
  v2 = (void *)a1[5];
  v5 = (id)a1[4];
  v3 = a1[6];
  v7 = a2;
  v8 = v3;
  v6 = v2;
  objc_msgSend(v5, "_enumerateTestAssetTypesUsingBlock:", v4);

}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  uint64_t v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_4;
  v3[3] = &unk_1E36649D0;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v6 = a2;
  v5 = v2;
  objc_msgSend(v4, "_enumerateTestAssetTypesUsingBlock:", v3);

}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_7(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  uint64_t v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_8;
  v3[3] = &unk_1E3664958;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v6 = a2;
  v5 = v2;
  objc_msgSend(v4, "_enumerateTestOtherItemCountsUsingBlock:", v3);

}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_14(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  uint64_t v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_15;
  v3[3] = &unk_1E36649D0;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v6 = a2;
  v5 = v2;
  objc_msgSend(v4, "_enumerateTestAssetTypesUsingBlock:", v3);

}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_16(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  uint64_t v11;

  v4 = 0;
  v5 = MEMORY[0x1E0C809B0];
  do
  {
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_17;
    v8[3] = &unk_1E3664B38;
    v7 = *(void **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v10 = a2;
    v11 = v4;
    v8[4] = v7;
    v9 = v6;
    objc_msgSend(v7, "_enumerateTestOtherItemCountsUsingBlock:", v8);

    ++v4;
  }
  while (v4 != 3);
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_17(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1[6];
  if (v2 >= a2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_18;
    v5[3] = &unk_1E3664B10;
    v4 = (void *)a1[4];
    v3 = (void *)a1[5];
    v7 = a2;
    v8 = v2;
    v5[4] = v4;
    v9 = a1[7];
    v6 = v3;
    objc_msgSend(v4, "_enumerateTestOtherItemCountsUsingBlock:", v5);

  }
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 48);
  if (a2 || v2 <= 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_19;
    v4[3] = &unk_1E3664AE8;
    v3 = *(void **)(a1 + 40);
    v5 = *(id *)(a1 + 32);
    v7 = *(_OWORD *)(a1 + 56);
    v8 = v2;
    v9 = a2;
    v6 = v3;
    objc_msgSend(v5, "_enumerateTestOtherItemCountsUsingBlock:", v4);

  }
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_19(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= a2)
  {
    v5 = v2 - 1;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_20;
      v9[3] = &unk_1E3664AC0;
      v7 = *(void **)(a1 + 40);
      v10 = *(void **)(a1 + 32);
      v8 = v10;
      v12 = v2;
      v13 = *(_OWORD *)(a1 + 56);
      v14 = *(_QWORD *)(a1 + 72);
      v15 = a2;
      v11 = v7;
      objc_msgSend(v8, "_enumerateTestAssetTypesUsingBlock:", v9);

      v2 = *(_QWORD *)(a1 + 48);
      ++v5;
    }
    while (v5 <= v2);
  }
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_20(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  LOWORD(v7) = a2;
  objc_msgSend(*(id *)(a1 + 32), "_usedElsewhereWarningTextForAssetCount:inLibraryScopeCount:myAssets:contributors:inSomeAlbumCount:affectedLocalAlbumsCount:assetType:actualDeletionCount:syndicationAssetCount:", v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v5 = *(_QWORD *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 72);
LABEL_3:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Selected items: %ld, LibraryScope: %ld, in Albums: %ld, Affected Albums: %ld, Asset Type: %i, Syndicated items: %ld"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v5, v4, a2, *(_QWORD *)(a1 + 80));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    goto LABEL_4;
  }
  v4 = *(_QWORD *)(a1 + 72);
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 64);
    if (v5)
      goto LABEL_3;
  }
LABEL_4:

}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_15(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_cloudSharedWarningTextForAssetCount:assetType:albumTitle:", *(_QWORD *)(a1 + 48), a2, CFSTR("Some Album"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_8(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_9;
  v4[3] = &unk_1E3664930;
  v3 = (void *)a1[5];
  v2 = a1[6];
  v5 = (id)a1[4];
  v7 = v2;
  v8 = a2;
  v6 = v3;
  objc_msgSend(v5, "_enumerateTestAssetTypesUsingBlock:", v4);

}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_9(uint64_t a1, __int16 a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  __int128 v6;
  __int16 v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_10;
  v3[3] = &unk_1E3664A98;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = a2;
  v5 = v2;
  objc_msgSend(v4, "_enumerateTestItemCountsUsingBlock:", v3);

}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_10(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  __int16 v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_11;
  v3[3] = &unk_1E3664A70;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  v8 = *(_WORD *)(a1 + 64);
  v7 = a2;
  v5 = v2;
  objc_msgSend(v4, "_enumerateTestOtherItemCountsUsingBlock:", v3);

}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_11(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_12;
  v3[3] = &unk_1E3664A48;
  v9 = *(_WORD *)(a1 + 72);
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = a2;
  v5 = v2;
  objc_msgSend(v4, "_enumerateTestOtherItemCountsUsingBlock:", v3);

}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_12(uint64_t a1, uint64_t a2)
{
  void *v2;
  __int128 v3;
  _QWORD v4[4];
  id v5;
  id v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int16 v10;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_13;
  v4[3] = &unk_1E3664A20;
  v10 = *(_WORD *)(a1 + 80);
  v2 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 48);
  v8 = v3;
  v9 = a2;
  v6 = v2;
  objc_msgSend(v5, "_enumerateTestItemCountsUsingBlock:", v4);

}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_13(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_avalancheDeleteWarningForAvalancheStacksCount:nonAvalancheItemsToDeleteCount:nonAvalancheItemsToDeleteType:avalanchePhotosToDeleteCount:survivingAvalancheFavoritesCount:avalancheUnrelatedFavoritesCount:assetCount:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(__int16 *)(a1 + 88), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_4(_QWORD *a1, __int16 a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;
  __int16 v8;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_5;
  v4[3] = &unk_1E36649A8;
  v3 = (void *)a1[5];
  v2 = a1[6];
  v5 = (id)a1[4];
  v7 = v2;
  v8 = a2;
  v6 = v3;
  objc_msgSend(v5, "_enumerateTestBooleansUsingBlock:", v4);

}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_5(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;
  __int16 v8;
  char v9;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_6;
  v4[3] = &unk_1E3664980;
  v3 = *(void **)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  v7 = v2;
  v4[1] = 3221225472;
  v8 = *(_WORD *)(a1 + 56);
  v9 = a2;
  v6 = v3;
  objc_msgSend(v5, "_enumerateTestDeviceModelNamesUsingBlock:", v4);

}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_6(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v6 = 0;
  v7 = 0;
  objc_msgSend(v3, "_getExpungeWarningMessage:buttonTitle:forAssetCount:assetType:iCPLEnabled:contributors:deviceModelName:", &v7, &v6, *(_QWORD *)(a1 + 48), *(__int16 *)(a1 + 56), *(unsigned __int8 *)(a1 + 58), 0, a2);
  v4 = v7;
  v5 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  PLLocalizedKeyForAssetType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)a1[4];
  v11 = 0;
  v12 = 0;
  v10 = 0;
  objc_msgSend(v3, "_getWarningTitle:message:buttonTitle:forItemSuffix:count:operation:clientName:", &v12, &v11, &v10, v2, a1[6], a1[7], CFSTR("SomeApp"));
  v4 = v12;
  v5 = v11;
  v6 = v10;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[7]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Operation: %@, Kind: %@"), v8, v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(a1[5] + 16))();
  if (v5)
    (*(void (**)(void))(a1[5] + 16))();
  (*(void (**)(void))(a1[5] + 16))();

}

uint64_t __54__PLWarningHelper_enumerateWarningMessagesUsingBlock___block_invoke(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __48__PLWarningHelper_allWarningMessageCombinations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@:\n"), v5);
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@\n"), v6);

}

uint64_t __48__PLWarningHelper_allWarningMessageCombinations__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n\n=== %@ ===\n"), a2);
}

@end
