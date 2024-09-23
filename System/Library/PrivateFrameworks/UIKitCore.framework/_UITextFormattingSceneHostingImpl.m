@implementation _UITextFormattingSceneHostingImpl

- (void)setupRemoteHosting
{
  void *v3;

  if (!self->_hostingController)
  {
    -[_UITextFormattingSceneHostingImpl delegateTextFormattingViewController](self, "delegateTextFormattingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_528, 3.0);

    -[_UITextFormattingSceneHostingImpl setupSceneHosting](self, "setupSceneHosting");
  }
}

- (void)setRemoteConfiguration:(id)a3
{
  _UISceneHostingController *hostingController;
  id v4;

  hostingController = self->_hostingController;
  +[_UITextFormattingActionHostToClient actionForConfiguration:](_UITextFormattingActionHostToClient, "actionForConfiguration:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISceneHostingController sendAction:](hostingController, "sendAction:", v4);

}

- (void)setRemoteFormattingDescriptor:(id)a3
{
  _UISceneHostingController *hostingController;
  id v4;

  hostingController = self->_hostingController;
  +[_UITextFormattingActionHostToClient actionForFormattingDescriptor:](_UITextFormattingActionHostToClient, "actionForFormattingDescriptor:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISceneHostingController sendAction:](hostingController, "sendAction:", v4);

}

- (void)setupSceneHosting
{
  _UISceneHostingController *v3;
  void *v4;
  _UISceneHostingController *v5;
  _UISceneHostingController *hostingController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (!self->_hostingController)
  {
    objc_msgSend(MEMORY[0x1E0D87D80], "identityForEmbeddedApplicationIdentifier:", CFSTR("com.apple.UIKit.FontPickerUIService"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v3 = [_UISceneHostingController alloc];
    +[FBSSceneSpecification specification](_UITextFormattingSceneSpecification, "specification");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[_UISceneHostingController initWithProcessIdentity:sceneSpecification:](v3, "initWithProcessIdentity:sceneSpecification:", v11, v4);
    hostingController = self->_hostingController;
    self->_hostingController = v5;

    -[_UISceneHostingController setDelegate:](self->_hostingController, "setDelegate:", self);
    -[_UISceneHostingController sceneViewController](self->_hostingController, "sceneViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextFormattingSceneHostingImpl delegateTextFormattingViewController](self, "delegateTextFormattingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setChildViewController:", v7);

    -[_UITextFormattingSceneHostingImpl delegateTextFormattingViewController](self, "delegateTextFormattingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextFormattingSceneHostingImpl setRemoteConfiguration:](self, "setRemoteConfiguration:", v10);

  }
}

- (void)clientIsReady
{
  id v2;

  -[_UITextFormattingSceneHostingImpl delegateTextFormattingViewController](self, "delegateTextFormattingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_endDelayingPresentation");

}

- (_UIRemoteSheet)_remoteSheet
{
  return (_UIRemoteSheet *)self->_hostingController;
}

- (void)_textFormattingDidChangeValue:(id)a3 textAttributesData:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_UITextFormattingSceneHostingImpl delegateTextFormattingViewController](self, "delegateTextFormattingViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_textFormattingDidChangeValue:textAttributesData:", v7, v6);

}

- (void)_textFormattingDidFinish
{
  id v2;

  -[_UITextFormattingSceneHostingImpl delegateTextFormattingViewController](self, "delegateTextFormattingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_textFormattingDidFinish");

}

- (void)_presentColorPicker:(CGRect)a3 selectedColor:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[_UITextFormattingSceneHostingImpl delegateTextFormattingViewController](self, "delegateTextFormattingViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_presentColorPicker:selectedColor:", v9, x, y, width, height);

}

- (void)_presentFontPickerWithConfiguration:(id)a3 selectedFonts:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_UITextFormattingSceneHostingImpl delegateTextFormattingViewController](self, "delegateTextFormattingViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_presentFontPickerWithConfiguration:selectedFonts:", v7, v6);

}

- (void)_presentTypographySettingsForFont:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UITextFormattingSceneHostingImpl delegateTextFormattingViewController](self, "delegateTextFormattingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_presentTypographySettingsForFont:", v4);

}

- (UITextFormattingViewController)delegateTextFormattingViewController
{
  return (UITextFormattingViewController *)objc_loadWeakRetained((id *)&self->delegateTextFormattingViewController);
}

- (void)setDelegateTextFormattingViewController:(id)a3
{
  objc_storeWeak((id *)&self->delegateTextFormattingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegateTextFormattingViewController);
  objc_storeStrong((id *)&self->_hostingController, 0);
}

@end
