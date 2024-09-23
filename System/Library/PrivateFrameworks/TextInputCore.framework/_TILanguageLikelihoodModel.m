@implementation _TILanguageLikelihoodModel

- (unint64_t)emojiUsageCountForApp:(id)a3 lastEmojiCountUpdateTime:(double *)a4
{
  id v5;
  uint64_t EmojiUsageCountForApp;
  unint64_t v7;

  v5 = a3;
  EmojiUsageCountForApp = -[_TILanguageLikelihoodModel languageLikelihoodModelRef](self, "languageLikelihoodModelRef");
  if (EmojiUsageCountForApp)
    EmojiUsageCountForApp = LMLanguageLikelihoodModelGetEmojiUsageCountForApp();
  v7 = EmojiUsageCountForApp & ~(EmojiUsageCountForApp >> 63);

  return v7;
}

- (void)languageLikelihoodModelRef
{
  void *result;
  __CFDictionary *Mutable;
  const void *v5;

  if (!TI_DEVICE_UNLOCKED_SINCE_BOOT())
    return 0;
  result = self->_languageLikelihoodModelRef;
  if (!result)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v5 = (const void *)TI_KB_USER_DIRECTORY();
    if (v5)
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D43470], v5);
    result = (void *)LMLanguageLikelihoodModelGetUserModel();
    self->_languageLikelihoodModelRef = result;
    if (Mutable)
    {
      CFRelease(Mutable);
      return self->_languageLikelihoodModelRef;
    }
  }
  return result;
}

+ (id)sharedLanguageLikelihoodModel
{
  if (__testingInstance)
    return (id)__testingInstance;
  +[_TILanguageLikelihoodModel singletonInstance](_TILanguageLikelihoodModel, "singletonInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)singletonInstance
{
  if (+[_TILanguageLikelihoodModel singletonInstance]::onceToken != -1)
    dispatch_once(&+[_TILanguageLikelihoodModel singletonInstance]::onceToken, &__block_literal_global_14053);
  return (id)+[_TILanguageLikelihoodModel singletonInstance]::singletonInstance;
}

- (_TILanguageLikelihoodModel)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TILanguageLikelihoodModel;
  return -[_TILanguageLikelihoodModel init](&v3, sel_init);
}

- (void)addEvidence:(id)a3 timestamp:(double)a4 adaptationType:(int)a5 forRecipient:(id)a6 app:(id)a7 language:(id)a8
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v13 = a7;
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel)
  {
    TIOSLogFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [recipient=%@, app=%@] evidence = \"%@\"), "-[_TILanguageLikelihoodModel addEvidence:timestamp:adaptationType:forRecipient:app:language:]", v12, v13, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v15;
      _os_log_debug_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  if (-[_TILanguageLikelihoodModel languageLikelihoodModelRef](self, "languageLikelihoodModelRef"))
    LMLanguageLikelihoodModelAddEvidenceForLanguage();

}

- (id)rankedLanguagesForRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (-[_TILanguageLikelihoodModel languageLikelihoodModelRef](self, "languageLikelihoodModelRef"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LMLanguageLikelihoodModelGetLanguagePriorProbabilities();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58___TILanguageLikelihoodModel_rankedLanguagesForRecipient___block_invoke;
    v10[3] = &unk_1EA103C40;
    v11 = v5;
    v7 = v5;
    objc_msgSend(v6, "sortedArrayUsingComparator:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (void)priorProbabilityForLanguages:(id)a3 recipient:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, char *, float);
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  float v24;
  float v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  char v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, char *, float))a5;
  if (-[_TILanguageLikelihoodModel languageLikelihoodModelRef](self, "languageLikelihoodModelRef"))
  {
    v38 = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v28 = v8;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v11, "setObject:forKey:", &unk_1EA1404B0, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v14);
    }

    v29 = v9;
    LMLanguageLikelihoodModelGetLanguagePriorProbabilities();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v17 = v12;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v31;
LABEL_11:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v21);
        objc_msgSend(v11, "objectForKey:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "floatValue");
        v25 = v24;

        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          TIOSLogFacility();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Pr(language=%@|recipient=%@) = %.3g"), "-[_TILanguageLikelihoodModel priorProbabilityForLanguages:recipient:handler:]", v22, v29, v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v40 = v27;
            _os_log_debug_impl(&dword_1DA6F2000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }
        v10[2](v10, v22, &v38, v25);
        if (v38)
          break;
        if (v19 == ++v21)
        {
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
          if (v19)
            goto LABEL_11;
          break;
        }
      }
    }

    v8 = v28;
    v9 = v29;
  }

}

- (double)lastOfflineAdaptationTimeForApp:(id)a3
{
  id v4;
  double Current;
  double v6;

  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  if (-[_TILanguageLikelihoodModel languageLikelihoodModelRef](self, "languageLikelihoodModelRef"))
  {
    LMLanguageLikelihoodModelGetLastOfflineAdaptationTime();
    Current = v6;
  }

  return Current;
}

+ (void)setSharedLanguageLikelihoodModel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)__testingInstance != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&__testingInstance, a3);
    v4 = v5;
  }

}

@end
