@implementation PRSPosterArchiveManifest

+ (int64_t)manifestVersion
{
  return 1;
}

+ (id)unsupportedVersions
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)isManifestDictionaryValid:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("archiveVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "unsupportedVersions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (PRSPosterArchiveManifest)initWithConfigurationAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PRSPosterArchiveManifest *v11;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("archiveVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "manifestVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = v5;
  v13[1] = CFSTR("extensionIdentifier");
  v13[2] = CFSTR("configurationUUID");
  objc_msgSend(v4, "posterUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  v14[3] = &unk_1E4D53338;
  v13[3] = CFSTR("latestConfigurationVersion");
  v13[4] = CFSTR("latestConfigurationSupplement");
  v14[4] = &unk_1E4D53338;
  v13[5] = CFSTR("role");
  objc_msgSend(v4, "role");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PRSPosterArchiveManifest initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", v10);
  return v11;
}

- (PRSPosterArchiveManifest)initWithDataRepresentation:(id)a3
{
  void *v4;
  PRSPosterArchiveManifest *v5;

  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PRSPosterArchiveManifest initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", v4);

  return v5;
}

- (PRSPosterArchiveManifest)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  PRSPosterArchiveManifest *v5;
  uint64_t v6;
  NSDictionary *dictionaryRepresentation;
  PRSPosterArchiveManifest *v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isManifestDictionaryValid:", v4))
  {
    v10.receiver = self;
    v10.super_class = (Class)PRSPosterArchiveManifest;
    v5 = -[PRSPosterArchiveManifest init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      dictionaryRepresentation = v5->_dictionaryRepresentation;
      v5->_dictionaryRepresentation = (NSDictionary *)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)archiveVersion
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", CFSTR("archiveVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)dataStoreVersion
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", CFSTR("dataStoreVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSString)extensionIdentifier
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", CFSTR("extensionIdentifier"));
}

- (NSUUID)configurationUUID
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", CFSTR("configurationUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  return (NSUUID *)v5;
}

- (unint64_t)latestConfigurationVersion
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", CFSTR("latestConfigurationVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (unint64_t)latestConfigurationSupplement
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", CFSTR("latestConfigurationSupplement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (id)dataRepresentationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_dictionaryRepresentation, 100, 0, a3);
}

- (NSString)role
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", CFSTR("role"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("PRPosterRoleLockScreen");
  v4 = v2;

  return v4;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void)setDictionaryRepresentation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
}

- (NSString)buildVersion
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", CFSTR("buildVersion"));
}

@end
