@implementation CKAsset(BRCEnhancedDrivePrivacyAdditions)

+ (id)transferOptionsWithMMCSV2:()BRCEnhancedDrivePrivacyAdditions
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseMMCSEncryptionV2:", v5);

  return v4;
}

+ (id)br_assetWithFileURL:()BRCEnhancedDrivePrivacyAdditions boundaryKey:
{
  _BOOL8 v6;
  id v7;
  void *v8;

  v6 = a4 != 0;
  v7 = a4;
  objc_msgSend(a1, "br_assetWithFileURL:useMMCSEncryptionV2:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBoundaryKey:", v7);

  return v8;
}

+ (id)br_assetWithFileURL:()BRCEnhancedDrivePrivacyAdditions useMMCSEncryptionV2:
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x24BDB9010];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithFileURL:", v7);

  objc_msgSend(a1, "transferOptionsWithMMCSV2:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAssetTransferOptions:", v9);

  return v8;
}

+ (id)br_assetWithDeviceID:()BRCEnhancedDrivePrivacyAdditions fileID:generationID:boundaryKey:
{
  _BOOL8 v10;
  id v11;
  void *v12;

  v10 = a6 != 0;
  v11 = a6;
  objc_msgSend(a1, "br_assetWithDeviceID:fileID:generationID:useMMCSEncryptionV2:", a3, a4, a5, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBoundaryKey:", v11);

  return v12;
}

+ (id)br_assetWithDeviceID:()BRCEnhancedDrivePrivacyAdditions fileID:generationID:useMMCSEncryptionV2:
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = (objc_class *)MEMORY[0x24BDB9010];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend([v10 alloc], "initWithDeviceID:fileID:generationID:", v13, v12, v11);

  objc_msgSend(a1, "transferOptionsWithMMCSV2:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAssetTransferOptions:", v15);

  return v14;
}

+ (id)br_assetWithAssetReferece:()BRCEnhancedDrivePrivacyAdditions boundaryKey:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9010]), "initWithAssetReference:", v6);
  objc_msgSend(a1, "transferOptionsWithMMCSV2:", v7 != 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAssetTransferOptions:", v9);

  objc_msgSend(v8, "setBoundaryKey:", v7);
  v10 = v8;

  return v10;
}

@end
