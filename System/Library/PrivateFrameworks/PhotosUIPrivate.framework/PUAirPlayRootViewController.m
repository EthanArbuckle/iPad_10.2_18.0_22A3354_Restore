@implementation PUAirPlayRootViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUAirPlayRootViewController;
  -[PUAirPlayRootViewController viewDidLoad](&v6, sel_viewDidLoad);
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "airPlayControllerBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUAirPlayRootViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUAirPlayRootViewController;
  -[PUAirPlayRootViewController updateViewConstraints](&v12, sel_updateViewConstraints);
  -[PUAirPlayRootViewController childViewController](self, "childViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "superview");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[PUAirPlayRootViewController _childViewConstraints](self, "_childViewConstraints");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        _NSDictionaryOfVariableBindings(CFSTR("childView"), v4, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[childView]|"), 0, 0, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v10);

        objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[childView]|"), 0, 0, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v11);

        objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v9);
        -[PUAirPlayRootViewController _setChildViewConstraints:](self, "_setChildViewConstraints:", v9);

      }
    }
  }

}

- (void)setChildViewController:(id)a3
{
  -[PUAirPlayRootViewController setChildViewController:animated:](self, "setChildViewController:animated:", a3, 0);
}

- (void)setChildViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIViewController *v7;
  UIViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD aBlock[4];
  id v24;
  UIViewController *v25;
  UIViewController *v26;
  PUAirPlayRootViewController *v27;

  v4 = a4;
  v7 = (UIViewController *)a3;
  v8 = self->_childViewController;
  if (v8 != v7)
  {
    objc_storeStrong((id *)&self->_childViewController, a3);
    -[UIViewController view](v7, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](v8, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAirPlayRootViewController _setChildViewConstraints:](self, "_setChildViewConstraints:", 0);
    -[UIViewController willMoveToParentViewController:](v8, "willMoveToParentViewController:", 0);
    if (v7)
    {
      -[PUAirPlayRootViewController addChildViewController:](self, "addChildViewController:", v7);
      -[PUAirPlayRootViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v9);

      -[PUAirPlayRootViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNeedsUpdateConstraints");

      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    }
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__PUAirPlayRootViewController_setChildViewController_animated___block_invoke;
    aBlock[3] = &unk_1E58A9AE0;
    v14 = v10;
    v24 = v14;
    v25 = v8;
    v26 = v7;
    v27 = self;
    v15 = _Block_copy(aBlock);
    v16 = v15;
    if (v4)
    {
      objc_msgSend(v9, "setAlpha:", 0.0);
      v17 = (void *)MEMORY[0x1E0DC3F10];
      v20[0] = v13;
      v20[1] = 3221225472;
      v20[2] = __63__PUAirPlayRootViewController_setChildViewController_animated___block_invoke_2;
      v20[3] = &unk_1E58ABCA8;
      v21 = v9;
      v22 = v14;
      v18[0] = v13;
      v18[1] = 3221225472;
      v18[2] = __63__PUAirPlayRootViewController_setChildViewController_animated___block_invoke_3;
      v18[3] = &unk_1E58AA518;
      v19 = v16;
      objc_msgSend(v17, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v20, v18);

    }
    else
    {
      (*((void (**)(void *))v15 + 2))(v15);
    }

  }
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (NSArray)_childViewConstraints
{
  return self->__childViewConstraints;
}

- (void)_setChildViewConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__childViewConstraints, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
}

uint64_t __63__PUAirPlayRootViewController_setChildViewController_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "removeFromParentViewController");
  return objc_msgSend(*(id *)(a1 + 48), "didMoveToParentViewController:", *(_QWORD *)(a1 + 56));
}

void *__63__PUAirPlayRootViewController_setChildViewController_animated___block_invoke_2(uint64_t a1)
{
  void *result;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  result = *(void **)(a1 + 40);
  if (result)
  {
    if (!*(_QWORD *)(a1 + 32))
      return (void *)objc_msgSend(result, "setAlpha:", 0.0);
  }
  return result;
}

uint64_t __63__PUAirPlayRootViewController_setChildViewController_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
