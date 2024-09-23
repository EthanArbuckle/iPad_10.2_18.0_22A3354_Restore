@implementation STSTransactionStartEvent

- (STSCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_storeStrong((id *)&self->_credential, a3);
}

- (unsigned)transactionMode
{
  return self->_transactionMode;
}

- (void)setTransactionMode:(unsigned __int16)a3
{
  self->_transactionMode = a3;
}

- (NSString)spIdentifier
{
  return self->_spIdentifier;
}

- (void)setSpIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_spIdentifier, a3);
}

- (BOOL)background
{
  return self->_background;
}

- (void)setBackground:(BOOL)a3
{
  self->_background = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spIdentifier, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

- (STSTransactionStartEvent)initWithCredential:(id)a3 andNearFieldStartEvent:(id)a4
{
  id v6;
  id v7;
  STSTransactionStartEvent *v8;
  STSTransactionStartEvent *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)STSTransactionStartEvent;
  v8 = -[STSTransactionStartEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[STSTransactionStartEvent setCredential:](v8, "setCredential:", v6);
    -[STSTransactionStartEvent setBackground:](v9, "setBackground:", objc_msgSend(v7, "background"));
  }

  return v9;
}

- (STSTransactionStartEvent)initWithCredential:(id)a3 andDigitalCarKeyStartEvent:(id)a4
{
  id v6;
  id v7;
  STSTransactionStartEvent *v8;
  STSTransactionStartEvent *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STSTransactionStartEvent;
  v8 = -[STSTransactionStartEvent init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[STSTransactionStartEvent setCredential:](v8, "setCredential:", v6);
    -[STSTransactionStartEvent setBackground:](v9, "setBackground:", 0);
    -[STSTransactionStartEvent setTransactionMode:](v9, "setTransactionMode:", 0);
    objc_msgSend(v7, "spIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSTransactionStartEvent setSpIdentifier:](v9, "setSpIdentifier:", v10);

  }
  return v9;
}

@end
