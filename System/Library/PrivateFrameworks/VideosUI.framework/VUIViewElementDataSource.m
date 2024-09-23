@implementation VUIViewElementDataSource

- (VUIViewElementDataSource)initWithDataDictionary:(id)a3 viewElement:(id)a4
{
  id v7;
  id v8;
  VUIViewElementDataSource *v9;
  VUIViewElementDataSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIViewElementDataSource;
  v9 = -[VUIViewElementDataSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataDictionary, a3);
    objc_storeWeak((id *)&v10->_viewElement, v8);
  }

  return v10;
}

- (VUIRouterDataSource)routerDataSource
{
  VUIRouterDataSource *routerDataSource;
  void *v4;
  VUIRouterDataSource *v5;
  VUIRouterDataSource *v6;

  routerDataSource = self->_routerDataSource;
  if (!routerDataSource)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_dataDictionary, "objectForKeyedSubscript:", CFSTR("routerDataSource"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[VUIRouterDataSource initWithRouterData:appContext:]([VUIRouterDataSource alloc], "initWithRouterData:appContext:", v4, 0);
    v6 = self->_routerDataSource;
    self->_routerDataSource = v5;

    routerDataSource = self->_routerDataSource;
  }
  return routerDataSource;
}

- (void)setRouterDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_routerDataSource, a3);
}

- (NSDictionary)dataDictionary
{
  return self->_dataDictionary;
}

- (void)setDataDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (IKViewElement)viewElement
{
  return (IKViewElement *)objc_loadWeakRetained((id *)&self->_viewElement);
}

- (void)setViewElement:(id)a3
{
  objc_storeWeak((id *)&self->_viewElement, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewElement);
  objc_storeStrong((id *)&self->_dataDictionary, 0);
  objc_storeStrong((id *)&self->_routerDataSource, 0);
}

@end
