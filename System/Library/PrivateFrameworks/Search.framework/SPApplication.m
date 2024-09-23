@implementation SPApplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *displayIdentifier;
  void *v5;
  id v6;

  displayIdentifier = self->_displayIdentifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", displayIdentifier, CFSTR("_displayIdentifier"));
  -[SPApplication displayNameInternal](self, "displayNameInternal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("_displayNameInternal"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_longDisplayName, CFSTR("_longDisplayName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_keywords, CFSTR("_keywords"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_URL, CFSTR("_URL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_shortVersion, CFSTR("_shortVersion"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_webClipType, CFSTR("_webClipType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_appBundleIdentifier, CFSTR("_appBundleIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_subtitle, CFSTR("_subtitle"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isPlaceholder, CFSTR("_isPlaceholder"));

}

- (SPApplication)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  NSString *v6;
  NSString *displayIdentifier;
  void *v8;
  NSString *v9;
  NSString *longDisplayName;
  NSMutableArray *v11;
  NSMutableArray *keywords;
  NSURL *v13;
  NSURL *URL;
  NSString *v15;
  NSString *shortVersion;
  NSString *v17;
  NSString *appBundleIdentifier;
  NSString *v19;
  NSString *subtitle;

  v4 = initWithCoder__onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&initWithCoder__onceToken, &__block_literal_global);
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayIdentifier"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  displayIdentifier = self->_displayIdentifier;
  self->_displayIdentifier = v6;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayNameInternal"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPApplication setDisplayNameInternal:](self, "setDisplayNameInternal:", v8);

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_longDisplayName"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  longDisplayName = self->_longDisplayName;
  self->_longDisplayName = v9;

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", initWithCoder__objectClasses, CFSTR("_keywords"));
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  keywords = self->_keywords;
  self->_keywords = v11;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_URL"));
  v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
  URL = self->_URL;
  self->_URL = v13;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shortVersion"));
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  shortVersion = self->_shortVersion;
  self->_shortVersion = v15;

  self->_webClipType = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("_webClipType"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_appBundleIdentifier"));
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  appBundleIdentifier = self->_appBundleIdentifier;
  self->_appBundleIdentifier = v17;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_subtitle"));
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  subtitle = self->_subtitle;
  self->_subtitle = v19;

  LOBYTE(v8) = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_isPlaceholder"));
  self->_isPlaceholder = (char)v8;
  return self;
}

void __31__SPApplication_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__objectClasses;
  initWithCoder__objectClasses = v2;

}

- (BOOL)isWebClip
{
  return self->_webClipType > 1uLL;
}

- (BOOL)isAppClip
{
  return self->_webClipType == 1;
}

- (id)description
{
  void *v3;
  NSString *displayIdentifier;
  uint64_t v5;
  void *v6;
  const __CFString *longDisplayName;
  const __CFString *v8;
  const __CFString *shortVersion;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  displayIdentifier = self->_displayIdentifier;
  -[SPApplication displayNameInternal](self, "displayNameInternal");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  longDisplayName = (const __CFString *)self->_longDisplayName;
  v8 = CFSTR(", long name:");
  shortVersion = &stru_24CF64BB0;
  if (!longDisplayName)
  {
    v8 = &stru_24CF64BB0;
    longDisplayName = &stru_24CF64BB0;
  }
  if (self->_shortVersion)
    shortVersion = (const __CFString *)self->_shortVersion;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SPApplication: %@, display name:%@%@%@ version:%@"), displayIdentifier, v5, v8, longDisplayName, shortVersion);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *displayIdentifier;
  NSString *v7;
  BOOL v8;
  NSString *appBundleIdentifier;
  NSString *v10;
  NSString *subtitle;
  NSString *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  int isPlaceholder;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (self->_webClipType == v5[8])
    {
      displayIdentifier = self->_displayIdentifier;
      v7 = (NSString *)v5[3];
      if (displayIdentifier == v7)
        goto LABEL_7;
      v8 = 0;
      if (!displayIdentifier || !v7)
        goto LABEL_24;
      if (-[NSString isEqualToString:](displayIdentifier, "isEqualToString:"))
      {
LABEL_7:
        appBundleIdentifier = self->_appBundleIdentifier;
        v10 = (NSString *)v5[7];
        if (appBundleIdentifier == v10)
          goto LABEL_11;
        v8 = 0;
        if (!appBundleIdentifier || !v10)
          goto LABEL_24;
        if (-[NSString isEqualToString:](appBundleIdentifier, "isEqualToString:"))
        {
LABEL_11:
          subtitle = self->_subtitle;
          v12 = (NSString *)v5[9];
          if (subtitle == v12)
          {
LABEL_15:
            -[SPApplication displayNameInternal](self, "displayNameInternal");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "displayNameInternal");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13 == v14)
            {
              v8 = 1;
            }
            else
            {
              v15 = objc_msgSend(v13, "isEqualToString:", v14);
              if (v13)
                v16 = v14 == 0;
              else
                v16 = 1;
              if (v16)
                v8 = 0;
              else
                v8 = v15;
            }
            isPlaceholder = self->_isPlaceholder;
            if (isPlaceholder != objc_msgSend(v5, "isPlaceholder"))
              v8 = 0;

            goto LABEL_24;
          }
          v8 = 0;
          if (!subtitle || !v12)
          {
LABEL_24:

            goto LABEL_25;
          }
          if (-[NSString isEqualToString:](subtitle, "isEqualToString:"))
            goto LABEL_15;
        }
      }
    }
    v8 = 0;
    goto LABEL_24;
  }
  v8 = 0;
LABEL_25:

  return v8;
}

- (BOOL)displayNameLoaded
{
  void *v2;
  BOOL v3;

  -[SPApplication displayNameInternal](self, "displayNameInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  -[SPApplication displayNameInternal](self, "displayNameInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", self->_displayIdentifier, 1, 0);
    objc_msgSend(v4, "localizedName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[SPApplication setDisplayNameInternal:](self, "setDisplayNameInternal:", v3);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[SPApplication displayName].cold.1((uint64_t)&self->_displayIdentifier, (uint64_t)v3, v5, v6, v7, v8, v9, v10);
  }
  return (NSString *)v3;
}

- (void)setLongDisplayName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (self->_displayNameInternal)
  {
    v7 = v4;
    v6 = objc_msgSend(v4, "isEqualToString:");
    v5 = v7;
    if (v6)
    {
      objc_storeStrong((id *)&self->_longDisplayName, self->_displayNameInternal);
      v5 = v7;
    }
  }

}

- (NSString)longDisplayName
{
  return self->_longDisplayName;
}

- (NSString)utiType
{
  return (NSString *)(id)SPUTIAppType;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (NSString)displayIdentifier
{
  return self->_displayIdentifier;
}

- (void)setDisplayIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_displayIdentifier, a3);
}

- (NSMutableArray)keywords
{
  return self->_keywords;
}

- (void)setKeywords:(id)a3
{
  objc_storeStrong((id *)&self->_keywords, a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSString)shortVersion
{
  return self->_shortVersion;
}

- (void)setShortVersion:(id)a3
{
  objc_storeStrong((id *)&self->_shortVersion, a3);
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, a3);
}

- (int64_t)webClipType
{
  return self->_webClipType;
}

- (void)setWebClipType:(int64_t)a3
{
  self->_webClipType = a3;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)displayNameInternal
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDisplayNameInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayNameInternal, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_shortVersion, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_displayIdentifier, 0);
  objc_storeStrong((id *)&self->_longDisplayName, 0);
}

- (void)copyToSearchFoundationResult:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE85018]);
  SPLogForSPLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v6, v7))
  {
    -[SPApplication displayName](self, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v8;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_213202000, v6, v7, "Set title %@ for result %@", buf, 0x16u);

  }
  -[SPApplication displayName](self, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SPApplication displayName](self, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v10);

  }
  -[SPApplication subtitle](self, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BE84F78];
    -[SPApplication subtitle](self, "subtitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textWithString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDescriptions:", v15);

  }
  objc_msgSend(v4, "setTitle:", v5);
  if (-[SPApplication isAppClip](self, "isAppClip"))
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    v17 = *MEMORY[0x24BE16E78];
    -[SPApplication displayIdentifier](self, "displayIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@%@"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdentifier:", v19);

    -[SPApplication appBundleIdentifier](self, "appBundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setResultBundleId:", v20);

    objc_msgSend(v4, "setApplicationBundleIdentifier:", CFSTR("com.apple.application"));
    objc_msgSend(v4, "setIsAppClip:", 1);
  }
  else
  {
    objc_msgSend(v4, "setIsWebClip:", -[SPApplication isWebClip](self, "isWebClip"));
    -[SPApplication displayIdentifier](self, "displayIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setResultBundleId:", v21);

  }
  if (-[SPApplication isAppClip](self, "isAppClip"))
    v22 = CFSTR("com.apple.app-clips");
  else
    v22 = CFSTR("com.apple.application");
  objc_msgSend(v4, "setSectionBundleIdentifier:", v22);
  objc_msgSend(v4, "setIsLocalApplicationResult:", 1);

}

- (void)displayName
{
  OUTLINED_FUNCTION_6(&dword_213202000, MEMORY[0x24BDACB70], a3, "### localized app name(%@) - %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
