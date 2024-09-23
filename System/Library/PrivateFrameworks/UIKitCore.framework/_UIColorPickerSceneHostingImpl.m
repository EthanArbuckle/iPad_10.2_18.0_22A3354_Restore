@implementation _UIColorPickerSceneHostingImpl

- (void)setupRemoteHosting
{
  void *v3;
  _UISceneHostingController *v4;
  void *v5;
  _UISceneHostingController *v6;
  _UISceneHostingController *hostingController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (!self->_hostingController)
  {
    -[_UIColorPickerSceneHostingImpl delegateColorPickerViewController](self, "delegateColorPickerViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_425, 3.0);

    objc_msgSend(MEMORY[0x1E0D87D80], "identityForEmbeddedApplicationIdentifier:", CFSTR("com.apple.UIKit.ColorPickerUIService"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v4 = [_UISceneHostingController alloc];
    +[FBSSceneSpecification specification](_UISceneHostingSceneSpecification, "specification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_UISceneHostingController initWithProcessIdentity:sceneSpecification:](v4, "initWithProcessIdentity:sceneSpecification:", v12, v5);
    hostingController = self->_hostingController;
    self->_hostingController = v6;

    -[_UISceneHostingController setDelegate:](self->_hostingController, "setDelegate:", self);
    -[_UISceneHostingController sceneViewController](self->_hostingController, "sceneViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIColorPickerSceneHostingImpl delegateColorPickerViewController](self, "delegateColorPickerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setChildViewController:", v8);

    -[_UIColorPickerSceneHostingImpl delegateColorPickerViewController](self, "delegateColorPickerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIColorPickerSceneHostingImpl setRemoteConfiguration:](self, "setRemoteConfiguration:", v11);

  }
}

- (void)setRemoteSelectedColor:(id)a3
{
  id v4;
  CGColorSpace *ColorSpace;
  void *v6;
  id v7;

  v4 = objc_retainAutorelease(a3);
  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v4, "CGColor"));
  CGColorSpaceGetName(ColorSpace);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[_UIColorPickerActionHostToClient actionForSelectedColor:withColorSpace:](_UIColorPickerActionHostToClient, "actionForSelectedColor:withColorSpace:", v4, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UISceneHostingController sendAction:](self->_hostingController, "sendAction:", v6);
}

- (void)setRemoteConfiguration:(id)a3
{
  id v4;

  +[_UIColorPickerActionHostToClient actionForConfiguration:](_UIColorPickerActionHostToClient, "actionForConfiguration:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISceneHostingController sendAction:](self->_hostingController, "sendAction:", v4);

}

- (void)dismissEyedropper:(BOOL)a3
{
  id v4;

  +[_UIColorPickerActionHostToClient actionForDismissEyeDropper:](_UIColorPickerActionHostToClient, "actionForDismissEyeDropper:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISceneHostingController sendAction:](self->_hostingController, "sendAction:", v4);

}

- (void)clientIsReady
{
  void *v3;
  void *v4;
  id v5;

  -[_UIColorPickerSceneHostingImpl delegateColorPickerViewController](self, "delegateColorPickerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_selectedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIColorPickerSceneHostingImpl setRemoteSelectedColor:](self, "setRemoteSelectedColor:", v4);

  -[_UIColorPickerSceneHostingImpl delegateColorPickerViewController](self, "delegateColorPickerViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_endDelayingPresentation");

}

- (_UIRemoteSheet)_remoteSheet
{
  return 0;
}

- (void)_pickerDidDismissEyedropper
{
  void *v3;
  BSInvalidatable *foregroundAssertion;

  -[_UIColorPickerSceneHostingImpl delegateColorPickerViewController](self, "delegateColorPickerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pickerDidDismissEyedropper");

  -[BSInvalidatable invalidate](self->_foregroundAssertion, "invalidate");
  foregroundAssertion = self->_foregroundAssertion;
  self->_foregroundAssertion = 0;

}

- (void)_pickerDidFinish
{
  id v2;

  -[_UIColorPickerSceneHostingImpl delegateColorPickerViewController](self, "delegateColorPickerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pickerDidFinish");

}

- (void)_pickerDidFloatEyedropper
{
  id v2;

  -[_UIColorPickerSceneHostingImpl delegateColorPickerViewController](self, "delegateColorPickerViewController");
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
  -[_UIColorPickerSceneHostingImpl delegateColorPickerViewController](self, "delegateColorPickerViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_pickerDidSelectColor:colorSpace:isVolatile:", v9, v8, v5);

}

- (void)_pickerDidShowEyedropper
{
  void *v3;
  BSInvalidatable *v4;
  BSInvalidatable *foregroundAssertion;
  id v6;

  -[_UIColorPickerSceneHostingImpl delegateColorPickerViewController](self, "delegateColorPickerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pickerDidShowEyedropper");

  -[_UISceneHostingController activationStateComponent](self->_hostingController, "activationStateComponent");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "foregroundAssertionForReason:", CFSTR("eyedropper"));
  v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  foregroundAssertion = self->_foregroundAssertion;
  self->_foregroundAssertion = v4;

}

- (UIColorPickerViewController)delegateColorPickerViewController
{
  return (UIColorPickerViewController *)objc_loadWeakRetained((id *)&self->delegateColorPickerViewController);
}

- (void)setDelegateColorPickerViewController:(id)a3
{
  objc_storeWeak((id *)&self->delegateColorPickerViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegateColorPickerViewController);
  objc_storeStrong((id *)&self->_foregroundAssertion, 0);
  objc_storeStrong((id *)&self->_hostingController, 0);
}

@end
