@implementation _UIColorPickerRVCHostingImpl

- (void)setupRemoteHosting
{
  -[_UIColorPickerRVCHostingImpl _tryLaunchingExtension:](self, "_tryLaunchingExtension:", 3);
}

- (void)setRemoteSelectedColor:(id)a3
{
  id v4;
  CGColorSpace *ColorSpace;
  void *v6;
  void *v7;
  id v8;

  v4 = objc_retainAutorelease(a3);
  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v4, "CGColor"));
  CGColorSpaceGetName(ColorSpace);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIColorPickerRVCHostingImpl remoteViewController](self, "remoteViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceViewControllerProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setSelectedColor:colorSpace:", v4, v8);

}

- (void)setRemoteConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UIColorPickerRVCHostingImpl remoteViewController](self, "remoteViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceViewControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setConfiguration:", v4);

}

- (void)dismissEyedropper:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[_UIColorPickerRVCHostingImpl remoteViewController](self, "remoteViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceViewControllerProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissEyedropper:", v3);

}

- (void)_tryLaunchingExtension:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9[2];
  id location;

  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", CFSTR("com.apple.UIKit.ColorPicker"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIColorPickerRVCHostingImpl setExtension:](self, "setExtension:", v5);

  -[_UIColorPickerRVCHostingImpl delegateColorPickerViewController](self, "delegateColorPickerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_beginDelayingPresentation:cancellationHandler:", 0, 3.0);

  objc_initWeak(&location, self);
  -[_UIColorPickerRVCHostingImpl extension](self, "extension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55___UIColorPickerRVCHostingImpl__tryLaunchingExtension___block_invoke;
  v8[3] = &unk_1E16DF1C0;
  objc_copyWeak(v9, &location);
  v8[4] = self;
  v9[1] = (id)a3;
  objc_msgSend(v7, "instantiateViewControllerWithInputItems:connectionHandler:", MEMORY[0x1E0C9AA60], v8);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_extensionRequestIdentifier)
    -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:");
  v3.receiver = self;
  v3.super_class = (Class)_UIColorPickerRVCHostingImpl;
  -[_UIColorPickerRVCHostingImpl dealloc](&v3, sel_dealloc);
}

- (void)_colorPickerViewServiceDidTerminateWithError:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _colorPickerViewServiceDidTerminateWithError____s_category;
  if (!_colorPickerViewServiceDidTerminateWithError____s_category)
  {
    v5 = __UILogCategoryGetNode("UIColorPicker", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&_colorPickerViewServiceDidTerminateWithError____s_category);
  }
  v6 = *(NSObject **)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    objc_msgSend(v4, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Extension terminated with error: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  -[_UIColorPickerRVCHostingImpl _tryLaunchingExtension:](self, "_tryLaunchingExtension:", 3);

}

- (void)_pickerDidDismissEyedropper
{
  id v2;

  -[_UIColorPickerRVCHostingImpl delegateColorPickerViewController](self, "delegateColorPickerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pickerDidDismissEyedropper");

}

- (void)_pickerDidFinish
{
  id v2;

  -[_UIColorPickerRVCHostingImpl delegateColorPickerViewController](self, "delegateColorPickerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pickerDidFinish");

}

- (void)_pickerDidFloatEyedropper
{
  id v2;

  -[_UIColorPickerRVCHostingImpl delegateColorPickerViewController](self, "delegateColorPickerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pickerDidFloatEyedropper");

}

- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[_UIColorPickerRVCHostingImpl delegateColorPickerViewController](self, "delegateColorPickerViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_pickerDidSelectColor:colorSpace:isVolatile:", v9, v8, v5);

}

- (void)_pickerDidShowEyedropper
{
  id v2;

  -[_UIColorPickerRVCHostingImpl delegateColorPickerViewController](self, "delegateColorPickerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pickerDidShowEyedropper");

}

- (UIColorPickerViewController)delegateColorPickerViewController
{
  return (UIColorPickerViewController *)objc_loadWeakRetained((id *)&self->delegateColorPickerViewController);
}

- (void)setDelegateColorPickerViewController:(id)a3
{
  objc_storeWeak((id *)&self->delegateColorPickerViewController, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (_UIColorPickerRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->delegateColorPickerViewController);
}

@end
