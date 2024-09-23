@implementation VSTrialVoice

- (BOOL)isLocal
{
  return -[NSString length](self->_path, "length") != 0;
}

- (VSTrialVoice)initWithLanguage:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  VSTrialVoice *v9;
  VSTrialVoice *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VSTrialVoice;
  v9 = -[VSTrialVoice init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_language, a3);
    objc_storeStrong((id *)&v10->_name, a4);
  }

  return v10;
}

- (VSTrialVoice)initWithFactorName:(id)a3
{
  id v4;
  VSTrialVoice *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  VSTrialVoice *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.siri.tts.voice"))
    && (objc_msgSend(v4, "hasSuffix:", CFSTR(".version")) & 1) == 0)
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 9)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectAtIndexedSubscript:", 6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[VSTrialVoice initWithLanguage:name:](self, "initWithLanguage:name:", v8, v9);
      if (v10)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v10->_type = +[VSVoiceAsset typeFromString:](VSVoiceAsset, "typeFromString:", v11);

        objc_msgSend(v6, "objectAtIndexedSubscript:", 8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10->_footprint = +[VSVoiceAsset footprintFromString:](VSVoiceAsset, "footprintFromString:", v12);

      }
      self = v10;

      v5 = self;
    }
    else
    {
      VSGetLogDefault();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412290;
        v16 = v4;
        _os_log_error_impl(&dword_1DE15E000, v13, OS_LOG_TYPE_ERROR, "#Trial Unexpected voice factor name: %@", (uint8_t *)&v15, 0xCu);
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

- (VSTrialVoice)initWithFactorLevel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  VSTrialVoice *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *path;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  VSTrialVoice *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  const char *v30;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "factor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VSTrialVoice initWithFactorName:](self, "initWithFactorName:", v6);

  if (v7)
  {
    if ((objc_msgSend(v4, "hasLevel") & 1) != 0)
    {
      objc_msgSend(v4, "level");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "directoryValue");
      v9 = objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        if ((-[NSObject hasAsset](v9, "hasAsset") & 1) != 0)
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
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("assetSize"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v7->_assetSize = objc_msgSend(v16, "longLongValue");
          }
          objc_msgSend(v4, "level");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "metadata");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ttsCompatibilityVersion"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v7->_compatibilityVersion = objc_msgSend(v19, "integerValue");
          }
          objc_msgSend(v4, "level");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "metadata");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ttsContentVersion"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v7->_version = objc_msgSend(v22, "integerValue");
          }
          objc_msgSend(v4, "level");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "metadata");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("gender"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
            v7->_gender = +[VSVoiceAsset genderFromString:](VSVoiceAsset, "genderFromString:", v25);

          goto LABEL_20;
        }
        VSGetLogDefault();
        v27 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          goto LABEL_29;
        objc_msgSend(v4, "factor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "name");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138412290;
        v33 = v29;
        v30 = "#Trial Error: voice is not deployed. It will be ignored. Factor name: %@";
      }
      else
      {
        VSGetLogDefault();
        v27 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
LABEL_29:

          goto LABEL_30;
        }
        objc_msgSend(v4, "factor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "name");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138412290;
        v33 = v29;
        v30 = "#Trial Error: voice should be as directory. Factor name: %@";
      }
      _os_log_error_impl(&dword_1DE15E000, v27, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v32, 0xCu);

    }
    else
    {
      VSGetLogDefault();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_30:

        v26 = 0;
        goto LABEL_31;
      }
      objc_msgSend(v4, "factor");
      v27 = objc_claimAutoreleasedReturnValue();
      -[NSObject name](v27, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138412290;
      v33 = v28;
      _os_log_error_impl(&dword_1DE15E000, v9, OS_LOG_TYPE_ERROR, "#Trial Error: Factor has no level. It will be ignored. Factor name: %@", (uint8_t *)&v32, 0xCu);
    }

    goto LABEL_29;
  }
LABEL_20:
  v26 = v7;
LABEL_31:

  return v26;
}

- (id)factorName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSString stringByReplacingOccurrencesOfString:withString:](self->_language, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSVoiceAsset typeStringFromType:](VSVoiceAsset, "typeStringFromType:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSVoiceAsset footprintStringFromFootprint:](VSVoiceAsset, "footprintStringFromFootprint:", self->_footprint);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.voice.%@.%@.%@.%@"), CFSTR("com.apple.siri.tts"), v3, self->_name, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)preferenceScore
{
  unint64_t v2;
  double v3;
  int64_t footprint;
  double v5;
  double v6;
  _BOOL4 v7;
  double result;

  v2 = self->_type - 1;
  v3 = 0.0;
  if (v2 <= 3)
    v3 = dbl_1DE1A1910[v2];
  footprint = self->_footprint;
  if (footprint == 3)
  {
    v6 = v3 + 300.0;
  }
  else
  {
    v5 = v3 + 200.0;
    if (footprint == 1)
      v3 = v3 + 100.0;
    if (footprint == 2)
      v6 = v5;
    else
      v6 = v3;
  }
  v7 = -[VSTrialVoice isLocal](self, "isLocal");
  result = v6 + 10.0;
  if (!v7)
    return v6;
  return result;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[VSTrialVoice factorName](self, "factorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Voice factor name: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)footprint
{
  return self->_footprint;
}

- (void)setFootprint:(int64_t)a3
{
  self->_footprint = a3;
}

- (int64_t)gender
{
  return self->_gender;
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
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

- (unint64_t)assetSize
{
  return self->_assetSize;
}

- (void)setAssetSize:(unint64_t)a3
{
  self->_assetSize = a3;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(int64_t)a3
{
  self->_compatibilityVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end
