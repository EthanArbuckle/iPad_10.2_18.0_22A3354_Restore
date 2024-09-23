@implementation VSMessagePortFeature

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  id v8;
  VSJSMessagePort *v9;
  void *v10;
  VSJSMessagePort *v11;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = *MEMORY[0x24BDBCAB8];
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "raise:format:", v5, CFSTR("Unexpectedly, feature was %@, instead of VSMessagePortFeature."), v7);

    }
    v8 = v3;
    v9 = [VSJSMessagePort alloc];
    objc_msgSend(v8, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[IKJSObject initWithAppContext:](v9, "initWithAppContext:", v10);

    -[VSJSMessagePort setDelegate:](v11, "setDelegate:", v8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (VSMessagePortFeature)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6;
  id v7;
  VSMessagePortFeature *v8;
  uint64_t v9;
  NSString *featureName;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VSMessagePortFeature;
  v8 = -[VSMessagePortFeature init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v9;

    objc_msgSend(v6, "appContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_appContext, v11);

  }
  return v8;
}

- (void)messagePort:(id)a3 didReceiveMessage:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[VSMessagePortFeature delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messagePort:didReceiveMessage:", self, v5);

}

- (NSString)featureName
{
  return self->_featureName;
}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (VSMessagePortFeatureDelegate)delegate
{
  return (VSMessagePortFeatureDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_featureName, 0);
}

@end
