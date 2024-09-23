@implementation SBKRequestData

- (SBKRequestData)initWithTransaction:(id)a3
{
  id v5;
  SBKRequestData *v6;
  SBKRequestData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKRequestData;
  v6 = -[SBKRequestData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_transaction, a3);

  return v7;
}

- (id)serializableRequestBodyPropertyList
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKRequestData.m"), 28, CFSTR("Subclass must implement"));

  return 0;
}

- (SBKTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
}

+ (id)propertyListBodyWithTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTransaction:", v4);

  objc_msgSend(v5, "serializableRequestBodyPropertyList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
