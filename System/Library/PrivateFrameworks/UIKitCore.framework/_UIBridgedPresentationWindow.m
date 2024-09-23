@implementation _UIBridgedPresentationWindow

- (BOOL)isInternalWindow
{
  return 0;
}

- (void)_didCreateRootPresentationController
{
  _BOOL8 v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIBridgedPresentationWindow;
  -[UIWindow _didCreateRootPresentationController](&v5, sel__didCreateRootPresentationController);
  v3 = -[_UIBridgedPresentationWindow shouldDisableRootPresentationAppearanceCallbacks](self, "shouldDisableRootPresentationAppearanceCallbacks");
  -[UIWindow _rootPresentationController](self, "_rootPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_shouldDisableAppearanceCallbacksForPresentedViewController:", v3);

}

- (BOOL)shouldDisableRootPresentationAppearanceCallbacks
{
  return self->_shouldDisableRootPresentationAppearanceCallbacks;
}

- (void)setShouldDisableRootPresentationAppearanceCallbacks:(BOOL)a3
{
  self->_shouldDisableRootPresentationAppearanceCallbacks = a3;
}

@end
