@implementation KTIDSAccountHolder

- (KTIDSAccountHolder)initWithIDSDSID:(id)a3 type:(int)a4
{
  uint64_t v4;
  id v6;
  KTIDSAccountHolder *v7;
  KTIDSAccountHolder *v8;
  KTIDSAccountHolder *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KTIDSAccountHolder;
  v7 = -[KTIDSAccountHolder init](&v11, "init");
  v8 = v7;
  if (v7)
  {
    -[KTIDSAccountHolder setIdsDSID:](v7, "setIdsDSID:", v6);
    -[KTIDSAccountHolder setAccountType:](v8, "setAccountType:", v4);
    v9 = v8;
  }

  return v8;
}

- (KTIDSAccountHolder)initWithIDSAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;
  KTIDSAccountHolder *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "profileID"));
  v6 = objc_msgSend(v4, "accountType");

  v7 = -[KTIDSAccountHolder initWithIDSDSID:type:](self, "initWithIDSDSID:type:", v5, v6);
  return v7;
}

- (NSString)idsDSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdsDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(int)a3
{
  self->_accountType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDSID, 0);
}

@end
