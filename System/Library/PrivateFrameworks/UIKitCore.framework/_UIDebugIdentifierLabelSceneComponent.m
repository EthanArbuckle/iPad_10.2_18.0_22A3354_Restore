@implementation _UIDebugIdentifierLabelSceneComponent

+ (BOOL)isEnabled
{
  int has_internal_diagnostics;

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (has_internal_diagnostics)
  {
    has_internal_diagnostics = _UIGetShowSceneIdentifiers();
    if (has_internal_diagnostics)
      LOBYTE(has_internal_diagnostics) = objc_msgSend((id)UIApp, "isFrontBoard") ^ 1;
  }
  return has_internal_diagnostics;
}

- (_UIDebugIdentifierLabelSceneComponent)initWithScene:(id)a3
{
  id v4;
  _UIDebugIdentifierLabelSceneComponent *v5;
  _UIDebugIdentifierLabelSceneComponent *v6;
  _UIDebugIdentifierWindow *v7;
  _UIDebugIdentifierWindow *debugWindow;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIDebugIdentifierLabelSceneComponent;
  v5 = -[_UIDebugIdentifierLabelSceneComponent init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_UIDebugIdentifierWindow initWithWindowScene:]([_UIDebugIdentifierWindow alloc], "initWithWindowScene:", v4);
      debugWindow = v6->_debugWindow;
      v6->_debugWindow = v7;

    }
  }

  return v6;
}

- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5
{
  if (!a4)
    -[UIWindow setHidden:](self->_debugWindow, "setHidden:", 0, 0, a5);
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
  objc_storeStrong((id *)&self->_debugWindow, 0);
}

@end
