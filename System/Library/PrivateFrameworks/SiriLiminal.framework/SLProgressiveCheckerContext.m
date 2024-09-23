@implementation SLProgressiveCheckerContext

- (SLProgressiveCheckerContext)initWithContext:(id)a3 error:(id *)a4
{
  id v6;
  SLProgressiveCheckerContext *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SLProgressiveCheckerContext *v13;
  SLProgressiveCheckerContext *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  SLProgressiveCheckerContext *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *locale;
  void *v23;
  uint64_t v24;
  NSDictionary *vtei;
  NSObject *v26;
  objc_super v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  SLProgressiveCheckerContext *v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SLProgressiveCheckerContext;
  v7 = -[SLProgressiveCheckerContext init](&v28, sel_init);
  if (!v7)
  {
LABEL_19:
    v18 = v7;
    goto LABEL_20;
  }
  if (SLLogInitIfNeeded_once != -1)
    dispatch_once(&SLLogInitIfNeeded_once, &__block_literal_global);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SLInvocationType"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SLAudioSourceOption"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SLLanguageCode"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_14;
    }
    else
    {

    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing keys in context"));
  v13 = (SLProgressiveCheckerContext *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!a4)
  {

LABEL_14:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SLAudioSourceOption"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_audioOption = objc_msgSend(v19, "unsignedIntegerValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SLInvocationType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_invocationType = objc_msgSend(v20, "unsignedIntegerValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SLLanguageCode"));
    v21 = objc_claimAutoreleasedReturnValue();
    locale = v7->_locale;
    v7->_locale = (NSString *)v21;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SLVoiceTriggerEventInfo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SLVoiceTriggerEventInfo"));
      v24 = objc_claimAutoreleasedReturnValue();
      vtei = v7->_vtei;
      v7->_vtei = (NSDictionary *)v24;
    }
    else
    {
      vtei = v7->_vtei;
      v7->_vtei = 0;
    }

    v26 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[SLProgressiveCheckerContext initWithContext:error:]";
      v31 = 2114;
      v32 = v7;
      _os_log_impl(&dword_213B50000, v26, OS_LOG_TYPE_INFO, "%s Created SLAcousticContext: %{public}@", buf, 0x16u);
    }
    goto LABEL_19;
  }
  v15 = (void *)MEMORY[0x24BDD1540];
  v33 = CFSTR("reason");
  v34[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sl"), 102, v16);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  v17 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[SLProgressiveCheckerContext initWithContext:error:]";
    v31 = 2114;
    v32 = v14;
    _os_log_error_impl(&dword_213B50000, v17, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
  }

  v18 = 0;
LABEL_20:

  return v18;
}

- (unint64_t)audioOption
{
  return self->_audioOption;
}

- (NSDictionary)vtei
{
  return self->_vtei;
}

- (unint64_t)invocationType
{
  return self->_invocationType;
}

- (NSString)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_vtei, 0);
}

@end
