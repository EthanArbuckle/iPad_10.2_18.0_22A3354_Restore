@implementation PDCFileBackedConsentStore

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeObserver, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
}

- (PDCFileBackedConsentStore)initWithConsentStoreURL:(id)a3
{
  id v5;
  PDCFileBackedConsentStore *v6;
  PDCFileBackedConsentStore *v7;
  PDCFileBackedConsentStore *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PDCFileBackedConsentStore;
  v6 = -[PDCFileBackedConsentStore init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeURL, a3);
    v8 = v7;
  }

  return v7;
}

- (id)userConsentedRegulatoryDisclosureVersionForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v9;

  if (!a3)
    return 0;
  -[PDCFileBackedConsentStore consentRecordURLForBundleIdentifier:](self, "consentRecordURLForBundleIdentifier:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v3, 4, &v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    if (v5)
    {
      v6 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[PDCFileBackedConsentStore userConsentedRegulatoryDisclosureVersionForBundleIdentifier:].cold.1((uint64_t)v3, v6);
      v7 = 0;
    }
    else
    {
      v7 = v4;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)writeUserConsentedRegulatoryDisclosureVersion:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v18;
  id v19;

  v6 = a3;
  v7 = a4;
  -[PDCFileBackedConsentStore consentRecordURLForBundleIdentifier:](self, "consentRecordURLForBundleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByDeletingLastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v19);
    v12 = v19;

    if (v12)
      goto LABEL_10;
    v18 = 0;
    objc_msgSend(v6, "writeToURL:atomically:encoding:error:", v9, 1, 4, &v18);
  }
  else if (unlink((const char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation")))
  {
    v13 = *__error();
    if ((_DWORD)v13 != 2)
    {
      v16 = objc_alloc(MEMORY[0x24BDD1540]);
      v12 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v13, 0);
      goto LABEL_10;
    }
  }
  -[PDCFileBackedConsentStore changeObserver](self, "changeObserver");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    (*(void (**)(uint64_t, PDCFileBackedConsentStore *, id, id))(v14 + 16))(v14, self, v7, v6);

  v12 = 0;
LABEL_10:

  return v12;
}

- (id)consentRecordURLForBundleIdentifier:(id)a3
{
  return -[NSURL URLByAppendingPathComponent:](self->_storeURL, "URLByAppendingPathComponent:", a3);
}

- (NSSet)consentedBundleIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", -[NSURL fileSystemRepresentation](self->_storeURL, "fileSystemRepresentation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (id)changeObserver
{
  return self->_changeObserver;
}

- (void)setChangeObserver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)userConsentedRegulatoryDisclosureVersionForBundleIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2449FF000, a2, OS_LOG_TYPE_ERROR, "Failed to read authorization record at %@", (uint8_t *)&v2, 0xCu);
}

@end
