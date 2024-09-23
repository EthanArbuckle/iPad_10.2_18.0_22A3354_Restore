@implementation PUOneUpLoadingErrorPresentationController

- (PUOneUpLoadingErrorPresentationController)initWithError:(id)a3 forAsset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  PUOneUpLoadingErrorPresentationController *v12;
  void *v14;
  void *v15;
  objc_super v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpLoadingErrorPresentationController.m"), 78, CFSTR("Error supplied to PUOneUpLoadingErrorPresentationController initializer was nil, and cannot be nil."));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpLoadingErrorPresentationController.m"), 79, CFSTR("Asset supplied to PUOneUpLoadingErrorPresentationController initializer was nil, and cannot be nil."));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)PUOneUpLoadingErrorPresentationController;
  v12 = -[PUErrorPresentationController initWithErrors:forAssets:](&v16, sel_initWithErrors_forAssets_, v10, v11);

  return v12;
}

- (BOOL)shouldShowFileRadarAction
{
  void *v2;
  char v3;

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showFileRadarButtonForOneUpErrorPresentationsOnInternalInstalls");

  return v3;
}

- (id)additionalRadarDescriptionLinesForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "originalFilename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Filename: %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  return v4;
}

- (void)configureRadarPropertiesFromError:(id)a3 withAssets:(id)a4
{
  -[PUErrorPresentationController setRadarTitle:](self, "setRadarTitle:", CFSTR("[Unable to Load in 1up TTR]: <Add brief error description>"), a4);
}

- (void)configureAlertPropertiesFromError:(id)a3 withAssets:(id)a4 willShowFileRadarButton:(BOOL)a5 alertCompletion:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  const __CFString *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  id v41;
  id v42;
  void *v43;
  uint8_t buf[4];
  const __CFString *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v7 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  -[PUErrorPresentationController assets](self, "assets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend((id)objc_opt_class(), "oneUpLoadingErrorTypeFromError:", v9);
  v14 = v13;
  if (v13 > 4)
    v15 = CFSTR("Unknown");
  else
    v15 = off_1E58A8368[v13];
  PLUIGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v45 = v15;
    v46 = 2114;
    v47 = v9;
    _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_ERROR, "OneUp: Will show \"Unable to Load in 1up\" dialogue. Error Type: %{public}@. Actual Error: %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("OK"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)v12;
  if (v14 - 1 <= 2)
  {
    v40 = v7;
    if (v14 == 3)
    {
      PULocalizedString(CFSTR("ONEUP_LOADING_CELLULAR_RESTRICTED_TITLE"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_mediaSpecificMessageForKeyPrefix:forAsset:", CFSTR("ONEUP_LOADING_CELLULAR_RESTRICTED_MESSAGE_"), v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_opt_class();
      PULocalizedString(CFSTR("ONEUP_LOADING_CELLULAR_RESTRICTED_MANAGE_BUTTON_TITLE"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)v36;
      v25 = 9;
    }
    else
    {
      if (v14 != 2)
      {
        objc_msgSend((id)objc_opt_class(), "_mediaSpecificMessageForKeyPrefix:forAsset:", CFSTR("ONEUP_LOADING_NETWORK_ERROR_TITLE_"), v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_hardwareModelSpecificMessageForKeyPrefix:", CFSTR("ONEUP_LOADING_NETWORK_ERROR_MESSAGE_"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
        if (v40)
        {
          objc_msgSend(v21, "stringByAppendingString:", CFSTR("\n\n[Internal Only] If you feel like this network error is unexpected, please file a radar (and explain why)."));
          v39 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "addObject:", CFSTR("Can you reach the internet in other apps?"));
          objc_msgSend(v17, "addObject:", CFSTR("Do you have any cellular restrictions on Photos?"));
          v21 = (void *)v39;
        }
        goto LABEL_24;
      }
      PULocalizedString(CFSTR("ONEUP_LOADING_AIRPLANE_MODE_TITLE"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_mediaSpecificMessageForKeyPrefix:forAsset:", CFSTR("ONEUP_LOADING_AIRPLANE_MODE_MESSAGE_"), v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_opt_class();
      PULocalizedString(CFSTR("ONEUP_LOADING_AIRPLANE_MODE_MANAGE_BUTTON_TITLE"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)v22;
      v25 = 10;
    }
    objc_msgSend(v24, "alertActionForNavigatingToDestination:withTitle:completion:", v25, v23, v10);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObject:", v37);
    PULocalizedString(CFSTR("CANCEL"));
    v38 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v38;
    goto LABEL_19;
  }
  v41 = v9;
  v42 = v10;
  if (v14 == 4)
  {
    PULocalizedString(CFSTR("ONEUP_LOADING_LOW_DISK_SPACE_TITLE"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_mediaSpecificMessageForKeyPrefix:forAsset:", CFSTR("ONEUP_LOADING_LOW_DISK_SPACE_MESSAGE_"), v12);
    v26 = v7;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_opt_class();
    PULocalizedString(CFSTR("ONEUP_LOADING_LOW_DISK_SPACE_MANAGE_BUTTON_TITLE"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "alertActionForNavigatingToDestination:withTitle:completion:", 2, v28, v42);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObject:", v29);
    PULocalizedString(CFSTR("CANCEL"));
    v30 = objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v21, "stringByAppendingString:", CFSTR("\n\n[Internal Only] If you feel like this storage error is unexpected, please file a radar (and explain why)."));
      v31 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "addObject:", CFSTR("What does Settings->General->About report that you have for available storage?"));
      v21 = (void *)v31;
    }

    v19 = (void *)v30;
  }
  else
  {
    v32 = (void *)objc_opt_class();
    -[PUErrorPresentationController assets](self, "assets");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = objc_msgSend(v32, "assetIsStandardVideo:", v34);

    if ((_DWORD)v32)
    {
      PULocalizedString(CFSTR("ONEUP_LOADING_ERROR_TITLE_VIDEO"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("ONEUP_LOADING_ERROR_MESSAGE_VIDEO");
    }
    else
    {
      PULocalizedString(CFSTR("ONEUP_LOADING_ERROR_TITLE_PHOTO"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("ONEUP_LOADING_ERROR_MESSAGE_PHOTO");
    }
    PULocalizedString(v35);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v41;
  v10 = v42;
LABEL_24:
  -[PUErrorPresentationController setAlertTitle:](self, "setAlertTitle:", v20);
  -[PUErrorPresentationController setAlertMessage:](self, "setAlertMessage:", v21);
  -[PUErrorPresentationController setAdditionalQuestionsInRadarDescription:](self, "setAdditionalQuestionsInRadarDescription:", v17);
  -[PUErrorPresentationController setAdditionalAlertActions:](self, "setAdditionalAlertActions:", v18);
  -[PUErrorPresentationController setDismissButtonTitle:](self, "setDismissButtonTitle:", v19);

}

+ (int64_t)oneUpLoadingErrorTypeFromError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  BOOL v7;
  int v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  const __CFString *v14;
  void *v15;
  int v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "simulateAssetContentLoading");
  v6 = objc_msgSend(v4, "simulateLoadingError");
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v11 = objc_msgSend(v4, "simulatedLoadingErrorType");
    PLUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v11 > 4)
        v14 = CFSTR("Unknown");
      else
        v14 = off_1E58A8368[v11];
      v17 = 138543362;
      v18 = v14;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEFAULT, "One Up: Will return SIMULATED error '%{public}@', because of debug settings", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_22;
  }
  if (objc_msgSend((id)objc_opt_class(), "errorIsDownloadError:", v3))
  {
    v8 = PLCPLIsInAirplaneMode();
    v9 = PLCPLIsCellularRestricted();
    v10 = 3;
    if (!v9)
      v10 = 1;
    if (v8)
      v11 = 2;
    else
      v11 = v10;
  }
  else
  {
    if ((objc_msgSend((id)objc_opt_class(), "errorIsLowDiskSpaceError:", v3) & 1) == 0)
    {
      objc_msgSend(v3, "userInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v12 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = objc_msgSend((id)objc_opt_class(), "oneUpLoadingErrorTypeFromError:", v12);
      else
        v11 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v11 = 4;
  }
LABEL_23:

  return v11;
}

+ (id)_mediaSpecificMessageForKeyPrefix:(id)a3 forAsset:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v12[0] = a4;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizationKeyByAddingMediaSpecificSuffixForAssets();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PULocalizedString(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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
  char v4;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "isNetworkRelatedError:", v3);

  return v4;
}

+ (BOOL)errorIsLowDiskSpaceError:(id)a3
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
  v6 = objc_msgSend((id)objc_opt_class(), "errorIsLowDiskSpaceRelatedCPLError:", v3);

  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]) && v5 == 640)
  {
    v7 = 1;
  }
  else
  {
    v8 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);
    if (v5 == 28)
      v9 = v8;
    else
      v9 = 0;
    v7 = v9 | v6;
  }

  return v7;
}

@end
