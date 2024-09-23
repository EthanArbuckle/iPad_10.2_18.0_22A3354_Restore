@implementation PXSharingConfidentialityController

+ (BOOL)confidentialWarningRequiredForAsset:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (PFOSVariantHasInternalUI())
    v4 = objc_msgSend(v3, "requiresConfidentiality");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)confidentialWarningRequiredForAssets:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (PFOSVariantHasInternalUI())
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(a1, "confidentialWarningRequiredForAsset:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12) & 1) != 0)
          {
            v10 = 1;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
    v10 = 0;
LABEL_13:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)confidentialWarningRequiredForAssetReferences:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "confidentialityCheckRequired"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "asset", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EEB87F40)
            && (objc_msgSend(a1, "confidentialWarningRequiredForAsset:", v10) & 1) != 0)
          {

            v11 = 1;
            goto LABEL_14;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_14:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)confidentialWarningRequiredForShareableSelection:(id)a3
{
  uint64_t v3;
  _QWORD v5[6];
  __int128 v6;
  __int128 v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__PXSharingConfidentialityController_confidentialWarningRequiredForShareableSelection___block_invoke;
  v5[3] = &__block_descriptor_48_e35_B24__0___NSObject__NSCopying__8_B16l;
  v5[4] = a2;
  v5[5] = a1;
  if (a3)
  {
    v6 = 0u;
    v7 = 0u;
    objc_msgSend(a3, "indexPathOfObjectPassingTest:", v5);
    v3 = v6;
  }
  else
  {
    v3 = 0;
  }
  return v3 != *(_QWORD *)off_1E50B7E98;
}

+ (BOOL)confidentialityCheckRequired
{
  void *v2;
  int v3;
  void *v4;
  char v5;
  int v6;
  void *v8;

  if (!PFOSVariantHasInternalUI())
    goto LABEL_4;
  +[PXSharingSettings sharedInstance](PXSharingSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showConfidentialityWarnings");

  if (!v3)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("PXDefaultDisableConfidentialityChecks"));

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "launchedToTest") ^ 1;

  }
  else
  {
LABEL_4:
    LOBYTE(v6) = 0;
  }
  return v6;
}

+ (NSString)confidentialityWarningTitle
{
  return (NSString *)CFSTR("Warning: Confidential");
}

+ (NSString)confidentialityWarningMessage
{
  return (NSString *)CFSTR("These assets contain unreleased features and should NOT be shared to undisclosed recipients");
}

+ (NSString)confidentialFeatureWarningMessage
{
  return (NSString *)CFSTR("This is an unreleased feature that should not be shared with undisclosed recipients");
}

uint64_t __87__PXSharingConfidentialityController_confidentialWarningRequiredForShareableSelection___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "confidentialWarningRequiredForAsset:", a2);
}

+ (id)confidentialityAlertWithActions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PXSharingConfidentialityController confidentialityWarningTitle](PXSharingConfidentialityController, "confidentialityWarningTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharingConfidentialityController confidentialityWarningMessage](PXSharingConfidentialityController, "confidentialityWarningMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addAction:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), (_QWORD)v13);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)confidentialityAlertWithConfirmAction:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC3448];
  v4 = a3;
  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionWithTitle:style:handler:", v5, 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharingConfidentialityController confidentialityAlertWithActions:](PXSharingConfidentialityController, "confidentialityAlertWithActions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)confidentialityAlertWithConfirmAction:(id)a3 abortAction:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a1, "confidentialityAlertWithConfirmAction:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXAbort"), CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v10);
  return v7;
}

@end
