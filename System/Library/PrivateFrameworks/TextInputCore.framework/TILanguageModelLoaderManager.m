@implementation TILanguageModelLoaderManager

+ (void)dropResourcesExcludingInputModes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)__sharedInstances, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v3;
  +[TILanguageModelLoaderManager modelLocalesForInputModes:](TILanguageModelLoaderManager, "modelLocalesForInputModes:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v5, "containsObject:", v12) & 1) == 0)
        {
          objc_msgSend((id)__sharedInstances, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "flushDynamicLearningCaches");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v20 = "+[TILanguageModelLoaderManager dropResourcesExcludingInputModes:]";
            v21 = 2112;
            v22 = v12;
            _os_log_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_DEFAULT, "%s  Dropping loader for model %@", buf, 0x16u);
          }
          objc_msgSend((id)__sharedInstances, "removeObjectForKey:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v8);
  }

}

+ (void)wireAllLanguageModelMemory
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)__sharedInstances, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend((id)__sharedInstances, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "wireLanguageModelMemory");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

+ (shared_ptr<KB::LanguageModel>)modelForLocale:(id)a3 isMultilingualModel:(BOOL)a4 languageLocales:(id)a5 adaptationContext:(id)a6 staticResourcePaths:(id)a7 dynamicResourcePath:(id)a8 isMultiLingualModeEnabled:(BOOL)a9 isSiriMode:(BOOL)a10 validEnglishTransformerMultilingualConfig:(BOOL)a11 trialParameters:(id)a12 inlineCompletionPrecision:(int)a13 isInlineCompletionEnabled:(BOOL)a14
{
  _OWORD *v14;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  const void *v26;
  const void *v27;
  int v28;
  __shared_weak_count *v29;
  LanguageModel *v30;
  _OWORD *v32;
  __int128 v33;
  CFTypeRef v34;
  CFTypeRef v35;
  CFTypeRef v36;
  CFTypeRef v37;
  CFTypeRef v38;
  CFTypeRef v39;
  CFTypeRef cf;
  shared_ptr<KB::LanguageModel> result;

  v32 = v14;
  v20 = a12;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a3;
  v26 = (const void *)objc_msgSend(v23, "appContext");
  v27 = (const void *)objc_msgSend(v23, "recipientContext");
  v28 = objc_msgSend(v23, "isOnline");

  KB::LanguageModelConfig::LanguageModelConfig((uint64_t)&v34, v25, a4, v24, v22, v21, v26, v27, v20, !a9, a10, v28 ^ 1, !a11, a13, a14);
  std::allocate_shared[abi:nn180100]<KB::LanguageModelStr,std::allocator<KB::LanguageModelStr>,KB::LanguageModelConfig,void>((std::__shared_weak_count **)&v33, (uint64_t)&v34);
  *v32 = v33;
  if (cf)
    CFRelease(cf);
  cf = 0;
  if (v39)
    CFRelease(v39);
  v39 = 0;
  if (v38)
    CFRelease(v38);
  v38 = 0;
  if (v37)
    CFRelease(v37);
  v37 = 0;
  if (v36)
    CFRelease(v36);
  v36 = 0;
  if (v35)
    CFRelease(v35);
  v35 = 0;
  v30 = (LanguageModel *)v34;
  if (v34)
    CFRelease(v34);
  result.__cntrl_ = v29;
  result.__ptr_ = v30;
  return result;
}

+ (shared_ptr<KB::LanguageModel>)stubForModelLocale:(id)a3 isMultilingualModel:(BOOL)a4 languageLocales:(id)a5 adaptationContext:(id)a6 staticResourcePaths:(id)a7 dynamicResourcePath:(id)a8 isMultiLingualModeEnabled:(BOOL)a9 isSiriMode:(BOOL)a10 isInlineCompletionEnabled:(BOOL)a11
{
  uint64_t *v11;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  const void *v21;
  const void *v22;
  _QWORD *v23;
  __shared_weak_count *v24;
  LanguageModel *v25;
  uint64_t *v27;
  CFTypeRef v28;
  CFTypeRef v29;
  CFTypeRef v30;
  CFTypeRef v31;
  CFTypeRef v32;
  CFTypeRef v33;
  CFTypeRef cf;
  shared_ptr<KB::LanguageModel> result;

  v27 = v11;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a3;
  v21 = (const void *)objc_msgSend(v18, "appContext");
  v22 = (const void *)objc_msgSend(v18, "recipientContext");

  KB::LanguageModelConfig::LanguageModelConfig((uint64_t)&v28, v20, a4, v19, v17, v16, v21, v22, 0, !a9, a10, 1, 1, 90, a11);
  v23 = operator new(0x138uLL);
  v23[1] = 0;
  v23[2] = 0;
  *v23 = &off_1EA0FF9A0;
  *v27 = std::construct_at[abi:nn180100]<KB::LanguageModelImplStub,KB::LanguageModelConfig,KB::LanguageModelImplStub*>((uint64_t)(v23 + 3), (uint64_t)&v28);
  v27[1] = (uint64_t)v23;
  if (cf)
    CFRelease(cf);
  cf = 0;
  if (v33)
    CFRelease(v33);
  v33 = 0;
  if (v32)
    CFRelease(v32);
  v32 = 0;
  if (v31)
    CFRelease(v31);
  v31 = 0;
  if (v30)
    CFRelease(v30);
  v30 = 0;
  if (v29)
    CFRelease(v29);
  v29 = 0;
  v25 = (LanguageModel *)v28;
  if (v28)
    CFRelease(v28);
  result.__cntrl_ = v24;
  result.__ptr_ = v25;
  return result;
}

+ (id)knownClients
{
  if (+[TILanguageModelLoaderManager knownClients]::dispatchOnce != -1)
    dispatch_once(&+[TILanguageModelLoaderManager knownClients]::dispatchOnce, &__block_literal_global_6723);
  return (id)+[TILanguageModelLoaderManager knownClients]::__knownClients;
}

+ (id)recipientRecords
{
  if (+[TILanguageModelLoaderManager recipientRecords]::dispatchOnce != -1)
    dispatch_once(&+[TILanguageModelLoaderManager recipientRecords]::dispatchOnce, &__block_literal_global_2);
  return (id)+[TILanguageModelLoaderManager recipientRecords]::__recipientRecords;
}

+ (id)sharedLanguageModelLoaderForModelLocaleIdentifier:(id)a3 isMultilingualModel:(BOOL)a4 customResourcePaths:(id)a5 dynamicResourcePath:(id)a6 mobileAssets:(id)a7 usesLinguisticContext:(BOOL)a8 isMultiLingualModeEnabled:(BOOL)a9 validEnglishTransformerMultilingualConfig:(BOOL)a10 isSiriMode:(BOOL)a11 trialParameters:(id)a12 isInlineCompletionEnabled:(BOOL)a13
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  id v32;
  void *v33;
  int v34;
  int v35;
  id v36;
  void *v37;
  int v38;
  int v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  _BOOL4 v44;
  BOOL v45;
  char v46;
  int v47;
  int v48;
  void *v49;
  void *v50;
  TILanguageModelLoader *v51;
  uint64_t v53;
  uint64_t v54;
  int v55;
  id v56;
  id v57;
  int InlineCompletionPrecision;
  _BOOL4 v59;
  _BOOL4 v60;

  v59 = a8;
  v60 = a4;
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a12;
  if (!__sharedInstances)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v22 = (void *)__sharedInstances;
    __sharedInstances = (uint64_t)v21;

    +[TILanguageModelLoaderManager startObservingContactStore](TILanguageModelLoaderManager, "startObservingContactStore");
  }
  if (a11)
  {
    objc_msgSend(v16, "stringByAppendingString:", CFSTR("_SiriMode"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = v16;
  }
  v24 = v23;
  objc_msgSend((id)__sharedInstances, "objectForKey:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  InlineCompletionPrecision = getInlineCompletionPrecision();
  v57 = v16;
  if (v17)
  {
    if (v25)
    {
      v26 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v25, "customResourcePaths");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setWithArray:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqualToSet:", v29);

      v31 = v30 ^ 1;
    }
    else
    {
      v31 = 1;
    }
    v55 = v31;
  }
  else
  {
    v55 = 0;
  }
  objc_msgSend(v25, "dynamicResourcePath");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v56 = v17;
  if (v32 == v18)
  {
    v35 = 0;
  }
  else
  {
    objc_msgSend(v25, "dynamicResourcePath");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isEqualToString:", v18);

    v35 = v34 ^ 1;
  }

  objc_msgSend(v25, "mobileAssets");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (v36 == v19)
  {
    v39 = 0;
  }
  else
  {
    objc_msgSend(v25, "mobileAssets");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isEqualToArray:", v19);

    v39 = v38 ^ 1;
  }

  if (v25)
    v40 = objc_msgSend(v25, "usesLinguisticContext") ^ v59;
  else
    v40 = 1;
  objc_msgSend(v25, "trialParameters");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v20)
    v43 = objc_msgSend(v41, "isEqualToDictionary:", v20);
  else
    v43 = v41 == 0;

  if (v25)
    v44 = objc_msgSend(v25, "inlineCompletionPrecision") != InlineCompletionPrecision;
  else
    v44 = 1;
  v45 = v60;
  if (v60)
  {
    v46 = _os_feature_enabled_impl();
    if (v25)
      v45 = 0;
    else
      v45 = v46;
  }
  if (v25)
    v47 = v35;
  else
    v47 = 1;
  if (v45 || (v48 = v47 | v39 | v40 | v55 | v43 ^ 1 | v44, (v48 & 1) != 0) || (!v60 & v48) != 0)
  {
    BYTE4(v54) = a13;
    LODWORD(v54) = InlineCompletionPrecision;
    BYTE2(v53) = a10;
    BYTE1(v53) = a11;
    LOBYTE(v53) = a9;
    v50 = v56;
    v49 = v57;
    v51 = -[TILanguageModelLoader initWithModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:isSiriMode:validEnglishTransformerMultilingualConfig:trialParameters:inlineCompletionPrecision:isInlineCompletionEnabled:]([TILanguageModelLoader alloc], "initWithModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:isSiriMode:validEnglishTransformerMultilingualConfig:trialParameters:inlineCompletionPrecision:isInlineCompletionEnabled:", v57, v60, v56, v18, v19, v59, v53, v20, v54);

    objc_msgSend((id)__sharedInstances, "setObject:forKey:", v51, v24);
    v25 = v51;
  }
  else
  {
    v50 = v56;
    v49 = v57;
  }

  return v25;
}

+ (void)clearDynamicResourcesAtPath:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = a3;
  v4 = (void *)__sharedInstances;
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__TILanguageModelLoaderManager_clearDynamicResourcesAtPath___block_invoke;
  v15[3] = &unk_1EA0FF800;
  v6 = v3;
  v16 = v6;
  objc_msgSend(v4, "keysOfEntriesPassingTest:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)__sharedInstances;
  objc_msgSend(v7, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectsForKeys:", v9);

  +[TILanguageModelLoaderManager knownClients](TILanguageModelLoaderManager, "knownClients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __60__TILanguageModelLoaderManager_clearDynamicResourcesAtPath___block_invoke_2;
  v13[3] = &unk_1EA0FF828;
  v14 = v6;
  v12 = v6;
  KB::LanguageModel::clear_dynamic_learning_bundles(v11, v13);

}

+ (void)clearDynamicLearningCaches
{
  objc_msgSend((id)__sharedInstances, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_14);
}

+ (void)flushDynamicLearningCaches
{
  objc_msgSend((id)__sharedInstances, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_15);
}

+ (void)flushDynamicResourcesForInputModes:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[TILanguageModelLoaderManager modelLocalesForInputModes:](TILanguageModelLoaderManager, "modelLocalesForInputModes:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__sharedInstances, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v15;
    v9 = MEMORY[0x1E0C81028];
    *(_QWORD *)&v6 = 136315394;
    v13 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v3, "containsObject:", v11, v13))
        {
          objc_msgSend((id)__sharedInstances, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            v19 = "+[TILanguageModelLoaderManager flushDynamicResourcesForInputModes:]";
            v20 = 2112;
            v21 = v11;
            _os_log_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_DEFAULT, "%s  Flushing dynamic learning caches for model %@", buf, 0x16u);
          }
          objc_msgSend(v12, "flushDynamicLearningCaches");

        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v7);
  }

}

+ (void)performMaintenance
{
  void *v2;

  +[TIKeyboardAssertionManager sharedAssertionManager](TIKeyboardAssertionManager, "sharedAssertionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "retainBackgroundActivityAssertion");

  KB::LanguageModel::perform_maintenance(&__block_literal_global_17);
}

+ (void)unwireAllLanguageModelMemory
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)__sharedInstances, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend((id)__sharedInstances, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "unwireLanguageModelMemory");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

+ (id)modelLocalesForInputModes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "preferredModelLocaleIdentifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "mutableCopy");

        if (objc_msgSend(v10, "isSiriMode"))
          objc_msgSend(v12, "appendString:", CFSTR("_SiriMode"));
        objc_msgSend(v4, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (void)startObservingContactStore
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel_contactStoreDidChange_, *MEMORY[0x1E0C96870], 0);

}

+ (void)contactStoreDidChange:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    +[TILanguageModelLoaderManager recipientRecords](TILanguageModelLoaderManager, "recipientRecords");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

  }
  else
  {
    objc_msgSend(a1, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v6, 1);
  }

}

void __50__TILanguageModelLoaderManager_performMaintenance__block_invoke()
{
  id v0;

  +[TIKeyboardAssertionManager sharedAssertionManager](TIKeyboardAssertionManager, "sharedAssertionManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "releaseBackgroundActivityAssertion");

}

void __58__TILanguageModelLoaderManager_flushDynamicLearningCaches__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "+[TILanguageModelLoaderManager flushDynamicLearningCaches]_block_invoke";
    v7 = 2112;
    v8 = a2;
    _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Flushing dynamic learning caches for %@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(v4, "flushDynamicLearningCaches");

}

void __58__TILanguageModelLoaderManager_clearDynamicLearningCaches__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "+[TILanguageModelLoaderManager clearDynamicLearningCaches]_block_invoke";
    v7 = 2112;
    v8 = a2;
    _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Clearing caches for input mode %@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(v4, "clearDynamicLearningCaches");

}

uint64_t __60__TILanguageModelLoaderManager_clearDynamicResourcesAtPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "dynamicResourcePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == *(void **)(a1 + 32))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "dynamicResourcePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  return v7;
}

void __60__TILanguageModelLoaderManager_clearDynamicResourcesAtPath___block_invoke_2(uint64_t a1, int a2)
{
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (!v4)
      return;
    v5 = *(_QWORD *)(a1 + 32);
    v9 = 136315394;
    v10 = "+[TILanguageModelLoaderManager clearDynamicResourcesAtPath:]_block_invoke_2";
    v11 = 2112;
    v12 = v5;
    v6 = MEMORY[0x1E0C81028];
    v7 = "%s  Removed dynamic resource bundles at %@";
  }
  else
  {
    if (!v4)
      return;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 136315394;
    v10 = "+[TILanguageModelLoaderManager clearDynamicResourcesAtPath:]_block_invoke";
    v11 = 2112;
    v12 = v8;
    v6 = MEMORY[0x1E0C81028];
    v7 = "%s  Could remove dynamic resource bundles at %@";
  }
  _os_log_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0x16u);
}

void __48__TILanguageModelLoaderManager_recipientRecords__block_invoke()
{
  TILRUDictionary *v0;
  void *v1;

  v0 = -[TILRUDictionary initWithMaximumCapacity:]([TILRUDictionary alloc], "initWithMaximumCapacity:", 10);
  v1 = (void *)+[TILanguageModelLoaderManager recipientRecords]::__recipientRecords;
  +[TILanguageModelLoaderManager recipientRecords]::__recipientRecords = (uint64_t)v0;

}

void __44__TILanguageModelLoaderManager_knownClients__block_invoke()
{
  TILRUDictionary *v0;
  void *v1;

  v0 = -[TILRUDictionary initWithMaximumCapacity:]([TILRUDictionary alloc], "initWithMaximumCapacity:", 10);
  v1 = (void *)+[TILanguageModelLoaderManager knownClients]::__knownClients;
  +[TILanguageModelLoaderManager knownClients]::__knownClients = (uint64_t)v0;

}

+ (void)setAsynchronousLoad:(BOOL)a3
{
  __asynchronousLoad = a3;
}

+ (void)setOfflineTrainingEnabled:(BOOL)a3
{
  __offlineTrainingEnabled = a3;
}

+ (void)resetClientAndRecipientCache
{
  void *v2;
  id v3;

  +[TILanguageModelLoaderManager knownClients](TILanguageModelLoaderManager, "knownClients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  +[TILanguageModelLoaderManager recipientRecords](TILanguageModelLoaderManager, "recipientRecords");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

@end
