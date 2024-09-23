@implementation CHIPAccessoriesRecord

- (CHIPAccessoriesRecord)initWithCKRecord:(id)a3
{
  id v4;
  OS_os_log *v5;
  OS_os_log *log;
  void *v7;
  int v8;
  void *v9;
  NSString *v10;
  NSString *accessoryListSignature;
  void *v12;
  NSString *v13;
  NSString *stonehengeCertificateID;
  void *v15;
  NSString *v16;
  NSString *installationGuideURLString;
  CHIPAccessoriesRecord *v18;
  objc_super v20;

  v4 = a3;
  if (!v4)
    goto LABEL_9;
  v20.receiver = self;
  v20.super_class = (Class)CHIPAccessoriesRecord;
  self = -[CHIPAccessoriesRecord init](&v20, sel_init);
  if (!self)
    goto LABEL_8;
  v5 = (OS_os_log *)os_log_create("com.apple.accessoryupdater.uarp", "iCloudAssetManager");
  log = self->_log;
  self->_log = v5;

  objc_msgSend(v4, "recordType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("CHIPAccessory"));

  if (!v8)
    goto LABEL_9;
  objc_msgSend(v4, "objectForKey:", CFSTR("signatureV2"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (NSString *)objc_msgSend(v9, "copy");
  accessoryListSignature = self->_accessoryListSignature;
  self->_accessoryListSignature = v10;

  if (!self->_accessoryListSignature)
    goto LABEL_9;
  objc_msgSend(v4, "objectForKey:", CFSTR("verificationCertificateKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (NSString *)objc_msgSend(v12, "copy");
  stonehengeCertificateID = self->_stonehengeCertificateID;
  self->_stonehengeCertificateID = v13;

  if (!self->_stonehengeCertificateID)
    goto LABEL_9;
  objc_msgSend(v4, "objectForKey:", CFSTR("accessoryInstallationGuideURL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (NSString *)objc_msgSend(v15, "copy");
  installationGuideURLString = self->_installationGuideURLString;
  self->_installationGuideURLString = v16;

  if (-[CHIPAccessoriesRecord createAccessoryMetadata:](self, "createAccessoryMetadata:", v4)
    && self->_accessoryMetadata)
  {
LABEL_8:
    self = self;
    v18 = self;
  }
  else
  {
LABEL_9:
    v18 = 0;
  }

  return v18;
}

- (BOOL)createAccessoryMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  UARPAccessoryMetadata *v11;
  UARPAccessoryMetadata *accessoryMetadata;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("-"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v8 == 2)
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (UARPAccessoryMetadata *)objc_msgSend(objc_alloc(MEMORY[0x24BE289F8]), "initWithProductGroup:productNumber:", v9, v10);
    accessoryMetadata = self->_accessoryMetadata;
    self->_accessoryMetadata = v11;

    objc_msgSend(v4, "objectForKey:", CFSTR("accessoryCategoryNumber"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPAccessoryMetadata setAccessoryCategoryNumber:](self->_accessoryMetadata, "setAccessoryCategoryNumber:", objc_msgSend(v13, "unsignedLongLongValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("accessoryMarketingName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPAccessoryMetadata setAccessoryMarketingName:](self->_accessoryMetadata, "setAccessoryMarketingName:", v14);

    objc_msgSend(v4, "objectForKey:", CFSTR("accessoryProductLabelV2"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPAccessoryMetadata setAccessoryProductLabel:](self->_accessoryMetadata, "setAccessoryProductLabel:", v15);

    objc_msgSend(v4, "objectForKey:", CFSTR("vendorName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPAccessoryMetadata setVendorName:](self->_accessoryMetadata, "setVendorName:", v16);

    objc_msgSend(v4, "objectForKey:", CFSTR("companyLegalName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPAccessoryMetadata setCompanyLegalName:](self->_accessoryMetadata, "setCompanyLegalName:", v17);

    objc_msgSend(v4, "objectForKey:", CFSTR("companyPreferredName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPAccessoryMetadata setCompanyPreferredName:](self->_accessoryMetadata, "setCompanyPreferredName:", v18);

    -[UARPAccessoryMetadata setAccessoryCapability:](self->_accessoryMetadata, "setAccessoryCapability:", 16);
    if (self->_installationGuideURLString)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPAccessoryMetadata setAccessoryInstallationGuideURL:](self->_accessoryMetadata, "setAccessoryInstallationGuideURL:", v19);

    }
  }

  return v8 == 2;
}

- (UARPAccessoryMetadata)accessoryMetadata
{
  return (UARPAccessoryMetadata *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)accessoryListSignature
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)stonehengeCertificateID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)installationGuideURLString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installationGuideURLString, 0);
  objc_storeStrong((id *)&self->_stonehengeCertificateID, 0);
  objc_storeStrong((id *)&self->_accessoryListSignature, 0);
  objc_storeStrong((id *)&self->_accessoryMetadata, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
