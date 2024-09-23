@implementation PGPIPProxySceneComponent

- (PGPIPProxySceneComponent)initWithScene:(id)a3
{
  id v4;
  PGPIPProxySceneComponent *v5;
  PGPIPProxySceneComponent *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGPIPProxySceneComponent;
  v5 = -[PGPIPProxySceneComponent init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PGPIPProxySceneComponent _setScene:](v5, "_setScene:", v4);
    objc_msgSend(v4, "_sceneIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("PGPIPSceneComponentDidConnectNotification"), v6);

  }
  return v6;
}

- (void)_sceneWillInvalidate:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PGPIPSceneComponentDidDisconnectNotification"), self);

}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->__scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->__scene, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->__scene);
}

@end
