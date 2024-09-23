@implementation MTTermsVersionSyncProcessor

- (MTTermsVersionSyncProcessor)initWithStorage:(id)a3
{
  id v4;
  MTTermsVersionSyncProcessor *v5;
  MTTermsVersionSyncProcessor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTTermsVersionSyncProcessor;
  v5 = -[MTTermsVersionSyncProcessor init](&v8, "init");
  v6 = v5;
  if (v5)
    -[MTTermsVersionSyncProcessor setStorageProvider:](v5, "setStorageProvider:", v4);

  return v6;
}

- (int64_t)operationTypeForSET
{
  return 8;
}

- (BOOL)hasLocalChanges
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
  v3 = objc_msgSend(v2, "cloudSyncIsDirty");

  return v3;
}

- (BOOL)requiresNextGetTransaction
{
  return !+[MTPrivacyUtil allowReporting](MTPrivacyUtil, "allowReporting");
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cloudSyncVersion"));

  return v5;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  MZKeyValueStoreNode *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = (MZKeyValueStoreNode *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider", a3, a4));
  if (-[MZKeyValueStoreNode cloudSyncIsDirty](v7, "cloudSyncIsDirty"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceAgreedTermsVersion"));

    if (!v9)
    {
      v18 = 0;
      return v18;
    }
    v7 = objc_alloc_init(MZKeyValueStoreNode);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceAgreedTermsVersion"));
    v12 = objc_msgSend(v11, "integerValue");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accountAgreedTermsVersion"));
    v15 = objc_msgSend(v14, "integerValue");

    if ((uint64_t)v12 <= (uint64_t)v15)
      v16 = v15;
    else
      v16 = v12;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v16));
    -[MZKeyValueStoreNode setNumberValue:](v7, "setNumberValue:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](v7, "value"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
    *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cloudSyncVersion"));

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v6, "setPodcastsDomainVersion:", v5);

}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v10;
  id v11;

  v10 = a7;
  v11 = a6;
  -[MTTermsVersionSyncProcessor completeTransactionWithNewVersion:mismatch:finishedBlock:](self, "completeTransactionWithNewVersion:mismatch:finishedBlock:", v11, -[MTTermsVersionSyncProcessor mergeData:mismatch:](self, "mergeData:mismatch:", a4, 0), v10);

}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  -[MTTermsVersionSyncProcessor completeTransactionWithNewVersion:mismatch:finishedBlock:](self, "completeTransactionWithNewVersion:mismatch:finishedBlock:", a6, 0, a7);
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v10;
  id v11;

  v10 = a7;
  v11 = a6;
  -[MTTermsVersionSyncProcessor completeTransactionWithNewVersion:mismatch:finishedBlock:](self, "completeTransactionWithNewVersion:mismatch:finishedBlock:", v11, -[MTTermsVersionSyncProcessor mergeData:mismatch:](self, "mergeData:mismatch:", a4, 1), v10);

}

- (BOOL)mergeData:(id)a3 mismatch:(BOOL)a4
{
  id v6;
  MZKeyValueStoreNode *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;

  v6 = a3;
  v7 = objc_alloc_init(MZKeyValueStoreNode);
  -[MZKeyValueStoreNode setValue:](v7, "setValue:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceAgreedTermsVersion"));
  if (v9)
  {

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountAgreedTermsVersion"));

    if (!v11)
    {
      v19 = 0;
      goto LABEL_8;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deviceAgreedTermsVersion"));
  v14 = objc_msgSend(v13, "integerValue");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accountAgreedTermsVersion"));
  v17 = objc_msgSend(v16, "integerValue");

  if ((uint64_t)v14 <= (uint64_t)v17)
    v18 = v17;
  else
    v18 = v14;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v18));
LABEL_8:
  if (-[MZKeyValueStoreNode hasData](v7, "hasData"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode numberValue](v7, "numberValue"));
    v21 = objc_msgSend(v20, "integerValue");
    if ((uint64_t)v21 >= (uint64_t)objc_msgSend(v19, "integerValue"))
    {
      v22 = objc_msgSend(v20, "integerValue");
      if ((uint64_t)v22 >= (uint64_t)objc_msgSend(v19, "integerValue"))
      {
        v23 = v20;

        a4 = 0;
        v19 = v23;
      }
    }
    else
    {
      a4 = 1;
    }

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v24, "setAccountAgreedTermsVersion:", v19);

  return a4;
}

- (void)completeTransactionWithNewVersion:(id)a3 mismatch:(BOOL)a4 finishedBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void (**v11)(id, _BOOL8);

  v5 = a4;
  v11 = (void (**)(id, _BOOL8))a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v9, "setCloudSyncVersion:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTermsVersionSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v10, "setCloudSyncIsDirty:", v5);

  v11[2](v11, v5);
}

- (MTTermsVersionSyncStorageProviding)storageProvider
{
  return self->_storageProvider;
}

- (void)setStorageProvider:(id)a3
{
  objc_storeStrong((id *)&self->_storageProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageProvider, 0);
}

@end
