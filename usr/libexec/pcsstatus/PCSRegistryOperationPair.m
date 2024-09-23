@implementation PCSRegistryOperationPair

- (id)init:(id)a3 finish:(id)a4
{
  id v7;
  id v8;
  PCSRegistryOperationPair *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PCSRegistryOperationPair;
  v9 = -[PCSRegistryOperationPair init](&v12, "init");
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actualOperation, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperationPair actualOperation](self, "actualOperation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperationPair finishOperation](self, "finishOperation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<PCSRegistryOperationPair: %@, %@>"), v3, v4));

  return v5;
}

- (PCSRegistryOperation)actualOperation
{
  return (PCSRegistryOperation *)objc_getProperty(self, a2, 8, 1);
}

- (void)setActualOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (PCSRegistryOperation)finishOperation
{
  return (PCSRegistryOperation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFinishOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishOperation, 0);
  objc_storeStrong((id *)&self->_actualOperation, 0);
}

@end
