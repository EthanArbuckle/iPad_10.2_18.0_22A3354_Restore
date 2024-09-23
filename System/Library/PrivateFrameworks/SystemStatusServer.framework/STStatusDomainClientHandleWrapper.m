@implementation STStatusDomainClientHandleWrapper

- (STStatusDomainClientHandleWrapper)initWithWrappedClientHandle:(id)a3 preferredLocalizations:(id)a4
{
  id v6;
  id v7;
  STStatusDomainClientHandleWrapper *v8;
  STStatusDomainClientHandleWrapper *v9;
  uint64_t v10;
  NSArray *preferredLocalizations;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)STStatusDomainClientHandleWrapper;
  v8 = -[STStatusDomainClientHandleWrapper init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_wrappedClientHandle, v6);
    v10 = objc_msgSend(v7, "copy");
    preferredLocalizations = v9->_preferredLocalizations;
    v9->_preferredLocalizations = (NSArray *)v10;

  }
  return v9;
}

- (void)observeData:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[STStatusDomainClientHandleWrapper wrappedClientHandle](self, "wrappedClientHandle");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "observeData:forDomain:withChangeContext:", v9, a4, v8);

}

- (STStatusDomainClientHandle)wrappedClientHandle
{
  return (STStatusDomainClientHandle *)objc_loadWeakRetained((id *)&self->_wrappedClientHandle);
}

- (NSArray)preferredLocalizations
{
  return self->_preferredLocalizations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredLocalizations, 0);
  objc_destroyWeak((id *)&self->_wrappedClientHandle);
}

@end
