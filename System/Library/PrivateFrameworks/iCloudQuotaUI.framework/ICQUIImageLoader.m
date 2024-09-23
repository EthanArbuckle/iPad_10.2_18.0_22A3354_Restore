@implementation ICQUIImageLoader

+ (void)loadImageWithURL:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v6 = a4;
  objc_msgSend(a1, "_scaledImageURL:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:cachePolicy:timeoutInterval:", v7, 0, 30.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1800], "sharedURLCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setURLCache:", v10);

  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __48__ICQUIImageLoader_loadImageWithURL_completion___block_invoke;
  v16[3] = &unk_24E3F3E60;
  v17 = v11;
  v18 = v8;
  v19 = v6;
  v12 = v6;
  v13 = v8;
  v14 = v11;
  objc_msgSend(v14, "dataTaskWithRequest:completionHandler:", v13, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resume");

}

void __48__ICQUIImageLoader_loadImageWithURL_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "Successfully retrieved image for async image view", v15, 2u);
    }

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1498]), "initWithResponse:data:", v8, v7);
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "storeCachedResponse:forRequest:", v12, *(_QWORD *)(a1 + 40));

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __48__ICQUIImageLoader_loadImageWithURL_completion___block_invoke_cold_1(v9, v11);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

+ (void)fetchIconFromIconSpecification:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(v6, "imageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ICQUIHelperFunctions highestScreenScale](_ICQUIHelperFunctions, "highestScreenScale");
  v11 = objc_msgSend(a1, "_hasURLForScale:inImageURL:", v8);
  if (v10 || v9 || v11)
  {
    objc_msgSend(v6, "assetID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fetchIconForAssetID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      _ICQGetLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v9;
        _os_log_impl(&dword_21F2CC000, v14, OS_LOG_TYPE_DEFAULT, "Fetched icon from assets catalog for asset ID %@", (uint8_t *)&v18, 0xCu);
      }

      v7[2](v7, v13);
    }
    else
    {
      objc_msgSend(a1, "fetchIconForBundleID:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _ICQGetLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v17)
        {
          v18 = 138412290;
          v19 = v10;
          _os_log_impl(&dword_21F2CC000, v16, OS_LOG_TYPE_DEFAULT, "Fetched icon from IconServices for bundleID %@", (uint8_t *)&v18, 0xCu);
        }

        v7[2](v7, v15);
      }
      else
      {
        if (v17)
        {
          v18 = 138412290;
          v19 = v8;
          _os_log_impl(&dword_21F2CC000, v16, OS_LOG_TYPE_DEFAULT, "Fetching remote icon asset from URL %@", (uint8_t *)&v18, 0xCu);
        }

        objc_msgSend(a1, "fetchIconFromImageURL:completion:", v8, v7);
      }

    }
  }
  else
  {
    v7[2](v7, 0);
  }

}

+ (id)fetchIconForAssetID:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BEBD640], "icqBundleImageNamed:");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchIconForBundleID:(id)a3
{
  if (!a3)
    return 0;
  +[_ICQUIHelperFunctions appIconWithSize:forBundleID:](_ICQUIHelperFunctions, "appIconWithSize:forBundleID:", 120.0, 120.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)fetchIconFromImageURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__ICQUIImageLoader_fetchIconFromImageURL_completion___block_invoke;
  v7[3] = &unk_24E3F3EB0;
  v8 = v5;
  v6 = v5;
  +[ICQUIImageLoader loadImageWithURL:completion:](ICQUIImageLoader, "loadImageWithURL:completion:", a3, v7);

}

void __53__ICQUIImageLoader_fetchIconFromImageURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__ICQUIImageLoader_fetchIconFromImageURL_completion___block_invoke_2;
  v5[3] = &unk_24E3F3E88;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __53__ICQUIImageLoader_fetchIconFromImageURL_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

+ (id)_scaledImageURL:(id)a3
{
  id v3;
  double v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  +[_ICQUIHelperFunctions highestScreenScale](_ICQUIHelperFunctions, "highestScreenScale");
  if ((int)v4 < 3)
  {
    if ((int)v4 == 2)
      objc_msgSend(v3, "URL2x");
    else
      objc_msgSend(v3, "URL1x");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "URL3x");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

+ (BOOL)_hasURLForScale:(double)a3 inImageURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v5 = a4;
  v6 = v5;
  if (a3 == 1.0)
  {
    objc_msgSend(v5, "URL1x");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 2.0)
  {
    objc_msgSend(v5, "URL2x");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 3.0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v5, "URL3x");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7 != 0;

LABEL_8:
  return v8;
}

void __48__ICQUIImageLoader_loadImageWithURL_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "Error retrieving image from url: %@", (uint8_t *)&v4, 0xCu);

}

@end
