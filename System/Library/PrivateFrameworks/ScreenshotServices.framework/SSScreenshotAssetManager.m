@implementation SSScreenshotAssetManager

+ (id)sharedAssetManager
{
  void *v2;
  SSScreenshotAssetManager *v3;
  void *v4;

  v2 = (void *)_sharedAssetManager;
  if (!_sharedAssetManager)
  {
    v3 = objc_alloc_init(SSScreenshotAssetManager);
    v4 = (void *)_sharedAssetManager;
    _sharedAssetManager = (uint64_t)v3;

    objc_msgSend((id)_sharedAssetManager, "resetBackend");
    v2 = (void *)_sharedAssetManager;
  }
  return v2;
}

- (void)setBackend:(id)a3
{
  objc_storeStrong((id *)&self->_backend, a3);
}

- (id)backend
{
  return self->_backend;
}

- (void)resetBackend
{
  SSScreenshotAssetManagerPhotoLibraryBackend *v3;
  SSScreenshotAssetManagerBackend *backend;

  v3 = objc_alloc_init(SSScreenshotAssetManagerPhotoLibraryBackend);
  backend = self->_backend;
  self->_backend = (SSScreenshotAssetManagerBackend *)v3;

}

- (void)registerImageForPersistable:(id)a3 options:(id)a4 withRegistrationBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SSScreenshotAssetManager backend](self, "backend");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __86__SSScreenshotAssetManager_registerImageForPersistable_options_withRegistrationBlock___block_invoke;
  v13[3] = &unk_24D06C100;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "registerEntryWithImage:options:identifierHandler:", v10, v9, v13);

}

uint64_t __86__SSScreenshotAssetManager_registerImageForPersistable_options_withRegistrationBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a3 == 0, a2);
  return result;
}

- (void)imageWithPreviouslyRegisteredIdentifier:(id)a3 withAccessBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[SSScreenshotAssetManager backend](self, "backend");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __84__SSScreenshotAssetManager_imageWithPreviouslyRegisteredIdentifier_withAccessBlock___block_invoke;
  v10[3] = &unk_24D06C128;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "imageForPreviouslyRegisteredIdentifier:imageHandler:", v7, v10);

}

uint64_t __84__SSScreenshotAssetManager_imageWithPreviouslyRegisteredIdentifier_withAccessBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)recordEditsToPersistable:(id)a3 inTransition:(BOOL)a4 withCompletionBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SSScreenshotAssetManager *v14;
  id v15;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __86__SSScreenshotAssetManager_recordEditsToPersistable_inTransition_withCompletionBlock___block_invoke;
  v12[3] = &unk_24D06C178;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(v11, "requestImageInTransition:withBlock:", v6, v12);

}

void __86__SSScreenshotAssetManager_recordEditsToPersistable_inTransition_withCompletionBlock___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1[4], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_213892000, v4, OS_LOG_TYPE_INFO, "Finished getting output image for %@.  Preparing to call update image on the backend", buf, 0xCu);

  }
  objc_msgSend(a1[5], "backend");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "imageModificationData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "registrationOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "imageDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__SSScreenshotAssetManager_recordEditsToPersistable_inTransition_withCompletionBlock___block_invoke_10;
  v11[3] = &unk_24D06C150;
  v12 = a1[6];
  objc_msgSend(v6, "updateImageData:withModificationData:forEntryWithIdentifier:registrationOptions:imageDescription:completionHandler:", v3, v7, v8, v9, v10, v11);

}

uint64_t __86__SSScreenshotAssetManager_recordEditsToPersistable_inTransition_withCompletionBlock___block_invoke_10(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)recordPersistableToTemporaryLocation:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __85__SSScreenshotAssetManager_recordPersistableToTemporaryLocation_withCompletionBlock___block_invoke;
  v10[3] = &unk_24D06C178;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v9, "requestImageInTransition:withBlock:", 0, v10);

}

void __85__SSScreenshotAssetManager_recordPersistableToTemporaryLocation_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "backend");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "imageDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __85__SSScreenshotAssetManager_recordPersistableToTemporaryLocation_withCompletionBlock___block_invoke_2;
  v9[3] = &unk_24D06C1A0;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v5, "saveImageToTemporaryLocation:withName:imageDescription:completionHandler:", v6, v7, v8, v9);

}

uint64_t __85__SSScreenshotAssetManager_recordPersistableToTemporaryLocation_withCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a3 == 0, a2);
  return result;
}

- (void)removePersistable:(id)a3 deleteOptions:(unint64_t)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v9 = a5;
  if (a4 - 1 <= 1)
    objc_msgSend(v8, "removePDF");
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    -[SSScreenshotAssetManager backend](self, "backend");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __80__SSScreenshotAssetManager_removePersistable_deleteOptions_withCompletionBlock___block_invoke;
    v12[3] = &unk_24D06C150;
    v13 = v9;
    objc_msgSend(v10, "removeEntryWithIdentifier:completionHandler:", v11, v12);

  }
}

uint64_t __80__SSScreenshotAssetManager_removePersistable_deleteOptions_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)recordEditsToPersistableForPDF:(id)a3 withCompletionBlock:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__SSScreenshotAssetManager_recordEditsToPersistableForPDF_withCompletionBlock___block_invoke;
  v7[3] = &unk_24D06BA10;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "savePDFWithBlock:", v7);

}

uint64_t __79__SSScreenshotAssetManager_recordEditsToPersistableForPDF_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backend, 0);
}

@end
