@implementation AEAccountIdentifiers

+ (id)accountIdentifiersFromPurchasedDSID:(id)a3 downloadedDSID:(id)a4 familyID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithPurchasedDSID:downloadedDSID:familyID:", v10, v9, v8);

  return v11;
}

- (AEAccountIdentifiers)initWithPurchasedDSID:(id)a3 downloadedDSID:(id)a4 familyID:(id)a5
{
  id v8;
  id v9;
  id v10;
  AEAccountIdentifiers *v11;
  AEAccountIdentifiers *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AEAccountIdentifiers;
  v11 = -[AEAccountIdentifiers init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_purchasedDSID, v8);
    objc_storeWeak((id *)&v12->_downloadedDSID, v9);
    objc_storeWeak((id *)&v12->_familyID, v10);
  }

  return v12;
}

- (NSString)purchasedDSID
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_purchasedDSID);
}

- (NSString)downloadedDSID
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_downloadedDSID);
}

- (NSString)familyID
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_familyID);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_familyID);
  objc_destroyWeak((id *)&self->_downloadedDSID);
  objc_destroyWeak((id *)&self->_purchasedDSID);
}

@end
