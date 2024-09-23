@implementation UIKeyboardScenePresentationModeManager

- (unint64_t)presentationMode
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[UIKeyboardScenePresentationModeManager determinePresentationMode](self, "determinePresentationMode");
  v4 = v3;
  if (self->_currentPresentationMode != v3)
  {
    self->_currentPresentationMode = v3;
    -[UIKeyboardScenePresentationModeManager didChangeToPresentationMode:](self, "didChangeToPresentationMode:");
    return self->_currentPresentationMode;
  }
  return v4;
}

- (unint64_t)determinePresentationMode
{
  void *v3;
  uint64_t v4;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
    return -[UIKeyboardScenePresentationModeManager determineiPadPresentationMode](self, "determineiPadPresentationMode");
  if (v4)
    return 0;
  return -[UIKeyboardScenePresentationModeManager determineiPhonePresentationMode](self, "determineiPhonePresentationMode");
}

- (unint64_t)determineiPhonePresentationMode
{
  return 1;
}

- (unint64_t)determineiPadPresentationMode
{
  if (self->_enhancedWindowingModeEnabled)
    return 1;
  else
    return 2;
}

- (void)enhancedWindowingModeEnabledDidChange:(BOOL)a3
{
  if (self->_enhancedWindowingModeEnabled != a3)
  {
    self->_enhancedWindowingModeEnabled = a3;
    -[UIKeyboardScenePresentationModeManager presentationMode](self, "presentationMode");
  }
}

- (void)_enhancedWindowingModeEnabledDidChange:(id)a3
{
  -[UIKeyboardScenePresentationModeManager enhancedWindowingModeEnabledDidChange:](self, "enhancedWindowingModeEnabledDidChange:", objc_msgSend(a3, "BOOLValue"));
}

- (void)didChangeToPresentationMode:(unint64_t)a3
{
  void *v5;
  id v6;

  -[UIKeyboardScenePresentationModeManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKeyboardScenePresentationModeManager delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scenePresentationModeManager:didChangeToMode:", self, a3);

  }
}

- (BOOL)enhancedWindowingModeEnabled
{
  return self->_enhancedWindowingModeEnabled;
}

- (void)setEnhancedWindowingModeEnabled:(BOOL)a3
{
  self->_enhancedWindowingModeEnabled = a3;
}

- (UIKeyboardScenePresentationModeManagerDelegate)delegate
{
  return (UIKeyboardScenePresentationModeManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)currentPresentationMode
{
  return self->_currentPresentationMode;
}

- (void)setCurrentPresentationMode:(unint64_t)a3
{
  self->_currentPresentationMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
