@implementation KTActualSpecificUser

- (KTActualSpecificUser)initWithACAccount:(id)a3
{
  id v4;
  KTActualSpecificUser *v5;
  void *v6;
  void *v7;
  KTActualSpecificUser *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)KTActualSpecificUser;
  v5 = -[KTActualSpecificUser init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_personID"));
    -[KTActualSpecificUser setDsid:](v5, "setDsid:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_altDSID"));
    -[KTActualSpecificUser setAltDSID:](v5, "setAltDSID:", v7);

    -[KTActualSpecificUser setContextID:](v5, "setContextID:", CFSTR("default"));
    v8 = v5;
  }

  return v5;
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDsid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContextID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
