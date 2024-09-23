@implementation WFRemoteWidgetConfigurationLocalizedIntentResponse

- (WFRemoteWidgetConfigurationLocalizedIntentResponse)initWithLocalizedIntentRepresentation:(id)a3 languageCode:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  WFRemoteWidgetConfigurationLocalizedIntentResponse *v10;
  uint64_t v11;
  NSData *localizedIntentData;
  NSObject *v13;
  void *v14;
  WFRemoteWidgetConfigurationLocalizedIntentResponse *v15;
  NSObject *v16;
  NSData *v17;
  unsigned int v19;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)WFRemoteWidgetConfigurationLocalizedIntentResponse;
  v10 = -[WFRemoteWidgetConfigurationResponse initWithError:](&v20, sel_initWithError_, a5);
  if (v10)
  {
    if (v8)
    {
      v19 = 0;
      v11 = MEMORY[0x1C3BB29A4](v8, 0, &v19);
      localizedIntentData = v10->_localizedIntentData;
      v10->_localizedIntentData = (NSData *)v11;

      if (v19)
      {
        getWFWidgetConfigurationLogObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v22 = "-[WFRemoteWidgetConfigurationLocalizedIntentResponse initWithLocalizedIntentRepresentation:languageCode:error:]";
          v23 = 2114;
          v24 = v14;
          _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Error encoding localized intent representation: %{public}@", buf, 0x16u);

        }
        goto LABEL_7;
      }
    }
    else
    {
      getWFWidgetConfigurationLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[WFRemoteWidgetConfigurationLocalizedIntentResponse initWithLocalizedIntentRepresentation:languageCode:error:]";
        _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_ERROR, "%s Error encoding localized intent representation: localized intent representation is nil", buf, 0xCu);
      }

      v17 = v10->_localizedIntentData;
      v10->_localizedIntentData = 0;

    }
    objc_storeStrong((id *)&v10->_languageCode, a4);
    v15 = v10;
    goto LABEL_12;
  }
LABEL_7:
  v15 = 0;
LABEL_12:

  return v15;
}

- (INIntent)localizedIntent
{
  INIntent *localizedIntent;
  void *v4;
  void *v5;
  void *v6;
  INIntent *v7;
  id v8;
  INIntent *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v14;
  id v15;
  unsigned int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  localizedIntent = self->_localizedIntent;
  if (localizedIntent)
    return localizedIntent;
  -[WFRemoteWidgetConfigurationLocalizedIntentResponse localizedIntentData](self, "localizedIntentData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v16 = 0;
    -[WFRemoteWidgetConfigurationLocalizedIntentResponse localizedIntentData](self, "localizedIntentData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)OPACKDecodeData();

    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CBD970], "makeFromWidgetPlistableRepresentation:error:", v6, &v15);
    v7 = (INIntent *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    v9 = self->_localizedIntent;
    self->_localizedIntent = v7;

    if (v16)
    {
      getWFWidgetConfigurationLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v18 = "-[WFRemoteWidgetConfigurationLocalizedIntentResponse localizedIntent]";
        v19 = 2114;
        v20 = v11;
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Error making localized intent from intent data. Status: %{public}@", buf, 0x16u);

      }
    }
    if (v8)
    {
      getWFWidgetConfigurationLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[WFRemoteWidgetConfigurationLocalizedIntentResponse localizedIntent]";
        v19 = 2114;
        v20 = v8;
        _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_ERROR, "%s Error making localized intent from intent data. Error: %{public}@", buf, 0x16u);
      }

    }
    localizedIntent = self->_localizedIntent;
    return localizedIntent;
  }
  getWFWidgetConfigurationLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[WFRemoteWidgetConfigurationLocalizedIntentResponse localizedIntent]";
    _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_ERROR, "%s Error making localized intent from intent data: intent data is nil", buf, 0xCu);
  }

  return (INIntent *)0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WFRemoteWidgetConfigurationLocalizedIntentResponse localizedIntent](self, "localizedIntent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteWidgetConfigurationResponse error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("localizedIntent: %@, error: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *localizedIntentData;
  id v5;

  localizedIntentData = self->_localizedIntentData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localizedIntentData, CFSTR("localizedIntentData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_languageCode, CFSTR("languageCode"));

}

- (WFRemoteWidgetConfigurationLocalizedIntentResponse)initWithCoder:(id)a3
{
  id v4;
  WFRemoteWidgetConfigurationLocalizedIntentResponse *v5;
  uint64_t v6;
  NSData *localizedIntentData;
  uint64_t v8;
  NSString *languageCode;
  WFRemoteWidgetConfigurationLocalizedIntentResponse *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFRemoteWidgetConfigurationLocalizedIntentResponse;
  v5 = -[WFRemoteWidgetConfigurationResponse initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedIntentData"));
    v6 = objc_claimAutoreleasedReturnValue();
    localizedIntentData = v5->_localizedIntentData;
    v5->_localizedIntentData = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("languageCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    languageCode = v5->_languageCode;
    v5->_languageCode = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSData)localizedIntentData
{
  return self->_localizedIntentData;
}

- (void)setLocalizedIntentData:(id)a3
{
  objc_storeStrong((id *)&self->_localizedIntentData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedIntentData, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_localizedIntent, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
