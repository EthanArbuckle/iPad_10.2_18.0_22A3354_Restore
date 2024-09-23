@implementation PBBridgeAssetsManager

- (void)setDeviceAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAttributes, a3);
}

- (PBBridgeAssetsManager)init
{
  PBBridgeAssetsManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialQueue;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *concurrentQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PBBridgeAssetsManager;
  v2 = -[PBBridgeAssetsManager init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Bridge-AssetQueue-Serial", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_attr_make_with_qos_class(MEMORY[0x24BDAC9C0], QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.Bridge-AssetQueue-Concurrent", v5);
    concurrentQueue = v2->_concurrentQueue;
    v2->_concurrentQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (void)beginPullingAssetsForAdvertisingName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PBAdvertisingInfoFromPayload(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("s"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("m"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
  {
    v18[0] = v11;
    v17[0] = CFSTR("Material_Type");
    v17[1] = CFSTR("Size_Type");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", SizeForInternalSize(v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = CFSTR("HW_Class");
    v18[1] = v13;
    v18[2] = &unk_24CBCE7D0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v14 = objc_claimAutoreleasedReturnValue();

    -[PBBridgeAssetsManager _beginPullingAssetsForDeviceAttributes:completion:](self, "_beginPullingAssetsForDeviceAttributes:completion:", v14, v7);
  }
  else
  {
    pbb_mobileasset_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_2113B6000, v14, OS_LOG_TYPE_DEFAULT, "Ignored Pulling Assets for Malformed Advertising Name: %@", (uint8_t *)&v15, 0xCu);
    }
  }

}

- (void)_beginPullingAssetsForDeviceAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v6 = a4;
  -[PBBridgeAssetsManager setDeviceAttributes:](self, "setDeviceAttributes:", a3);
  v7 = objc_alloc_init(MEMORY[0x24BE66C10]);
  objc_msgSend(v7, "setDiscretionary:", 0);
  pbb_mobileasset_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "Downloading asset catalog...", buf, 2u);
  }

  v9 = (void *)MEMORY[0x24BE66B90];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__PBBridgeAssetsManager__beginPullingAssetsForDeviceAttributes_completion___block_invoke;
  v11[3] = &unk_24CBBE3B8;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "startCatalogDownload:options:then:", CFSTR("com.apple.MobileAsset.BridgeAssets"), v7, v11);

}

- (void)beginPullingAssetsForDeviceMaterial:(unint64_t)a3 size:(unint64_t)a4 branding:(unint64_t)a5 completion:(id)a6
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("Material_Type");
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = a6;
  objc_msgSend(v9, "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v14[1] = CFSTR("Size_Type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = CFSTR("HW_Class");
  v15[1] = v12;
  v15[2] = &unk_24CBCE7D0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBBridgeAssetsManager _beginPullingAssetsForDeviceAttributes:completion:](self, "_beginPullingAssetsForDeviceAttributes:completion:", v13, v10);
}

- (void)beginPullingAssetsForDevice:(id)a3 completion:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[3];
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BE6B3B0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "valueForProperty:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[PBBridgeWatchAttributeController materialFromDevice:](PBBridgeWatchAttributeController, "materialFromDevice:", v8);
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x24BE6B2E8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (MGGetBoolAnswer() && v11)
  {
    pbb_mobileasset_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[PBBridgeAssetsManager beginPullingAssetsForDevice:completion:]";
      _os_log_impl(&dword_2113B6000, v12, OS_LOG_TYPE_DEFAULT, "%s using NRDevicePropertyArtworkTraits to get PBBDeviceSize", buf, 0xCu);
    }

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ArtworkDeviceSubType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unsignedIntegerValue");

    v14 = PBVariantSizeForArtworkDeviceSubType();
  }
  else
  {
    pbb_bridge_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[PBBridgeAssetsManager beginPullingAssetsForDevice:completion:]";
      _os_log_impl(&dword_2113B6000, v15, OS_LOG_TYPE_DEFAULT, "%s using NRDevicePropertyProductType to get PBBDeviceSize", buf, 0xCu);
    }

    v14 = PBVariantSizeForProductType();
  }
  v16 = v14;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10, CFSTR("Material_Type"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  v21[1] = CFSTR("Size_Type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v18;
  v21[2] = CFSTR("HW_Class");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PBBridgeAssetsManager hardwareGenerationForProductType:](self, "hardwareGenerationForProductType:", v9));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBBridgeAssetsManager _beginPullingAssetsForDeviceAttributes:completion:](self, "_beginPullingAssetsForDeviceAttributes:completion:", v20, v7);
}

void __75__PBBridgeAssetsManager__beginPullingAssetsForDeviceAttributes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pbb_mobileasset_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v10 = a2;
    _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "Got the metadata download reply: %ld", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__PBBridgeAssetsManager__beginPullingAssetsForDeviceAttributes_completion___block_invoke_188;
  v7[3] = &unk_24CBBE390;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  dispatch_async(v5, v7);

}

void __75__PBBridgeAssetsManager__beginPullingAssetsForDeviceAttributes_completion___block_invoke_188(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "deviceAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_assetQueryForDeviceAttributes:deviceAttributes:", 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__PBBridgeAssetsManager__beginPullingAssetsForDeviceAttributes_completion___block_invoke_2;
  v9[3] = &unk_24CBBE368;
  v9[4] = v8;
  objc_msgSend(v8, "_runAssetQuery:completion:", v7, v9);

}

void __75__PBBridgeAssetsManager__beginPullingAssetsForDeviceAttributes_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    pbb_mobileasset_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "Atlas Asset: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_downloadAtlasAsset:", v4);
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }

}

- (void)_runAssetQuery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  PBBridgeAssetsManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[PBBridgeAssetsManager serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__PBBridgeAssetsManager__runAssetQuery_completion___block_invoke;
  block[3] = &unk_24CBBE430;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __51__PBBridgeAssetsManager__runAssetQuery_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__PBBridgeAssetsManager__runAssetQuery_completion___block_invoke_2;
  v3[3] = &unk_24CBBE408;
  v2 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "queryMetaData:", v3);

}

void __51__PBBridgeAssetsManager__runAssetQuery_completion___block_invoke_2(id *a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  uint64_t v8;

  objc_msgSend(a1[4], "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__PBBridgeAssetsManager__runAssetQuery_completion___block_invoke_3;
  block[3] = &unk_24CBBE3E0;
  v8 = a2;
  v7 = a1[6];
  v6 = a1[5];
  dispatch_async(v4, block);

}

void __51__PBBridgeAssetsManager__runAssetQuery_completion___block_invoke_3(uint64_t a1)
{
  uint64_t *v1;
  NSObject *v2;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = (uint64_t *)(a1 + 48);
  if (*(_QWORD *)(a1 + 48))
  {
    pbb_mobileasset_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __51__PBBridgeAssetsManager__runAssetQuery_completion___block_invoke_3_cold_1(v1, v2);
  }
  else
  {
    if (!*(_QWORD *)(a1 + 40))
      return;
    pbb_mobileasset_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "results");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 134217984;
      v8 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "Single Query returned %lu assets", (uint8_t *)&v7, 0xCu);

    }
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "results");
    v2 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, NSObject *))(v6 + 16))(v6, v2);
  }

}

- (void)_downloadAtlasAsset:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if (v5 == 1)
  {
    *(_QWORD *)v16 = 0;
    if (objc_msgSend(v4, "spaceCheck:", v16))
    {
      -[PBBridgeAssetsManager _startAtlasDownloadAndQueryOnSuccess:](self, "_startAtlasDownloadAndQueryOnSuccess:", v4);
      goto LABEL_13;
    }
    pbb_mobileasset_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PBBridgeAssetsManager _downloadAtlasAsset:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
LABEL_12:

    goto LABEL_13;
  }
  if (v5 != 2)
  {
    pbb_mobileasset_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "Asset Download in Progress...", v16, 2u);
    }
    goto LABEL_12;
  }
  objc_msgSend(v4, "getLocalUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pbb_mobileasset_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v16 = 138412290;
    *(_QWORD *)&v16[4] = v6;
    _os_log_impl(&dword_2113B6000, v7, OS_LOG_TYPE_DEFAULT, "Asset already installed: %@", v16, 0xCu);
  }

  -[PBBridgeAssetsManager _queryForImageAssets:](self, "_queryForImageAssets:", v6);
LABEL_13:

}

- (void)_startAtlasDownloadAndQueryOnSuccess:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setAllowsCellularAccess:", 1);
  objc_msgSend(v5, "setDiscretionary:", 0);
  pbb_mobileasset_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "Starting download on asset: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__PBBridgeAssetsManager__startAtlasDownloadAndQueryOnSuccess___block_invoke;
  v8[3] = &unk_24CBBE480;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v7, "startDownload:then:", v5, v8);

}

void __62__PBBridgeAssetsManager__startAtlasDownloadAndQueryOnSuccess___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__PBBridgeAssetsManager__startAtlasDownloadAndQueryOnSuccess___block_invoke_2;
  block[3] = &unk_24CBBE458;
  v10 = a2;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  dispatch_async(v4, block);

}

void __62__PBBridgeAssetsManager__startAtlasDownloadAndQueryOnSuccess___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 48))
  {
    pbb_mobileasset_log();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __62__PBBridgeAssetsManager__startAtlasDownloadAndQueryOnSuccess___block_invoke_2_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getLocalUrl");
    v1 = objc_claimAutoreleasedReturnValue();
    pbb_mobileasset_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v1;
      _os_log_impl(&dword_2113B6000, v10, OS_LOG_TYPE_DEFAULT, "Local URL data from asset download %@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_queryForImageAssets:", v1);
  }

}

- (void)_queryForImageAssets:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%@"), v6, CFSTR("Atlas.plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithContentsOfFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  pbb_mobileasset_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl(&dword_2113B6000, v9, OS_LOG_TYPE_DEFAULT, "Atlas Pointers: %@", buf, 0xCu);
  }

  -[PBBridgeAssetsManager deviceAttributes](self, "deviceAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeAssetsManager _assetQueries:atlas:](self, "_assetQueries:atlas:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __46__PBBridgeAssetsManager__queryForImageAssets___block_invoke;
  v12[3] = &unk_24CBBE368;
  v12[4] = self;
  -[PBBridgeAssetsManager _runQueries:withCompletion:](self, "_runQueries:withCompletion:", v11, v12);

}

void __46__PBBridgeAssetsManager__queryForImageAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_beginAssetDownloads:", a2);
  }
  else
  {
    pbb_mobileasset_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_2113B6000, v2, OS_LOG_TYPE_DEFAULT, "No assets found after running multiple queries", v3, 2u);
    }

  }
}

- (id)_assetQueries:(id)a3 atlas:(id)a4
{
  id v6;
  id v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[PBBridgeAssetsManager _assetQueryForDeviceAttributes:deviceAttributes:](self, "_assetQueryForDeviceAttributes:deviceAttributes:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ImageAssetPointer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addKeyValuePair:with:", CFSTR("ImageAssetPointer"), v11);
  -[PBBridgeAssetsManager _assetQueryForDeviceAttributes:deviceAttributes:](self, "_assetQueryForDeviceAttributes:deviceAttributes:", 0, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UniqueVideoAssetPointer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addKeyValuePair:with:", CFSTR("UniqueVideoAssetPointer"), v15);
  -[PBBridgeAssetsManager _assetQueryForBridgeLaunchSplash](self, "_assetQueryForBridgeLaunchSplash");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeAssetsManager _assetQueryForFamilySetupImage](self, "_assetQueryForFamilySetupImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeAssetsManager _assetQueryForZeroDayForcedUpdate](self, "_assetQueryForZeroDayForcedUpdate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDBCEB8];
  v23[0] = v8;
  v23[1] = v12;
  v23[2] = v17;
  v23[3] = v16;
  v23[4] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "arrayWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)_runQueries:(id)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD block[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v18 = a4;
  v7 = dispatch_group_create();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12);
        -[PBBridgeAssetsManager concurrentQueue](self, "concurrentQueue");
        v14 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __52__PBBridgeAssetsManager__runQueries_withCompletion___block_invoke;
        block[3] = &unk_24CBBE4A8;
        block[4] = self;
        block[5] = v13;
        dispatch_group_async(v7, v14, block);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  -[PBBridgeAssetsManager serialQueue](self, "serialQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __52__PBBridgeAssetsManager__runQueries_withCompletion___block_invoke_2;
  v19[3] = &unk_24CBBE390;
  v20 = v8;
  v21 = v18;
  v16 = v18;
  v17 = v8;
  dispatch_group_notify(v7, v15, v19);

}

uint64_t __52__PBBridgeAssetsManager__runQueries_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runNextQuery:", *(_QWORD *)(a1 + 40));
}

void __52__PBBridgeAssetsManager__runQueries_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "results", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObjectsFromArray:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }

  pbb_mobileasset_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v2, "count");
    *(_DWORD *)buf = 134217984;
    v16 = v10;
    _os_log_impl(&dword_2113B6000, v9, OS_LOG_TYPE_DEFAULT, "Queries returned %lu assets", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_runNextQuery:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "queryMetaDataSync");
  if (v4)
  {
    v5 = v4;
    pbb_mobileasset_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = v3;
      v9 = 2048;
      v10 = v5;
      _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "Query: %@ failed with result: %ld", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void)_beginAssetDownloads:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  PBBridgeAssetsManager *v18;
  _QWORD block[6];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = dispatch_group_create();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  v8 = MEMORY[0x24BDAC760];
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
        -[PBBridgeAssetsManager concurrentQueue](self, "concurrentQueue");
        v13 = objc_claimAutoreleasedReturnValue();
        block[0] = v8;
        block[1] = 3221225472;
        block[2] = __46__PBBridgeAssetsManager__beginAssetDownloads___block_invoke;
        block[3] = &unk_24CBBE4A8;
        block[4] = v12;
        block[5] = self;
        dispatch_group_async(v5, v13, block);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  -[PBBridgeAssetsManager serialQueue](self, "serialQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __46__PBBridgeAssetsManager__beginAssetDownloads___block_invoke_199;
  v16[3] = &unk_24CBBE4A8;
  v17 = v6;
  v18 = self;
  v15 = v6;
  dispatch_group_notify(v5, v14, v16);

}

void __46__PBBridgeAssetsManager__beginAssetDownloads___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  if (v2 == 1)
  {
    v5 = *(void **)(a1 + 32);
    *(_QWORD *)v14 = 0;
    if (objc_msgSend(v5, "spaceCheck:", v14))
    {
      objc_msgSend(*(id *)(a1 + 40), "_startAssetDownload:", *(_QWORD *)(a1 + 32));
      return;
    }
    pbb_mobileasset_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PBBridgeAssetsManager _downloadAtlasAsset:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    goto LABEL_12;
  }
  if (v2 != 2)
  {
    pbb_mobileasset_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "Atlas Asset Download in Progress...", v14, 2u);
    }
LABEL_12:

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "getLocalFileUrl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pbb_mobileasset_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v14 = 138412290;
    *(_QWORD *)&v14[4] = v3;
    _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "Asset Already Installed! %@", v14, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_linkDownloadedAsset:", *(_QWORD *)(a1 + 32));
}

void __46__PBBridgeAssetsManager__beginAssetDownloads___block_invoke_199(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD v8[5];
  char v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "state") != 2)
        {
          v7 = 0;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__PBBridgeAssetsManager__beginAssetDownloads___block_invoke_2;
  v8[3] = &unk_24CBBE4D0;
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);
}

void __46__PBBridgeAssetsManager__beginAssetDownloads___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = 0;

  }
}

- (void)_startAssetDownload:(id)a3
{
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PBBridgeAssetsManager *v12;
  dispatch_semaphore_t v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setAllowsCellularAccess:", 1);
  objc_msgSend(v5, "setDiscretionary:", 0);
  v6 = dispatch_semaphore_create(0);
  pbb_mobileasset_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_2113B6000, v7, OS_LOG_TYPE_DEFAULT, "Starting download on asset: %@", buf, 0xCu);
  }

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__PBBridgeAssetsManager__startAssetDownload___block_invoke;
  v10[3] = &unk_24CBBE4F8;
  v11 = v4;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v4;
  objc_msgSend(v9, "startDownload:then:", v5, v10);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);

}

void __45__PBBridgeAssetsManager__startAssetDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  id v6;
  int8x16_t v7;
  _QWORD block[4];
  int8x16_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    pbb_mobileasset_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v11 = v5;
      v12 = 2048;
      v13 = a2;
      _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "Download for asset: %@ was not successful with result: %lu", buf, 0x16u);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__PBBridgeAssetsManager__startAssetDownload___block_invoke_200;
  block[3] = &unk_24CBBE4A8;
  v7 = *(int8x16_t *)(a1 + 32);
  v6 = (id)v7.i64[0];
  v9 = vextq_s8(v7, v7, 8uLL);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

uint64_t __45__PBBridgeAssetsManager__startAssetDownload___block_invoke_200(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_linkDownloadedAsset:", *(_QWORD *)(a1 + 40));
}

- (void)_linkDownloadedAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id obj;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshState");
  if (objc_msgSend(v3, "state") == 2)
  {
    v20 = v3;
    objc_msgSend(v3, "getLocalFileUrl");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v5, &v32);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v32;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v6;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v24)
    {
      v23 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count"))
          {
            v11 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v10, "firstObject");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "stringWithFormat:", CFSTR("%@/%@/"), v12, CFSTR("BridgeAssets"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = v7;
            objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v27);
            v14 = v27;

            v15 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v22, "path");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringWithFormat:", CFSTR("%@/%@"), v16, v9);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v13, v9);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v14;
            objc_msgSend(v4, "removeItemAtPath:error:", v18, &v26);
            v19 = v26;

            v25 = v19;
            objc_msgSend(v4, "createSymbolicLinkAtPath:withDestinationPath:error:", v18, v17, &v25);
            v7 = v25;

          }
        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v24);
    }

    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_2);
    v3 = v20;
  }

}

void __46__PBBridgeAssetsManager__linkDownloadedAsset___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("PBBridgeMobileAssetsChangedNotification"), 0);

}

- (void)purgeAllAssetsLocalOnly:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", CFSTR("com.apple.MobileAsset.BridgeAssets"));
  pbb_mobileasset_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = 342;
    v7 = 2080;
    v8 = "-[PBBridgeAssetsManager purgeAllAssetsLocalOnly:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v6, 0x12u);
  }

  -[PBBridgeAssetsManager _runAssetQuery:completion:](self, "_runAssetQuery:completion:", v4, &__block_literal_global_206);
}

void __49__PBBridgeAssetsManager_purgeAllAssetsLocalOnly___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  NSLog(CFSTR("%d %s assets %@"), 345, "-[PBBridgeAssetsManager purgeAllAssetsLocalOnly:]_block_invoke", v2);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "state") == 4)
        {
          v11[0] = v7;
          v11[1] = 3221225472;
          v11[2] = __49__PBBridgeAssetsManager_purgeAllAssetsLocalOnly___block_invoke_2;
          v11[3] = &unk_24CBBE580;
          v11[4] = v9;
          objc_msgSend(v9, "cancelDownload:", v11);
        }
        else
        {
          v10[0] = v7;
          v10[1] = 3221225472;
          v10[2] = __49__PBBridgeAssetsManager_purgeAllAssetsLocalOnly___block_invoke_209;
          v10[3] = &unk_24CBBE580;
          v10[4] = v9;
          objc_msgSend(v9, "purge:", v10);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

void __49__PBBridgeAssetsManager_purgeAllAssetsLocalOnly___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pbb_mobileasset_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6[0] = 67109890;
    v6[1] = 351;
    v7 = 2080;
    v8 = "-[PBBridgeAssetsManager purgeAllAssetsLocalOnly:]_block_invoke_2";
    v9 = 2112;
    v10 = v5;
    v11 = 2048;
    v12 = a2;
    _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "%d %s CANCEL DOWNLOAD! %@ // %ld", (uint8_t *)v6, 0x26u);
  }

}

void __49__PBBridgeAssetsManager_purgeAllAssetsLocalOnly___block_invoke_209(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pbb_mobileasset_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6[0] = 67109890;
    v6[1] = 355;
    v7 = 2080;
    v8 = "-[PBBridgeAssetsManager purgeAllAssetsLocalOnly:]_block_invoke";
    v9 = 2112;
    v10 = v5;
    v11 = 2048;
    v12 = a2;
    _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "%d %s PURGE ASSET! %@ // %ld", (uint8_t *)v6, 0x26u);
  }

}

- (unint64_t)hardwareGenerationForProductType:(id)a3
{
  return 1;
}

- (id)_assetQueryForBridgeLaunchSplash
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", CFSTR("com.apple.MobileAsset.BridgeAssets"));
  objc_msgSend(&unk_24CBCE7E8, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addKeyValuePair:with:", CFSTR("Asset_Type"), v3);

  return v2;
}

- (id)_assetQueryForFamilySetupImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", CFSTR("com.apple.MobileAsset.BridgeAssets"));
  objc_msgSend(&unk_24CBCE800, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addKeyValuePair:with:", CFSTR("Asset_Type"), v3);

  return v2;
}

- (id)_assetQueryForZeroDayForcedUpdate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", CFSTR("com.apple.MobileAsset.BridgeAssets"));
  objc_msgSend(&unk_24CBCE818, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addKeyValuePair:with:", CFSTR("Asset_Type"), v3);

  return v2;
}

- (id)_assetQueryForDeviceAttributes:(unint64_t)a3 deviceAttributes:(id)a4
{
  id v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", CFSTR("com.apple.MobileAsset.BridgeAssets"));
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addKeyValuePair:with:", CFSTR("Asset_Type"), v8);

    if (v5)
    {
      if (a3 == 1)
      {
        v9 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Material_Type"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@"), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "addKeyValuePair:with:", CFSTR("Material_Type"), v11);
      }
      goto LABEL_6;
    }
  }
  else if (v5)
  {
LABEL_6:
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HW_Class"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addKeyValuePair:with:", CFSTR("HW_Class"), v14);
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Size_Type"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addKeyValuePair:with:", CFSTR("Size_Type"), v17);
  }
  v18 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scale");
  objc_msgSend(v18, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addKeyValuePair:with:", CFSTR("Resolution_Scale"), v21);

  objc_msgSend(v6, "addKeyValuePair:with:", CFSTR("Version_Number"), CFSTR("1"));
  return v6;
}

- (id)assetDownloadCompletion
{
  return self->_assetDownloadCompletion;
}

- (void)setAssetDownloadCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)allAssetsDownloadCompletion
{
  return self->_allAssetsDownloadCompletion;
}

- (void)setAllAssetsDownloadCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)deviceAttributes
{
  return self->_deviceAttributes;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (OS_dispatch_queue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (void)setConcurrentQueue:(id)a3
{
  objc_storeStrong((id *)&self->_concurrentQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_deviceAttributes, 0);
  objc_storeStrong(&self->_allAssetsDownloadCompletion, 0);
  objc_storeStrong(&self->_assetDownloadCompletion, 0);
}

void __51__PBBridgeAssetsManager__runAssetQuery_completion___block_invoke_3_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_2113B6000, a2, OS_LOG_TYPE_ERROR, "Query error with MAQueryResult: %ld", (uint8_t *)&v3, 0xCu);
}

- (void)_downloadAtlasAsset:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2113B6000, a1, a3, "We didn't have enough Disk Space to download asset!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __62__PBBridgeAssetsManager__startAtlasDownloadAndQueryOnSuccess___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2113B6000, a1, a3, "Download failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
