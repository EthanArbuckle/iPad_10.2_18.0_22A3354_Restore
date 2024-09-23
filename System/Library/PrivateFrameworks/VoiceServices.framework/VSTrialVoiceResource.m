@implementation VSTrialVoiceResource

- (id)factorName
{
  void *v2;
  void *v3;

  -[NSString stringByReplacingOccurrencesOfString:withString:](self->_language, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.resource.%@"), CFSTR("com.apple.siri.tts"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isLocal
{
  return -[NSString length](self->_path, "length") != 0;
}

- (VSTrialVoiceResource)initWithLanguage:(id)a3
{
  id v4;
  VSTrialVoiceResource *v5;
  uint64_t v6;
  NSString *language;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSTrialVoiceResource;
  v5 = -[VSTrialVoiceResource init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    language = v5->_language;
    v5->_language = (NSString *)v6;

  }
  return v5;
}

- (VSTrialVoiceResource)initWithFactorName:(id)a3
{
  id v4;
  VSTrialVoiceResource *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.siri.tts.resource"))
    && (objc_msgSend(v4, "hasSuffix:", CFSTR(".version")) & 1) == 0)
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 6)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      self = -[VSTrialVoiceResource initWithLanguage:](self, "initWithLanguage:", v8);
      v5 = self;
    }
    else
    {
      VSGetLogDefault();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_error_impl(&dword_1DE15E000, v9, OS_LOG_TYPE_ERROR, "#Trial Unexpected resource factor name: %@", (uint8_t *)&v11, 0xCu);
      }

      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (VSTrialVoiceResource)initWithFactorLevel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  VSTrialVoiceResource *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *path;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "factor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VSTrialVoiceResource initWithFactorName:](self, "initWithFactorName:", v6);

  if (v7 && objc_msgSend(v4, "hasLevel"))
  {
    objc_msgSend(v4, "level");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "directoryValue");
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (-[NSObject hasPath](v9, "hasPath"))
      {
        -[NSObject path](v9, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");

        if (v11)
        {
          -[NSObject path](v9, "path");
          v12 = objc_claimAutoreleasedReturnValue();
          path = v7->_path;
          v7->_path = (NSString *)v12;

        }
      }
      objc_msgSend(v4, "level");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ttsContentVersion"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7->_version = objc_msgSend(v16, "integerValue");
      }
    }
    else
    {
      VSGetLogDefault();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      objc_msgSend(v4, "factor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v18;
      _os_log_error_impl(&dword_1DE15E000, v9, OS_LOG_TYPE_ERROR, "#Trial Error: resource should be as directory. Factor name: %@", (uint8_t *)&v19, 0xCu);

    }
LABEL_12:

  }
  return v7;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end
