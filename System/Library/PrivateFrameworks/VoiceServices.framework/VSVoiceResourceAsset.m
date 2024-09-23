@implementation VSVoiceResourceAsset

+ (id)resourceFromTrial:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setStorage:", 3);
  objc_msgSend(v3, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLanguages:", v6);

  objc_msgSend(v3, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v3, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSearchPathURL:", v10);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "version"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentVersion:", v11);

  objc_msgSend(v4, "setCompatibilityVersion:", &unk_1EA8BE680);
  objc_msgSend(v4, "setIsPurgeable:", 1);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSArray componentsJoinedByString:](self->_languages, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAssetBase contentVersion](self, "contentVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("VoiceResource: %@_CV%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSVoiceResourceAsset;
  v4 = a3;
  -[VSAssetBase encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_languages, CFSTR("_languages"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchPathURL, CFSTR("_searchPathURL"));

}

- (VSVoiceResourceAsset)initWithCoder:(id)a3
{
  id v4;
  VSVoiceResourceAsset *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *languages;
  uint64_t v11;
  NSURL *searchPathURL;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VSVoiceResourceAsset;
  v5 = -[VSAssetBase initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_languages"));
    v9 = objc_claimAutoreleasedReturnValue();
    languages = v5->_languages;
    v5->_languages = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_searchPathURL"));
    v11 = objc_claimAutoreleasedReturnValue();
    searchPathURL = v5->_searchPathURL;
    v5->_searchPathURL = (NSURL *)v11;

  }
  return v5;
}

- (id)key
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[VSVoiceResourceAsset languages](self, "languages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAssetBase masteredVersion](self, "masteredVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAssetBase contentVersion](self, "contentVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@:%@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (float)rate
{
  float result;
  void *v4;
  void *v5;
  float v6;

  result = self->_rate;
  if (result == 0.0)
  {
    -[VSVoiceResourceAsset vocalizerConfig](self, "vocalizerConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voice_speech_rate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "floatValue");
    self->_rate = v6;

    return self->_rate;
  }
  return result;
}

- (float)pitch
{
  float result;
  void *v4;
  void *v5;
  float v6;

  result = self->_pitch;
  if (result == 0.0)
  {
    -[VSVoiceResourceAsset vocalizerConfig](self, "vocalizerConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voice_speech_pitch"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "floatValue");
    self->_pitch = v6;

    return self->_pitch;
  }
  return result;
}

- (float)volume
{
  float result;
  void *v4;
  void *v5;
  float v6;

  result = self->_volume;
  if (result == 0.0)
  {
    -[VSVoiceResourceAsset vocalizerConfig](self, "vocalizerConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voice_speech_volume"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "floatValue");
    self->_volume = v6;

    return self->_volume;
  }
  return result;
}

- (NSDictionary)vocalizerConfig
{
  NSDictionary *vocalizerConfig;
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;

  vocalizerConfig = self->_vocalizerConfig;
  if (!vocalizerConfig)
  {
    v4 = (void *)MEMORY[0x1E0C99D80];
    -[VSVoiceResourceAsset searchPathURL](self, "searchPathURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("VoiceServices-Config.plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithContentsOfURL:", v6);
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_vocalizerConfig;
    self->_vocalizerConfig = v7;

    vocalizerConfig = self->_vocalizerConfig;
  }
  return vocalizerConfig;
}

- (NSDictionary)voiceConfig
{
  NSDictionary *voiceConfig;
  void *v4;
  void *v5;
  NSDictionary *v6;
  id v7;
  NSDictionary *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  voiceConfig = self->_voiceConfig;
  if (!voiceConfig)
  {
    -[VSVoiceResourceAsset searchPathURL](self, "searchPathURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("voice_configs.plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v5, &v11);
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v8 = self->_voiceConfig;
    self->_voiceConfig = v6;

    if (v7)
    {
      VSGetLogDefault();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v13 = v5;
        v14 = 2114;
        v15 = v7;
        _os_log_error_impl(&dword_1DE15E000, v9, OS_LOG_TYPE_ERROR, "Unable to load plist at '%{public}@', error: %{public}@", buf, 0x16u);
      }

    }
    voiceConfig = self->_voiceConfig;
  }
  return voiceConfig;
}

- (NSDictionary)resourceMimeTypes
{
  NSDictionary *resourceMimeTypes;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  resourceMimeTypes = self->_resourceMimeTypes;
  if (!resourceMimeTypes)
  {
    -[VSVoiceResourceAsset voiceConfig](self, "voiceConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vocalizer_resources"));
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_resourceMimeTypes;
    self->_resourceMimeTypes = v5;

    resourceMimeTypes = self->_resourceMimeTypes;
  }
  return resourceMimeTypes;
}

- (NSArray)resourceList
{
  NSArray *resourceList;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  resourceList = self->_resourceList;
  if (!resourceList)
  {
    -[VSVoiceResourceAsset voiceConfig](self, "voiceConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vocalizer_resource_order"));
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_resourceList;
    self->_resourceList = v5;

    resourceList = self->_resourceList;
  }
  return resourceList;
}

- (id)_defaultVoices
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  -[VSVoiceResourceAsset voiceConfig](self, "voiceConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    VSGetLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DE15E000, v6, OS_LOG_TYPE_ERROR, "Unable to read voice_configs.plist", buf, 2u);
    }
    goto LABEL_9;
  }
  -[VSVoiceResourceAsset voiceConfig](self, "voiceConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_voices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    VSGetLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_ERROR, "voice_configs.plist does not have key '_voices'", v10, 2u);
    }

    v6 = 0;
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  v6 = v5;
  v7 = v6;
LABEL_10:

  return v7;
}

- (int64_t)defaultVoiceGender
{
  void *v2;
  void *v3;
  int64_t v4;

  -[VSVoiceResourceAsset _defaultVoices](self, "_defaultVoices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("default"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = +[VSVoiceAsset genderFromString:](VSVoiceAsset, "genderFromString:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)defaultVoiceNameForGender:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[VSVoiceResourceAsset _defaultVoices](self, "_defaultVoices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSVoiceAsset genderStringFromGender:](VSVoiceAsset, "genderStringFromGender:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)defaultVoiceType
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  uint8_t v9[16];

  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
      v9,
      2u);
  }

  -[VSVoiceResourceAsset defaultVoiceNameForGender:](self, "defaultVoiceNameForGender:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSVoiceResourceAsset defaultVoiceNameForGender:](self, "defaultVoiceNameForGender:", 1);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5 && !objc_msgSend(v4, "isEqualToString:", v5))
    v7 = 3;
  else
    v7 = 0;

  return v7;
}

- (id)defaultVoice
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v8[8];
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
      v8,
      2u);
  }

  -[VSVoiceResourceAsset _defaultVoices](self, "_defaultVoices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("default"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = CFSTR("Gender");
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)languages
{
  return self->_languages;
}

- (void)setLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setResourceList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setResourceMimeTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)searchPathURL
{
  return self->_searchPathURL;
}

- (void)setSearchPathURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (void)setPitch:(float)a3
{
  self->_pitch = a3;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (void)setVoiceConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setVocalizerConfig:(id)a3
{
  objc_storeStrong((id *)&self->_vocalizerConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocalizerConfig, 0);
  objc_storeStrong((id *)&self->_voiceConfig, 0);
  objc_storeStrong((id *)&self->_searchPathURL, 0);
  objc_storeStrong((id *)&self->_resourceMimeTypes, 0);
  objc_storeStrong((id *)&self->_resourceList, 0);
  objc_storeStrong((id *)&self->_languages, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
