@implementation TPSMetadata

- (NSURL)assetBaseURL
{
  return self->_assetBaseURL;
}

- (NSString)language
{
  return self->_language;
}

- (TPSMetadata)initWithDictionary:(id)a3
{
  id v4;
  TPSMetadata *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  NSString *contentMapHash;
  void *v11;
  TPSAssetSizes *v12;
  TPSAssetSizes *assetSizes;
  void *v14;
  uint64_t v15;
  NSURL *assetBaseURL;
  TPSMetadata *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TPSMetadata;
  v5 = -[TPSSerializableObject initWithDictionary:](&v19, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("language"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = CFSTR("en");
    objc_storeStrong((id *)&v5->_language, v8);

    v5->_contextualTipsInactive = objc_msgSend(v4, "TPSSafeBoolForKey:", CFSTR("contextualTipsInactive"));
    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("contentMapHash"));
    v9 = objc_claimAutoreleasedReturnValue();
    contentMapHash = v5->_contentMapHash;
    v5->_contentMapHash = (NSString *)v9;

    objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("assetSizes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = -[TPSAssetSizes initWithDictionary:]([TPSAssetSizes alloc], "initWithDictionary:", v11);
      assetSizes = v5->_assetSizes;
      v5->_assetSizes = v12;

    }
    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("assetBaseURL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      assetBaseURL = v5->_assetBaseURL;
      v5->_assetBaseURL = (NSURL *)v15;

    }
    if (!v5->_language || !v5->_assetBaseURL)
    {

      v17 = 0;
      goto LABEL_14;
    }

  }
  v17 = v5;
LABEL_14:

  return v17;
}

+ (id)metadataFromDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "TPSSafeDictionaryForKey:", CFSTR("metadata"));
}

- (BOOL)contextualTipsInactive
{
  return self->_contextualTipsInactive;
}

- (TPSAssetSizes)assetSizes
{
  return self->_assetSizes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSizes, 0);
  objc_storeStrong((id *)&self->_contentMapHash, 0);
  objc_storeStrong((id *)&self->_assetBaseURL, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)identifierFromMetadataDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "TPSSafeStringForKey:", CFSTR("language"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "TPSSafeStringForKey:", CFSTR("lastModified"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "TPSSafeStringForKey:", CFSTR("rulesHash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5)
    v8 = v5;
  else
    v8 = v6;
  if (v4 && v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v4, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TPSMetadata;
  v4 = -[TPSSerializableObject copyWithZone:](&v10, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setContextualTipsInactive:", -[TPSMetadata contextualTipsInactive](self, "contextualTipsInactive"));
  -[TPSMetadata language](self, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLanguage:", v5);

  -[TPSMetadata assetBaseURL](self, "assetBaseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssetBaseURL:", v6);

  -[TPSMetadata contentMapHash](self, "contentMapHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMapHash:", v7);

  -[TPSMetadata assetSizes](self, "assetSizes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssetSizes:", v8);

  return v4;
}

- (TPSMetadata)initWithCoder:(id)a3
{
  id v4;
  TPSMetadata *v5;
  uint64_t v6;
  NSString *language;
  uint64_t v8;
  NSURL *assetBaseURL;
  uint64_t v10;
  NSString *contentMapHash;
  uint64_t v12;
  TPSAssetSizes *assetSizes;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSMetadata;
  v5 = -[TPSSerializableObject initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_contextualTipsInactive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("contextualTipsInactive"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("language"));
    v6 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetBaseURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    assetBaseURL = v5->_assetBaseURL;
    v5->_assetBaseURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentMapHash"));
    v10 = objc_claimAutoreleasedReturnValue();
    contentMapHash = v5->_contentMapHash;
    v5->_contentMapHash = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetSizes"));
    v12 = objc_claimAutoreleasedReturnValue();
    assetSizes = v5->_assetSizes;
    v5->_assetSizes = (TPSAssetSizes *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TPSMetadata;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[TPSMetadata contextualTipsInactive](self, "contextualTipsInactive", v9.receiver, v9.super_class), CFSTR("contextualTipsInactive"));
  -[TPSMetadata language](self, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("language"));

  -[TPSMetadata assetBaseURL](self, "assetBaseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("assetBaseURL"));

  -[TPSMetadata contentMapHash](self, "contentMapHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("contentMapHash"));

  -[TPSMetadata assetSizes](self, "assetSizes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("assetSizes"));

}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v12.receiver = self;
  v12.super_class = (Class)TPSMetadata;
  -[TPSSerializableObject debugDescription](&v12, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSMetadata assetBaseURL](self, "assetBaseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n%@ = %@\n"), CFSTR("assetBaseURL"), v6);

  -[TPSMetadata language](self, "language");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("language"), v7);

  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %d\n"), CFSTR("contextualTipsInactive"), -[TPSMetadata contextualTipsInactive](self, "contextualTipsInactive"));
  -[TPSMetadata contentMapHash](self, "contentMapHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("contentMapHash"), v8);

  -[TPSMetadata assetSizes](self, "assetSizes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("assetSizes"), v10);

  return v5;
}

- (void)setContextualTipsInactive:(BOOL)a3
{
  self->_contextualTipsInactive = a3;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAssetBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)contentMapHash
{
  return self->_contentMapHash;
}

- (void)setContentMapHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setAssetSizes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
