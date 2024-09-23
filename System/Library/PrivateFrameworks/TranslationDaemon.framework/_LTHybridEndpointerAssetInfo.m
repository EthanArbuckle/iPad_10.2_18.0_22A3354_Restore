@implementation _LTHybridEndpointerAssetInfo

- (_LTHybridEndpointerAssetInfo)initWithAvailableAssets:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _LTHybridEndpointerAssetInfo *v8;
  _LTHybridEndpointerAssetInfo *v9;
  NSString *hybridepAssetFile;
  NSString *spgAssetFile;
  _LTDAssetModel *spgAsset;
  _LTDAssetModel *sourceLanguageAsset;
  _LTDAssetModel *targetLanguageAsset;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _LTDAssetModel *v21;
  _LTDAssetModel *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _LTDAssetModel *v26;
  _LTDAssetModel *v27;
  uint64_t v28;
  _LTDAssetModel *v29;
  NSObject *v30;
  _BOOL4 v31;
  _BOOL4 v32;
  _LTHybridEndpointerAssetInfo *v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  objc_super v40;
  uint8_t buf[4];
  _DWORD v42[7];

  *(_QWORD *)&v42[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)_LTHybridEndpointerAssetInfo;
  v8 = -[_LTHybridEndpointerAssetInfo init](&v40, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_21;
  hybridepAssetFile = v8->_hybridepAssetFile;
  v8->_hybridepAssetFile = (NSString *)CFSTR("hybridendpointer.json");

  spgAssetFile = v9->_spgAssetFile;
  v9->_spgAssetFile = (NSString *)CFSTR("hybridendpointer.json");

  if (!v6)
  {
    v34 = _LTOSLogSpeech();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
LABEL_21:
      v33 = 0;
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v35 = "No available endpointer assets";
LABEL_18:
    _os_log_impl(&dword_2491B9000, v34, OS_LOG_TYPE_INFO, v35, buf, 2u);
    goto LABEL_21;
  }
  if (!-[_LTHybridEndpointerAssetInfo endpointerIsAvailableWithContext:](v9, "endpointerIsAvailableWithContext:", v7))
  {
    v36 = _LTOSLogSpeech();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = v36;
      objc_msgSend(v7, "localePair");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v42 = v38;
      _os_log_impl(&dword_2491B9000, v37, OS_LOG_TYPE_INFO, "HEP endpointing is not supported for the requested locale pair: %{public}@", buf, 0xCu);

    }
    goto LABEL_21;
  }
  objc_storeStrong((id *)&v9->_context, a4);
  spgAsset = v9->_spgAsset;
  v9->_spgAsset = 0;

  sourceLanguageAsset = v9->_sourceLanguageAsset;
  v9->_sourceLanguageAsset = 0;

  targetLanguageAsset = v9->_targetLanguageAsset;
  v9->_targetLanguageAsset = 0;

  v15 = _LTOSLogSpeech();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    v17 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v42 = v17;
    _os_log_impl(&dword_2491B9000, v16, OS_LOG_TYPE_INFO, "Number of HEP assets %zu", buf, 0xCu);

  }
  objc_msgSend(v7, "localePair");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sourceLocale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTHybridEndpointerAssetInfo selectAsset:withLocale:](v9, "selectAsset:withLocale:", v6, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v9->_sourceLanguageAsset;
  v9->_sourceLanguageAsset = (_LTDAssetModel *)v20;

  v22 = v9->_sourceLanguageAsset;
  if (v22)
    objc_storeStrong((id *)&v9->_spgAsset, v22);
  if (objc_msgSend(v7, "autodetectLanguage"))
  {
    objc_msgSend(v7, "localePair");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "targetLocale");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTHybridEndpointerAssetInfo selectAsset:withLocale:](v9, "selectAsset:withLocale:", v6, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v9->_targetLanguageAsset;
    v9->_targetLanguageAsset = (_LTDAssetModel *)v25;

    v27 = v9->_targetLanguageAsset;
    if (v27)
    {
      -[_LTHybridEndpointerAssetInfo getPreferredAsset:orAsset:withLocale:](v9, "getPreferredAsset:orAsset:withLocale:", v9->_spgAsset, v27, 0);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v9->_spgAsset;
      v9->_spgAsset = (_LTDAssetModel *)v28;

    }
  }
  if (!v9->_sourceLanguageAsset && !v9->_targetLanguageAsset)
  {
    v34 = _LTOSLogSpeech();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v35 = "Could not find suitable HEP asset for any language";
    goto LABEL_18;
  }
  v30 = _LTOSLogSpeech();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = v9->_sourceLanguageAsset != 0;
    v32 = v9->_targetLanguageAsset != 0;
    *(_DWORD *)buf = 67109376;
    v42[0] = v31;
    LOWORD(v42[1]) = 1024;
    *(_DWORD *)((char *)&v42[1] + 2) = v32;
    _os_log_impl(&dword_2491B9000, v30, OS_LOG_TYPE_INFO, "Found asset for source %{BOOL}i, for target %{BOOL}i", buf, 0xEu);
  }
  v33 = v9;
LABEL_22:

  return v33;
}

- (id)selectAsset:(id)a3 withLocale:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      v13 = v10;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v6);
        -[_LTHybridEndpointerAssetInfo getPreferredAsset:orAsset:withLocale:](self, "getPreferredAsset:orAsset:withLocale:", v13, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v10;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)getPreferredAsset:(id)a3 orAsset:(id)a4 withLocale:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  v11 = v8;
  if (v7)
  {
    if (!v9
      || (v12 = objc_msgSend(v7, "supportsLocale:", v9), v13 = objc_msgSend(v8, "supportsLocale:", v10), (v12 & 1) != 0)
      || (v11 = v8, !v13))
    {
      v14 = objc_msgSend(v7, "contentVersion");
      v15 = objc_msgSend(v8, "contentVersion");
      v11 = v8;
      if (v14 >= v15)
      {
        if (v14 != v15
          || (v16 = objc_msgSend(v7, "isPremiumTextLID"), v17 = objc_msgSend(v8, "isPremiumTextLID"), v11 = v8, v16)
          && (!v17 || (v18 = objc_msgSend(v7, "state"), v11 = v8, v18 != 4)))
        {
          v11 = v7;
        }
      }
    }
  }
  v19 = v11;

  return v19;
}

- (id)caesuraModelURL
{
  void *v3;
  void *v4;

  -[_LTDAssetModel getLocalFileUrl](self->_spgAsset, "getLocalFileUrl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", self->_spgAssetFile);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)endpointerModelURL:(id)a3
{
  id v4;
  _LTDAssetModel **p_sourceLanguageAsset;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  p_sourceLanguageAsset = &self->_sourceLanguageAsset;
  if (self->_sourceLanguageAsset)
  {
    -[_LTTranslationContext localePair](self->_context, "localePair");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceLocale");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
      goto LABEL_6;
  }
  p_sourceLanguageAsset = &self->_targetLanguageAsset;
  if (self->_targetLanguageAsset
    && (-[_LTTranslationContext localePair](self->_context, "localePair"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "targetLocale"),
        v9 = (id)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9 == v4))
  {
LABEL_6:
    -[_LTDAssetModel getLocalFileUrl](*p_sourceLanguageAsset, "getLocalFileUrl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:", self->_hybridepAssetFile);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)endpointerIsAvailableWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  objc_msgSend(v3, "localePair");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "autodetectLanguage") & 1) != 0)
  {
    objc_msgSend(v3, "localePair");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = _LTPreferencesHybridEndpointerEnabledForLocales(v5, v7);

  }
  else
  {
    v8 = _LTPreferencesHybridEndpointerEnabledForLocales(v5, 0);
  }

  return v8;
}

- (NSString)hybridepAssetFile
{
  return self->_hybridepAssetFile;
}

- (NSString)spgAssetFile
{
  return self->_spgAssetFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spgAssetFile, 0);
  objc_storeStrong((id *)&self->_hybridepAssetFile, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_targetLanguageAsset, 0);
  objc_storeStrong((id *)&self->_sourceLanguageAsset, 0);
  objc_storeStrong((id *)&self->_spgAsset, 0);
}

@end
