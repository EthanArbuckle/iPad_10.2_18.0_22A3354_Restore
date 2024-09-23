@implementation SVXSessionUtils

- (id)getLanguageCodeWithAllowsFallback:(BOOL)a3 preferences:(id)a4
{
  _BOOL4 v4;
  id v5;
  __CFString *v6;
  __CFString *v7;
  os_log_t *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  void *v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SVXSessionUtils getLanguageCodeWithAllowsFallback:preferences:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("SVXSessionUtils.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferences != nil"));

  }
  objc_msgSend(v5, "languageCode");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v6, "length"))
  {
    v7 = v6;
    goto LABEL_19;
  }
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = *MEMORY[0x24BE08FB0];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    if (v4)
      goto LABEL_7;
LABEL_18:

    v7 = 0;
    goto LABEL_19;
  }
  *(_DWORD *)buf = 136315138;
  v18 = "-[SVXSessionUtils getLanguageCodeWithAllowsFallback:preferences:]";
  _os_log_error_impl(&dword_214934000, v9, OS_LOG_TYPE_ERROR, "%s Siri language code is nil.", buf, 0xCu);
  if (!v4)
    goto LABEL_18;
LABEL_7:
  objc_msgSend(v5, "bestSupportedLanguageCodeForLanguageCode:", 0);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v10 = -[__CFString length](v7, "length");
  v11 = *v8;
  if (v10)
  {
    if (!os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    *(_DWORD *)buf = 136315394;
    v18 = "-[SVXSessionUtils getLanguageCodeWithAllowsFallback:preferences:]";
    v19 = 2112;
    v20 = v7;
    v12 = "%s Best supported Siri language is %@.";
  }
  else
  {
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[SVXSessionUtils getLanguageCodeWithAllowsFallback:preferences:]";
      _os_log_error_impl(&dword_214934000, v11, OS_LOG_TYPE_ERROR, "%s Best supported Siri language is nil.", buf, 0xCu);
    }

    v11 = *v8;
    v7 = CFSTR("en-US");
    if (!os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    *(_DWORD *)buf = 136315394;
    v18 = "-[SVXSessionUtils getLanguageCodeWithAllowsFallback:preferences:]";
    v19 = 2112;
    v20 = CFSTR("en-US");
    v12 = "%s Default Siri language is %@.";
  }
  _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, v12, buf, 0x16u);
LABEL_15:
  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[SVXSessionUtils getLanguageCodeWithAllowsFallback:preferences:]";
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s Resolved Siri language code is %@.", buf, 0x16u);
  }
LABEL_19:

  return v7;
}

@end
