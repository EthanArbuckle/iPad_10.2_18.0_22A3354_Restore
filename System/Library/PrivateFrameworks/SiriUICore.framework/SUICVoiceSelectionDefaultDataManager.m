@implementation SUICVoiceSelectionDefaultDataManager

- (SUICVoiceSelectionDefaultDataManager)init
{
  SUICVoiceSelectionDefaultDataManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUICVoiceSelectionDefaultDataManager;
  v2 = -[SUICVoiceSelectionDefaultDataManager init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUICVoiceSelectionDefaultDataManager setCurrentVoiceSelectionForOutputLanguage:](v2, "setCurrentVoiceSelectionForOutputLanguage:", v3);

  }
  return v2;
}

- (void)setRecognitionLanguageCode:(id)a3
{
  NSString *v4;
  NSString *recognitionLanguageCode;
  NSString *v6;
  NSString *outputLanguage;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  recognitionLanguageCode = self->_recognitionLanguageCode;
  self->_recognitionLanguageCode = v4;

  AFOutputVoiceLanguageForRecognitionLanguage();
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  outputLanguage = self->_outputLanguage;
  self->_outputLanguage = v6;

  -[SUICVoiceSelectionDefaultDataManager regenerateVoiceCollectionForRecognitionLanguageCode:outputLanguageCode:](self, "regenerateVoiceCollectionForRecognitionLanguageCode:outputLanguageCode:", self->_recognitionLanguageCode, self->_outputLanguage);
}

- (void)changeSiriVoiceToVoice:(id)a3 completion:(id)a4
{
  void *v6;
  NSDictionary *currentVoiceSelectionForOutputLanguage;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(id, uint64_t, _QWORD);

  v12 = (void (**)(id, uint64_t, _QWORD))a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  currentVoiceSelectionForOutputLanguage = self->_currentVoiceSelectionForOutputLanguage;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithDictionary:", currentVoiceSelectionForOutputLanguage);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "languageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, v10);

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUICVoiceSelectionDefaultDataManager setCurrentVoiceSelectionForOutputLanguage:](self, "setCurrentVoiceSelectionForOutputLanguage:", v11);

  -[SUICVoiceSelectionDefaultDataManager regenerateVoiceCollectionForRecognitionLanguageCode:outputLanguageCode:](self, "regenerateVoiceCollectionForRecognitionLanguageCode:outputLanguageCode:", self->_recognitionLanguageCode, self->_outputLanguage);
  if (v12)
    v12[2](v12, 1, 0);

}

- (void)changeSiriDialectLanguageToLanguageIdentifiedByLanguageCode:(id)a3 completion:(id)a4
{
  void (**v7)(id, uint64_t, _QWORD);
  id v8;

  v8 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (!-[NSString isEqualToString:](self->_outputLanguage, "isEqualToString:", v8))
  {
    objc_storeStrong((id *)&self->_outputLanguage, a3);
    -[SUICVoiceSelectionDefaultDataManager regenerateVoiceCollectionForRecognitionLanguageCode:outputLanguageCode:](self, "regenerateVoiceCollectionForRecognitionLanguageCode:outputLanguageCode:", self->_recognitionLanguageCode, self->_outputLanguage);
  }
  if (v7)
    v7[2](v7, 1, 0);

}

- (void)regenerateVoiceCollectionForRecognitionLanguageCode:(id)a3 outputLanguageCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  SUICVoiceSelectionVoiceCollection *v17;
  void *v18;
  SUICVoiceSelectionVoiceCollection *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUICVoiceSelectionDefaultDataManager voicesForRecognitionLanguageCode:outputLanguageCode:](self, "voicesForRecognitionLanguageCode:outputLanguageCode:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (-[SUICVoiceSelectionDefaultDataManager isVoiceSelected:](self, "isVoiceSelected:", v15))
        {
          v16 = v15;

          v12 = v16;
        }
        else
        {
          objc_msgSend(v8, "addObject:", v15);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }
  v17 = [SUICVoiceSelectionVoiceCollection alloc];
  -[SUICVoiceSelectionDefaultDataManager dialectLanguageCodeForLanguage:](self, "dialectLanguageCodeForLanguage:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SUICVoiceSelectionVoiceCollection initWithLanguageCode:dialectLanguageCodes:currentVoice:alternativeVoices:](v17, "initWithLanguageCode:dialectLanguageCodes:currentVoice:alternativeVoices:", v7, v18, v12, v8);

  -[SUICVoiceSelectionDefaultDataManager setVoiceSelectionVoiceCollection:](self, "setVoiceSelectionVoiceCollection:", v19);
}

- (BOOL)isVoiceSelected:(id)a3
{
  NSDictionary *currentVoiceSelectionForOutputLanguage;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  currentVoiceSelectionForOutputLanguage = self->_currentVoiceSelectionForOutputLanguage;
  v4 = a3;
  objc_msgSend(v4, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](currentVoiceSelectionForOutputLanguage, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v7, "isEqualToString:", v8);
  return (char)v4;
}

- (id)voicesForRecognitionLanguageCode:(id)a3 outputLanguageCode:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CFEAC0], "allVoicesForSiriSessionLanguage:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "languageCode", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v5);

        if (v15)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)dialectLanguageCodeForLanguage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(MEMORY[0x1E0CFEAC0], "allVoicesForSiriSessionLanguage:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "languageCode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "removeObject:", v3);
  objc_msgSend(v4, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setVoiceSelectionVoiceCollection:(id)a3
{
  SUICVoiceSelectionVoiceCollection *v4;
  SUICVoiceSelectionVoiceCollection *voiceSelectionVoiceCollection;
  id v6;

  v4 = (SUICVoiceSelectionVoiceCollection *)objc_msgSend(a3, "copy");
  voiceSelectionVoiceCollection = self->_voiceSelectionVoiceCollection;
  self->_voiceSelectionVoiceCollection = v4;

  -[SUICVoiceSelectionDefaultDataManager voiceSelectionDataProviderObserver](self, "voiceSelectionDataProviderObserver");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "voiceSelectionDataProviderVoiceCollectionDidChange:", self);

}

- (NSString)recognitionLanguageCode
{
  return self->_recognitionLanguageCode;
}

- (SUICVoiceSelectionVoiceCollection)voiceSelectionVoiceCollection
{
  return self->_voiceSelectionVoiceCollection;
}

- (SUICVoiceSelectionDataProviderObserving)voiceSelectionDataProviderObserver
{
  return (SUICVoiceSelectionDataProviderObserving *)objc_loadWeakRetained((id *)&self->_voiceSelectionDataProviderObserver);
}

- (void)setVoiceSelectionDataProviderObserver:(id)a3
{
  objc_storeWeak((id *)&self->_voiceSelectionDataProviderObserver, a3);
}

- (NSString)outputLanguage
{
  return self->_outputLanguage;
}

- (void)setOutputLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)currentVoiceSelectionForOutputLanguage
{
  return self->_currentVoiceSelectionForOutputLanguage;
}

- (void)setCurrentVoiceSelectionForOutputLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentVoiceSelectionForOutputLanguage, 0);
  objc_storeStrong((id *)&self->_outputLanguage, 0);
  objc_destroyWeak((id *)&self->_voiceSelectionDataProviderObserver);
  objc_storeStrong((id *)&self->_voiceSelectionVoiceCollection, 0);
  objc_storeStrong((id *)&self->_recognitionLanguageCode, 0);
}

@end
