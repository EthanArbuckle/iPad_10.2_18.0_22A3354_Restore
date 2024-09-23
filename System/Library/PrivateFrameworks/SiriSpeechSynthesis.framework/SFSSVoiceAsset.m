@implementation SFSSVoiceAsset

- (SFSSVoiceAsset)initWithPath:(id)a3
{
  id v5;
  SFSSVoiceAsset *v6;
  SFSSVoiceAsset *v7;
  NSObject *v8;
  NSString *assetPath;
  objc_super v11;
  uint8_t buf[4];
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFSSVoiceAsset;
  v6 = -[SFSSVoiceAsset init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetPath, a3);
    SFSSGetLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      assetPath = v7->_assetPath;
      *(_DWORD *)buf = 138412290;
      v13 = assetPath;
      _os_log_impl(&dword_21E284000, v8, OS_LOG_TYPE_INFO, "Init VoiceAsset with assetPath=%@", buf, 0xCu);
    }

  }
  return v7;
}

- (id)init:(id)a3 gender:(int64_t)a4 name:(id)a5 type:(int64_t)a6 footprint:(int64_t)a7 contentVersion:(int64_t)a8
{
  id v14;
  id v15;
  SFSSVoiceAsset *v16;
  uint64_t v17;
  NSString *language;
  NSObject *v19;
  void *v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SFSSVoiceAsset;
  v16 = -[SFSSVoiceAsset init](&v22, sel_init);
  if (v16)
  {
    objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v17 = objc_claimAutoreleasedReturnValue();
    language = v16->_language;
    v16->_language = (NSString *)v17;

    v16->_gender = a4;
    objc_storeStrong((id *)&v16->_name, a5);
    v16->_footprint = a7;
    v16->_type = a6;
    v16->_contentVersion = a8;
  }
  SFSSGetLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    -[SFSSVoiceAsset key](v16, "key");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v20;
    _os_log_impl(&dword_21E284000, v19, OS_LOG_TYPE_INFO, "Init VoiceAsset with key=%@", buf, 0xCu);

  }
  return v16;
}

- (id)key
{
  void *v3;
  NSString *language;
  void *v5;
  NSString *name;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  language = self->_language;
  +[SFSpeechSynthesisUtils genderStringFromGender:](SFSpeechSynthesisUtils, "genderStringFromGender:", self->_gender);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  +[SFSpeechSynthesisUtils typeStringFromType:](SFSpeechSynthesisUtils, "typeStringFromType:", self->_type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFSpeechSynthesisUtils footprintStringFromFootprint:](SFSpeechSynthesisUtils, "footprintStringFromFootprint:", self->_footprint);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_contentVersion);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@:%@:%@:%@:%@"), language, v5, name, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (void)setAssetPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)language
{
  return self->_language;
}

- (int64_t)gender
{
  return self->_gender;
}

- (int64_t)footprint
{
  return self->_footprint;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)contentVersion
{
  return self->_contentVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_assetPath, 0);
}

+ (id)generateVoiceAssetFromVoiceKeyString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[SFSpeechSynthesisUtils genderFromString:](SFSpeechSynthesisUtils, "genderFromString:", v5);

  objc_msgSend(v3, "objectAtIndex:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[SFSpeechSynthesisUtils typeFromString:](SFSpeechSynthesisUtils, "typeFromString:", v8);

  objc_msgSend(v3, "objectAtIndex:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[SFSpeechSynthesisUtils footprintFromString:](SFSpeechSynthesisUtils, "footprintFromString:", v10);

  objc_msgSend(v3, "objectAtIndex:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  v14 = -[SFSSVoiceAsset init:gender:name:type:footprint:contentVersion:]([SFSSVoiceAsset alloc], "init:gender:name:type:footprint:contentVersion:", v4, v6, v7, v9, v11, v13);
  return v14;
}

@end
