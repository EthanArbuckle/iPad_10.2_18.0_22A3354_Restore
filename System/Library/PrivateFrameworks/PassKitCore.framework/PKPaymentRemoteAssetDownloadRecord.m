@implementation PKPaymentRemoteAssetDownloadRecord

- (PKPaymentRemoteAssetDownloadRecord)init
{
  PKPaymentRemoteAssetDownloadRecord *v2;
  NSDictionary *v3;
  NSDictionary *remoteAssetsByTaskIdentifier;
  NSDictionary *v5;
  NSDictionary *remoteAssetsByRecordName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentRemoteAssetDownloadRecord;
  v2 = -[PKPaymentRemoteAssetDownloadRecord init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    remoteAssetsByTaskIdentifier = v2->_remoteAssetsByTaskIdentifier;
    v2->_remoteAssetsByTaskIdentifier = v3;

    v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    remoteAssetsByRecordName = v2->_remoteAssetsByRecordName;
    v2->_remoteAssetsByRecordName = v5;

  }
  return v2;
}

- (PKPaymentRemoteAssetDownloadRecord)initWithCoder:(id)a3
{
  id v4;
  PKPaymentRemoteAssetDownloadRecord *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentRemoteAssetDownloadRecord;
  v5 = -[PKPaymentBackgroundDownloadRecord initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRemoteAssetDownloadRecord setPassURL:](v5, "setPassURL:", v6);

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("remoteAssets"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRemoteAssetDownloadRecord setRemoteAssetsByTaskIdentifier:](v5, "setRemoteAssetsByTaskIdentifier:", v12);

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("remoteCloudAssets"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRemoteAssetDownloadRecord setRemoteAssetsByRecordName:](v5, "setRemoteAssetsByRecordName:", v18);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentRemoteAssetDownloadRecord;
  v4 = a3;
  -[PKPaymentBackgroundDownloadRecord encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[PKPaymentRemoteAssetDownloadRecord passURL](self, "passURL", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("passURL"));

  -[PKPaymentRemoteAssetDownloadRecord remoteAssetsByTaskIdentifier](self, "remoteAssetsByTaskIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("remoteAssets"));

  -[PKPaymentRemoteAssetDownloadRecord remoteAssetsByRecordName](self, "remoteAssetsByRecordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("remoteCloudAssets"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)hasOutstandingRemoteAssetTasks
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PKPaymentRemoteAssetDownloadRecord remoteAssetsByTaskIdentifier](self, "remoteAssetsByTaskIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[PKPaymentRemoteAssetDownloadRecord remoteAssetsByRecordName](self, "remoteAssetsByRecordName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (void)setRemoteURLAsset:(id)a3 forTaskIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PKPaymentRemoteAssetDownloadRecord remoteAssetsByTaskIdentifier](self, "remoteAssetsByTaskIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

  -[PKPaymentRemoteAssetDownloadRecord setRemoteAssetsByTaskIdentifier:](self, "setRemoteAssetsByTaskIdentifier:", v8);
}

- (void)setRemoteCloudStoreAsset:(id)a3 forRecordName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PKPaymentRemoteAssetDownloadRecord remoteAssetsByRecordName](self, "remoteAssetsByRecordName");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

  -[PKPaymentRemoteAssetDownloadRecord setRemoteAssetsByRecordName:](self, "setRemoteAssetsByRecordName:", v8);
}

- (void)removeRemoteURLAssetForTaskIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PKPaymentRemoteAssetDownloadRecord remoteAssetsByTaskIdentifier](self, "remoteAssetsByTaskIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v5, "removeObjectForKey:", v4);

  -[PKPaymentRemoteAssetDownloadRecord setRemoteAssetsByTaskIdentifier:](self, "setRemoteAssetsByTaskIdentifier:", v5);
}

- (void)removeRemoteCloudStoreAssetForRecordName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PKPaymentRemoteAssetDownloadRecord remoteAssetsByRecordName](self, "remoteAssetsByRecordName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v5, "removeObjectForKey:", v4);

  -[PKPaymentRemoteAssetDownloadRecord setRemoteAssetsByRecordName:](self, "setRemoteAssetsByRecordName:", v5);
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (void)setPassURL:(id)a3
{
  objc_storeStrong((id *)&self->_passURL, a3);
}

- (NSDictionary)remoteAssetsByTaskIdentifier
{
  return self->_remoteAssetsByTaskIdentifier;
}

- (void)setRemoteAssetsByTaskIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAssetsByTaskIdentifier, a3);
}

- (NSDictionary)remoteAssetsByRecordName
{
  return self->_remoteAssetsByRecordName;
}

- (void)setRemoteAssetsByRecordName:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAssetsByRecordName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAssetsByRecordName, 0);
  objc_storeStrong((id *)&self->_remoteAssetsByTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
}

@end
