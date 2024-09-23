@implementation SFSpeechSynthesisVoice

- (SFSpeechSynthesisVoice)initWithVoiceAsset:(id)a3 resourceAsset:(id)a4
{
  id v7;
  id v8;
  SFSpeechSynthesisVoice *v9;
  SFSpeechSynthesisVoice *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFSpeechSynthesisVoice;
  v9 = -[SFSpeechSynthesisVoice init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_voiceAsset, a3);
    objc_storeStrong((id *)&v10->_resourceAsset, a4);
  }

  return v10;
}

- (id)init:(id)a3 gender:(id)a4 name:(id)a5 isDefault:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  SFSpeechSynthesisVoice *v14;
  SFSpeechSynthesisVoice *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SFSpeechSynthesisVoice;
  v14 = -[SFSpeechSynthesisVoice init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_locale, a3);
    objc_storeStrong((id *)&v15->_gender, a4);
    objc_storeStrong((id *)&v15->_name, a5);
    v15->_isDefault = a6;
  }

  return v15;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)gender
{
  return self->_gender;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (int64_t)voiceType
{
  return self->_voiceType;
}

- (void)setVoiceType:(int64_t)a3
{
  self->_voiceType = a3;
}

- (int64_t)voiceReleaseType
{
  return self->_voiceReleaseType;
}

- (void)setVoiceReleaseType:(int64_t)a3
{
  self->_voiceReleaseType = a3;
}

- (SFSSVoiceAsset)voiceAsset
{
  return self->_voiceAsset;
}

- (void)setVoiceAsset:(id)a3
{
  objc_storeStrong((id *)&self->_voiceAsset, a3);
}

- (SFSSResourceAsset)resourceAsset
{
  return self->_resourceAsset;
}

- (void)setResourceAsset:(id)a3
{
  objc_storeStrong((id *)&self->_resourceAsset, a3);
}

- (SFSpeechSynthesisServerVoiceConfig)serverVoiceConfig
{
  return self->_serverVoiceConfig;
}

- (void)setServerVoiceConfig:(id)a3
{
  objc_storeStrong((id *)&self->_serverVoiceConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverVoiceConfig, 0);
  objc_storeStrong((id *)&self->_resourceAsset, 0);
  objc_storeStrong((id *)&self->_voiceAsset, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_gender, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() == a1)
  {
    v21 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v22 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pathForResource:ofType:", CFSTR("tts_voices"), CFSTR("plist"));
    v3 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v24;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v8));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", CFSTR("default"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10 != 0;

          objc_msgSend(v9, "objectForKey:", CFSTR("locale"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", CFSTR("gender"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", CFSTR("name"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[SFSpeechSynthesisVoice init:gender:name:isDefault:]([SFSpeechSynthesisVoice alloc], "init:gender:name:isDefault:", v13, v14, v15, v11);
          objc_msgSend(v21, "addObject:", v16);
          objc_msgSend(v22, "addObject:", v13);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v6);
    }
    v17 = (void *)sSupportedVoices;
    sSupportedVoices = (uint64_t)v21;
    v18 = v21;

    v19 = (void *)sSupportedLocales;
    sSupportedLocales = (uint64_t)v22;

  }
}

+ (id)supportedLocales
{
  return (id)sSupportedLocales;
}

+ (id)supportedVoicesByLocale:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)sSupportedVoices;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "locale", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v3);

        if (v12)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)getVoiceByName:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)sSupportedVoices;
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "name", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v3);

        if ((v10 & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)getDefaultVoiceByLocale:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "supportedVoicesByLocale:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "isDefault", (_QWORD)v12) & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

@end
