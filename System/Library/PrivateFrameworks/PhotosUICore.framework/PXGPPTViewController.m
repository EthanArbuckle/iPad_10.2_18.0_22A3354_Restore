@implementation PXGPPTViewController

- (PXGPPTViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGPPTViewController.m"), 23, CFSTR("%s is not available as initializer"), "-[PXGPPTViewController initWithNibName:bundle:]");

  abort();
}

- (PXGPPTViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGPPTViewController.m"), 27, CFSTR("%s is not available as initializer"), "-[PXGPPTViewController initWithCoder:]");

  abort();
}

- (PXGPPTViewController)initWithLayout:(id)a3
{
  id v5;
  PXGPPTViewController *v6;
  PXGPPTViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGPPTViewController;
  v6 = -[PXGPPTViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_initialLayout, a3);
    -[PXGPPTViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 0);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  PXGView *v5;
  PXGView *v6;
  PXGView *gridView;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXGPPTViewController;
  -[PXGPPTViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PXGPPTViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = [PXGView alloc];
  objc_msgSend(v3, "bounds");
  v6 = -[PXGView initWithFrame:](v5, "initWithFrame:");
  gridView = self->_gridView;
  self->_gridView = v6;

  -[PXGPPTViewController initialLayout](self, "initialLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGView setRootLayout:](self->_gridView, "setRootLayout:", v8);

  -[PXGView setAutoresizingMask:](self->_gridView, "setAutoresizingMask:", 2);
  -[PXGView registerAllTextureProvidersWithMediaProvider:](self->_gridView, "registerAllTextureProvidersWithMediaProvider:", 0);
  objc_msgSend(v3, "addSubview:", self->_gridView);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleDoubleTap_);
  objc_msgSend(v9, "setNumberOfTapsRequired:", 2);
  objc_msgSend(v3, "addGestureRecognizer:", v9);

}

- (PXGView)gridView
{
  -[PXGPPTViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_gridView;
}

- (void)animate:(id)a3 animationRenderingCompletionHandler:(id)a4 proceedHandler:(id)a5
{
  void (**v8)(id, void *);
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = (void (**)(id, void *))a3;
  v9 = a4;
  v10 = a5;
  -[PXGPPTViewController gridView](self, "gridView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v8[2](v8, v11);
  objc_msgSend(v11, "rootLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsUpdate");

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__PXGPPTViewController_animate_animationRenderingCompletionHandler_proceedHandler___block_invoke;
  v15[3] = &unk_1E513F8E8;
  v16 = v9;
  v17 = v10;
  v13 = v10;
  v14 = v9;
  objc_msgSend(v11, "installAnimationRenderingCompletionHandler:", v15);

}

- (void)_handleDoubleTap:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[PXGPPTViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (PXGLayout)initialLayout
{
  return self->_initialLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialLayout, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
}

void __83__PXGPPTViewController_animate_animationRenderingCompletionHandler_proceedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(void **)(a1 + 40);
  if (v3)
    dispatch_async(MEMORY[0x1E0C80D38], v3);
}

@end
