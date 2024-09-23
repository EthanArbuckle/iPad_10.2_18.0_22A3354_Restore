@implementation PRUISPosterRenderingViewController

- (PRUISPosterRenderingViewController)initWithArchivedConfigurationURL:(id)a3 context:(id)a4
{
  return -[PRUISPosterRenderingViewController initWithArchivedConfigurationURL:context:boundingShape:](self, "initWithArchivedConfigurationURL:context:boundingShape:", a3, a4, -1);
}

- (PRUISPosterRenderingViewController)initWithConfiguration:(id)a3 context:(id)a4
{
  return -[PRUISPosterRenderingViewController initWithConfiguration:context:boundingShape:](self, "initWithConfiguration:context:boundingShape:", a3, a4, -1);
}

- (PRUISPosterRenderingViewController)initWithArchivedConfigurationURL:(id)a3 context:(id)a4 boundingShape:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  PRUISPosterRenderingViewController *v14;
  id v16;

  v8 = a3;
  v9 = (void *)MEMORY[0x24BE74C20];
  v16 = 0;
  v10 = a4;
  objc_msgSend(v9, "unarchiveConfigurationAtURL:format:error:", v8, -1, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  PRUISLogRendering();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[PRUISPosterRenderingViewController initWithArchivedConfigurationURL:context:boundingShape:].cold.1();

  v14 = -[PRUISPosterRenderingViewController initWithConfiguration:context:boundingShape:](self, "initWithConfiguration:context:boundingShape:", v11, v10, a5);
  return v14;
}

- (PRUISPosterRenderingViewController)initWithConfiguration:(id)a3 context:(id)a4 boundingShape:(int64_t)a5
{
  id v9;
  id v10;
  PRUISPosterRenderingViewController *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *enqueuedSnapshotRequests;
  id v19;
  void *v21;
  void *v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PRUISPosterRenderingViewController;
  v11 = -[PRUISPosterRenderingViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, 0, 0);
  if (!v11)
    goto LABEL_9;
  objc_msgSend(v9, "_path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("PFServerPosterPath"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterRenderingViewController initWithConfiguration:context:boundingShape:].cold.1(a2);
LABEL_18:
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445FEB54);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterRenderingViewController initWithConfiguration:context:boundingShape:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445FEBB8);
  }

  v13 = PUIPosterBoundingShapeFromInt();
  if ((PUIPosterBoundingShapeIsValid() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PUIPosterBoundingShapeIsValid(puiBoundingShape)"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterRenderingViewController initWithConfiguration:context:boundingShape:].cold.2(a2);
    goto LABEL_18;
  }
  objc_storeStrong((id *)&v11->_configuration, a3);
  objc_storeStrong((id *)&v11->_context, a4);
  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "deviceClass");

  if (v15 == 2)
    v16 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "activeInterfaceOrientation");
  else
    v16 = 1;
  v11->_activeOrientation = v16;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = objc_claimAutoreleasedReturnValue();
  enqueuedSnapshotRequests = v11->_enqueuedSnapshotRequests;
  v11->_enqueuedSnapshotRequests = (NSMutableArray *)v17;

  v11->_boundingShape = v13;
  v19 = -[PRUISPosterRenderingViewController contentViewCoordinator](v11, "contentViewCoordinator");
  -[PRUISPosterRenderingViewController _createPosterScene](v11, "_createPosterScene");
LABEL_9:

  return v11;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  int v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceClass");

  if (v4 != 2)
    return 2;
  v6.receiver = self;
  v6.super_class = (Class)PRUISPosterRenderingViewController;
  return -[PRUISPosterRenderingViewController supportedInterfaceOrientations](&v6, sel_supportedInterfaceOrientations);
}

- ($04E7BC5D857DAB0C87BC5F8C0E9AAC02)renderingMetrics
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  int64_t activeOrientation;
  double v15;
  double v16;
  int64_t v17;
  $04E7BC5D857DAB0C87BC5F8C0E9AAC02 *result;
  id v19;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[PRUISPosterRenderingViewController supportedInterfaceOrientations](self, "supportedInterfaceOrientations");
  activeOrientation = self->_activeOrientation;
  if (v10 <= v12)
    v15 = v10;
  else
    v15 = v12;
  if (v10 <= v12)
    v16 = v12;
  else
    v16 = v10;
  if ((unint64_t)(activeOrientation - 3) < 2)
    v17 = 1;
  else
    v17 = self->_activeOrientation;
  if ((v13 & 0x18) != 0)
    v15 = v10;
  retstr->var0.origin.x = v6;
  retstr->var0.origin.y = v8;
  if ((v13 & 0x18) != 0)
    v16 = v12;
  retstr->var0.size.width = v15;
  retstr->var0.size.height = v16;
  if ((v13 & 0x18) == 0)
    activeOrientation = v17;
  retstr->var1 = v13;
  retstr->var2 = activeOrientation;

  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[FBScene pui_invalidateWithCompletion:](self->_scene, "pui_invalidateWithCompletion:", 0);
  -[FBScene pui_invalidateWithCompletion:](self->_floatingScene, "pui_invalidateWithCompletion:", 0);
  -[PRUISPosterSnapshotController invalidate](self->_snapshotController, "invalidate");
  -[UIScenePresenter invalidate](self->_scenePresenter, "invalidate");
  -[UIScenePresenter invalidate](self->_floatingPresenter, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PRUISPosterRenderingViewController;
  -[PRUISPosterRenderingViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BYTE v18[32];
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v19.receiver = self;
  v19.super_class = (Class)PRUISPosterRenderingViewController;
  -[PRUISPosterRenderingViewController viewDidLayoutSubviews](&v19, sel_viewDidLayoutSubviews);
  -[PRUISPosterRenderingViewController renderingMetrics](self, "renderingMetrics");
  -[PRUISPosterRenderingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v4 = CGRectEqualToRect(v20, *(CGRect *)v18);

  if (!v4)
  {
    -[PRUISPosterRenderingViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFrame:", *(double *)v18, *(double *)&v18[8], *(double *)&v18[16], *(double *)&v18[24]);

  }
  -[PRUISPosterRenderingViewController contentViewCoordinator](self, "contentViewCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "obscurableContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "frame");
  if (CGRectEqualToRect(v21, *(CGRect *)v18))
  {
    v8 = !v4;
  }
  else
  {
    objc_msgSend(v7, "setFrame:", *(double *)v18, *(double *)&v18[8], *(double *)&v18[16], *(double *)&v18[24]);
    v8 = 1;
  }
  -[PRUISPosterRenderingViewController contentViewCoordinator](self, "contentViewCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "obscurableContentVibrancyView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "frame");
  if (!CGRectEqualToRect(v22, *(CGRect *)v18))
  {
    objc_msgSend(v10, "setFrame:", *(double *)v18, *(double *)&v18[8], *(double *)&v18[16], *(double *)&v18[24]);
    v8 = 1;
  }
  -[PRUISPosterRenderingViewController contentViewCoordinator](self, "contentViewCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vibrantObscurableContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "frame");
  if (!CGRectEqualToRect(v23, *(CGRect *)v18))
  {
    objc_msgSend(v12, "setFrame:", *(double *)v18, *(double *)&v18[8], *(double *)&v18[16], *(double *)&v18[24]);
    v8 = 1;
  }
  -[PRUISPosterRenderingViewController contentViewCoordinator](self, "contentViewCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "overlayContentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "frame");
  if (!CGRectEqualToRect(v24, *(CGRect *)v18))
  {
    objc_msgSend(v14, "setFrame:", *(double *)v18, *(double *)&v18[8], *(double *)&v18[16], *(double *)&v18[24]);
    v8 = 1;
  }
  -[PRUISPosterRenderingViewController contentViewCoordinator](self, "contentViewCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "obscurableOverlayView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "frame");
  if (!CGRectEqualToRect(v25, *(CGRect *)v18))
  {
    objc_msgSend(v16, "setFrame:", *(double *)v18, *(double *)&v18[8], *(double *)&v18[16], *(double *)&v18[24]);
    v8 = 1;
  }
  -[UIView frame](self->_sceneView, "frame");
  if (!CGRectEqualToRect(v26, *(CGRect *)v18))
  {
    -[UIView setFrame:](self->_sceneView, "setFrame:", *(double *)v18, *(double *)&v18[8], *(double *)&v18[16], *(double *)&v18[24]);
    v8 = 1;
  }
  -[UIView frame](self->_floatingSceneView, "frame");
  if (CGRectEqualToRect(v27, *(CGRect *)v18))
  {
    if (!v8)
      goto LABEL_21;
  }
  else
  {
    -[UIView setFrame:](self->_floatingSceneView, "setFrame:", *(double *)v18, *(double *)&v18[8], *(double *)&v18[16], *(double *)&v18[24]);
  }
  -[PRUISPosterRenderingViewController contentViewCoordinator](self, "contentViewCoordinator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateLayoutForChangedVibrantObscuredSubviewBounds");

LABEL_21:
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIView *sceneView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PRUISPosterRenderingViewController;
  -[PRUISPosterRenderingViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[PRUISPosterRenderingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PRUISPosterRenderingViewController renderingMetrics](self, "renderingMetrics");
  -[PRUISPosterRenderingViewController contentViewCoordinator](self, "contentViewCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "obscurableContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setFrame:", v12, v13, v14, v15);
  objc_msgSend(v6, "setFrame:", v12, v13, v14, v15);
  sceneView = self->_sceneView;
  -[PRUISPosterRenderingViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (sceneView)
    objc_msgSend(v8, "insertSubview:aboveSubview:", v6, self->_sceneView);
  else
    objc_msgSend(v8, "addSubview:", v6);

  if (self->_floatingSceneView)
  {
    -[PRUISPosterRenderingViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_floatingSceneView);

    -[PRUISPosterRenderingViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bringSubviewToFront:", self->_floatingSceneView);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRUISPosterRenderingViewController;
  -[PRUISPosterRenderingViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PRUISPosterRenderingViewController _updateBackgroundScene](self, "_updateBackgroundScene");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRUISPosterRenderingViewController;
  -[PRUISPosterRenderingViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PRUISPosterRenderingViewController _updateBackgroundScene](self, "_updateBackgroundScene");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRUISPosterRenderingViewController;
  -[PRUISPosterRenderingViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v5, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  -[PRUISPosterRenderingViewController _updateBackgroundScene](self, "_updateBackgroundScene");
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRUISPosterRenderingViewController;
  -[PRUISPosterRenderingViewController didMoveToParentViewController:](&v4, sel_didMoveToParentViewController_, a3);
  -[PRUISPosterRenderingViewController _updateBackgroundScene](self, "_updateBackgroundScene");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PRUISPosterRenderingViewController;
  -[PRUISPosterRenderingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v20, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_msgSend(v7, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(v8, "window");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  if (v7)
  {
    v11 = objc_msgSend(v9, "_toWindowOrientation");
    objc_msgSend(v10, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_synchronizedDrawingFence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BE0BD98];
    objc_msgSend(v7, "transitionDuration");
    objc_msgSend(v14, "settingsWithDuration:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = -[PRUISPosterRenderingViewController interfaceOrientation](self, "interfaceOrientation");
    v15 = 0;
    v13 = 0;
  }
  -[PRUISPosterRenderingViewController renderingMetrics](self, "renderingMetrics");
  if (v7)
    v16 = height;
  else
    v16 = v19;
  if (v7)
    v17 = width;
  else
    v17 = v18;
  -[PRUISPosterRenderingViewController _updateBackgroundSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateBackgroundSceneToSize:orientation:withAnimationSettings:fence:", v11, v15, v13, v17, v16, v18);

}

- (PRUISPosterContentViewCoordinator)contentViewCoordinator
{
  PRUISPosterContentViewCoordinator *contentViewCoordinator;
  PRUISPosterContentViewCoordinator *v4;
  PRUISPosterContentViewCoordinator *v5;
  void *v6;
  void *v7;
  id v8;
  double v10;
  double v11;
  double v12;
  double v13;

  contentViewCoordinator = self->_contentViewCoordinator;
  if (!contentViewCoordinator)
  {
    -[PRUISPosterRenderingViewController renderingMetrics](self, "renderingMetrics");
    v4 = -[PRUISPosterContentViewCoordinator initWithBounds:]([PRUISPosterContentViewCoordinator alloc], "initWithBounds:", v10, v11, v12, v13);
    v5 = self->_contentViewCoordinator;
    self->_contentViewCoordinator = v4;

    -[PRUISPosterContentViewCoordinator obscurableContentView](self->_contentViewCoordinator, "obscurableContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFrame:", v10, v11, v12, v13);
    -[PRUISPosterRenderingViewController _currentAppearance](self, "_currentAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PRUISPosterRenderingViewController _updateContentStyleWithAppearance:](self, "_updateContentStyleWithAppearance:", v7);

    contentViewCoordinator = self->_contentViewCoordinator;
  }
  return contentViewCoordinator;
}

- (void)registerPosterAppearanceObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PRUISPosterRenderingViewController _currentAppearance](self, "_currentAppearance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PRUISPosterRenderingViewController _updateContentStyleWithAppearance:](self, "_updateContentStyleWithAppearance:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterAppearanceDidChange:", v5);

}

- (void)updateLayoutForChangedObscuredSubviewBounds
{
  id v2;

  -[PRUISPosterRenderingViewController contentViewCoordinator](self, "contentViewCoordinator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateLayoutForChangedVibrantObscuredSubviewBounds");

}

- (void)setRenderingMode:(unint64_t)a3
{
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  int v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3 >= 3)
  {
    PRUISLogRendering();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PRUISPosterRenderingViewController setRenderingMode:].cold.1(a3);

  }
  else if (self->_renderingMode != a3)
  {
    PRUISLogRendering();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("default");
      if (a3 == 1)
        v6 = CFSTR("paused");
      if (a3 == 2)
        v6 = CFSTR("live");
      v7 = v6;
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_2445ED000, v5, OS_LOG_TYPE_DEFAULT, "Updating to rendering mode: %@", (uint8_t *)&v9, 0xCu);

    }
    self->_renderingMode = a3;
    -[PRUISPosterRenderingViewController _updateBackgroundScene](self, "_updateBackgroundScene");
  }
}

- (void)setShowsContentWhenReady:(BOOL)a3
{
  if (self->_showsContentWhenReady != a3)
  {
    self->_showsContentWhenReady = a3;
    if (a3)
    {
      -[PRUISPosterRenderingViewController _setContentHidden:animated:completion:](self, "_setContentHidden:animated:completion:", -[PRUISPosterRenderingViewController _isSceneContentReady](self, "_isSceneContentReady") ^ 1, 0, 0);
      -[PRUISPosterRenderingViewController _updateBackgroundScene](self, "_updateBackgroundScene");
    }
  }
}

- (void)setForcesSceneForeground:(BOOL)a3
{
  if (self->_forcesSceneForeground != a3)
  {
    self->_forcesSceneForeground = a3;
    -[PRUISPosterRenderingViewController _updateBackgroundScene](self, "_updateBackgroundScene");
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_serverPath
{
  return (id)-[PRSPosterConfiguration _path](self->_configuration, "_path");
}

- (id)_currentAppearance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  -[PRUISPosterRenderingViewController _loadTitleStyleConfigurationIfNeeded](self, "_loadTitleStyleConfigurationIfNeeded");
  if (self->_titleStyleConfiguration)
  {
    -[PRSPosterConfiguration pr_posterProvider](self->_configuration, "pr_posterProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v3, 0);
      objc_msgSend(v4, "URL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PRUISLogRendering();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[PRUISPosterRenderingViewController _currentAppearance].cold.2(self);

      v5 = 0;
    }
    -[PRSPosterConfiguration role](self->_configuration, "role");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PRPosterTitleStyleConfiguration effectiveTimeFontWithExtensionBundleURL:forRole:](self->_titleStyleConfiguration, "effectiveTimeFontWithExtensionBundleURL:forRole:", v5, v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PRUISLogRendering();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[PRUISPosterRenderingViewController _currentAppearance].cold.1(self);

      objc_msgSend(MEMORY[0x24BE74E30], "defaultTitleFontForRole:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v9;

    objc_msgSend(v11, "fontWithSize:", 84.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x24BE74DD0]);
    v14 = objc_alloc(MEMORY[0x24BE74DD8]);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithColor:", v15);
    v6 = (void *)objc_msgSend(v13, "initWithFont:labelColor:preferredTitleAlignment:preferredTitleLayout:", v12, v16, -[PRPosterTitleStyleConfiguration preferredTitleAlignment](self->_titleStyleConfiguration, "preferredTitleAlignment"), -[PRPosterTitleStyleConfiguration preferredTitleLayout](self->_titleStyleConfiguration, "preferredTitleLayout"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_obscurableContentView
{
  void *v2;
  void *v3;

  -[PRUISPosterRenderingViewController contentViewCoordinator](self, "contentViewCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "obscurableContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_updateContentStyleWithAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PRUISPosterRenderingViewController contentViewCoordinator](self, "contentViewCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterTitleStyleConfiguration effectiveTitleContentStyle](self->_titleStyleConfiguration, "effectiveTitleContentStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateContentViewsWithContentStyle:initialAppearance:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_loadTitleStyleConfigurationIfNeeded
{
  void *v3;
  PRPosterTitleStyleConfiguration *v4;
  PRPosterTitleStyleConfiguration *titleStyleConfiguration;
  PRPosterTitleStyleConfiguration *v6;
  PRPosterTitleStyleConfiguration *v7;

  if (!self->_didLoadTitleStyleConfiguration)
  {
    -[PRUISPosterRenderingViewController configuration](self, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pr_loadTitleStyleConfigurationWithError:", 0);
    v4 = (PRPosterTitleStyleConfiguration *)objc_claimAutoreleasedReturnValue();
    titleStyleConfiguration = self->_titleStyleConfiguration;
    self->_titleStyleConfiguration = v4;

    if (!self->_titleStyleConfiguration)
    {
      v6 = (PRPosterTitleStyleConfiguration *)objc_alloc_init(MEMORY[0x24BE74E30]);
      v7 = self->_titleStyleConfiguration;
      self->_titleStyleConfiguration = v6;

    }
    self->_didLoadTitleStyleConfiguration = 1;
  }
}

- (BOOL)_shouldSceneBeForeground
{
  return self->_forcesSceneForeground
      || -[PRUISPosterRenderingViewController _appearState](self, "_appearState") != 0;
}

- (void)_createPosterScene
{
  FBScene *v3;
  FBScene *scene;
  id v5;

  -[PRUISPosterRenderingViewController _serverPath](self, "_serverPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE380F0], "pr_createPosterSceneWithRole:path:", *MEMORY[0x24BE74F30], v5);
  v3 = (FBScene *)objc_claimAutoreleasedReturnValue();
  scene = self->_scene;
  self->_scene = v3;

  -[FBScene setDelegate:](self->_scene, "setDelegate:", self);
}

- (void)_updateBackgroundScene
{
  -[PRUISPosterRenderingViewController renderingMetrics](self, "renderingMetrics", 0, 0);
  -[PRUISPosterRenderingViewController _updateBackgroundSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateBackgroundSceneToSize:orientation:withAnimationSettings:fence:", 0, 0, 0, (unsigned __int128)0);
}

- (void)_updateBackgroundSceneToSize:(CGSize)a3 orientation:(int64_t)a4 withAnimationSettings:(id)a5 fence:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  FBScene *scene;
  id v19;
  id v20;
  void *v21;
  void *v22;
  UIScenePresenter *scenePresenter;
  void *v24;
  objc_class *v25;
  void *v26;
  UIScenePresenter *v27;
  UIScenePresenter *v28;
  UIView *v29;
  UIView *sceneView;
  UIView *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  CGFloat v39;
  CGFloat v40;
  int64_t v41;

  height = a3.height;
  width = a3.width;
  v11 = a5;
  v12 = a6;
  -[PRUISPosterRenderingViewController _screen](self, "_screen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  objc_msgSend(v16, "displayConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  scene = self->_scene;
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __107__PRUISPosterRenderingViewController__updateBackgroundSceneToSize_orientation_withAnimationSettings_fence___block_invoke;
  v35[3] = &unk_2515355F0;
  v35[4] = self;
  v19 = v17;
  v36 = v19;
  v39 = width;
  v40 = height;
  v41 = a4;
  v20 = v12;
  v37 = v20;
  v34 = v11;
  v38 = v34;
  -[FBScene performUpdate:](scene, "performUpdate:", v35);
  -[PRUISPosterRenderingViewController viewIfLoaded](self, "viewIfLoaded");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "window");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  scenePresenter = self->_scenePresenter;
  if (!v22)
  {
    -[UIScenePresenter invalidate](scenePresenter, "invalidate");
    v33 = self->_scenePresenter;
    self->_scenePresenter = 0;
    goto LABEL_8;
  }
  if (!scenePresenter)
  {
    -[FBScene uiPresentationManager](self->_scene, "uiPresentationManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "createPresenterWithIdentifier:", v26);
    v27 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
    v28 = self->_scenePresenter;
    self->_scenePresenter = v27;

    -[UIScenePresenter modifyPresentationContext:](self->_scenePresenter, "modifyPresentationContext:", &__block_literal_global_9);
    -[UIScenePresenter activate](self->_scenePresenter, "activate");
    -[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
    v29 = (UIView *)objc_claimAutoreleasedReturnValue();
    sceneView = self->_sceneView;
    self->_sceneView = v29;

    v31 = self->_sceneView;
    BSRectWithSize();
    -[UIView setFrame:](v31, "setFrame:");
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_sceneView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRUISPosterRenderingViewController view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addSubview:", self->_sceneView);

    -[PRUISPosterRenderingViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "sendSubviewToBack:", self->_sceneView);
LABEL_8:

  }
}

void __107__PRUISPosterRenderingViewController__updateBackgroundSceneToSize_orientation_withAnimationSettings_fence___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v8 = a3;
  v6 = a2;
  objc_msgSend(v6, "setForeground:", objc_msgSend(v5, "_shouldSceneBeForeground"));
  objc_msgSend(v6, "setDisplayConfiguration:", *(_QWORD *)(a1 + 40));
  BSRectWithSize();
  objc_msgSend(v6, "setFrame:");
  objc_msgSend(v6, "setInterfaceOrientation:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v6, "pui_setPosterBoundingShape:", objc_msgSend(*(id *)(a1 + 32), "boundingShape"));
  if (objc_msgSend(*(id *)(a1 + 32), "renderingMode") == 2)
    v7 = 0;
  else
    v7 = 4294967293;
  objc_msgSend(v6, "setActivityMode:", v7);

  objc_msgSend(v8, "setAnimationFence:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v8, "setAnimationSettings:", *(_QWORD *)(a1 + 56));

}

void __107__PRUISPosterRenderingViewController__updateBackgroundSceneToSize_orientation_withAnimationSettings_fence___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "setAppearanceStyle:", 2);
  objc_msgSend(v2, "setClippingDisabled:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColorWhileHosting:", v3);

}

- (void)_updateFloatingLayer
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  UIScenePresenter *floatingPresenter;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIScenePresenter *v20;
  UIScenePresenter *v21;
  UIView *v22;
  UIView *floatingSceneView;
  void *v24;
  UIView *v25;
  void *v26;
  void *v27;
  UIView *sceneView;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[FBScene layerManager](self->_scene, "layerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v5)
  {
    v6 = (double)(uint64_t)*MEMORY[0x24BE74E68];
    v7 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v9, "level");
        v11 = v10;
        if (objc_msgSend(v9, "type") == 1 && v11 == v6)
        {
          LODWORD(v5) = objc_msgSend(v9, "contextID");
          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_14:

  if ((_DWORD)v5 != self->_floatingContextID)
  {
    self->_floatingContextID = v5;
    -[UIScenePresenter invalidate](self->_floatingPresenter, "invalidate");
    floatingPresenter = self->_floatingPresenter;
    self->_floatingPresenter = 0;

    if (self->_floatingContextID)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@-floating"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDF6D28], "targetForContextID:", self->_floatingContextID);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBScene uiPresentationManager](self->_scene, "uiPresentationManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "createPresenterForLayerTarget:identifier:priority:", v18, v17, 100);
      v20 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
      v21 = self->_floatingPresenter;
      self->_floatingPresenter = v20;

      -[UIScenePresenter modifyPresentationContext:](self->_floatingPresenter, "modifyPresentationContext:", &__block_literal_global_76);
      -[UIScenePresenter activate](self->_floatingPresenter, "activate");
      -[PRUISPosterRenderingViewController renderingMetrics](self, "renderingMetrics");
      -[UIScenePresenter presentationView](self->_floatingPresenter, "presentationView");
      v22 = (UIView *)objc_claimAutoreleasedReturnValue();
      floatingSceneView = self->_floatingSceneView;
      self->_floatingSceneView = v22;

      -[UIView setFrame:](self->_floatingSceneView, "setFrame:", (unsigned __int128)0, (unsigned __int128)0);
      if (-[PRUISPosterRenderingViewController isViewLoaded](self, "isViewLoaded"))
      {
        -[PRUISPosterRenderingViewController contentViewCoordinator](self, "contentViewCoordinator");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "obscurableContentView");
        v25 = (UIView *)objc_claimAutoreleasedReturnValue();

        -[PRUISPosterRenderingViewController view](self, "view");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v25)
          sceneView = v25;
        else
          sceneView = self->_sceneView;
        objc_msgSend(v26, "insertSubview:aboveSubview:", self->_floatingSceneView, sceneView);

      }
    }
  }
}

void __58__PRUISPosterRenderingViewController__updateFloatingLayer__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setAppearanceStyle:", 2);
  objc_msgSend(v2, "setClippingDisabled:", 1);

}

- (BOOL)_isSceneContentReady
{
  void *v3;
  int v4;

  -[FBScene clientSettings](self->_scene, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pui_didFinishInitialization");

  return v4 && -[FBScene contentState](self->_scene, "contentState") == 2;
}

- (void)_sceneContentReadinessDidChange
{
  _BOOL8 v3;
  _QWORD v4[4];
  id v5;
  BOOL v6;
  id location;

  if (-[PRUISPosterRenderingViewController showsContentWhenReady](self, "showsContentWhenReady"))
  {
    objc_initWeak(&location, self);
    v3 = -[PRUISPosterRenderingViewController _isSceneContentReady](self, "_isSceneContentReady");
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __69__PRUISPosterRenderingViewController__sceneContentReadinessDidChange__block_invoke;
    v4[3] = &unk_251535658;
    objc_copyWeak(&v5, &location);
    v6 = v3;
    -[PRUISPosterRenderingViewController _setContentHidden:animated:completion:](self, "_setContentHidden:animated:completion:", v3 ^ 1, v3, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __69__PRUISPosterRenderingViewController__sceneContentReadinessDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(_BYTE *)(a1 + 40))
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "renderingViewControllerDidFinishShowingContent:", v4);

    WeakRetained = v4;
  }

}

- (void)_setContentHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v9 = a5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE0BD98], "settingsWithDuration:", 0.25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[PRUISPosterRenderingViewController _setContentHidden:animationSettings:completion:](self, "_setContentHidden:animationSettings:completion:", v6, v8, v9);

}

- (void)_setContentHidden:(BOOL)a3 animationSettings:(id)a4 completion:(id)a5
{
  _QWORD v5[5];
  BOOL v6;

  if (self->_contentHidden != a3)
  {
    self->_contentHidden = a3;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __85__PRUISPosterRenderingViewController__setContentHidden_animationSettings_completion___block_invoke;
    v5[3] = &unk_251535680;
    v5[4] = self;
    v6 = a3;
    objc_msgSend(MEMORY[0x24BE0BF08], "animateWithSettings:actions:completion:", a4, v5, a5);
  }
}

void __85__PRUISPosterRenderingViewController__setContentHidden_animationSettings_completion___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v3 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  objc_msgSend(v2, "setAlpha:", v3);

}

- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a5;
  PRUISLogRendering();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_2445ED000, v8, OS_LOG_TYPE_DEFAULT, "Will receive settings: %@ context: %@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  PRUISPosterRenderingViewController *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PRUISLogRendering();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identityToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218498;
    v12 = self;
    v13 = 2112;
    v14 = v10;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_2445ED000, v8, OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did receive actions %@", (uint8_t *)&v11, 0x20u);

  }
}

- (void)sceneContentStateDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  PRUISPosterRenderingViewController *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PRUISLogRendering();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identityToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentState");
    NSStringFromFBSceneContentState();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218498;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_2445ED000, v5, OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did change content state to %@", (uint8_t *)&v9, 0x20u);

  }
  -[PRUISPosterRenderingViewController _sceneContentReadinessDidChange](self, "_sceneContentReadinessDidChange");

}

- (void)sceneDidActivate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  PRUISPosterRenderingViewController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PRUISLogRendering();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identityToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134218242;
    v9 = self;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_2445ED000, v5, OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did activate", (uint8_t *)&v8, 0x16u);

  }
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  PRUISPosterRenderingViewController *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PRUISLogRendering();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identityToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 134218498;
    v20 = self;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_2445ED000, v8, OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did deactivate with error %@", (uint8_t *)&v19, 0x20u);

  }
  objc_msgSend(v7, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE37FF8]))
  {
    v12 = objc_msgSend(v7, "code");

    if (v12 == 1)
    {
      PRUISLogRendering();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "identityToken");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 134218498;
        v20 = self;
        v21 = 2112;
        v22 = v15;
        v23 = 2112;
        v24 = v7;
        _os_log_impl(&dword_2445ED000, v13, OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did deactivate with fatal error %@", (uint8_t *)&v19, 0x20u);

      }
      goto LABEL_12;
    }
  }
  else
  {

  }
  PRUISLogRendering();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identityToken");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 134218498;
    v20 = self;
    v21 = 2112;
    v22 = v18;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_2445ED000, v16, OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did deactivate with transient error %@", (uint8_t *)&v19, 0x20u);

  }
  -[PRUISPosterRenderingViewController _updateBackgroundScene](self, "_updateBackgroundScene");
LABEL_12:

}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  PRUISPosterRenderingViewController *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  PRUISLogRendering();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "identityToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v18 = self;
    v19 = 2112;
    v20 = v14;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_2445ED000, v12, OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did update client settings with diff %@, transition %@", buf, 0x2Au);

  }
  v15 = objc_alloc_init(MEMORY[0x24BE380D8]);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __112__PRUISPosterRenderingViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
  v16[3] = &unk_251535108;
  v16[4] = self;
  objc_msgSend(v15, "observeLayersWithBlock:", v16);
  objc_msgSend(v15, "inspectDiff:withContext:", v10, objc_msgSend(v9, "clientSettings"));
  objc_msgSend(v15, "removeAllObservers");

}

uint64_t __112__PRUISPosterRenderingViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFloatingLayer");
}

- (PRUISPosterRenderingViewControllerDelegate)delegate
{
  return (PRUISPosterRenderingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PRSPosterConfiguration)configuration
{
  return self->_configuration;
}

- (PRUISPosterRenderingContext)context
{
  return self->_context;
}

- (int64_t)boundingShape
{
  return self->_boundingShape;
}

- (unint64_t)renderingMode
{
  return self->_renderingMode;
}

- (BOOL)showsContentWhenReady
{
  return self->_showsContentWhenReady;
}

- (BOOL)forcesSceneForeground
{
  return self->_forcesSceneForeground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapshotController, 0);
  objc_storeStrong((id *)&self->_snapshotCache, 0);
  objc_storeStrong((id *)&self->_enqueuedSnapshotRequests, 0);
  objc_storeStrong((id *)&self->_contentStyleRenderer, 0);
  objc_storeStrong((id *)&self->_titleStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_contentViewCoordinator, 0);
  objc_storeStrong((id *)&self->_floatingSceneView, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_floatingScene, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_floatingPresenter, 0);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
}

- (UIView)obscurableContentView
{
  void *v2;
  void *v3;

  -[PRUISPosterRenderingViewController contentViewCoordinator](self, "contentViewCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vibrantObscurableContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (id)snapshotWithOptions:(int64_t)a3
{
  return 0;
}

- (void)snapshotWithOptions:(unint64_t)a3 forScreen:(id)a4 completionBlock:(id)a5
{
  void (**v8)(id, void *, _QWORD);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSMutableArray *enqueuedSnapshotRequests;
  _PRUISPosterRenderingEnqueuedSnapshot *v17;
  uint8_t v18[16];

  v8 = (void (**)(id, void *, _QWORD))a5;
  v9 = a4;
  -[PRUISPosterRenderingViewController contentViewCoordinator](self, "contentViewCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "obscurableContentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeFromSuperview");

  -[PRUISPosterRenderingViewController _levelSetForSnapshotOptions:](self, "_levelSetForSnapshotOptions:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISPosterRenderingViewController _snapshotRequestForOptions:screen:levelSet:](self, "_snapshotRequestForOptions:screen:levelSet:", a3, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRUISPosterRenderingViewController _cachedImageForRequest:](self, "_cachedImageForRequest:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v8[2](v8, v14, 0);
  }
  else
  {
    PRUISLogRendering();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_2445ED000, v15, OS_LOG_TYPE_DEFAULT, "Enqueuing snapshot request", v18, 2u);
    }

    enqueuedSnapshotRequests = self->_enqueuedSnapshotRequests;
    v17 = -[_PRUISPosterRenderingEnqueuedSnapshot initWithSnapshotRequest:completionBlock:]([_PRUISPosterRenderingEnqueuedSnapshot alloc], "initWithSnapshotRequest:completionBlock:", v13, v8);
    -[NSMutableArray addObject:](enqueuedSnapshotRequests, "addObject:", v17);

    -[PRUISPosterRenderingViewController _beginExecutingSnapshotsIfNeeded](self, "_beginExecutingSnapshotsIfNeeded");
  }

}

- (id)_cachedImageForRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[8];
  id v16;

  v3 = a3;
  +[PRUISPosterSnapshotController sharedIncomingCallSnapshotController](PRUISPosterSnapshotController, "sharedIncomingCallSnapshotController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v4, "currentSnapshotBundleForRequest:error:", v3, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  if (v5)
  {
    objc_msgSend(v3, "definition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "levelSets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "snapshotForLevelSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      PRUISLogRendering();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2445ED000, v11, OS_LOG_TYPE_DEFAULT, "Snapshot bundle did not contain desired levelSet", buf, 2u);
      }

    }
  }
  else
  {
    PRUISLogRendering();
    v12 = objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v6)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[PRUISPosterRenderingViewController(Deprecated) _cachedImageForRequest:].cold.1();
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2445ED000, v9, OS_LOG_TYPE_DEFAULT, "Unable to fetch latest snapshot bundle", v14, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (void)_beginExecutingSnapshotsIfNeeded
{
  if (!self->_isSnapshotting)
  {
    self->_isSnapshotting = 1;
    -[PRUISPosterRenderingViewController _processNextSnapshot](self, "_processNextSnapshot");
  }
}

- (void)_processNextSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  PRUISPosterRenderingViewController *v15;
  id v16;
  id buf[2];

  if (-[NSMutableArray count](self->_enqueuedSnapshotRequests, "count"))
  {
    -[NSMutableArray firstObject](self->_enqueuedSnapshotRequests, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](self->_enqueuedSnapshotRequests, "removeObject:", v3);
    objc_msgSend(v3, "snapshotRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISPosterRenderingViewController _cachedImageForRequest:](self, "_cachedImageForRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "completionBlock");
      v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v6)[2](v6, v5, 0);

    }
    else
    {
      PRUISLogRendering();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_2445ED000, v10, OS_LOG_TYPE_DEFAULT, "Executing snapshot request", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      +[PRUISPosterSnapshotController sharedIncomingCallSnapshotController](PRUISPosterSnapshotController, "sharedIncomingCallSnapshotController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __70__PRUISPosterRenderingViewController_Deprecated___processNextSnapshot__block_invoke;
      v13[3] = &unk_2515356D0;
      v14 = v3;
      objc_copyWeak(&v16, buf);
      v15 = self;
      objc_msgSend(v11, "executeSnapshotRequest:completion:", v4, v13);

      objc_destroyWeak(&v16);
      objc_destroyWeak(buf);
    }

  }
  else
  {
    self->_isSnapshotting = 0;
    -[PRUISPosterRenderingViewController _obscurableContentView](self, "_obscurableContentView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISPosterRenderingViewController viewIfLoaded](self, "viewIfLoaded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v8)
    {
      -[PRUISPosterRenderingViewController viewIfLoaded](self, "viewIfLoaded");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertSubview:aboveSubview:", v12, self->_sceneView);

    }
  }
}

void __70__PRUISPosterRenderingViewController_Deprecated___processNextSnapshot__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;

  v7 = a4;
  v8 = a2;
  objc_msgSend(a3, "posterSnapshotBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "definition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "levelSets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "snapshotForLevelSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__PRUISPosterRenderingViewController_Deprecated___processNextSnapshot__block_invoke_2;
  block[3] = &unk_2515356A8;
  v17 = *(id *)(a1 + 32);
  v18 = v13;
  v19 = v7;
  v14 = v7;
  v15 = v13;
  objc_copyWeak(&v21, (id *)(a1 + 48));
  v20 = *(_QWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v21);

}

void __70__PRUISPosterRenderingViewController_Deprecated___processNextSnapshot__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v2 = objc_claimAutoreleasedReturnValue();
  v4 = (id)v2;
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
    objc_msgSend(*(id *)(a1 + 56), "_processNextSnapshot");

}

- (id)_snapshotRequestForOptions:(unint64_t)a3 screen:(id)a4 levelSet:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PRUISMutablePosterSnapshotRequest *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BE74DE8];
  v10 = a4;
  v11 = [v9 alloc];
  -[PRUISPosterRenderingViewController _serverPath](self, "_serverPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "_initWithPath:", v12);

  objc_msgSend(v13, "role");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE74E90]) ^ 1;

  v16 = objc_alloc(MEMORY[0x24BE74E28]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v16, "initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:", v18, 1, v15, v19, 0, 0, 1, 1);

  v21 = -[PRUISPosterSnapshotRequest initWithPoster:definition:interfaceOrientation:]([PRUISMutablePosterSnapshotRequest alloc], "initWithPoster:definition:interfaceOrientation:", v13, v20, self->_activeOrientation);
  -[PRUISPosterSnapshotRequest setScreen:](v21, "setScreen:", v10);

  -[PRUISPosterRenderingViewController _obscurableContentView](self, "_obscurableContentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    +[PRUISPosterAttachment attachmentWithView:level:](PRUISPosterAttachment, "attachmentWithView:level:", v22, *MEMORY[0x24BE74E68] - 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISPosterSnapshotRequest setAttachments:](v21, "setAttachments:", v24);

  }
  v25 = (void *)-[PRUISMutablePosterSnapshotRequest copy](v21, "copy");

  return v25;
}

- (id)_levelSetForSnapshotOptions:(unint64_t)a3
{
  char v3;
  PRUISPosterLevelSet *v4;
  PRUISPosterLevelSet *v5;
  PRUISPosterLevelSet *v6;
  PRUISPosterLevelSet *v7;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  if ((a3 & 1) != 0)
  {
    v6 = [PRUISPosterLevelSet alloc];
    v5 = -[PRUISPosterLevelSet initWithLevel:](v6, "initWithLevel:", *MEMORY[0x24BE74E68]);
  }
  else if ((a3 & 4) != 0)
  {
    v7 = [PRUISPosterLevelSet alloc];
    if ((v3 & 2) != 0)
      v5 = -[PRUISPosterLevelSet initWithNumberOfLevels:](v7, "initWithNumberOfLevels:", 2, *MEMORY[0x24BE74E68], *MEMORY[0x24BE74E78], v9, v10);
    else
      v5 = -[PRUISPosterLevelSet initWithNumberOfLevels:](v7, "initWithNumberOfLevels:", 3, *MEMORY[0x24BE74E68], *MEMORY[0x24BE74E78], *MEMORY[0x24BE74E68] - 1, v10);
  }
  else if ((a3 & 2) != 0)
  {
    +[PRUISPosterLevelSet defaultLevelSet](PRUISPosterLevelSet, "defaultLevelSet");
    v5 = (PRUISPosterLevelSet *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = [PRUISPosterLevelSet alloc];
    v5 = -[PRUISPosterLevelSet initWithNumberOfLevels:](v4, "initWithNumberOfLevels:", 4, *MEMORY[0x24BE74E58], *MEMORY[0x24BE74E78], *MEMORY[0x24BE74E68], *MEMORY[0x24BE74E68] - 1);
  }
  return v5;
}

- (void)initWithArchivedConfigurationURL:context:boundingShape:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_2445ED000, v1, OS_LOG_TYPE_ERROR, "Unable to unarchive configuration from URL %{public}@: %{public}@", v2, 0x16u);
}

- (void)initWithConfiguration:(const char *)a1 context:boundingShape:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithConfiguration:(const char *)a1 context:boundingShape:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setRenderingMode:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_1(&dword_2445ED000, v2, v3, "Invalid rendering mode %@, bailing", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_2();
}

- (void)_currentAppearance
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_1(&dword_2445ED000, v2, v3, "Missing poster provider from the poster configuration %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_2();
}

@end
