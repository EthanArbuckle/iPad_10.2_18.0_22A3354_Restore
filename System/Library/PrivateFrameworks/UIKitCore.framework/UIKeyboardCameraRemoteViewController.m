@implementation UIKeyboardCameraRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0CE888);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDFAC8B8);
}

- (void)keyboardCameraDidUpdateString:(id)a3
{
  UIKeyboardCameraRemoteViewControllerHost **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "keyboardCameraDidUpdateString:", v4);

}

- (void)keyboardCameraDidAccept
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "keyboardCameraDidAccept");

}

- (void)keyboardCameraDidCancel
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "keyboardCameraDidCancel");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIKeyboardCameraRemoteViewControllerHost)delegate
{
  return (UIKeyboardCameraRemoteViewControllerHost *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
