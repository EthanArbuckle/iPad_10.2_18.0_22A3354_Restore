@implementation UIDictationConnectionPreferences

- (BOOL)dictationIsEnabled
{
  return -[AFPreferences dictationIsEnabled](self->_afPreferences, "dictationIsEnabled");
}

+ (id)sharedInstance
{
  if (qword_1ECD7EE18 != -1)
    dispatch_once(&qword_1ECD7EE18, &__block_literal_global_526);
  return (id)qword_1ECD7EE10;
}

- (BOOL)suppressDictationOptIn
{
  return -[AFPreferences suppressDictationOptIn](self->_afPreferences, "suppressDictationOptIn");
}

void __50__UIDictationConnectionPreferences_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[UIDictationConnectionPreferences initSingleton]([UIDictationConnectionPreferences alloc], "initSingleton");
  v1 = (void *)qword_1ECD7EE10;
  qword_1ECD7EE10 = (uint64_t)v0;

}

- (id)initSingleton
{
  UIDictationConnectionPreferences *v2;
  void *v3;
  id v4;
  uint64_t v5;
  AFPreferences *afPreferences;
  void *v7;
  _QWORD *v8;
  void *v9;
  UIDictationConnectionPreferences *v10;
  id result;
  void *v12;
  void *v13;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v14.receiver = self;
  v14.super_class = (Class)UIDictationConnectionPreferences;
  v2 = -[UIDictationConnectionPreferences init](&v14, sel_init);
  if (!v2)
    goto LABEL_8;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v3 = (void *)qword_1ECD7EE28;
  v23 = qword_1ECD7EE28;
  if (!qword_1ECD7EE28)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = (uint64_t)__getAFPreferencesClass_block_invoke_0;
    v18 = &unk_1E16B14C0;
    v19 = &v20;
    __getAFPreferencesClass_block_invoke_0((uint64_t)&v15);
    v3 = (void *)v21[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v4, "sharedPreferences");
  v5 = objc_claimAutoreleasedReturnValue();
  afPreferences = v2->_afPreferences;
  v2->_afPreferences = (AFPreferences *)v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = (uint64_t)&v15;
  v17 = 0x2020000000;
  v8 = (_QWORD *)qword_1ECD7EE30;
  v18 = (void *)qword_1ECD7EE30;
  if (!qword_1ECD7EE30)
  {
    v9 = AssistantServicesLibrary_0();
    v8 = dlsym(v9, "AFPreferencesDidChangeNotification");
    *(_QWORD *)(v16 + 24) = v8;
    qword_1ECD7EE30 = (uint64_t)v8;
  }
  _Block_object_dispose(&v15, 8);
  if (v8)
  {
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_afPreferencesChanged_, *v8, 0);

    v10 = v2;
LABEL_8:

    return v2;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSNotificationName getAFPreferencesDidChangeNotification(void)");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("UIDictationConnection.m"), 62, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (BOOL)enableEuclidAlternatives
{
  return -[AFPreferences enableEuclidAlternatives](self->_afPreferences, "enableEuclidAlternatives");
}

- (int64_t)dataSharingOptInStatus
{
  return -[AFPreferences siriDataSharingOptInStatus](self->_afPreferences, "siriDataSharingOptInStatus");
}

- (BOOL)suppressDataSharingOptIn
{
  return -[AFPreferences shouldSuppressSiriDataSharingOptInAlert](self->_afPreferences, "shouldSuppressSiriDataSharingOptInAlert");
}

- (BOOL)ignoreServerManualEndpointingThreshold
{
  return -[AFPreferences ignoreServerManualEndpointingThreshold](self->_afPreferences, "ignoreServerManualEndpointingThreshold");
}

- (id)manualEndpointingThreshold
{
  return (id)-[AFPreferences manualEndpointingThreshold](self->_afPreferences, "manualEndpointingThreshold");
}

- (id)languageCode
{
  return (id)-[AFPreferences languageCode](self->_afPreferences, "languageCode");
}

- (void)afPreferencesChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__UIDictationConnectionPreferences_afPreferencesChanged___block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __57__UIDictationConnectionPreferences_afPreferencesChanged___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("UIDictationPreferencesDidChange"), *(_QWORD *)(a1 + 32));

}

- (id)dictationSLSEnabledLanguages
{
  return (id)-[AFPreferences dictationSLSLanguagesEnabled](self->_afPreferences, "dictationSLSLanguagesEnabled");
}

- (id)getOfflineDictationStatusForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id result;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  v4 = a3;
  -[UIDictationConnectionPreferences afPreferences](self, "afPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "offlineDictationStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("_"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("-"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v10 = get_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCodeSymbolLoc_ptr;
  v22 = get_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCodeSymbolLoc_ptr;
  if (!get_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCodeSymbolLoc_ptr)
  {
    v11 = AssistantServicesLibrary_0();
    v10 = dlsym(v11, "_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode");
    v20[3] = (uint64_t)v10;
    get_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCodeSymbolLoc_ptr = v10;
  }
  _Block_object_dispose(&v19, 8);
  if (v10)
  {
    ((void (*)(id))v10)(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = v12;
    else
      v13 = v9;
    v14 = v13;

    objc_msgSend(v6, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    return v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *__AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode(NSString *__strong)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("UIDictationConnection.m"), 64, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)isSmartLanguageSelectionEnabled
{
  int v3;

  v3 = _os_feature_enabled_impl();
  if (v3)
    LOBYTE(v3) = -[AFPreferences isSmartLanguageSelectionEnabled](self->_afPreferences, "isSmartLanguageSelectionEnabled");
  return v3;
}

- (BOOL)isOnDeviceDictationSupportAvailableForLanguage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  char v10;

  -[UIDictationConnectionPreferences getOfflineDictationStatusForLanguage:](self, "getOfflineDictationStatusForLanguage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    getAFOfflineDictationStatusHighQualityKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    getAFOfflineDictationStatusInstalledKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = objc_msgSend(v5, "BOOLValue");
    else
      v8 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = objc_msgSend(v7, "BOOLValue");
    else
      v10 = 0;
    v9 = v8 & v10;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isOnDeviceDictationSupportMissingAssetForLanguage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  int v10;

  -[UIDictationConnectionPreferences getOfflineDictationStatusForLanguage:](self, "getOfflineDictationStatusForLanguage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    getAFOfflineDictationStatusHighQualityKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    getAFOfflineDictationStatusInstalledKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = objc_msgSend(v5, "BOOLValue");
    else
      v8 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = objc_msgSend(v7, "BOOLValue") ^ 1;
    else
      LOBYTE(v10) = 1;
    v9 = v8 & v10;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isOnDeviceEmojiRecognitionSupportAvailableForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  char v13;
  BOOL result;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  -[UIDictationConnectionPreferences getOfflineDictationStatusForLanguage:](self, "getOfflineDictationStatusForLanguage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v12 = 0;
LABEL_13:

    return v12;
  }
  getAFOfflineDictationStatusInstalledKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v8 = (_QWORD *)getAFOfflineDictationStatusEmojiRecognitionKeySymbolLoc_ptr;
  v20 = getAFOfflineDictationStatusEmojiRecognitionKeySymbolLoc_ptr;
  if (!getAFOfflineDictationStatusEmojiRecognitionKeySymbolLoc_ptr)
  {
    v9 = AssistantServicesLibrary_0();
    v8 = dlsym(v9, "AFOfflineDictationStatusEmojiRecognitionKey");
    v18[3] = (uint64_t)v8;
    getAFOfflineDictationStatusEmojiRecognitionKeySymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v17, 8);
  if (v8)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = objc_msgSend(v10, "BOOLValue");
    else
      v11 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = objc_msgSend(v7, "BOOLValue");
    else
      v13 = 0;
    v12 = v11 & v13;

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAFOfflineDictationStatusEmojiRecognitionKey(void)");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("UIDictationConnection.m"), 67, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (AFPreferences)afPreferences
{
  return self->_afPreferences;
}

- (void)setAfPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_afPreferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_afPreferences, 0);
}

@end
