@implementation PFPosterConfiguration

- (PFPosterConfiguration)initWithConfigurationType:(int64_t)a3
{
  PFPosterConfiguration *v4;
  PFPosterConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PFPosterConfiguration;
  v4 = -[PFPosterConfiguration init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_configurationType = a3;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

  }
  return v5;
}

- (id)analyticsPayload
{
  id v3;
  int64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = -[PFPosterConfiguration configurationType](self, "configurationType");
  v5 = CFSTR("??");
  if (v4 == 1)
    v5 = CFSTR("Shuffle");
  if (v4)
    v6 = v5;
  else
    v6 = CFSTR("Photo");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("configuration_type"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PFPosterConfiguration options](self, "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("configuration_options"));

  -[PFPosterConfiguration mediaAnalyticsPayload](self, "mediaAnalyticsPayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v8);

  -[PFPosterConfiguration editConfiguration](self, "editConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PFPosterConfiguration editConfiguration](self, "editConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "analyticsPayload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v11);

  }
  -[PFPosterConfiguration shuffleConfiguration](self, "shuffleConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PFPosterConfiguration shuffleConfiguration](self, "shuffleConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "analyticsPayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v14);

  }
  return v3;
}

- (id)mediaAnalyticsPayload
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[PFPosterConfiguration media](self, "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "editConfiguration", (_QWORD)v26);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v8 = (v8 + 1);
          v7 = v7 + objc_msgSend(v11, "isDepthEnabled");
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

  v13 = objc_alloc(MEMORY[0x1E0C99E08]);
  v30[0] = CFSTR("asset_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v14;
  v30[1] = CFSTR("custom_edit_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v15;
  v30[2] = CFSTR("depth_enabled_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v13, "initWithDictionary:", v17);

  objc_msgSend(v4, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = objc_msgSend(v19, "mediaType");
    if (v21 > 3)
      v22 = CFSTR("??");
    else
      v22 = off_1E45A1BC8[v21];
    v23 = v22;
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("first_media_type"));

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v20, "suggestionSubtype"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CFSTR("first_suggestion_subtype"));

    }
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PFPosterConfiguration *v5;
  uint64_t v6;
  PFPosterEditConfiguration *editConfiguration;
  uint64_t v8;
  PFPosterShuffleConfiguration *shuffleConfiguration;
  uint64_t v10;
  NSDictionary *userInfo;

  v5 = +[PFPosterConfiguration allocWithZone:](PFPosterConfiguration, "allocWithZone:");
  v5->_configurationType = self->_configurationType;
  v5->_options = self->_options;
  objc_storeStrong((id *)&v5->_identifier, self->_identifier);
  objc_storeStrong((id *)&v5->_media, self->_media);
  v6 = -[PFPosterEditConfiguration copy](self->_editConfiguration, "copy");
  editConfiguration = v5->_editConfiguration;
  v5->_editConfiguration = (PFPosterEditConfiguration *)v6;

  v8 = -[PFPosterShuffleConfiguration copy](self->_shuffleConfiguration, "copy");
  shuffleConfiguration = v5->_shuffleConfiguration;
  v5->_shuffleConfiguration = (PFPosterShuffleConfiguration *)v8;

  objc_storeStrong((id *)&v5->_layoutConfiguration, self->_layoutConfiguration);
  v10 = -[NSDictionary copyWithZone:](self->_userInfo, "copyWithZone:", a3);
  userInfo = v5->_userInfo;
  v5->_userInfo = (NSDictionary *)v10;

  return v5;
}

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  BOOL v13;
  id v15;
  id v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41__PFPosterConfiguration_saveToURL_error___block_invoke;
  v17[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v17[4] = a4;
  v5 = a3;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1B0CFA4](v17);
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("ConfigurationModel.plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      v20 = 2112;
      v21 = v10;
      v11 = MEMORY[0x1E0C81028];
      v12 = "Failed to encode configuration data at path:%@ error:%@";
LABEL_9:
      _os_log_error_impl(&dword_1A16EE000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  v15 = 0;
  v13 = 1;
  objc_msgSend(v8, "writeToURL:options:error:", v7, 1, &v15);
  v10 = v15;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      v20 = 2112;
      v21 = v10;
      v11 = MEMORY[0x1E0C81028];
      v12 = "Failed to write configuration data at path:%@ error:%@";
      goto LABEL_9;
    }
LABEL_6:
    ((void (**)(_QWORD, id))v6)[2](v6, v10);
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PFPosterConfiguration *v14;
  SEL v15;
  id v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "encodeInteger:forKey:", 1, CFSTR("version"));
  objc_msgSend(v17, "encodeInteger:forKey:", -[PFPosterConfiguration configurationType](self, "configurationType"), CFSTR("configurationType"));
  objc_msgSend(v17, "encodeInteger:forKey:", -[PFPosterConfiguration options](self, "options"), CFSTR("options"));
  -[PFPosterConfiguration identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[PFPosterConfiguration media](self, "media");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v5, CFSTR("media"));

  -[PFPosterConfiguration editConfiguration](self, "editConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v6, CFSTR("editConfiguration"));

  if (-[PFPosterConfiguration configurationType](self, "configurationType") == 1)
  {
    -[PFPosterConfiguration shuffleConfiguration](self, "shuffleConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v14 = (PFPosterConfiguration *)_PFAssertFailHandler();
      -[PFPosterConfiguration initWithCoder:](v14, v15, v16);
      return;
    }
    -[PFPosterConfiguration shuffleConfiguration](self, "shuffleConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v8, CFSTR("shuffleConfiguration"));

  }
  -[PFPosterConfiguration layoutConfiguration](self, "layoutConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PFPosterConfiguration layoutConfiguration](self, "layoutConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v10, CFSTR("layoutConfiguration"));

  }
  -[PFPosterConfiguration userInfo](self, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v17;
  if (v11)
  {
    -[PFPosterConfiguration userInfo](self, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v13, CFSTR("userInfo"));

    v12 = v17;
  }

}

- (PFPosterConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  PFPosterConfiguration *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *media;
  uint64_t v14;
  PFPosterEditConfiguration *editConfiguration;
  uint64_t v16;
  PFPosterShuffleConfiguration *shuffleConfiguration;
  uint64_t v18;
  void *layoutConfiguration;
  uint64_t v20;
  PFWallpaperCompoundDeviceConfiguration *v21;
  PFWallpaperCompoundDeviceConfiguration *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSDictionary *userInfo;
  uint8_t v29[8];
  _QWORD v30[4];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("configurationType"));
  v6 = -[PFPosterConfiguration initWithConfigurationType:](self, "initWithConfigurationType:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v6->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
    v9 = (void *)MEMORY[0x1E0C99E60];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("media"));
    v12 = objc_claimAutoreleasedReturnValue();
    media = v6->_media;
    v6->_media = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("editConfiguration"));
    v14 = objc_claimAutoreleasedReturnValue();
    editConfiguration = v6->_editConfiguration;
    v6->_editConfiguration = (PFPosterEditConfiguration *)v14;

    if (v5 == 1)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shuffleConfiguration"));
      v16 = objc_claimAutoreleasedReturnValue();
      shuffleConfiguration = v6->_shuffleConfiguration;
      v6->_shuffleConfiguration = (PFPosterShuffleConfiguration *)v16;

      if (!v6->_shuffleConfiguration)
        _PFAssertFailHandler();
    }
    if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("layoutConfiguration"));
      v18 = objc_claimAutoreleasedReturnValue();
      layoutConfiguration = v6->_layoutConfiguration;
      v6->_layoutConfiguration = (PFWallpaperCompoundDeviceConfiguration *)v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "setClass:forClassName:", objc_opt_class(), CFSTR("PFParallaxLayoutConcreteConfiguration"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("layoutConfiguration"));
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        layoutConfiguration = (void *)v20;
        v21 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v20, 0);
        v22 = v6->_layoutConfiguration;
        v6->_layoutConfiguration = v21;

      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v29 = 0;
          _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Portrait config was missing\n\t", v29, 2u);
        }
        layoutConfiguration = 0;
      }
    }

    v23 = (void *)MEMORY[0x1E0C99E60];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v30[2] = objc_opt_class();
    v30[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("userInfo"));
    v26 = objc_claimAutoreleasedReturnValue();
    userInfo = v6->_userInfo;
    v6->_userInfo = (NSDictionary *)v26;

  }
  return v6;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterConfiguration identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PFPosterConfiguration options](self, "options");
  -[PFPosterConfiguration media](self, "media");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterConfiguration editConfiguration](self, "editConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterConfiguration shuffleConfiguration](self, "shuffleConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterConfiguration layoutConfiguration](self, "layoutConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterConfiguration userInfo](self, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; identifier: %@; options: %ld; media: %@; edit configuration: %@; shuffle configuration: %@ layout configuration: %@ user info: %@>"),
                  v5,
                  self,
                  v6,
                  v7,
                  v8,
                  v9,
                  v10,
                  v11,
                  v12);

  return (NSString *)v13;
}

- (int64_t)configurationType
{
  return self->_configurationType;
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSArray)media
{
  return self->_media;
}

- (void)setMedia:(id)a3
{
  objc_storeStrong((id *)&self->_media, a3);
}

- (PFPosterEditConfiguration)editConfiguration
{
  return self->_editConfiguration;
}

- (void)setEditConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_editConfiguration, a3);
}

- (PFPosterShuffleConfiguration)shuffleConfiguration
{
  return self->_shuffleConfiguration;
}

- (void)setShuffleConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_shuffleConfiguration, a3);
}

- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (void)setLayoutConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConfiguration, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
  objc_storeStrong((id *)&self->_shuffleConfiguration, 0);
  objc_storeStrong((id *)&self->_editConfiguration, 0);
  objc_storeStrong((id *)&self->_media, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

_QWORD **__41__PFPosterConfiguration_saveToURL_error___block_invoke(_QWORD **result, id a2)
{
  _QWORD **v2;

  if (result[4])
  {
    v2 = result;
    result = (_QWORD **)objc_retainAutorelease(a2);
    *v2[4] = result;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)loadFromURL:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("ConfigurationModel.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 1, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v6)
  {
    v12 = v7;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;

    if (v8)
    {
      v10 = v8;
LABEL_10:

      goto LABEL_11;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to unarchive poster configuraton data error:%@", buf, 0xCu);
      if (!a4)
        goto LABEL_10;
    }
    else if (!a4)
    {
      goto LABEL_10;
    }
    *a4 = objc_retainAutorelease(v9);
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v5;
    v16 = 2112;
    v17 = v7;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to read configuration data at path:%@ error:%@", buf, 0x16u);
    if (a4)
      goto LABEL_6;
LABEL_13:
    v8 = 0;
    v9 = v7;
    goto LABEL_11;
  }
  if (!a4)
    goto LABEL_13;
LABEL_6:
  v9 = objc_retainAutorelease(v7);
  v8 = 0;
  *a4 = v9;
LABEL_11:

  return v8;
}

- (int64_t)posterType
{
  if (-[PFPosterConfiguration configurationType](self, "configurationType"))
    return 2;
  else
    return 1;
}

@end
