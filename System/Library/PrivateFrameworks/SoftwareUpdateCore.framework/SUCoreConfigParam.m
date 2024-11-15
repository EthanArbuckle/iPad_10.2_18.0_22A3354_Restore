@implementation SUCoreConfigParam

- (SUCoreConfigParam)initWithError:(id)a3 operation:(unint64_t)a4
{
  id v7;
  SUCoreConfigParam *v8;
  SUCoreConfigParam *v9;
  MAAsset *locatedAsset;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUCoreConfigParam;
  v8 = -[SUCoreConfigParam init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    locatedAsset = v8->_locatedAsset;
    v8->_locatedAsset = 0;

    objc_storeStrong((id *)&v9->_error, a3);
    v9->_operation = a4;
  }

  return v9;
}

- (SUCoreConfigParam)initWithLocatedAsset:(id)a3
{
  id v5;
  SUCoreConfigParam *v6;
  SUCoreConfigParam *v7;
  NSError *error;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUCoreConfigParam;
  v6 = -[SUCoreConfigParam init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locatedAsset, a3);
    error = v7->_error;
    v7->_error = 0;

    v7->_operation = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[SUCoreConfigParam locatedAsset](self, "locatedAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConfigParam error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConfigParam error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCoreConfigParam(locatedAsset:%@, error:%@ %ld, operation:%ld)"), v4, v6, objc_msgSend(v7, "code"), -[SUCoreConfigParam operation](self, "operation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSError)error
{
  return self->_error;
}

- (MAAsset)locatedAsset
{
  return self->_locatedAsset;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locatedAsset, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
