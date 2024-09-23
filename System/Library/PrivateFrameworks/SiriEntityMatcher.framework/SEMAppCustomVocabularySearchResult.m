@implementation SEMAppCustomVocabularySearchResult

+ (id)resultFromFTSRecords:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  void *v35;
  NSObject *v36;
  const char *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v3 = a3;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v41, v49, 16);
  if (v5)
  {
    v8 = v5;
    v39 = 0;
    v40 = 0;
    v9 = 0;
    LOWORD(v10) = 0;
    v11 = *(_QWORD *)v42;
    while (2)
    {
      v12 = v3;
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v12);
        v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v15 = objc_msgSend_fieldType(v14, v6, v7);
        if ((_DWORD)v15 == 63373 || (_DWORD)v15 == 61356)
        {
          objc_msgSend_fieldValue(v14, v16, v17);
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = v9;
          v9 = (void *)v19;
        }
        else
        {
          v21 = v15;
          if ((_DWORD)v15 == 61355)
            v10 = 1;
          else
            v10 = 2 * ((_DWORD)v15 == 63372);
          if ((v10 - 1) >= 2)
          {
            v26 = (void *)qword_25441F970;
            if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
            {
              v35 = (void *)MEMORY[0x24BE5B238];
              v36 = v26;
              objc_msgSend_descriptionForTypeIdentifier_(v35, v37, v21);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v46 = "+[SEMAppCustomVocabularySearchResult resultFromFTSRecords:]";
              v47 = 2112;
              v48 = v38;
              _os_log_error_impl(&dword_2462C4000, v36, OS_LOG_TYPE_ERROR, "%s Cannot convert fieldType: %@ to SEMAppCustomVocabularyType", buf, 0x16u);

            }
            v3 = v12;

            v27 = 0;
            v29 = v39;
            v28 = v40;
            goto LABEL_29;
          }
          objc_msgSend_fieldValue(v14, v16, v17);
          v22 = objc_claimAutoreleasedReturnValue();

          objc_msgSend_originAppId(v14, v23, v24);
          v25 = objc_claimAutoreleasedReturnValue();
          v20 = v40;
          v39 = (void *)v22;
          v40 = (void *)v25;
        }

      }
      v3 = v12;
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v6, (uint64_t)&v41, v49, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v39 = 0;
    v40 = 0;
    v9 = 0;
    LOWORD(v10) = 0;
  }

  v30 = objc_alloc((Class)objc_opt_class());
  v29 = v39;
  v28 = v40;
  v32 = objc_msgSend_initWithVocabularyType_vocabularyString_vocabularyIdentifier_originAppId_(v30, v31, (unsigned __int16)v10, v39, v9, v40);
  if (v32)
  {
    v27 = (void *)v32;
  }
  else
  {
    v33 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "+[SEMAppCustomVocabularySearchResult resultFromFTSRecords:]";
      v47 = 2112;
      v48 = v3;
      _os_log_error_impl(&dword_2462C4000, v33, OS_LOG_TYPE_ERROR, "%s Failed to parse FTS records: %@", buf, 0x16u);
    }
    v27 = 0;
  }
LABEL_29:

  return v27;
}

- (SEMAppCustomVocabularySearchResult)initWithVocabularyType:(unsigned __int16)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5 originAppId:(id)a6
{
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  SEMAppCustomVocabularySearchResult *v14;
  SEMAppCustomVocabularySearchResult *v15;
  SEMAppCustomVocabularySearchResult *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v9 = a3;
  v30 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)SEMAppCustomVocabularySearchResult;
  v14 = -[SEMAppCustomVocabularySearchResult init](&v25, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_5;
  v14->_vocabularyType = v9;
  if ((unsigned __int16)(v9 - 1) >= 2u)
  {
    v17 = (void *)qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)MEMORY[0x24BDD16E0];
      v19 = v17;
      objc_msgSend_numberWithUnsignedShort_(v18, v20, v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v27 = "-[SEMAppCustomVocabularySearchResult initWithVocabularyType:vocabularyString:vocabularyIdentifier:originAppId:]";
      v28 = 2112;
      v29 = v21;
      _os_log_error_impl(&dword_2462C4000, v19, OS_LOG_TYPE_ERROR, "%s Invalid vocabularyType: %@", buf, 0x16u);

    }
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v14->_vocabularyString, a4);
  if (!v15->_vocabularyString)
  {
    v22 = qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      v16 = 0;
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315394;
    v27 = "-[SEMAppCustomVocabularySearchResult initWithVocabularyType:vocabularyString:vocabularyIdentifier:originAppId:]";
    v28 = 2112;
    v29 = 0;
    v23 = "%s Invalid vocabularyString: %@";
LABEL_14:
    _os_log_error_impl(&dword_2462C4000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v15->_vocabularyIdentifier, a5);
  objc_storeStrong((id *)&v15->_originAppId, a6);
  if (!v15->_originAppId)
  {
    v22 = qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_DWORD *)buf = 136315394;
    v27 = "-[SEMAppCustomVocabularySearchResult initWithVocabularyType:vocabularyString:vocabularyIdentifier:originAppId:]";
    v28 = 2112;
    v29 = 0;
    v23 = "%s Invalid originAppId: %@";
    goto LABEL_14;
  }
LABEL_5:
  v16 = v15;
LABEL_12:

  return v16;
}

- (id)description
{
  void *v3;
  const char *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SEMAppCustomVocabularySearchResult;
  -[SEMAppCustomVocabularySearchResult description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v4, (uint64_t)CFSTR(" type: %u, string: %@, identifier: %@, originAppId: %@"), self->_vocabularyType, self->_vocabularyString, self->_vocabularyIdentifier, self->_originAppId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v9 = objc_msgSend_copyWithZone_(self->_originAppId, v8, (uint64_t)a3);
  v10 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = v9;

  v12 = objc_msgSend_copyWithZone_(self->_vocabularyIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v7 + 24);
  *(_QWORD *)(v7 + 24) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_vocabularyString, v14, (uint64_t)a3);
  v16 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v15;

  *(_WORD *)(v7 + 8) = self->_vocabularyType;
  return (id)v7;
}

- (BOOL)isEqual:(id)a3
{
  SEMAppCustomVocabularySearchResult *v4;
  SEMAppCustomVocabularySearchResult *v5;
  const char *v6;
  char isEqualToAppCustomVocabularySearchResult;

  v4 = (SEMAppCustomVocabularySearchResult *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToAppCustomVocabularySearchResult = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToAppCustomVocabularySearchResult = objc_msgSend_isEqualToAppCustomVocabularySearchResult_(self, v6, (uint64_t)v5);
  }
  else
  {
    isEqualToAppCustomVocabularySearchResult = 0;
  }

  return isEqualToAppCustomVocabularySearchResult;
}

- (BOOL)isEqualToAppCustomVocabularySearchResult:(id)a3
{
  void *v3;
  id v5;
  int vocabularyType;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSString *vocabularyString;
  NSString *v12;
  uint64_t v13;
  const char *v14;
  int v15;
  char isEqual;
  NSString *vocabularyIdentifier;
  NSString *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  int v22;
  NSString *originAppId;
  NSString *v24;
  uint64_t v25;
  int v26;
  int v27;
  void *v28;
  const char *v29;
  void *v30;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v5 = a3;
  vocabularyType = self->_vocabularyType;
  if (vocabularyType != objc_msgSend_vocabularyType(v5, v7, v8))
  {
    isEqual = 0;
    goto LABEL_32;
  }
  vocabularyString = self->_vocabularyString;
  v12 = vocabularyString;
  if (!vocabularyString)
  {
    objc_msgSend_vocabularyString(v5, v9, v10);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v36 = 0;
      v15 = 0;
      goto LABEL_10;
    }
    v36 = (void *)v13;
    v12 = self->_vocabularyString;
  }
  objc_msgSend_vocabularyString(v5, v9, v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqual_(v12, v14, (uint64_t)v3) & 1) == 0)
  {

    isEqual = 0;
    goto LABEL_30;
  }
  v15 = 1;
LABEL_10:
  vocabularyIdentifier = self->_vocabularyIdentifier;
  v18 = vocabularyIdentifier;
  if (!vocabularyIdentifier)
  {
    objc_msgSend_vocabularyIdentifier(v5, v9, v10);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v34 = 0;
      v22 = 0;
LABEL_17:
      originAppId = self->_originAppId;
      v24 = originAppId;
      if (!originAppId)
      {
        objc_msgSend_originAppId(v5, v9, v10);
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          v30 = 0;
          isEqual = 1;
          goto LABEL_25;
        }
        v32 = v25;
        v24 = self->_originAppId;
      }
      v26 = v22;
      v27 = v15;
      objc_msgSend_originAppId(v5, v9, v10, v32, v34);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v24, v29, (uint64_t)v28);

      v15 = v27;
      if (originAppId)
      {
        if (!v26)
          goto LABEL_27;
        v20 = v35;
        goto LABEL_26;
      }
      LOBYTE(v22) = v26;
      v30 = v33;
LABEL_25:

      v20 = v35;
      if ((v22 & 1) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
    v34 = (void *)v19;
    v18 = self->_vocabularyIdentifier;
  }
  objc_msgSend_vocabularyIdentifier(v5, v9, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqual_(v18, v21, (uint64_t)v20))
  {
    v35 = v20;
    v22 = 1;
    goto LABEL_17;
  }
  isEqual = 0;
LABEL_26:

LABEL_27:
  if (vocabularyIdentifier)
  {
    if (!v15)
      goto LABEL_30;
    goto LABEL_29;
  }

  if ((v15 & 1) != 0)
LABEL_29:

LABEL_30:
  if (!vocabularyString)

LABEL_32:
  return isEqual;
}

- (unint64_t)hash
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  unint64_t v15;

  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], a2, self->_vocabularyType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_hash(v3, v4, v5);
  v9 = objc_msgSend_hash(self->_vocabularyString, v7, v8);
  v12 = v9 ^ objc_msgSend_hash(self->_vocabularyIdentifier, v10, v11);
  v15 = v12 ^ objc_msgSend_hash(self->_originAppId, v13, v14) ^ v6;

  return v15;
}

- (unsigned)vocabularyType
{
  return self->_vocabularyType;
}

- (NSString)vocabularyString
{
  return self->_vocabularyString;
}

- (NSString)vocabularyIdentifier
{
  return self->_vocabularyIdentifier;
}

- (NSString)originAppId
{
  return self->_originAppId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originAppId, 0);
  objc_storeStrong((id *)&self->_vocabularyIdentifier, 0);
  objc_storeStrong((id *)&self->_vocabularyString, 0);
}

@end
