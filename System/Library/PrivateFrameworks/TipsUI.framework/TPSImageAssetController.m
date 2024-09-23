@implementation TPSImageAssetController

uint64_t __52__TPSImageAssetController_defaultInMemoryImageCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)defaultInMemoryImageCache_gInMemoryImageCache;
  defaultInMemoryImageCache_gInMemoryImageCache = (uint64_t)v0;

  return objc_msgSend((id)defaultInMemoryImageCache_gInMemoryImageCache, "setTotalCostLimit:", 31457280);
}

uint64_t __86__TPSImageAssetController_formattedDataForPath_identifier_priority_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t result;

  objc_msgSend(MEMORY[0x24BEB7DC0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldIgnoreInMemoryCaching");

  if ((v3 & 1) == 0)
    +[TPSImageAssetController addInMemoryCacheForImage:identifier:cost:](TPSImageAssetController, "addInMemoryCacheForImage:identifier:cost:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 200);
  result = *(_QWORD *)(a1 + 80);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  return result;
}

void __86__TPSImageAssetController_formattedDataForPath_identifier_priority_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;

  v2 = objc_alloc(MEMORY[0x24BEBD640]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithContentsOfFile:", v3);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __86__TPSImageAssetController_formattedDataForPath_identifier_priority_completionHandler___block_invoke_3;
  v6[3] = &unk_24C5DDC90;
  v7 = v4;
  v8 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 80);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v14 = *(_BYTE *)(a1 + 88);
  v11 = *(id *)(a1 + 64);
  v12 = *(id *)(a1 + 72);
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __86__TPSImageAssetController_formattedDataForPath_identifier_priority_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = v14;
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __86__TPSImageAssetController_formattedDataForPath_identifier_priority_completionHandler___block_invoke_2;
    v21[3] = &unk_24C5DDC90;
    v22 = v18;
    v23 = *(id *)(a1 + 32);
    v28 = *(id *)(a1 + 40);
    v24 = v13;
    v25 = v15;
    v29 = a5;
    v26 = v16;
    v27 = v17;
    dispatch_async(v19, v21);

  }
  else
  {
    v20 = *(_QWORD *)(a1 + 40);
    if (v20)
      (*(void (**)(uint64_t, id, _QWORD, id, uint64_t, id, id))(v20 + 16))(v20, v13, 0, v15, a5, v16, v17);
  }

}

+ (id)imageFromMemoryCacheForIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[TPSImageAssetController defaultInMemoryImageCache](TPSImageAssetController, "defaultInMemoryImageCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)formattedDataForPath:(id)a3 identifier:(id)a4 priority:(float)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  double v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v9 = a4;
  v10 = a6;
  v11 = (void *)MEMORY[0x24BEB7CF8];
  v12 = a3;
  objc_msgSend(v11, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __86__TPSImageAssetController_formattedDataForPath_identifier_priority_completionHandler___block_invoke;
  v19[3] = &unk_24C5DDCB8;
  v20 = v9;
  v21 = v10;
  v14 = v10;
  v15 = v9;
  *(float *)&v16 = a5;
  objc_msgSend(v13, "formattedDataForPath:identifier:attributionIdentifier:priority:completionHandler:", v12, v15, 0, v19, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)dataCacheForIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BEB7CF8];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataCacheForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)addInMemoryCacheForImage:(id)a3 identifier:(id)a4 cost:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (v10)
  {
    +[TPSImageAssetController defaultInMemoryImageCache](TPSImageAssetController, "defaultInMemoryImageCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a5)
      objc_msgSend(v8, "setObject:forKey:cost:", v10, v7, a5);
    else
      objc_msgSend(v8, "setObject:forKey:", v10, v7);

  }
}

+ (id)defaultInMemoryImageCache
{
  if (defaultInMemoryImageCache_predicate[0] != -1)
    dispatch_once(defaultInMemoryImageCache_predicate, &__block_literal_global_0);
  return (id)defaultInMemoryImageCache_gInMemoryImageCache;
}

+ (void)removeInMemoryCache
{
  id v2;

  +[TPSImageAssetController defaultInMemoryImageCache](TPSImageAssetController, "defaultInMemoryImageCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

+ (id)getImageForIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = a3;
  +[TPSImageAssetController imageFromMemoryCacheForIdentifier:](TPSImageAssetController, "imageFromMemoryCacheForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEB7CF8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataCacheForIdentifier:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEB7CF8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cacheFileURLForDataCache:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x24BEBD640]);
      objc_msgSend(v8, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v9, "initWithContentsOfFile:", v10);

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

@end
