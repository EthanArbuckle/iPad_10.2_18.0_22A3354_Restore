@implementation TITrialManager

+ (TITrialManager)sharedInstance
{
  if (+[TITrialManager sharedInstance]::once != -1)
    dispatch_once(&+[TITrialManager sharedInstance]::once, &__block_literal_global_18481);
  return (TITrialManager *)(id)+[TITrialManager sharedInstance]::manager;
}

- (id)featuresInTrialForLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TITrialManager trialAsset](self, "trialAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "languageCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPrefix:", v6);

    if (v8)
    {
      -[TITrialManager trialAsset](self, "trialAsset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("FeaturesInTrial.plist"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = 0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v11, &v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v19;
      v14 = v13;
      if (v12)
      {
        v15 = v12;
LABEL_14:

        goto LABEL_15;
      }
      if (v13)
      {
        objc_msgSend(v13, "domain");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
        {
          v17 = objc_msgSend(v14, "code");

          if (v17 == 4)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v21 = "-[TITrialManager featuresInTrialForLocale:]";
              v22 = 2112;
              v23 = v11;
              _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s  %@ not present in trial bundle", buf, 0x16u);
            }
            goto LABEL_14;
          }
        }
        else
        {

        }
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v21 = "-[TITrialManager featuresInTrialForLocale:]";
        v22 = 2112;
        v23 = v11;
        v24 = 2112;
        v25 = v14;
        _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  Error loading url %@ as dictionary: %@.", buf, 0x20u);
      }
      goto LABEL_14;
    }
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (id)encodedCATrialParametersForLocale:(id)a3
{
  void *v3;
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
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  -[TITrialManager trialAsset](self, "trialAsset", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v15[0] = *MEMORY[0x1E0DBEA50];
    objc_msgSend(v3, "experimentIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "experimentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v15[1] = *MEMORY[0x1E0DBEA58];
    objc_msgSend(v4, "experimentIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "treatmentId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v8;
    v15[2] = *MEMORY[0x1E0DBEA48];
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "experimentIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "deploymentId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (DDSTrialAsset)trialAsset
{
  return (DDSTrialAsset *)objc_getProperty(self, a2, 32, 1);
}

- (id)inputTranscoderAssetsDirectoryURLForLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TITrialManager trialAsset](self, "trialAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TITrialManager urlForContentItemType:asset:locale:](self, "urlForContentItemType:asset:locale:", *MEMORY[0x1E0D43830], v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)favoniusLanguagePowerOverrideForLocale:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TITrialManager featuresInTrialForLocale:](self, "featuresInTrialForLocale:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("favonius_candidate_ranking"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("favonius_language_power_value"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)isNegativeLearningEnabledForLocale:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TITrialManager featuresInTrialForLocale:](self, "featuresInTrialForLocale:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("autocorrection_learning"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Enabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)inlineCompletionOperatingPointOverrideForLocale:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TITrialManager featuresInTrialForLocale:](self, "featuresInTrialForLocale:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("inline_completions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("operating_point"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodedLMTrialParametersForLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  std::string *v7;
  std::string *v8;
  int v9;
  char *v10;
  char *v11;
  char *v12;
  void *v13;
  id v14;
  char *v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  _QWORD *v20;
  void *v21;
  id v23;
  void *v24;
  id v25;
  void *v26;
  std::string v27;
  std::string __p;
  uint64_t *v29;
  _QWORD *v30[2];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  __int128 v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TITrialManager trialAsset](self, "trialAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TITrialManager urlForContentItemType:asset:locale:](self, "urlForContentItemType:asset:locale:", *MEMORY[0x1E0D43850], v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "localURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "path");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = (std::string *)objc_msgSend(v25, "UTF8String");
      memset(&__p, 0, sizeof(__p));
      v8 = (std::string *)((char *)v7 - 1);
      do
      {
        v9 = v8->__r_.__value_.__s.__data_[1];
        v8 = (std::string *)((char *)v8 + 1);
      }
      while (v9);
      std::string::append[abi:nn180100]<char const*,0>(&__p, v7, v8);
      v10 = (char *)objc_msgSend((id)*MEMORY[0x1E0DBEA50], "UTF8String");
      objc_msgSend(v5, "experimentIdentifiers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "experimentId");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = (char *)objc_msgSend(v23, "UTF8String");
      std::string::basic_string[abi:nn180100]<0>(v31, v10);
      std::string::basic_string[abi:nn180100]<0>(v32, v11);
      v12 = (char *)objc_msgSend((id)*MEMORY[0x1E0DBEA58], "UTF8String");
      objc_msgSend(v5, "experimentIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "treatmentId");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = (char *)objc_msgSend(v14, "UTF8String");
      std::string::basic_string[abi:nn180100]<0>(v33, v12);
      std::string::basic_string[abi:nn180100]<0>(v34, v15);
      v16 = (char *)objc_msgSend((id)*MEMORY[0x1E0DBEA48], "UTF8String");
      objc_msgSend(v5, "experimentIdentifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      std::to_string(&v27, objc_msgSend(v17, "deploymentId"));
      std::string::basic_string[abi:nn180100]<0>(v35, v16);
      v18 = 0;
      v36 = *(_OWORD *)&v27.__r_.__value_.__l.__data_;
      v37[0] = *((_QWORD *)&v27.__r_.__value_.__l + 2);
      memset(&v27, 0, sizeof(v27));
      v30[0] = 0;
      v30[1] = 0;
      v29 = (uint64_t *)v30;
      do
      {
        std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,std::string> const&>(&v29, (uint64_t *)v30, &v31[v18], (__int128 *)&v31[v18]);
        v18 += 6;
      }
      while (v18 != 18);
      for (i = 0; i != -18; i -= 6)
      {
        v20 = &v31[i];
        if (SHIBYTE(v37[i]) < 0)
          operator delete((void *)v20[15]);
        if (*((char *)v20 + 119) < 0)
          operator delete((void *)v20[12]);
      }
      if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v27.__r_.__value_.__l.__data_);

      v21 = (void *)LM::TrialParameters::copyEncodedRepresentation((LM::TrialParameters *)&__p);
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v30[0]);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (TITrialManager)initWithDDSTrialProvider:(id)a3
{
  id v5;
  TITrialManager *v6;
  TITrialManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TITrialManager;
  v6 = -[TITrialManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ddsTrialProvider, a3);

  return v7;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[TITrialManager didStart](self, "didStart"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[TITrialManager start]";
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s  Starting trial manager for A/B testing", buf, 0xCu);
    }
    -[TITrialManager setDidStart:](self, "setDidStart:", 1);
    -[TITrialManager ddsTrialProvider](self, "ddsTrialProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerDelegate:", self);

    -[TITrialManager ddsTrialProvider](self, "ddsTrialProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1CA18], "defaultQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUpTrialForQuery:", v5);

    -[TITrialManager ddsTrialProvider](self, "ddsTrialProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1CA18], "defaultQuery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __23__TITrialManager_start__block_invoke;
    v8[3] = &unk_1EA1065C8;
    v8[4] = self;
    objc_msgSend(v6, "fetchTrialAssetForQuery:callback:", v7, v8);

  }
}

- (id)urlForContentItemType:(id)a3 asset:(id)a4 locale:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  char v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc(MEMORY[0x1E0D1CA08]);
  objc_msgSend(v10, "localeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithLanguageIdentifier:", v12);

  -[TITrialManager ddsTrialProvider](self, "ddsTrialProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentItemsFromAssets:matchingFilter:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = v17;
  v19 = (void *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v19)
  {
    v26 = v9;
    v20 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v22, "type");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", v8);

        if ((v24 & 1) != 0)
        {
          objc_msgSend(v22, "path");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v19 = (void *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v19)
        continue;
      break;
    }
LABEL_11:
    v9 = v26;
  }

  return v19;
}

- (void)handleReceivedTrialAsset:(id)a3
{
  unint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (unint64_t)a3;
  -[TITrialManager trialAsset](self, "trialAsset");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != (id)v4)
  {
    -[TITrialManager trialAsset](self, "trialAsset");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v4 | v6)
    {

    }
    else
    {
      -[TITrialManager trialAsset](self, "trialAsset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", 0);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    -[TITrialManager setTrialAsset:](self, "setTrialAsset:", v4);
    -[TITrialManager updateCallback](self, "updateCallback");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
      TIDispatchAsync();

    }
  }
LABEL_9:

}

- (void)dealloc
{
  objc_super v3;

  -[DDSTrialProvider unregisterDelegate:](self->_ddsTrialProvider, "unregisterDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)TITrialManager;
  -[TITrialManager dealloc](&v3, sel_dealloc);
}

- (void)trialDidReceiveAsset:(id)a3 forQuery:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0D1CA18];
  v8 = a4;
  objc_msgSend(v7, "defaultQuery");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v11 = 136315394;
      v12 = "-[TITrialManager trialDidReceiveAsset:forQuery:]";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s  DDS: Received trial asset: %@", (uint8_t *)&v11, 0x16u);
    }
    -[TITrialManager handleReceivedTrialAsset:](self, "handleReceivedTrialAsset:", v6);
  }

}

- (void)trialDidStopForQuery:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D1CA18];
  v5 = a3;
  objc_msgSend(v4, "defaultQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[TITrialManager trialDidStopForQuery:]";
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s  DDS: Trial stopped", (uint8_t *)&v8, 0xCu);
    }
    -[TITrialManager handleReceivedTrialAsset:](self, "handleReceivedTrialAsset:", 0);
  }
}

- (id)updateCallback
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setUpdateCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (DDSTrialProvider)ddsTrialProvider
{
  return (DDSTrialProvider *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTrialAsset:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)didStart
{
  return self->_didStart;
}

- (void)setDidStart:(BOOL)a3
{
  self->_didStart = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialAsset, 0);
  objc_storeStrong((id *)&self->_ddsTrialProvider, 0);
  objc_storeStrong(&self->_updateCallback, 0);
}

uint64_t __43__TITrialManager_handleReceivedTrialAsset___block_invoke(uint64_t a1)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[TITrialManager handleReceivedTrialAsset:]_block_invoke";
    _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s  DDS: Calling trial update callback", (uint8_t *)&v3, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __23__TITrialManager_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = 136315394;
    v8 = "-[TITrialManager start]_block_invoke";
    v9 = 2112;
    v10 = v6;
    _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  Trial asset was not found: %@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "handleReceivedTrialAsset:", v5);

}

void __32__TITrialManager_sharedInstance__block_invoke()
{
  TITrialManager *v0;
  uint64_t v1;
  void *v2;
  DDSTrialProvider *v3;

  v0 = [TITrialManager alloc];
  v3 = objc_alloc_init(DDSTrialProvider);
  v1 = -[TITrialManager initWithDDSTrialProvider:](v0, "initWithDDSTrialProvider:", v3);
  v2 = (void *)+[TITrialManager sharedInstance]::manager;
  +[TITrialManager sharedInstance]::manager = v1;

}

@end
