@implementation PLLibraryOpenerCreationOptions

- (PLLibraryOpenerCreationOptions)initWithOptionsDictionary:(id)a3 connectionAuthorization:(id)a4
{
  id v6;
  id v7;
  PLLibraryOpenerCreationOptions *v8;
  uint64_t v9;
  NSURL *libraryBundleURL;
  uint64_t v11;
  NSString *libraryName;
  uint64_t v13;
  NSString *userDescription;
  uint64_t v15;
  NSDictionary *internalTestOptions;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSDictionary *createDatabaseOptionsDictionary;
  void *v21;
  void *v22;
  NSString *v23;
  void *uuid;
  uint64_t v25;
  NSString *v26;
  uint64_t domain;
  __CFString *v28;
  void *v29;
  NSString *v30;
  NSString *containerIdentifier;
  NSObject *v32;
  objc_super v34;
  uint8_t buf[4];
  id v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)PLLibraryOpenerCreationOptions;
  v8 = -[PLLibraryOpenerCreationOptions init](&v34, sel_init);
  if (!v8)
    goto LABEL_22;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLPhotoLibraryOpenerOptionsBundleURLKey"));
  v9 = objc_claimAutoreleasedReturnValue();
  libraryBundleURL = v8->_libraryBundleURL;
  v8->_libraryBundleURL = (NSURL *)v9;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLPhotoLibraryOpenerOptionsNameKey"));
  v11 = objc_claimAutoreleasedReturnValue();
  libraryName = v8->_libraryName;
  v8->_libraryName = (NSString *)v11;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLPhotoLibraryOpenerOptionsDescriptionKey"));
  v13 = objc_claimAutoreleasedReturnValue();
  userDescription = v8->_userDescription;
  v8->_userDescription = (NSString *)v13;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLPhotoLibraryOpenerOptionsTestOptionsKey"));
  v15 = objc_claimAutoreleasedReturnValue();
  internalTestOptions = v8->_internalTestOptions;
  v8->_internalTestOptions = (NSDictionary *)v15;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLPhotoLibraryCreateOptions"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
  {
    v37 = CFSTR("PLPhotoLibraryCreateOptions");
    v38[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v19 = objc_claimAutoreleasedReturnValue();
    createDatabaseOptionsDictionary = v8->_createDatabaseOptionsDictionary;
    v8->_createDatabaseOptionsDictionary = (NSDictionary *)v19;

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLPhotoLibraryOpenerOptionsIdentifierUUIDKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v8->_hasCustomUUID = 1;
    v23 = v21;
    uuid = v8->_uuid;
    v8->_uuid = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    uuid = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(uuid, "UUIDString");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v8->_uuid;
    v8->_uuid = (NSString *)v25;

  }
  domain = objc_msgSend((id)objc_opt_class(), "resolvePhotoLibraryDomainWithOptionsDictionary:", v6);
  v8->_domain = domain;
  if (domain == 3)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLPhotoLibraryOpenerOptionsContainerIdentifierKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      if (!objc_msgSend((id)objc_opt_class(), "validateContinerIdentifier:connectionAuthorization:", v29, v7))goto LABEL_15;
      v30 = v29;
    }
    else
    {
      objc_msgSend(v7, "trustedCallerBundleID");
      v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    containerIdentifier = v8->_containerIdentifier;
    v8->_containerIdentifier = v30;

    goto LABEL_15;
  }
  if (domain != 2)
    goto LABEL_16;
  v28 = CFSTR("com.apple.photos");
  v29 = v8->_containerIdentifier;
  v8->_containerIdentifier = (NSString *)CFSTR("com.apple.photos");
LABEL_15:

  domain = v8->_domain;
LABEL_16:
  if (!domain || !v8->_containerIdentifier)
  {
    PLPhotoKitGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v6;
      _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Unsupported library domain/container in options %@", buf, 0xCu);
    }

    v8 = 0;
  }

LABEL_22:
  return v8;
}

- (PLLibraryOpenerCreationOptions)initWithWellKnownLibraryIdentifier:(int64_t)a3
{
  PLLibraryOpenerCreationOptions *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSDictionary *createDatabaseOptionsDictionary;
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PLLibraryOpenerCreationOptions;
  v4 = -[PLLibraryOpenerCreationOptions init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(MEMORY[0x1E0D73280], "libraryCreateOptionsForWellKnownLibraryIdentifier:", a3);
    if (v5)
    {
      v11 = CFSTR("PLPhotoLibraryCreateOptions");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v7 = objc_claimAutoreleasedReturnValue();
      createDatabaseOptionsDictionary = v4->_createDatabaseOptionsDictionary;
      v4->_createDatabaseOptionsDictionary = (NSDictionary *)v7;

    }
    objc_storeStrong((id *)&v4->_containerIdentifier, CFSTR("com.apple.photos"));
  }
  return v4;
}

- (BOOL)hasCustomUUID
{
  return self->_hasCustomUUID;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  -[PLLibraryOpenerCreationOptions internalTestOptions](self, "internalTestOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[PLLibraryOpenerCreationOptions internalTestOptions](self, "internalTestOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("\n(testOptions):%@"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1E36789C0;
  }

  -[PLLibraryOpenerCreationOptions createDatabaseOptionsDictionary](self, "createDatabaseOptionsDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[PLLibraryOpenerCreationOptions createDatabaseOptionsDictionary](self, "createDatabaseOptionsDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("\n(createDBOptions):%@"), v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = &stru_1E36789C0;
  }

  v22.receiver = self;
  v22.super_class = (Class)PLLibraryOpenerCreationOptions;
  -[PLLibraryOpenerCreationOptions description](&v22, sel_description);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryOpenerCreationOptions uuid](self, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryOpenerCreationOptions containerIdentifier](self, "containerIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PLLibraryOpenerCreationOptions domain](self, "domain");
  -[PLLibraryOpenerCreationOptions libraryName](self, "libraryName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryOpenerCreationOptions userDescription](self, "userDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryOpenerCreationOptions libraryBundleURL](self, "libraryBundleURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingFormat:", CFSTR(": UUID:[%@], cId:[%@], d:[%d], name:[%@], uDesc:[%@], libraryURL:[%@]%@%@"), v14, v15, v16, v17, v18, v19, v7, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (int64_t)domain
{
  return self->_domain;
}

- (NSString)libraryName
{
  return self->_libraryName;
}

- (NSString)userDescription
{
  return self->_userDescription;
}

- (NSDictionary)createDatabaseOptionsDictionary
{
  return self->_createDatabaseOptionsDictionary;
}

- (NSDictionary)internalTestOptions
{
  return self->_internalTestOptions;
}

- (NSURL)libraryBundleURL
{
  return self->_libraryBundleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryBundleURL, 0);
  objc_storeStrong((id *)&self->_internalTestOptions, 0);
  objc_storeStrong((id *)&self->_createDatabaseOptionsDictionary, 0);
  objc_storeStrong((id *)&self->_userDescription, 0);
  objc_storeStrong((id *)&self->_libraryName, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (int64_t)resolvePhotoLibraryDomainWithOptionsDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLPhotoLibraryOpenerOptionsDomainKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLPhotoLibraryOpenerOptionsContainerIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "integerValue") != 2)
  {
    if (objc_msgSend(v4, "integerValue") == 3
      && (!v5 || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.photos")) & 1) == 0))
    {
      v6 = 3;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (v5 && !objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.photos")))
  {
LABEL_9:
    v6 = 0;
    goto LABEL_11;
  }
  v6 = 2;
LABEL_11:

  return v6;
}

+ (BOOL)validateContinerIdentifier:(id)a3 connectionAuthorization:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  v7 = v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v5, "length") != 0;

  return v7;
}

@end
