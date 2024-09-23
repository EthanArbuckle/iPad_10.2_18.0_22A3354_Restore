@implementation VUIExtrasInfo

- (VUIExtrasInfo)initWithDictionary:(id)a3
{
  id v4;
  VUIExtrasInfo *v5;
  VUIExtrasInfo *v6;
  NSDictionary *v7;
  void *extrasDict;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VUIExtrasInfo;
  v5 = -[VUIExtrasInfo init](&v10, sel_init);
  v6 = v5;
  if (!v4)
    goto LABEL_5;
  if (!v5)
  {
    extrasDict = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (NSDictionary *)v4;
    extrasDict = v6->_extrasDict;
    v6->_extrasDict = v7;
  }
  else
  {
LABEL_5:
    extrasDict = v6;
    v6 = 0;
  }
LABEL_7:

  return v6;
}

- (VUIExtrasInfo)initWithMediaItem:(id)a3
{
  id v4;
  VUIExtrasInfo *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VUIExtrasInfo;
  v5 = -[VUIExtrasInfo init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "mediaPlayerMediaItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIExtrasInfo _initializeWithMPMediaItem:](v5, "_initializeWithMPMediaItem:", v6);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[VUIExtrasInfo initWithDictionary:]([VUIExtrasInfo alloc], "initWithDictionary:", self->_extrasDict);
}

- (NSString)adamID
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_extrasDict, "vui_stringForKey:", CFSTR("adamId"));
}

- (NSString)extrasURLString
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary vui_stringForKey:](self->_extrasDict, "vui_stringForKey:", CFSTR("extrasUrl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "length"))
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

- (NSString)previewURLString
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary vui_stringForKey:](self->_extrasDict, "vui_stringForKey:", CFSTR("previewUrl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "length"))
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

- (NSNumber)contentRating
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_extrasDict, "vui_numberForKey:", CFSTR("ratingValue"));
}

- (NSString)actionParams
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_extrasDict, "vui_stringForKey:", CFSTR("buyParams"));
}

- (void)setActionParams:(id)a3
{
  void *v4;
  NSDictionary *extrasDict;
  id v6;
  NSDictionary *v7;
  NSDictionary *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0C99E08];
  extrasDict = self->_extrasDict;
  v6 = a3;
  objc_msgSend(v4, "dictionaryWithDictionary:", extrasDict);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v6, CFSTR("buyParams"));

  v7 = (NSDictionary *)objc_msgSend(v9, "copy");
  v8 = self->_extrasDict;
  self->_extrasDict = v7;

}

- (NSString)loadingImage
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_extrasDict, "vui_stringForKey:", CFSTR("loadingImage"));
}

- (BOOL)isLightTheme
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_extrasDict, "vui_BOOLForKey:defaultValue:", CFSTR("isLightTheme"), 0);
}

- (NSString)name
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_extrasDict, "vui_stringForKey:", CFSTR("name"));
}

- (NSURL)tvAppDeeplinkURL
{
  return (NSURL *)-[NSDictionary vui_URLForKey:](self->_extrasDict, "vui_URLForKey:", CFSTR("url"));
}

- (BOOL)isEntitledToPlay
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_extrasDict, "vui_BOOLForKey:defaultValue:", CFSTR("isEntitledToPlay"), 0);
}

+ (BOOL)isValidExtrasInfo:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "extrasURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (void)_initializeWithMPMediaItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSDictionary *v23;
  NSDictionary *extrasDict;
  id v25;

  v4 = a3;
  if (v4)
  {
    v25 = v4;
    v5 = (void *)objc_opt_new();
    objc_msgSend(v25, "valueForProperty:", *MEMORY[0x1E0CC1F90]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v25, "valueForProperty:", *MEMORY[0x1E0CC1E28]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v6);
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "queryItems");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (id)objc_msgSend(v10, "mutableCopy");

          if (!v11)
            v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("hlsUrl"), v7);
          if (v12)
          {
            objc_msgSend(v11, "addObject:", v12);
            objc_msgSend(v9, "setQueryItems:", v11);
            objc_msgSend(v9, "URL");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "absoluteString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v14, "length"))
            {
              v15 = v14;

              v6 = v15;
            }

          }
        }

      }
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("extrasUrl"));

    }
    objc_msgSend(v25, "valueForProperty:", *MEMORY[0x1E0CC1FB0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
      objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("buyParams"));
    objc_msgSend(v25, "valueForProperty:", *MEMORY[0x1E0CC1FA0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17 && objc_msgSend(v17, "longLongValue"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v18, "longLongValue"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v19, CFSTR("adamId"));

    }
    objc_msgSend(v25, "valueForProperty:", *MEMORY[0x1E0CC1DD8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "count"))
      goto LABEL_24;
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ratingLevel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v21, "integerValue"));
      v22 = objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
LABEL_24:
        v23 = (NSDictionary *)objc_msgSend(v5, "copy");
        extrasDict = self->_extrasDict;
        self->_extrasDict = v23;

        v4 = v25;
        goto LABEL_25;
      }
      objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("ratingValue"));
      v21 = (void *)v22;
    }

    goto LABEL_24;
  }
LABEL_25:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extrasDict, 0);
}

@end
