@implementation SXHostExtension

- (SXHostExtension)initWithExtensionContext:(id)a3
{
  id v4;
  SXHostExtension *v5;
  SXHostExtension *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXHostExtension;
  v5 = -[SXHostExtension init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_extensionContext, v4);
    v6->_isActive = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_extensionHostDidBecomeActive_, *MEMORY[0x24BDD0C10], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v6, sel_extensionHostDidEnterBackground_, *MEMORY[0x24BDD0C18], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_extensionHostWillEnterForeground_, *MEMORY[0x24BDD0C20], 0);

  }
  return v6;
}

- (BOOL)active
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[SXHostExtension extensionContext](self, "extensionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return -[SXHostExtension isActive](self, "isActive");
  -[SXHostExtension extensionContext](self, "extensionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "widgetIsForeground");

  return v6;
}

- (void)openURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SXHostExtension extensionContext](self, "extensionContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "openURL:completionHandler:", v7, v6);

}

- (BOOL)canOpenURL:(id)a3
{
  return 1;
}

- (void)extensionHostDidBecomeActive:(id)a3
{
  -[SXHostExtension setIsActive:](self, "setIsActive:", 1);
}

- (void)extensionHostDidEnterBackground:(id)a3
{
  -[SXHostExtension setIsActive:](self, "setIsActive:", 0);
}

- (void)extensionHostWillEnterForeground:(id)a3
{
  -[SXHostExtension setIsActive:](self, "setIsActive:", 1);
}

- (NSExtensionContext)extensionContext
{
  return (NSExtensionContext *)objc_loadWeakRetained((id *)&self->_extensionContext);
}

- (void)setExtensionContext:(id)a3
{
  objc_storeWeak((id *)&self->_extensionContext, a3);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionContext);
}

@end
