@implementation PKRemoteCloudStoreAssetManifestItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)recordName
{
  void *v2;
  void *v3;

  -[PKRemoteAssetManifestItem remoteURL](self, "remoteURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourceSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)itemType
{
  return 1;
}

- (void)downloadAssetWithCloudStoreCoordinatorDelegate:(id)a3 completion:(id)a4
{
  -[PKRemoteCloudStoreAssetManifestItem downloadAssetWithCloudStoreCoordinatorDelegate:tryCount:completion:](self, "downloadAssetWithCloudStoreCoordinatorDelegate:tryCount:completion:", a3, 1, a4);
}

- (void)downloadAssetWithCloudStoreCoordinatorDelegate:(id)a3 tryCount:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    if (!v8)
    {
      if ((PKRunningInPassd() & 1) != 0)
      {
        v8 = 0;
      }
      else
      {
        +[PKCloudStoreService sharedInstance](PKCloudStoreService, "sharedInstance");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__80;
    v34 = __Block_byref_object_dispose__80;
    v35 = 0;
    if (v8)
    {
      PKLogFacilityTypeGetObject(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[PKRemoteCloudStoreAssetManifestItem recordName](self, "recordName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v37 = v11;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Downloading recordName from cloudkit %@", buf, 0xCu);

      }
      -[PKRemoteCloudStoreAssetManifestItem recordName](self, "recordName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __106__PKRemoteCloudStoreAssetManifestItem_downloadAssetWithCloudStoreCoordinatorDelegate_tryCount_completion___block_invoke;
      v25[3] = &unk_1E2ADB2C8;
      v28 = &v30;
      v29 = a4;
      v25[4] = self;
      v26 = v8;
      v27 = v9;
      objc_msgSend(v26, "itemOfItemType:recordName:qualityOfService:completion:", 4, v12, 25, v25);

    }
    else
    {
      -[PKRemoteCloudStoreAssetManifestItem recordName](self, "recordName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PKValidationErrorWithReason(CFSTR("A cloudStoreCoordinatorDelegate is not set on the PKRemoteCloudStoreAssetManifestItem with recordName %@. Cannot download remote cloud asset."), v14, v15, v16, v17, v18, v19, v20, (uint64_t)v13);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v31[5];
      v31[5] = v21;

      PKLogFacilityTypeGetObject(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)v31[5];
        *(_DWORD *)buf = 138412290;
        v37 = v24;
        _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      (*((void (**)(id, _QWORD, uint64_t, uint64_t))v9 + 2))(v9, 0, 1, v31[5]);
    }
    _Block_object_dispose(&v30, 8);

  }
}

void __106__PKRemoteCloudStoreAssetManifestItem_downloadAssetWithCloudStoreCoordinatorDelegate_tryCount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  id v30;

  v30 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKValidationErrorWithReason(CFSTR("Couldn't download remote cloud store asset. Error: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

LABEL_6:
    v25 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PKValidationErrorWithReason(CFSTR("Invalid PKCloudRecordObject %@ returned when downloading remote cloud store asset."), v18, v19, v20, v21, v22, v23, v24, (uint64_t)v30);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    goto LABEL_6;
  }
  objc_msgSend(v30, "assetData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    && objc_msgSend(*(id *)(a1 + 32), "isRequired")
    && (v29 = *(_QWORD *)(a1 + 64), v29 <= 2))
  {
    objc_msgSend(*(id *)(a1 + 32), "downloadAssetWithCloudStoreCoordinatorDelegate:tryCount:completion:", *(_QWORD *)(a1 + 40), v29 + 1, *(_QWORD *)(a1 + 48));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

@end
