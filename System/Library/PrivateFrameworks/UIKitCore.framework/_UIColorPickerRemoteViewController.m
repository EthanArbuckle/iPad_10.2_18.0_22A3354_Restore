@implementation _UIColorPickerRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0CF4E8);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE000168);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  _UIColorPickerRemoteViewControllerHost **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "_colorPickerViewServiceDidTerminateWithError:", v4);

}

- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5
{
  _BOOL8 v5;
  _UIColorPickerRemoteViewControllerHost **p_delegate;
  id v8;
  id v9;
  id WeakRetained;

  v5 = a5;
  p_delegate = &self->_delegate;
  v8 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "_pickerDidSelectColor:colorSpace:isVolatile:", v9, v8, v5);

}

- (void)_pickerDidShowEyedropper
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "_pickerDidShowEyedropper");

}

- (void)_pickerDidDismissEyedropper
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "_pickerDidDismissEyedropper");

}

- (void)_pickerDidFloatEyedropper
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "_pickerDidFloatEyedropper");

}

- (void)_pickerDidFinish
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "_pickerDidFinish");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_UIColorPickerRemoteViewControllerHost)_delegate
{
  return (_UIColorPickerRemoteViewControllerHost *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)set_delegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
