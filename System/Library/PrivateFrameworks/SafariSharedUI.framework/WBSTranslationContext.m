@implementation WBSTranslationContext

- (WBSTranslationContext)initWithContentExtractor:(id)a3 contentFiller:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  WBSTranslationContext *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *internalQueue;
  _LTTranslator *v15;
  _LTTranslator *translator;
  WBSTranslationDiagnosticData *v17;
  WBSTranslationDiagnosticData *diagnosticData;
  WBSTranslationErrorController *v19;
  WBSTranslationErrorController *errorController;
  void *v21;
  WBSTranslationContext *v22;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)WBSTranslationContext;
  v12 = -[WBSTranslationContext init](&v24, sel_init);
  if (v12 && get_LTTranslatorClass())
  {
    v13 = dispatch_queue_create("com.apple.Safari.TranslationContext", 0);
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v13;

    v12->_synchronousIvarLock._os_unfair_lock_opaque = 0;
    v15 = (_LTTranslator *)objc_alloc_init(get_LTTranslatorClass());
    translator = v12->_translator;
    v12->_translator = v15;

    objc_storeStrong((id *)&v12->_contentExtractor, a3);
    -[WBSTranslationContentExtracting setExtractionDelegate:](v12->_contentExtractor, "setExtractionDelegate:", v12);
    objc_storeStrong((id *)&v12->_contentFiller, a4);
    -[WBSTranslationContentFilling setFillingDelegate:](v12->_contentFiller, "setFillingDelegate:", v12);
    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_storeWeak((id *)&v12->_contentTranslator, v12);
    objc_storeWeak((id *)&v12->_preferenceProvider, v12);
    objc_storeWeak((id *)&v12->_languageDetector, v12);
    v17 = objc_alloc_init(WBSTranslationDiagnosticData);
    diagnosticData = v12->_diagnosticData;
    v12->_diagnosticData = v17;

    v19 = objc_alloc_init(WBSTranslationErrorController);
    errorController = v12->_errorController;
    v12->_errorController = v19;

    -[WBSTranslationErrorController setDelegate:](v12->_errorController, "setDelegate:", v12);
    -[WBSTranslationContext _updateCachedAPISupportedValues](v12, "_updateCachedAPISupportedValues");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v12, sel__updateCachedAPISupportedValues, CFSTR("translationAvailabilityDidChange"), 0);

    v22 = v12;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (NSArray)availableTargetLocaleIdentifiers
{
  return (NSArray *)-[WBSTranslationContext _availableTargetLocaleIdentifiersConsideringCurrentWebpageLocale:](self, "_availableTargetLocaleIdentifiersConsideringCurrentWebpageLocale:", 1);
}

- (NSArray)allowedTargetLocaleIdentifiers
{
  os_unfair_lock_s *p_synchronousIvarLock;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__27;
  v16 = __Block_byref_object_dispose__27;
  v17 = 0;
  p_synchronousIvarLock = &self->_synchronousIvarLock;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__WBSTranslationContext_allowedTargetLocaleIdentifiers__block_invoke;
  v11[3] = &unk_1E5444748;
  v11[4] = self;
  v11[5] = &v12;
  performWithLock(&self->_synchronousIvarLock, v11);
  v5 = (void *)v13[5];
  if (!v5)
  {
    -[WBSTranslationContext _availableTargetLocaleIdentifiersConsideringCurrentWebpageLocale:](self, "_availableTargetLocaleIdentifiersConsideringCurrentWebpageLocale:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v13[5];
    v13[5] = v6;

    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __55__WBSTranslationContext_allowedTargetLocaleIdentifiers__block_invoke_2;
    v10[3] = &unk_1E5445AB0;
    v10[4] = self;
    v10[5] = &v12;
    performWithLock(p_synchronousIvarLock, v10);
    v5 = (void *)v13[5];
  }
  v8 = v5;
  _Block_object_dispose(&v12, 8);

  return (NSArray *)v8;
}

void __55__WBSTranslationContext_allowedTargetLocaleIdentifiers__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 272));
}

void __55__WBSTranslationContext_allowedTargetLocaleIdentifiers__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 272), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (BOOL)shouldOfferTranslationUI
{
  uint64_t v3;
  void *v5;
  BOOL v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__WBSTranslationContext_shouldOfferTranslationUI__block_invoke;
  v8[3] = &unk_1E5444748;
  v8[4] = self;
  v8[5] = &v9;
  performWithLock(&self->_synchronousIvarLock, v8);
  v3 = v10[3];
  if ((unint64_t)(v3 - 1) < 4 || v3 == 6)
  {
    -[WBSTranslationContext availableTargetLocaleIdentifiers](self, "availableTargetLocaleIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v9, 8);
  return v7;
}

uint64_t __49__WBSTranslationContext_shouldOfferTranslationUI__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 176);
  return result;
}

- (unint64_t)detectionNotificationLevel
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__27;
  v20 = __Block_byref_object_dispose__27;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__27;
  v14 = __Block_byref_object_dispose__27;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__WBSTranslationContext_detectionNotificationLevel__block_invoke;
  v9[3] = &unk_1E54472F0;
  v9[4] = self;
  v9[5] = &v22;
  v9[6] = &v16;
  v9[7] = &v10;
  performWithLock(&self->_synchronousIvarLock, v9);
  v3 = v23[3];
  if (v3 < 8 && ((0xFDu >> v3) & 1) != 0
    || (objc_msgSend((id)v17[5], "hideMessageInUnifiedField") & 1) != 0
    || !objc_msgSend((id)v11[5], "length")
    || (-[WBSTranslationContext availableTargetLocaleIdentifiers](self, "availableTargetLocaleIdentifiers"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        !v5))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend((id)v17[5], "userPreferredTargetLocales");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = preferredBaseLocalesContainBaseLocaleIdentifier(v6, (void *)v11[5]) ^ 1;

  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v7;
}

void __51__WBSTranslationContext_detectionNotificationLevel__block_invoke(_QWORD *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 176);
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 192));
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 184));
}

- (BOOL)hasStartedTranslating
{
  unsigned int v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__WBSTranslationContext_hasStartedTranslating__block_invoke;
  v4[3] = &unk_1E5444748;
  v4[4] = self;
  v4[5] = &v5;
  performWithLock(&self->_synchronousIvarLock, v4);
  v2 = ((unint64_t)v6[3] < 8) & (0xDCu >> v6[3]);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __46__WBSTranslationContext_hasStartedTranslating__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 176);
  return result;
}

- (unint64_t)state
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__WBSTranslationContext_state__block_invoke;
  v4[3] = &unk_1E5444748;
  v4[4] = self;
  v4[5] = &v5;
  performWithLock(&self->_synchronousIvarLock, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __30__WBSTranslationContext_state__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 176);
  return result;
}

- (NSString)webpageLocale
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__27;
  v9 = __Block_byref_object_dispose__27;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__WBSTranslationContext_webpageLocale__block_invoke;
  v4[3] = &unk_1E5444748;
  v4[4] = self;
  v4[5] = &v5;
  performWithLock(&self->_synchronousIvarLock, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __38__WBSTranslationContext_webpageLocale__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 184));
}

- (void)setPreferenceProvider:(id)a3
{
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (a3)
    v4 = a3;
  else
    v4 = self;
  v5 = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__WBSTranslationContext_setPreferenceProvider___block_invoke;
  v7[3] = &unk_1E5441848;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  performWithLock(&self->_synchronousIvarLock, v7);
  -[WBSTranslationContext _updateCachedAPISupportedValues](self, "_updateCachedAPISupportedValues");

}

id __47__WBSTranslationContext_setPreferenceProvider___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 192), *(id *)(a1 + 40));
}

- (WBSFluidProgressController)fluidProgressController
{
  id WeakRetained;
  _QWORD v4[6];
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = (id *)&v5;
  v7 = 0x3042000000;
  v8 = __Block_byref_object_copy__17;
  v9 = __Block_byref_object_dispose__18;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__WBSTranslationContext_fluidProgressController__block_invoke;
  v4[3] = &unk_1E5444748;
  v4[4] = self;
  v4[5] = &v5;
  performWithLock(&self->_synchronousIvarLock, v4);
  WeakRetained = objc_loadWeakRetained(v6 + 5);
  _Block_object_dispose(&v5, 8);
  objc_destroyWeak(&v10);
  return (WBSFluidProgressController *)WeakRetained;
}

void __48__WBSTranslationContext_fluidProgressController__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 264));
  objc_storeWeak((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), WeakRetained);

}

- (void)setFluidProgressController:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__WBSTranslationContext_setFluidProgressController___block_invoke;
  v6[3] = &unk_1E5441848;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  performWithLock(&self->_synchronousIvarLock, v6);

}

id __52__WBSTranslationContext_setFluidProgressController___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 264), *(id *)(a1 + 40));
}

- (WBSTranslationContextDelegate)delegate
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__27;
  v10 = __Block_byref_object_dispose__27;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__WBSTranslationContext_delegate__block_invoke;
  v5[3] = &unk_1E5444748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (WBSTranslationContextDelegate *)v3;
}

void __33__WBSTranslationContext_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (id)webpageLocaleInWebExtensionFormat
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_msgSend(CFSTR("und"), "copy");
  v4 = (void *)MEMORY[0x1E0C99DC8];
  -[WBSTranslationContext webpageLocale](self, "webpageLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeWithLocaleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safari_localeStringInWebExtensionFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v8 = v7;

    v3 = v8;
  }

  return v3;
}

- (void)cacheTextSamples:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__WBSTranslationContext_cacheTextSamples___block_invoke;
  v7[3] = &unk_1E5441848;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __42__WBSTranslationContext_cacheTextSamples___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v2 = *(os_unfair_lock_s **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__WBSTranslationContext_cacheTextSamples___block_invoke_2;
  v3[3] = &unk_1E5444748;
  v3[4] = v2;
  v3[5] = &v4;
  performWithLock(v2 + 43, v3);
  if (*((_BYTE *)v5 + 24))
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), *(id *)(a1 + 40));
  _Block_object_dispose(&v4, 8);
}

uint64_t __42__WBSTranslationContext_cacheTextSamples___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  BOOL v2;
  char v3;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 176);
  if (v1)
    v2 = v1 == 5;
  else
    v2 = 1;
  v3 = v2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v3;
  return result;
}

- (void)setWebpageLocaleUsingCachedTextSamplesIfNeeded:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__WBSTranslationContext_setWebpageLocaleUsingCachedTextSamplesIfNeeded___block_invoke;
  v7[3] = &unk_1E5443108;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __72__WBSTranslationContext_setWebpageLocaleUsingCachedTextSamplesIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  os_unfair_lock_s *v4;
  id v5;
  _QWORD v6[6];
  _QWORD v7[5];
  id v8;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 120);
    *(_QWORD *)(v2 + 120) = 0;
    v5 = v3;

    objc_msgSend(*(id *)(a1 + 32), "setWebpageLocaleWithExtractedTextSamples:url:completionHandler:", v5, 0, *(_QWORD *)(a1 + 40));
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3032000000;
    v7[3] = __Block_byref_object_copy__27;
    v7[4] = __Block_byref_object_dispose__27;
    v8 = 0;
    v4 = *(os_unfair_lock_s **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__WBSTranslationContext_setWebpageLocaleUsingCachedTextSamplesIfNeeded___block_invoke_2;
    v6[3] = &unk_1E5444748;
    v6[4] = v4;
    v6[5] = v7;
    performWithLock(v4 + 43, v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    _Block_object_dispose(v7, 8);

  }
}

void __72__WBSTranslationContext_setWebpageLocaleUsingCachedTextSamplesIfNeeded___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 184));
}

- (void)setWebpageLocaleWithExtractedTextSamples:(id)a3 url:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke;
  v15[3] = &unk_1E5445B50;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_copyWeak(&v19, &location);
  dispatch_async(internalQueue, v15);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id WeakRetained;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  id v22;
  _QWORD v23[7];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__27;
  v34 = __Block_byref_object_dispose__27;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__27;
  v28 = __Block_byref_object_dispose__27;
  v29 = 0;
  v2 = *(os_unfair_lock_s **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_2;
  v23[3] = &unk_1E5446FB0;
  v23[4] = v2;
  v23[5] = &v30;
  v23[6] = &v24;
  performWithLock(v2 + 43, v23);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 168) = 0;
  v4 = objc_msgSend(*(id *)(a1 + 40), "count");
  v5 = objc_msgSend((id)v31[5], "isTranslationEnabled");
  if (v4)
    v6 = v5;
  else
    v6 = 0;
  if (v6 == 1)
  {
    v7 = *(id *)(a1 + 40);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v37;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v8);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v11), "length"))
          {

            WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
            v15 = *(_QWORD *)(a1 + 40);
            v16 = *(_QWORD *)(a1 + 48);
            v17[0] = v3;
            v17[1] = 3221225472;
            v17[2] = __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_20;
            v17[3] = &unk_1E5447340;
            objc_copyWeak(&v22, (id *)(a1 + 64));
            v20 = *(id *)(a1 + 56);
            v18 = *(id *)(a1 + 48);
            v21 = &v30;
            v19 = *(id *)(a1 + 40);
            objc_msgSend(WeakRetained, "dominantLocaleForTextSamples:url:completionHandler:", v15, v16, v17);

            objc_destroyWeak(&v22);
            goto LABEL_19;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
  v12 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_cold_1(a1, v4, v12);
  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
    (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, v25[5]);
LABEL_19:
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

void __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 192));
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 184));
}

void __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 64));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_2_21;
    block[3] = &unk_1E5447318;
    block[4] = WeakRetained;
    v14 = v5;
    v15 = *(id *)(a1 + 32);
    v18 = *(id *)(a1 + 48);
    v10 = v6;
    v11 = *(_QWORD *)(a1 + 56);
    v16 = v10;
    v19 = v11;
    v17 = *(id *)(a1 + 40);
    dispatch_async(v9, block);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
  }

}

void __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_2_21(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  os_unfair_lock_s *v15;
  os_unfair_lock_s *v16;
  id v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  _QWORD v42[8];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[2];
  _QWORD v60[2];
  uint8_t buf[4];
  id v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__27;
  v53 = __Block_byref_object_dispose__27;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__27;
  v47 = __Block_byref_object_dispose__27;
  v48 = 0;
  v2 = *(os_unfair_lock_s **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_3;
  v42[3] = &unk_1E54472F0;
  v42[4] = v2;
  v42[5] = &v55;
  v42[6] = &v49;
  v42[7] = &v43;
  performWithLock(v2 + 43, v42);
  v4 = v56[3];
  if (v4 > 7 || ((1 << v4) & 0xDC) == 0 && (v4 != 1 || !objc_msgSend((id)v50[5], "length")))
  {
    v10 = *(void **)(a1 + 40);
    if (!v10)
      v10 = *(void **)(a1 + 56);
    v11 = v10;
    v12 = v56[3];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "userPreferredTargetLocales");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    availablePreferredTargetLocalesFilteredBySupportedLocales(v13, (void *)v44[5], v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *(os_unfair_lock_s **)(a1 + 32);
    v16 = v15 + 43;
    v39[0] = v3;
    v39[1] = 3221225472;
    v39[2] = __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_22;
    v39[3] = &unk_1E5441870;
    v39[4] = v15;
    v17 = v11;
    v40 = v17;
    v18 = v14;
    v41 = v18;
    performWithLock(v16, v39);
    v19 = objc_msgSend(*(id *)(a1 + 32), "detectionNotificationLevel");
    if (!objc_msgSend(*(id *)(a1 + 40), "length"))
    {
      v25 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = *(void **)(a1 + 56);
        v27 = objc_msgSend(*(id *)(a1 + 64), "count");
        loggingStringForTextSampleArray(*(void **)(a1 + 64));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138544131;
        v62 = v26;
        v63 = 2048;
        v64 = v27;
        v65 = 2114;
        v66 = v28;
        v67 = 2117;
        v68 = v29;
        _os_log_impl(&dword_1A840B000, v25, OS_LOG_TYPE_DEFAULT, "Unable to determine webpage locale, likely because it's the unsupported language '%{public}@'; used %lu text s"
          "ample(s) of length(s): %{public}@. URL: %{sensitive}@",
          buf,
          0x2Au);

      }
      logTextSamplesIfNeededPreservingPrivacy(*(void **)(a1 + 64));
      goto LABEL_28;
    }
    v20 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = objc_msgSend(*(id *)(a1 + 64), "count");
      loggingStringForTextSampleArray(*(void **)(a1 + 64));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544131;
      v62 = v17;
      v63 = 2048;
      v64 = v21;
      v65 = 2114;
      v66 = v22;
      v67 = 2117;
      v68 = v23;
      _os_log_impl(&dword_1A840B000, v20, OS_LOG_TYPE_INFO, "Detected webpage locale as %{public}@ from %lu text sample(s) of length(s): %{public}@. URL: %{sensitive}@", buf, 0x2Au);

    }
    logTextSamplesIfNeededPreservingPrivacy(*(void **)(a1 + 64));
    if (v12 == 5)
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "isEqualToString:", v17))
      {
        v24 = WBS_LOG_CHANNEL_PREFIXTranslation();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v62 = v17;
          _os_log_impl(&dword_1A840B000, v24, OS_LOG_TYPE_DEFAULT, "Automatically translating into locale '%{public}@' since the previous page was the same domain and locale", buf, 0xCu);
        }
        objc_msgSend(*(id *)(a1 + 32), "_requestTranslatingWebpageToLocale:requestType:completionHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), 1, 0);
        goto LABEL_28;
      }
      v30 = WBS_LOG_CHANNEL_PREFIXTranslation();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
        *(_DWORD *)buf = 138543618;
        v62 = v31;
        v63 = 2114;
        v64 = (uint64_t)v17;
        _os_log_impl(&dword_1A840B000, v30, OS_LOG_TYPE_INFO, "Not Automatically translating webpage because the source locales don't match; previous page locale: '%{public}"
          "@'; current page locale '%{public}@'",
          buf,
          0x16u);
      }
    }
    v59[0] = CFSTR("webpageLanguage");
    v59[1] = CFSTR("notificationLevel");
    v60[0] = v17;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "postNotificationName:object:userInfo:", CFSTR("translationDetectionDidChange"), *(_QWORD *)(a1 + 32), v33);

LABEL_28:
    objc_msgSend(*(id *)(a1 + 32), "_reportLanguageDetectionAnalyticsForWebpageLocale:notificationLevel:", v17, v19);
    v35 = *(_QWORD *)(a1 + 72);
    if (v35)
      (*(void (**)(uint64_t, id))(v35 + 16))(v35, v17);

    goto LABEL_31;
  }
  if (objc_msgSend((id)v50[5], "isEqualToString:", *(_QWORD *)(a1 + 40)))
  {
    v5 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (void *)v50[5];
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543619;
      v62 = v6;
      v63 = 2117;
      v64 = v7;
      _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_INFO, "Already detected that this page is locale '%{public}@; won't fire detection notification again; URL: %{sensitive}@",
        buf,
        0x16u);
    }
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v36 = (void *)v50[5];
      v37 = *(_QWORD *)(a1 + 40);
      v38 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543875;
      v62 = v36;
      v63 = 2114;
      v64 = v37;
      v65 = 2117;
      v66 = v38;
      _os_log_fault_impl(&dword_1A840B000, v8, OS_LOG_TYPE_FAULT, "Previously detected this page was locale '%{public}@' but now it changed to '%{public}@'; unable to proceed with"
        " translation. URL: %{sensitive}@",
        buf,
        0x20u);
    }
  }
  v9 = *(_QWORD *)(a1 + 72);
  if (v9)
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v50[5]);
LABEL_31:
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);
}

void __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_3(_QWORD *a1)
{
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 176);
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 184));
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 200));
}

uint64_t __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_22(id *a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;

  v2 = objc_msgSend(a1[5], "copy");
  v3 = a1[4];
  v4 = (void *)v3[23];
  v3[23] = v2;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", *((_QWORD *)a1[4] + 23));
  objc_msgSend(v5, "languageCode");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  v8 = (void *)v7[36];
  v7[36] = v6;

  objc_storeStrong((id *)a1[4] + 35, a1[6]);
  return objc_msgSend(a1[4], "_setState:usingLock:", 1, 0);
}

- (void)validateTargetLocale:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__WBSTranslationContext_validateTargetLocale_completionHandler___block_invoke;
  block[3] = &unk_1E54432C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __64__WBSTranslationContext_validateTargetLocale_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_validateTargetLocaleSynchronously:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)requestTranslatingWebpageToLocale:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__WBSTranslationContext_requestTranslatingWebpageToLocale_completionHandler___block_invoke;
  block[3] = &unk_1E54432C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __77__WBSTranslationContext_requestTranslatingWebpageToLocale_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestTranslatingWebpageToLocale:requestType:completionHandler:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

- (void)requestSendFeedbackForTranslationIssue:(int64_t)a3
{
  id WeakRetained;
  NSObject *internalQueue;
  id v7;
  _QWORD block[5];
  id v9;
  int64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__WBSTranslationContext_requestSendFeedbackForTranslationIssue___block_invoke;
  block[3] = &unk_1E5444D10;
  v9 = WeakRetained;
  v10 = a3;
  block[4] = self;
  v7 = WeakRetained;
  dispatch_async(internalQueue, block);

}

void __64__WBSTranslationContext_requestSendFeedbackForTranslationIssue___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  uint8_t buf[16];

  v2 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_DEFAULT, "User reported translation issue", buf, 2u);
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__WBSTranslationContext_requestSendFeedbackForTranslationIssue___block_invoke_26;
  v5[3] = &unk_1E5447368;
  v4 = (void *)a1[5];
  v3 = a1[6];
  v6 = (id)a1[4];
  v8 = v3;
  v7 = v4;
  objc_msgSend(v6, "generateDiagnosticDataForPurpose:completionHandler:", 0, v5);

}

void __64__WBSTranslationContext_requestSendFeedbackForTranslationIssue___block_invoke_26(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = a1[4];
  v5 = (void *)a1[5];
  v6 = *(NSObject **)(v4 + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __64__WBSTranslationContext_requestSendFeedbackForTranslationIssue___block_invoke_2;
  v8[3] = &unk_1E5444DA0;
  v8[1] = 3221225472;
  v12 = a1[6];
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v7 = v3;
  dispatch_async(v6, v8);

}

void __64__WBSTranslationContext_requestSendFeedbackForTranslationIssue___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *v7;
  WBSLocalePair *v8;
  WBSLocalePair *v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v2 = objc_alloc_init(get_LTTranslationFeedbackClass());
  objc_msgSend(v2, "setCategory:", *(_QWORD *)(a1 + 56) | objc_msgSend(v2, "category"));
  objc_msgSend(*(id *)(a1 + 32), "extractedParagraphsAsJSON");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSourceContentAsJSON:", v3);

  objc_msgSend(*(id *)(a1 + 32), "translatedParagraphsAsJSON");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTargetContentAsJSON:", v4);

  objc_msgSend(*(id *)(a1 + 32), "errorsAsJSON");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setErrorsAsJSON:", v5);

  objc_msgSend(v2, "setWebpageURL:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  objc_msgSend(*(id *)(a1 + 48), "safariApplicationVersionForTranslationContext:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSafariVersion:", v6);

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__27;
  v16 = __Block_byref_object_dispose__27;
  v17 = 0;
  v7 = *(os_unfair_lock_s **)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__WBSTranslationContext_requestSendFeedbackForTranslationIssue___block_invoke_3;
  v11[3] = &unk_1E5444748;
  v11[4] = v7;
  v11[5] = &v12;
  performWithLock(v7 + 43, v11);
  v8 = [WBSLocalePair alloc];
  v9 = -[WBSLocalePair initWithSourceLocaleIdentifier:targetLocaleIdentifier:](v8, "initWithSourceLocaleIdentifier:targetLocaleIdentifier:", v13[5], *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
  -[WBSLocalePair lt_localePair](v9, "lt_localePair");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocalePair:", v10);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "provideFeedback:", v2);
  _Block_object_dispose(&v12, 8);

}

void __64__WBSTranslationContext_requestSendFeedbackForTranslationIssue___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 184));
}

- (void)requestSendFeedbackWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5443108;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_31;
    v6[3] = &unk_1E5447408;
    v6[4] = v3;
    v7 = WeakRetained;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v7, "translationContext:showFeedbackConsentAlertWithCompletionHandler:", v3, v6);

  }
  else
  {
    v4 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_cold_1(v4);
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
  }

}

void __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_31(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  char v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 8);
  v6[2] = __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E54473E0;
  v6[1] = 3221225472;
  v9 = a2;
  v6[4] = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  dispatch_async(v5, v6);

}

void __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;
  uint8_t buf[4];
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
  {
    v2 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 56))
        v3 = CFSTR("YES");
      else
        v3 = CFSTR("NO");
      v4 = v3;
      *(_DWORD *)buf = 138543362;
      v13 = v4;
      _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_DEFAULT, "User responded to translation feedback consent prompt with result: %{public}@", buf, 0xCu);

    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_32;
    v7[3] = &unk_1E54473B8;
    v5 = *(void **)(a1 + 40);
    v8 = *(id *)(a1 + 32);
    v9 = v5;
    v10 = *(id *)(a1 + 48);
    v11 = *(_BYTE *)(a1 + 56);
    objc_msgSend(v8, "generateDiagnosticDataForPurpose:completionHandler:", 0, v7);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }
}

void __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  char v13;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  block[2] = __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_2_33;
  block[3] = &unk_1E5447390;
  block[1] = 3221225472;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v12 = *(id *)(a1 + 48);
  v13 = *(_BYTE *)(a1 + 56);
  v7 = v3;
  dispatch_async(v6, block);

}

void __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_2_33(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *v7;
  WBSLocalePair *v8;
  WBSLocalePair *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v2 = objc_alloc_init(get_LTTranslationFeedbackClass());
  objc_msgSend(*(id *)(a1 + 32), "extractedParagraphsAsJSON");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSourceContentAsJSON:", v3);

  objc_msgSend(*(id *)(a1 + 32), "translatedParagraphsAsJSON");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTargetContentAsJSON:", v4);

  objc_msgSend(*(id *)(a1 + 32), "errorsAsJSON");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setErrorsAsJSON:", v5);

  objc_msgSend(v2, "setWebpageURL:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "safariApplicationVersionForTranslationContext:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSafariVersion:", v6);

  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__27;
  v17 = __Block_byref_object_dispose__27;
  v18 = 0;
  v7 = *(os_unfair_lock_s **)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_3;
  v12[3] = &unk_1E5444748;
  v12[4] = v7;
  v12[5] = &v13;
  performWithLock(v7 + 43, v12);
  v8 = [WBSLocalePair alloc];
  v9 = -[WBSLocalePair initWithSourceLocaleIdentifier:targetLocaleIdentifier:](v8, "initWithSourceLocaleIdentifier:targetLocaleIdentifier:", v14[5], *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
  -[WBSLocalePair lt_localePair](v9, "lt_localePair");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocalePair:", v10);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "provideFeedback:", v2);
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, *(unsigned __int8 *)(a1 + 64));
  _Block_object_dispose(&v13, 8);

}

void __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 184));
}

- (void)_requestTranslatingWebpageToLocale:(id)a3 requestType:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke;
  v12[3] = &unk_1E5447430;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a4;
  v10 = v8;
  v11 = v9;
  -[WBSTranslationContext _promptIfNeededToConsentToTranslationWithCompletionHandler:](self, "_promptIfNeededToConsentToTranslationWithCompletionHandler:", v12);

}

void __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  os_unfair_lock_s *v4;
  void *v5;
  os_unfair_lock_s *v6;
  WBSTranslationScrollInteractionAnalyticsHelper *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  uint8_t *v31;
  uint8_t v32[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v3 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_37;
    block[3] = &unk_1E5441CB8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    *(_QWORD *)v32 = 0;
    v33 = v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__27;
    v36 = __Block_byref_object_dispose__27;
    v37 = 0;
    v29[2] = __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_2;
    v29[3] = &unk_1E5446958;
    v4 = *(os_unfair_lock_s **)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v6 = v4 + 43;
    v29[0] = v3;
    v29[1] = 3221225472;
    v31 = v32;
    v29[4] = v4;
    v30 = v5;
    performWithLock(v6, v29);
    v7 = objc_alloc_init(WBSTranslationScrollInteractionAnalyticsHelper);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 136);
    *(_QWORD *)(v8 + 136) = v7;

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v26[0] = v3;
      v26[1] = 3221225472;
      v26[2] = __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_3;
      v26[3] = &unk_1E5441848;
      v11 = WeakRetained;
      v12 = *(_QWORD *)(a1 + 32);
      v27 = v11;
      v28 = v12;
      v13 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v26);

    }
    v14 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *((_QWORD *)v33 + 5);
      v16 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v40 = v15;
      v41 = 2114;
      v42 = v16;
      _os_log_impl(&dword_1A840B000, v14, OS_LOG_TYPE_DEFAULT, "Translating page from '%{public}@' to '%{public}@'", buf, 0x16u);
    }
    v17 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 72);
    *(_QWORD *)(v18 + 72) = v17;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "beginExtractingContent");
    objc_msgSend(*(id *)(a1 + 32), "_startProgressForExtractingContent");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v20 = *(_QWORD *)(a1 + 32);
      v24[0] = v3;
      v24[1] = 3221225472;
      v24[2] = __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_45;
      v24[3] = &unk_1E5443478;
      v24[4] = v20;
      v25 = *(id *)(a1 + 48);
      objc_msgSend(WeakRetained, "translationContext:urlForCurrentPageWithCompletionHandler:", v20, v24);

    }
    else
    {
      v23 = *(_QWORD *)(a1 + 48);
      if (v23)
        (*(void (**)(void))(v23 + 16))();
    }
    objc_msgSend(*(id *)(a1 + 32), "_reportRequestedTranslationAnalyticsForWebpageLocale:targetLocale:requestType:", *((_QWORD *)v33 + 5), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

    _Block_object_dispose(v32, 8);
  }
  else
  {
    v21 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1A840B000, v21, OS_LOG_TYPE_DEFAULT, "User didn't consent to use Translation, won't proceed", v32, 2u);
    }
    v22 = *(_QWORD *)(a1 + 48);
    if (v22)
      (*(void (**)(void))(v22 + 16))();
  }
}

void __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_37(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "translationContextWillRequestTranslatingWebpage:", *(_QWORD *)(a1 + 32));

}

uint64_t __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 184));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "languageCode");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 288);
  *(_QWORD *)(v4 + 288) = v3;

  return objc_msgSend(*(id *)(a1 + 32), "_setState:usingLock:", 2, 0);
}

uint64_t __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "translationContextNeedsScrollHeightVisibilityUpdate:", *(_QWORD *)(a1 + 40));
}

void __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_2_46;
  block[3] = &unk_1E54432C0;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_2_46(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t result;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setURLString:", v2);

  objc_msgSend(*(id *)(a1 + 40), "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_highLevelDomainFromHost");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v4;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)reloadPageInOriginalLanguage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__WBSTranslationContext_reloadPageInOriginalLanguage__block_invoke;
  block[3] = &unk_1E5441CB8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __53__WBSTranslationContext_reloadPageInOriginalLanguage__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "translationContextReloadPageInOriginalLanguage:", *(_QWORD *)(a1 + 32));

}

- (void)owningWebViewDidCommitNavigationWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__WBSTranslationContext_owningWebViewDidCommitNavigationWithURL_completionHandler___block_invoke;
  block[3] = &unk_1E54432C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __83__WBSTranslationContext_owningWebViewDidCommitNavigationWithURL_completionHandler___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  os_unfair_lock_s *v16;
  os_unfair_lock_s *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  WBSTranslationDiagnosticData *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t result;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  _QWORD v40[8];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;

  if ((objc_msgSend(*(id *)(a1 + 32), "_restoreContextSnapshotIfNeeded:forURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__27;
    v57 = __Block_byref_object_dispose__27;
    v58 = 0;
    v47 = 0;
    v48 = &v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__27;
    v51 = __Block_byref_object_dispose__27;
    v52 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__27;
    v45 = __Block_byref_object_dispose__27;
    v46 = 0;
    v2 = *(os_unfair_lock_s **)(a1 + 32);
    v3 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __83__WBSTranslationContext_owningWebViewDidCommitNavigationWithURL_completionHandler___block_invoke_2;
    v40[3] = &unk_1E54472F0;
    v40[4] = v2;
    v40[5] = &v53;
    v40[6] = &v47;
    v40[7] = &v41;
    performWithLock(v2 + 43, v40);
    v4 = objc_msgSend(*(id *)(a1 + 32), "_nextURLIsEligibleForContinuedTranslation:", *(_QWORD *)(a1 + 40));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 160);
    *(_QWORD *)(v5 + 160) = 0;

    v7 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      objc_storeStrong((id *)(v7 + 144), *(id *)(v7 + 72));
      v8 = *(_QWORD *)(a1 + 32);
      v9 = (id)v54[5];
      v10 = *(void **)(v8 + 152);
      *(_QWORD *)(v8 + 152) = v9;
      v11 = 5;
    }
    else
    {
      v12 = *(void **)(v7 + 144);
      *(_QWORD *)(v7 + 144) = 0;

      v11 = 0;
      v13 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v13 + 152);
      *(_QWORD *)(v13 + 152) = 0;
    }

    objc_msgSend((id)v48[5], "userPreferredTargetLocales");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    availablePreferredTargetLocalesFilteredBySupportedLocales(v14, (void *)v42[5], 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(os_unfair_lock_s **)(a1 + 32);
    v17 = v16 + 43;
    v37[0] = v3;
    v37[1] = 3221225472;
    v37[2] = __83__WBSTranslationContext_owningWebViewDidCommitNavigationWithURL_completionHandler___block_invoke_3;
    v37[3] = &unk_1E5444D10;
    v37[4] = v16;
    v39 = v11;
    v18 = v15;
    v38 = v18;
    performWithLock(v17, v37);
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(v19 + 72);
    *(_QWORD *)(v19 + 72) = 0;

    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(v21 + 96);
    *(_QWORD *)(v21 + 96) = 0;

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v47, 8);

    _Block_object_dispose(&v53, 8);
  }
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 88);
  *(_QWORD *)(v23 + 88) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "stopExtractingContent");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "_cancelProgressForNavigation:", 1);
  v25 = objc_alloc_init(WBSTranslationDiagnosticData);
  v26 = *(_QWORD *)(a1 + 32);
  v27 = *(void **)(v26 + 80);
  *(_QWORD *)(v26 + 80) = v25;

  v28 = *(_QWORD *)(a1 + 32);
  v29 = *(void **)(v28 + 112);
  *(_QWORD *)(v28 + 112) = 0;

  v30 = *(_QWORD *)(a1 + 32);
  v31 = *(void **)(v30 + 120);
  *(_QWORD *)(v30 + 120) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 129) = 0;
  v32 = *(_QWORD *)(a1 + 32);
  v33 = *(void **)(v32 + 136);
  *(_QWORD *)(v32 + 136) = 0;

  v34 = *(_QWORD *)(a1 + 32);
  v35 = *(void **)(v34 + 24);
  *(_QWORD *)(v34 + 24) = 0;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __83__WBSTranslationContext_owningWebViewDidCommitNavigationWithURL_completionHandler___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 184));
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 192));
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 200));
}

void __83__WBSTranslationContext_owningWebViewDidCommitNavigationWithURL_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_setState:usingLock:", *(_QWORD *)(a1 + 48), 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 184);
  *(_QWORD *)(v2 + 184) = 0;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 280), *(id *)(a1 + 40));
}

- (void)owningWebViewWillNavigateAndSaveCurrentSnapshotToStore:(id)a3 isEligibleForContinuedTranslation:(BOOL)a4
{
  NSObject *internalQueue;
  id v7;
  _QWORD block[6];
  BOOL v9;
  _QWORD v10[5];
  id v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__27;
  v10[4] = __Block_byref_object_dispose__27;
  v11 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__WBSTranslationContext_owningWebViewWillNavigateAndSaveCurrentSnapshotToStore_isEligibleForContinuedTranslation___block_invoke;
  block[3] = &unk_1E5447458;
  block[4] = self;
  block[5] = v10;
  v9 = a4;
  v7 = v11;
  dispatch_async(internalQueue, block);
  _Block_object_dispose(v10, 8);

}

void __114__WBSTranslationContext_owningWebViewWillNavigateAndSaveCurrentSnapshotToStore_isEligibleForContinuedTranslation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 168) = *(_BYTE *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_currentSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_safari_setTranslationContextSnapshot:", v4);

  WBSReleaseOnMainQueueImpl();
}

- (void)owningWebViewWillNavigateToBackForwardListItemWithSnapshotStore:(id)a3 inPageCache:(BOOL)a4
{
  NSObject *internalQueue;
  id v7;
  _QWORD block[6];
  BOOL v9;
  _QWORD v10[5];
  id v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__27;
  v10[4] = __Block_byref_object_dispose__27;
  v11 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__WBSTranslationContext_owningWebViewWillNavigateToBackForwardListItemWithSnapshotStore_inPageCache___block_invoke;
  block[3] = &unk_1E5447458;
  v9 = a4;
  block[4] = self;
  block[5] = v10;
  v7 = v11;
  dispatch_async(internalQueue, block);
  _Block_object_dispose(v10, 8);

}

void __101__WBSTranslationContext_owningWebViewWillNavigateToBackForwardListItemWithSnapshotStore_inPageCache___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  objc_msgSend(v5, "_safari_translationContextSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_safari_setTranslationContextSnapshot:", 0);
  if (v4 && *(_BYTE *)(a1 + 48))
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), v4);

  WBSReleaseOnMainQueueImpl();
}

- (void)setContentTranslator:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__WBSTranslationContext_setContentTranslator___block_invoke;
  v7[3] = &unk_1E5441848;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

id __46__WBSTranslationContext_setContentTranslator___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (void)generateDiagnosticDataForPurpose:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke;
  block[3] = &unk_1E5445200;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  _QWORD v29[4];
  id v30;
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  NSObject *v34;

  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 80), "copy");
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v4 = (void *)a1[4];
  objc_msgSend(v2, "extractedParagraphs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1[6];
  v7 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke_2;
  v32[3] = &unk_1E5447480;
  v8 = v2;
  v33 = v8;
  v9 = v3;
  v34 = v9;
  objc_msgSend(v4, "_generateJSONVersionOfContent:forPurpose:completionHandler:", v5, v6, v32);

  dispatch_group_enter(v9);
  v10 = (void *)a1[4];
  objc_msgSend(v8, "translatedParagraphs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a1[6];
  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke_3;
  v29[3] = &unk_1E5447480;
  v13 = v8;
  v30 = v13;
  v14 = v9;
  v31 = v14;
  objc_msgSend(v10, "_generateJSONVersionOfContent:forPurpose:completionHandler:", v11, v12, v29);

  dispatch_group_enter(v14);
  v15 = (id *)a1[4];
  objc_msgSend(v15[10], "errors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v7;
  v26[1] = 3221225472;
  v26[2] = __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke_4;
  v26[3] = &unk_1E5447480;
  v17 = v13;
  v27 = v17;
  v28 = v14;
  v18 = v14;
  objc_msgSend(v15, "_generateJSONVersionOfErrors:completionHandler:", v16, v26);

  v19 = a1[4];
  v20 = (void *)a1[5];
  v21 = *(NSObject **)(v19 + 8);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke_5;
  block[3] = &unk_1E54417E0;
  block[4] = v19;
  v24 = v17;
  v25 = v20;
  v22 = v17;
  dispatch_group_notify(v18, v21, block);

}

void __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setExtractedParagraphsAsJSON:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setTranslatedParagraphsAsJSON:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setErrorsAsJSON:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke_5(uint64_t a1)
{
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_sync_exit(obj);

}

- (void)updateMaxVisibleHeightPercentageIfNeeded:(double)a3 userDriven:(BOOL)a4
{
  NSObject *internalQueue;
  _QWORD block[6];
  BOOL v6;

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__WBSTranslationContext_updateMaxVisibleHeightPercentageIfNeeded_userDriven___block_invoke;
  block[3] = &unk_1E54474A8;
  v6 = a4;
  block[4] = self;
  *(double *)&block[5] = a3;
  dispatch_async(internalQueue, block);
}

uint64_t __77__WBSTranslationContext_updateMaxVisibleHeightPercentageIfNeeded_userDriven___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "recordFirstInteractionIfNeeded");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "updateMaxVisibleHeightPercentage:", *(double *)(a1 + 40));
}

- (BOOL)isTranslationEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WBSTranslationEnabledSettingsKey"));

  return v3;
}

- (BOOL)hasConsentedToFirstTimeAlert
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WBSTranslationConsentedToFirstTimeAlertSettingsKey"));

  return v3;
}

- (void)setConsentedToFirstTimeAlert:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("WBSTranslationConsentedToFirstTimeAlertSettingsKey"));

}

- (BOOL)isContinuedTranslationEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WBSTranslationEnableContinuedTranslationSettingsKey"));

  return v3;
}

- (BOOL)debugAlwaysShowConsentAlert
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WBSTranslationDebugAlwaysShowConsentAlertSettingsKey"));

  return v3;
}

- (BOOL)hideMessageInUnifiedField
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WBSTranslationHideMessageInUnifiedFieldSettingsKey"));

  return v3;
}

- (BOOL)debugDelayLanguageDetection
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WBSTranslationDebugDelayLanguageDetectionSettingsKey"));

  return v3;
}

- (id)userPreferredTargetLocales
{
  void *v2;
  void *v3;

  +[WBSTranslationAvailability sharedAvailability](WBSTranslationAvailability, "sharedAvailability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPreferredTargetLocales");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)supportedLocalePairsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__WBSTranslationContext_supportedLocalePairsWithCompletionHandler___block_invoke;
  block[3] = &unk_1E54423D0;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, block);

}

void __67__WBSTranslationContext_supportedLocalePairsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  +[WBSTranslationAvailability sharedAvailability](WBSTranslationAvailability, "sharedAvailability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__WBSTranslationContext_supportedLocalePairsWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5443B08;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "getAvailableLocalePairsWithCompletionHandler:", v3);

}

void __67__WBSTranslationContext_supportedLocalePairsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = 134217984;
    v7 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_INFO, "API supports %lu locale pairs", (uint8_t *)&v6, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)isTranslationSupportedForCurrentRegionWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__WBSTranslationContext_isTranslationSupportedForCurrentRegionWithCompletionHandler___block_invoke;
  block[3] = &unk_1E54423D0;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, block);

}

void __85__WBSTranslationContext_isTranslationSupportedForCurrentRegionWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  +[WBSTranslationAvailability sharedAvailability](WBSTranslationAvailability, "sharedAvailability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__WBSTranslationContext_isTranslationSupportedForCurrentRegionWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5441E68;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "getTranslationAvailabilityWithCompletionHandler:", v3);

}

uint64_t __85__WBSTranslationContext_isTranslationSupportedForCurrentRegionWithCompletionHandler___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  __CFString *v5;
  __CFString *v6;
  int v8;
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("NO");
    if (a2)
      v5 = CFSTR("YES");
    v6 = v5;
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1A840B000, v4, OS_LOG_TYPE_INFO, "Translation supported in current region: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)translationContext:(id)a3 translateWebpageContents:(id)a4 toTargetLocale:(id)a5 translationHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *internalQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  internalQueue = self->_internalQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke;
  v16[3] = &unk_1E54423F8;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(internalQueue, v16);

}

void __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  void *v31;
  _QWORD v32[6];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[6];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__27;
  v51 = __Block_byref_object_dispose__27;
  v52 = 0;
  v2 = *(os_unfair_lock_s **)(a1 + 32);
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke_2;
  v46[3] = &unk_1E5444748;
  v46[4] = v2;
  v46[5] = &v47;
  performWithLock(v2 + 43, v46);
  v3 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v26 = objc_msgSend(*(id *)(a1 + 40), "count");
    v27 = v48[5];
    v28 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134218498;
    v57 = v26;
    v58 = 2114;
    v59 = v27;
    v60 = 2114;
    v61 = v28;
    _os_log_debug_impl(&dword_1A840B000, v3, OS_LOG_TYPE_DEBUG, "Translating %lu paragraphs from locale '%{public}@' to locale '%{public}@'", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v31, "BOOLForKey:", CFSTR("WBSTranslationUseTranslationAPIsSettingsKey")) & 1) != 0)
  {
    if (get_LTParagraphTranslationRequestClass())
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      obj = *(id *)(a1 + 40);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v53, 16);
      if (v5)
      {
        v30 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v35 != v30)
              objc_enumerationMutation(obj);
            v7 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            v8 = objc_alloc(get_LTParagraphTranslationRequestClass());
            objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v48[5]);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(a1 + 48));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = (void *)objc_msgSend(v8, "initWithSourceLocale:targetLocale:", v9, v10);

            objc_msgSend(v7, "safari_updateTranslationRequest:", v11);
            v32[0] = MEMORY[0x1E0C809B0];
            v32[1] = 3221225472;
            v32[2] = __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke_55;
            v32[3] = &unk_1E54474D0;
            v32[4] = *(_QWORD *)(a1 + 32);
            v12 = *(id *)(a1 + 56);
            v32[5] = v7;
            v33 = v12;
            objc_msgSend(v11, "setCompletionHandler:", v32);
            if (objc_msgSend(v31, "BOOLForKey:", CFSTR("WBSTranslationForceOnlineTranslationSettingsKey")))objc_msgSend(v11, "set_forcedOnlineTranslation:", 1);
            if (objc_msgSend(v31, "BOOLForKey:", CFSTR("WBSTranslationSetWebpageTranslationTaskSettingsKey")))objc_msgSend(v11, "setTaskHint:", 2);
            objc_msgSend(v4, "addObject:", v11);

          }
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v53, 16);
        }
        while (v5);
      }

      objc_msgSend(*(id *)(a1 + 32), "_currentSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "translate:", v4);

    }
    else
    {
      v20 = WBS_LOG_CHANNEL_PREFIXTranslation();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke_cold_1();
      v40 = 0u;
      v41 = 0u;
      v39 = 0u;
      v38 = 0u;
      v4 = *(id *)(a1 + 40);
      v21 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v39 != v22)
              objc_enumerationMutation(v4);
            v24 = *(_QWORD *)(a1 + 56);
            objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, _QWORD, void *, _QWORD))(v24 + 16))(v24, 0, v25, 0);

          }
          v21 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
        }
        while (v21);
      }
    }
  }
  else
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v4 = *(id *)(a1 + 40);
    v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v43;
      do
      {
        for (k = 0; k != v14; ++k)
        {
          if (*(_QWORD *)v43 != v15)
            objc_enumerationMutation(v4);
          v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * k);
          v18 = *(_QWORD *)(a1 + 56);
          objc_msgSend(v17, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, void *, _QWORD))(v18 + 16))(v18, v17, v19, 0);

        }
        v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      }
      while (v14);
    }
  }

  _Block_object_dispose(&v47, 8);
}

void __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 184));
}

void __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke_55(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke_2_56;
  v11[3] = &unk_1E5443388;
  v12 = v5;
  v8 = *(id *)(a1 + 48);
  v14 = v6;
  v15 = v8;
  v13 = *(_QWORD *)(a1 + 40);
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

void __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke_2_56(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CEF6F0], "safari_textManipulationItemWithTranslationResult:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, _QWORD))(v2 + 16))(v2, v4, v3, *(_QWORD *)(a1 + 48));

}

- (void)_computeVisibleParagraphsIfDuringInitialExtraction:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;
  id obj;
  os_unfair_lock_s *p_synchronousIvarLock;
  WBSTranslationContext *v17;
  uint64_t v18;
  _QWORD v19[6];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __76__WBSTranslationContext__computeVisibleParagraphsIfDuringInitialExtraction___block_invoke;
  v24[3] = &unk_1E5444748;
  v24[4] = self;
  v24[5] = &v25;
  p_synchronousIvarLock = &self->_synchronousIvarLock;
  v17 = self;
  performWithLock(&self->_synchronousIvarLock, v24);
  if (!*((_BYTE *)v26 + 24))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = v14;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
    if (v4)
    {
      v18 = *(_QWORD *)v21;
      v5 = *MEMORY[0x1E0CEF820];
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v6);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          objc_msgSend(v7, "tokens");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v30;
            while (2)
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v30 != v10)
                  objc_enumerationMutation(v8);
                objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v11), "userInfo");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v12, "safari_BOOLForKey:", v5);

                if ((v13 & 1) != 0)
                {

                  v19[0] = MEMORY[0x1E0C809B0];
                  v19[1] = 3221225472;
                  v19[2] = __76__WBSTranslationContext__computeVisibleParagraphsIfDuringInitialExtraction___block_invoke_2;
                  v19[3] = &unk_1E5441848;
                  v19[4] = v17;
                  v19[5] = v7;
                  performWithLock(p_synchronousIvarLock, v19);
                  goto LABEL_17;
                }
                ++v11;
              }
              while (v9 != v11);
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
              if (v9)
                continue;
              break;
            }
          }

LABEL_17:
          ++v6;
        }
        while (v6 != v4);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
      }
      while (v4);
    }

  }
  _Block_object_dispose(&v25, 8);

}

uint64_t __76__WBSTranslationContext__computeVisibleParagraphsIfDuringInitialExtraction___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 249);
  return result;
}

void __76__WBSTranslationContext__computeVisibleParagraphsIfDuringInitialExtraction___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 232);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 232);
    *(_QWORD *)(v4 + 232) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 232);
  }
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
}

- (void)contentExtractor:(id)a3 didExtractContent:(id)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  WBSTranslationContext *v10;
  id v11;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke;
  v8[3] = &unk_1E5444618;
  v9 = v5;
  v10 = self;
  v7 = v5;
  objc_copyWeak(&v11, &location);
  dispatch_async(internalQueue, v8);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  if (objc_msgSend(a1[4], "count")
    && (objc_msgSend(a1[4], "firstObject"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "tokens"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count"),
        v3,
        v2,
        v4))
  {
    objc_msgSend(a1[5], "_updateProgressWithExtractedParagraphCount:", objc_msgSend(a1[4], "count"));
    objc_msgSend(*((id *)a1[5] + 10), "addExtractedParagraphs:", a1[4]);
    objc_msgSend(a1[5], "_setState:usingLock:", 3, 1);
    WeakRetained = objc_loadWeakRetained((id *)a1[5] + 4);
    objc_msgSend(a1[5], "_computeVisibleParagraphsIfDuringInitialExtraction:", a1[4]);
    v7 = a1[4];
    v6 = a1[5];
    v8 = v6[9];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_60;
    v10[3] = &unk_1E5447548;
    objc_copyWeak(&v12, a1 + 6);
    v11 = a1[4];
    objc_msgSend(WeakRetained, "translationContext:translateWebpageContents:toTargetLocale:translationHandler:", v6, v7, v8, v10);

    objc_destroyWeak(&v12);
  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_cold_1();
  }
}

void __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_60(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject **WeakRetained;
  NSObject **v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_2;
    block[3] = &unk_1E5447520;
    block[4] = WeakRetained;
    v14 = v7;
    v15 = v9;
    v16 = v8;
    v17 = *(id *)(a1 + 32);
    dispatch_async(v12, block);

  }
}

void __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  NSObject *v8;
  os_unfair_lock_s *v9;
  os_unfair_lock_s *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v2 = *(os_unfair_lock_s **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_3;
  v24[3] = &unk_1E5444748;
  v24[4] = v2;
  v24[5] = &v25;
  performWithLock(v2 + 43, v24);
  v4 = v26[3];
  v5 = v4 > 6;
  v6 = (1 << v4) & 0x58;
  if (v5 || v6 == 0)
  {
    v15 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "safari_privacyPreservingDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v16;
      _os_log_impl(&dword_1A840B000, v15, OS_LOG_TYPE_INFO, "The webpage likely navigated before translation results came back; not filling paragraph into page: %{public}@",
        buf,
        0xCu);

    }
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v17 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 48), "safari_privacyPreservingDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      *(_DWORD *)buf = 138543875;
      v30 = v17;
      v31 = 2114;
      v32 = v18;
      v33 = 2117;
      v34 = v19;
      _os_log_error_impl(&dword_1A840B000, v8, OS_LOG_TYPE_ERROR, "Error translating request for paragraph '%{public}@': %{public}@; webpage URL: %{sensitive}@",
        buf,
        0x20u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "addError:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addError:forParagraphIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v9 = *(os_unfair_lock_s **)(a1 + 32);
    v10 = v9 + 43;
    v22[0] = v3;
    v22[1] = 3221225472;
    v22[2] = __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_61;
    v22[3] = &unk_1E5441848;
    v22[4] = v9;
    v23 = *(id *)(a1 + 56);
    performWithLock(v10, v22);
    objc_msgSend(*(id *)(a1 + 32), "_updateProgressWithTranslatedParagraphCount:", 1);

  }
  else
  {
    v11 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "safari_privacyPreservingDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v30 = v12;
      _os_log_impl(&dword_1A840B000, v11, OS_LOG_TYPE_INFO, "Translated text with result: %{private}@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addTranslatedParagraph:", *(_QWORD *)(a1 + 40));
    v20[0] = v3;
    v20[1] = 3221225472;
    v20[2] = __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_62;
    v20[3] = &unk_1E54474F8;
    v13 = *(void **)(a1 + 64);
    v21 = *(id *)(a1 + 56);
    objc_msgSend(v13, "safari_firstObjectPassingTest:", v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "replaceExtractedContent:withTranslatedContent:targetLocale:", v14, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    objc_msgSend(*(id *)(a1 + 32), "_setState:usingLock:", 4, 1);

  }
  _Block_object_dispose(&v25, 8);
}

uint64_t __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_3(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 176);
  return result;
}

uint64_t __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_61(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_62(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)contentExtractorDidFinishExtractingInitialContent:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__WBSTranslationContext_contentExtractorDidFinishExtractingInitialContent___block_invoke;
  block[3] = &unk_1E5441CB8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __75__WBSTranslationContext_contentExtractorDidFinishExtractingInitialContent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateProgressForFinishingInitialContentExtraction");
}

- (id)targetLocaleForContentExtractor:(id)a3
{
  return self->_targetLocale;
}

- (id)sourceLocaleForContentExtractor:(id)a3
{
  return self->_webpageLocale;
}

- (void)contentFiller:(id)a3 didCompleteFillingItem:(id)a4 withError:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v7 = a4;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__WBSTranslationContext_contentFiller_didCompleteFillingItem_withError___block_invoke;
  v17[3] = &unk_1E5441848;
  v17[4] = self;
  v10 = v7;
  v18 = v10;
  performWithLock(&self->_synchronousIvarLock, v17);
  internalQueue = self->_internalQueue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __72__WBSTranslationContext_contentFiller_didCompleteFillingItem_withError___block_invoke_2;
  block[3] = &unk_1E5441870;
  block[4] = self;
  v15 = v8;
  v16 = v10;
  v12 = v10;
  v13 = v8;
  dispatch_async(internalQueue, block);

}

void __72__WBSTranslationContext_contentFiller_didCompleteFillingItem_withError___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 232);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObject:", v2);

}

void __72__WBSTranslationContext_contentFiller_didCompleteFillingItem_withError___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_updateProgressWithTranslatedParagraphCount:", 1);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = WBS_LOG_CHANNEL_PREFIXTranslation();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __72__WBSTranslationContext_contentFiller_didCompleteFillingItem_withError___block_invoke_2_cold_2((void **)(a1 + 40), v4, a1);
    v5 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      v7 = 138739971;
      v8 = v6;
      _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_INFO, "Failed to fill translated content on page with URL: %{sensitive}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __72__WBSTranslationContext_contentFiller_didCompleteFillingItem_withError___block_invoke_2_cold_1(a1, v4);
  }
}

- (void)dominantLocaleForTextSamples:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  objc_class *LTTranslatorClass;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  if (TranslationLibraryCore())
  {
    getkLTUnknownLanguageCode();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __72__WBSTranslationContext_dominantLocaleForTextSamples_completionHandler___block_invoke;
    v16 = &unk_1E5447570;
    v8 = v7;
    v17 = v8;
    v18 = v6;
    v9 = (void *)MEMORY[0x1A85D45E4](&v13);
    get_LTTranslatorClass();
    v10 = objc_opt_respondsToSelector();
    LTTranslatorClass = get_LTTranslatorClass();
    if ((v10 & 1) != 0)
      -[objc_class languagesForText:usingModel:strategy:useDedicatedTextMachPort:completion:](LTTranslatorClass, "languagesForText:usingModel:strategy:useDedicatedTextMachPort:completion:", v5, 0, 2, 0, v9, v13, v14, v15, v16, v17);
    else
      -[objc_class languagesForText:completion:](LTTranslatorClass, "languagesForText:completion:", v5, v9, v13, v14, v15, v16, v17);

  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[WBSTranslationContext dominantLocaleForTextSamples:completionHandler:].cold.1();
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

void __72__WBSTranslationContext_dominantLocaleForTextSamples_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "dominantLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    goto LABEL_4;
  objc_msgSend(v7, "unsupportedLanguageCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_highestFrequencyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {

LABEL_4:
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)dominantLocaleForTextSamples:(id)a3 url:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  dispatch_time_t v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __76__WBSTranslationContext_dominantLocaleForTextSamples_url_completionHandler___block_invoke;
  v24[3] = &unk_1E5447598;
  objc_copyWeak(&v28, &location);
  v12 = v8;
  v25 = v12;
  v13 = v9;
  v26 = v13;
  v14 = v10;
  v27 = v14;
  v15 = (void (**)(_QWORD))MEMORY[0x1A85D45E4](v24);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__27;
  v22 = __Block_byref_object_dispose__27;
  v23 = 0;
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __76__WBSTranslationContext_dominantLocaleForTextSamples_url_completionHandler___block_invoke_2;
  v17[3] = &unk_1E5444748;
  v17[4] = self;
  v17[5] = &v18;
  performWithLock(&self->_synchronousIvarLock, v17);
  if (objc_msgSend((id)v19[5], "debugDelayLanguageDetection"))
  {
    v16 = dispatch_time(0, 3000000000);
    dispatch_after(v16, (dispatch_queue_t)self->_internalQueue, v15);
  }
  else
  {
    v15[2](v15);
  }
  _Block_object_dispose(&v18, 8);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

void __76__WBSTranslationContext_dominantLocaleForTextSamples_url_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_dominantLocaleForTextSamples:url:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    WeakRetained = v3;
  }

}

void __76__WBSTranslationContext_dominantLocaleForTextSamples_url_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)_dominantLocaleForTextSamples:(id)a3 url:(id)a4 completionHandler:(id)a5
{
  -[WBSTranslationContext dominantLocaleForTextSamples:completionHandler:](self, "dominantLocaleForTextSamples:completionHandler:", a3, a5);
}

- (void)errorController:(id)a3 didReachThresholdForError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id WeakRetained;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  id v17;
  void *v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __67__WBSTranslationContext_errorController_didReachThresholdForError___block_invoke;
  v19[3] = &unk_1E5444748;
  v19[4] = self;
  v19[5] = &v20;
  performWithLock(&self->_synchronousIvarLock, v19);
  if (v21[3] == 6)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_impl(&dword_1A840B000, v8, OS_LOG_TYPE_DEFAULT, "Not showing error alert since we've already shown an error on this page; new error: %{public}@",
        buf,
        0xCu);

    }
  }
  else
  {
    -[WBSTranslationContext _userVisibleErrorMessageForError:](self, "_userVisibleErrorMessageForError:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[WBSTranslationContext _cancelProgressForNavigation:](self, "_cancelProgressForNavigation:", 0);
      -[WBSTranslationContext _setState:usingLock:](self, "_setState:usingLock:", 6, 1);
      _WBSLocalizedString();
      v10 = objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v12 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "safari_privacyPreservingDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v25 = v13;
          _os_log_impl(&dword_1A840B000, v12, OS_LOG_TYPE_DEFAULT, "Showing user error message because its threshold was met: %{public}@", buf, 0xCu);

        }
        objc_msgSend(WeakRetained, "translationContext:showTranslationErrorAlertWithTitle:message:", self, v10, v8);
      }
      else
      {
        v15 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "safari_privacyPreservingDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSTranslationContext errorController:didReachThresholdForError:].cold.1(v17, v18, buf, v15);
        }

      }
    }
    else
    {
      v10 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "safari_privacyPreservingDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v14;
        _os_log_impl(&dword_1A840B000, v10, OS_LOG_TYPE_DEFAULT, "Not showing error alert to user because it hasn't been added to the error message allow-list: %{public}@", buf, 0xCu);

      }
    }

  }
  _Block_object_dispose(&v20, 8);

}

uint64_t __67__WBSTranslationContext_errorController_didReachThresholdForError___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 176);
  return result;
}

- (BOOL)createFluidProgressState
{
  os_unfair_lock_s *p_synchronousIvarLock;
  uint64_t v4;
  WBSFluidProgressState *v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__27;
  v14 = __Block_byref_object_dispose__27;
  v15 = 0;
  p_synchronousIvarLock = &self->_synchronousIvarLock;
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__WBSTranslationContext_createFluidProgressState__block_invoke;
  v9[3] = &unk_1E5444748;
  v9[4] = self;
  v9[5] = &v10;
  performWithLock(&self->_synchronousIvarLock, v9);
  if (!v11[5])
  {
    v5 = -[WBSFluidProgressState initWithType:]([WBSFluidProgressState alloc], "initWithType:", 0);
    v6 = (void *)v11[5];
    v11[5] = (uint64_t)v5;

    objc_msgSend((id)v11[5], "setHasCommittedLoad:", 1);
    objc_msgSend((id)v11[5], "setFluidProgressAnimationPhase:", 0);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __49__WBSTranslationContext_createFluidProgressState__block_invoke_2;
    v8[3] = &unk_1E5445AB0;
    v8[4] = self;
    v8[5] = &v10;
    performWithLock(p_synchronousIvarLock, v8);
  }
  _Block_object_dispose(&v10, 8);

  return 1;
}

void __49__WBSTranslationContext_createFluidProgressState__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 256));
}

void __49__WBSTranslationContext_createFluidProgressState__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 256), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)clearFluidProgressState
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__WBSTranslationContext_clearFluidProgressState__block_invoke;
  v3[3] = &unk_1E5441CB8;
  v3[4] = self;
  performWithLock(&self->_synchronousIvarLock, v3);
  -[WBSTranslationContext _notifyDelegateToReportProgressInUnifiedField:](self, "_notifyDelegateToReportProgressInUnifiedField:", 0);
}

void __48__WBSTranslationContext_clearFluidProgressState__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 256);
  *(_QWORD *)(v1 + 256) = 0;

}

- (id)expectedOrCurrentURL
{
  return 0;
}

- (id)progressState
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__27;
  v9 = __Block_byref_object_dispose__27;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__WBSTranslationContext_progressState__block_invoke;
  v4[3] = &unk_1E5444748;
  v4[4] = self;
  v4[5] = &v5;
  performWithLock(&self->_synchronousIvarLock, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __38__WBSTranslationContext_progressState__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 256));
}

- (double)_estimatedProgressWithScope:(int64_t)a3
{
  unint64_t v3;
  double v4;
  _QWORD v6[10];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__WBSTranslationContext__estimatedProgressWithScope___block_invoke;
  v6[3] = &unk_1E54475C0;
  v6[4] = self;
  v6[5] = &v19;
  v6[6] = &v15;
  v6[7] = &v11;
  v6[8] = &v7;
  v6[9] = a3;
  performWithLock(&self->_synchronousIvarLock, v6);
  v3 = v20[3];
  v4 = 1.0;
  if (v3 <= 6 && ((1 << v3) & 0x5C) != 0)
  {
    if (*((_BYTE *)v16 + 24))
      v4 = fmin((double)(unint64_t)v8[3] / (double)(unint64_t)v12[3], 1.0);
    else
      v4 = 0.0;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v4;
}

_QWORD *__53__WBSTranslationContext__estimatedProgressWithScope___block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = result;
  *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(result[4] + 176);
  *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = *(_BYTE *)(result[4] + 249);
  v2 = result[9];
  if (v2 == 1)
  {
    *(_QWORD *)(*(_QWORD *)(result[7] + 8) + 24) = *(_QWORD *)(result[4] + 240);
    v4 = result[4];
    v5 = *(_QWORD *)(v4 + 240);
    result = (_QWORD *)objc_msgSend(*(id *)(v4 + 232), "count");
    v3 = v5 - (_QWORD)result;
  }
  else
  {
    if (v2)
      return result;
    *(_QWORD *)(*(_QWORD *)(result[7] + 8) + 24) = *(_QWORD *)(result[4] + 216);
    v3 = *(_QWORD *)(result[4] + 224);
  }
  *(_QWORD *)(*(_QWORD *)(v1[8] + 8) + 24) = v3;
  return result;
}

- (double)estimatedProgress
{
  double result;

  -[WBSTranslationContext _estimatedProgressWithScope:](self, "_estimatedProgressWithScope:", 1);
  return result;
}

- (BOOL)hasFailedURL
{
  BOOL v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__WBSTranslationContext_hasFailedURL__block_invoke;
  v4[3] = &unk_1E5444748;
  v4[4] = self;
  v4[5] = &v5;
  performWithLock(&self->_synchronousIvarLock, v4);
  v2 = v6[3] == 6;
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __37__WBSTranslationContext_hasFailedURL__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 176);
  return result;
}

- (id)_availableTargetLocaleIdentifiersConsideringCurrentWebpageLocale:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[10];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v3 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__27;
  v40 = __Block_byref_object_dispose__27;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__27;
  v34 = __Block_byref_object_dispose__27;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__27;
  v28 = __Block_byref_object_dispose__27;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__27;
  v22 = __Block_byref_object_dispose__27;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__WBSTranslationContext__availableTargetLocaleIdentifiersConsideringCurrentWebpageLocale___block_invoke;
  v13[3] = &unk_1E54475E8;
  v13[4] = self;
  v13[5] = &v36;
  v13[6] = &v30;
  v13[7] = &v24;
  v13[8] = &v18;
  v13[9] = &v14;
  performWithLock(&self->_synchronousIvarLock, v13);
  if ((objc_msgSend((id)v37[5], "isTranslationEnabled") & 1) == 0
    || !-[WBSTranslationContext _translationSupportedInCurrentRegion](self, "_translationSupportedInCurrentRegion"))
  {
    goto LABEL_6;
  }
  if (!v3)
  {
    objc_msgSend((id)v37[5], "userPreferredTargetLocales");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    availablePreferredTargetLocalesFilteredBySupportedLocales(v9, (void *)v19[5], 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  v6 = v15[3];
  if (v6 <= 7 && (((1 << v6) & 0xDC) != 0 || v6 == 1 && !objc_msgSend((id)v31[5], "length")))
  {
LABEL_6:
    v7 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_7;
  }
  v10 = (id)v25[5];
LABEL_9:
  if (objc_msgSend((id)v31[5], "length") && v3)
  {
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __90__WBSTranslationContext__availableTargetLocaleIdentifiersConsideringCurrentWebpageLocale___block_invoke_2;
    v12[3] = &unk_1E5447610;
    v12[4] = &v30;
    objc_msgSend(v10, "safari_filterObjectsUsingBlock:", v12);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v10;
  }
  v7 = v11;

LABEL_7:
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v7;
}

void __90__WBSTranslationContext__availableTargetLocaleIdentifiersConsideringCurrentWebpageLocale___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 192));
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 184));
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 280));
  objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), *(id *)(a1[4] + 200));
  *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = *(_QWORD *)(a1[4] + 176);
}

uint64_t __90__WBSTranslationContext__availableTargetLocaleIdentifiersConsideringCurrentWebpageLocale___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)) ^ 1;
}

- (BOOL)_validateTargetLocaleSynchronously:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  _QWORD v12[9];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v4 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__27;
  v33 = __Block_byref_object_dispose__27;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__27;
  v23 = __Block_byref_object_dispose__27;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__27;
  v17 = __Block_byref_object_dispose__27;
  v18 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__WBSTranslationContext__validateTargetLocaleSynchronously___block_invoke;
  v12[3] = &unk_1E5447198;
  v12[4] = self;
  v12[5] = &v29;
  v12[6] = &v25;
  v12[7] = &v19;
  v12[8] = &v13;
  performWithLock(&self->_synchronousIvarLock, v12);
  if ((objc_msgSend((id)v30[5], "isTranslationEnabled") & 1) != 0
    && -[WBSTranslationContext _translationSupportedInCurrentRegion](self, "_translationSupportedInCurrentRegion")
    && v26[3] == 1
    && objc_msgSend((id)v20[5], "length"))
  {
    objc_msgSend((id)v30[5], "userPreferredTargetLocales");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((preferredBaseLocalesContainBaseLocaleIdentifier(v6, v4) & 1) != 0
      && (objc_msgSend(v4, "isEqualToString:", v20[5]) & 1) == 0)
    {
      v7 = (void *)v14[5];
      if (v7)
      {
        v9[0] = v5;
        v9[1] = 3221225472;
        v9[2] = __60__WBSTranslationContext__validateTargetLocaleSynchronously___block_invoke_2;
        v9[3] = &unk_1E5447638;
        v11 = &v19;
        v10 = v4;
        LOBYTE(v7) = objc_msgSend(v7, "safari_containsObjectPassingTest:", v9);

      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return (char)v7;
}

void __60__WBSTranslationContext__validateTargetLocaleSynchronously___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 192));
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 176);
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 184));
  objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), *(id *)(a1[4] + 200));
}

uint64_t __60__WBSTranslationContext__validateTargetLocaleSynchronously___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = a2;
  objc_msgSend(v4, "sourceLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isEqualToString:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "targetLocaleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v6, "isEqualToString:", v7);
  return v3 & v6;
}

- (void)_updateCachedAPISupportedValues
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id from;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  id location;

  objc_initWeak(&location, self);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__27;
  v18 = __Block_byref_object_dispose__27;
  v19 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke;
  v13[3] = &unk_1E5445AB0;
  v13[4] = self;
  v13[5] = &v14;
  performWithLock(&self->_synchronousIvarLock, v13);
  objc_initWeak(&from, (id)v15[5]);
  v4 = (void *)v15[5];
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_2;
  v9[3] = &unk_1E5447660;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  objc_msgSend(v4, "isTranslationSupportedForCurrentRegionWithCompletionHandler:", v9);
  v5 = (void *)v15[5];
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_4;
  v6[3] = &unk_1E54476B0;
  objc_copyWeak(&v7, &location);
  v6[4] = &v14;
  objc_copyWeak(&v8, &from);
  objc_msgSend(v5, "supportedLocalePairsWithCompletionHandler:", v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  _Block_object_dispose(&v14, 8);

  objc_destroyWeak(&location);
}

void __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 272);
  *(_QWORD *)(v2 + 272) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 200);
  *(_QWORD *)(v4 + 200) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 208);
  *(_QWORD *)(v6 + 208) = 0;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = WeakRetained;

}

void __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_2(uint64_t a1, char a2)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v5;
  _QWORD v6[5];
  id v7;
  char v8;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_3;
    v6[3] = &unk_1E54470A8;
    v6[4] = WeakRetained;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    v8 = a2;
    performWithLock(v5 + 43, v6);
    objc_destroyWeak(&v7);
  }

}

void __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained == v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 208);
    *(_QWORD *)(v5 + 208) = v4;

  }
}

void __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__27;
    v19 = __Block_byref_object_dispose__27;
    v20 = 0;
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_5;
    v14[3] = &unk_1E5444748;
    v14[4] = WeakRetained;
    v14[5] = &v15;
    performWithLock(WeakRetained + 43, v14);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "userPreferredTargetLocales");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    availablePreferredTargetLocalesFilteredBySupportedLocales(v7, v3, (void *)v16[5]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_6;
    v10[3] = &unk_1E5447688;
    v10[4] = v5;
    objc_copyWeak(&v13, (id *)(a1 + 48));
    v11 = v3;
    v9 = v8;
    v12 = v9;
    performWithLock(v5 + 43, v10);

    objc_destroyWeak(&v13);
    _Block_object_dispose(&v15, 8);

  }
}

void __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_5(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 184));
}

void __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
  v3 = objc_loadWeakRetained((id *)(a1 + 56));

  if (WeakRetained == v3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 200), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 280), *(id *)(a1 + 48));
  }
}

- (void)_setState:(unint64_t)a3 usingLock:(BOOL)a4
{
  -[WBSTranslationContext _setState:usingLock:validatingTransitionIsAllowed:](self, "_setState:usingLock:validatingTransitionIsAllowed:", a3, a4, 1);
}

- (void)_setState:(unint64_t)a3 usingLock:(BOOL)a4 validatingTransitionIsAllowed:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  unint64_t state;
  uint64_t v10;
  NSObject *v11;
  unint64_t v12;
  const __CFString *v13;
  NSObject *v14;
  unint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  NSObject *internalQueue;
  _QWORD v20[5];
  id v21[2];
  _QWORD v22[6];
  id location;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v5 = a5;
  v6 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  if (a4)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __75__WBSTranslationContext__setState_usingLock_validatingTransitionIsAllowed___block_invoke;
    v24[3] = &unk_1E5444748;
    v24[4] = self;
    v24[5] = &v25;
    performWithLock(&self->_synchronousIvarLock, v24);
    state = v26[3];
  }
  else
  {
    state = self->_state;
    v28 = state;
  }
  if (state != a3)
  {
    if (((canTransitionFromStateToState(state, a3) | !v5) & 1) != 0)
    {
      objc_initWeak(&location, self);
      v10 = MEMORY[0x1E0C809B0];
      if (v6)
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __75__WBSTranslationContext__setState_usingLock_validatingTransitionIsAllowed___block_invoke_75;
        v22[3] = &unk_1E5443130;
        v22[4] = self;
        v22[5] = a3;
        performWithLock(&self->_synchronousIvarLock, v22);
      }
      else
      {
        self->_state = a3;
      }
      v14 = WBS_LOG_CHANNEL_PREFIXTranslation();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = v26[3] - 1;
        if (v15 > 6)
          v16 = CFSTR("Unknown");
        else
          v16 = off_1E54477E8[v15];
        if (a3 - 1 > 6)
          v18 = CFSTR("Unknown");
        else
          v18 = off_1E54477E8[a3 - 1];
        *(_DWORD *)buf = 138543618;
        v30 = v16;
        v31 = 2114;
        v32 = v18;
        _os_log_impl(&dword_1A840B000, v14, OS_LOG_TYPE_INFO, "Changed state from '%{public}@' to '%{public}@'", buf, 0x16u);
      }
      internalQueue = self->_internalQueue;
      v20[0] = v10;
      v20[1] = 3221225472;
      v20[2] = __75__WBSTranslationContext__setState_usingLock_validatingTransitionIsAllowed___block_invoke_76;
      v20[3] = &unk_1E54476D8;
      objc_copyWeak(v21, &location);
      v20[4] = &v25;
      v21[1] = (id)a3;
      dispatch_async(internalQueue, v20);
      objc_destroyWeak(v21);
      objc_destroyWeak(&location);
    }
    else
    {
      v11 = WBS_LOG_CHANNEL_PREFIXTranslation();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = v26[3] - 1;
        if (v12 > 6)
          v13 = CFSTR("Unknown");
        else
          v13 = off_1E54477E8[v12];
        if (a3 - 1 > 6)
          v17 = CFSTR("Unknown");
        else
          v17 = off_1E54477E8[a3 - 1];
        *(_DWORD *)buf = 138543618;
        v30 = v13;
        v31 = 2114;
        v32 = v17;
        _os_log_impl(&dword_1A840B000, v11, OS_LOG_TYPE_INFO, "Unable to change state from '%{public}@' to '%{public}@'; invalid state transition",
          buf,
          0x16u);
      }
    }
  }
  _Block_object_dispose(&v25, 8);
}

uint64_t __75__WBSTranslationContext__setState_usingLock_validatingTransitionIsAllowed___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 176);
  return result;
}

uint64_t __75__WBSTranslationContext__setState_usingLock_validatingTransitionIsAllowed___block_invoke_75(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 176) = *(_QWORD *)(result + 40);
  return result;
}

void __75__WBSTranslationContext__setState_usingLock_validatingTransitionIsAllowed___block_invoke_76(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7[0] = CFSTR("previousState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("newState");
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("translationStateDidChange"), WeakRetained, v6);

}

- (id)_currentSession
{
  _LTTranslationSession *cachedSession;
  _LTTranslationSession *v4;
  _LTTranslationSession *v5;

  cachedSession = self->_cachedSession;
  if (!cachedSession)
  {
    -[_LTTranslator startTranslationSession](self->_translator, "startTranslationSession");
    v4 = (_LTTranslationSession *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedSession;
    self->_cachedSession = v4;

    if (-[WBSTranslationContext _canLogSourcePageURL](self, "_canLogSourcePageURL"))
      -[_LTTranslationSession setURL:](self->_cachedSession, "setURL:", self->_cachedWebViewURL);
    cachedSession = self->_cachedSession;
  }
  return cachedSession;
}

- (BOOL)_canLogSourcePageURL
{
  NSNumber *cachedClientIsUsingPrivateBrowsingValue;
  uint64_t v4;
  id WeakRetained;
  NSNumber *v6;
  NSNumber *v7;

  cachedClientIsUsingPrivateBrowsingValue = self->_cachedClientIsUsingPrivateBrowsingValue;
  if (cachedClientIsUsingPrivateBrowsingValue)
  {
    LOBYTE(v4) = -[NSNumber BOOLValue](cachedClientIsUsingPrivateBrowsingValue, "BOOLValue");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = objc_msgSend(WeakRetained, "translationContextIsUsingPrivateBrowsing:", self);
    else
      v4 = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedClientIsUsingPrivateBrowsingValue;
    self->_cachedClientIsUsingPrivateBrowsingValue = v6;

  }
  return v4 ^ 1;
}

- (void)_promptIfNeededToConsentToTranslationWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  uint64_t v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  void (**v10)(id, uint64_t);
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  char v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__27;
  v16 = __Block_byref_object_dispose__27;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__WBSTranslationContext__promptIfNeededToConsentToTranslationWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E5444748;
  v11[4] = self;
  v11[5] = &v12;
  performWithLock(&self->_synchronousIvarLock, v11);
  if (objc_msgSend((id)v13[5], "hasConsentedToFirstTimeAlert")
    && (objc_msgSend((id)v13[5], "debugAlwaysShowConsentAlert") & 1) == 0)
  {
    v4[2](v4, 1);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9[0] = v5;
      v9[1] = 3221225472;
      v9[2] = __84__WBSTranslationContext__promptIfNeededToConsentToTranslationWithCompletionHandler___block_invoke_81;
      v9[3] = &unk_1E5441DA8;
      v9[4] = self;
      v10 = v4;
      objc_msgSend(WeakRetained, "translationContext:showFirstTimeConsentAlertWithCompletionHandler:", self, v9);

    }
    else
    {
      v7 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v8 = (void *)objc_opt_class();
        -[WBSTranslationContext _promptIfNeededToConsentToTranslationWithCompletionHandler:].cold.1(v8, (uint64_t)v18, v7);
      }

      v4[2](v4, 0);
    }

  }
  _Block_object_dispose(&v12, 8);

}

void __84__WBSTranslationContext__promptIfNeededToConsentToTranslationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __84__WBSTranslationContext__promptIfNeededToConsentToTranslationWithCompletionHandler___block_invoke_81(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  char v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__WBSTranslationContext__promptIfNeededToConsentToTranslationWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5441D80;
  v7 = a2;
  block[4] = v2;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __84__WBSTranslationContext__promptIfNeededToConsentToTranslationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *v2;
  NSObject *v3;
  int v4;
  _QWORD v6[6];
  uint8_t buf[8];
  uint8_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    *(_QWORD *)buf = 0;
    v8 = buf;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__27;
    v11 = __Block_byref_object_dispose__27;
    v12 = 0;
    v2 = *(os_unfair_lock_s **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __84__WBSTranslationContext__promptIfNeededToConsentToTranslationWithCompletionHandler___block_invoke_3;
    v6[3] = &unk_1E5444748;
    v6[4] = v2;
    v6[5] = buf;
    performWithLock(v2 + 43, v6);
    objc_msgSend(*((id *)v8 + 5), "setConsentedToFirstTimeAlert:", 1);
    _Block_object_dispose(buf, 8);

  }
  v3 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v4;
    _os_log_impl(&dword_1A840B000, v3, OS_LOG_TYPE_DEFAULT, "User responded to translation consent prompt with result: %i", buf, 8u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __84__WBSTranslationContext__promptIfNeededToConsentToTranslationWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)_generateJSONVersionOfContent:(id)a3 forPurpose:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  const __CFString *v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  if (a4 == 1)
  {
    v19[0] = CFSTR("URL");
    -[WBSTranslationDiagnosticData URLString](self->_diagnosticData, "URLString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = CFSTR("paragraphs");
    v20[0] = v10;
    v20[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = CFSTR("paragraphs");
    v18 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v11, (a4 == 1) | 2, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;
  if (v12)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v12, 4);
    v9[2](v9, v14);

  }
  else
  {
    v15 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[WBSTranslationContext _generateJSONVersionOfContent:forPurpose:completionHandler:].cold.1(v15);
    v9[2](v9, &stru_1E5449658);
  }

}

- (void)_generateJSONVersionOfErrors:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void (**v7)(id, uint64_t);
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB36D8];
  v12 = 0;
  v7 = (void (**)(id, uint64_t))a4;
  objc_msgSend(v6, "dataWithJSONObject:options:error:", v5, 2, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v8)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
    v7[2](v7, v10);

    v7 = (void (**)(id, uint64_t))v10;
  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WBSTranslationContext _generateJSONVersionOfErrors:completionHandler:].cold.1(v11);
    v7[2](v7, (uint64_t)&stru_1E5449658);
  }

}

- (id)_userVisibleErrorMessageForError:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "code");

  get_LTTranslationErrorDomain();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    if (v6 > 0xB || ((1 << v6) & 0xEEF) == 0)
      goto LABEL_6;
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CEF810]))
  {
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    {
      _WBSLocalizedString();
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_6:
  -[WBSTranslationContext _genericErrorMessage](self, "_genericErrorMessage");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v10 = (void *)v9;
LABEL_11:

  return v10;
}

- (id)_genericErrorMessage
{
  return (id)_WBSLocalizedString();
}

- (BOOL)_translationSupportedInCurrentRegion
{
  void *v2;
  char v3;
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
  v9 = __Block_byref_object_copy__27;
  v10 = __Block_byref_object_dispose__27;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__WBSTranslationContext__translationSupportedInCurrentRegion__block_invoke;
  v5[3] = &unk_1E5444748;
  v5[4] = self;
  v5[5] = &v6;
  performWithLock(&self->_synchronousIvarLock, v5);
  v2 = (void *)v7[5];
  if (v2)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __61__WBSTranslationContext__translationSupportedInCurrentRegion__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 208));
}

- (BOOL)_nextURLIsEligibleForContinuedTranslation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  if (self->_nextNavigationIsEligibleForContinuedTranslation)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__27;
    v14 = __Block_byref_object_dispose__27;
    v15 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__WBSTranslationContext__nextURLIsEligibleForContinuedTranslation___block_invoke;
    v9[3] = &unk_1E5446FB0;
    v9[4] = self;
    v9[5] = &v16;
    v9[6] = &v10;
    performWithLock(&self->_synchronousIvarLock, v9);
    if ((objc_msgSend((id)v11[5], "isContinuedTranslationEnabled") & 1) != 0
      && canTransitionFromStateToState(v17[3], 5))
    {
      objc_msgSend(v4, "host");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safari_highLevelDomainFromHost");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "isEqualToString:", self->_previousPageHighLevelDomain);
    }
    else
    {
      v7 = 0;
    }
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __67__WBSTranslationContext__nextURLIsEligibleForContinuedTranslation___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 176);
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 192));
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (id)_currentSnapshot
{
  WBSTranslationContextSnapshot *v3;
  unint64_t v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__27;
  v11 = __Block_byref_object_dispose__27;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__WBSTranslationContext__currentSnapshot__block_invoke;
  v6[3] = &unk_1E5446FB0;
  v6[4] = self;
  v6[5] = &v13;
  v6[6] = &v7;
  performWithLock(&self->_synchronousIvarLock, v6);
  v3 = 0;
  v4 = v14[3];
  if (v4 <= 7 && ((1 << v4) & 0xDC) != 0)
  {
    v3 = objc_alloc_init(WBSTranslationContextSnapshot);
    -[WBSTranslationContextSnapshot setWebpageLocale:](v3, "setWebpageLocale:", v8[5]);
    -[WBSTranslationContextSnapshot setState:](v3, "setState:", v14[3]);
    -[WBSTranslationContextSnapshot setTargetLocale:](v3, "setTargetLocale:", self->_targetLocale);
    -[WBSTranslationContextSnapshot setWebpageURL:](v3, "setWebpageURL:", self->_cachedWebViewURL);
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v3;
}

void __41__WBSTranslationContext__currentSnapshot__block_invoke(_QWORD *a1)
{
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 176);
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 184));
}

- (BOOL)_restoreContextSnapshotIfNeeded:(id)a3 forURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  const __CFString *v14;
  NSObject *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSString *v24;
  NSString *targetLocale;
  NSURL *v26;
  NSURL *cachedWebViewURL;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(id *);
  void *v32;
  WBSTranslationContext *v33;
  id v34;
  id v35;
  _QWORD v36[7];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  __int128 buf;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v15 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[WBSTranslationContext _restoreContextSnapshotIfNeeded:forURL:].cold.1();
    goto LABEL_10;
  }
  objc_msgSend(v6, "webpageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  v10 = WBS_LOG_CHANNEL_PREFIXTranslation();
  v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A840B000, v11, OS_LOG_TYPE_INFO, "Can't restore snapshot because URLs don't match", (uint8_t *)&buf, 2u);
    }
LABEL_10:
    v16 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = objc_msgSend(v6, "state");
    if ((unint64_t)(v13 - 1) > 6)
      v14 = CFSTR("Unknown");
    else
      v14 = off_1E54477E8[v13 - 1];
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_1A840B000, v12, OS_LOG_TYPE_DEFAULT, "Restoring using snapshot to state '%{public}@'", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__27;
  v46 = __Block_byref_object_dispose__27;
  v47 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__27;
  v41 = __Block_byref_object_dispose__27;
  v42 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __64__WBSTranslationContext__restoreContextSnapshotIfNeeded_forURL___block_invoke;
  v36[3] = &unk_1E5446FB0;
  v36[4] = self;
  v36[5] = &buf;
  v36[6] = &v37;
  performWithLock(&self->_synchronousIvarLock, v36);
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "userPreferredTargetLocales");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)v38[5];
  objc_msgSend(v6, "webpageLocale");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  availablePreferredTargetLocalesFilteredBySupportedLocales(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = v17;
  v30 = 3221225472;
  v31 = __64__WBSTranslationContext__restoreContextSnapshotIfNeeded_forURL___block_invoke_2;
  v32 = &unk_1E5441870;
  v33 = self;
  v22 = v6;
  v34 = v22;
  v23 = v21;
  v35 = v23;
  performWithLock(&self->_synchronousIvarLock, &v29);
  objc_msgSend(v22, "targetLocale", v29, v30, v31, v32, v33);
  v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  targetLocale = self->_targetLocale;
  self->_targetLocale = v24;

  objc_msgSend(v22, "webpageURL");
  v26 = (NSURL *)objc_claimAutoreleasedReturnValue();
  cachedWebViewURL = self->_cachedWebViewURL;
  self->_cachedWebViewURL = v26;

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&buf, 8);

  v16 = 1;
LABEL_14:

  return v16;
}

void __64__WBSTranslationContext__restoreContextSnapshotIfNeeded_forURL___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 192));
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 200));
}

uint64_t __64__WBSTranslationContext__restoreContextSnapshotIfNeeded_forURL___block_invoke_2(id *a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;

  objc_msgSend(a1[5], "webpageLocale");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = (void *)v3[23];
  v3[23] = v2;

  objc_storeStrong((id *)a1[4] + 35, a1[6]);
  return objc_msgSend(a1[4], "_setState:usingLock:validatingTransitionIsAllowed:", objc_msgSend(a1[5], "state"), 0, 0);
}

- (void)_reportLanguageDetectionAnalyticsForWebpageLocale:(id)a3 notificationLevel:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__27;
  v22 = __Block_byref_object_dispose__27;
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93__WBSTranslationContext__reportLanguageDetectionAnalyticsForWebpageLocale_notificationLevel___block_invoke;
  v17[3] = &unk_1E5444748;
  v17[4] = self;
  v17[5] = &v18;
  performWithLock(&self->_synchronousIvarLock, v17);
  objc_msgSend((id)v19[5], "userPreferredTargetLocales");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSTranslationContext availableTargetLocaleIdentifiers](self, "availableTargetLocaleIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  objc_msgSend(v7, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = preferredBaseLocalesContainBaseLocaleIdentifier(v8, v10);
  objc_msgSend(v8, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v11 & 1) != 0)
    v14 = 0;
  else
    v14 = v12;
  if (a4)
    v15 = 2;
  else
    v15 = v9 != 0;
  objc_msgSend(MEMORY[0x1E0D8A0A8], "sharedLogger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "didDetectLanguageOfWebpage:primaryLocale:webpageCanBeTranslatedToPrimaryLocale:canOfferTranslation:firstNonPrimaryLocaleThatCanBeTranslatedTo:numberOfPreferredLocales:notificationLevel:", v6, v10, v11, v9 != 0, v14, objc_msgSend(v7, "count"), v15);

  _Block_object_dispose(&v18, 8);
}

void __93__WBSTranslationContext__reportLanguageDetectionAnalyticsForWebpageLocale_notificationLevel___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)_reportRequestedTranslationAnalyticsForWebpageLocale:(id)a3 targetLocale:(id)a4 requestType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v9 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__27;
  v21 = __Block_byref_object_dispose__27;
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __103__WBSTranslationContext__reportRequestedTranslationAnalyticsForWebpageLocale_targetLocale_requestType___block_invoke;
  v16[3] = &unk_1E5444748;
  v16[4] = self;
  v16[5] = &v17;
  performWithLock(&self->_synchronousIvarLock, v16);
  objc_msgSend((id)v18[5], "userPreferredTargetLocales");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "safari_baseLanguageFromLanguage:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "safari_baseLanguageFromLanguage:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  objc_msgSend(MEMORY[0x1E0D8A0A8], "sharedLogger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "didRequestTranslatingToLocale:webpageLocale:requestType:isTargetLocalePrimaryLocale:", v9, v8, a5 != 0, v14);

  _Block_object_dispose(&v17, 8);
}

void __103__WBSTranslationContext__reportRequestedTranslationAnalyticsForWebpageLocale_targetLocale_requestType___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)_reportFilledFirstParagraphIfNeeded
{
  if (!self->_hasReportedFirstParagraphFinishedFillingForAnalytics)
  {
    self->_hasReportedFirstParagraphFinishedFillingForAnalytics = 1;
    -[_LTTranslationSession markFirstParagraphComplete](self->_cachedSession, "markFirstParagraphComplete");
  }
}

- (void)_reportFinishedFillingInitialPageContentIfNeeded
{
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  WBSTranslationContext *v6;

  if (!self->_hasReportedInitialPageFinishedFillingForAnalytics)
  {
    self->_hasReportedInitialPageFinishedFillingForAnalytics = 1;
    -[_LTTranslationSession markPageComplete](self->_cachedSession, "markPageComplete");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __73__WBSTranslationContext__reportFinishedFillingInitialPageContentIfNeeded__block_invoke;
      v4[3] = &unk_1E5441848;
      v5 = WeakRetained;
      v6 = self;
      dispatch_async(MEMORY[0x1E0C80D38], v4);

    }
  }
}

uint64_t __73__WBSTranslationContext__reportFinishedFillingInitialPageContentIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "translationContextNeedsScrollHeightVisibilityUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)_reportFinishedFillingInitialVisiblePageContentIfNeeded
{
  if (!self->_hasReportedInitialVisibleParagraphsFinishedFillingForAnalytics)
  {
    self->_hasReportedInitialVisibleParagraphsFinishedFillingForAnalytics = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[_LTTranslationSession markProgressDone](self->_cachedSession, "markProgressDone");
  }
}

- (void)_cancelProgressForNavigation:(BOOL)a3
{
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v4 = MEMORY[0x1E0C809B0];
  if (a3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__WBSTranslationContext__cancelProgressForNavigation___block_invoke;
    v6[3] = &unk_1E5441CB8;
    v6[4] = self;
    performWithLock(&self->_synchronousIvarLock, v6);
  }
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __54__WBSTranslationContext__cancelProgressForNavigation___block_invoke_2;
  v5[3] = &unk_1E5441CB8;
  v5[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], v5);
}

void __54__WBSTranslationContext__cancelProgressForNavigation___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 249) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 0;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 232);
  *(_QWORD *)(v1 + 232) = 0;

}

uint64_t __54__WBSTranslationContext__cancelProgressForNavigation___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "fluidProgressController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelFluidProgressWithProgressStateSource:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateToReportProgressInUnifiedField:", 0);
}

- (void)_startProgressForExtractingContent
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_4_5(&dword_1A840B000, v0, v1, "Progress for %{public}@: Starting progress for extracting content", v2);
  OUTLINED_FUNCTION_1();
}

void __59__WBSTranslationContext__startProgressForExtractingContent__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "fluidProgressController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startFluidProgressWithProgressStateSource:", *(_QWORD *)(a1 + 32));

}

- (void)_updateProgressWithExtractedParagraphCount:(unint64_t)a3
{
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  WBSTranslationContext *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__WBSTranslationContext__updateProgressWithExtractedParagraphCount___block_invoke;
  v8[3] = &unk_1E5447700;
  v8[4] = self;
  v8[5] = &v13;
  v8[6] = &v9;
  v8[7] = a3;
  performWithLock(&self->_synchronousIvarLock, v8);
  v5 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (*((_BYTE *)v14 + 24))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = v10[3];
    *(_DWORD *)buf = 138544130;
    v18 = self;
    v19 = 2048;
    v20 = a3;
    v21 = 2114;
    v22 = v6;
    v23 = 2048;
    v24 = v7;
    _os_log_debug_impl(&dword_1A840B000, v5, OS_LOG_TYPE_DEBUG, "Progress for %{public}@: Extracted %lu new paragraphs; part of initial set: %{public}@; now have %lu initially ext"
      "racted paragraphs",
      buf,
      0x2Au);
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

_QWORD *__68__WBSTranslationContext__updateProgressWithExtractedParagraphCount___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (!*(_BYTE *)(v1 + 249))
  {
    *(_QWORD *)(v1 + 216) += result[7];
    *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = 1;
    v1 = result[4];
  }
  *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = *(_QWORD *)(v1 + 216);
  return result;
}

- (void)_updateProgressWithTranslatedParagraphCount:(unint64_t)a3
{
  uint64_t v5;
  double v6;
  double v7;
  NSObject *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[6];
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  WBSTranslationContext *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__WBSTranslationContext__updateProgressWithTranslatedParagraphCount___block_invoke;
  v13[3] = &unk_1E5447700;
  v13[4] = self;
  v13[5] = &v18;
  v13[6] = &v14;
  v13[7] = a3;
  performWithLock(&self->_synchronousIvarLock, v13);
  -[WBSTranslationContext estimatedProgress](self, "estimatedProgress");
  v7 = v6;
  v8 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = v19[3];
    v11 = v15[3];
    *(_DWORD *)buf = 138544386;
    v23 = self;
    v24 = 2048;
    v25 = a3;
    v26 = 2048;
    v27 = v10;
    v28 = 2048;
    v29 = v11;
    v30 = 2048;
    v31 = v7;
    _os_log_debug_impl(&dword_1A840B000, v8, OS_LOG_TYPE_DEBUG, "Progress for %{public}@: Translated %lu new paragraph(s); total translated paragraphs: %lu; initially extracted pa"
      "ragraphs: %lu; current estimated progress: %f",
      buf,
      0x34u);
  }
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __69__WBSTranslationContext__updateProgressWithTranslatedParagraphCount___block_invoke_98;
  v12[3] = &unk_1E5443130;
  v12[4] = self;
  *(double *)&v12[5] = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v12);
  if (v7 >= 1.0)
    -[WBSTranslationContext _reportFinishedFillingInitialVisiblePageContentIfNeeded](self, "_reportFinishedFillingInitialVisiblePageContentIfNeeded");
  -[WBSTranslationContext _estimatedProgressWithScope:](self, "_estimatedProgressWithScope:", 0);
  if (v9 >= 1.0)
    -[WBSTranslationContext _reportFinishedFillingInitialPageContentIfNeeded](self, "_reportFinishedFillingInitialPageContentIfNeeded");
  else
    -[WBSTranslationContext _reportFilledFirstParagraphIfNeeded](self, "_reportFilledFirstParagraphIfNeeded");
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

_QWORD *__69__WBSTranslationContext__updateProgressWithTranslatedParagraphCount___block_invoke(_QWORD *result)
{
  *(_QWORD *)(result[4] + 224) += result[7];
  *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(result[4] + 224);
  *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = *(_QWORD *)(result[4] + 216);
  return result;
}

void __69__WBSTranslationContext__updateProgressWithTranslatedParagraphCount___block_invoke_98(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;

  v1 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "fluidProgressController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)v1;
  if (*(double *)(v1 + 8) >= 1.0)
  {
    objc_msgSend(v2, "finishFluidProgressWithProgressStateSource:", v4);
    v5 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __69__WBSTranslationContext__updateProgressWithTranslatedParagraphCount___block_invoke_98_cold_1((uint64_t *)v1, v5, v6);
  }
  else
  {
    objc_msgSend(v2, "updateFluidProgressWithProgressStateSource:", v4);
  }

}

- (void)_updateProgressForFinishingInitialContentExtraction
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  WBSTranslationContext *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__WBSTranslationContext__updateProgressForFinishingInitialContentExtraction__block_invoke;
  v9[3] = &unk_1E5447728;
  v9[4] = self;
  v9[5] = &v14;
  v9[6] = &v10;
  performWithLock(&self->_synchronousIvarLock, v9);
  v4 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = v15[3];
    v6 = v11[3];
    -[WBSTranslationContext estimatedProgress](self, "estimatedProgress");
    *(_DWORD *)buf = 138544130;
    v19 = self;
    v20 = 2048;
    v21 = v5;
    v22 = 2048;
    v23 = v6;
    v24 = 2048;
    v25 = v7;
    _os_log_debug_impl(&dword_1A840B000, v4, OS_LOG_TYPE_DEBUG, "Progress for %{public}@: Finished extracting initial paragraphs with count %lu; translated paragraphs: %lu; curren"
      "t estimated progress: %f",
      buf,
      0x2Au);
  }

  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __76__WBSTranslationContext__updateProgressForFinishingInitialContentExtraction__block_invoke_99;
  v8[3] = &unk_1E5441CB8;
  v8[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], v8);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

uint64_t __76__WBSTranslationContext__updateProgressForFinishingInitialContentExtraction__block_invoke(_QWORD *a1)
{
  uint64_t result;

  *(_BYTE *)(a1[4] + 249) = 1;
  result = objc_msgSend(*(id *)(a1[4] + 256), "setFluidProgressAnimationPhase:", 1);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 216);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 224);
  return result;
}

void __76__WBSTranslationContext__updateProgressForFinishingInitialContentExtraction__block_invoke_99(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "fluidProgressController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFluidProgressWithProgressStateSource:", *(_QWORD *)(a1 + 32));

}

- (void)_notifyDelegateToReportProgressInUnifiedField:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id WeakRetained;

  v3 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[WBSTranslationContext _notifyDelegateToReportProgressInUnifiedField:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "translationContext:shouldReportProgressInUnifiedField:", self, v3);

}

- (NSString)lastDeterminedWebpageLanguage
{
  return self->_lastDeterminedWebpageLanguage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDeterminedWebpageLanguage, 0);
  objc_storeStrong((id *)&self->_cachedAvailablePreferredTargetLocalesFilteredBySupportedLocales, 0);
  objc_storeStrong((id *)&self->_cachedAllowedTargetLocaleIdentifiers, 0);
  objc_destroyWeak((id *)&self->_fluidProgressController);
  objc_storeStrong((id *)&self->_fluidProgressState, 0);
  objc_storeStrong((id *)&self->_initiallyVisibleParagraphIdentifiersQueuedForTranslation, 0);
  objc_storeStrong((id *)&self->_cachedTranslationSupportedInCurrentRegion, 0);
  objc_storeStrong((id *)&self->_cachedSupportedLocalePairs, 0);
  objc_destroyWeak((id *)&self->_preferenceProvider);
  objc_storeStrong((id *)&self->_webpageLocale, 0);
  objc_storeStrong((id *)&self->_previousPageHighLevelDomain, 0);
  objc_storeStrong((id *)&self->_previousPageSourceLocale, 0);
  objc_storeStrong((id *)&self->_previousPageTargetLocale, 0);
  objc_storeStrong((id *)&self->_scrollInteractionAnalyticsHelper, 0);
  objc_storeStrong((id *)&self->_cachedTextSamples, 0);
  objc_storeStrong((id *)&self->_snapshotToRestoreOnNextNavigation, 0);
  objc_storeStrong((id *)&self->_errorController, 0);
  objc_storeStrong((id *)&self->_cachedWebViewURL, 0);
  objc_storeStrong((id *)&self->_cachedClientIsUsingPrivateBrowsingValue, 0);
  objc_storeStrong((id *)&self->_diagnosticData, 0);
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_languageDetector);
  objc_storeStrong((id *)&self->_contentFiller, 0);
  objc_storeStrong((id *)&self->_contentExtractor, 0);
  objc_destroyWeak((id *)&self->_contentTranslator);
  objc_storeStrong((id *)&self->_cachedSession, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

+ (id)translationContextWithWebView:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  WBSTranslationWebpageContentExtractor *v7;
  WBSTranslationContext *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[WBSTranslationWebpageContentExtractor initWithWebView:]([WBSTranslationWebpageContentExtractor alloc], "initWithWebView:", v6);

  v8 = -[WBSTranslationContext initWithContentExtractor:contentFiller:delegate:]([WBSTranslationContext alloc], "initWithContentExtractor:contentFiller:delegate:", v7, v7, v5);
  return v8;
}

- (void)owningWebViewDidDecidePolicy:(int64_t)a3 forNavigationAction:(id)a4 currentBackForwardListItem:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  objc_msgSend(v13, "targetFrame");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v13, "sourceFrame");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  if (objc_msgSend(v12, "isMainFrame"))
    -[WBSTranslationContext owningWebViewWillNavigateAndSaveCurrentSnapshotToStore:isEligibleForContinuedTranslation:](self, "owningWebViewWillNavigateAndSaveCurrentSnapshotToStore:isEligibleForContinuedTranslation:", v8, objc_msgSend(v13, "safari_isEligibleForContinuedTranslationWithPolicy:", a3));

}

void __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218243;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2117;
  *(_QWORD *)&v3[14] = *(_QWORD *)(a1 + 48);
  OUTLINED_FUNCTION_0_7(&dword_1A840B000, a2, a3, "Ignoring text samples of count %lu. URL: %{sensitive}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_cold_1(void *a1)
{
  NSObject *v1;
  id v2;
  id v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_7_0(a1);
  OUTLINED_FUNCTION_4_2();
  objc_opt_class();
  OUTLINED_FUNCTION_2_4();
  v3 = v2;
  _os_log_error_impl(&dword_1A840B000, v1, OS_LOG_TYPE_ERROR, "Delegate <%{public}@> does not implement selector -translationContext:showFeedbackConsentAlertWithCompletionHandler:, so we can't send feedback", v4, 0xCu);

  OUTLINED_FUNCTION_2_1();
}

void __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Can't load class _LTParagraphTranslationRequest; this new SPI is required for translation to continue working. Nothi"
    "ng will be translated; please install a newer build or a Translation root",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Failed to extract text from webpage to translate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __72__WBSTranslationContext_contentFiller_didCompleteFillingItem_withError___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_4_5(&dword_1A840B000, v2, v5, "Successfully filled translated item: %{public}@", v6);

  OUTLINED_FUNCTION_2_1();
}

void __72__WBSTranslationContext_contentFiller_didCompleteFillingItem_withError___block_invoke_2_cold_2(void **a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  v4 = *a1;
  v5 = a2;
  objc_msgSend(v4, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a3 + 48), "safari_privacyPreservingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_11(&dword_1A840B000, v8, v9, "Failed to fill translated content into webpage with error: %{public}@; content: %{public}@",
    v10,
    v11,
    v12,
    v13,
    v14);

  OUTLINED_FUNCTION_2_0();
}

- (void)dominantLocaleForTextSamples:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Translation framework not available, not identifying language", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)errorController:(uint8_t *)buf didReachThresholdForError:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1A840B000, log, OS_LOG_TYPE_FAULT, "Reached error threshold but can't show user an error message because delegate '%{public}@' doesn't respond to the selector. Error: %{public}@", buf, 0x16u);

}

- (void)_promptIfNeededToConsentToTranslationWithCompletionHandler:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  id v5;

  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  v5 = a1;
  _os_log_fault_impl(&dword_1A840B000, a3, OS_LOG_TYPE_FAULT, "Delegate <%{public}@> does not implement selector -translationContext:showFirstTimeConsentAlertWithCompletionHandler:, so we can't perform translation", (uint8_t *)a2, 0xCu);

}

- (void)_generateJSONVersionOfContent:(void *)a1 forPurpose:completionHandler:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_0(a1);
  OUTLINED_FUNCTION_9();
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_11(&dword_1A840B000, v3, v4, "Failed to generate JSON version of extracted paragraphs with count %lu and with error %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_generateJSONVersionOfErrors:(void *)a1 completionHandler:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_0(a1);
  OUTLINED_FUNCTION_9();
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_11(&dword_1A840B000, v3, v4, "Failed to generate JSON version of errors with count %lu and with error %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_restoreContextSnapshotIfNeeded:forURL:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1A840B000, v0, OS_LOG_TYPE_DEBUG, "No snapshot to restore", v1, 2u);
  OUTLINED_FUNCTION_3();
}

void __69__WBSTranslationContext__updateProgressWithTranslatedParagraphCount___block_invoke_98_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_4_5(&dword_1A840B000, a2, a3, "Progress for %{public}@: Finished translating initial content, animating progress bar completion", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)_notifyDelegateToReportProgressInUnifiedField:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_7(&dword_1A840B000, v0, v1, "Progress for %{public}@: Updating delegate whether to report progress in unified field: %{public}@");
  OUTLINED_FUNCTION_1();
}

@end
