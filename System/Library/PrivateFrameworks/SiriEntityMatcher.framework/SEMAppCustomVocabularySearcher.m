@implementation SEMAppCustomVocabularySearcher

+ (void)initialize
{
  if (qword_25441F968 != -1)
    dispatch_once(&qword_25441F968, &unk_25175EFF8);
}

- (SEMAppCustomVocabularySearcher)init
{
  return (SEMAppCustomVocabularySearcher *)MEMORY[0x24BEDD108](self, sel_initWithUserId_, 0);
}

- (SEMAppCustomVocabularySearcher)initWithUserId:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  SEMFTSMatcher *v8;
  const char *v9;
  void *v10;
  const char *v11;
  SEMAppCustomVocabularySearcher *v12;

  v4 = a3;
  objc_msgSend_defaultSharedInstance(SEMIndexSiteReadAccess, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [SEMFTSMatcher alloc];
  v10 = (void *)objc_msgSend_initWithFTSAccessProvider_(v8, v9, (uint64_t)v7);
  v12 = (SEMAppCustomVocabularySearcher *)objc_msgSend_initWithUserId_ftsMatcher_(self, v11, (uint64_t)v4, v10);

  return v12;
}

- (SEMAppCustomVocabularySearcher)initWithUserId:(id)a3 ftsMatcher:(id)a4
{
  id v7;
  id v8;
  SEMAppCustomVocabularySearcher *v9;
  SEMAppCustomVocabularySearcher *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SEMAppCustomVocabularySearcher;
  v9 = -[SEMAppCustomVocabularySearcher init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userId, a3);
    objc_storeStrong((id *)&v10->_ftsMatcher, a4);
  }

  return v10;
}

- (id)searchAppCustomVocabularyFTS:(id)a3 appIds:(id)a4 types:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  SEMFTSMatcher *ftsMatcher;
  const char *v21;
  uint64_t v22;
  void *v23;
  NSString *userId;
  const char *v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  int v32;
  const char *v33;
  uint64_t v34;
  int v35;
  NSObject *v36;
  NSObject *v37;
  id v39;
  uint8_t buf[4];
  _BYTE v41[10];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v12 = a5;
  if (v8 && objc_msgSend_length(v8, v10, v11))
  {
    objc_msgSend_builderWithMatchTerm_(SEMFTSCriteria, v13, (uint64_t)v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend__validateAppIds_andAddToCriteria_(self, v15, (uint64_t)v9, v14)
      && objc_msgSend__validateCustomTypes_andAddToCriteria_(self, v16, (uint64_t)v12, v14))
    {
      v17 = os_signpost_id_generate((os_log_t)qword_25441F970);
      v18 = (id)qword_25441F970;
      v19 = v18;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2462C4000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "searchAppCustomVocabularyFTS", (const char *)&unk_24633E77F, buf, 2u);
      }

      ftsMatcher = self->_ftsMatcher;
      objc_msgSend_build(v14, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      userId = self->_userId;
      v39 = 0;
      objc_msgSend_searchFTSWithCriteria_userId_error_(ftsMatcher, v25, (uint64_t)v23, userId, &v39);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v39;

      v28 = (id)qword_25441F970;
      v29 = v28;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        v32 = objc_msgSend_length(v8, v30, v31);
        v35 = objc_msgSend_count(v26, v33, v34);
        *(_DWORD *)buf = 67240448;
        *(_DWORD *)v41 = v32;
        *(_WORD *)&v41[4] = 1026;
        *(_DWORD *)&v41[6] = v35;
        _os_signpost_emit_with_name_impl(&dword_2462C4000, v29, OS_SIGNPOST_INTERVAL_END, v17, "searchAppCustomVocabularyFTS", " queryCharCnt=%{public,signpost.telemetry:number1}d  resultCnt=%{public,signpost.telemetry:number2}d  enableTelemetry=YES ", buf, 0xEu);
      }

      if (v27)
      {
        v36 = qword_25441F970;
        if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v41 = "-[SEMAppCustomVocabularySearcher searchAppCustomVocabularyFTS:appIds:types:]";
          *(_WORD *)&v41[8] = 2112;
          v42 = v27;
          _os_log_error_impl(&dword_2462C4000, v36, OS_LOG_TYPE_ERROR, "%s search service encountered error: %@", buf, 0x16u);
        }
      }

    }
    else
    {
      v26 = (void *)MEMORY[0x24BDBD1A8];
    }

  }
  else
  {
    v37 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v41 = "-[SEMAppCustomVocabularySearcher searchAppCustomVocabularyFTS:appIds:types:]";
      _os_log_error_impl(&dword_2462C4000, v37, OS_LOG_TYPE_ERROR, "%s Input validity check failed. The search term cannot be empty!", buf, 0xCu);
    }
    v26 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v26;
}

- (id)searchAppCustomVocabularyFTSWithWildcardPatterns:(id)a3 appIds:(id)a4 types:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  SEMFTSMatcher *ftsMatcher;
  const char *v21;
  uint64_t v22;
  void *v23;
  NSString *userId;
  const char *v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  int v33;
  const char *v34;
  uint64_t v35;
  int v36;
  NSObject *v37;
  NSObject *v38;
  void *v40;
  id v41;
  uint8_t buf[4];
  _BYTE v43[10];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v12 = a5;
  if (v8 && objc_msgSend_count(v8, v10, v11))
  {
    objc_msgSend_builderWithLikeTerms_(SEMFTSCriteria, v13, (uint64_t)v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend__validateAppIds_andAddToCriteria_(self, v15, (uint64_t)v9, v14)
      && objc_msgSend__validateCustomTypes_andAddToCriteria_(self, v16, (uint64_t)v12, v14))
    {
      v17 = os_signpost_id_generate((os_log_t)qword_25441F970);
      v18 = (id)qword_25441F970;
      v19 = v18;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2462C4000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "searchAppCustomVocabularyFTSWithWildcardPatterns", (const char *)&unk_24633E77F, buf, 2u);
      }

      ftsMatcher = self->_ftsMatcher;
      objc_msgSend_build(v14, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      userId = self->_userId;
      v41 = 0;
      objc_msgSend_searchFTSWithCriteria_userId_error_(ftsMatcher, v25, (uint64_t)v23, userId, &v41);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v41;

      v28 = (id)qword_25441F970;
      v29 = v28;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        objc_msgSend_componentsJoinedByString_(v8, v30, (uint64_t)CFSTR(" "));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend_length(v40, v31, v32);
        v36 = objc_msgSend_count(v26, v34, v35);
        *(_DWORD *)buf = 67240448;
        *(_DWORD *)v43 = v33;
        *(_WORD *)&v43[4] = 1026;
        *(_DWORD *)&v43[6] = v36;
        _os_signpost_emit_with_name_impl(&dword_2462C4000, v29, OS_SIGNPOST_INTERVAL_END, v17, "searchAppCustomVocabularyFTSWithWildcardPatterns", " queryCharCnt=%{public,signpost.telemetry:number1}d  resultCnt=%{public,signpost.telemetry:number2}d  enableTelemetry=YES ", buf, 0xEu);

      }
      if (v27)
      {
        v37 = qword_25441F970;
        if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v43 = "-[SEMAppCustomVocabularySearcher searchAppCustomVocabularyFTSWithWildcardPatterns:appIds:types:]";
          *(_WORD *)&v43[8] = 2112;
          v44 = v27;
          _os_log_error_impl(&dword_2462C4000, v37, OS_LOG_TYPE_ERROR, "%s search service encountered error: %@", buf, 0x16u);
        }
      }

    }
    else
    {
      v26 = (void *)MEMORY[0x24BDBD1A8];
    }

  }
  else
  {
    v38 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v43 = "-[SEMAppCustomVocabularySearcher searchAppCustomVocabularyFTSWithWildcardPatterns:appIds:types:]";
      _os_log_error_impl(&dword_2462C4000, v38, OS_LOG_TYPE_ERROR, "%s Input validity check failed. The search patterns cannot be empty!", buf, 0xCu);
    }
    v26 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v26;
}

- (BOOL)_validateAppIds:(id)a3 andAddToCriteria:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  id v20;
  BOOL v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v8 = a4;
  if (v5 && objc_msgSend_count(v5, v6, v7))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend_allObjects(v5, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v30, v40, 16);
      if (v13)
      {
        v15 = v13;
        v16 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v31 != v16)
              objc_enumerationMutation(v11);
            v18 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
            v29 = 0;
            v19 = (id)objc_msgSend_addOriginAppFilterWithAppId_error_(v8, v14, v18, &v29);
            v20 = v29;
            if (v20)
            {
              v23 = v20;
              v24 = qword_25441F970;
              if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v35 = "-[SEMAppCustomVocabularySearcher _validateAppIds:andAddToCriteria:]";
                v36 = 2112;
                v37 = v18;
                _os_log_error_impl(&dword_2462C4000, v24, OS_LOG_TYPE_ERROR, "%s Received unsupported appId (%@) appIds must be non-empty strings.", buf, 0x16u);
                v24 = qword_25441F970;
              }
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315650;
                v35 = "-[SEMAppCustomVocabularySearcher _validateAppIds:andAddToCriteria:]";
                v36 = 2112;
                v37 = v18;
                v38 = 2112;
                v39 = v23;
                _os_log_debug_impl(&dword_2462C4000, v24, OS_LOG_TYPE_DEBUG, "%s Criteria builder did not accept appId (%@) due to error: %@", buf, 0x20u);
              }

              v21 = 0;
              goto LABEL_22;
            }
          }
          v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v30, v40, 16);
          if (v15)
            continue;
          break;
        }
      }
      v21 = 1;
LABEL_22:

    }
    else
    {
      v22 = (void *)qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v26 = v22;
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v35 = "-[SEMAppCustomVocabularySearcher _validateAppIds:andAddToCriteria:]";
        v36 = 2112;
        v37 = (uint64_t)v28;
        _os_log_error_impl(&dword_2462C4000, v26, OS_LOG_TYPE_ERROR, "%s appIds parameter must be of class NSSet. Found class=%@", buf, 0x16u);

      }
      v21 = 0;
    }
  }
  else
  {
    v21 = 1;
  }

  return v21;
}

- (BOOL)_validateCustomTypes:(id)a3 andAddToCriteria:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  NSObject *v27;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v8 = a4;
  if (v5 && objc_msgSend_count(v5, v6, v7))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v9 = v5;
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v33, v43, 16);
      if (v11)
      {
        v13 = v11;
        v14 = *(_QWORD *)v34;
LABEL_6:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v9);
          v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v15);
          v32 = 0;
          v17 = (id)objc_msgSend_addFieldTypeFilterWithCustomTypeNumber_error_(v8, v12, v16, &v32);
          v18 = v32;
          if (v18)
            break;
          if (v13 == ++v15)
          {
            v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v33, v43, 16);
            if (v13)
              goto LABEL_6;
            goto LABEL_12;
          }
        }
        v22 = v18;
        v23 = objc_msgSend_code(v18, v12, v19);
        v24 = qword_25441F970;
        v25 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR);
        if (v23 == 4)
        {
          if (v25)
          {
            *(_DWORD *)buf = 136315394;
            v38 = "-[SEMAppCustomVocabularySearcher _validateCustomTypes:andAddToCriteria:]";
            v39 = 2112;
            v40 = v16;
            v26 = "%s vocabularyType (%@) is invalid. Refer to the enum definition in SEMAppCustomVocabularyType.h for su"
                  "pported vocabulary types.";
LABEL_27:
            _os_log_error_impl(&dword_2462C4000, v24, OS_LOG_TYPE_ERROR, v26, buf, 0x16u);
          }
        }
        else if (v25)
        {
          *(_DWORD *)buf = 136315394;
          v38 = "-[SEMAppCustomVocabularySearcher _validateCustomTypes:andAddToCriteria:]";
          v39 = 2112;
          v40 = v16;
          v26 = "%s Received unsupported vocabularyType (%@). vocabularyTypes must be valid SEMAppCustomVocabularyTypeNumber objects.";
          goto LABEL_27;
        }
        v27 = qword_25441F970;
        if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v38 = "-[SEMAppCustomVocabularySearcher _validateCustomTypes:andAddToCriteria:]";
          v39 = 2112;
          v40 = v16;
          v41 = 2112;
          v42 = v22;
          _os_log_debug_impl(&dword_2462C4000, v27, OS_LOG_TYPE_DEBUG, "%s Criteria builder did not accept vocabularyType (%@) due to error: %@", buf, 0x20u);
        }

        v20 = 0;
        goto LABEL_24;
      }
LABEL_12:
      v20 = 1;
LABEL_24:

    }
    else
    {
      v21 = (void *)qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v29 = v21;
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v38 = "-[SEMAppCustomVocabularySearcher _validateCustomTypes:andAddToCriteria:]";
        v39 = 2112;
        v40 = (uint64_t)v31;
        _os_log_error_impl(&dword_2462C4000, v29, OS_LOG_TYPE_ERROR, "%s vocabularyTypes parameter must be of class NSSet. Found class: %@", buf, 0x16u);

      }
      v20 = 0;
    }
  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_ftsMatcher, 0);
}

@end
