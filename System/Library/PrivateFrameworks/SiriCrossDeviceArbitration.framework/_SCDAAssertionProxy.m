@implementation _SCDAAssertionProxy

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)_SCDAAssertionProxy;
  -[_SCDAAssertionProxy description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _SCDAAssertionCreateDescriptionOfProperties(self->_impl);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {%@}"), v4, v5);

  return (NSString *)v6;
}

- (_SCDAAssertionProxy)initWithImpl:(id)a3 coordinator:(id)a4
{
  id v7;
  id v8;
  _SCDAAssertionProxy *v9;
  _SCDAAssertionProxy *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SCDAAssertionProxy;
  v9 = -[_SCDAAssertionProxy init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_impl, a3);
    objc_storeWeak((id *)&v10->_coordinator, v8);
  }

  return v10;
}

- (void)relinquishWithContext:(id)a3 options:(unint64_t)a4
{
  SCDAAssertionCoordinator **p_coordinator;
  id v7;
  void *v8;
  id WeakRetained;

  p_coordinator = &self->_coordinator;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_coordinator);
  -[_SCDAAssertionImpl uuid](self->_impl, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "relinquishAssertionWithUUID:context:options:", v8, v7, a4);

}

- (void)relinquishWithError:(id)a3 options:(unint64_t)a4
{
  SCDAAssertionCoordinator **p_coordinator;
  id v7;
  void *v8;
  id WeakRetained;

  p_coordinator = &self->_coordinator;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_coordinator);
  -[_SCDAAssertionImpl uuid](self->_impl, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "relinquishAssertionWithUUID:error:options:", v8, v7, a4);

}

- (NSUUID)uuid
{
  return -[_SCDAAssertionImpl uuid](self->_impl, "uuid");
}

- (SCDAAssertionContext)context
{
  return -[_SCDAAssertionImpl context](self->_impl, "context");
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  void *v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  -[_SCDAAssertionImpl uuid](self->_impl, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("kSCDAErrorDomain"), 41, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "relinquishAssertionWithUUID:error:options:", v4, v5, 0);

  v6.receiver = self;
  v6.super_class = (Class)_SCDAAssertionProxy;
  -[_SCDAAssertionProxy dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
