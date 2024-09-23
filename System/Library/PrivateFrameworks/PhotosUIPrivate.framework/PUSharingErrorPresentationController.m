@implementation PUSharingErrorPresentationController

- (PUSharingErrorPresentationController)initWithErrors:(id)a3 forAssets:(id)a4 fromSource:(unint64_t)a5 preparationType:(int64_t)a6
{
  PUSharingErrorPresentationController *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUSharingErrorPresentationController;
  result = -[PUErrorPresentationController initWithErrors:forAssets:](&v9, sel_initWithErrors_forAssets_, a3, a4);
  if (result)
  {
    result->_source = a5;
    result->_preparationType = a6;
  }
  return result;
}

- (BOOL)shouldShowFileRadarAction
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showFileRadarButtonOnInternalInstalls");

  return v3;
}

- (BOOL)shouldIncludeAssetInRadarDescription:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  -[PUSharingErrorPresentationController itemSourcesByAssetUUID](self, "itemSourcesByAssetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[PUSharingErrorPresentationController itemSourcesByAssetUUID](self, "itemSourcesByAssetUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "lastPreparationError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)additionalRadarDescriptionLinesForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "originalFilename");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Filename: %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  objc_msgSend(v4, "pl_managedAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "additionalAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deferredPhotoIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deferred Identifier: %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  -[PUSharingErrorPresentationController itemSourcesByAssetUUID](self, "itemSourcesByAssetUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "sharingUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Preparation ID (in Logs): %@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v16);

    objc_msgSend(v14, "lastPreparationError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = CFSTR("*YES*");
    if (!v17)
      v18 = CFSTR("NO");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Preparation Error: %@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v19);

  }
  return v5;
}

- (void)configureRadarPropertiesFromError:(id)a3 withAssets:(id)a4
{
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = -[PUSharingErrorPresentationController source](self, "source", a3, a4);
  if (v5 > 5)
    v6 = &stru_1E58AD278;
  else
    v6 = off_1E589DA80[v5];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: [Unable to Share TTR]: <Add brief error description>"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUErrorPresentationController setRadarTitle:](self, "setRadarTitle:", v7);

  -[PUSharingErrorPresentationController itemSourcesByAssetUUID](self, "itemSourcesByAssetUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
    -[PUErrorPresentationController setAssetsListDescription:](self, "setAssetsListDescription:", CFSTR("Assets with Preparation Errors"));
}

- (void)configureAlertPropertiesFromError:(id)a3 withAssets:(id)a4 willShowFileRadarButton:(BOOL)a5 alertCompletion:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  const __CFString *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  unint64_t v52;
  void *v53;
  void *v54;
  __CFString *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  const __CFString *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint8_t buf[4];
  const __CFString *v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v7 = a5;
  v93 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = objc_msgSend((id)objc_opt_class(), "sharingErrorTypeFromError:", v9);
  v12 = v11;
  if (v11 > 9)
    v13 = CFSTR("Unknown");
  else
    v13 = off_1E589DAB0[v11];
  PLUIGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    -[PUErrorPresentationController errors](self, "errors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v90 = v13;
    v91 = 2114;
    v92 = v15;
    _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_ERROR, "Sharing Error Presentation: Will show \"Unable to share\" dialogue. Error Type: %{public}@. Reported errors: %{public}@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("OK"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v9;
  if (v12 != 8)
  {
    if (v12 - 1 > 2)
    {
      switch(v12)
      {
        case 4uLL:
          v87 = v16;
          PULocalizedString(CFSTR("SHARING_PREPARATION_LOW_DISK_SPACE_TITLE"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_opt_class();
          -[PUErrorPresentationController assets](self, "assets");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "_mediaSpecificMessageForKeyPrefix:forAssets:", CFSTR("SHARING_PREPARATION_LOW_DISK_SPACE_MESSAGE_"), v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = objc_opt_class();
          PULocalizedString(CFSTR("SHARING_PREPARATION_LOW_DISK_SPACE_MANAGE_BUTTON_TITLE"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)v36;
          v39 = v17;
          v40 = v10;
          objc_msgSend(v38, "alertActionForNavigatingToDestination:withTitle:completion:", 2, v37, v10);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v42 = v39;
          objc_msgSend(v39, "addObject:", v41);
          PULocalizedString(CFSTR("CANCEL"));
          v43 = objc_claimAutoreleasedReturnValue();

          if (!v7)
            goto LABEL_34;
          objc_msgSend(v35, "stringByAppendingString:", CFSTR("\n\n[Internal Only] If you feel like this storage error is unexpected, please file a radar (and explain why)."));
          v44 = objc_claimAutoreleasedReturnValue();

          v45 = CFSTR("What does Settings->General->About report that you have for available storage?");
          goto LABEL_33;
        case 5uLL:
          v87 = v16;
          PULocalizedString(CFSTR("SHARING_PREPARATION_CMM_ICLOUD_QUOTA_EXCEEDED_TITLE"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          PULocalizedString(CFSTR("SHARING_PREPARATION_CMM_ICLOUD_QUOTA_EXCEEDED_MESSAGE"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_opt_class();
          PULocalizedString(CFSTR("SHARING_PREPARATION_ICLOUD_STORAGE_MANAGE_BUTTON_TITLE"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = (void *)v56;
          v59 = v17;
          v40 = v10;
          objc_msgSend(v58, "alertActionForNavigatingToDestination:withTitle:completion:", 4, v57, v10);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v42 = v59;
          objc_msgSend(v59, "addObject:", v41);
          PULocalizedString(CFSTR("CANCEL"));
          v43 = objc_claimAutoreleasedReturnValue();

          if (v7)
          {
            objc_msgSend(v35, "stringByAppendingString:", CFSTR("\n\n[Internal Only] If you feel like this error is unexpected, please file a radar (and explain why)."));
            v44 = objc_claimAutoreleasedReturnValue();

            v45 = CFSTR("How much iCloud space do you have available?");
LABEL_33:
            objc_msgSend(v87, "addObject:", v45);
            v35 = (void *)v44;
          }
LABEL_34:

          v18 = (void *)v43;
          v10 = v40;
          v17 = v42;
          v16 = v87;
          goto LABEL_60;
        case 6uLL:
          v60 = (void *)objc_opt_class();
          -[PUErrorPresentationController assets](self, "assets");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "_defaultTitleForDownloadErrorForAssets:forSource:", v61, -[PUSharingErrorPresentationController source](self, "source"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (-[PUSharingErrorPresentationController source](self, "source") == 3)
          {
            v62 = (void *)objc_opt_class();
            -[PUErrorPresentationController assets](self, "assets");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "_mediaSpecificMessageForKeyPrefix:forAssets:", CFSTR("PHOTO_PICKER_PREPARATION_CPL_NOT_READY_ERROR_MESSAGE_"), v63);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            PULocalizedString(CFSTR("SHARING_PREPARATION_CPL_NOT_READY_ERROR_MESSAGE"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (!v7)
            goto LABEL_60;
          objc_msgSend(v35, "stringByAppendingString:", CFSTR("\n\n[Internal Only] If you feel like this iCloud Photos-related error is unexpected, please file a radar (and explain why)."));
          v69 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "addObject:", CFSTR("Did you recently upgrade your OS and reboot?"));
          objc_msgSend(v16, "addObject:", CFSTR("Did you install any roots recently?"));
          v70 = CFSTR("Did you sign in/out of iCloud recently?");
          break;
        case 7uLL:
          PULocalizedString(CFSTR("SHARING_PREPARATION_NEEDS_CLOUD_SETTINGS_REVIEW_TITLE"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v17;
          if (-[PUSharingErrorPresentationController preparationType](self, "preparationType") == 1)
          {
            PULocalizedString(CFSTR("SHARING_PREPARATION_NEEDS_CLOUD_SETTINGS_REVIEW_CMM_MESSAGE"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v71 = (void *)objc_opt_class();
            -[PUErrorPresentationController assets](self, "assets");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "_mediaSpecificMessageForKeyPrefix:forAssets:", CFSTR("SHARING_PREPARATION_NEEDS_CLOUD_SETTINGS_REVIEW_MESSAGE_"), v72);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v73 = (void *)objc_opt_class();
          PULocalizedString(CFSTR("SHARING_PREPARATION_NEEDS_CLOUD_SETTINGS_REVIEW_GO_TO_SETTINGS_BUTTON_TITLE"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v10;
          objc_msgSend(v73, "alertActionForNavigatingToDestination:withTitle:completion:", 4, v74, v10);
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v86, "addObject:", v76);
          PULocalizedString(CFSTR("CANCEL"));
          v77 = objc_claimAutoreleasedReturnValue();

          if (v7)
          {
            objc_msgSend(v35, "stringByAppendingString:", CFSTR("\n\n[Internal Only] If you feel like this error is unexpected, please file a radar (and explain why)."));
            v78 = objc_claimAutoreleasedReturnValue();

            v35 = (void *)v78;
          }

          v18 = (void *)v77;
          v10 = v75;
          v17 = v86;
          goto LABEL_60;
        default:
          v52 = -[PUSharingErrorPresentationController source](self, "source");
          v53 = (void *)objc_opt_class();
          -[PUErrorPresentationController assets](self, "assets");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "_defaultTitleForSource:assets:", v52, v54);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          switch(v52)
          {
            case 1uLL:
              v55 = CFSTR("POST_TO_SHARED_ALBUM_PREPARATION_ERROR_MESSAGE");
              goto LABEL_59;
            case 3uLL:
              v83 = (void *)objc_opt_class();
              -[PUErrorPresentationController assets](self, "assets");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "_mediaSpecificMessageForKeyPrefix:forAssets:", CFSTR("PHOTO_PICKER_PREPARATION_ERROR_MESSAGE_"), v84);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_60;
            case 4uLL:
              v55 = CFSTR("SYNDICATION_SAVE_PREPARATION_ERROR_MESSAGE");
              goto LABEL_59;
            case 5uLL:
              v55 = CFSTR("RENDER_PREPARATION_ERROR_MESSAGE");
              goto LABEL_59;
            default:
              v55 = CFSTR("SHARING_PREPARATION_ERROR_MESSAGE");
LABEL_59:
              PULocalizedString(v55);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              break;
          }
          goto LABEL_60;
      }
      goto LABEL_45;
    }
    if (-[PUSharingErrorPresentationController preparationType](self, "preparationType") == 1)
      goto LABEL_16;
    objc_msgSend(v9, "domain");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0CD1D80]) & 1) != 0)
    {
      v28 = objc_msgSend(v9, "code");

      if (v28 == 6001)
      {
LABEL_16:
        if (v12 == 2)
        {
          PULocalizedString(CFSTR("SHARING_PREPARATION_AIRPLANE_MODE_TITLE"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_opt_class();
          -[PUErrorPresentationController assets](self, "assets");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = CFSTR("SHARING_PREPARATION_AIRPLANE_MODE_CMM_MESSAGE_");
LABEL_28:
          objc_msgSend(v30, "_mediaSpecificMessageForKeyPrefix:forAssets:", v32, v31);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v48 = objc_opt_class();
          PULocalizedString(CFSTR("SHARING_PREPARATION_AIRPLANE_MODE_MANAGE_BUTTON_TITLE"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (void *)v48;
          v51 = 10;
LABEL_42:
          objc_msgSend(v50, "alertActionForNavigatingToDestination:withTitle:completion:", v51, v49, v10);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "addObject:", v67);
          PULocalizedString(CFSTR("CANCEL"));
          v68 = objc_claimAutoreleasedReturnValue();

          v18 = (void *)v68;
LABEL_43:
          if (!v7)
            goto LABEL_60;
          objc_msgSend(v35, "stringByAppendingString:", CFSTR("\n\n[Internal Only] If you feel like this network error is unexpected, please file a radar (and explain why)."));
          v69 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "addObject:", CFSTR("Can you reach the internet in other apps?"));
          v70 = CFSTR("Do you have any cellular restrictions on Photos?");
LABEL_45:
          objc_msgSend(v16, "addObject:", v70);
          v35 = (void *)v69;
          goto LABEL_60;
        }
        if (v12 != 3)
        {
          PULocalizedString(CFSTR("SHARING_PREPARATION_CMM_NETWORK_ERROR_TITLE"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          PULocalizedString(CFSTR("SHARING_PREPARATION_CMM_NETWORK_ERROR_MESSAGE"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_43;
        }
        PULocalizedString(CFSTR("SHARING_PREPARATION_CELLULAR_RESTRICTED_TITLE"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        PULocalizedString(CFSTR("SHARING_PREPARATION_CELLULAR_RESTRICTED_CMM_MESSAGE"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }
    }
    else
    {

    }
    if (v12 == 2)
    {
      PULocalizedString(CFSTR("SHARING_PREPARATION_AIRPLANE_MODE_TITLE"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_opt_class();
      -[PUErrorPresentationController assets](self, "assets");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("SHARING_PREPARATION_AIRPLANE_MODE_MESSAGE_");
      goto LABEL_28;
    }
    if (v12 != 3)
    {
      v79 = (void *)objc_opt_class();
      -[PUErrorPresentationController assets](self, "assets");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "_defaultTitleForDownloadErrorForAssets:forSource:", v80, -[PUSharingErrorPresentationController source](self, "source"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v81 = (void *)objc_opt_class();
      -[PUErrorPresentationController assets](self, "assets");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "_mediaSpecificMessageForKeyPrefix:forAssets:", CFSTR("SHARING_PREPARATION_NETWORK_ERROR_MESSAGE_"), v82);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_43;
    }
    PULocalizedString(CFSTR("SHARING_PREPARATION_CELLULAR_RESTRICTED_TITLE"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (void *)objc_opt_class();
    -[PUErrorPresentationController assets](self, "assets");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "_mediaSpecificMessageForKeyPrefix:forAssets:", CFSTR("SHARING_PREPARATION_CELLULAR_RESTRICTED_MESSAGE_"), v65);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_41:
    v66 = objc_opt_class();
    PULocalizedString(CFSTR("SHARING_PREPARATION_CELLULAR_RESTRICTED_MANAGE_BUTTON_TITLE"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)v66;
    v51 = 9;
    goto LABEL_42;
  }
  v19 = v16;
  v20 = v17;
  v21 = v10;
  objc_msgSend(v9, "userInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0D7BC48]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "simulateError");

    if (v25)
    {
      PLUIGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v26, OS_LOG_TYPE_DEFAULT, "Sharing Error Presentation: Simulating a fake required size of 100MB for Sharing GIF -> Shared Albums error", buf, 2u);
      }

      v23 = &unk_1E59BAE30;
    }
    else
    {
      v23 = 0;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", objc_msgSend(v23, "longLongValue"), 3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("SHARED_STREAM_GIF_SIZE_LIMIT_ERROR_TITLE"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("SHARED_STREAM_GIF_SIZE_LIMIT_ERROR_MESSAGE"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v46;
  PUStringWithValidatedFormat();
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v21;
  v17 = v20;
  v16 = v19;
LABEL_60:
  -[PUErrorPresentationController setAlertTitle:](self, "setAlertTitle:", v29, v85);
  -[PUErrorPresentationController setAlertMessage:](self, "setAlertMessage:", v35);
  -[PUErrorPresentationController setAdditionalQuestionsInRadarDescription:](self, "setAdditionalQuestionsInRadarDescription:", v16);
  -[PUErrorPresentationController setAdditionalAlertActions:](self, "setAdditionalAlertActions:", v17);
  -[PUErrorPresentationController setDismissButtonTitle:](self, "setDismissButtonTitle:", v18);

}

- (unint64_t)source
{
  return self->_source;
}

- (int64_t)preparationType
{
  return self->_preparationType;
}

- (NSDictionary)itemSourcesByAssetUUID
{
  return self->_itemSourcesByAssetUUID;
}

- (void)setItemSourcesByAssetUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSourcesByAssetUUID, 0);
}

+ (int64_t)sharingErrorTypeFromError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  const __CFString *v16;
  void *v18;
  void *v19;
  int v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "simulateError");

  objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "simulatedErrorType");

  if (v5)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    objc_msgSend(v3, "domain");
    v14 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v3, "code");
    if (objc_msgSend((id)objc_opt_class(), "errorIsDownloadError:", v3))
    {
      v10 = PLCPLIsInAirplaneMode();
      v11 = PLCPLIsCellularRestricted();
      v12 = 3;
      if (!v11)
        v12 = 1;
      if (v10)
        v13 = 2;
      else
        v13 = v12;
    }
    else if ((objc_msgSend((id)objc_opt_class(), "errorIsLowDiskSpaceError:", v3) & 1) != 0)
    {
      v13 = 4;
    }
    else if (-[NSObject isEqualToString:](v14, "isEqualToString:", *MEMORY[0x1E0CD1D80]) && v9 == 6008)
    {
      v13 = 5;
    }
    else if (-[NSObject isEqualToString:](v14, "isEqualToString:", *MEMORY[0x1E0D71C78]) && v9 == 15)
    {
      v13 = 6;
    }
    else if ((objc_msgSend((id)objc_opt_class(), "errorIsUserNeedsReviewCloudSettingsError:", v3) & 1) != 0)
    {
      v13 = 7;
    }
    else if (-[NSObject isEqualToString:](v14, "isEqualToString:", *MEMORY[0x1E0D7BC40]) && v9 == -102)
    {
      v13 = 8;
    }
    else if (-[NSObject isEqualToString:](v14, "isEqualToString:", *MEMORY[0x1E0CD1880]) && v9 == 5)
    {
      v13 = 9;
    }
    else
    {
      objc_msgSend(v3, "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = objc_msgSend((id)objc_opt_class(), "sharingErrorTypeFromError:", v19);
      else
        v13 = 0;

    }
  }
  else
  {
    v13 = objc_msgSend((id)objc_opt_class(), "errorTypeFromSimulatedErrorType:", v7);
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (v13 > 9)
        v16 = CFSTR("Unknown");
      else
        v16 = off_1E589DAB0[v13];
      v20 = 138543362;
      v21 = v16;
      _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEFAULT, "Sharing Error Presentation: Will return SIMULATED error '%{public}@', because of debug settings", (uint8_t *)&v20, 0xCu);
    }
  }

  return v13;
}

+ (int64_t)errorTypeFromSimulatedErrorType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 9)
    return 0;
  else
    return a3;
}

+ (id)_mediaSpecificMessageForKeyPrefix:(id)a3 forAssets:(id)a4
{
  void *v4;
  void *v5;

  PXLocalizationKeyByAddingMediaSpecificSuffixForAssets();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_defaultTitleForDownloadErrorForAssets:(id)a3 forSource:(unint64_t)a4
{
  id v5;
  __CFString *v6;
  void *v7;

  v5 = a3;
  switch(a4)
  {
    case 0uLL:
      v6 = CFSTR("SHARING_PREPARATION_NETWORK_ERROR_TITLE");
      break;
    case 1uLL:
      v6 = CFSTR("POST_TO_SHARED_ALBUM_PREPARATION_ERROR_TITLE");
      break;
    case 2uLL:
    case 3uLL:
      PXLocalizationKeyByAddingMediaSpecificSuffixForAssets();
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      v6 = CFSTR("SYNDICATION_SAVE_PREPARATION_ERROR_TITLE");
      break;
    case 5uLL:
      v6 = CFSTR("RENDER_PREPARATION_ERROR_TITLE");
      break;
    default:
      v6 = 0;
      break;
  }
  PULocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_defaultTitleForSource:(unint64_t)a3 assets:(id)a4
{
  id v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  switch(a3)
  {
    case 1uLL:
      v6 = CFSTR("POST_TO_SHARED_ALBUM_PREPARATION_ERROR_TITLE");
      goto LABEL_7;
    case 3uLL:
      objc_msgSend((id)objc_opt_class(), "_mediaSpecificMessageForKeyPrefix:forAssets:", CFSTR("PHOTO_PICKER_PREPARATION_ERROR_TITLE_"), v5);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4uLL:
      v6 = CFSTR("SYNDICATION_SAVE_PREPARATION_ERROR_TITLE");
      goto LABEL_7;
    case 5uLL:
      v6 = CFSTR("RENDER_PREPARATION_ERROR_TITLE");
      goto LABEL_7;
    default:
      v6 = CFSTR("SHARING_PREPARATION_ERROR_TITLE");
LABEL_7:
      PULocalizedString(v6);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v8 = (void *)v7;

      return v8;
  }
}

+ (BOOL)errorIsDownloadError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  char v14;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "code");
  v6 = objc_msgSend((id)objc_opt_class(), "isNetworkRelatedError:", v3);
  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend((id)objc_opt_class(), "isNetworkRelatedError:", v9);
    v7 = v10 ^ 1;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D7BC40]) && v5 == -101
    || ((v11 = *MEMORY[0x1E0CD1DA8], objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD1DA8]))
      ? (v12 = v5 == 3)
      : (v12 = 0),
        v12))
  {
    v14 = 1;
  }
  else
  {
    v13 = objc_msgSend(v4, "isEqualToString:", v11) ^ 1;
    if (v5 != 4)
      LOBYTE(v13) = 1;
    v14 = v6 | (v13 | v7) ^ 1;
  }

  return v14;
}

+ (BOOL)errorIsLowDiskSpaceError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  char v12;
  char v14;
  char v15;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "code");
  v6 = objc_msgSend((id)objc_opt_class(), "errorIsLowDiskSpaceRelatedCPLError:", v3);
  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend((id)objc_opt_class(), "errorIsLowDiskSpaceRelatedCPLError:", v9);
    v7 = v10 ^ 1;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D7BC40]) && v5 == -110)
    goto LABEL_11;
  v11 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD1DA8]) ^ 1;
  if (v5 != 4)
    v11 = 1;
  if ((v11 | v7) != 1 || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]) && v5 == 640)
  {
LABEL_11:
    v12 = 1;
  }
  else
  {
    v14 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);
    if (v5 == 28)
      v15 = v14;
    else
      v15 = 0;
    v12 = v6 | v15;
  }

  return v12;
}

+ (BOOL)errorIsUserNeedsReviewCloudSettingsError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  BOOL v10;
  int v11;
  int v12;
  char v13;
  char v14;
  char v15;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "code");
  v6 = objc_msgSend((id)objc_opt_class(), "errorIsAuthenticationRelatedCPLError:", v3);
  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend((id)objc_opt_class(), "errorIsAuthenticationRelatedCPLError:", v9);
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD1880]))
    v10 = v5 == 4;
  else
    v10 = 0;
  if (v10
    || ((v11 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD1D80]), v5 == 6012) ? (v12 = v11) : (v12 = 0),
        ((v6 | v12) & 1) != 0))
  {
    v13 = 1;
  }
  else
  {
    v14 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD1DA8]);
    if (v5 == 4)
      v15 = v14;
    else
      v15 = 0;
    v13 = v15 & v7;
  }

  return v13;
}

@end
