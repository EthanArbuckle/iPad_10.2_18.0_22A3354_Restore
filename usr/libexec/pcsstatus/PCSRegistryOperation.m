@implementation PCSRegistryOperation

- (PCSRegistryOperation)init
{
  PCSRegistryOperation *v2;
  void *v3;
  uint64_t v4;
  NSString *operationUUID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PCSRegistryOperation;
  v2 = -[PCSRegistryOperation init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
    operationUUID = v2->_operationUUID;
    v2->_operationUUID = (NSString *)v4;

  }
  return v2;
}

- (id)selfname
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation name](self, "name"));

  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation name](self, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation operationUUID](self, "operationUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(%@,%@)"), v6, v7, v8));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation operationUUID](self, "operationUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(%@)"), v6, v7));
  }

  return v9;
}

- (id)operationStateString
{
  __CFString *v3;

  if ((-[PCSRegistryOperation isFinished](self, "isFinished") & 1) != 0)
  {
    v3 = CFSTR("finished ");
  }
  else if ((-[PCSRegistryOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    v3 = CFSTR("cancelled");
  }
  else if ((-[PCSRegistryOperation isExecuting](self, "isExecuting") & 1) != 0)
  {
    v3 = CFSTR("executing");
  }
  else if (-[PCSRegistryOperation isReady](self, "isReady"))
  {
    v3 = CFSTR("ready");
  }
  else
  {
    v3 = CFSTR("pending");
  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation operationStateString](self, "operationStateString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation error](self, "error"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation selfname](self, "selfname"));
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation error](self, "error"));
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@ error:%@>"), v5, v3, v6);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation pendingDependenciesString:](self, "pendingDependenciesString:", CFSTR(" dep:")));
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@%@>"), v5, v3, v6);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation operationStateString](self, "operationStateString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation error](self, "error"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation selfname](self, "selfname"));
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation error](self, "error"));
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ (%p): %@ error:%@>"), v5, self, v3, v6);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation pendingDependenciesString:](self, "pendingDependenciesString:", CFSTR(" dep:")));
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ (%p): %@%@>"), v5, self, v3, v6);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)pendingDependenciesString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation dependencies](self, "dependencies"));
  v6 = objc_msgSend(v5, "copy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexesOfObjectsPassingTest:", &stru_100018790));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectsAtIndexes:", v7));

  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", ")));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v4, v9));

  }
  else
  {
    v10 = &stru_100018FE8;
  }

  return v10;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 8, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)operationUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOperationUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationUUID, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
