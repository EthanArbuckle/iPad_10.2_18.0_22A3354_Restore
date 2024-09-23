@implementation VSVoiceAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)amendNameVersionAndSizeWithMobileAssetAttributes:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[VSVoiceAsset name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSVoiceAsset setName:](self, "setName:", v6);

  }
  -[VSAssetBase masteredVersion](self, "masteredVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D4DF08]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAssetBase setMasteredVersion:](self, "setMasteredVersion:", v9);

  }
  -[VSAssetBase contentVersion](self, "contentVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D4DEE8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAssetBase setContentVersion:](self, "setContentVersion:", v11);

  }
  -[VSAssetBase compatibilityVersion](self, "compatibilityVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    +[VSVoiceAsset compatibilityVersionFromMobileAssetAttributes:](VSVoiceAsset, "compatibilityVersionFromMobileAssetAttributes:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAssetBase setCompatibilityVersion:](self, "setCompatibilityVersion:", v13);

  }
  -[VSAssetBase downloadSize](self, "downloadSize");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D4DEF8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAssetBase setDownloadSize:](self, "setDownloadSize:", v15);

  }
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setIsVoiceReadyToUse:(BOOL)a3
{
  self->_isVoiceReadyToUse = a3;
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
}

- (void)setFootprint:(int64_t)a3
{
  self->_footprint = a3;
}

- (NSString)name
{
  return self->_name;
}

+ (id)languagesFromMobileAssetAttributes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LanguagesCompatibility"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LanguagesCompatibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"), (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v9);
    }

  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Languages"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v7 = v13;
      v6 = v7;
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Language"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = 0;
    }
  }

  return v6;
}

+ (id)compatibilityVersionFromMobileAssetAttributes:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D4DEE0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    VSGetLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D4DEE8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v4;
      _os_log_debug_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_DEBUG, "ASAttributeCompatibilityVersion should be NSNumber, got NSString for %@\tCV: %@\tCompatibility: %@", (uint8_t *)&v11, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "integerValue"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

+ (int64_t)footprintFromString:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  int64_t v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("compact"), "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(CFSTR("premium"), "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      v6 = 2;
    }
    else
    {
      objc_msgSend(CFSTR("premiumhigh"), "lowercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "isEqualToString:", v9);

      if ((v10 & 1) != 0)
      {
        v6 = 3;
      }
      else
      {
        objc_msgSend(CFSTR("beta"), "lowercaseString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "isEqualToString:", v11);

        v6 = v12 << 63 >> 63;
      }
    }
  }

  return v6;
}

+ (int64_t)genderFromString:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  int64_t v6;
  void *v7;
  char v8;
  void *v9;
  int v10;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("male"), "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(CFSTR("female"), "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      v6 = 2;
    }
    else
    {
      objc_msgSend(CFSTR("neutral"), "lowercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "isEqualToString:", v9);

      if (v10)
        v6 = 3;
      else
        v6 = 0;
    }
  }

  return v6;
}

- (int64_t)footprint
{
  return self->_footprint;
}

- (void)setIsInstalled:(BOOL)a3
{
  self->_isInstalled = a3;
}

+ (id)typeStringFromType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return CFSTR("unknown");
  else
    return off_1EA8B02A8[a3];
}

- (id)initFromMobileAssetAttributes:(id)a3
{
  id v3;
  VSVoiceAsset *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VSVoiceAsset;
  v3 = a3;
  v4 = -[VSVoiceAsset init](&v10, sel_init);
  +[VSVoiceAsset languagesFromMobileAssetAttributes:](VSVoiceAsset, "languagesFromMobileAssetAttributes:", v3, v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSVoiceAsset setLanguages:](v4, "setLanguages:", v5);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Gender"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSVoiceAsset setGender:](v4, "setGender:", +[VSVoiceAsset genderFromString:](VSVoiceAsset, "genderFromString:", v6));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSVoiceAsset setType:](v4, "setType:", +[VSVoiceAsset typeFromString:](VSVoiceAsset, "typeFromString:", v7));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Footprint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSVoiceAsset setFootprint:](v4, "setFootprint:", +[VSVoiceAsset footprintFromString:](VSVoiceAsset, "footprintFromString:", v8));

  -[VSVoiceAsset amendNameVersionAndSizeWithMobileAssetAttributes:](v4, "amendNameVersionAndSizeWithMobileAssetAttributes:", v3);
  return v4;
}

- (id)nameKey
{
  __CFString *name;

  name = (__CFString *)self->_name;
  if (!name)
  {
    if (!self->_isBuiltInVoice)
      return 0;
    name = CFSTR("builtin");
  }
  return name;
}

- (id)voiceKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSArray firstObject](self->_languages, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSVoiceAsset typeStringFromType:](VSVoiceAsset, "typeStringFromType:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSVoiceAsset genderStringFromGender:](VSVoiceAsset, "genderStringFromGender:", self->_gender);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSVoiceAsset nameKey](self, "nameKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSVoiceAsset footprintStringFromFootprint:](VSVoiceAsset, "footprintStringFromFootprint:", self->_footprint);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAssetBase contentVersion](self, "contentVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@:%@:%@:%@:%@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)descriptiveKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSArray componentsJoinedByString:](self->_languages, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSVoiceAsset typeStringFromType:](VSVoiceAsset, "typeStringFromType:", -[VSVoiceAsset type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSVoiceAsset genderStringFromGender:](VSVoiceAsset, "genderStringFromGender:", -[VSVoiceAsset gender](self, "gender"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSVoiceAsset nameKey](self, "nameKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSVoiceAsset footprintStringFromFootprint:](VSVoiceAsset, "footprintStringFromFootprint:", -[VSVoiceAsset footprint](self, "footprint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAssetBase contentVersion](self, "contentVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAssetBase masteredVersion](self, "masteredVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAssetBase compatibilityVersion](self, "compatibilityVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@:%@:%@:%@:CV%@:MV%@:Compatibility%@"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *name;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  +[VSVoiceAsset typeStringFromType:](VSVoiceAsset, "typeStringFromType:", -[VSVoiceAsset type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  -[NSArray componentsJoinedByString:](self->_languages, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSVoiceAsset genderStringFromGender:](VSVoiceAsset, "genderStringFromGender:", -[VSVoiceAsset gender](self, "gender"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSVoiceAsset footprintStringFromFootprint:](VSVoiceAsset, "footprintStringFromFootprint:", -[VSVoiceAsset footprint](self, "footprint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInstalled);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAssetBase contentVersion](self, "contentVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAssetBase masteredVersion](self, "masteredVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAssetBase downloadSize](self, "downloadSize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isBuiltInVoice);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Type:%@, Name: %@, Languages: %@, Gender: %@, Footprint: %@, Installed: %@, ContentVersion: %@, MasteredVersion: %@, downloadSize: %@, isBuiltIn: %@"), v3, name, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSVoiceAsset;
  v4 = a3;
  -[VSAssetBase encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("_name"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_languages, CFSTR("_languages"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("_type"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_gender, CFSTR("_gender"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_footprint, CFSTR("_footprint"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isInstalled, CFSTR("_isInstalled"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isBuiltInVoice, CFSTR("_isBuiltInVoice"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isVoiceReadyToUse, CFSTR("_isVoiceReadyToUse"));

}

- (VSVoiceAsset)initWithCoder:(id)a3
{
  id v4;
  VSVoiceAsset *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *languages;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VSVoiceAsset;
  v5 = -[VSAssetBase initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_languages"));
    v11 = objc_claimAutoreleasedReturnValue();
    languages = v5->_languages;
    v5->_languages = (NSArray *)v11;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
    v5->_gender = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_gender"));
    v5->_footprint = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_footprint"));
    v5->_isInstalled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isInstalled"));
    v5->_isBuiltInVoice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isBuiltInVoice"));
    v5->_isVoiceReadyToUse = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isVoiceReadyToUse"));
  }

  return v5;
}

- (VSVoiceAsset)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  VSVoiceAsset *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  VSVoiceAsset *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VSVoiceAsset;
  v5 = -[VSVoiceAsset init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("Name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    -[VSVoiceAsset setName:](v5, "setName:", v7);
    objc_msgSend(v4, "objectForKey:", CFSTR("Languages"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_3303);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "filteredArrayUsingPredicate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSVoiceAsset setLanguages:](v5, "setLanguages:", v10);

    }
    else
    {
      -[VSVoiceAsset setLanguages:](v5, "setLanguages:", 0);
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("Gender"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = objc_msgSend(v11, "integerValue");
    else
      v12 = 0;
    -[VSVoiceAsset setGender:](v5, "setGender:", v12);
    objc_msgSend(v4, "objectForKey:", CFSTR("Type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = objc_msgSend(v13, "integerValue");
    else
      v14 = 0;
    -[VSVoiceAsset setType:](v5, "setType:", v14);
    objc_msgSend(v4, "objectForKey:", CFSTR("MasteredVersion"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    -[VSAssetBase setMasteredVersion:](v5, "setMasteredVersion:", v16);
    objc_msgSend(v4, "objectForKey:", CFSTR("ContentVersion"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    -[VSAssetBase setContentVersion:](v5, "setContentVersion:", v18);
    v19 = v5;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *name;
  NSArray *languages;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("Name"));
  languages = self->_languages;
  if (languages)
    objc_msgSend(v4, "setObject:forKey:", languages, CFSTR("Languages"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_gender);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("Gender"));

  if (self->_type)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("Type"));

  }
  -[VSAssetBase masteredVersion](self, "masteredVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[VSAssetBase masteredVersion](self, "masteredVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("MasteredVersion"));

  }
  -[VSAssetBase contentVersion](self, "contentVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[VSAssetBase contentVersion](self, "contentVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("ContentVersion"));

  }
  return v4;
}

- (NSArray)languages
{
  return self->_languages;
}

- (int64_t)gender
{
  return self->_gender;
}

- (BOOL)isInstalled
{
  return self->_isInstalled;
}

- (BOOL)isBuiltInVoice
{
  return self->_isBuiltInVoice;
}

- (void)setIsBuiltInVoice:(BOOL)a3
{
  self->_isBuiltInVoice = a3;
}

- (BOOL)isVoiceReadyToUse
{
  return self->_isVoiceReadyToUse;
}

uint64_t __49__VSVoiceAsset_initWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)genderStringFromGender:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("unknown");
  else
    return off_1EA8B0260[a3];
}

+ (id)footprintStringFromFootprint:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 4)
    return CFSTR("unknown");
  else
    return off_1EA8B0280[a3 + 1];
}

+ (int64_t)typeFromString:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  int64_t v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  int v12;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("vocalizer"), "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(CFSTR("custom"), "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      v6 = 2;
    }
    else
    {
      objc_msgSend(CFSTR("gryphon"), "lowercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "isEqualToString:", v9);

      if ((v10 & 1) != 0)
      {
        v6 = 3;
      }
      else
      {
        objc_msgSend(CFSTR("neural"), "lowercaseString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "isEqualToString:", v11);

        if (v12)
          v6 = 4;
        else
          v6 = 0;
      }
    }
  }

  return v6;
}

@end
