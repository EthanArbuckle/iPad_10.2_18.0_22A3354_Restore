@implementation SXDataTableComponentViewFactory

- (SXDataTableComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 imageViewFactory:(id)a7 componentActionHandler:(id)a8 textComponentLayoutHosting:(id)a9 componentController:(id)a10 adIgnorableViewFactory:(id)a11 config:(id)a12
{
  id v18;
  id v19;
  id v20;
  SXDataTableComponentViewFactory *v21;
  SXDataTableComponentViewFactory *v22;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a7;
  v26 = a8;
  v18 = a9;
  v19 = a10;
  v25 = a11;
  v20 = a12;
  v28.receiver = self;
  v28.super_class = (Class)SXDataTableComponentViewFactory;
  v21 = -[SXComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:](&v28, sel_initWithDOMObjectProvider_viewport_presentationDelegateProvider_componentStyleRendererFactory_, a3, a4, a5, a6);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_imageViewFactory, a7);
    objc_storeStrong((id *)&v22->_componentActionHandler, a8);
    objc_storeWeak((id *)&v22->_textComponentLayoutHosting, v18);
    objc_storeWeak((id *)&v22->_componentController, v19);
    objc_storeStrong((id *)&v22->_adIgnorableViewFactory, a11);
    objc_storeStrong((id *)&v22->_config, a12);
  }

  return v22;
}

- (id)componentViewForComponent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SXDataTableComponentView *v13;
  void *v15;
  SXDataTableComponentView *v16;
  void *v17;

  v16 = [SXDataTableComponentView alloc];
  -[SXComponentViewFactory DOMObjectProvider](self, "DOMObjectProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory viewport](self, "viewport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory presentationDelegateProvider](self, "presentationDelegateProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory componentStyleRendererFactory](self, "componentStyleRendererFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentViewFactory imageViewFactory](self, "imageViewFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentViewFactory componentActionHandler](self, "componentActionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentViewFactory textComponentLayoutHosting](self, "textComponentLayoutHosting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentViewFactory componentController](self, "componentController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentViewFactory adIgnorableViewFactory](self, "adIgnorableViewFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentViewFactory config](self, "config");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SXDataTableComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:imageViewFactory:componentActionHandler:textComponentLayoutHosting:componentController:adIgnorableViewFactory:config:](v16, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:imageViewFactory:componentActionHandler:textComponentLayoutHosting:componentController:adIgnorableViewFactory:config:", v15, v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return v13;
}

- (id)type
{
  return CFSTR("data_table");
}

- (int)role
{
  return 0;
}

- (SXImageViewFactory)imageViewFactory
{
  return self->_imageViewFactory;
}

- (SXComponentActionHandler)componentActionHandler
{
  return self->_componentActionHandler;
}

- (SXTextComponentLayoutHosting)textComponentLayoutHosting
{
  return (SXTextComponentLayoutHosting *)objc_loadWeakRetained((id *)&self->_textComponentLayoutHosting);
}

- (SXComponentController)componentController
{
  return (SXComponentController *)objc_loadWeakRetained((id *)&self->_componentController);
}

- (SXAdIgnorableViewFactory)adIgnorableViewFactory
{
  return self->_adIgnorableViewFactory;
}

- (SXFeatures)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_adIgnorableViewFactory, 0);
  objc_destroyWeak((id *)&self->_componentController);
  objc_destroyWeak((id *)&self->_textComponentLayoutHosting);
  objc_storeStrong((id *)&self->_componentActionHandler, 0);
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
}

@end
