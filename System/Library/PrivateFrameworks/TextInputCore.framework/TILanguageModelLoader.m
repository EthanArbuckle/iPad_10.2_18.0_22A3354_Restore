@implementation TILanguageModelLoader

- (void)wireLanguageModelMemory
{
  int v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  std::__shared_weak_count *v13;

  -[TILanguageModelLoader model](self, "model");
  if (v12)
  {
    -[TILanguageModelLoader model](self, "model");
    v3 = (*(uint64_t (**)())(*(_QWORD *)v10 + 16))();
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)())v11->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
  else
  {
    v3 = 0;
  }
  if (!v13)
    goto LABEL_12;
  v6 = (unint64_t *)&v13->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (!v7)
  {
    ((void (*)())v13->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v13);
    if (!v3)
      return;
  }
  else
  {
LABEL_12:
    if (!v3)
      return;
  }
  -[TILanguageModelLoader model](self, "model");
  (*(void (**)())(*(_QWORD *)v12 + 184))();
  if (v13)
  {
    v8 = (unint64_t *)&v13->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

- (shared_ptr<KB::LanguageModel>)model
{
  LanguageModel **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<KB::LanguageModel> result;

  cntrl = self->_model.__cntrl_;
  *v2 = self->_model.__ptr_;
  v2[1] = (LanguageModel *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (LanguageModel *)self;
  return result;
}

- (void)setLanguageModelRecipientIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  TILanguageModelLoader *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  TILanguageModelLoader *v17;
  id v18;
  _BYTE *v19;
  _BYTE buf[24];
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  TILanguageModelLoader *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[TILanguageModelLoader setLanguageModelRecipientIdentifier:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  Language model recipient = %@", buf, 0x16u);
  }
  -[TILanguageModelLoader setRecipientIdentifier:](self, "setRecipientIdentifier:", v6);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v21 = __Block_byref_object_copy__6697;
  v22 = __Block_byref_object_dispose__6698;
  v8 = self;
  v23 = v8;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __72__TILanguageModelLoader_setLanguageModelRecipientIdentifier_completion___block_invoke;
  v15 = &unk_1EA0FF8D8;
  v18 = v7;
  v19 = buf;
  v16 = v6;
  v17 = v8;
  v9 = v7;
  v10 = v6;
  v11 = _Block_copy(&v12);
  -[TILanguageModelLoader lookupRecordForRecipientIdentifier:completionHandler:](v8, "lookupRecordForRecipientIdentifier:completionHandler:", v10, v11, v12, v13, v14, v15);

  _Block_object_dispose(buf, 8);
}

- (void)setRecipientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_recipientIdentifier, a3);
}

- (void)setLanguageModelClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD v18[4];
  id v19;
  _BYTE *v20;
  _QWORD v21[2];
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  TILanguageModelLoader *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[TILanguageModelLoader clientIdentifier](self, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "_string:matchesString:", v4, v6);

  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[TILanguageModelLoader setLanguageModelClientIdentifier:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  Language model client = %@", buf, 0x16u);
    }
    -[TILanguageModelLoader setClientIdentifier:](self, "setClientIdentifier:", v4);
    -[TILanguageModelLoader model](self, "model");
    (*(void (**)(_QWORD, id))(**(_QWORD **)buf + 248))(*(_QWORD *)buf, v4);
    v7 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v8 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    if (__offlineTrainingEnabled)
    {
      +[TILanguageModelLoaderManager knownClients](TILanguageModelLoaderManager, "knownClients");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        +[TILanguageModelLoaderManager knownClients](TILanguageModelLoaderManager, "knownClients");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v4, v4);

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v23 = __Block_byref_object_copy__6697;
        v24 = __Block_byref_object_dispose__6698;
        v25 = self;
        cntrl = (std::__shared_weak_count *)v25->_model.__cntrl_;
        v21[0] = v25->_model.__ptr_;
        v21[1] = cntrl;
        if (cntrl)
        {
          p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
          do
            v15 = __ldxr(p_shared_owners);
          while (__stxr(v15 + 1, p_shared_owners));
        }
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __58__TILanguageModelLoader_setLanguageModelClientIdentifier___block_invoke;
        v18[3] = &unk_1EA106F40;
        v20 = buf;
        v19 = v4;
        KB::LanguageModel::background_load((uint64_t)v21, v18);
        if (cntrl)
        {
          v16 = (unint64_t *)&cntrl->__shared_owners_;
          do
            v17 = __ldaxr(v16);
          while (__stlxr(v17 - 1, v16));
          if (!v17)
          {
            ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
            std::__shared_weak_count::__release_weak(cntrl);
          }
        }

        _Block_object_dispose(buf, 8);
      }
    }
  }

}

- (void)lookupRecordForRecipientIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  void (**v13)(id, id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  if (objc_msgSend(v6, "length"))
  {
    +[TILanguageModelLoaderManager recipientRecords](TILanguageModelLoaderManager, "recipientRecords");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (objc_msgSend(v9, "count"))
        v10 = v9;
      else
        v10 = 0;
      ((void (**)(id, id, void *))v7)[2](v7, v6, v10);
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __78__TILanguageModelLoader_lookupRecordForRecipientIdentifier_completionHandler___block_invoke;
      v11[3] = &unk_1EA100618;
      v12 = v6;
      v13 = v7;
      -[TILanguageModelLoader findRecordsMatchingRecipient:completionHandler:](self, "findRecordsMatchingRecipient:completionHandler:", v12, v11);

    }
  }
  else
  {
    v7[2](v7, v6, 0);
  }

}

void __72__TILanguageModelLoader_setLanguageModelRecipientIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  TILanguageModelAdaptationContext *v10;
  void *v11;
  TILanguageModelAdaptationContext *v12;
  void *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _BYTE v23[22];
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v8 = a2;
  objc_msgSend(v7, "recipientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "_string:matchesString:", v8, v9);

  if ((_DWORD)v6)
  {
    v10 = [TILanguageModelAdaptationContext alloc];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "clientIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TILanguageModelAdaptationContext initWithClientIdentifier:andRecipientRecord:](v10, "initWithClientIdentifier:andRecipientRecord:", v11, v5);

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v22 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v23 = 136315906;
      *(_QWORD *)&v23[4] = "-[TILanguageModelLoader setLanguageModelRecipientIdentifier:completion:]_block_invoke";
      *(_WORD *)&v23[12] = 2112;
      *(_QWORD *)&v23[14] = v12;
      v24 = 2112;
      v25 = v22;
      v26 = 2112;
      v27 = v5;
      _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  Language model adaptation context = %@, recipient = %@ (%@)", v23, 0x2Au);
    }
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v13)
    {
      objc_msgSend(v13, "model");
      v14 = *(_QWORD *)v23;
    }
    else
    {
      v14 = 0;
      *(_QWORD *)v23 = 0;
      *(_QWORD *)&v23[8] = 0;
    }
    (*(void (**)(uint64_t, NSDictionary *))(*(_QWORD *)v14 + 256))(v14, -[TILanguageModelAdaptationContext recipientContext](v12, "recipientContext", *(_QWORD *)v23));
    v15 = *(std::__shared_weak_count **)&v23[8];
    if (*(_QWORD *)&v23[8])
    {
      v16 = (unint64_t *)(*(_QWORD *)&v23[8] + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAdaptationContext:", v12);

  }
  v18 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "adaptationContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = 0;

}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setAdaptationContext:(id)a3
{
  objc_storeStrong((id *)&self->_adaptationContext, a3);
}

- (NSString)recipientIdentifier
{
  return self->_recipientIdentifier;
}

- (TILanguageModelAdaptationContext)adaptationContext
{
  return self->_adaptationContext;
}

- (NSArray)mobileAssets
{
  return self->_mobileAssets;
}

- (BOOL)usesLinguisticContext
{
  return self->_usesLinguisticContext;
}

- (NSDictionary)trialParameters
{
  return self->_trialParameters;
}

- (int)inlineCompletionPrecision
{
  return self->_inlineCompletionPrecision;
}

- (NSString)dynamicResourcePath
{
  return self->_dynamicResourcePath;
}

- (void)unwireLanguageModelMemory
{
  int v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  std::__shared_weak_count *v13;

  -[TILanguageModelLoader model](self, "model");
  if (v12)
  {
    -[TILanguageModelLoader model](self, "model");
    v3 = (*(uint64_t (**)())(*(_QWORD *)v10 + 16))();
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)())v11->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
  else
  {
    v3 = 0;
  }
  if (!v13)
    goto LABEL_12;
  v6 = (unint64_t *)&v13->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (!v7)
  {
    ((void (*)())v13->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v13);
    if (!v3)
      return;
  }
  else
  {
LABEL_12:
    if (!v3)
      return;
  }
  -[TILanguageModelLoader model](self, "model");
  (*(void (**)())(*(_QWORD *)v12 + 192))();
  if (v13)
  {
    v8 = (unint64_t *)&v13->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

- (TILanguageModelLoader)initWithModelLocaleIdentifier:(id)a3 isMultilingualModel:(BOOL)a4 customResourcePaths:(id)a5 dynamicResourcePath:(id)a6 mobileAssets:(id)a7 usesLinguisticContext:(BOOL)a8 isMultiLingualModeEnabled:(BOOL)a9 isSiriMode:(BOOL)a10 validEnglishTransformerMultilingualConfig:(BOOL)a11 trialParameters:(id)a12 inlineCompletionPrecision:(int)a13 isInlineCompletionEnabled:(BOOL)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  TILanguageModelLoader *v24;
  TILanguageModelLoader *v25;
  uint64_t v26;
  NSString *dynamicResourcePath;
  id v30;
  objc_super v31;

  v20 = a3;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v30 = a12;
  v31.receiver = self;
  v31.super_class = (Class)TILanguageModelLoader;
  v24 = -[TILanguageModelLoader init](&v31, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_modelLocaleIdentifier, a3);
    v25->_isMultilingualModel = a4;
    v25->_multiLingualModeEnabled = a9;
    v25->_isSiriMode = a10;
    v25->_validEnglishTransformerMultilingualConfig = a11;
    v26 = objc_msgSend(v22, "copy");
    dynamicResourcePath = v25->_dynamicResourcePath;
    v25->_dynamicResourcePath = (NSString *)v26;

    objc_storeStrong((id *)&v25->_mobileAssets, a7);
    v25->_usesLinguisticContext = a8;
    objc_storeStrong((id *)&v25->_customResourcePaths, a5);
    objc_storeStrong((id *)&v25->_trialParameters, a12);
    v25->_inlineCompletionPrecision = a13;
    v25->_isInlineCompletionEnabled = a14;
  }

  return v25;
}

- (NSArray)staticResourcePaths
{
  NSArray *customResourcePaths;
  NSArray *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  NSArray *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  customResourcePaths = self->_customResourcePaths;
  if (customResourcePaths)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[TILanguageModelLoader staticResourcePaths]";
      v37 = 2112;
      v38 = customResourcePaths;
      _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  Using custom static resource paths for LM loader: %@", buf, 0x16u);
      customResourcePaths = self->_customResourcePaths;
    }
    return customResourcePaths;
  }
  else
  {
    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    +[TIInputMode inputModeWithIdentifier:isSiriMode:](TIInputMode, "inputModeWithIdentifier:isSiriMode:", self->_modelLocaleIdentifier, -[TILanguageModelLoader isSiriMode](self, "isSiriMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIKeyboardSystemLanguageModelPathsForInputMode(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "URLByDeletingLastPathComponent");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "path");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            -[NSArray addObject:](v5, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v10);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = self->_mobileAssets;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v26;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v20), (_QWORD)v25);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "URLByDeletingLastPathComponent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "path");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
            -[NSArray addObject:](v5, "addObject:", v23);

          ++v20;
        }
        while (v18 != v20);
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v18);
    }

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[TILanguageModelLoader staticResourcePaths]";
      v37 = 2112;
      v38 = v5;
      _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  Static resource paths for LM loader: %@", buf, 0x16u);
    }
    -[NSArray allObjects](v5, "allObjects", (_QWORD)v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSArray *)v24;
  }
}

- (void)clearDynamicLearningCaches
{
  LanguageModel *ptr;

  ptr = self->_model.__ptr_;
  if (ptr)
    (*(void (**)(LanguageModel *))(*(_QWORD *)ptr + 104))(ptr);
}

- (void)flushDynamicLearningCaches
{
  LanguageModel *ptr;

  ptr = self->_model.__ptr_;
  if (ptr)
    (*(void (**)(LanguageModel *, _QWORD))(*(_QWORD *)ptr + 568))(ptr, 0);
}

- (void)performLearningIfNecessaryForClient:(id)a3 withModel:(shared_ptr<KB::LanguageModel>)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  double v13;

  v5 = a3;
  -[TILanguageModelLoader dynamicResourcePath](self, "dynamicResourcePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel](_TILanguageLikelihoodModel, "sharedLanguageLikelihoodModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastOfflineAdaptationTimeForApp:", v5);
    v9 = v8;

    if (v9 == 0.0)
    {
      v10 = dispatch_time(0, 20000000000);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __71__TILanguageModelLoader_performLearningIfNecessaryForClient_withModel___block_invoke;
      v11[3] = &unk_1EA100718;
      v12 = v5;
      v13 = v9;
      dispatch_after(v10, MEMORY[0x1E0C80D38], v11);

    }
  }

}

- (BOOL)monolingualLanguageModelBundleExists:(id)a3
{
  BOOL v4;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "count") != 1 || self->_isMultilingualModel)
    return 0;
  v6 = self->_modelLocaleIdentifier;
  if (-[__CFString hasPrefix:](v6, "hasPrefix:", CFSTR("ars")))
  {

    v6 = CFSTR("ar");
  }
  if (-[TILanguageModelLoader usesLinguisticContext](self, "usesLinguisticContext"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[TILanguageModelLoader staticResourcePaths](self, "staticResourcePaths", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          -[TILanguageModelLoader isSiriMode](self, "isSiriMode");
          TIResourcePathForInputMode();
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v4 = 1;
            goto LABEL_19;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
          continue;
        break;
      }
    }
    v4 = 0;
LABEL_19:

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)multilingualLanguageModelBundleExists
{
  NSString *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[TILanguageModelLoader usesLinguisticContext](self, "usesLinguisticContext") || !self->_isMultilingualModel)
    return 0;
  v3 = self->_modelLocaleIdentifier;
  if (v3)
  {
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    -[TILanguageModelLoader staticResourcePaths](self, "staticResourcePaths", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          TIResourcePathForInputMode();
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            v10 = 1;
            goto LABEL_15;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
    v10 = 0;
LABEL_15:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (shared_ptr<KB::LanguageModel>)newLanguageModelForLanguageLocales:(id)a3
{
  uint64_t *v3;
  uint64_t *v5;
  id v6;
  TILanguageModelAdaptationContext *v7;
  void *v8;
  NSString *modelLocaleIdentifier;
  void *v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  int v15;
  void *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  NSString *v20;
  uint64_t v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  id v25;
  int v26;
  unint64_t *v27;
  std::__shared_weak_count *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  LanguageModel *v34;
  __shared_weak_count *v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  TILanguageModelAdaptationContext *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  uint8_t buf[4];
  _BYTE v48[18];
  __int16 v49;
  id v50;
  uint64_t v51;
  shared_ptr<KB::LanguageModel> result;

  v5 = v3;
  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[TILanguageModelAdaptationContext initWithClientIdentifier:andRecipientRecord:]([TILanguageModelAdaptationContext alloc], "initWithClientIdentifier:andRecipientRecord:", &stru_1EA1081D0, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", self->_modelLocaleIdentifier);
  *v5 = 0;
  v5[1] = 0;
  if (-[TILanguageModelLoader multilingualLanguageModelBundleExists](self, "multilingualLanguageModelBundleExists")
    && _os_feature_enabled_impl())
  {
    v43 = v8;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      modelLocaleIdentifier = self->_modelLocaleIdentifier;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v48 = "-[TILanguageModelLoader newLanguageModelForLanguageLocales:]";
      *(_WORD *)&v48[8] = 2112;
      *(_QWORD *)&v48[10] = modelLocaleIdentifier;
      v49 = 2112;
      v50 = v6;
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Loading multilingual language model (%@) for languages: %@", buf, 0x20u);
    }
    -[TILanguageModelLoader customResourcePaths](self, "customResourcePaths");
    v41 = objc_claimAutoreleasedReturnValue();
    -[TILanguageModelLoader dynamicResourcePath](self, "dynamicResourcePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TILanguageModelLoader isMultiLingualModeEnabled](self, "isMultiLingualModeEnabled");
    v12 = -[TILanguageModelLoader isSiriMode](self, "isSiriMode");
    v13 = -[TILanguageModelLoader validEnglishTransformerMultilingualConfig](self, "validEnglishTransformerMultilingualConfig");
    -[TILanguageModelLoader trialParameters](self, "trialParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[TILanguageModelLoader inlineCompletionPrecision](self, "inlineCompletionPrecision");
    BYTE4(v40) = -[TILanguageModelLoader isInlineCompletionEnabled](self, "isInlineCompletionEnabled");
    LODWORD(v40) = v15;
    BYTE2(v39) = v13;
    BYTE1(v39) = v12;
    v16 = (void *)v41;
    LOBYTE(v39) = v11;
    v8 = v43;
    +[TILanguageModelLoaderManager modelForLocale:isMultilingualModel:languageLocales:adaptationContext:staticResourcePaths:dynamicResourcePath:isMultiLingualModeEnabled:isSiriMode:validEnglishTransformerMultilingualConfig:trialParameters:inlineCompletionPrecision:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "modelForLocale:isMultilingualModel:languageLocales:adaptationContext:staticResourcePaths:dynamicResourcePath:isMultiLingualModeEnabled:isSiriMode:validEnglishTransformerMultilingualConfig:trialParameters:inlineCompletionPrecision:isInlineCompletionEnabled:", v43, 1, v6, v7, v41, v10, v39, v14, v40);
    std::shared_ptr<std::vector<KB::LanguageModelContext>>::operator=[abi:nn180100]((uint64_t)v5, (__int128 *)buf);
    v17 = *(std::__shared_weak_count **)&v48[4];
    if (!*(_QWORD *)&v48[4])
      goto LABEL_17;
    v18 = (unint64_t *)(*(_QWORD *)&v48[4] + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
LABEL_15:
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (-[TILanguageModelLoader monolingualLanguageModelBundleExists:](self, "monolingualLanguageModelBundleExists:", v6))
  {
    v42 = v7;
    v44 = v8;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v20 = self->_modelLocaleIdentifier;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v48 = "-[TILanguageModelLoader newLanguageModelForLanguageLocales:]";
      *(_WORD *)&v48[8] = 2112;
      *(_QWORD *)&v48[10] = v20;
      v49 = 2112;
      v50 = v6;
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Loading monolingual language model (%@) for languages: %@", buf, 0x20u);
    }
    -[TILanguageModelLoader customResourcePaths](self, "customResourcePaths");
    v21 = objc_claimAutoreleasedReturnValue();
    -[TILanguageModelLoader dynamicResourcePath](self, "dynamicResourcePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[TILanguageModelLoader isMultiLingualModeEnabled](self, "isMultiLingualModeEnabled");
    v23 = -[TILanguageModelLoader isSiriMode](self, "isSiriMode");
    v24 = -[TILanguageModelLoader validEnglishTransformerMultilingualConfig](self, "validEnglishTransformerMultilingualConfig");
    -[TILanguageModelLoader trialParameters](self, "trialParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v6;
    v26 = -[TILanguageModelLoader inlineCompletionPrecision](self, "inlineCompletionPrecision");
    BYTE4(v40) = -[TILanguageModelLoader isInlineCompletionEnabled](self, "isInlineCompletionEnabled");
    LODWORD(v40) = v26;
    v6 = v25;
    v16 = (void *)v21;
    BYTE2(v39) = v24;
    BYTE1(v39) = v23;
    LOBYTE(v39) = v22;
    v7 = v42;
    v8 = v44;
    +[TILanguageModelLoaderManager modelForLocale:isMultilingualModel:languageLocales:adaptationContext:staticResourcePaths:dynamicResourcePath:isMultiLingualModeEnabled:isSiriMode:validEnglishTransformerMultilingualConfig:trialParameters:inlineCompletionPrecision:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "modelForLocale:isMultilingualModel:languageLocales:adaptationContext:staticResourcePaths:dynamicResourcePath:isMultiLingualModeEnabled:isSiriMode:validEnglishTransformerMultilingualConfig:trialParameters:inlineCompletionPrecision:isInlineCompletionEnabled:", v44, 0, v6, v42, v16, v10, v39, v14, v40);
    std::shared_ptr<std::vector<KB::LanguageModelContext>>::operator=[abi:nn180100]((uint64_t)v5, (__int128 *)buf);
    v17 = *(std::__shared_weak_count **)&v48[4];
    if (!*(_QWORD *)&v48[4])
      goto LABEL_17;
    v27 = (unint64_t *)(*(_QWORD *)&v48[4] + 8);
    do
      v19 = __ldaxr(v27);
    while (__stlxr(v19 - 1, v27));
    goto LABEL_15;
  }
  -[TILanguageModelLoader stubLanguageModelForLanguageLocales:withModelLocale:withAdaptationContext:](self, "stubLanguageModelForLanguageLocales:withModelLocale:withAdaptationContext:", v6, v8, v7);
  std::shared_ptr<std::vector<KB::LanguageModelContext>>::operator=[abi:nn180100]((uint64_t)v5, (__int128 *)buf);
  v36 = *(std::__shared_weak_count **)&v48[4];
  if (*(_QWORD *)&v48[4])
  {
    v37 = (unint64_t *)(*(_QWORD *)&v48[4] + 8);
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
LABEL_18:
  v28 = (std::__shared_weak_count *)v5[1];
  v45 = *v5;
  v46 = v28;
  if (v28)
  {
    p_shared_owners = (unint64_t *)&v28->__shared_owners_;
    do
      v30 = __ldxr(p_shared_owners);
    while (__stxr(v30 + 1, p_shared_owners));
  }
  -[TILanguageModelLoader loadLanguageModel:](self, "loadLanguageModel:", &v45);
  v31 = v46;
  if (v46)
  {
    v32 = (unint64_t *)&v46->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }

  result.__cntrl_ = v35;
  result.__ptr_ = v34;
  return result;
}

- (void)findRecordsMatchingRecipient:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[TILanguageModelLoader contactFetchingDelegate](self, "contactFetchingDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TILanguageModelLoader contactFetchingDelegate](self, "contactFetchingDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordsMatchingRecipient:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v7[2](v7, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__TILanguageModelLoader_findRecordsMatchingRecipient_completionHandler___block_invoke;
    v12[3] = &unk_1EA0FF8B0;
    v13 = v7;
    TIAddressBookFindRecordsMatchingRecipientsAsync(v11, v12);

  }
}

- (shared_ptr<KB::LanguageModel>)sharedLanguageModelForClient:(id)a3 withRecipient:(id)a4 forLanguageLocales:(id)a5
{
  LanguageModel *v5;
  __shared_weak_count *v6;
  shared_ptr<KB::LanguageModel> result;

  v5 = (LanguageModel *)-[TILanguageModelLoader sharedLanguageModelForClient:withRecipient:forLanguageLocales:completion:](self, "sharedLanguageModelForClient:withRecipient:forLanguageLocales:completion:", a3, a4, a5, &__block_literal_global_68);
  result.__cntrl_ = v6;
  result.__ptr_ = v5;
  return result;
}

- (shared_ptr<KB::LanguageModel>)sharedLanguageModelForClient:(id)a3 withRecipient:(id)a4 forLanguageLocales:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  uint64_t *p_shared_owners;
  unint64_t v16;
  int v17;
  int v18;
  uint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  uint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  uint64_t *v29;
  unint64_t v30;
  LanguageModel *v31;
  __shared_weak_count *v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  shared_ptr<KB::LanguageModel> result;

  v10 = a4;
  v11 = a5;
  v12 = &stru_1EA1081D0;
  if (a3)
    v12 = (__CFString *)a3;
  v13 = v12;
  v14 = a6;
  -[TILanguageModelLoader model](self, "model");
  if (!v36)
    goto LABEL_7;
  p_shared_owners = &v36->__shared_owners_;
  do
    v16 = __ldaxr((unint64_t *)p_shared_owners);
  while (__stlxr(v16 - 1, (unint64_t *)p_shared_owners));
  if (v16)
  {
LABEL_7:
    if (v35)
      goto LABEL_8;
LABEL_15:
    -[TILanguageModelLoader newLanguageModelForLanguageLocales:](self, "newLanguageModelForLanguageLocales:", v11);
    -[TILanguageModelLoader setModel:](self, "setModel:", &v33);
    v21 = v34;
    if (v34)
    {
      v22 = (unint64_t *)&v34->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    goto LABEL_22;
  }
  ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
  std::__shared_weak_count::__release_weak(v36);
  if (!v35)
    goto LABEL_15;
LABEL_8:
  -[TILanguageModelLoader model](self, "model");
  v17 = _os_feature_enabled_impl();
  v18 = v17;
  if (!v36)
    goto LABEL_12;
  v19 = &v36->__shared_owners_;
  do
    v20 = __ldaxr((unint64_t *)v19);
  while (__stlxr(v20 - 1, (unint64_t *)v19));
  if (v20)
  {
LABEL_12:
    if (!v17)
      goto LABEL_22;
    goto LABEL_21;
  }
  ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
  std::__shared_weak_count::__release_weak(v36);
  if (v18)
LABEL_21:
    -[TILanguageModelLoader reloadLanguageModelWithLanguageLocales:](self, "reloadLanguageModelWithLanguageLocales:", v11);
LABEL_22:
  -[TILanguageModelLoader setLanguageModelClientIdentifier:](self, "setLanguageModelClientIdentifier:", v13);
  -[TILanguageModelLoader setLanguageModelRecipientIdentifier:completion:](self, "setLanguageModelRecipientIdentifier:completion:", v10, v14);

  -[TILanguageModelLoader model](self, "model");
  v25 = v35;
  v24 = v36;
  if (v36)
  {
    v26 = &v36->__shared_owners_;
    do
      v27 = __ldaxr((unint64_t *)v26);
    while (__stlxr(v27 - 1, (unint64_t *)v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  if (v25)
  {
    -[TILanguageModelLoader model](self, "model");
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v35 + 264))(v35, 0);
    v28 = v36;
    if (v36)
    {
      v29 = &v36->__shared_owners_;
      do
        v30 = __ldaxr((unint64_t *)v29);
      while (__stlxr(v30 - 1, (unint64_t *)v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
  }
  -[TILanguageModelLoader model](self, "model");

  result.__cntrl_ = v32;
  result.__ptr_ = v31;
  return result;
}

- (void)loadLanguageModel:(shared_ptr<KB::LanguageModel>)a3
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t v6;
  _QWORD v7[2];

  if (__asynchronousLoad)
  {
    v3 = (std::__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
    v7[0] = *(_QWORD *)a3.__ptr_;
    v7[1] = v3;
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
      KB::LanguageModel::background_load((uint64_t)v7, &__block_literal_global_69);
      do
        v6 = __ldaxr(p_shared_owners);
      while (__stlxr(v6 - 1, p_shared_owners));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    else
    {
      KB::LanguageModel::background_load((uint64_t)v7, &__block_literal_global_69);
    }
  }
  else
  {
    (*(void (**)(_QWORD))(**(_QWORD **)a3.__ptr_ + 96))(*(_QWORD *)a3.__ptr_);
  }
}

- (void)reloadLanguageModelWithLanguageLocales:(id)a3
{
  id v4;
  uint64_t *p_shared_owners;
  unint64_t v6;
  int v7;
  int v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t *v11;
  unint64_t v12;
  int64_t v13;
  id v14;
  std::__shared_weak_count *v15;
  std::__shared_weak_count *v16;
  std::__shared_weak_count_vtbl *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  int v24;
  std::__shared_weak_count *v25;
  uint64_t *v26;
  unint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  std::__shared_weak_count *v33;
  void *__p;
  std::__shared_weak_count *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TILanguageModelLoader model](self, "model");
  if (v35)
  {
    p_shared_owners = &v35->__shared_owners_;
    do
      v6 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v6 - 1, (unint64_t *)p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  if (__p)
  {
    -[TILanguageModelLoader model](self, "model");
    v7 = (*(uint64_t (**)(void *))(*(_QWORD *)__p + 16))(__p);
    v8 = v7;
    if (!v35)
      goto LABEL_11;
    v9 = &v35->__shared_owners_;
    do
      v10 = __ldaxr((unint64_t *)v9);
    while (__stlxr(v10 - 1, (unint64_t *)v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
      if (!v8)
        goto LABEL_40;
    }
    else
    {
LABEL_11:
      if (!v7)
        goto LABEL_40;
    }
    -[TILanguageModelLoader model](self, "model");
    (*(void (**)(void **__return_ptr))(*(_QWORD *)v32 + 56))(&__p);
    if (v33)
    {
      v11 = &v33->__shared_owners_;
      do
        v12 = __ldaxr((unint64_t *)v11);
      while (__stlxr(v12 - 1, (unint64_t *)v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }
    v13 = (char *)v35 - (_BYTE *)__p;
    if (objc_msgSend(v4, "count") == v13 >> 3)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v15 = (std::__shared_weak_count *)__p;
      v16 = v35;
      while (v15 != v16)
      {
        v17 = v15->__vftable;
        v15 = (std::__shared_weak_count *)((char *)v15 + 8);
        objc_msgSend(v14, "addObject:", v17);
      }
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v18 = v4;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v29 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "localeIdentifier", (_QWORD)v28);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v14, "containsObject:", v23);

            if (!v24)
            {

              goto LABEL_33;
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v20)
            continue;
          break;
        }
      }

    }
    else
    {
LABEL_33:
      -[TILanguageModelLoader model](self, "model");
      (*(void (**)(uint64_t, id))(*(_QWORD *)v32 + 80))(v32, v4);
      v25 = v33;
      if (v33)
      {
        v26 = &v33->__shared_owners_;
        do
          v27 = __ldaxr((unint64_t *)v26);
        while (__stlxr(v27 - 1, (unint64_t *)v26));
        if (!v27)
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
      }
    }
    if (__p)
    {
      v35 = (std::__shared_weak_count *)__p;
      operator delete(__p);
    }
  }
LABEL_40:

}

- (shared_ptr<KB::LanguageModel>)loadStubLanguageModelForLanguageLocales:(id)a3 withModelLocale:(id)a4 withAdaptationContext:(id)a5
{
  uint64_t *v5;
  uint64_t *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  LanguageModel *v11;
  __shared_weak_count *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  shared_ptr<KB::LanguageModel> result;

  v7 = v5;
  -[TILanguageModelLoader stubLanguageModelForLanguageLocales:withModelLocale:withAdaptationContext:](self, "stubLanguageModelForLanguageLocales:withModelLocale:withAdaptationContext:", a3, a4, a5);
  v8 = (std::__shared_weak_count *)v7[1];
  v16 = *v7;
  v17 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  v11 = (LanguageModel *)-[TILanguageModelLoader loadLanguageModel:](self, "loadLanguageModel:", &v16);
  v13 = v17;
  if (v17)
  {
    v14 = (unint64_t *)&v17->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  result.__cntrl_ = v12;
  result.__ptr_ = v11;
  return result;
}

- (shared_ptr<KB::LanguageModel>)stubLanguageModelForLanguageLocales:(id)a3 withModelLocale:(id)a4 withAdaptationContext:(id)a5
{
  _QWORD *v5;
  _QWORD *v9;
  id v10;
  id v11;
  TILanguageModelAdaptationContext *v12;
  void *v13;
  void *v14;
  BOOL v15;
  BOOL v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  LanguageModel *v20;
  __shared_weak_count *v21;
  uint64_t v22;
  uint8_t buf[4];
  _BYTE v24[18];
  uint64_t v25;
  shared_ptr<KB::LanguageModel> result;

  v9 = v5;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (TILanguageModelAdaptationContext *)a5;
  if (v12)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    v12 = -[TILanguageModelAdaptationContext initWithClientIdentifier:andRecipientRecord:]([TILanguageModelAdaptationContext alloc], "initWithClientIdentifier:andRecipientRecord:", &stru_1EA1081D0, 0);
    if (v11)
      goto LABEL_3;
  }
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", self->_modelLocaleIdentifier);
LABEL_3:
  *v9 = 0;
  v9[1] = 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v24 = "-[TILanguageModelLoader stubLanguageModelForLanguageLocales:withModelLocale:withAdaptationContext:]";
    *(_WORD *)&v24[8] = 2112;
    *(_QWORD *)&v24[10] = v10;
    _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Loading language model stub for languages: %@", buf, 0x16u);
  }
  -[TILanguageModelLoader customResourcePaths](self, "customResourcePaths");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageModelLoader dynamicResourcePath](self, "dynamicResourcePath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[TILanguageModelLoader isMultiLingualModeEnabled](self, "isMultiLingualModeEnabled");
  v16 = -[TILanguageModelLoader isSiriMode](self, "isSiriMode");
  BYTE2(v22) = -[TILanguageModelLoader isInlineCompletionEnabled](self, "isInlineCompletionEnabled");
  BYTE1(v22) = v16;
  LOBYTE(v22) = v15;
  +[TILanguageModelLoaderManager stubForModelLocale:isMultilingualModel:languageLocales:adaptationContext:staticResourcePaths:dynamicResourcePath:isMultiLingualModeEnabled:isSiriMode:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "stubForModelLocale:isMultilingualModel:languageLocales:adaptationContext:staticResourcePaths:dynamicResourcePath:isMultiLingualModeEnabled:isSiriMode:isInlineCompletionEnabled:", v11, 0, v10, v12, v13, v14, v22);
  std::shared_ptr<std::vector<KB::LanguageModelContext>>::operator=[abi:nn180100]((uint64_t)v9, (__int128 *)buf);
  v17 = *(std::__shared_weak_count **)&v24[4];
  if (*(_QWORD *)&v24[4])
  {
    v18 = (unint64_t *)(*(_QWORD *)&v24[4] + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

  result.__cntrl_ = v21;
  result.__ptr_ = v20;
  return result;
}

- (shared_ptr<KB::LanguageModel>)lightweightLanguageModelForLanguageLocales:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  _QWORD *v10;
  LanguageModel *v11;
  __shared_weak_count *v12;
  CFTypeRef v13;
  CFTypeRef v14;
  CFTypeRef v15;
  CFTypeRef v16;
  CFTypeRef v17;
  CFTypeRef v18;
  CFTypeRef cf;
  _BYTE buf[22];
  uint64_t v21;
  shared_ptr<KB::LanguageModel> result;

  v5 = v3;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", self->_modelLocaleIdentifier);
  -[TILanguageModelLoader customResourcePaths](self, "customResourcePaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  KB::LanguageModelConfig::LanguageModelConfig((uint64_t)&v13, v7, 0, v6, v8, 0, 0, 0, 0, 1, -[TILanguageModelLoader isSiriMode](self, "isSiriMode"), 1, 1, 90, -[TILanguageModelLoader isInlineCompletionEnabled](self, "isInlineCompletionEnabled"));

  LODWORD(self) = -[TILanguageModelLoader monolingualLanguageModelBundleExists:](self, "monolingualLanguageModelBundleExists:", v6);
  v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)self)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[TILanguageModelLoader lightweightLanguageModelForLanguageLocales:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Loading lightweight language model for language %@", buf, 0x16u);
    }
    std::allocate_shared[abi:nn180100]<KB::LanguageModelStr,std::allocator<KB::LanguageModelStr>,KB::LanguageModelConfig,void>((std::__shared_weak_count **)buf, (uint64_t)&v13);
    *(_OWORD *)v5 = *(_OWORD *)buf;
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[TILanguageModelLoader lightweightLanguageModelForLanguageLocales:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Loading lightweight language model stub for language %@", buf, 0x16u);
    }
    v10 = operator new(0x138uLL);
    v10[1] = 0;
    v10[2] = 0;
    *v10 = &off_1EA0FF9A0;
    *(_QWORD *)v5 = std::construct_at[abi:nn180100]<KB::LanguageModelImplStub,KB::LanguageModelConfig,KB::LanguageModelImplStub*>((uint64_t)(v10 + 3), (uint64_t)&v13);
    *(_QWORD *)(v5 + 8) = v10;
  }
  if (cf)
    CFRelease(cf);
  cf = 0;
  if (v18)
    CFRelease(v18);
  v18 = 0;
  if (v17)
    CFRelease(v17);
  v17 = 0;
  if (v16)
    CFRelease(v16);
  v16 = 0;
  if (v15)
    CFRelease(v15);
  v15 = 0;
  if (v14)
    CFRelease(v14);
  v14 = 0;
  if (v13)
    CFRelease(v13);

  result.__cntrl_ = v12;
  result.__ptr_ = v11;
  return result;
}

- (shared_ptr<KB::LanguageModel>)languageModelForAdaptationContext:(id)a3 languageLocales:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  int v15;
  LanguageModel *v16;
  __shared_weak_count *v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  id v21;
  shared_ptr<KB::LanguageModel> result;

  v6 = (objc_class *)MEMORY[0x1E0C99DC8];
  v7 = a4;
  v8 = a3;
  v21 = (id)objc_msgSend([v6 alloc], "initWithLocaleIdentifier:", self->_modelLocaleIdentifier);
  v20 = -[TILanguageModelLoader isMultilingualModel](self, "isMultilingualModel");
  -[TILanguageModelLoader customResourcePaths](self, "customResourcePaths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageModelLoader dynamicResourcePath](self, "dynamicResourcePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TILanguageModelLoader isMultiLingualModeEnabled](self, "isMultiLingualModeEnabled");
  v12 = -[TILanguageModelLoader isSiriMode](self, "isSiriMode");
  v13 = -[TILanguageModelLoader validEnglishTransformerMultilingualConfig](self, "validEnglishTransformerMultilingualConfig");
  -[TILanguageModelLoader trialParameters](self, "trialParameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[TILanguageModelLoader inlineCompletionPrecision](self, "inlineCompletionPrecision");
  BYTE4(v19) = -[TILanguageModelLoader isInlineCompletionEnabled](self, "isInlineCompletionEnabled");
  LODWORD(v19) = v15;
  BYTE2(v18) = v13;
  BYTE1(v18) = v12;
  LOBYTE(v18) = v11;
  +[TILanguageModelLoaderManager modelForLocale:isMultilingualModel:languageLocales:adaptationContext:staticResourcePaths:dynamicResourcePath:isMultiLingualModeEnabled:isSiriMode:validEnglishTransformerMultilingualConfig:trialParameters:inlineCompletionPrecision:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "modelForLocale:isMultilingualModel:languageLocales:adaptationContext:staticResourcePaths:dynamicResourcePath:isMultiLingualModeEnabled:isSiriMode:validEnglishTransformerMultilingualConfig:trialParameters:inlineCompletionPrecision:isInlineCompletionEnabled:", v21, v20, v7, v8, v9, v10, v18, v14, v19);

  result.__cntrl_ = v17;
  result.__ptr_ = v16;
  return result;
}

- (_ICContactFetchingDelegate)contactFetchingDelegate
{
  return self->_contactFetchingDelegate;
}

- (void)setContactFetchingDelegate:(id)a3
{
  self->_contactFetchingDelegate = (_ICContactFetchingDelegate *)a3;
}

- (void)setModel:(shared_ptr<KB::LanguageModel>)a3
{
  std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100](&self->_model.__ptr_, *(_QWORD *)a3.__ptr_, *((_QWORD *)a3.__ptr_ + 1));
}

- (NSString)modelLocaleIdentifier
{
  return self->_modelLocaleIdentifier;
}

- (BOOL)isMultilingualModel
{
  return self->_isMultilingualModel;
}

- (BOOL)isSiriMode
{
  return self->_isSiriMode;
}

- (BOOL)isMultiLingualModeEnabled
{
  return self->_multiLingualModeEnabled;
}

- (BOOL)validEnglishTransformerMultilingualConfig
{
  return self->_validEnglishTransformerMultilingualConfig;
}

- (NSArray)customResourcePaths
{
  return self->_customResourcePaths;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (void)setTrialParameters:(id)a3
{
  objc_storeStrong((id *)&self->_trialParameters, a3);
}

- (void)setInlineCompletionPrecision:(int)a3
{
  self->_inlineCompletionPrecision = a3;
}

- (BOOL)isInlineCompletionEnabled
{
  return self->_isInlineCompletionEnabled;
}

- (void)setIsInlineCompletionEnabled:(BOOL)a3
{
  self->_isInlineCompletionEnabled = a3;
}

- (void).cxx_destruct
{
  std::shared_ptr<language_modeling::v1::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&self->_model);
  objc_storeStrong((id *)&self->_trialParameters, 0);
  objc_storeStrong((id *)&self->_adaptationContext, 0);
  objc_storeStrong((id *)&self->_recipientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_mobileAssets, 0);
  objc_storeStrong((id *)&self->_dynamicResourcePath, 0);
  objc_storeStrong((id *)&self->_modelLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_customResourcePaths, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  return self;
}

void __78__TILanguageModelLoader_lookupRecordForRecipientIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v4 = v3;
  TIDispatchAsync();

}

void __78__TILanguageModelLoader_lookupRecordForRecipientIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 48);
  if (objc_msgSend(v7, "count"))
    v4 = v7;
  else
    v4 = 0;
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
  +[TILanguageModelLoaderManager recipientRecords](TILanguageModelLoaderManager, "recipientRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v6 = v7;
  else
    v6 = (id)MEMORY[0x1E0C9AA70];
  objc_msgSend(v5, "setObject:forKey:", v6, *(_QWORD *)(a1 + 40));

}

uint64_t __72__TILanguageModelLoader_findRecordsMatchingRecipient_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__TILanguageModelLoader_setLanguageModelClientIdentifier___block_invoke(uint64_t a1)
{
  id v1;
  __int128 v2;

  v2 = *(_OWORD *)(a1 + 32);
  v1 = (id)v2;
  TIDispatchAsync();

}

void __58__TILanguageModelLoader_setLanguageModelClientIdentifier___block_invoke_2(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "model");
  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v15 + 16))(v15);
  v3 = v2;
  if (!v16)
    goto LABEL_5;
  p_shared_owners = &v16->__shared_owners_;
  do
    v5 = __ldaxr((unint64_t *)p_shared_owners);
  while (__stlxr(v5 - 1, (unint64_t *)p_shared_owners));
  if (!v5)
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
    if (!v3)
      goto LABEL_16;
  }
  else
  {
LABEL_5:
    if (!v2)
      goto LABEL_16;
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v7)
  {
    objc_msgSend(v7, "model");
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }
  objc_msgSend(v7, "performLearningIfNecessaryForClient:withModel:", v6, &v13);
  v8 = v14;
  if (v14)
  {
    v9 = (unint64_t *)&v14->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
LABEL_16:
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

}

void __71__TILanguageModelLoader_performLearningIfNecessaryForClient_withModel___block_invoke(uint64_t a1)
{
  void *v2;
  TILanguageModelOfflineLearningStrategyMecabraFavonius *v3;

  v3 = -[TILanguageModelOfflineLearningStrategyMecabraFavonius initWithClientIdentifier:]([TILanguageModelOfflineLearningStrategyMecabraFavonius alloc], "initWithClientIdentifier:", *(_QWORD *)(a1 + 32));
  +[TILanguageModelOfflineLearningAgent sharedLearningAgent](TILanguageModelOfflineLearningAgent, "sharedLearningAgent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performLearningIfNecessaryWithStrategy:lastAdaptationTime:", v3, *(double *)(a1 + 40));

}

@end
