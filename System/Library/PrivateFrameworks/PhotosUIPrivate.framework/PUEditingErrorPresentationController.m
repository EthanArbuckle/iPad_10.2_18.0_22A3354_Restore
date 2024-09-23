@implementation PUEditingErrorPresentationController

- (PUEditingErrorPresentationController)initWithErrors:(id)a3 forAssets:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  NSObject *v11;
  PUEditingErrorPresentationController *v12;
  objc_super v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PUEditingErrorPresentationController editingErrorTypeFromError:](PUEditingErrorPresentationController, "editingErrorTypeFromError:", v8);
  if (v9 > 3)
    v10 = CFSTR("Unknown");
  else
    v10 = off_1E58A0188[v9];
  PLPhotoEditGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    v16 = objc_msgSend(v6, "count");
    v17 = 2114;
    v18 = v10;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "Error loading assets. # assets: %lu. First Error Type: %{public}@. First Raw Error: %@", buf, 0x20u);
  }

  v14.receiver = self;
  v14.super_class = (Class)PUEditingErrorPresentationController;
  v12 = -[PUErrorPresentationController initWithErrors:forAssets:](&v14, sel_initWithErrors_forAssets_, v7, v6);

  return v12;
}

- (PUEditingErrorPresentationController)initWithError:(id)a3 forAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  PUEditingErrorPresentationController *v16;
  objc_super v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CD1390], "descriptionForMediaType:", objc_msgSend(v7, "mediaType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "descriptionForMediaSubtypes:", objc_msgSend(v7, "mediaSubtypes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[PUEditingErrorPresentationController editingErrorTypeFromError:](PUEditingErrorPresentationController, "editingErrorTypeFromError:", v6);
  if (v10 > 3)
    v11 = CFSTR("Unknown");
  else
    v11 = off_1E58A0188[v10];
  PLPhotoEditGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v22 = v13;
    v23 = 2114;
    v24 = v8;
    v25 = 2114;
    v26 = v9;
    v27 = 2114;
    v28 = v11;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "Error loading asset %{public}@ of type: %{public}@ and subtype: %{public}@ for editing. Determined Error Type: %{public}@. Raw Error: %@", buf, 0x34u);

  }
  v20 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)PUEditingErrorPresentationController;
  v16 = -[PUErrorPresentationController initWithErrors:forAssets:](&v18, sel_initWithErrors_forAssets_, v14, v15);

  return v16;
}

- (BOOL)shouldShowFileRadarAction
{
  void *v2;
  char v3;

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showFileRadarButtonForEditEntryOnInternalInstalls");

  return v3;
}

- (id)additionalRadarDescriptionLinesForAsset:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend(v5, "isAdjusted"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Is Adjusted: %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend(v5, "isContentAdjustmentAllowed"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Content Adjustment Allowed: %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v11);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = v5;
    if (objc_msgSend(v13, "needsDeferredProcessing"))
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Needs Deferred Processing: %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v15);

    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = objc_msgSend(v13, "isPhotoStreamPhoto");

    if (v17)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Is Shared Album Asset: %@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v19);

  }
  if (objc_msgSend(v5, "isLivePhoto"))
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v5, "hasPhotoColorAdjustments"))
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Significant color adjustments between image and video (e.g. HDR): %@"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v22);

  }
  objc_msgSend(v5, "pathForOriginalImageFile");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "pathForOriginalImageFile");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lastPathComponent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ (Original Image file)"), v26);
  }
  else
  {
    objc_msgSend(v5, "pathForOriginalVideoFile");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "pathForOriginalVideoFile");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ (Original Video file)"), v26);
    }
    else
    {
      objc_msgSend(v5, "pathForTrimmedVideoFile");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        v31 = &stru_1E58AD278;
        goto LABEL_27;
      }
      v30 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "pathForTrimmedVideoFile");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("%@ (Original Trimmed Video file)"), v26);
    }
  }
  v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Path: %@"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v32);

  return v4;
}

- (void)configureRadarPropertiesFromError:(id)a3 withAssets:(id)a4
{
  -[PUErrorPresentationController setRadarTitle:](self, "setRadarTitle:", CFSTR("[Unable to Edit TTR]: <Add brief error description>"), a4);
  -[PUErrorPresentationController setRadarComponentID:name:version:](self, "setRadarComponentID:name:version:", CFSTR("476277"), CFSTR("Photos UI Edit"), CFSTR("iOS"));
}

- (void)configureAlertPropertiesFromError:(id)a3 withAssets:(id)a4 willShowFileRadarButton:(BOOL)a5 alertCompletion:(id)a6
{
  _BOOL4 v7;
  __CFString *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  const __CFString *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  _BOOL4 v37;
  id v38;
  uint8_t buf[4];
  const __CFString *v40;
  __int16 v41;
  __CFString *v42;
  uint64_t v43;

  v7 = a5;
  v43 = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = a4;
  v38 = a6;
  v12 = objc_msgSend((id)objc_opt_class(), "editingErrorTypeFromError:", v10);
  v13 = v12;
  if (v12 > 3)
    v14 = CFSTR("Unknown");
  else
    v14 = off_1E58A0188[v12];
  PLUIGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v40 = v14;
    v41 = 2114;
    v42 = v10;
    _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "Edit: Will show \"Unable to edit\" dialogue. Error Type: %{public}@. Actual Error: %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("OK"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 - 1 > 2)
  {
    v26 = (void *)objc_opt_class();
    -[PUErrorPresentationController assets](self, "assets");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = objc_msgSend(v26, "assetIsStandardVideo:", v28);

    PLPhotoEditGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    v20 = v11;
    if ((_DWORD)v26)
    {
      if (v30)
      {
        *(_DWORD *)buf = 138412290;
        v40 = v10;
        _os_log_impl(&dword_1AAB61000, v29, OS_LOG_TYPE_ERROR, "Error loading base video: %@", buf, 0xCu);
      }

      PULocalizedString(CFSTR("VIDEOEDIT_LOAD_FAILED_TITLE"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("VIDEOEDIT_LOAD_FAILED_MESSAGE");
    }
    else
    {
      if (v30)
      {
        *(_DWORD *)buf = 138412290;
        v40 = v10;
        _os_log_impl(&dword_1AAB61000, v29, OS_LOG_TYPE_ERROR, "Error loading base image: %@", buf, 0xCu);
      }

      PULocalizedString(CFSTR("PHOTOEDIT_EDIT_LOAD_IMAGE_FAILED_TITLE"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("PHOTOEDIT_EDIT_LOAD_IMAGE_FAILED_MESSAGE");
    }
    PULocalizedString(v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x1AF429AF0]())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n[INTERNAL ONLY] %@"), v21, v10);
      v32 = objc_claimAutoreleasedReturnValue();

LABEL_23:
      v21 = (void *)v32;
    }
  }
  else
  {
    v37 = v7;
    if (v13 == 3)
    {
      PULocalizedString(CFSTR("PHOTOEDIT_EDIT_LOAD_CELLULAR_RESTRICTED_TITLE"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v11;
      objc_msgSend((id)objc_opt_class(), "_mediaSpecificMessageForKeyPrefix:forAssets:", CFSTR("PHOTOEDIT_EDIT_LOAD_CELLULAR_RESTRICTED_MESSAGE_"), v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_opt_class();
      PULocalizedString(CFSTR("PHOTOEDIT_EDIT_LOAD_CELLULAR_RESTRICTED_MANAGE_BUTTON_TITLE"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "alertActionForNavigatingToDestination:withTitle:completion:", 9, v34, v38);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "addObject:", v35);
      PULocalizedString(CFSTR("CANCEL"));
      v36 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v36;
    }
    else if (v13 == 2)
    {
      PULocalizedString(CFSTR("PHOTOEDIT_EDIT_LOAD_AIRPLANE_MODE_TITLE"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v11;
      objc_msgSend((id)objc_opt_class(), "_mediaSpecificMessageForKeyPrefix:forAssets:", CFSTR("PHOTOEDIT_EDIT_LOAD_AIRPLANE_MODE_MESSAGE_"), v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_opt_class();
      PULocalizedString(CFSTR("PHOTOEDIT_EDIT_LOAD_AIRPLANE_MODE_MANAGE_BUTTON_TITLE"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "alertActionForNavigatingToDestination:withTitle:completion:", 10, v23, v38);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "addObject:", v24);
      PULocalizedString(CFSTR("CANCEL"));
      v25 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v25;
    }
    else
    {
      v20 = v11;
      objc_msgSend((id)objc_opt_class(), "_mediaSpecificMessageForKeyPrefix:forAssets:", CFSTR("PHOTOEDIT_EDIT_LOAD_NETWORK_ERROR_TITLE_"), v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_hardwareModelSpecificMessageForKeyPrefix:", CFSTR("PHOTOEDIT_EDIT_LOAD_NETWORK_ERROR_MESSAGE_"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v37)
    {
      objc_msgSend(v21, "stringByAppendingString:", CFSTR("\n\n[Internal Only] If you feel like this network error is unexpected, please file a radar (and explain why)."));
      v32 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "addObject:", CFSTR("Can you reach the internet in other apps?"));
      objc_msgSend(v16, "addObject:", CFSTR("Do you have any cellular restrictions on Photos?"));
      goto LABEL_23;
    }
  }
  -[PUErrorPresentationController setAlertTitle:](self, "setAlertTitle:", v19);
  -[PUErrorPresentationController setAlertMessage:](self, "setAlertMessage:", v21);
  -[PUErrorPresentationController setAdditionalQuestionsInRadarDescription:](self, "setAdditionalQuestionsInRadarDescription:", v16);
  -[PUErrorPresentationController setAdditionalAlertActions:](self, "setAdditionalAlertActions:", v17);
  -[PUErrorPresentationController setDismissButtonTitle:](self, "setDismissButtonTitle:", v18);

}

+ (int64_t)editingErrorTypeFromError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "simulateEditEntryError");

  if (v5)
  {
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "simulatedEditingEntryErrorType");

    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v7 > 3)
        v9 = CFSTR("Unknown");
      else
        v9 = off_1E58A0188[v7];
      v15 = 138543362;
      v16 = v9;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "Editing Error Presentation: Will return SIMULATED error '%{public}@', because of debug settings", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_16;
  }
  if (!objc_msgSend((id)objc_opt_class(), "errorIsDownloadError:", v3))
  {
    objc_msgSend(v3, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend((id)objc_opt_class(), "editingErrorTypeFromError:", v8);
    else
      v7 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v10 = PLCPLIsInAirplaneMode();
  v11 = PLCPLIsCellularRestricted();
  v12 = 3;
  if (!v11)
    v12 = 1;
  if (v10)
    v7 = 2;
  else
    v7 = v12;
LABEL_17:

  return v7;
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

+ (id)_hardwareModelSpecificMessageForKeyPrefix:(id)a3
{
  void *v3;
  void *v4;

  PXLocalizationKeyByAddingDeviceModelSuffix();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)errorIsDownloadError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  char v7;
  char v8;
  char v9;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "code");
  v6 = objc_msgSend((id)objc_opt_class(), "isNetworkRelatedError:", v3);

  v7 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD1D80]);
  if (v5 == 3303)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8 | v6;

  return v9;
}

@end
