@implementation SSScreenshotAssetManagerPhotoLibraryBackend

- (id)photoLibrary
{
  SSScreenshotAssetManagerPhotoLibraryBackend *v2;
  PHPhotoLibrary *photoLibrary;
  id v4;
  void *v5;
  uint64_t v6;
  PHPhotoLibrary *v7;
  PHPhotoLibrary *v8;

  v2 = self;
  objc_sync_enter(v2);
  photoLibrary = v2->_photoLibrary;
  if (!photoLibrary)
  {
    v4 = objc_alloc(MEMORY[0x24BDE35F0]);
    objc_msgSend(MEMORY[0x24BDE35F0], "systemPhotoLibraryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithPhotoLibraryURL:", v5);
    v7 = v2->_photoLibrary;
    v2->_photoLibrary = (PHPhotoLibrary *)v6;

    photoLibrary = v2->_photoLibrary;
  }
  v8 = photoLibrary;
  objc_sync_exit(v2);

  return v8;
}

- (id)_ARKitImageDataFromImage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDD9670];
  v9 = *MEMORY[0x24BDB1910];
  v10 = MEMORY[0x24BDBD1C8];
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "imageDataFromImage:withProperties:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)imageDataFromImage:(id)a3 withProperties:(id)a4
{
  id v5;
  const __CFDictionary *v6;
  id v7;
  uint64_t v8;
  CGImage *v9;
  __CFData *v10;
  CGImageDestination *v11;
  CGImageDestination *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;

  v5 = a3;
  v6 = (const __CFDictionary *)a4;
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "CGImage");
  if (v8)
  {
    v9 = (CGImage *)v8;
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v10 = (__CFData *)objc_claimAutoreleasedReturnValue();
    v11 = CGImageDestinationCreateWithData(v10, CFSTR("public.jpeg"), 1uLL, 0);
    if (v11)
    {
      v12 = v11;
      CGImageDestinationAddImage(v11, v9, v6);
      if (!CGImageDestinationFinalize(v12))
      {
        v13 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          +[SSScreenshotAssetManagerPhotoLibraryBackend imageDataFromImage:withProperties:].cold.3(v7);

        v10 = 0;
      }
      CFRelease(v12);
    }
    else
    {
      v15 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[SSScreenshotAssetManagerPhotoLibraryBackend imageDataFromImage:withProperties:].cold.2(v7);

    }
  }
  else
  {
    v14 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[SSScreenshotAssetManagerPhotoLibraryBackend imageDataFromImage:withProperties:].cold.1(v7);

    v10 = 0;
  }

  return v10;
}

+ (id)_gameHighlightsImageDataFromImageData:(id)a3 withOptions:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDF6AC8];
  v6 = a4;
  objc_msgSend(v5, "imageWithData:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_gameHighlightsImageDataFromImage:withOptions:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_gameHighlightsImageDataFromImage:(id)a3 withOptions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "assetMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" | "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *MEMORY[0x24BDD96F8];
  v16[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BDD96E8];
  v14 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "imageDataFromImage:withProperties:", v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)registerEntryWithImage:(id)a3 options:(id)a4 identifierHandler:(id)a5
{
  -[SSScreenshotAssetManagerPhotoLibraryBackend _registerEntryWithImage:options:retry:identifierHandler:](self, "_registerEntryWithImage:options:retry:identifierHandler:", a3, a4, 1, a5);
}

- (void)_registerEntryWithImage:(id)a3 options:(id)a4 retry:(BOOL)a5 identifierHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  BOOL v25;
  _QWORD v26[4];
  id v27;
  id v28;
  SSScreenshotAssetManagerPhotoLibraryBackend *v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v7 = a5;
  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__0;
  v31[4] = __Block_byref_object_dispose__0;
  v32 = 0;
  v13 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v34 = v14;
    v35 = 1024;
    v36 = v7;
    _os_log_impl(&dword_213892000, v13, OS_LOG_TYPE_INFO, "Saving screenshot with image %@ to the photo library (retry:%d)", buf, 0x12u);

  }
  -[SSScreenshotAssetManagerPhotoLibraryBackend photoLibrary](self, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke;
  v26[3] = &unk_24D06BC28;
  v27 = v11;
  v28 = v10;
  v29 = self;
  v30 = v31;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_35;
  v20[3] = &unk_24D06BC50;
  v25 = v7;
  v20[4] = self;
  v17 = v28;
  v21 = v17;
  v18 = v27;
  v22 = v18;
  v19 = v12;
  v23 = v19;
  v24 = v31;
  objc_msgSend(v15, "performChanges:completionHandler:", v26, v20);

  _Block_object_dispose(v31, 8);
}

void __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _BOOL8 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "saveLocation");
  if (v2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "saveLocation") == 2)
    {
      objc_msgSend((id)objc_opt_class(), "_gameHighlightsImageDataFromImage:withOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
        goto LABEL_13;
      v4 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_cold_2((id *)(a1 + 40));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "_ARKitImageDataFromImage:", *(_QWORD *)(a1 + 40));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
        goto LABEL_13;
      v4 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_cold_3((id *)(a1 + 40));
    }
  }
  else
  {
    PHImageDataFromImageAsScreenshot();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      goto LABEL_13;
    v4 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_cold_1((id *)(a1 + 40));
  }

  v3 = 0;
LABEL_13:
  v5 = v2 == 0;
  v6 = objc_alloc_init(MEMORY[0x24BDE34B0]);
  objc_msgSend(v6, "setUseRecoverableStagingDirectory:", 1);
  objc_msgSend(v6, "setShouldCreateScreenshot:", v5);
  objc_msgSend(MEMORY[0x24BDE34B8], "creationRequestForAssetFromImageData:options:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (_SSLinksInPhotosEnabled())
  {
    objc_msgSend(*(id *)(a1 + 32), "applicationBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImportedByBundleIdentifier:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "assetDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssetDescription:", v9);

  objc_msgSend(v7, "placeholderForCreatedAsset");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

void __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_35(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 == (void *)*MEMORY[0x24BDD0B88])
    {
      v8 = objc_msgSend(v5, "code");

      if (v8 == 4099)
      {
        objc_msgSend(*(id *)(a1 + 32), "_registerEntryWithImage:options:retry:identifierHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
        goto LABEL_12;
      }
    }
    else
    {

    }
  }
  v9 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_35_cold_1(v5);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "localIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_213892000, v10, OS_LOG_TYPE_INFO, "Created asset in photos with identifier %@", (uint8_t *)&v14, 0xCu);

  }
  v12 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "localIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v13, v5);

LABEL_12:
}

- (void)imageForPreviouslyRegisteredIdentifier:(id)a3 imageHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDE3488];
  v23[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSScreenshotAssetManagerPhotoLibraryBackend photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAssetsWithLocalIdentifiers:options:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x24BDE3800];
  v15 = *(double *)(MEMORY[0x24BDE3800] + 8);
  v16 = objc_alloc_init(MEMORY[0x24BDE3598]);
  objc_msgSend(v16, "setSynchronous:", 1);
  objc_msgSend(v16, "setResizeMode:", 0);
  objc_msgSend(v16, "setDeliveryMode:", 1);
  objc_msgSend(MEMORY[0x24BDE3590], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __99__SSScreenshotAssetManagerPhotoLibraryBackend_imageForPreviouslyRegisteredIdentifier_imageHandler___block_invoke;
  v20[3] = &unk_24D06BC78;
  v21 = v6;
  v22 = v7;
  v18 = v7;
  v19 = v6;
  objc_msgSend(v17, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v13, 0, v16, v20, v14, v15);

}

void __99__SSScreenshotAssetManagerPhotoLibraryBackend_imageForPreviouslyRegisteredIdentifier_imageHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  uint64_t v12;
  void (*v13)(void);
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *MEMORY[0x24BDE37F8];
  v7 = a3;
  objc_msgSend(v7, "valueForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", *MEMORY[0x24BDE3808]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "BOOLValue");
  if (!v8 && (v10 & 1) == 0)
  {
    v11 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v15 = 138412290;
      v16 = v12;
      _os_log_impl(&dword_213892000, v11, OS_LOG_TYPE_INFO, "Retrieved image for identifier %@", (uint8_t *)&v15, 0xCu);
    }

    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_10:
    v13();
    goto LABEL_11;
  }
  if (v8)
  {
    v14 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __99__SSScreenshotAssetManagerPhotoLibraryBackend_imageForPreviouslyRegisteredIdentifier_imageHandler___block_invoke_cold_1(a1, (uint64_t)v8);

    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)updateImageData:(id)a3 withModificationData:(id)a4 forEntryWithIdentifier:(id)a5 registrationOptions:(id)a6 imageDescription:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v33 = v17;
  if (objc_msgSend(v17, "saveLocation") == 2)
  {
    objc_msgSend((id)objc_opt_class(), "_gameHighlightsImageDataFromImageData:withOptions:", v14, v17);
    v20 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v20;
  }
  v21 = (void *)MEMORY[0x24BDE3488];
  v41[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSScreenshotAssetManagerPhotoLibraryBackend photoLibrary](self, "photoLibrary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "librarySpecificFetchOptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fetchAssetsWithLocalIdentifiers:options:", v22, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke;
  v34[3] = &unk_24D06BCF0;
  v35 = v15;
  v36 = v14;
  v37 = v16;
  v38 = v26;
  v39 = v18;
  v40 = v19;
  v27 = v19;
  v28 = v18;
  v29 = v26;
  v30 = v16;
  v31 = v14;
  v32 = v15;
  objc_msgSend(v29, "requestContentEditingInputWithOptions:completionHandler:", 0, v34);

}

void __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE3530]), "initWithContentEditingInput:", v5);
    if (*(_QWORD *)(a1 + 32))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE3480]), "initWithFormatIdentifier:formatVersion:data:", CFSTR("ScreenshotServices"), CFSTR("2.0"), *(_QWORD *)(a1 + 32));
      objc_msgSend(v7, "setAdjustmentData:", v8);

    }
    v9 = *(void **)(a1 + 40);
    objc_msgSend(v7, "renderedContentURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeToURL:atomically:", v10, 1);

    v11 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v24 = v12;
      _os_log_impl(&dword_213892000, v11, OS_LOG_TYPE_INFO, "Found contentEditingInput for identifier %@. Preparing to ask Photos to update photo with update image.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 56), "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke_48;
    v19[3] = &unk_24D06BCA0;
    v20 = *(id *)(a1 + 56);
    v21 = *(id *)(a1 + 64);
    v22 = v7;
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke_2;
    v16[3] = &unk_24D06BCC8;
    v17 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 72);
    v15 = v7;
    objc_msgSend(v13, "performChanges:completionHandler:", v19, v16);

  }
  else
  {
    v15 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke_cold_1(a1, v6);
    v13 = v15;
  }

}

void __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke_48(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDE3490], "changeRequestForAsset:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "length"))
    objc_msgSend(v2, "setAccessibilityDescription:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setContentEditingOutput:", *(_QWORD *)(a1 + 48));

}

void __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_213892000, v7, OS_LOG_TYPE_INFO, "Updated photo for identifier %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    v9 = v6;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke_2_cold_1(a1, (uint64_t)v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)saveImageToTemporaryLocation:(id)a3 withName:(id)a4 imageDescription:(id)a5 completionHandler:(id)a6
{
  UIImage *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t (*v24)(void *, id, CFErrorRef *);
  __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  _Unwind_Exception *v30;
  void (**v31)(id, void *, id);
  UIImage *v32;
  void *v33;
  id v34;
  CFErrorRef err;
  id v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  void *v41;

  v9 = (UIImage *)a3;
  v10 = a4;
  v34 = a5;
  v31 = (void (**)(id, void *, id))a6;
  v32 = v9;
  UIImagePNGRepresentation(v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 1;
  do
  {
    v13 = v10;

    v14 = v13;
    if (v12 != 1)
    {
      v15 = (void *)MEMORY[0x24BDD16F0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringFromNumber:numberStyle:", v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "stringByAppendingString:", CFSTR(" "));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByAppendingString:", v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    NSTemporaryDirectory();
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathExtension:", CFSTR("png"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v19, "stringByAppendingPathComponent:", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = objc_msgSend(v21, "fileExistsAtPath:", v11);

    ++v12;
  }
  while ((v19 & 1) != 0);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v33, "writeToURL:options:error:", v22, 0, &v36);
  v23 = v36;
  if (objc_msgSend(v34, "length"))
  {
    err = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v24 = (uint64_t (*)(void *, id, CFErrorRef *))getMAImageCaptioningSetCaptionSymbolLoc_ptr;
    v41 = getMAImageCaptioningSetCaptionSymbolLoc_ptr;
    if (!getMAImageCaptioningSetCaptionSymbolLoc_ptr)
    {
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __getMAImageCaptioningSetCaptionSymbolLoc_block_invoke;
      v37[3] = &unk_24D06B990;
      v37[4] = &v38;
      __getMAImageCaptioningSetCaptionSymbolLoc_block_invoke((uint64_t)v37);
      v24 = (uint64_t (*)(void *, id, CFErrorRef *))v39[3];
    }
    _Block_object_dispose(&v38, 8);
    if (!v24)
    {
      v30 = (_Unwind_Exception *)-[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:].cold.2();
      _Block_object_dispose(&v38, 8);
      _Unwind_Resume(v30);
    }
    if ((v24(v22, v34, &err) & 1) == 0)
    {
      if (err)
      {
        v25 = (__CFString *)CFErrorCopyDescription(err);
        CFRelease(err);
      }
      else
      {
        v25 = 0;
      }
      v26 = -[__CFString length](v25, "length");
      v27 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      if (v26)
      {
        if (v28)
          -[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:].cold.4();
      }
      else if (v28)
      {
        -[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:].cold.3();
      }

    }
  }
  if (v23)
  {
    v29 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:].cold.1((uint64_t)v22, v23);

  }
  v31[2](v31, v22, v23);

}

- (void)removeEntryWithIdentifier:(id)a3 completionHandler:(id)a4
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
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  SSScreenshotAssetManagerPhotoLibraryBackend *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDE3488];
  v24[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSScreenshotAssetManagerPhotoLibraryBackend photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAssetsWithLocalIdentifiers:options:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __91__SSScreenshotAssetManagerPhotoLibraryBackend_removeEntryWithIdentifier_completionHandler___block_invoke;
  v21[3] = &unk_24D06BBA0;
  v22 = v6;
  v23 = self;
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __91__SSScreenshotAssetManagerPhotoLibraryBackend_removeEntryWithIdentifier_completionHandler___block_invoke_2;
  v18[3] = &unk_24D06BCC8;
  v19 = v22;
  v20 = v7;
  v16 = v7;
  v17 = v22;
  objc_msgSend(v14, "performChanges:completionHandler:", v21, v18);

}

void __91__SSScreenshotAssetManagerPhotoLibraryBackend_removeEntryWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDE3488];
  v7[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchAssetsWithLocalIdentifiers:options:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDE3490], "deleteAssets:", v6);
}

void __91__SSScreenshotAssetManagerPhotoLibraryBackend_removeEntryWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_213892000, v7, OS_LOG_TYPE_INFO, "Removed photo for identifier %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    v9 = v6;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __91__SSScreenshotAssetManagerPhotoLibraryBackend_removeEntryWithIdentifier_completionHandler___block_invoke_2_cold_1(a1, (uint64_t)v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

+ (void)imageDataFromImage:(void *)a1 withProperties:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_213892000, v2, v3, "Unable to get CGImage data for image %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

+ (void)imageDataFromImage:(void *)a1 withProperties:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_213892000, v2, v3, "Unable to get image destination for image %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

+ (void)imageDataFromImage:(void *)a1 withProperties:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_213892000, v2, v3, "Unable to finalize image destination for image %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_213892000, v2, v3, "Unable to get screenshot image data from image %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_cold_2(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_213892000, v2, v3, "Unable to get game highlights image data from image %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_cold_3(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_213892000, v2, v3, "Unable to get ARKit image data from image %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_35_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_213892000, v2, v3, "Could not create asset in Photos with error %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __99__SSScreenshotAssetManagerPhotoLibraryBackend_imageForPreviouslyRegisteredIdentifier_imageHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_6(a1, a2), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_213892000, v3, v4, "Could not get image for identifier %@ with error %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

void __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_213892000, v3, v4, "Could not obtain content editing input for saving updates for identifier %@, info: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

void __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_6(a1, a2), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_213892000, v3, v4, "Could not update photo for identifier %@ with error %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)saveImageToTemporaryLocation:(uint64_t)a1 withName:(void *)a2 imageDescription:completionHandler:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_213892000, v3, v4, "Could not save image to temporary location %@ with error %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (uint64_t)saveImageToTemporaryLocation:withName:imageDescription:completionHandler:.cold.2()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:].cold.3(v0);
}

- (void)saveImageToTemporaryLocation:withName:imageDescription:completionHandler:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_213892000, v0, OS_LOG_TYPE_ERROR, "Could not set image description for a file %@", v1, 0xCu);
}

- (void)saveImageToTemporaryLocation:withName:imageDescription:completionHandler:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_213892000, v1, OS_LOG_TYPE_ERROR, "Could not set image description for a file %@ with error %@", v2, 0x16u);
}

void __91__SSScreenshotAssetManagerPhotoLibraryBackend_removeEntryWithIdentifier_completionHandler___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_6(a1, a2), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_213892000, v3, v4, "Could not remove photo for identifier %@ with error %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

@end
