@implementation SUControllerDescriptor

- (SUControllerDescriptor)init
{
  SUControllerDescriptor *v2;
  SUControllerDescriptor *v3;
  SUControllerDocumentation *documentation;
  NSString *productVersion;
  NSString *productBuildVersion;
  NSString *documentationID;
  NSString *marketingVersion;
  NSString *publisher;
  NSString *productSystemName;
  NSString *fullProductVersion;
  NSError *denialReasons;
  MAAsset *softwareUpdateAsset;
  MAAsset *documentationAsset;
  SUCoreDescriptor *coreDescriptor;
  NSString *requestedPMV;
  NSString *releaseType;
  NSDate *releaseDate;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SUControllerDescriptor;
  v2 = -[SUControllerDescriptor init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    documentation = v2->_documentation;
    v2->_documentation = 0;

    productVersion = v3->_productVersion;
    v3->_productVersion = 0;

    productBuildVersion = v3->_productBuildVersion;
    v3->_productBuildVersion = 0;

    documentationID = v3->_documentationID;
    v3->_documentationID = 0;

    marketingVersion = v3->_marketingVersion;
    v3->_marketingVersion = 0;

    publisher = v3->_publisher;
    v3->_publisher = 0;

    productSystemName = v3->_productSystemName;
    v3->_productSystemName = 0;

    fullProductVersion = v3->_fullProductVersion;
    v3->_fullProductVersion = 0;

    denialReasons = v3->_denialReasons;
    v3->_denialReasons = 0;

    *(_WORD *)&v3->_userDidAcceptTermsAndConditions = 0;
    v3->_rampEnabled = 0;
    *(_WORD *)&v3->_willProceedWithInstallation = 0;
    v3->_installationSize = 0;
    v3->_totalRequiredFreeSpace = 0;
    v3->_downloadSize = 0;
    v3->_unarchivedSize = 0;
    v3->_msuPrepareSize = 0;
    softwareUpdateAsset = v3->_softwareUpdateAsset;
    v3->_softwareUpdateAsset = 0;

    documentationAsset = v3->_documentationAsset;
    v3->_documentationAsset = 0;

    coreDescriptor = v3->_coreDescriptor;
    v3->_coreDescriptor = 0;

    v3->_hasBeenAbandoned = 0;
    v3->_isSupervisedPolicy = 0;
    requestedPMV = v3->_requestedPMV;
    v3->_requestedPMV = 0;

    v3->_delayPeriod = 0;
    releaseType = v3->_releaseType;
    v3->_releaseType = 0;

    releaseDate = v3->_releaseDate;
    v3->_releaseDate = 0;

  }
  return v3;
}

- (SUControllerDescriptor)initWithCoder:(id)a3
{
  id v4;
  SUControllerDescriptor *v5;
  uint64_t v6;
  SUControllerDocumentation *documentation;
  uint64_t v8;
  NSString *productVersion;
  uint64_t v10;
  NSString *productBuildVersion;
  uint64_t v12;
  NSString *documentationID;
  uint64_t v14;
  NSString *marketingVersion;
  uint64_t v16;
  NSString *publisher;
  uint64_t v18;
  NSString *productSystemName;
  uint64_t v20;
  NSError *denialReasons;
  NSString *fullProductVersion;
  MAAsset *softwareUpdateAsset;
  MAAsset *documentationAsset;
  uint64_t v25;
  SUCoreDescriptor *coreDescriptor;
  uint64_t v27;
  NSString *requestedPMV;
  uint64_t v29;
  NSString *releaseType;
  uint64_t v31;
  NSDate *releaseDate;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SUControllerDescriptor;
  v5 = -[SUControllerDescriptor init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentation"));
    v6 = objc_claimAutoreleasedReturnValue();
    documentation = v5->_documentation;
    v5->_documentation = (SUControllerDocumentation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productBuildVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    productBuildVersion = v5->_productBuildVersion;
    v5->_productBuildVersion = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentationID"));
    v12 = objc_claimAutoreleasedReturnValue();
    documentationID = v5->_documentationID;
    v5->_documentationID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MarketingVersion"));
    v14 = objc_claimAutoreleasedReturnValue();
    marketingVersion = v5->_marketingVersion;
    v5->_marketingVersion = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publisher"));
    v16 = objc_claimAutoreleasedReturnValue();
    publisher = v5->_publisher;
    v5->_publisher = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productSystemName"));
    v18 = objc_claimAutoreleasedReturnValue();
    productSystemName = v5->_productSystemName;
    v5->_productSystemName = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("denialReasons"));
    v20 = objc_claimAutoreleasedReturnValue();
    denialReasons = v5->_denialReasons;
    v5->_denialReasons = (NSError *)v20;

    v5->_downloadSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("downloadSize"));
    v5->_unarchivedSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("unarchivedSize"));
    v5->_msuPrepareSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("msuPrepareSize"));
    v5->_installationSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("installationSize"));
    v5->_totalRequiredFreeSpace = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("TotalRequiredFreeSpace"));
    v5->_userDidAcceptTermsAndConditions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userDidAcceptTermsAndConditions"));
    v5->_fullReplacement = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fullReplacement"));
    v5->_rampEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("rampEnabled"));
    v5->_willProceedWithInstallation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("willProceedWithInstallation"));
    v5->_isAwaitingAdmissionControlForInstallation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAwaitingAdmissionControlForInstallation"));
    fullProductVersion = v5->_fullProductVersion;
    v5->_fullProductVersion = 0;

    softwareUpdateAsset = v5->_softwareUpdateAsset;
    v5->_softwareUpdateAsset = 0;

    documentationAsset = v5->_documentationAsset;
    v5->_documentationAsset = 0;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coreDescriptor"));
    v25 = objc_claimAutoreleasedReturnValue();
    coreDescriptor = v5->_coreDescriptor;
    v5->_coreDescriptor = (SUCoreDescriptor *)v25;

    v5->_hasBeenAbandoned = 0;
    v5->_isSupervisedPolicy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSupervisedPolicy"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedPMV"));
    v27 = objc_claimAutoreleasedReturnValue();
    requestedPMV = v5->_requestedPMV;
    v5->_requestedPMV = (NSString *)v27;

    v5->_delayPeriod = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("delayPeriod"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseType"));
    v29 = objc_claimAutoreleasedReturnValue();
    releaseType = v5->_releaseType;
    v5->_releaseType = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseDate"));
    v31 = objc_claimAutoreleasedReturnValue();
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v31;

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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[SUControllerDescriptor documentation](self, "documentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("documentation"));

  -[SUControllerDescriptor productVersion](self, "productVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("productVersion"));

  -[SUControllerDescriptor productBuildVersion](self, "productBuildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("productBuildVersion"));

  -[SUControllerDescriptor documentationID](self, "documentationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("documentationID"));

  -[SUControllerDescriptor marketingVersion](self, "marketingVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("MarketingVersion"));

  -[SUControllerDescriptor publisher](self, "publisher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("publisher"));

  -[SUControllerDescriptor productSystemName](self, "productSystemName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("productSystemName"));

  -[SUControllerDescriptor denialReasons](self, "denialReasons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("denialReasons"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[SUControllerDescriptor downloadSize](self, "downloadSize"), CFSTR("downloadSize"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUControllerDescriptor unarchivedSize](self, "unarchivedSize"), CFSTR("unarchivedSize"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUControllerDescriptor msuPrepareSize](self, "msuPrepareSize"), CFSTR("msuPrepareSize"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUControllerDescriptor installationSize](self, "installationSize"), CFSTR("installationSize"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUControllerDescriptor totalRequiredFreeSpace](self, "totalRequiredFreeSpace"), CFSTR("TotalRequiredFreeSpace"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUControllerDescriptor userDidAcceptTermsAndConditions](self, "userDidAcceptTermsAndConditions"), CFSTR("userDidAcceptTermsAndConditions"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUControllerDescriptor fullReplacement](self, "fullReplacement"), CFSTR("fullReplacement"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUControllerDescriptor rampEnabled](self, "rampEnabled"), CFSTR("rampEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUControllerDescriptor willProceedWithInstallation](self, "willProceedWithInstallation"), CFSTR("willProceedWithInstallation"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUControllerDescriptor isAwaitingAdmissionControlForInstallation](self, "isAwaitingAdmissionControlForInstallation"), CFSTR("isAwaitingAdmissionControlForInstallation"));
  -[SUControllerDescriptor coreDescriptor](self, "coreDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("coreDescriptor"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SUControllerDescriptor isSupervisedPolicy](self, "isSupervisedPolicy"), CFSTR("isSupervisedPolicy"));
  -[SUControllerDescriptor requestedPMV](self, "requestedPMV");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("requestedPMV"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SUControllerDescriptor delayPeriod](self, "delayPeriod"), CFSTR("delayPeriod"));
  -[SUControllerDescriptor releaseType](self, "releaseType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("releaseType"));

  -[SUControllerDescriptor releaseDate](self, "releaseDate");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("releaseDate"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SUControllerDescriptor *v4;
  SUControllerDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  int v11;

  v4 = (SUControllerDescriptor *)a3;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SUControllerDescriptor productVersion](v5, "productVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUControllerDescriptor productVersion](self, "productVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[SUControllerDescriptor productBuildVersion](v5, "productBuildVersion");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUControllerDescriptor productBuildVersion](self, "productBuildVersion");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", v9))
        {
          v10 = -[SUControllerDescriptor isSupervisedPolicy](v5, "isSupervisedPolicy");
          v11 = v10 ^ -[SUControllerDescriptor isSupervisedPolicy](self, "isSupervisedPolicy") ^ 1;
        }
        else
        {
          LOBYTE(v11) = 0;
        }

      }
      else
      {
        LOBYTE(v11) = 0;
      }

    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUControllerDescriptor productVersion](self, "productVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerDescriptor productBuildVersion](self, "productBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  return v7;
}

- (id)description
{
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v23 = (void *)MEMORY[0x24BDD17C8];
  -[SUControllerDescriptor humanReadableUpdateName](self, "humanReadableUpdateName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerDescriptor productVersion](self, "productVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerDescriptor productBuildVersion](self, "productBuildVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerDescriptor productSystemName](self, "productSystemName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerDescriptor publisher](self, "publisher");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SUControllerDescriptor downloadSize](self, "downloadSize");
  v17 = -[SUControllerDescriptor preparationSize](self, "preparationSize");
  v16 = -[SUControllerDescriptor installationSize](self, "installationSize");
  v15 = -[SUControllerDescriptor totalRequiredFreeSpace](self, "totalRequiredFreeSpace");
  -[SUControllerDescriptor documentationID](self, "documentationID");
  v3 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v3;
  -[SUControllerDescriptor marketingVersion](self, "marketingVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("YES");
  if (-[SUControllerDescriptor fullReplacement](self, "fullReplacement"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[SUControllerDescriptor rampEnabled](self, "rampEnabled"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[SUControllerDescriptor denialReasons](self, "denialReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerDescriptor releaseType](self, "releaseType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerDescriptor releaseDate](self, "releaseDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SUControllerDescriptor isSupervisedPolicy](self, "isSupervisedPolicy"))
    v4 = CFSTR("NO");
  -[SUControllerDescriptor requestedPMV](self, "requestedPMV");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("\n            HumanReadableUpdateName: %@\n            ProductVersion: %@\n            ProductBuildVersion: %@\n            ProductSystemName: %@\n            Publisher: %@\n            DownloadSize: %lld\n            PreparationSize: %lld\n            InstallationSize: %lld\n            TotalRequiredFreeSpace: %lld\n            DocumentationID: %@\n            MarketingVersion: %@\n            FullReplacement: %@\n            RampEnabled: %@\n            CurrentDenialReasons: %@\n            ReleaseType: %@\n            ReleaseDate: %@\n            IsSupervisedPolicy: %@\n            RequestedPMV: %@\n            DelayPeriod: %d days"), v22, v21, v20, v19, v24, v18, v17, v16, v15, v3, v14, v5, v6, v7, v8, v9,
    v4,
    v10,
    -[SUControllerDescriptor delayPeriod](self, "delayPeriod"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUControllerDescriptor humanReadableUpdateName](self, "humanReadableUpdateName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerDescriptor productBuildVersion](self, "productBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUControllerDescriptor isSupervisedPolicy](self, "isSupervisedPolicy");
  v7 = CFSTR("Not Supervised");
  if (v6)
    v7 = CFSTR("Supervised");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ (%@)"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)compare:(id)a3
{
  SUControllerDescriptor *v4;
  SUControllerDescriptor *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;

  v4 = (SUControllerDescriptor *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 0;
  }
  else if (v4)
  {
    -[SUControllerDescriptor productVersion](self, "productVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUControllerDescriptor productVersion](v5, "productVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "compare:options:", v7, 64);

    if (v8 != 1 && v8 != -1)
    {
      -[SUControllerDescriptor productBuildVersion](self, "productBuildVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUControllerDescriptor productBuildVersion](v5, "productBuildVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "compare:options:", v10, 64);

    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (int64_t)preparationSize
{
  int64_t v3;

  v3 = -[SUControllerDescriptor unarchivedSize](self, "unarchivedSize");
  return -[SUControllerDescriptor msuPrepareSize](self, "msuPrepareSize") + v3;
}

- (NSString)humanReadableUpdateName
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[SUControllerDescriptor documentation](self, "documentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "humanReadableUpdateName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUControllerDescriptor documentation](self, "documentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "humanReadableUpdateName");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SUControllerDescriptor productSystemName](self, "productSystemName");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7
      || (v8 = (void *)v7,
          -[SUControllerDescriptor productVersion](self, "productVersion"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          !v9))
    {
      v6 = CFSTR("Software Update");
      return (NSString *)v6;
    }
    v10 = (void *)MEMORY[0x24BDD17C8];
    -[SUControllerDescriptor productSystemName](self, "productSystemName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUControllerDescriptor productVersion](self, "productVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ %@"), v5, v11);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (SUControllerDocumentation)documentation
{
  return self->_documentation;
}

- (void)setDocumentation:(id)a3
{
  objc_storeStrong((id *)&self->_documentation, a3);
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productVersion, a3);
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (void)setProductBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productBuildVersion, a3);
}

- (NSString)documentationID
{
  return self->_documentationID;
}

- (void)setDocumentationID:(id)a3
{
  objc_storeStrong((id *)&self->_documentationID, a3);
}

- (NSString)marketingVersion
{
  return self->_marketingVersion;
}

- (void)setMarketingVersion:(id)a3
{
  objc_storeStrong((id *)&self->_marketingVersion, a3);
}

- (NSString)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (NSString)productSystemName
{
  return self->_productSystemName;
}

- (void)setProductSystemName:(id)a3
{
  objc_storeStrong((id *)&self->_productSystemName, a3);
}

- (int64_t)downloadSize
{
  return self->_downloadSize;
}

- (void)setDownloadSize:(int64_t)a3
{
  self->_downloadSize = a3;
}

- (int64_t)installationSize
{
  return self->_installationSize;
}

- (void)setInstallationSize:(int64_t)a3
{
  self->_installationSize = a3;
}

- (int64_t)totalRequiredFreeSpace
{
  return self->_totalRequiredFreeSpace;
}

- (void)setTotalRequiredFreeSpace:(int64_t)a3
{
  self->_totalRequiredFreeSpace = a3;
}

- (BOOL)userDidAcceptTermsAndConditions
{
  return self->_userDidAcceptTermsAndConditions;
}

- (void)setUserDidAcceptTermsAndConditions:(BOOL)a3
{
  self->_userDidAcceptTermsAndConditions = a3;
}

- (BOOL)fullReplacement
{
  return self->_fullReplacement;
}

- (void)setFullReplacement:(BOOL)a3
{
  self->_fullReplacement = a3;
}

- (BOOL)rampEnabled
{
  return self->_rampEnabled;
}

- (void)setRampEnabled:(BOOL)a3
{
  self->_rampEnabled = a3;
}

- (NSError)denialReasons
{
  return self->_denialReasons;
}

- (void)setDenialReasons:(id)a3
{
  objc_storeStrong((id *)&self->_denialReasons, a3);
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_releaseType, a3);
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
  objc_storeStrong((id *)&self->_releaseDate, a3);
}

- (BOOL)isSupervisedPolicy
{
  return self->_isSupervisedPolicy;
}

- (void)setIsSupervisedPolicy:(BOOL)a3
{
  self->_isSupervisedPolicy = a3;
}

- (NSString)requestedPMV
{
  return self->_requestedPMV;
}

- (void)setRequestedPMV:(id)a3
{
  objc_storeStrong((id *)&self->_requestedPMV, a3);
}

- (int64_t)delayPeriod
{
  return self->_delayPeriod;
}

- (void)setDelayPeriod:(int64_t)a3
{
  self->_delayPeriod = a3;
}

- (NSString)fullProductVersion
{
  return self->_fullProductVersion;
}

- (void)setFullProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_fullProductVersion, a3);
}

- (int64_t)unarchivedSize
{
  return self->_unarchivedSize;
}

- (void)setUnarchivedSize:(int64_t)a3
{
  self->_unarchivedSize = a3;
}

- (int64_t)msuPrepareSize
{
  return self->_msuPrepareSize;
}

- (void)setMsuPrepareSize:(int64_t)a3
{
  self->_msuPrepareSize = a3;
}

- (BOOL)willProceedWithInstallation
{
  return self->_willProceedWithInstallation;
}

- (void)setWillProceedWithInstallation:(BOOL)a3
{
  self->_willProceedWithInstallation = a3;
}

- (BOOL)isAwaitingAdmissionControlForInstallation
{
  return self->_isAwaitingAdmissionControlForInstallation;
}

- (void)setIsAwaitingAdmissionControlForInstallation:(BOOL)a3
{
  self->_isAwaitingAdmissionControlForInstallation = a3;
}

- (MAAsset)softwareUpdateAsset
{
  return self->_softwareUpdateAsset;
}

- (void)setSoftwareUpdateAsset:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateAsset, a3);
}

- (MAAsset)documentationAsset
{
  return self->_documentationAsset;
}

- (void)setDocumentationAsset:(id)a3
{
  objc_storeStrong((id *)&self->_documentationAsset, a3);
}

- (SUCoreDescriptor)coreDescriptor
{
  return self->_coreDescriptor;
}

- (void)setCoreDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_coreDescriptor, a3);
}

- (BOOL)hasBeenAbandoned
{
  return self->_hasBeenAbandoned;
}

- (void)setHasBeenAbandoned:(BOOL)a3
{
  self->_hasBeenAbandoned = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDescriptor, 0);
  objc_storeStrong((id *)&self->_documentationAsset, 0);
  objc_storeStrong((id *)&self->_softwareUpdateAsset, 0);
  objc_storeStrong((id *)&self->_fullProductVersion, 0);
  objc_storeStrong((id *)&self->_requestedPMV, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_releaseType, 0);
  objc_storeStrong((id *)&self->_denialReasons, 0);
  objc_storeStrong((id *)&self->_productSystemName, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_marketingVersion, 0);
  objc_storeStrong((id *)&self->_documentationID, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_documentation, 0);
}

@end
