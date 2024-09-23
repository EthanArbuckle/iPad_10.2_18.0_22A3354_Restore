@implementation TIFilterParameterLoader

- (TIFilterParameterLoader)init
{
  TIFilterParameterLoader *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *loadQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIFilterParameterLoader;
  v2 = -[TIFilterParameterLoader init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.TextInput.TICandidateQualityParameterLoader", v4);
    loadQueue = v2->_loadQueue;
    v2->_loadQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)loadCandidateFilterSpecificationForLanguageIdentifier:(id)a3 targetQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TIFilterParameterLoader loadQueue](self, "loadQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9;
  v16 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  TIDispatchAsync();

}

- (id)loadCandidateFilterSpecificationForLanguageIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__9662;
  v14 = __Block_byref_object_dispose__9663;
  v15 = 0;
  -[TIFilterParameterLoader loadQueue](self, "loadQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  v6 = v4;
  TIDispatchSync();

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)loadContentsForPlistWithLanguage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  id v17;
  uint64_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (TI_IS_INTERNAL_INSTALL::once_token != -1)
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
  if (!TI_IS_INTERNAL_INSTALL::is_internal_install)
    goto LABEL_7;
  v4 = (void *)MEMORY[0x1E0C99E98];
  -[TIFilterParameterLoader universalParameterPlist](self, "universalParameterPlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIFilterParameterLoader parameterOverridesFolderURL](self, "parameterOverridesFolderURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:relativeToURL:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithContentsOfFile:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "path");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = 136315394;
    v20 = "-[TIFilterParameterLoader loadContentsForPlistWithLanguage:]";
    v21 = 2080;
    v22 = objc_msgSend(v17, "UTF8String");
    _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  Looking for candidate filter plist file under: %s", (uint8_t *)&v19, 0x16u);

  }
  if (!v10)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIFilterParameterLoader universalParameterPlist](self, "universalParameterPlist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pathForResource:ofType:", v12, &stru_1EA1081D0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v18 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      v19 = 136315394;
      v20 = "-[TIFilterParameterLoader loadContentsForPlistWithLanguage:]";
      v21 = 2080;
      v22 = v18;
      _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  Looking for candidate filter plist file under: %s", (uint8_t *)&v19, 0x16u);
    }

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    if (v10)
      v14 = CFSTR("True");
    else
      v14 = CFSTR("False");
    v15 = -[__CFString UTF8String](objc_retainAutorelease(v14), "UTF8String");
    v19 = 136315394;
    v20 = "-[TIFilterParameterLoader loadContentsForPlistWithLanguage:]";
    v21 = 2080;
    v22 = v15;
    _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s  A valid candidate filter plist was found: %s", (uint8_t *)&v19, 0x16u);
  }
  return v10;
}

- (id)parameterPlistForLanguage:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("candidate-filter-specification.%@.plist"), a3);
}

- (id)universalParameterPlist
{
  return CFSTR("candidate-filter-specification.plist");
}

- (id)parameterOverridesFolderURL
{
  void *v2;
  void *v3;
  void *v4;

  TI_KB_USER_DIRECTORY();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Filters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (OS_dispatch_queue)loadQueue
{
  return self->_loadQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadQueue, 0);
}

void __81__TIFilterParameterLoader_loadCandidateFilterSpecificationForLanguageIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "loadContentsForPlistWithLanguage:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __104__TIFilterParameterLoader_loadCandidateFilterSpecificationForLanguageIdentifier_targetQueue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "loadContentsForPlistWithLanguage:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 56);
  if (v3)
  {
    v5 = v3;
    v4 = v2;
    TIDispatchAsync();

  }
}

uint64_t __104__TIFilterParameterLoader_loadCandidateFilterSpecificationForLanguageIdentifier_targetQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
