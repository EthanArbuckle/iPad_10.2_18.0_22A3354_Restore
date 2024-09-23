@implementation PKPaymentHeroImageManifest

+ (BOOL)manifestFileExistsForRegion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a1, "manifestFileForRegion:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  return v6;
}

+ (id)manifestFileForRegion:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = a3;
  PKPassAssetDownloadCachePath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hero_image_manifest_%@.json"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPathComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)removeManifestFileForRegion:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a1, "manifestFileForRegion:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeItemAtPath:error:", v7, 0);

  }
}

- (PKPaymentHeroImageManifest)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentHeroImageManifest *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  PKPaymentHeroImage *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  PKPaymentHeroImage *v22;
  void *v23;
  PKPaymentHeroImage *v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  uint64_t v28;
  NSDictionary *images;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PKPaymentHeroImageManifest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("cards"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v6)
    {
      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("cards"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v32 != v11)
              objc_enumerationMutation(v8);
            v13 = -[PKPaymentHeroImage initWithDictionary:]([PKPaymentHeroImage alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
            -[PKPaymentHeroImage identifier](v13, "identifier");
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = (void *)v14;
            if (v13)
              v16 = v14 == 0;
            else
              v16 = 1;
            if (!v16)
              objc_msgSend(v7, "setValue:forKey:", v13, v14);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v10);
      }
    }
    else
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v8 = v4;
      v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v36 != v19)
              objc_enumerationMutation(v8);
            v21 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
            v22 = [PKPaymentHeroImage alloc];
            objc_msgSend(v8, "PKDictionaryForKey:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[PKPaymentHeroImage initWithLegacyDictionary:identifier:](v22, "initWithLegacyDictionary:identifier:", v23, v21);

            -[PKPaymentHeroImage identifier](v24, "identifier");
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = (void *)v25;
            if (v24)
              v27 = v25 == 0;
            else
              v27 = 1;
            if (!v27)
              objc_msgSend(v7, "setValue:forKey:", v24, v25);

          }
          v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v18);
      }
    }

    v28 = objc_msgSend(v7, "copy");
    images = v5->_images;
    v5->_images = (NSDictionary *)v28;

  }
  return v5;
}

+ (id)manifestForRegion:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  PKPaymentHeroImageManifest *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  NSObject *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "manifestFileForRegion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, &v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v16;
      v12 = v11;
      if (v10 && !v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v13 = -[PKPaymentHeroImageManifest initWithDictionary:]([PKPaymentHeroImageManifest alloc], "initWithDictionary:", v10);
      }
      else
      {
        PKLogFacilityTypeGetObject(6uLL);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v12;
          v19 = 2112;
          v20 = v4;
          _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Unable to parse hero manifest (%@) for region %@", buf, 0x16u);
        }

        v13 = 0;
      }

    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Unable to read hero manifest file for region %@", buf, 0xCu);
      }
      v13 = 0;
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Unable to find hero manifest file for region %@", buf, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

+ (void)downloadManifestForRegion:(id)a3 url:(id)a4 fileDownloader:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v10 = a3;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__PKPaymentHeroImageManifest_downloadManifestForRegion_url_fileDownloader_completion___block_invoke;
  v14[3] = &unk_1E2AC7120;
  v16 = v11;
  v17 = a1;
  v15 = v10;
  v12 = v10;
  v13 = v11;
  objc_msgSend(a5, "downloadFromUrl:completionHandler:", a4, v14);

}

void __86__PKPaymentHeroImageManifest_downloadManifestForRegion_url_fileDownloader_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  PKPaymentHeroImageManifest *v13;
  PKPaymentHeroImageManifest *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    PKLogFacilityTypeGetObject(6uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v10;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Failed downloading hero manifest %@", buf, 0xCu);
    }

    v17 = *(_QWORD *)(a1 + 40);
    if (v17)
      (*(void (**)(uint64_t, void *, _QWORD))(v17 + 16))(v17, v10, 0);
  }
  else
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v20;
    v10 = v12;
    if (v11
      && !v12
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (v13 = -[PKPaymentHeroImageManifest initWithDictionary:]([PKPaymentHeroImageManifest alloc], "initWithDictionary:", v11)) != 0)
    {
      v14 = v13;
      objc_msgSend(*(id *)(a1 + 48), "saveManifestDataToDeviceForRegion:data:", *(_QWORD *)(a1 + 32), v7);
      v15 = *(_QWORD *)(a1 + 40);
      if (v15)
        (*(void (**)(uint64_t, _QWORD, PKPaymentHeroImageManifest *))(v15 + 16))(v15, 0, v14);
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v10;
        _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Unable to parse hero manifest %@", buf, 0xCu);
      }

      v19 = *(_QWORD *)(a1 + 40);
      if (v19)
        (*(void (**)(uint64_t, void *, _QWORD))(v19 + 16))(v19, v10, 0);
      v14 = 0;
    }

  }
}

+ (void)saveManifestDataToDeviceForRegion:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKPassAssetDownloadCachePath();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v13 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v17);
    v14 = v17;

    if ((v13 & 1) == 0 && v14)
    {
      PKLogFacilityTypeGetObject(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v8;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Could not create download cache at %@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(a1, "manifestFileForRegion:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeToURL:atomically:", v16, 1);

}

- (NSDictionary)images
{
  return self->_images;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);
}

@end
