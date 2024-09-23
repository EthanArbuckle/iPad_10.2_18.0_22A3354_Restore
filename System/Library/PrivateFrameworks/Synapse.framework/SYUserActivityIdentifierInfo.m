@implementation SYUserActivityIdentifierInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_canonicalURL, 0);
  objc_storeStrong((id *)&self->_webpageURL, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[SYUserActivityIdentifierInfo activityType](self, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("activityType"));

  -[SYUserActivityIdentifierInfo webpageURL](self, "webpageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("webpageURL"));

  -[SYUserActivityIdentifierInfo canonicalURL](self, "canonicalURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("canonicalURL"));

  -[SYUserActivityIdentifierInfo targetContentIdentifier](self, "targetContentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("targetContentIdentifier"));

  -[SYUserActivityIdentifierInfo persistentIdentifier](self, "persistentIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("persistentIdentifier"));

}

- (NSString)targetContentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)persistentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (SYUserActivityIdentifierInfo)initWithUserActivity:(id)a3
{
  id v4;
  void *v5;
  SYUserActivityIdentifierInfo *v6;
  void *v7;
  uint64_t v8;
  NSURL *webpageURL;
  void *v10;
  uint64_t v11;
  NSURL *canonicalURL;
  void *v13;
  uint64_t v14;
  NSString *targetContentIdentifier;
  void *v16;
  uint64_t v17;
  NSString *persistentIdentifier;

  v4 = a3;
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SYUserActivityIdentifierInfo initWithActivityType:](self, "initWithActivityType:", v5);

  if (v6)
  {
    objc_msgSend(v4, "webpageURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    webpageURL = v6->_webpageURL;
    v6->_webpageURL = (NSURL *)v8;

    objc_msgSend(v4, "_canonicalURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    canonicalURL = v6->_canonicalURL;
    v6->_canonicalURL = (NSURL *)v11;

    objc_msgSend(v4, "targetContentIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    targetContentIdentifier = v6->_targetContentIdentifier;
    v6->_targetContentIdentifier = (NSString *)v14;

    objc_msgSend(v4, "persistentIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    persistentIdentifier = v6->_persistentIdentifier;
    v6->_persistentIdentifier = (NSString *)v17;

  }
  return v6;
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (SYUserActivityIdentifierInfo)initWithActivityType:(id)a3
{
  id v5;
  SYUserActivityIdentifierInfo *v6;
  uint64_t v7;
  NSString *activityType;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYUserActivityIdentifierInfo.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activityType"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SYUserActivityIdentifierInfo;
  v6 = -[SYUserActivityIdentifierInfo init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    activityType = v6->_activityType;
    v6->_activityType = (NSString *)v7;

  }
  return v6;
}

- (NSURL)webpageURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)canonicalURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SYUserActivityIdentifierInfo)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  SYUserActivityIdentifierInfo *v9;
  uint64_t v10;
  NSURL *webpageURL;
  uint64_t v12;
  NSURL *canonicalURL;
  uint64_t v14;
  NSString *targetContentIdentifier;
  uint64_t v16;
  NSString *persistentIdentifier;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityType"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E757CA18;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  v9 = -[SYUserActivityIdentifierInfo initWithActivityType:](self, "initWithActivityType:", v8);
  if (v9)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webpageURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    webpageURL = v9->_webpageURL;
    v9->_webpageURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("canonicalURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    canonicalURL = v9->_canonicalURL;
    v9->_canonicalURL = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetContentIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    targetContentIdentifier = v9->_targetContentIdentifier;
    v9->_targetContentIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persistentIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    persistentIdentifier = v9->_persistentIdentifier;
    v9->_persistentIdentifier = (NSString *)v16;

  }
  return v9;
}

- (SYUserActivityIdentifierInfo)init
{
  return -[SYUserActivityIdentifierInfo initWithActivityType:](self, "initWithActivityType:", &stru_1E757CA18);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SYUserActivityIdentifierInfo;
  -[SYUserActivityIdentifierInfo description](&v21, sel_description);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYUserActivityIdentifierInfo activityType](self, "activityType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYUserActivityIdentifierInfo webpageURL](self, "webpageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1E757CA18;
  -[SYUserActivityIdentifierInfo canonicalURL](self, "canonicalURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1E757CA18;
  -[SYUserActivityIdentifierInfo targetContentIdentifier](self, "targetContentIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1E757CA18;
  -[SYUserActivityIdentifierInfo persistentIdentifier](self, "persistentIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = &stru_1E757CA18;
  objc_msgSend(v20, "stringByAppendingFormat:", CFSTR(" activityType: %@, webpageURL: %@, canonicalURL: %@, targetContentID: %@, persistendID: %@"), v19, v6, v10, v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (BOOL)isEqualToActivityIdentifierInfo:(id)a3
{
  void *v3;
  id v5;
  NSString *activityType;
  void *v7;
  NSURL *webpageURL;
  NSURL *v9;
  uint64_t v10;
  NSURL *v11;
  void *v12;
  void *v13;
  NSURL *canonicalURL;
  NSURL *v15;
  uint64_t v16;
  void *v17;
  NSURL *v18;
  NSString *targetContentIdentifier;
  NSString *v20;
  NSString *v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  NSString *persistentIdentifier;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSURL *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSURL *v38;
  void *v39;

  v5 = a3;
  activityType = self->_activityType;
  objc_msgSend(v5, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(activityType) = -[NSString isEqualToString:](activityType, "isEqualToString:", v7);

  if ((_DWORD)activityType)
  {
    webpageURL = self->_webpageURL;
    objc_msgSend(v5, "webpageURL");
    v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (webpageURL != v9)
    {
      objc_msgSend(v5, "webpageURL");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        LOBYTE(v13) = 0;
        goto LABEL_39;
      }
      v3 = (void *)v10;
      v11 = self->_webpageURL;
      objc_msgSend(v5, "webpageURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSURL isEqual:](v11, "isEqual:", v12))
      {
        LOBYTE(v13) = 0;
LABEL_38:

        goto LABEL_39;
      }
      v39 = v12;
    }
    canonicalURL = self->_canonicalURL;
    objc_msgSend(v5, "canonicalURL");
    v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (canonicalURL == v15)
    {
      v38 = canonicalURL;
    }
    else
    {
      objc_msgSend(v5, "canonicalURL");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        LOBYTE(v13) = 0;
LABEL_36:

LABEL_37:
        v12 = v39;
        if (webpageURL != v9)
          goto LABEL_38;
LABEL_39:

        goto LABEL_40;
      }
      v17 = (void *)v16;
      v18 = self->_canonicalURL;
      objc_msgSend(v5, "canonicalURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSURL isEqual:](v18, "isEqual:", v13) & 1) == 0)
      {

        LOBYTE(v13) = 0;
        goto LABEL_37;
      }
      v38 = canonicalURL;
      v35 = v13;
      v36 = v17;
    }
    targetContentIdentifier = self->_targetContentIdentifier;
    objc_msgSend(v5, "targetContentIdentifier");
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (targetContentIdentifier == v20)
    {
      v37 = v3;
    }
    else
    {
      objc_msgSend(v5, "targetContentIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
LABEL_30:

        goto LABEL_31;
      }
      v21 = self->_targetContentIdentifier;
      objc_msgSend(v5, "targetContentIdentifier");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v21;
      v24 = (void *)v22;
      if (!-[NSString isEqualToString:](v23, "isEqualToString:", v22))
      {

        LOBYTE(v13) = 0;
LABEL_31:
        v31 = v38;
LABEL_34:
        if (v31 != v15)
        {

        }
        goto LABEL_36;
      }
      v33 = v24;
      v34 = v13;
      v37 = v3;
    }
    persistentIdentifier = self->_persistentIdentifier;
    objc_msgSend(v5, "persistentIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = persistentIdentifier == (NSString *)v26;
    if (persistentIdentifier == (NSString *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      objc_msgSend(v5, "persistentIdentifier");
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = (void *)v28;
        v13 = self->_persistentIdentifier;
        objc_msgSend(v5, "persistentIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v13) = objc_msgSend(v13, "isEqualToString:", v30);

        if (targetContentIdentifier == v20)
        {

        }
        else
        {

        }
        v3 = v37;
        v31 = v38;
        goto LABEL_34;
      }

    }
    v3 = v37;
    if (targetContentIdentifier != v20)
    {

    }
    goto LABEL_30;
  }
  LOBYTE(v13) = 0;
LABEL_40:

  return (char)v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[SYUserActivityIdentifierInfo isEqualToActivityIdentifierInfo:](self, "isEqualToActivityIdentifierInfo:", v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[SYUserActivityIdentifierInfo activityType](self, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SYUserActivityIdentifierInfo webpageURL](self, "webpageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SYUserActivityIdentifierInfo targetContentIdentifier](self, "targetContentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SYUserActivityIdentifierInfo persistentIdentifier](self, "persistentIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (void)setWebpageURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)setCanonicalURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void)setTargetContentIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setPersistentIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

@end
