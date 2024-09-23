@implementation PHAsset(PXSharingAdditions)

- (uint64_t)px_isSupportedApp:()PXSharingAdditions
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  if (px_isSupportedApp__onceToken != -1)
    dispatch_once(&px_isSupportedApp__onceToken, &__block_literal_global_229460);
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend((id)px_isSupportedApp__supportedOriginators, "containsObject:", v4);
  else
    v5 = 0;

  return v5;
}

- (uint64_t)requiresConfidentiality
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "pl_managedAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v7 = 0;
    v6 = 0;
    if (!objc_msgSend(a1, "isPhoto"))
      goto LABEL_14;
    goto LABEL_6;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("84"));
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = v6 != 0;
  if ((objc_msgSend(a1, "isPhoto") & 1) != 0)
  {
LABEL_6:
    objc_msgSend(v2, "metadataFromMediaPropertiesOrOriginalResource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "isThreeImageStereoHEIC"))
      v7 |= objc_msgSend(v9, "isAlchemist") ^ 1;

    if ((v7 & 1) == 0)
    {
      v6 = 0;
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  if (!v6)
    goto LABEL_14;
LABEL_10:
  PLUIGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = a1;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Sharing warning required for: %@", (uint8_t *)&v12, 0xCu);
  }

  v6 = 1;
LABEL_14:

  return v6;
}

@end
