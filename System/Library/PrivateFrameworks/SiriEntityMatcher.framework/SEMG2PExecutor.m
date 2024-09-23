@implementation SEMG2PExecutor

- (SEMG2PExecutor)initWithLocale:(id)a3 isJit:(BOOL)a4
{
  id v7;
  SEMG2PExecutor *v8;
  SEMG2PExecutor *v9;
  const char *v10;
  uint64_t v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SEMG2PExecutor;
  v8 = -[SEMG2PExecutor init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locale, a3);
    v9->_isJit = a4;
    objc_msgSend_setupUserProfile(v9, v10, v11);
  }

  return v9;
}

- (id)getAssetPath
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x24BDE9E00]);
  v5 = (void *)objc_msgSend_initWithLanguage_assetType_(v3, v4, (uint64_t)self->_locale, 3);
  objc_msgSend_sharedInstance(MEMORY[0x24BDE9E08], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_installedAssetWithConfig_(v8, v9, (uint64_t)v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)pronunciationsForOrthography:(id)a3
{
  objc_msgSend_pronunciationsForOrthography_(self->_user_profile, a2, (uint64_t)a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setupUserProfile
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  _EARUserProfileBuilder *v23;
  _EARUserProfileBuilder *user_profile;
  NSObject *v25;
  _EARUserProfileBuilder *v26;
  BOOL isJit;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (!self->_user_profile)
  {
    objc_msgSend_getAssetPath(self, a2, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v4, v5, v6))
    {
      objc_msgSend_stringByAppendingPathComponent_(v4, v7, (uint64_t)CFSTR("mini.json"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingPathComponent_(v4, v9, (uint64_t)CFSTR("ncs"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v11, (uint64_t)CFSTR("%@_napg.json"), self->_locale);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingPathComponent_(v10, v13, (uint64_t)v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_stringByAppendingPathComponent_(v10, v15, (uint64_t)CFSTR("vocdelta.voc"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingPathComponent_(v10, v17, (uint64_t)CFSTR("pg.voc"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingPathComponent_(v10, v19, (uint64_t)CFSTR("mrec.psh"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc(MEMORY[0x24BE2E750]);
      isJit = self->_isJit;
      v23 = (_EARUserProfileBuilder *)objc_msgSend_initWithConfiguration_language_overrides_sdapiOverrides_emptyVoc_pgVoc_paramsetHolder_isJit_(v21, v22, (uint64_t)v8, self->_locale, 0, v14, v16, v18, v20, isJit);
      user_profile = self->_user_profile;
      self->_user_profile = v23;

    }
    else
    {
      v25 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[SEMG2PExecutor setupUserProfile]";
        _os_log_error_impl(&dword_2462C4000, v25, OS_LOG_TYPE_ERROR, "%s G2P asset path is empty.", buf, 0xCu);
      }
      v26 = self->_user_profile;
      self->_user_profile = 0;

    }
  }
}

- (NSString)locale
{
  return self->_locale;
}

- (BOOL)isJit
{
  return self->_isJit;
}

- (_EARUserProfileBuilder)user_profile
{
  return self->_user_profile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user_profile, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
