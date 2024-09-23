@implementation UIKeyboardCameraViewController

+ (BOOL)isLiveTextEnabled
{
  void *v2;
  char v3;

  +[_UIKeyboardCameraLiveTextEnabledObserver sharedInstance](_UIKeyboardCameraLiveTextEnabledObserver, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLiveTextEnabled");

  return v3;
}

+ (void)_updateIsCameraRestricted
{
  _MergedGlobals_1_23 = MGGetBoolAnswer();
}

+ (BOOL)isCameraRestricted
{
  void *v3;
  id v4;
  id v6;
  id location;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!qword_1ECD79F50)
  {
    objc_msgSend(a1, "_updateIsCameraRestricted");
    objc_initWeak(&location, a1);
    v8[0] = CFSTR("cameraRestriction");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v6, &location);
    qword_1ECD79F50 = MGRegisterForUpdates();

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return _MergedGlobals_1_23;
}

void __52__UIKeyboardCameraViewController_isCameraRestricted__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateIsCameraRestricted");
    WeakRetained = v2;
  }

}

+ (BOOL)isSupportedByDevice
{
  if (qword_1ECD79F58 != -1)
    dispatch_once(&qword_1ECD79F58, &__block_literal_global_22_8);
  return byte_1ECD79F39;
}

uint64_t __53__UIKeyboardCameraViewController_isSupportedByDevice__block_invoke()
{
  uint64_t result;

  result = MGIsQuestionValid();
  if ((_DWORD)result)
  {
    result = MGGetBoolAnswer();
    if ((_DWORD)result)
      result = MGGetBoolAnswer();
  }
  byte_1ECD79F39 = result;
  return result;
}

+ (BOOL)isEnabled
{
  int v3;

  v3 = objc_msgSend(a1, "isSupportedByDevice");
  if (v3)
  {
    v3 = objc_msgSend(a1, "isLiveTextEnabled");
    if (v3)
      LOBYTE(v3) = objc_msgSend(a1, "isCameraRestricted") ^ 1;
  }
  return v3;
}

- (UIKeyboardCameraViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardCameraViewController;
  return -[UIViewController initWithNibName:bundle:](&v3, sel_initWithNibName_bundle_, 0, 0);
}

- (id)_backgroundColorForModalFormSheet
{
  return +[UIColor clearColor](UIColor, "clearColor");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardCameraViewController;
  -[UIViewController viewDidLoad](&v5, sel_viewDidLoad);
  +[UIColor blackColor](UIColor, "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardCameraViewController;
  -[UIViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[UIKeyboardCameraViewController remoteViewController](self, "remoteViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromParentViewController");

  -[UIKeyboardCameraViewController setRemoteViewController:](self, "setRemoteViewController:", 0);
  -[UIKeyboardCameraViewController setExtension:](self, "setExtension:", 0);
}

- (void)prepareWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (+[UIKeyboardCameraViewController isSupportedByDevice](UIKeyboardCameraViewController, "isSupportedByDevice"))
  {
    objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", CFSTR("com.apple.VisionKit.KeyboardCamera"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCameraViewController setExtension:](self, "setExtension:", v5);

    objc_initWeak(&location, self);
    -[UIKeyboardCameraViewController extension](self, "extension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__UIKeyboardCameraViewController_prepareWithCompletion___block_invoke;
    v7[3] = &unk_1E16C0468;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    objc_msgSend(v6, "instantiateViewControllerWithInputItems:connectionHandler:", MEMORY[0x1E0C9AA60], v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __56__UIKeyboardCameraViewController_prepareWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[6];

  v36[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = v6;
    if (v8 && !a4)
    {
      v35 = v6;
      objc_msgSend(WeakRetained, "setRemoteViewController:", v8);
      objc_msgSend(v8, "setDelegate:", WeakRetained);
      objc_msgSend(v8, "serviceViewControllerProxy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "textContentType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v9;
      objc_msgSend(v9, "setTextContentType:", v10);

      objc_msgSend(WeakRetained, "addChildViewController:", v8);
      objc_msgSend(v8, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(WeakRetained, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", v11);

      v26 = (void *)MEMORY[0x1E0D156E0];
      objc_msgSend(v11, "topAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:", v31);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v30;
      objc_msgSend(v11, "leftAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "leftAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v27);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v25;
      objc_msgSend(v11, "rightAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "rightAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v36[2] = v14;
      objc_msgSend(v11, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36[3] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
      v22 = a1;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "activateConstraints:", v19);

      v20 = *(_QWORD *)(v22 + 32);
      if (v20)
        (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, 1);

      v6 = v35;
    }

  }
  else
  {
    v21 = *(_QWORD *)(a1 + 32);
    if (v21)
      (*(void (**)(uint64_t, _QWORD))(v21 + 16))(v21, 0);
  }

}

- (void)keyboardCameraDidUpdateString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIKeyboardCameraViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardCameraDidUpdateString:", v4);

}

- (void)keyboardCameraDidAccept
{
  id v2;

  -[UIKeyboardCameraViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardCameraDidAccept");

}

- (void)keyboardCameraDidCancel
{
  id v2;

  -[UIKeyboardCameraViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardCameraDidCancel");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIKeyboardCameraViewControllerDelegate)delegate
{
  return (UIKeyboardCameraViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)textContentType
{
  return self->_textContentType;
}

- (void)setTextContentType:(id)a3
{
  self->_textContentType = (NSString *)a3;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (UIKeyboardCameraRemoteViewController)remoteViewController
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
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
