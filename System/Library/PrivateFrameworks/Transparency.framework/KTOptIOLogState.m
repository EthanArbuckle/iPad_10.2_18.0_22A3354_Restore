@implementation KTOptIOLogState

- (KTOptIOLogState)initWithURI:(id)a3 smtTimestamp:(id)a4 optIn:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  KTOptIOLogState *v10;
  KTOptIOLogState *v11;
  KTOptIOLogState *v12;
  objc_super v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)KTOptIOLogState;
  v10 = -[KTOptIOLogState init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    -[KTOptIOLogState setUri:](v10, "setUri:", v8);
    -[KTOptIOLogState setSmtTimestamp:](v11, "setSmtTimestamp:", v9);
    -[KTOptIOLogState setOptIn:](v11, "setOptIn:", v5);
    v12 = v11;
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[KTOptIOLogState uri](self, "uri");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTOptIOLogState smtTimestamp](self, "smtTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<KTOptIOLogState: %@ smtTimestamp: %@ state: %d>"), v4, v5, -[KTOptIOLogState optIn](self, "optIn"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)uri
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUri:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)smtTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSmtTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)optIn
{
  return self->_optIn;
}

- (void)setOptIn:(BOOL)a3
{
  self->_optIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smtTimestamp, 0);
  objc_storeStrong((id *)&self->_uri, 0);
}

@end
