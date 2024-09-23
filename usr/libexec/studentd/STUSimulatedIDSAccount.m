@implementation STUSimulatedIDSAccount

- (STUSimulatedIDSAccount)initWithAccount:(id)a3 forceInactiveBeacon:(id)a4
{
  id v7;
  id v8;
  STUSimulatedIDSAccount *v9;
  STUSimulatedIDSAccount *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STUSimulatedIDSAccount;
  v9 = -[STUSimulatedIDSAccount init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_forceInactiveBeacon, a4);
  }

  return v10;
}

- (NSString)loginID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulatedIDSAccount account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "loginID"));

  return (NSString *)v3;
}

- (BOOL)isActive
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulatedIDSAccount forceInactiveBeacon](self, "forceInactiveBeacon"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
  if (v6)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulatedIDSAccount forceInactiveBeacon](self, "forceInactiveBeacon"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "value"));
    if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
    {
      v7 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulatedIDSAccount account](self, "account"));
  v7 = objc_msgSend(v8, "isActive");

  if (v6)
    goto LABEL_5;
LABEL_6:

  return v7;
}

+ (id)keyPathsForValuesAffectingActive
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[0] = CFSTR("account.active");
  v5[1] = CFSTR("forceInactiveBeacon.value");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return v3;
}

- (CRKIDSAccount)account
{
  return self->_account;
}

- (STUValueBeacon)forceInactiveBeacon
{
  return self->_forceInactiveBeacon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forceInactiveBeacon, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
