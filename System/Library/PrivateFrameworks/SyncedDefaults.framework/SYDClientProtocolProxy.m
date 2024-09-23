@implementation SYDClientProtocolProxy

- (SYDClientProtocolProxy)initWithTarget:(id)a3
{
  id v4;
  SYDClientProtocolProxy *v5;
  SYDClientProtocolProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SYDClientProtocolProxy;
  v5 = -[SYDClientProtocolProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_target, v4);

  return v6;
}

- (void)storeDidChangeWithStoreID:(id)a3 changeDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a3;
  v7 = a4;
  -[SYDClientProtocolProxy target](self, "target");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SYDClientProtocolProxy target](self, "target");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject storeDidChangeWithStoreID:changeDictionary:](v9, "storeDidChangeWithStoreID:changeDictionary:", v6, v7);
  }
  else
  {
    SYDGetConnectionLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20DA7A000, v9, OS_LOG_TYPE_INFO, "Received storeDidChange for invalidated connection", v10, 2u);
    }
  }

}

- (SYDClientProtocol)target
{
  return (SYDClientProtocol *)objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

@end
