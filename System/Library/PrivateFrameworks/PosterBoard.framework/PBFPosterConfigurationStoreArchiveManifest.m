@implementation PBFPosterConfigurationStoreArchiveManifest

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

- (PBFPosterConfigurationStoreArchiveManifest)initWithConfigurationStoreCoordinator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  PBFPosterConfigurationStoreArchiveManifest *v17;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD v22[8];
  _QWORD v23[10];

  v23[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = (void *)MGCopyAnswer();
  objc_msgSend(v4, "identityOfLatestVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider");
  v19 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identityOfLatestVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = CFSTR("archiveVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "manifestVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  v22[1] = CFSTR("dataStoreVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[PBFPosterExtensionDataStore dataStoreVersion](PBFPosterExtensionDataStore, "dataStoreVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  v23[2] = v21;
  v22[2] = CFSTR("buildVersion");
  v22[3] = CFSTR("extensionIdentifier");
  v23[3] = v19;
  v22[4] = CFSTR("configurationUUID");
  objc_msgSend(v4, "posterUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v10;
  v22[5] = CFSTR("latestConfigurationVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "version"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v11;
  v22[6] = CFSTR("latestConfigurationSupplement");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "supplement"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v12;
  v22[7] = CFSTR("role");
  objc_msgSend(v6, "role");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = *MEMORY[0x1E0D7F758];
  if (v13)
    v15 = v13;
  v23[7] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 8, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[PBFPosterConfigurationStoreArchiveManifest initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", v16);
  return v17;
}

- (PBFPosterConfigurationStoreArchiveManifest)initWithDataRepresentation:(id)a3
{
  void *v4;
  PBFPosterConfigurationStoreArchiveManifest *v5;

  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PBFPosterConfigurationStoreArchiveManifest initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", v4);

  return v5;
}

- (PBFPosterConfigurationStoreArchiveManifest)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  PBFPosterConfigurationStoreArchiveManifest *v5;
  uint64_t v6;
  NSDictionary *dictionaryRepsentation;
  PBFPosterConfigurationStoreArchiveManifest *v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isManifestDictionaryValid:", v4))
  {
    v10.receiver = self;
    v10.super_class = (Class)PBFPosterConfigurationStoreArchiveManifest;
    v5 = -[PBFPosterConfigurationStoreArchiveManifest init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      dictionaryRepsentation = v5->_dictionaryRepsentation;
      v5->_dictionaryRepsentation = (NSDictionary *)v6;

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

  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepsentation, "objectForKeyedSubscript:", CFSTR("archiveVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)dataStoreVersion
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepsentation, "objectForKeyedSubscript:", CFSTR("dataStoreVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSString)buildVersion
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepsentation, "objectForKeyedSubscript:", CFSTR("buildVersion"));
}

- (NSString)extensionIdentifier
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepsentation, "objectForKeyedSubscript:", CFSTR("extensionIdentifier"));
}

- (NSUUID)configurationUUID
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepsentation, "objectForKeyedSubscript:", CFSTR("configurationUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  return (NSUUID *)v5;
}

- (unint64_t)latestConfigurationVersion
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepsentation, "objectForKeyedSubscript:", CFSTR("latestConfigurationVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (unint64_t)latestConfigurationSupplement
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepsentation, "objectForKeyedSubscript:", CFSTR("latestConfigurationSupplement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (id)dataRepresentationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_dictionaryRepsentation, 100, 0, a3);
}

- (NSString)role
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepsentation, "objectForKeyedSubscript:", CFSTR("role"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)*MEMORY[0x1E0D7F758];
  v4 = v2;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepsentation, 0);
}

@end
