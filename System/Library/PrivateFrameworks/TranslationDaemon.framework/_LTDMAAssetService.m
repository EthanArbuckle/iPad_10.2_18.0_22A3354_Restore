@implementation _LTDMAAssetService

+ (id)_queue
{
  if (_queue_onceToken_0 != -1)
    dispatch_once(&_queue_onceToken_0, &__block_literal_global_11);
  return (id)_queue__queue_0;
}

+ (BOOL)isInvalidPallasCatalog:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "assetType") == 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_errorFromQueryResult:(int64_t)a3
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v3 = 0;
  v10[1] = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 0:
    case 14:
      return v3;
    case 1:
    case 4:
    case 11:
      v3 = CFSTR("Mobile asset query failed due to XPC error");
      v4 = 13;
      goto LABEL_7;
    case 2:
      v3 = CFSTR("Mobile asset query failed due to catalog not downloaded");
      v4 = 14;
      goto LABEL_7;
    case 3:
    case 5:
    case 6:
    case 7:
    case 9:
    case 12:
      v3 = CFSTR("Mobile asset query failed due to query error");
      v4 = 21;
      goto LABEL_7;
    case 8:
    case 10:
    case 13:
      v3 = CFSTR("Mobile asset query failed due to encode error");
      v4 = 4;
      goto LABEL_7;
    default:
      v4 = 0;
LABEL_7:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MAQueryResult %zd: %@"), a3, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BDD1540];
      v9 = *MEMORY[0x24BDD0FC8];
      v10[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("LTTranslationDaemonErrorDomain"), v4, v7);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      return v3;
  }
}

+ (int64_t)_returnTypeForFilter:(unint64_t)a3
{
  if (a3 > 3)
    return 0;
  else
    return qword_249338648[a3];
}

+ (void)queryAssetType:(id)a3 filter:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a5;
  objc_msgSend(a1, "_queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55___LTDMAAssetService_queryAssetType_filter_completion___block_invoke;
  v13[3] = &unk_251A12300;
  v16 = a1;
  v17 = a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

+ (id)queryAssetType:(id)a3 filter:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  _LTDMAAssetModel *v19;
  _LTDAssetModel *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", v8);
  objc_msgSend(v9, "returnTypes:", objc_msgSend(a1, "_returnTypeForFilter:", a4));
  objc_msgSend(a1, "_errorFromQueryResult:", objc_msgSend(v9, "queryMetaDataSync"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v10);
  }
  else
  {
    objc_msgSend(v9, "results");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v13, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          v19 = -[_LTDMAAssetModel initWithMAAsset:]([_LTDMAAssetModel alloc], "initWithMAAsset:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
          v20 = -[_LTDAssetModel initWithProvider:]([_LTDAssetModel alloc], "initWithProvider:", v19);
          if (v20)
            objc_msgSend(v12, "addObject:", v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v16);
    }

    v11 = 0;
  }

  return v12;
}

+ (id)_errorFromDownloadResult:(int64_t)a3
{
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (a3 > 47)
  {
    if ((unint64_t)(a3 - 59) < 2)
    {
      v5 = CFSTR("Mobile asset failed to reach asset host");
      v6 = 22;
      goto LABEL_17;
    }
    if (a3 == 48)
    {
      v5 = CFSTR("Mobile asset install cancelled");
      v6 = 17;
      goto LABEL_17;
    }
    if (a3 == 53)
    {
      v5 = CFSTR("Mobile asset timed out during download");
      v6 = 11;
LABEL_17:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MAQueryResult %zd: %@"), a3, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x24BDD1540];
      v12 = *MEMORY[0x24BDD0FC8];
      v13[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("LTTranslationDaemonErrorDomain"), v6, v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return v4;
    }
LABEL_16:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MOBILE_ASSET_DOWNLOAD_FAILURE_ERROR_DESCRIPTION"), &stru_251A15610, 0);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v6 = 0;
    goto LABEL_17;
  }
  if (a3 > 11)
  {
    if (a3 == 12)
    {
      v5 = CFSTR("Mobile asset failed to download due to missing entitlement");
      v6 = 5;
      goto LABEL_17;
    }
    if (a3 == 44)
    {
      v5 = CFSTR("Mobile asset failed to download since not found");
      v6 = 7;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v4 = 0;
  if (a3 && a3 != 10)
    goto LABEL_16;
  return v4;
}

+ (id)maDownloadOptionsFrom:(unint64_t)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setAllowsCellularAccess:", a3 & 1);
  objc_msgSend(v4, "setDiscretionary:", (a3 & 2) == 0);
  objc_msgSend(v4, "setRequiresPowerPluggedIn:", (a3 >> 2) & 1);
  return v4;
}

+ (void)downloadCatalogForAssetType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setDiscretionary:", 0);
  objc_msgSend(v8, "setRequiresPowerPluggedIn:", 0);
  objc_msgSend(v8, "setAllowsCellularAccess:", 0);
  objc_msgSend(a1, "_queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke;
  v13[3] = &unk_251A12350;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v17 = a1;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  dispatch_async(v9, v13);

}

+ (void)downloadAsset:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  void (**v30)(id, void *);
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, void *))a6;
  objc_msgSend(a1, "maDownloadOptionsFrom:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = _LTOSLogAssets();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v10;
    _os_log_impl(&dword_2491B9000, v14, OS_LOG_TYPE_INFO, "Requested MobileAsset download of asset %{public}@", buf, 0xCu);
  }
  if (objc_msgSend(v10, "isTTSModel"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MA asset service unsupported asset type"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "ltd_errorWithCode:description:userInfo:", 16, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = _LTOSLogAssets();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[_LTDMAAssetService downloadAsset:options:progress:completion:].cold.1((uint64_t)v10);
    v12[2](v12, v16);
  }
  else
  {
    objc_msgSend(v10, "progress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setOfflineState:", 1);

    +[_LTDMAAssetModel modelFromAsset:](_LTDMAAssetModel, "modelFromAsset:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "maAsset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke;
    v33[3] = &unk_251A123A0;
    v37 = a1;
    v22 = v10;
    v34 = v22;
    v23 = v11;
    v36 = v23;
    v24 = v19;
    v35 = v24;
    objc_msgSend(v20, "attachProgressCallBack:", v33);

    objc_msgSend(a1, "_queue");
    v25 = objc_claimAutoreleasedReturnValue();
    v26[0] = v21;
    v26[1] = 3221225472;
    v26[2] = __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_214;
    v26[3] = &unk_251A12418;
    v27 = v24;
    v28 = v13;
    v32 = a1;
    v29 = v22;
    v30 = v12;
    v31 = v23;
    v15 = v24;
    dispatch_async(v25, v26);

    v16 = v34;
  }

}

+ (void)purgeAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44___LTDMAAssetService_purgeAsset_completion___block_invoke;
  block[3] = &unk_251A11750;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

+ (void)downloadAsset:(uint64_t)a1 options:progress:completion:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v1, v2, "MobileAsset failed to download asset %{public}@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_2();
}

@end
