@implementation SBDisplaySceneControllerComponent

- (SBDisplaySceneControllerComponent)initWithScene:(id)a3
{
  id v4;
  SBDisplaySceneControllerComponent *v5;
  SBDisplaySceneControllerComponent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDisplaySceneControllerComponent;
  v5 = -[SBDisplaySceneControllerComponent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_scene, v4);

  return v6;
}

- (SBDisplaySceneControllerComponentDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_destroyWeak((id *)&self->_scene);
}

@end
