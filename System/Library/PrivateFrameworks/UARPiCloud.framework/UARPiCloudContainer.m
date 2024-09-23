@implementation UARPiCloudContainer

- (UARPiCloudContainer)initWithContainerID:(id)a3
{
  id v4;
  UARPiCloudContainer *v5;
  UARPiCloudContainer *v6;
  uint64_t v7;
  NSString *containerID;
  uint64_t v9;
  CKDatabase *database;
  NSMutableSet *v11;
  NSMutableSet *updatedZones;
  NSMutableSet *v13;
  NSMutableSet *updatedRecords;
  UARPiCloudContainer *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UARPiCloudContainer;
  v5 = -[UARPiCloudContainer init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UARPiCloudContainer createContainerWithIdentifier:](v5, "createContainerWithIdentifier:", v4);
    if (!v6->_container)
    {
      v15 = 0;
      goto LABEL_6;
    }
    v7 = objc_msgSend(v4, "copy");
    containerID = v6->_containerID;
    v6->_containerID = (NSString *)v7;

    -[CKContainer publicCloudDatabase](v6->_container, "publicCloudDatabase");
    v9 = objc_claimAutoreleasedReturnValue();
    database = v6->_database;
    v6->_database = (CKDatabase *)v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    updatedZones = v6->_updatedZones;
    v6->_updatedZones = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    updatedRecords = v6->_updatedRecords;
    v6->_updatedRecords = v13;

  }
  v15 = v6;
LABEL_6:

  return v15;
}

- (void)createContainerWithIdentifier:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  CKContainer *v12;
  CKContainer *container;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = CFPreferencesGetAppBooleanValue(CFSTR("developmentEnvironment"), CFSTR("com.apple.UARPiCloud"), 0) != 0;
  if (objc_msgSend(v4, "containsString:", CFSTR("com.apple.chip")))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/Library/Managed Preferences/mobile/com.apple.UARPiCloud.plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:error:", v6, &v14);
    v8 = v14;
    if (v7)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("developmentEnvironment"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = objc_msgSend(v9, "BOOLValue");

    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[UARPiCloudContainer createContainerWithIdentifier:]";
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_219CF8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Failed to read managedPrefs at %@ error %@", buf, 0x20u);
    }

  }
  if (v5)
    v10 = 2;
  else
    v10 = 1;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9040]), "initWithContainerIdentifier:environment:", v4, v10);
  v12 = (CKContainer *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9028]), "initWithContainerID:", v11);
  container = self->_container;
  self->_container = v12;

}

- (void)setUpdatedZones:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *updatedZones;

  v4 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
  updatedZones = self->_updatedZones;
  self->_updatedZones = v4;

}

- (NSMutableSet)updatedZones
{
  return self->_updatedZones;
}

- (void)setUpdatedRecords:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *updatedRecords;

  v4 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
  updatedRecords = self->_updatedRecords;
  self->_updatedRecords = v4;

}

- (NSMutableSet)updatedRecords
{
  return self->_updatedRecords;
}

- (void)setDatabaseChangeToken:(id)a3
{
  CKServerChangeToken *v4;
  void *v5;
  id v6;
  void *v7;
  CKServerChangeToken *databaseChangeToken;
  id v9;

  v4 = (CKServerChangeToken *)a3;
  if (!-[UARPiCloudContainer isCHIPContainer](self, "isCHIPContainer") && v4)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), self->_containerID, CFSTR("Database"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    saveEntryForKey(v5, v7);

  }
  databaseChangeToken = self->_databaseChangeToken;
  self->_databaseChangeToken = v4;

}

- (CKServerChangeToken)databaseChangeToken
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  CKServerChangeToken *v7;
  id v8;
  CKServerChangeToken *databaseChangeToken;
  id v11;

  if (!-[UARPiCloudContainer isCHIPContainer](self, "isCHIPContainer"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), self->_containerID, CFSTR("Database"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!self->_databaseChangeToken)
    {
      getEntryForKey(v3);
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        v11 = 0;
        objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v11);
        v7 = (CKServerChangeToken *)objc_claimAutoreleasedReturnValue();
        v8 = v11;
        databaseChangeToken = self->_databaseChangeToken;
        self->_databaseChangeToken = v7;

      }
    }

  }
  return self->_databaseChangeToken;
}

- (void)setVerificationCertificate:(id)a3
{
  NSData *v4;
  void *v5;
  NSData *verificationCertificate;

  v4 = (NSData *)a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), self->_containerID, CFSTR("VerificationCertificate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    saveEntryForKey(v4, v5);

  }
  verificationCertificate = self->_verificationCertificate;
  self->_verificationCertificate = v4;

}

- (void)setPublicKey:(id)a3
{
  id v4;
  void *v5;
  id publicKey;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), self->_containerID, CFSTR("PublicKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    saveEntryForKey(v4, v5);

  }
  publicKey = self->_publicKey;
  self->_publicKey = v4;

}

- (NSData)verificationCertificate
{
  void *v3;
  NSData *verificationCertificate;
  NSData *v5;
  NSData *v6;
  NSData *v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), self->_containerID, CFSTR("VerificationCertificate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  verificationCertificate = self->_verificationCertificate;
  if (!verificationCertificate)
  {
    getEntryForKey(v3);
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    v6 = self->_verificationCertificate;
    self->_verificationCertificate = v5;

    verificationCertificate = self->_verificationCertificate;
  }
  v7 = verificationCertificate;

  return v7;
}

- (id)publicKey
{
  void *v3;
  id publicKey;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), self->_containerID, CFSTR("PublicKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  publicKey = self->_publicKey;
  if (!publicKey)
  {
    getEntryForKey(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_publicKey;
    self->_publicKey = v5;

    publicKey = self->_publicKey;
  }
  v7 = publicKey;

  return v7;
}

- (BOOL)requiresPrefForSigningBeta
{
  return -[NSString isEqualToString:](self->_containerID, "isEqualToString:", CFSTR("com.apple.uarp.uat"))
      || -[NSString isEqualToString:](self->_containerID, "isEqualToString:", CFSTR("com.apple.uarp.staging.uat"))
      || -[NSString isEqualToString:](self->_containerID, "isEqualToString:", CFSTR("com.apple.uarp.beta"))
      || -[NSString isEqualToString:](self->_containerID, "isEqualToString:", CFSTR("com.apple.uarp.staging.beta"))
      || -[NSString isEqualToString:](self->_containerID, "isEqualToString:", CFSTR("com.apple.uarp.staging"))
      || -[NSString isEqualToString:](self->_containerID, "isEqualToString:", CFSTR("com.apple.chip.staging"));
}

- (BOOL)isCHIPContainer
{
  return -[NSString isEqualToString:](self->_containerID, "isEqualToString:", CFSTR("com.apple.chip"))
      || -[NSString isEqualToString:](self->_containerID, "isEqualToString:", CFSTR("com.apple.chip.staging"));
}

- (void)processVerificationCertificateRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  id v10;
  NSDictionary *verificationCertificates;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[UARPiCloudContainer isCHIPContainer](self, "isCHIPContainer"))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("certificate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      v7 = (void *)MEMORY[0x24BDD1608];
      objc_msgSend(v5, "dataUsingEncoding:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      objc_msgSend(v7, "JSONObjectWithData:options:error:", v8, 0, &v12);
      v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v10 = v12;
      verificationCertificates = self->_verificationCertificates;
      self->_verificationCertificates = v9;

      if (v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v10;
        _os_log_impl(&dword_219CF8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create _verificationCertificates with error: %@", buf, 0xCu);
      }

    }
  }

}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)containerID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (CKDatabase)database
{
  return (CKDatabase *)objc_getProperty(self, a2, 64, 1);
}

- (NSDictionary)verificationCertificates
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setVerificationCertificates:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationCertificates, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_updatedRecords, 0);
  objc_storeStrong((id *)&self->_updatedZones, 0);
  objc_storeStrong(&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_verificationCertificate, 0);
  objc_storeStrong((id *)&self->_databaseChangeToken, 0);
}

@end
