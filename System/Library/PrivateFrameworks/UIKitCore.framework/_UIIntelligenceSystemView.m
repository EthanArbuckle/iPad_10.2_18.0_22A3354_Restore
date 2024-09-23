@implementation _UIIntelligenceSystemView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_UIIntelligenceSystemView)initWithFrame:(CGRect)a3 serviceIdentity:(id)a4 sceneSpecification:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  _UIIntelligenceSystemView *v13;
  _UISceneHostingControllerAdvancedConfiguration *v14;
  _UISceneHostingController *v15;
  _UISceneHostingController *sceneHostingController;
  _UISceneHostingReconnectingActivationController *v17;
  void *v18;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_UIIntelligenceSystemView;
  v13 = -[UIView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  if (v13)
  {
    v14 = -[_UISceneHostingControllerAdvancedConfiguration initWithProcessIdentity:]([_UISceneHostingControllerAdvancedConfiguration alloc], "initWithProcessIdentity:", v11);
    -[_UISceneHostingControllerAdvancedConfiguration setSceneSpecification:](v14, "setSceneSpecification:", v12);
    v15 = -[_UISceneHostingController initWithAdvancedConfiguration:]([_UISceneHostingController alloc], "initWithAdvancedConfiguration:", v14);
    sceneHostingController = v13->_sceneHostingController;
    v13->_sceneHostingController = v15;

    v17 = objc_alloc_init(_UISceneHostingReconnectingActivationController);
    -[_UISceneHostingReconnectingActivationController setDelegate:](v17, "setDelegate:", v13);
    -[_UISceneHostingController setActivationController:](v13->_sceneHostingController, "setActivationController:", v17);
    -[_UIIntelligenceSystemView _addSceneViewIfNecessary](v13, "_addSceneViewIfNecessary");
    -[UIView layer](v13, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAllowsHitTesting:", 0);

    -[UIView setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0);
  }

  return v13;
}

- (id)transitionerForConnectingHostingController:(id)a3
{
  void (**v3)(void);
  void *v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  -[_UIIntelligenceSystemView _connectionActionProvider](self, "_connectionActionProvider", a3);
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __72___UIIntelligenceSystemView_transitionerForConnectingHostingController___block_invoke;
    aBlock[3] = &unk_1E16ED9E8;
    v8 = v4;
    v5 = _Block_copy(aBlock);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)willMoveToWindow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIIntelligenceSystemView;
  -[UIView willMoveToWindow:](&v10, sel_willMoveToWindow_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[_UISceneHostingController activationStateComponent](self->_sceneHostingController, "activationStateComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "foregroundAssertionForReason:", CFSTR("Light effect flicker avoidance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46___UIIntelligenceSystemView_willMoveToWindow___block_invoke;
  block[3] = &unk_1E16B1B28;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIIntelligenceSystemView;
  -[UIView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__didMoveToWindowScene, 0x1E1764CC0, v3);

  }
  -[_UIIntelligenceSystemView _didMoveToWindowScene](self, "_didMoveToWindowScene");

}

- (void)_didMoveToWindowScene
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UISceneWillEnterForegroundNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UISceneDidEnterBackgroundNotification"), 0);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__removeSceneViewIfNecessary, CFSTR("UISceneDidEnterBackgroundNotification"), v4);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__addSceneViewIfNecessary, CFSTR("UISceneWillEnterForegroundNotification"), v4);
    if ((unint64_t)objc_msgSend(v4, "activationState") > 1)
      -[_UIIntelligenceSystemView _removeSceneViewIfNecessary](self, "_removeSceneViewIfNecessary");
    else
      -[_UIIntelligenceSystemView _addSceneViewIfNecessary](self, "_addSceneViewIfNecessary");
  }

}

- (void)_removeSceneViewIfNecessary
{
  void *v2;
  void *v3;
  id v4;

  -[_UIIntelligenceSystemView _sceneHostingController](self, "_sceneHostingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v4, "removeFromSuperview");

}

- (void)_addSceneViewIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  -[_UIIntelligenceSystemView _sceneHostingController](self, "_sceneHostingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self, "addSubview:", v4);
    v24 = (void *)MEMORY[0x1E0D156E0];
    objc_msgSend(v4, "widthAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](self, "widthAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v27;
    objc_msgSend(v4, "heightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](self, "heightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v6;
    objc_msgSend(v4, "centerXAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v9;
    objc_msgSend(v4, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v13);

    -[UIView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cornerRadius");
    v16 = v15;
    objc_msgSend(v4, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCornerRadius:", v16);

    -[UIView layer](self, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cornerCurve");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCornerCurve:", v19);

    -[UIView layer](self, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "maskedCorners");
    objc_msgSend(v4, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMaskedCorners:", v22);

  }
}

- (id)_sceneLayer
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 416), "sceneView");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "layer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)_layerCornerRadiusDidChange:(double)a3
{
  id v4;

  -[_UIIntelligenceSystemView _sceneLayer]((uint64_t)self);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (void)_layerCornerCurveDidChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIIntelligenceSystemView _sceneLayer]((uint64_t)self);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerCurve:", v4);

}

- (void)_layerMaskedCornersDidChange:(unint64_t)a3
{
  id v4;

  -[_UIIntelligenceSystemView _sceneLayer]((uint64_t)self);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskedCorners:", a3);

}

- (_UISceneHostingController)_sceneHostingController
{
  return self->_sceneHostingController;
}

- (id)_connectionActionProvider
{
  return self->__connectionActionProvider;
}

- (void)set_connectionActionProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__connectionActionProvider, 0);
  objc_storeStrong((id *)&self->_sceneHostingController, 0);
}

@end
