@implementation SEMLocalization

+ (id)defaultLocalization
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;

  v2 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_currentSiriLanguageCode(SEMAssistantSettingsBridge, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend_initWithSiriLanguageCode_(v2, v6, (uint64_t)v5);

  return v7;
}

- (SEMLocalization)initWithSiriLanguageCode:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  SEMLocalization *v7;
  uint64_t v8;
  NSString *siriLanguageCode;
  NSSet *dictationLanguageCodes;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SEMLocalization;
  v7 = -[SEMLocalization init](&v15, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_copy(v4, v5, v6);
    siriLanguageCode = v7->_siriLanguageCode;
    v7->_siriLanguageCode = (NSString *)v8;

    dictationLanguageCodes = v7->_dictationLanguageCodes;
    v7->_dictationLanguageCodes = 0;

    v7->_assetRequestCount = 0;
    v7->_assetResolved = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("SEMLocalization", v11);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;

  }
  return v7;
}

- (SEMLocalization)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_siriLanguageCode, CFSTR("l"));
}

- (SEMLocalization)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  void *v8;
  SEMLocalization *v9;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, CFSTR("l"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    self = (SEMLocalization *)(id)objc_msgSend_initWithSiriLanguageCode_(self, v7, (uint64_t)v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SEMLocalization *v4;
  SEMLocalization *v5;
  const char *v6;
  char isEqualToLocalization;

  v4 = (SEMLocalization *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToLocalization = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToLocalization = objc_msgSend_isEqualToLocalization_(self, v6, (uint64_t)v5);
  }
  else
  {
    isEqualToLocalization = 0;
  }

  return isEqualToLocalization;
}

- (BOOL)isEqualToLocalization:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char isEqual;

  v4 = a3;
  objc_msgSend_siriLanguageCode(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_siriLanguageCode(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v7, v11, (uint64_t)v10);

  return isEqual;
}

- (id)siriLanguageCode
{
  NSObject *queue;
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
  v9 = sub_24630DCC0;
  v10 = sub_24630DCD0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_24630DCD8;
  v5[3] = &unk_2517833D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)dictationLanguageCodes
{
  NSObject *queue;
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
  v9 = sub_24630DCC0;
  v10 = sub_24630DCD0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_24630DDA0;
  v5[3] = &unk_2517833D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)refresh
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_24630DE54;
  block[3] = &unk_251783400;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)allLanguageCodes
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend_dictationLanguageCodes(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithSet_(v4, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_siriLanguageCode(self, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend_addObject_(v7, v10, (uint64_t)v11);

  return v7;
}

+ (id)supportedNSLocaleFromLanguageCode:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  v6 = objc_msgSend_supportedLocaleFromLanguageCode_(v4, v5, (uint64_t)v3);
  sub_24630E148(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (int64_t)supportedLocaleFromLanguageCode:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v3, v4, (uint64_t)CFSTR("-"), CFSTR("_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = sub_24630F1B4(v5);

  if (!v6)
  {
    v7 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "+[SEMLocalization supportedLocaleFromLanguageCode:]";
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_2462C4000, v7, OS_LOG_TYPE_ERROR, "%s Unsupported language code (%@)", (uint8_t *)&v9, 0x16u);
    }
  }

  return v6;
}

+ (id)supportedLanguageCodeFromLocale:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;
  const char *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  const char *v11;

  v3 = a3;
  v6 = sub_24630E3AC(v3, v4, v5);
  if (v6)
  {
    if (v6 >= 0x2D)
      v8 = 0;
    else
      v8 = v6;
    if (v8 <= 0x2Cu)
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v7, (uint64_t)off_251783490[v8], 4);
    else
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v7, (uint64_t)"", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v10, v11, (uint64_t)CFSTR("_"), CFSTR("-"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)locateMorphunAssetForSiriLanguage:(id *)a3 error:(id *)a4
{
  NSObject *queue;
  int64_t v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_24630DCC0;
  v13 = sub_24630DCD0;
  v14 = 0;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_24630E4E8;
  v8[3] = &unk_251783428;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = &v15;
  v8[7] = a4;
  dispatch_sync(queue, v8);
  v6 = v16[3];
  if (a3 && v6)
  {
    *a3 = objc_retainAutorelease((id)v10[5]);
    v6 = v16[3];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (BOOL)_locateMorphunAssetForLocale:(id)a3 outAssetPath:(id *)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  int assetRequestCount;
  void *v30;
  void *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  int v39;
  NSObject *v40;
  _BOOL4 v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  dispatch_time_t v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  NSObject *v53;
  const char *v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  void *v73;
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  NSObject *v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (!objc_msgSend_isLocaleEmbedded_(MEMORY[0x24BE68FD0], v9, (uint64_t)v8))
  {
    v71 = 0;
    objc_msgSend_getAssetPathForLocale_withError_(MEMORY[0x24BE68FD0], v10, (uint64_t)v8, &v71);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v71;
    v11 = v16;
    if (v15)
    {
      v19 = (id)qword_25441F970;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_localeIdentifier(v8, v20, v21);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v75 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
        v76 = 2112;
        v77 = v60;
        v78 = 2112;
        v79 = v15;
        _os_log_debug_impl(&dword_2462C4000, v19, OS_LOG_TYPE_DEBUG, "%s Resolved asset path for locale (%@) %@", buf, 0x20u);

      }
      if (!a4)
        goto LABEL_15;
      v22 = objc_retainAutorelease(v15);
LABEL_10:
      v15 = v22;
      *a4 = v22;
LABEL_15:
      v14 = 1;
LABEL_16:

      goto LABEL_17;
    }
    if (objc_msgSend_code(v16, v17, v18) == 1)
    {
      v25 = (id)qword_25441F970;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_localeIdentifier(v8, v26, v27);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v75 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
        v76 = 2112;
        v77 = v62;
        _os_log_debug_impl(&dword_2462C4000, v25, OS_LOG_TYPE_DEBUG, "%s Locale: %@ is unsupported by MorphunAssets - proceeding without asset path", buf, 0x16u);

      }
      v15 = 0;
      goto LABEL_15;
    }
    assetRequestCount = self->_assetRequestCount;
    self->_assetRequestCount = assetRequestCount + 1;
    if (assetRequestCount)
    {
      v30 = (void *)MEMORY[0x24BDD1540];
      v72 = *MEMORY[0x24BDD0FC8];
      v31 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_localeIdentifier(v8, v23, v24);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v31, v33, (uint64_t)CFSTR("Previous attempt to request Morphun asset failed for locale: %@ attempts: %u"), v32, self->_assetRequestCount);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v34;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v35, (uint64_t)&v73, &v72, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v30, v37, (uint64_t)CFSTR("com.apple.siri.entitymatcher.tokenization"), 2, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2462F1D28(a5, v38);

      v39 = self->_assetRequestCount;
      v40 = (id)qword_25441F970;
      v41 = os_log_type_enabled(v40, OS_LOG_TYPE_INFO);
      if (v39 == 2)
      {
        if (v41)
        {
          objc_msgSend_localeIdentifier(v8, v42, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v75 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
          v76 = 2112;
          v77 = v44;
          _os_log_impl(&dword_2462C4000, v40, OS_LOG_TYPE_INFO, "%s Issuing a non-blocking MorphunAssets download request for locale: %@", buf, 0x16u);

        }
        v45 = (void *)MEMORY[0x24BE68FD0];
        v68[0] = MEMORY[0x24BDAC760];
        v68[1] = 3221225472;
        v68[2] = sub_24630EF10;
        v68[3] = &unk_251783450;
        v69 = v8;
        objc_msgSend_onDemandDownloadForLocale_withProgress_withCompletion_(v45, v46, (uint64_t)v69, 0, v68);

      }
      else
      {
        if (v41)
        {
          objc_msgSend_localeIdentifier(v8, v42, v43);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v75 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
          v76 = 2112;
          v77 = v59;
          _os_log_impl(&dword_2462C4000, v40, OS_LOG_TYPE_INFO, "%s MorphunAssets download attempts exhausted for locale: %@", buf, 0x16u);

        }
      }
    }
    else
    {
      v47 = dispatch_time(0, 60000000000);
      v48 = (id)qword_25441F970;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_localeIdentifier(v8, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v75 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
        v76 = 2112;
        v77 = v51;
        v78 = 1024;
        LODWORD(v79) = 60;
        _os_log_impl(&dword_2462C4000, v48, OS_LOG_TYPE_INFO, "%s Issuing a blocking MorphunAssets download request for locale: %@ with timeout of %d s", buf, 0x1Cu);

      }
      objc_msgSend_blockingOnDemandDownloadForLocale_withTimeout_withProgress_(MEMORY[0x24BE68FD0], v52, (uint64_t)v8, v47, 0);
      v53 = objc_claimAutoreleasedReturnValue();

      if (v53)
      {
        v55 = (id)qword_25441F970;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_localeIdentifier(v8, v56, v57);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v75 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
          v76 = 2112;
          v77 = v66;
          v78 = 2112;
          v79 = v53;
          _os_log_error_impl(&dword_2462C4000, v55, OS_LOG_TYPE_ERROR, "%s MorphunAssets download request failed for locale: %@ error: %@", buf, 0x20u);

        }
        sub_2462F1D28(a5, v53);
        v15 = 0;
        v14 = 0;
        v11 = v53;
        goto LABEL_16;
      }
      v70 = 0;
      objc_msgSend_getAssetPathForLocale_withError_(MEMORY[0x24BE68FD0], v54, (uint64_t)v8, &v70);
      v61 = objc_claimAutoreleasedReturnValue();
      v11 = v70;
      if (v61)
      {
        if (!a4)
        {
          v14 = 1;
          v15 = v61;
          goto LABEL_16;
        }
        v22 = objc_retainAutorelease(v61);
        goto LABEL_10;
      }
      v63 = (id)qword_25441F970;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_localeIdentifier(v8, v64, v65);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v75 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
        v76 = 2112;
        v77 = v67;
        v78 = 2112;
        v79 = v11;
        _os_log_error_impl(&dword_2462C4000, v63, OS_LOG_TYPE_ERROR, "%s Failed to get asset path for locale: %@ after download. error: %@", buf, 0x20u);

      }
      sub_2462F1D28(a5, v11);
    }
    v15 = 0;
    v14 = 0;
    goto LABEL_16;
  }
  v11 = (id)qword_25441F970;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_localeIdentifier(v8, v12, v13);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v75 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
    v76 = 2112;
    v77 = v58;
    _os_log_debug_impl(&dword_2462C4000, v11, OS_LOG_TYPE_DEBUG, "%s Locale %@ is embedded.", buf, 0x16u);

  }
  v14 = 1;
LABEL_17:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedAssetPath, 0);
  objc_storeStrong((id *)&self->_dictationLanguageCodes, 0);
  objc_storeStrong((id *)&self->_siriLanguageCode, 0);
}

@end
