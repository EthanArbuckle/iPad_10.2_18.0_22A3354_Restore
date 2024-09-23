@implementation KTContactsStore

- (KTContactsStore)initWithContactStore:(id)a3
{
  id v4;
  KTContactsStore *v5;
  KTContactsStore *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)KTContactsStore;
  v5 = -[KTContactsStore init](&v8, "init");
  v6 = v5;
  if (v5)
    -[KTContactsStore setContactStore:](v5, "setContactStore:", v4);

  return v6;
}

- (void)fetchAndStoreContactsSyncTokenWithConfigStore:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTContactsStore contactStore](self, "contactStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentHistoryToken"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTContactsStore contactStore](self, "contactStore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentHistoryToken"));
    objc_msgSend(v8, "setSettingsData:data:", CFSTR("lastContactSyncData"), v7);

  }
}

- (CNContactStore)contactStore
{
  return (CNContactStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContactStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
