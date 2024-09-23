@implementation SWWeakURLSchemeHandler

- (SWWeakURLSchemeHandler)initWithURLSchemeHandler:(id)a3
{
  id v4;
  SWWeakURLSchemeHandler *v5;
  SWWeakURLSchemeHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SWWeakURLSchemeHandler;
  v5 = -[SWWeakURLSchemeHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_URLSchemeHandler, v4);

  return v6;
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SWWeakURLSchemeHandler URLSchemeHandler](self, "URLSchemeHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "webView:startURLSchemeTask:", v7, v6);

}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SWWeakURLSchemeHandler URLSchemeHandler](self, "URLSchemeHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "webView:stopURLSchemeTask:", v7, v6);

}

- (WKURLSchemeHandler)URLSchemeHandler
{
  return (WKURLSchemeHandler *)objc_loadWeakRetained((id *)&self->_URLSchemeHandler);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_URLSchemeHandler);
}

@end
