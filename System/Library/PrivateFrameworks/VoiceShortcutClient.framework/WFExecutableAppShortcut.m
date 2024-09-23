@implementation WFExecutableAppShortcut

- (WFAutoShortcutEntityInfo)entityInfo
{
  return self->_entityInfo;
}

- (WFExecutableAppShortcut)initWithAutoShortcut:(id)a3 phrase:(id)a4 alternatePhrases:(id)a5 entityInfo:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFExecutableAppShortcut *v15;
  WFExecutableAppShortcut *v16;
  uint64_t v17;
  unint64_t v18;
  WFExecutableAppShortcut *v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)WFExecutableAppShortcut;
  v15 = -[WFExecutableAppShortcut init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_underlyingAutoShortcut, a3);
    objc_storeStrong((id *)&v16->_phrase, a4);
    objc_storeStrong((id *)&v16->_alternatePhrases, a5);
    objc_storeStrong((id *)&v16->_entityInfo, a6);
    v17 = objc_msgSend(v11, "shortcutTileColor");
    if ((unint64_t)(v17 - 1) >= 0xE)
      v18 = 0;
    else
      v18 = v17;
    v16->_chicletColor = v18;
    v19 = v16;
  }

  return v16;
}

- (BOOL)isDeprecatedStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;

  -[WFExecutableAppShortcut underlyingAutoShortcut](self, "underlyingAutoShortcut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedShortTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[WFExecutableAppShortcut underlyingAutoShortcut](self, "underlyingAutoShortcut");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemImageName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (!v7)
      return 1;
    -[WFExecutableAppShortcut phrase](self, "phrase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parameterIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      return 0;
    -[WFExecutableAppShortcut entityInfo](self, "entityInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v3 == 0;
  }
  else
  {

    v10 = 1;
  }

  return v10;
}

- (LNAutoShortcut)underlyingAutoShortcut
{
  return self->_underlyingAutoShortcut;
}

- (NSString)id
{
  void *v2;
  void *v3;

  -[WFExecutableAppShortcut phrase](self, "phrase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (LNAutoShortcutLocalizedPhrase)phrase
{
  return self->_phrase;
}

- (WFExecutableAppShortcut)initWithAutoShortcut:(id)a3 phrase:(id)a4 entityInfo:(id)a5
{
  return -[WFExecutableAppShortcut initWithAutoShortcut:phrase:alternatePhrases:entityInfo:](self, "initWithAutoShortcut:phrase:alternatePhrases:entityInfo:", a3, a4, 0, a5);
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;

  -[WFExecutableAppShortcut underlyingAutoShortcut](self, "underlyingAutoShortcut");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)attributionBundleIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[WFExecutableAppShortcut underlyingAutoShortcut](self, "underlyingAutoShortcut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[WFExecutableAppShortcut underlyingAutoShortcut](self, "underlyingAutoShortcut");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NSString)triggerPhrase
{
  void *v2;
  void *v3;

  -[WFExecutableAppShortcut phrase](self, "phrase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedPhrase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)shortTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[WFExecutableAppShortcut entityInfo](self, "entityInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFExecutableAppShortcut entityInfo](self, "entityInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFExecutableAppShortcut underlyingAutoShortcut](self, "underlyingAutoShortcut");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedShortTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[WFExecutableAppShortcut triggerPhrase](self, "triggerPhrase");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  return (NSString *)v5;
}

- (LNFullyQualifiedActionIdentifier)fullyQualifiedIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0D43CE0]);
  -[WFExecutableAppShortcut underlyingAutoShortcut](self, "underlyingAutoShortcut");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFExecutableAppShortcut underlyingAutoShortcut](self, "underlyingAutoShortcut");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithActionIdentifier:bundleIdentifier:", v5, v7);

  return (LNFullyQualifiedActionIdentifier *)v8;
}

- (NSString)shortcutDescription
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[WFExecutableAppShortcut underlyingAutoShortcut](self, "underlyingAutoShortcut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedAutoShortcutDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WFExecutableAppShortcut underlyingAutoShortcut](self, "underlyingAutoShortcut");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E5FC92C0;
  }

  return (NSString *)v6;
}

- (WFAppShortcutNamedQueryInfo)namedQueryInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  WFAppShortcutNamedQueryInfo *v8;
  void *v9;
  void *v10;
  void *v11;
  WFAppShortcutNamedQueryInfo *v12;

  -[WFExecutableAppShortcut phrase](self, "phrase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "optionsCollectionTitle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[WFExecutableAppShortcut phrase](self, "phrase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "optionsCollectionSystemImageName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v12 = 0;
      return v12;
    }
    v8 = [WFAppShortcutNamedQueryInfo alloc];
    -[WFExecutableAppShortcut phrase](self, "phrase");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "optionsCollectionTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFExecutableAppShortcut phrase](self, "phrase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "optionsCollectionSystemImageName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WFAppShortcutNamedQueryInfo initWithName:symbolName:](v8, "initWithName:symbolName:", v9, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)base64ArchivedData
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v2)
  {
    objc_msgSend(v2, "base64EncodedStringWithOptions:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[WFExecutableAppShortcut base64ArchivedData]";
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1AF681000, v5, OS_LOG_TYPE_ERROR, "%s Failed to archive auto shortcut into data with error: %@", buf, 0x16u);
    }

    v4 = 0;
  }

  return (NSString *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFExecutableAppShortcut underlyingAutoShortcut](self, "underlyingAutoShortcut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("underlyingAutoShortcut"));

  -[WFExecutableAppShortcut phrase](self, "phrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("phrase"));

  -[WFExecutableAppShortcut alternatePhrases](self, "alternatePhrases");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("alternatePhrases"));

  -[WFExecutableAppShortcut entityInfo](self, "entityInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("entityInfo"));

}

- (WFExecutableAppShortcut)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFExecutableAppShortcut *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("underlyingAutoShortcut"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phrase"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("alternatePhrases"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[WFExecutableAppShortcut initWithAutoShortcut:phrase:alternatePhrases:entityInfo:](self, "initWithAutoShortcut:phrase:alternatePhrases:entityInfo:", v5, v6, v7, v8);
  return v9;
}

- (NSArray)alternatePhrases
{
  return self->_alternatePhrases;
}

- (unint64_t)chicletColor
{
  return self->_chicletColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityInfo, 0);
  objc_storeStrong((id *)&self->_alternatePhrases, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
  objc_storeStrong((id *)&self->_underlyingAutoShortcut, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
