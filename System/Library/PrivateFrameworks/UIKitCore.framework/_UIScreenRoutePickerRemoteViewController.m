@implementation _UIScreenRoutePickerRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0CE7C8);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF61A40);
}

- (void)invalidate
{
  -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:", self->_extensionRequestIdentifier);
  -[_UIScreenRoutePickerRemoteViewController setExtension:](self, "setExtension:", 0);
  -[_UIScreenRoutePickerRemoteViewController setExtensionRequestIdentifier:](self, "setExtensionRequestIdentifier:", 0);
  -[_UIScreenRoutePickerRemoteViewController setPublicController:](self, "setPublicController:", 0);
}

- (void)_dismissViewController
{
  void *v3;
  void *v4;
  void *v5;

  -[_UIScreenRoutePickerRemoteViewController publicController](self, "publicController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_invalidate");

  -[_UIScreenRoutePickerRemoteViewController setPublicController:](self, "setPublicController:", 0);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIScreenRoutePickerRemoteViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v4, sel_viewServiceDidTerminateWithError_, a3);
  -[_UIScreenRoutePickerRemoteViewController _dismissViewController](self, "_dismissViewController");
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  -[_UIScreenRoutePickerRemoteViewController publicController](self, "publicController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "modalPresentationStyle");

  if (v7 != 7)
    width = 0.0;
  -[_UIScreenRoutePickerRemoteViewController publicController](self, "publicController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredContentSize:", width, height);

  v9.receiver = self;
  v9.super_class = (Class)_UIScreenRoutePickerRemoteViewController;
  -[UIViewController setPreferredContentSize:](&v9, sel_setPreferredContentSize_, width, height);
}

- (_UIScreenRoutePickerViewController)publicController
{
  return (_UIScreenRoutePickerViewController *)objc_loadWeakRetained((id *)&self->_publicController);
}

- (void)setPublicController:(id)a3
{
  objc_storeWeak((id *)&self->_publicController, a3);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (NSCopying)extensionRequestIdentifier
{
  return self->_extensionRequestIdentifier;
}

- (void)setExtensionRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1488);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_publicController);
}

@end
