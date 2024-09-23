@implementation SWNavigationPreview

- (SWNavigationPreview)initWithViewController:(id)a3 navigationHandler:(id)a4 URLRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  SWNavigationPreview *v11;
  SWNavigationPreview *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SWNavigationPreview;
  v11 = -[SWNavigationPreview init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_viewController, v8);
    objc_storeStrong((id *)&v12->_navigationHandler, a4);
    objc_storeStrong((id *)&v12->_request, a5);
  }

  return v12;
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (SWNavigationHandler)navigationHandler
{
  return self->_navigationHandler;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_navigationHandler, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end
