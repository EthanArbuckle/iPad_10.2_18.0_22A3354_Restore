@implementation SYDocumentSenderAvatar

- (SYDocumentSenderAvatar)initWithDocumentSender:(id)a3
{
  id v5;
  SYDocumentSenderAvatar *v6;
  SYDocumentSenderAvatar *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *processingQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SYDocumentSenderAvatar;
  v6 = -[SYDocumentSenderAvatar init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_documentSender, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.synapse.SYDocumentSenderAvatar", v8);
    processingQueue = v7->_processingQueue;
    v7->_processingQueue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (void)fetchThumbnailImagesWithScale:(double)a3 isRTL:(BOOL)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *processingQueue;
  id v13;
  _QWORD block[5];
  id v15;
  double v16;
  BOOL v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke;
  v18[3] = &unk_1E757B5F8;
  v19 = v8;
  v10 = v8;
  v11 = (void *)MEMORY[0x1BCCFF08C](v18);
  processingQueue = self->_processingQueue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_2;
  block[3] = &unk_1E757B648;
  v16 = a3;
  v17 = a4;
  block[4] = self;
  v15 = v11;
  v13 = v11;
  dispatch_async(processingQueue, block);

}

uint64_t __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD block[5];
  id v34;
  uint64_t v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint8_t v42[128];
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  _QWORD v47[4];

  v47[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v3 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "documentSender");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v44 = (uint64_t)v4;
    _os_log_impl(&dword_1BCC38000, v3, OS_LOG_TYPE_DEFAULT, "Fetching all matching contacts for sender: %{private}@", buf, 0xCu);

  }
  v5 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(*(id *)(a1 + 32), "_documentSenderHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForContactsMatchingEmailAddress:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v47[0] = *MEMORY[0x1E0C96890];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v41 = 0;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v7;
  objc_msgSend(v2, "unifiedContactsMatchingPredicate:keysToFetch:error:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (!v8)
  {
    v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_2_cold_1((uint64_t)v9, v10, v11);

  }
  v29 = v9;
  v32 = v2;
  v12 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v8, "count", v9);
    objc_msgSend(*(id *)(a1 + 32), "documentSender");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218243;
    v44 = v13;
    v45 = 2113;
    v46 = v14;
    _os_log_impl(&dword_1BCC38000, v12, OS_LOG_TYPE_DEFAULT, "Found %ld matching contacts for sender: %{private}@", buf, 0x16u);

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  objc_msgSend(*(id *)(a1 + 32), "_createAvatarImageRenderer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_createRenderingScopeWithSize:scale:isRTL:", *(unsigned __int8 *)(a1 + 56), 100.0, 100.0, *(double *)(a1 + 48));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v23, "thumbnailImageData", v29);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(*(id *)(a1 + 32), "_renderAvatarImageForContact:renderer:renderingScope:", v23, v16, v17);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v15, "addObject:", v25);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v20);
  }

  if (objc_msgSend(v15, "count"))
  {
    v26 = *(_QWORD *)(a1 + 40);
    v27 = (void *)objc_msgSend(v15, "copy");
    (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v27);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_7;
    block[3] = &unk_1E757B648;
    v28 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    block[1] = 3221225472;
    v35 = *(_QWORD *)(a1 + 48);
    v36 = *(_BYTE *)(a1 + 56);
    v34 = v28;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_defaultThumbnailImageWithSize:scale:isRTL:", *(unsigned __int8 *)(a1 + 56), 100.0, 100.0, *(double *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v11[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_2_8;
  v8[3] = &unk_1E757B620;
  v9 = v4;
  v10 = v5;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_2_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_documentSenderHandle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[SYDocumentSenderAvatar documentSender](self, "documentSender");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("<>"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "length", (_QWORD)v15))
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)fetchThumbnailImages
{
  double v3;
  _BOOL8 v4;

  v3 = 2.0;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    if (SYScreenScale___onceToken != -1)
      dispatch_once(&SYScreenScale___onceToken, &__block_literal_global_1);
    v3 = *(double *)&SYScreenScale___scale;
  }
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    if (SYIsRTL___onceToken != -1)
      dispatch_once(&SYIsRTL___onceToken, &__block_literal_global_50);
    v4 = SYIsRTL___isRTL != 0;
  }
  else
  {
    v4 = 0;
  }
  return -[SYDocumentSenderAvatar fetchThumbnailImagesWithScale:isRTL:](self, "fetchThumbnailImagesWithScale:isRTL:", v4, v3);
}

- (id)fetchThumbnailImagesWithScale:(double)a3 isRTL:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint8_t v38[128];
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  _QWORD v43[4];

  v30 = a4;
  v43[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v7 = (void *)MEMORY[0x1E0C97200];
  -[SYDocumentSenderAvatar _documentSenderHandle](self, "_documentSenderHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateForContactsMatchingEmailAddress:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v43[0] = *MEMORY[0x1E0C96890];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v31 = (void *)v9;
  v32 = v6;
  objc_msgSend(v6, "unifiedContactsMatchingPredicate:keysToFetch:error:", v9, v10, &v37);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v37;
  if (!v11)
  {
    v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_2_cold_1((uint64_t)v12, v13, v14);

  }
  v15 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v11, "count");
    -[SYDocumentSenderAvatar documentSender](self, "documentSender");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218243;
    v40 = v16;
    v41 = 2113;
    v42 = v17;
    _os_log_impl(&dword_1BCC38000, v15, OS_LOG_TYPE_DEFAULT, "Found %ld matching contacts for sender: %{private}@", buf, 0x16u);

  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v19 = v11;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v24, "thumbnailImageData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v24, "thumbnailImageData");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v26);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v21);
  }

  if (!objc_msgSend(v18, "count"))
  {
    -[SYDocumentSenderAvatar _defaultThumbnailImageWithSize:scale:isRTL:](self, "_defaultThumbnailImageWithSize:scale:isRTL:", v30, 100.0, 100.0, a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      objc_msgSend(v18, "addObject:", v27);

  }
  v28 = (void *)objc_msgSend(v18, "copy");

  return v28;
}

- (id)_defaultThumbnailImageWithSize:(CGSize)a3 scale:(double)a4 isRTL:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  height = a3.height;
  width = a3.width;
  -[SYDocumentSenderAvatar _createAvatarImageRenderer](self, "_createAvatarImageRenderer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDocumentSenderAvatar _createRenderingScopeWithSize:scale:isRTL:](self, "_createRenderingScopeWithSize:scale:isRTL:", v5, width, height, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDocumentSenderAvatar _renderAvatarImageWithRenderer:renderingScope:](self, "_renderAvatarImageWithRenderer:renderingScope:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_createAvatarImageRenderer
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  Class (*v11)(uint64_t);
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v2 = (void *)getCNAvatarImageRendererSettingsClass_softClass;
  v17 = getCNAvatarImageRendererSettingsClass_softClass;
  if (!getCNAvatarImageRendererSettingsClass_softClass)
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __getCNAvatarImageRendererSettingsClass_block_invoke;
    v12 = &unk_1E757B260;
    v13 = &v14;
    __getCNAvatarImageRendererSettingsClass_block_invoke((uint64_t)&v9);
    v2 = (void *)v15[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v3, "defaultSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v5 = (void *)getCNAvatarImageRendererClass_softClass;
  v17 = getCNAvatarImageRendererClass_softClass;
  if (!getCNAvatarImageRendererClass_softClass)
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __getCNAvatarImageRendererClass_block_invoke;
    v12 = &unk_1E757B260;
    v13 = &v14;
    __getCNAvatarImageRendererClass_block_invoke((uint64_t)&v9);
    v5 = (void *)v15[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v14, 8);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithSettings:", v4);

  return v7;
}

- (id)_createRenderingScopeWithSize:(CGSize)a3 scale:(double)a4 isRTL:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a5;
  height = a3.height;
  width = a3.width;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v9 = (void *)getCNAvatarImageRenderingScopeClass_softClass;
  v16 = getCNAvatarImageRenderingScopeClass_softClass;
  if (!getCNAvatarImageRenderingScopeClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getCNAvatarImageRenderingScopeClass_block_invoke;
    v12[3] = &unk_1E757B260;
    v12[4] = &v13;
    __getCNAvatarImageRenderingScopeClass_block_invoke((uint64_t)v12);
    v9 = (void *)v14[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v13, 8);
  objc_msgSend(v10, "scopeWithPointSize:scale:rightToLeft:style:", v5, 0, width, height, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_renderAvatarImageWithRenderer:(id)a3 renderingScope:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[SYDocumentSenderAvatar documentSender](self, "documentSender");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138477827;
    v19 = v9;
    _os_log_impl(&dword_1BCC38000, v8, OS_LOG_TYPE_DEFAULT, "Rendering avatar image for sender: %{private}@", (uint8_t *)&v18, 0xCu);

  }
  -[SYDocumentSenderAvatar documentSender](self, "documentSender");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personNameComponentsFormattedWithStyle:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SYDocumentSenderAvatar _createContactFromPersonNameComponents:](self, "_createContactFromPersonNameComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYDocumentSenderAvatar _renderAvatarImageForContact:renderer:renderingScope:](self, "_renderAvatarImageForContact:renderer:renderingScope:", v12, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[SYDocumentSenderAvatar documentSender](self, "documentSender");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "length");
      v18 = 138478595;
      v19 = v15;
      v20 = 2113;
      v21 = v12;
      v22 = 2113;
      v23 = v11;
      v24 = 2048;
      v25 = v16;
      _os_log_impl(&dword_1BCC38000, v14, OS_LOG_TYPE_DEFAULT, "Finished rendering avatar image for sender: %{private}@, contact: %{private}@, components: %{private}@, size: %ld", (uint8_t *)&v18, 0x2Au);

    }
  }
  else
  {
    v14 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SYDocumentSenderAvatar _renderAvatarImageWithRenderer:renderingScope:].cold.1(self, v14);
    v13 = 0;
    v12 = v14;
  }

  return v13;
}

- (id)_renderAvatarImageForContact:(id)a3 renderer:(id)a4 renderingScope:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v21[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "avatarImageForContacts:scope:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v13 = getUIImagePNGRepresentationSymbolLoc_ptr;
  v20 = getUIImagePNGRepresentationSymbolLoc_ptr;
  if (!getUIImagePNGRepresentationSymbolLoc_ptr)
  {
    v14 = (void *)UIKitLibrary();
    v13 = dlsym(v14, "UIImagePNGRepresentation");
    v18[3] = (uint64_t)v13;
    getUIImagePNGRepresentationSymbolLoc_ptr = v13;
  }
  _Block_object_dispose(&v17, 8);
  if (!v13)
    -[SYDocumentSenderAvatar _renderAvatarImageForContact:renderer:renderingScope:].cold.1();
  ((void (*)(id))v13)(v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_createContactFromPersonNameComponents:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0C97360];
    v4 = a3;
    v5 = objc_alloc_init(v3);
    objc_msgSend(v4, "namePrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNamePrefix:", v6);

    objc_msgSend(v4, "givenName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGivenName:", v7);

    objc_msgSend(v4, "middleName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMiddleName:", v8);

    objc_msgSend(v4, "familyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFamilyName:", v9);

    objc_msgSend(v4, "nameSuffix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNameSuffix:", v10);

    objc_msgSend(v4, "nickname");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setNickname:", v11);
    v12 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (SYDocumentSender)documentSender
{
  return self->_documentSender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentSender, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
}

void __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1BCC38000, a2, a3, "Failed to find matching contacts, error: %@", (uint8_t *)&v3);
}

- (void)_renderAvatarImageWithRenderer:(void *)a1 renderingScope:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "documentSender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138477827;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1BCC38000, a2, v4, "Unable to get person name components for sender: %{private}@", (uint8_t *)&v5);

}

- (void)_renderAvatarImageForContact:renderer:renderingScope:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSData *sy_UIImagePNGRepresentation(UIImage *__strong)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SYDocumentSenderAvatar.m"), 26, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
