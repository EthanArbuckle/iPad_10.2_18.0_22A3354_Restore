@implementation SCROBrailleTranslationManager

+ (SCROBrailleTranslationManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2);
  return (SCROBrailleTranslationManager *)(id)_sharedManager;
}

void __46__SCROBrailleTranslationManager_sharedManager__block_invoke()
{
  SCROBrailleTranslationManager *v0;
  void *v1;

  v0 = objc_alloc_init(SCROBrailleTranslationManager);
  v1 = (void *)_sharedManager;
  _sharedManager = (uint64_t)v0;

}

+ (id)inputManager
{
  if (inputManager_onceToken != -1)
    dispatch_once(&inputManager_onceToken, &__block_literal_global_14);
  return (id)inputManager__inputManager;
}

void __45__SCROBrailleTranslationManager_inputManager__block_invoke()
{
  SCROBrailleTranslationManager *v0;
  void *v1;

  v0 = objc_alloc_init(SCROBrailleTranslationManager);
  v1 = (void *)inputManager__inputManager;
  inputManager__inputManager = (uint64_t)v0;

}

- (SCROBrailleTranslationManager)init
{
  SCROBrailleTranslationManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  BRLTTranslationService *translationService;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCROBrailleTranslationManager;
  v2 = -[SCROBrailleTranslationManager init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.ScreenReaderOutput.brailleTranslationService.clientQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    translationService = v2->_translationService;
    v2->_translationService = 0;

  }
  return v2;
}

- (void)loadTranslatorWithServiceIdentifier:(id)a3
{
  -[SCROBrailleTranslationManager loadTranslatorWithServiceIdentifier:input:](self, "loadTranslatorWithServiceIdentifier:input:", a3, 0);
}

- (void)loadTranslatorWithServiceIdentifier:(id)a3 input:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v4 = a4;
  v6 = loadTranslatorWithServiceIdentifier_input__onceToken;
  v7 = a3;
  v9 = v7;
  if (v6 == -1)
  {
    v8 = v7;
  }
  else
  {
    dispatch_once(&loadTranslatorWithServiceIdentifier_input__onceToken, &__block_literal_global_16);
    v8 = v9;
  }
  -[SCROBrailleTranslationManager loadTranslatorWithServiceIdentifier:forUnitTesting:input:](self, "loadTranslatorWithServiceIdentifier:forUnitTesting:input:", v8, loadTranslatorWithServiceIdentifier_input__isXcTest, v4);

}

void __75__SCROBrailleTranslationManager_loadTranslatorWithServiceIdentifier_input___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  loadTranslatorWithServiceIdentifier_input__isXcTest = objc_msgSend(v0, "isEqualToString:", CFSTR("xctest"));

}

- (void)loadTranslatorWithServiceIdentifier:(id)a3 forUnitTesting:(BOOL)a4
{
  -[SCROBrailleTranslationManager loadTranslatorWithServiceIdentifier:forUnitTesting:input:](self, "loadTranslatorWithServiceIdentifier:forUnitTesting:input:", a3, a4, 0);
}

- (void)loadTranslatorWithServiceIdentifier:(id)a3 forUnitTesting:(BOOL)a4 input:(BOOL)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;
  BOOL v14;

  v8 = a3;
  -[SCROBrailleTranslationManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__SCROBrailleTranslationManager_loadTranslatorWithServiceIdentifier_forUnitTesting_input___block_invoke;
  block[3] = &unk_24CC1DA60;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(v9, block);

}

void __90__SCROBrailleTranslationManager_loadTranslatorWithServiceIdentifier_forUnitTesting_input___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "translationService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if ((v4 & 1) == 0)
  {
    _SCROD_BRAILLE_LOG();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = "(UNIT TESTING)";
      if (!*(_BYTE *)(a1 + 48))
        v7 = "";
      v9 = 138412546;
      v10 = v6;
      v11 = 2080;
      v12 = v7;
      _os_log_impl(&dword_2115BB000, v5, OS_LOG_TYPE_DEFAULT, "Loading service with identifier: %@ %s", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BE0FC80], "serviceForIdentifier:input:loopback:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTranslationService:", v8);

  }
}

- (NSString)defaultLanguage
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  -[SCROBrailleTranslationManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__SCROBrailleTranslationManager_defaultLanguage__block_invoke;
  v6[3] = &unk_24CC1D488;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __48__SCROBrailleTranslationManager_defaultLanguage__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)setDefaultLanguage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SCROBrailleTranslationManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__SCROBrailleTranslationManager_setDefaultLanguage___block_invoke;
  v7[3] = &unk_24CC1D500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __52__SCROBrailleTranslationManager_setDefaultLanguage___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v2 = objc_alloc(MEMORY[0x24BE0FC60]);
    objc_msgSend(*(id *)(a1 + 32), "translationService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serviceIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v2, "initWithServiceIdentifier:tableIdentifier:", v4, *(_QWORD *)(a1 + 40));

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = objc_msgSend(v5, "supportsTranslationMode8Dot");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(v5, "supportsTranslationModeContracted");
    _SCROD_BRAILLE_LOG();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __52__SCROBrailleTranslationManager_setDefaultLanguage___block_invoke_cold_1((uint64_t)v5, v6);

  }
  v7 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  *(_QWORD *)(v8 + 16) = v7;

}

- (id)serviceIdentifier
{
  void *v2;
  void *v3;

  -[SCROBrailleTranslationManager translationService](self, "translationService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)printBrailleForText:(id)a3 language:(id)a4 mode:(unint64_t)a5 textPositionsRange:(_NSRange)a6 locations:(id *)a7 textFormattingRanges:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  dispatch_time_t v22;
  intptr_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  _QWORD block[4];
  id v36;
  SCROBrailleTranslationManager *v37;
  id v38;
  id v39;
  NSObject *v40;
  uint64_t *v41;
  uint64_t *v42;
  unint64_t v43;
  NSUInteger v44;
  NSUInteger v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  length = a6.length;
  location = a6.location;
  v13 = a3;
  v14 = a4;
  v15 = a8;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__1;
  v56 = __Block_byref_object_dispose__1;
  v57 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__1;
  v50 = __Block_byref_object_dispose__1;
  v51 = 0;
  v16 = dispatch_group_create();
  dispatch_group_enter(v16);
  -[SCROBrailleTranslationManager queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke;
  block[3] = &unk_24CC1DAB0;
  v18 = v14;
  v36 = v18;
  v37 = self;
  v19 = v15;
  v38 = v19;
  v43 = a5;
  v44 = location;
  v45 = length;
  v20 = v13;
  v39 = v20;
  v41 = &v52;
  v42 = &v46;
  v21 = v16;
  v40 = v21;
  dispatch_async(v17, block);

  v22 = dispatch_time(0, 5000000000);
  v23 = dispatch_group_wait(v21, v22);
  if (v23)
  {
    v24 = v23;
    _SCROD_BRAILLE_LOG();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SCROBrailleTranslationManager printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);

  }
  if (a7)
    *a7 = objc_retainAutorelease((id)v47[5]);
  v32 = (id)v53[5];

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  return v32;
}

void __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  uint64_t v26;

  v3 = (uint64_t *)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  if (!v2)
    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v4 = v2;
  _SCROD_BRAILLE_LOG();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke_cold_3(a1, v3, v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC78]), "initWithLanguage:mode:partial:useTechnicalTable:textPositionsRange:textFormattingRanges:", v4, *(_QWORD *)(a1 + 88), 0, objc_msgSend(*(id *)(a1 + 40), "alwaysUsesNemethCodeForTechnicalText"), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "translationService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _SCROD_BRAILLE_LOG();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke_cold_2();

    objc_msgSend(*(id *)(a1 + 40), "translationService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 56);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke_25;
    v23[3] = &unk_24CC1DA88;
    v12 = v11;
    v13 = *(_QWORD *)(a1 + 80);
    v24 = v12;
    v26 = v13;
    v22 = *(_OWORD *)(a1 + 64);
    v14 = (id)v22;
    v25 = v22;
    objc_msgSend(v10, "brailleForText:parameters:withReply:", v12, v6, v23);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke_cold_1(v9, v15, v16, v17, v18, v19, v20, v21);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
  }

}

void __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _SCROD_BRAILLE_LOG();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = 138740483;
    v16 = v14;
    v17 = 2117;
    v18 = v5;
    v19 = 2117;
    v20 = v6;
    _os_log_debug_impl(&dword_2115BB000, v7, OS_LOG_TYPE_DEBUG, "Translated text:'%{sensitive}@' -> braille:'%{sensitive}@' locations:%{sensitive}@", (uint8_t *)&v15, 0x20u);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;
  v13 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)textForPrintBraille:(id)a3 language:(id)a4 mode:(unint64_t)a5 locations:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  dispatch_time_t v17;
  intptr_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _QWORD v29[4];
  id v30;
  SCROBrailleTranslationManager *v31;
  id v32;
  NSObject *v33;
  uint64_t *v34;
  uint64_t *v35;
  id *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v10 = a3;
  v11 = a4;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__1;
  v48 = __Block_byref_object_dispose__1;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__1;
  v42 = __Block_byref_object_dispose__1;
  v43 = 0;
  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  -[SCROBrailleTranslationManager queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __77__SCROBrailleTranslationManager_textForPrintBraille_language_mode_locations___block_invoke;
  v29[3] = &unk_24CC1DAD8;
  v14 = v11;
  v30 = v14;
  v31 = self;
  v36 = a6;
  v15 = v10;
  v32 = v15;
  v34 = &v44;
  v35 = &v38;
  v37 = a5;
  v16 = v12;
  v33 = v16;
  dispatch_async(v13, v29);

  v17 = dispatch_time(0, 5000000000);
  v18 = dispatch_group_wait(v16, v17);
  if (v18)
  {
    v19 = v18;
    _SCROD_BRAILLE_LOG();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SCROBrailleTranslationManager textForPrintBraille:language:mode:locations:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

  }
  if (a6)
    *a6 = objc_retainAutorelease((id)v39[5]);
  v27 = (id)v45[5];

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v27;
}

void __77__SCROBrailleTranslationManager_textForPrintBraille_language_mode_locations___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  uint64_t v26;

  v2 = *(void **)(a1 + 32);
  if (!v2)
    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v3 = v2;
  if (*(_QWORD *)(a1 + 80))
  {
    v4 = objc_msgSend(*(id *)(a1 + 48), "length");
    v5 = 0;
  }
  else
  {
    v4 = 0;
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC78]), "initWithLanguage:mode:partial:useTechnicalTable:textPositionsRange:textFormattingRanges:", v3, *(_QWORD *)(a1 + 88), 0, objc_msgSend(*(id *)(a1 + 40), "alwaysUsesNemethCodeForTechnicalText"), v5, v4, 0);
  objc_msgSend(*(id *)(a1 + 40), "translationService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _SCROD_BRAILLE_LOG();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __77__SCROBrailleTranslationManager_textForPrintBraille_language_mode_locations___block_invoke_cold_2();

    objc_msgSend(*(id *)(a1 + 40), "translationService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 48);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __77__SCROBrailleTranslationManager_textForPrintBraille_language_mode_locations___block_invoke_27;
    v23[3] = &unk_24CC1DA88;
    v12 = v11;
    v13 = *(_QWORD *)(a1 + 72);
    v24 = v12;
    v26 = v13;
    v22 = *(_OWORD *)(a1 + 56);
    v14 = (id)v22;
    v25 = v22;
    objc_msgSend(v10, "textForBraille:parameters:withReply:", v12, v6, v23);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __77__SCROBrailleTranslationManager_textForPrintBraille_language_mode_locations___block_invoke_cold_1(v9, v15, v16, v17, v18, v19, v20, v21);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }

}

void __77__SCROBrailleTranslationManager_textForPrintBraille_language_mode_locations___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _SCROD_BRAILLE_LOG();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = 138412802;
    v16 = v14;
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_2115BB000, v7, OS_LOG_TYPE_DEBUG, "Translated braille:'%@' -> text:'%@' locations:%@", (uint8_t *)&v15, 0x20u);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;
  v13 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (BOOL)primaryTableSupportsRoundTripping
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__SCROBrailleTranslationManager_primaryTableSupportsRoundTripping__block_invoke;
  v5[3] = &unk_24CC1DB00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __66__SCROBrailleTranslationManager_primaryTableSupportsRoundTripping__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  result = objc_msgSend(&unk_24CC31768, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v7;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(&unk_24CC31768);
        result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        if ((_DWORD)result)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          return result;
        }
        ++v5;
      }
      while (v3 != v5);
      result = objc_msgSend(&unk_24CC31768, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      v3 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (BOOL)primaryTableSupportsContractedBraille
{
  return self->_tableSupportsContractedBraille;
}

- (BOOL)primaryTableSupportsEightDotBraille
{
  return self->_tableSupportsEightDotBraille;
}

- (BOOL)alwaysUsesNemethCodeForTechnicalText
{
  return self->_alwaysUsesNemethCodeForTechnicalText;
}

- (void)setAlwaysUsesNemethCodeForTechnicalText:(BOOL)a3
{
  self->_alwaysUsesNemethCodeForTechnicalText = a3;
}

- (BRLTTranslationService)translationService
{
  return self->_translationService;
}

- (void)setTranslationService:(id)a3
{
  objc_storeStrong((id *)&self->_translationService, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_translationService, 0);
  objc_storeStrong((id *)&self->_queue_defaultLanguage, 0);
}

void __52__SCROBrailleTranslationManager_setDefaultLanguage___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_2115BB000, a2, OS_LOG_TYPE_DEBUG, "Set new default language table: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)printBrailleForText:(uint64_t)a3 language:(uint64_t)a4 mode:(uint64_t)a5 textPositionsRange:(uint64_t)a6 locations:(uint64_t)a7 textFormattingRanges:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2115BB000, a2, a3, "Timed out translating text to braille - %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2115BB000, a1, a3, "Requested braille->text translation when no translator is loaded.", a5, a6, a7, a8, 0);
}

void __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2115BB000, v0, v1, "Requesting text->braille translation. text:'%{sensitive}@' parameters:%@");
  OUTLINED_FUNCTION_1();
}

void __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke_cold_3(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
  v5 = *a2;
  v6 = 138412802;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  v10 = 2112;
  v11 = v3;
  _os_log_debug_impl(&dword_2115BB000, log, OS_LOG_TYPE_DEBUG, "Queue language: %@ , lang: %@ %@", (uint8_t *)&v6, 0x20u);
}

- (void)textForPrintBraille:(uint64_t)a3 language:(uint64_t)a4 mode:(uint64_t)a5 locations:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2115BB000, a2, a3, "Timed out translating braille to text- %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __77__SCROBrailleTranslationManager_textForPrintBraille_language_mode_locations___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2115BB000, a1, a3, "Requested text->braille translation when no translator is loaded.", a5, a6, a7, a8, 0);
}

void __77__SCROBrailleTranslationManager_textForPrintBraille_language_mode_locations___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2115BB000, v0, v1, "Requesting braille->text translation. braille:'%@' parameters:%@");
  OUTLINED_FUNCTION_1();
}

@end
