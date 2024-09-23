@implementation UAFAssetStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)mockAssetStatus
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UAFAssetStatus *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!+[UAFCommonUtilities isInternalInstall](UAFCommonUtilities, "isInternalInstall"))
    return 0;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.siri.asset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("Mock Download State"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "description");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 136315394;
        v13 = "+[UAFAssetStatus mockAssetStatus]";
        v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_229282000, v5, OS_LOG_TYPE_DEFAULT, "%s #settings Using mock download state: %@", (uint8_t *)&v12, 0x16u);

      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("NotStarted")) & 1) != 0)
      {
        v7 = 0;
        v8 = 2;
LABEL_22:
        v10 = objc_alloc_init(UAFAssetStatus);
        -[UAFAssetStatus setState:](v10, "setState:", v8);
        -[UAFAssetStatus setValue:](v10, "setValue:", v7);

        goto LABEL_23;
      }
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("Downloading")))
      {
        objc_msgSend(v3, "objectForKey:", CFSTR("Mock Progress"));
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v7 = 0;
          v8 = 3;
          goto LABEL_21;
        }
        objc_opt_class();
        v8 = 3;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_13;
      }
      else
      {
        if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Finished")) & 1) != 0)
        {
          v7 = 0;
          v8 = 5;
          goto LABEL_22;
        }
        if (!objc_msgSend(v4, "isEqualToString:", CFSTR("OutOfSpace")))
        {
          v7 = 0;
          v8 = 0;
          goto LABEL_22;
        }
        objc_msgSend(v3, "objectForKey:", CFSTR("Mock Space Required"));
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v7 = 0;
          v8 = 6;
          goto LABEL_21;
        }
        objc_opt_class();
        v8 = 6;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_13:
          v11 = v11;
          v7 = v11;
LABEL_21:

          goto LABEL_22;
        }
      }
      v7 = 0;
      goto LABEL_21;
    }
  }
  v10 = 0;
LABEL_23:

  return v10;
}

+ (id)stringFromUAFAssetState:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return CFSTR("UAFAssetStateUnknown");
  else
    return off_24F1F7DA8[a3 - 1];
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t state;
  id v5;

  state = self->_state;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));

}

- (UAFAssetStatus)initWithCoder:(id)a3
{
  id v4;
  UAFAssetStatus *v5;
  uint64_t v6;
  NSNumber *value;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UAFAssetStatus;
  v5 = -[UAFAssetStatus init](&v9, sel_init);
  if (v5)
  {
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("value"));
    v6 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSNumber *)v6;

  }
  return v5;
}

+ (BOOL)dictationAvailableForLanguage:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD *v13;
  void *v14;
  NSObject *v15;
  char v16;
  char v17;
  NSObject *v18;
  _QWORD *v19;
  void *v20;
  char v21;
  NSObject *v22;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE buf[24];
  void *v29;
  uint64_t *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v5 = objc_claimAutoreleasedReturnValue();
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[UAFAssetStatus dictationAvailableForLanguage:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_229282000, v6, OS_LOG_TYPE_DEFAULT, "%s #settings Checking to see if on-device dictation assets are available for %{public}@", buf, 0x16u);
    }

    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v7 = (void *)_MergedGlobals_6;
    v27 = _MergedGlobals_6;
    if (!_MergedGlobals_6)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getAFPreferencesClass_block_invoke_0;
      v29 = &unk_24F1F7190;
      v30 = &v24;
      __getAFPreferencesClass_block_invoke_0((uint64_t)buf);
      v7 = (void *)v25[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v24, 8);
    objc_msgSend(v8, "sharedPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "offlineDictationStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "+[UAFAssetStatus dictationAvailableForLanguage:]";
        _os_log_error_impl(&dword_229282000, v12, OS_LOG_TYPE_ERROR, "%s #settings offlineDictationStatus is nil!", buf, 0xCu);
      }
      v17 = 0;
      goto LABEL_40;
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", v5);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "+[UAFAssetStatus dictationAvailableForLanguage:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v5;
        _os_log_error_impl(&dword_229282000, v15, OS_LOG_TYPE_ERROR, "%s #settings offlineDictationStatusForLanguage is nil for %{public}@!", buf, 0x16u);
      }
      v17 = 0;
      goto LABEL_39;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v13 = (_QWORD *)qword_2540B1CC8;
    v29 = (void *)qword_2540B1CC8;
    if (!qword_2540B1CC8)
    {
      v14 = (void *)AssistantServicesLibrary_3();
      v13 = dlsym(v14, "AFOfflineDictationStatusHighQualityKey");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v13;
      qword_2540B1CC8 = (uint64_t)v13;
    }
    _Block_object_dispose(buf, 8);
    if (v13)
    {
      -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", *v13);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "+[UAFAssetStatus dictationAvailableForLanguage:]";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v5;
          _os_log_error_impl(&dword_229282000, v18, OS_LOG_TYPE_ERROR, "%s #settings isHighQualityValue is nil for %{public}@!", buf, 0x16u);
        }
        goto LABEL_35;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = -[NSObject BOOLValue](v15, "BOOLValue");
      else
        v16 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v19 = (_QWORD *)qword_2540B1CD0;
      v29 = (void *)qword_2540B1CD0;
      if (!qword_2540B1CD0)
      {
        v20 = (void *)AssistantServicesLibrary_3();
        v19 = dlsym(v20, "AFOfflineDictationStatusInstalledKey");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v19;
        qword_2540B1CD0 = (uint64_t)v19;
      }
      _Block_object_dispose(buf, 8);
      if (v19)
      {
        -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", *v19);
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v21 = -[NSObject BOOLValue](v18, "BOOLValue");
          else
            v21 = 0;
          v17 = v16 & v21;
          goto LABEL_38;
        }
        UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "+[UAFAssetStatus dictationAvailableForLanguage:]";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v5;
          _os_log_error_impl(&dword_229282000, v22, OS_LOG_TYPE_ERROR, "%s #settings isInstalledValue is nil for %{public}@!", buf, 0x16u);
        }

        v18 = 0;
LABEL_35:
        v17 = 0;
LABEL_38:

LABEL_39:
LABEL_40:

        goto LABEL_41;
      }
    }
    dlerror();
    abort_report_np();
    __break(1u);
  }
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "+[UAFAssetStatus dictationAvailableForLanguage:]";
    _os_log_error_impl(&dword_229282000, v5, OS_LOG_TYPE_ERROR, "%s #settings dictation language is nil!", buf, 0xCu);
  }
  v17 = 0;
LABEL_41:

  return v17;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSString)siriLanguage
{
  return self->_siriLanguage;
}

- (void)setSiriLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_siriLanguage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriLanguage, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
