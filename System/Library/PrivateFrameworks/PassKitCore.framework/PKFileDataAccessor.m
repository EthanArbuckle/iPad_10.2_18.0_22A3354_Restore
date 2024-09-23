@implementation PKFileDataAccessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_explicitDataTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_seids, 0);
  objc_storeStrong((id *)&self->_remoteAssetManager, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

- (void)dealloc
{
  void *v3;
  NSURL *fileURL;
  char v5;
  id v6;
  NSObject *v7;
  NSURL *v8;
  objc_super v9;
  id v10;
  uint8_t buf[4];
  NSURL *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_ownsFileURL && self->_fileURL)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    fileURL = self->_fileURL;
    v10 = 0;
    v5 = objc_msgSend(v3, "removeItemAtURL:error:", fileURL, &v10);
    v6 = v10;

    if ((v5 & 1) == 0)
    {
      PKLogFacilityTypeGetObject(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = self->_fileURL;
        *(_DWORD *)buf = 138412546;
        v12 = v8;
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Couldn't remove disk representation at %@:%@", buf, 0x16u);
      }

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PKFileDataAccessor;
  -[PKFileDataAccessor dealloc](&v9, sel_dealloc);
}

- (PKFileDataAccessor)initWithFileURL:(id)a3 error:(id *)a4
{
  return -[PKFileDataAccessor initWithFileURL:error:coordinator:](self, "initWithFileURL:error:coordinator:", a3, a4, 0);
}

- (void)setOwnsFileURL:(BOOL)a3
{
  self->_ownsFileURL = a3;
}

- (void)setExplicitDataTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)dictionary
{
  void *v3;
  PKDirectoryCoordinator *coordinator;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  v3 = (void *)MEMORY[0x19400CFE8](self, a2);
  coordinator = self->_coordinator;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__PKFileDataAccessor_dictionary__block_invoke;
  v7[3] = &unk_1E2AC1980;
  v7[4] = self;
  v7[5] = &v8;
  -[PKDirectoryCoordinator performCoordinatedAction:](coordinator, "performCoordinatedAction:", v7);
  objc_autoreleasePoolPop(v3);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)manifestHash
{
  PKDirectoryCoordinator *coordinator;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  coordinator = self->_coordinator;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PKFileDataAccessor_manifestHash__block_invoke;
  v5[3] = &unk_1E2AC1980;
  v5[4] = self;
  v5[5] = &v6;
  -[PKDirectoryCoordinator performCoordinatedAction:](coordinator, "performCoordinatedAction:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__PKFileDataAccessor_manifestHash__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  PKManifestHash(*(void **)(*(_QWORD *)(a1 + 32) + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __32__PKFileDataAccessor_dictionary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  PKObjectDictionary(*(void **)(*(_QWORD *)(a1 + 32) + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __28__PKFileDataAccessor_bundle__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)bundle
{
  PKDirectoryCoordinator *coordinator;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  coordinator = self->_coordinator;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__PKFileDataAccessor_bundle__block_invoke;
  v5[3] = &unk_1E2AC1980;
  v5[4] = self;
  v5[5] = &v6;
  -[PKDirectoryCoordinator performCoordinatedAction:](coordinator, "performCoordinatedAction:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (PKFileDataAccessor)initWithFileURL:(id)a3 error:(id *)a4 coordinator:(id)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PKDirectoryCoordinator *v17;
  PKFileDataAccessor *v18;
  PKFileDataAccessor *v19;
  objc_super v21;

  v9 = a3;
  v17 = (PKDirectoryCoordinator *)a5;
  if (v17)
  {
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v17 = -[PKDirectoryCoordinator initWithURL:]([PKDirectoryCoordinator alloc], "initWithURL:", v9);
    if (!v9)
    {
LABEL_8:
      if (a4)
      {
        PKValidationErrorWithReason(0, v10, v11, v12, v13, v14, v15, v16, (uint64_t)v21.receiver);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      v19 = 0;
      goto LABEL_11;
    }
  }
  if (!v17)
    goto LABEL_8;
  v21.receiver = self;
  v21.super_class = (Class)PKFileDataAccessor;
  v18 = -[PKFileDataAccessor init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_fileURL, a3);
    objc_storeStrong((id *)&v19->_coordinator, v17);
  }
LABEL_11:

  return v19;
}

- (PKFileDataAccessor)init
{

  return 0;
}

- (void)revocationStatusWithCompletion:(id)a3
{
  id v4;
  PKDirectoryCoordinator *coordinator;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  coordinator = self->_coordinator;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PKFileDataAccessor_revocationStatusWithCompletion___block_invoke;
  v7[3] = &unk_1E2AC1958;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PKDirectoryCoordinator performCoordinatedAction:](coordinator, "performCoordinatedAction:", v7);

}

void __53__PKFileDataAccessor_revocationStatusWithCompletion___block_invoke(uint64_t a1)
{
  PKCheckRevocationStatus(*(void **)(*(_QWORD *)(a1 + 32) + 56), *(void **)(a1 + 40));
}

- (void)dictionaryWithCompletion:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    -[PKFileDataAccessor dictionary](self, "dictionary");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v5, v6);

  }
}

- (id)content
{
  void *v3;
  PKDirectoryCoordinator *coordinator;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  v3 = (void *)MEMORY[0x19400CFE8](self, a2);
  coordinator = self->_coordinator;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__PKFileDataAccessor_content__block_invoke;
  v7[3] = &unk_1E2AC1980;
  v7[4] = self;
  v7[5] = &v8;
  -[PKDirectoryCoordinator performCoordinatedAction:](coordinator, "performCoordinatedAction:", v7);
  objc_autoreleasePoolPop(v3);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __29__PKFileDataAccessor_content__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = +[PKContent createWithFileURL:dataTypeIdentifier:](PKContent, "createWithFileURL:dataTypeIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)contentWithCompletion:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    -[PKFileDataAccessor content](self, "content");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v5, v6);

  }
}

- (id)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7
{
  id v11;
  id v12;
  PKDirectoryCoordinator *coordinator;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  PKFileDataAccessor *v21;
  uint64_t *v22;
  int64_t v23;
  double v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v11 = a5;
  v12 = a6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  coordinator = self->_coordinator;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__PKFileDataAccessor_imageSetForType_screenScale_suffix_displayProfile_preheat___block_invoke;
  v18[3] = &unk_1E2AC19A8;
  v22 = &v25;
  v23 = a3;
  v24 = a4;
  v14 = v11;
  v19 = v14;
  v15 = v12;
  v20 = v15;
  v21 = self;
  -[PKDirectoryCoordinator performCoordinatedAction:](coordinator, "performCoordinatedAction:", v18);
  v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v16;
}

void __80__PKFileDataAccessor_imageSetForType_screenScale_suffix_displayProfile_preheat___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = (void *)MEMORY[0x19400CFE8]();
  +[PKImageSet imageSetForType:screenScale:suffix:displayProfile:fileURL:](PKImageSet, "imageSetForType:screenScale:suffix:displayProfile:fileURL:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56), *(double *)(a1 + 72));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_autoreleasePoolPop(v3);
}

- (void)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7 withCompletion:(id)a8
{
  _BOOL8 v9;
  id v15;
  id v16;

  if (a8)
  {
    v9 = a7;
    v15 = a8;
    -[PKFileDataAccessor imageSetForType:screenScale:suffix:displayProfile:preheat:](self, "imageSetForType:screenScale:suffix:displayProfile:preheat:", a3, a5, a6, v9, a4);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a8 + 2))(v15, v16);

  }
}

- (id)resourceValueForKey:(id)a3
{
  id v4;
  PKDirectoryCoordinator *coordinator;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  coordinator = self->_coordinator;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__PKFileDataAccessor_resourceValueForKey___block_invoke;
  v9[3] = &unk_1E2AC19D0;
  v9[4] = self;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[PKDirectoryCoordinator performCoordinatedAction:](coordinator, "performCoordinatedAction:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __42__PKFileDataAccessor_resourceValueForKey___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id *v3;
  id obj;

  v1 = a1[5];
  v2 = *(void **)(a1[4] + 56);
  v3 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "getResourceValue:forKey:error:", &obj, v1, 0);
  objc_storeStrong(v3, obj);
}

- (id)dataForBundleResourceNamed:(id)a3 withExtension:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKDirectoryCoordinator *coordinator;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  -[PKFileDataAccessor bundle](self, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  coordinator = self->_coordinator;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__PKFileDataAccessor_dataForBundleResourceNamed_withExtension___block_invoke;
  v15[3] = &unk_1E2AC19F8;
  v10 = v8;
  v16 = v10;
  v11 = v6;
  v17 = v11;
  v12 = v7;
  v18 = v12;
  v19 = &v20;
  -[PKDirectoryCoordinator performCoordinatedAction:](coordinator, "performCoordinatedAction:", v15);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __63__PKFileDataAccessor_dataForBundleResourceNamed_withExtension___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "URLForResource:withExtension:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v5);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)dataForBundleResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKFileDataAccessor dataForBundleResourceNamed:withExtension:](self, "dataForBundleResourceNamed:withExtension:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dataForBundleResources:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKDirectoryCoordinator *coordinator;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v5);
    v7 = (void *)MEMORY[0x19400CFE8]();
    -[PKFileDataAccessor bundle](self, "bundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    coordinator = self->_coordinator;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__PKFileDataAccessor_dataForBundleResources___block_invoke;
    v13[3] = &unk_1E2AC1A20;
    v14 = v4;
    v15 = v8;
    v10 = v6;
    v16 = v10;
    v11 = v8;
    -[PKDirectoryCoordinator performCoordinatedAction:](coordinator, "performCoordinatedAction:", v13);

    objc_autoreleasePoolPop(v7);
    if (objc_msgSend(v10, "count"))
      v5 = (void *)objc_msgSend(v10, "copy");
    else
      v5 = 0;

  }
  return v5;
}

void __45__PKFileDataAccessor_dataForBundleResources___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v7, "name", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "extension");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "URLForResource:withExtension:", v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v11);
        if (v12)
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v12, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

- (id)archiveData
{
  PKDirectoryCoordinator *coordinator;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  coordinator = self->_coordinator;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__PKFileDataAccessor_archiveData__block_invoke;
  v5[3] = &unk_1E2AC1980;
  v5[4] = self;
  v5[5] = &v6;
  -[PKDirectoryCoordinator performCoordinatedAction:](coordinator, "performCoordinatedAction:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__PKFileDataAccessor_archiveData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  PKArchiverZipData(*(NSURL **)(*(_QWORD *)(a1 + 32) + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)serializedFileWrapper
{
  PKDirectoryCoordinator *coordinator;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  coordinator = self->_coordinator;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PKFileDataAccessor_serializedFileWrapper__block_invoke;
  v5[3] = &unk_1E2AC1A48;
  v5[4] = self;
  v5[5] = &v6;
  -[PKDirectoryCoordinator performCoordinatedAction:](coordinator, "performCoordinatedAction:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__PKFileDataAccessor_serializedFileWrapper__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithURL:options:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), 1, 0);
  objc_msgSend(v4, "serializedRepresentation");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (BOOL)remoteAssetsDownloadedForSEIDs:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[PKFileDataAccessor remoteAssetsDownloadedForScreenScale:seids:suffix:](self, "remoteAssetsDownloadedForScreenScale:seids:suffix:", v4, 0, PKScreenScale());

  return (char)self;
}

- (BOOL)remoteAssetsDownloadedForScreenScale:(double)a3 seids:(id)a4 suffix:(id)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[PKFileDataAccessor remoteAssetManagerForSEIDs:](self, "remoteAssetManagerForSEIDs:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceSpecificItemsForScreenScale:suffix:", v8, a3);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        if (!objc_msgSend(v9, "assetExistsLocally:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17))
        {
          v15 = 0;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_11:

  return v15;
}

- (void)_downloadRemoteAssetsWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD, float);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  int v16;
  PKFileDataAccessor *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD, float))a4;
  objc_msgSend(v6, "seids");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_9;
  if (PKSecureElementIsAvailable())
  {
    if (PKRunningInPassd())
    {
      +[PKSecureElement secureElementIdentifiers](PKSecureElement, "secureElementIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    PKLogFacilityTypeGetObject(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 134349314;
      v17 = self;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKFileDataAccessor (%{public}p): downloadRemoteAssets should always be called with a seids outside of passd, falling back to downloading everything. Called from: %@", (uint8_t *)&v16, 0x16u);

    }
  }
  v8 = 0;
LABEL_9:
  -[PKFileDataAccessor remoteAssetManagerForSEIDs:](self, "remoteAssetManagerForSEIDs:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v6, "screenScale");
    v13 = v12;
    objc_msgSend(v6, "suffix");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudStoreCoordinatorDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "downloadRemoteAssetsWithScreenScale:suffix:cloudStoreCoordinatorDelegate:ignoreRequiredAssetDownloadFailures:completion:", v14, v15, objc_msgSend(v6, "ignoreRequiredAssetDownloadFailures"), v7, v13);

  }
  else
  {
    v7[2](v7, 1, 0, 1.0);
  }

}

- (id)remoteAssetManagerForSEIDs:(id)a3
{
  id v4;
  PKRemoteAssetManager *v5;

  v4 = a3;
  v5 = -[PKRemoteAssetManager initWithDirectoryCoordinator:]([PKRemoteAssetManager alloc], "initWithDirectoryCoordinator:", self->_coordinator);
  -[PKRemoteAssetManager setSeids:](v5, "setSeids:", v4);

  return v5;
}

- (id)remoteAssetManager
{
  PKDirectoryCoordinator *coordinator;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  coordinator = self->_coordinator;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__PKFileDataAccessor_remoteAssetManager__block_invoke;
  v5[3] = &unk_1E2AC1A48;
  v5[4] = self;
  v5[5] = &v6;
  -[PKDirectoryCoordinator performCoordinatedAction:](coordinator, "performCoordinatedAction:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__PKFileDataAccessor_remoteAssetManager__block_invoke(uint64_t a1)
{
  uint64_t v2;
  PKRemoteAssetManager *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 16))
  {
    *(_BYTE *)(v2 + 16) = 1;
    v3 = -[PKRemoteAssetManager initWithDirectoryCoordinator:]([PKRemoteAssetManager alloc], "initWithDirectoryCoordinator:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(v2 + 24));
}

- (id)displayProfileOfType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PKFileDataAccessor dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB34D0];
  -[PKFileDataAccessor fileURL](self, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleWithURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKDisplayProfile displayProfileOfType:withDictionary:bundle:](PKDisplayProfile, "displayProfileOfType:withDictionary:bundle:", a3, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)passLocalizedStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKFileDataAccessor bundle](self, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1E2ADF4C0, CFSTR("pass_localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)ownsFileURL
{
  return self->_ownsFileURL;
}

- (NSString)explicitDataTypeIdentifier
{
  return self->_explicitDataTypeIdentifier;
}

@end
