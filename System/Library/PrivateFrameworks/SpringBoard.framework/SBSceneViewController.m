@implementation SBSceneViewController

- (SBSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (SBSceneView)_sceneView
{
  return self->_sceneView;
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (void)viewDidLoad
{
  void *v3;
  SBSceneView *sceneView;
  double v5;
  double v6;
  SBSceneHandle *sceneHandle;
  double v8;
  double v9;
  SBSceneView *v10;
  SBSceneView *v11;
  SBSceneView *v12;
  void *v13;
  SBSceneView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)SBSceneViewController;
  -[SBSceneViewController viewDidLoad](&v28, sel_viewDidLoad);
  -[SBSceneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sceneView = self->_sceneView;
  if (sceneView)
  {
    -[SBSceneViewController contentReferenceSize](self, "contentReferenceSize");
    -[SBSceneView _updateReferenceSize:andOrientation:](sceneView, "_updateReferenceSize:andOrientation:", -[SBSceneViewController contentOrientation](self, "contentOrientation"), v5, v6);
  }
  else
  {
    sceneHandle = self->_sceneHandle;
    -[SBSceneViewController contentReferenceSize](self, "contentReferenceSize");
    v10 = -[SBSceneHandle newSceneViewWithReferenceSize:contentOrientation:containerOrientation:hostRequester:](sceneHandle, "newSceneViewWithReferenceSize:contentOrientation:containerOrientation:hostRequester:", -[SBSceneViewController contentOrientation](self, "contentOrientation"), -[SBSceneViewController containerOrientation](self, "containerOrientation"), self, v8, v9);
    v11 = self->_sceneView;
    self->_sceneView = v10;

  }
  v12 = self->_sceneView;
  -[SBSceneViewController customContentView](self, "customContentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneView setCustomContentView:](v12, "setCustomContentView:", v13);

  v14 = self->_sceneView;
  -[SBSceneViewController placeholderContentContext](self, "placeholderContentContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneView setPlaceholderContentContext:](v14, "setPlaceholderContentContext:", v15);

  -[SBSceneView setDisplayMode:animationFactory:completion:](self->_sceneView, "setDisplayMode:animationFactory:completion:", -[SBSceneViewController displayMode](self, "displayMode"), 0, 0);
  -[SBSceneView setTranslatesAutoresizingMaskIntoConstraints:](self->_sceneView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_sceneView);
  -[SBSceneView leftAnchor](self->_sceneView, "leftAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[SBSceneView rightAnchor](self->_sceneView, "rightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[SBSceneView topAnchor](self->_sceneView, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  -[SBSceneView bottomAnchor](self->_sceneView, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

}

- (SBScenePlaceholderContentContext)placeholderContentContext
{
  return self->_placeholderContentContext;
}

- (UIView)customContentView
{
  return self->_customContentView;
}

- (CGSize)contentReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentReferenceSize.width;
  height = self->_contentReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  void *v9;
  id v10;

  v10 = a4;
  v8 = (void (**)(_QWORD))a5;
  if (self->_displayMode == a3
    || (self->_displayMode = a3, !-[SBSceneViewController isViewLoaded](self, "isViewLoaded")))
  {
    if (v8)
      v8[2](v8);
  }
  else
  {
    -[SBSceneViewController _sceneView](self, "_sceneView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDisplayMode:animationFactory:completion:", a3, v10, v8);

  }
}

- (void)setPlaceholderContentContext:(id)a3
{
  SBScenePlaceholderContentContext *v5;
  int v6;
  void *v7;
  SBScenePlaceholderContentContext *v8;

  v5 = (SBScenePlaceholderContentContext *)a3;
  if (self->_placeholderContentContext != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_placeholderContentContext, a3);
    v6 = -[SBSceneViewController isViewLoaded](self, "isViewLoaded");
    v5 = v8;
    if (v6)
    {
      -[SBSceneViewController _sceneView](self, "_sceneView", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPlaceholderContentContext:", v8);

      v5 = v8;
    }
  }

}

- (void)setContentReferenceSize:(CGSize)a3 withContentOrientation:(int64_t)a4 andContainerOrientation:(int64_t)a5
{
  double height;
  double width;
  _BOOL4 v9;
  id v10;

  height = a3.height;
  width = a3.width;
  v9 = self->_contentReferenceSize.width != a3.width;
  if (self->_contentReferenceSize.height != a3.height)
    v9 = 1;
  if (v9)
    self->_contentReferenceSize = a3;
  if (self->_contentOrientation != a4)
  {
    self->_contentOrientation = a4;
    v9 = 1;
  }
  if (self->_containerOrientation != a5)
    self->_containerOrientation = a5;
  if (v9)
  {
    if (-[SBSceneViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SBSceneViewController _sceneView](self, "_sceneView");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_updateReferenceSize:andOrientation:", a4, width, height);

    }
  }
}

- (int64_t)sceneViewPresentationPriority:(id)a3
{
  return 0;
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (SBSceneViewController)initWithSceneHandle:(id)a3
{
  id v5;
  SBSceneViewController *v6;
  SBSceneViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSceneViewController;
  v6 = -[SBSceneViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sceneHandle, a3);
    v7->_displayMode = 0;
    v7->_contentReferenceSize = (CGSize)*MEMORY[0x1E0C9D820];
    v7->_containerOrientation = 1;
    v7->_contentOrientation = 1;
  }

  return v7;
}

- (id)sceneViewPresentationIdentifier:(id)a3
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v3);
}

- (SBSceneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99750];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("%s is not a valid initializer. You must call -[%@ initWithSceneHandle:]."), "-[SBSceneViewController initWithNibName:bundle:]", v8);

  return -[SBSceneViewController initWithSceneHandle:](self, "initWithSceneHandle:", 0);
}

- (void)invalidate
{
  -[SBSceneView invalidate](self->_sceneView, "invalidate");
}

- (void)dealloc
{
  objc_super v3;

  if (-[SBSceneViewController isViewLoaded](self, "isViewLoaded"))
    -[SBSceneView invalidate](self->_sceneView, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSceneViewController;
  -[SBSceneViewController dealloc](&v3, sel_dealloc);
}

- (SBSceneViewController)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  objc_class *v7;
  void *v8;
  SBSceneViewController *v9;
  objc_super v11;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ does not support unarchiving from a nib."), v8);

  v11.receiver = self;
  v11.super_class = (Class)SBSceneViewController;
  v9 = -[SBSceneViewController initWithCoder:](&v11, sel_initWithCoder_, v6);

  return v9;
}

- (void)setCustomContentView:(id)a3
{
  UIView *v5;
  int v6;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  if (self->_customContentView != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_customContentView, a3);
    v6 = -[SBSceneViewController isViewLoaded](self, "isViewLoaded");
    v5 = v8;
    if (v6)
    {
      -[SBSceneViewController _sceneView](self, "_sceneView", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCustomContentView:", v8);

      v5 = v8;
    }
  }

}

- (id)newSnapshot
{
  return -[SBSceneView newSnapshot](self->_sceneView, "newSnapshot");
}

- (id)newSnapshotView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[SBSceneView newSnapshot](self->_sceneView, "newSnapshot");
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "capture");
    -[SBSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uiPresentationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snapshotPresentationForSnapshot:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)newSnapshotViewOnQueue:(id)a3 withCompletion:(id)a4
{
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  SBSceneViewController *v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneViewController.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotViewBlock"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneViewController.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

LABEL_3:
  v9 = -[SBSceneView newSnapshot](self->_sceneView, "newSnapshot");
  v10 = v9;
  if (v9)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__SBSceneViewController_newSnapshotViewOnQueue_withCompletion___block_invoke;
    block[3] = &unk_1E8EA7D10;
    v14 = v9;
    v15 = self;
    v16 = v8;
    dispatch_async(v7, block);

  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

void __63__SBSceneViewController_newSnapshotViewOnQueue_withCompletion___block_invoke(uint64_t a1)
{
  id v2;
  int8x16_t v3;
  _QWORD block[4];
  int8x16_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "capture");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SBSceneViewController_newSnapshotViewOnQueue_withCompletion___block_invoke_2;
  block[3] = &unk_1E8E9F170;
  v6 = *(id *)(a1 + 48);
  v3 = *(int8x16_t *)(a1 + 32);
  v2 = (id)v3.i64[0];
  v5 = vextq_s8(v3, v3, 8uLL);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __63__SBSceneViewController_newSnapshotViewOnQueue_withCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a1[6];
  objc_msgSend(*(id *)(a1[4] + 968), "sceneIfExists");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uiPresentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotPresentationForSnapshot:", a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

}

- (void)containerContentWrapperInterfaceOrientationChangedTo:(int64_t)a3
{
  -[SBSceneView _containerContentWrapperInterfaceOrientationChangedTo:](self->_sceneView, "_containerContentWrapperInterfaceOrientationChangedTo:", a3);
}

- (void)_setSceneView:(id)a3
{
  objc_storeStrong((id *)&self->_sceneView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_customContentView, 0);
  objc_storeStrong((id *)&self->_placeholderContentContext, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
}

@end
