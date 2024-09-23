@implementation UIScreenshotService

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (UIScreenshotService)initWithScene:(id)a3
{
  id v4;
  UIScreenshotService *v5;
  UIScreenshotService *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIScreenshotService;
  v5 = -[UIScreenshotService init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_scene, v4);

  return v6;
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (UIWindowScene)windowScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIScreenshotServiceDelegate)privateDelegate
{
  return (UIScreenshotServiceDelegate *)objc_loadWeakRetained((id *)&self->_privateDelegate);
}

- (void)setPrivateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_privateDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_privateDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scene);
}

@end
