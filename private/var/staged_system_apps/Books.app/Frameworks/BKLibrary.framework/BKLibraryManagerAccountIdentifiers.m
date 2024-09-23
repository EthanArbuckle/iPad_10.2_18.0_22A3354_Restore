@implementation BKLibraryManagerAccountIdentifiers

- (BKLibraryManagerAccountIdentifiers)initWithPurchasedDSID:(id)a3 downloadedDSID:(id)a4 familyID:(id)a5
{
  id v8;
  id v9;
  id v10;
  BKLibraryManagerAccountIdentifiers *v11;
  NSString *v12;
  NSString *purchasedDSID;
  NSString *v14;
  NSString *downloadedDSID;
  NSString *v16;
  NSString *familyID;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BKLibraryManagerAccountIdentifiers;
  v11 = -[BKLibraryManagerAccountIdentifiers init](&v19, "init");
  if (v11)
  {
    v12 = (NSString *)objc_msgSend(v8, "copy");
    purchasedDSID = v11->_purchasedDSID;
    v11->_purchasedDSID = v12;

    v14 = (NSString *)objc_msgSend(v9, "copy");
    downloadedDSID = v11->_downloadedDSID;
    v11->_downloadedDSID = v14;

    v16 = (NSString *)objc_msgSend(v10, "copy");
    familyID = v11->_familyID;
    v11->_familyID = v16;

  }
  return v11;
}

- (BKLibraryManagerAccountIdentifiers)initWithAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BKLibraryManagerAccountIdentifiers *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "purchasedDSID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "downloadedDSID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "familyID"));

  v8 = -[BKLibraryManagerAccountIdentifiers initWithPurchasedDSID:downloadedDSID:familyID:](self, "initWithPurchasedDSID:downloadedDSID:familyID:", v5, v6, v7);
  return v8;
}

- (NSString)purchasedDSID
{
  return self->_purchasedDSID;
}

- (NSString)downloadedDSID
{
  return self->_downloadedDSID;
}

- (NSString)familyID
{
  return self->_familyID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyID, 0);
  objc_storeStrong((id *)&self->_downloadedDSID, 0);
  objc_storeStrong((id *)&self->_purchasedDSID, 0);
}

@end
