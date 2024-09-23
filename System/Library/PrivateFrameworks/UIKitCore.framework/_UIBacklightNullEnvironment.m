@implementation _UIBacklightNullEnvironment

- (_UIBacklightNullEnvironment)initWithScene:(id)a3
{
  id v5;
  void *v6;
  _UIBacklightNullEnvironment *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  objc_msgSend(v5, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BLSBacklightFBSSceneEnvironment+UIKit.m"), 144, CFSTR("BLSNullEnvironment should only be used for scenes with nil fbsScene:%@"), v5);

  }
  v10.receiver = self;
  v10.super_class = (Class)_UIBacklightNullEnvironment;
  v7 = -[_UIBacklightNullEnvironment init](&v10, sel_init);

  return v7;
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
  objc_destroyWeak((id *)&self->_scene);
}

@end
