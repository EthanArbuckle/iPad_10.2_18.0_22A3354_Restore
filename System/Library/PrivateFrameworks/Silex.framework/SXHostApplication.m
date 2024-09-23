@implementation SXHostApplication

- (SXHostApplication)initWithApplication:(id)a3
{
  id v4;
  SXHostApplication *v5;
  SXHostApplication *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SXHostApplication;
  v5 = -[SXHostApplication init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_application, v4);

  return v6;
}

- (BOOL)active
{
  void *v2;
  BOOL v3;

  -[SXHostApplication application](self, "application");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "applicationState") == 0;

  return v3;
}

- (void)openURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SXHostApplication application](self, "application");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "openURL:options:completionHandler:", v7, MEMORY[0x24BDBD1B8], v6);

}

- (BOOL)canOpenURL:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SXHostApplication application](self, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canOpenURL:", v4);

  return v6;
}

- (UIApplication)application
{
  return (UIApplication *)objc_loadWeakRetained((id *)&self->_application);
}

- (void)setApplication:(id)a3
{
  objc_storeWeak((id *)&self->_application, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_application);
}

@end
