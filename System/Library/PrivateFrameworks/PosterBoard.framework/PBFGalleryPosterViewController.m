@implementation PBFGalleryPosterViewController

- (PBFGalleryPosterViewController)initWithExtensionInstance:(id)a3 preview:(id)a4 definition:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  PBFGalleryPosterViewController *v13;
  PBFGalleryPosterViewController *v14;
  uint64_t v15;
  UIView *transformView;
  UIView *v17;
  void *v18;
  void *v20;
  void *v21;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("extensionInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryPosterViewController initWithExtensionInstance:preview:definition:].cold.1();
LABEL_15:
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA827B8);
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("preview"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryPosterViewController initWithExtensionInstance:preview:definition:].cold.2();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA8281CLL);
  }
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("definition"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryPosterViewController initWithExtensionInstance:preview:definition:].cold.3();
    goto LABEL_15;
  }
  v22.receiver = self;
  v22.super_class = (Class)PBFGalleryPosterViewController;
  v13 = -[PBFGalleryPosterViewController initWithNibName:bundle:](&v22, sel_initWithNibName_bundle_, 0, 0);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_extensionInstance, a3);
    objc_storeStrong((id *)&v14->_preview, a4);
    objc_storeStrong((id *)&v14->_definition, a5);
    v15 = objc_opt_new();
    transformView = v14->_transformView;
    v14->_transformView = (UIView *)v15;

    v17 = v14->_transformView;
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

  }
  return v14;
}

- (void)setDisplayContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryPosterViewController setDisplayContext:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA829A4);
  }
  v9 = v5;
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EF9EE588) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFDisplayContext)]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryPosterViewController setDisplayContext:].cold.1();
    goto LABEL_11;
  }

  if ((objc_msgSend(v9, "isEqualToDisplayContext:", self->_displayContext) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayContext, a3);
    -[PBFGalleryPosterViewController _updateSceneViewController](self, "_updateSceneViewController");
    -[PBFGalleryPosterViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

    -[PBFGalleryPosterViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutIfNeeded");

  }
}

- (void)_setupSceneViewController
{
  void *v3;
  void *v4;
  _PBFPosterSceneSnapshotViewController *v5;
  PFPosterExtensionInstance *extensionInstance;
  void *v7;
  _PBFPosterSceneSnapshotViewController *v8;
  _PBFPosterSceneSnapshotViewController *sceneViewController;
  id v10;

  if (self->_displayContext)
  {
    -[PBFPosterPreview posterDescriptorLookupInfo](self->_preview, "posterDescriptorLookupInfo");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FAD0], "pbf_configurableOptionsForPreview:", self->_preview);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FAE0], "pbf_configuredPropertiesForPreview:", self->_preview);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [_PBFPosterSceneSnapshotViewController alloc];
    extensionInstance = self->_extensionInstance;
    objc_msgSend(v10, "posterDescriptorPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_PBFPosterSceneSnapshotViewController initWithProvider:contents:configurableOptions:configuredProperties:preview:definition:](v5, "initWithProvider:contents:configurableOptions:configuredProperties:preview:definition:", extensionInstance, v7, v3, v4, self->_preview, self->_definition);
    sceneViewController = self->_sceneViewController;
    self->_sceneViewController = v8;

    -[_PBFPosterSceneSnapshotViewController setDisplayContext:](self->_sceneViewController, "setDisplayContext:", self->_displayContext);
    -[_PBFPosterSceneSnapshotViewController setDelegate:](self->_sceneViewController, "setDelegate:", self);
    -[PBFGalleryPosterViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", self->_sceneViewController, self->_transformView);
    -[_PBFPosterSceneSnapshotViewController bs_beginAppearanceTransition:animated:](self->_sceneViewController, "bs_beginAppearanceTransition:animated:", 1, 0);
    -[_PBFPosterSceneSnapshotViewController bs_endAppearanceTransition](self->_sceneViewController, "bs_endAppearanceTransition");
    -[_PBFPosterSceneSnapshotViewController setScenePresenterIsValid:](self->_sceneViewController, "setScenePresenterIsValid:", 1);
    -[PRSceneViewController setForcesSceneForeground:](self->_sceneViewController, "setForcesSceneForeground:", 1);

  }
}

- (void)_updateSceneViewController
{
  if (self->_sceneViewController)
    -[_PBFPosterSceneSnapshotViewController setDisplayContext:](self->_sceneViewController, "setDisplayContext:", self->_displayContext);
  else
    -[PBFGalleryPosterViewController _setupSceneViewController](self, "_setupSceneViewController");
}

- (void)viewDidLoad
{
  void *v3;
  UIView *transformView;
  void *v5;
  UIView *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PBFGalleryPosterViewController;
  -[PBFGalleryPosterViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PBFGalleryPosterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_transformView);

  transformView = self->_transformView;
  -[PBFGalleryPosterViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[UIView setFrame:](transformView, "setFrame:");

  v6 = self->_transformView;
  -[_PBFPosterSceneSnapshotViewController view](self->_sceneViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](v6, "addSubview:", v7);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  UIView *transformView;
  CGAffineTransform v17;
  CGAffineTransform t1;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PBFGalleryPosterViewController;
  -[PBFGalleryPosterViewController viewDidLayoutSubviews](&v24, sel_viewDidLayoutSubviews);
  -[PBFGalleryPosterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  -[UIView setFrame:](self->_transformView, "setFrame:");
  -[_PBFPosterSceneSnapshotViewController view](self->_sceneViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFDisplayContext pbf_frame](self->_displayContext, "pbf_frame");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v8, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeScale(&v23, v5 / v10, v7 / v12);
  memset(&v22, 0, sizeof(v22));
  v13 = -[PBFGalleryPosterViewController interfaceOrientation](self, "interfaceOrientation");
  v14 = 0.0;
  if (v13 != 1)
  {
    if (-[PBFGalleryPosterViewController interfaceOrientation](self, "interfaceOrientation", 0.0) == 4)
    {
      v14 = -1.57079633;
    }
    else if (-[PBFGalleryPosterViewController interfaceOrientation](self, "interfaceOrientation") == 3)
    {
      v14 = 1.57079633;
    }
    else
    {
      v15 = -[PBFGalleryPosterViewController interfaceOrientation](self, "interfaceOrientation");
      v14 = 3.14159265;
      if (v15 != 2)
        v14 = 0.0;
    }
  }
  CGAffineTransformMakeRotation(&v20, v14);
  UIIntegralTransform();
  CGAffineTransformInvert(&v22, &v21);
  t1 = v23;
  memset(&v19, 0, sizeof(v19));
  v17 = v22;
  CGAffineTransformConcat(&v19, &t1, &v17);
  transformView = self->_transformView;
  t1 = v19;
  -[UIView setTransform:](transformView, "setTransform:", &t1);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  -[PBFGalleryPosterViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  else
    return 2;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)sceneSnapshotViewController:(id)a3 stateWillChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  PBFGalleryPosterViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v10;
  id v11;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v11, "galleryPosterViewController:stateWillChangeFrom:to:", self, a4, a5);

  }
}

- (void)sceneSnapshotViewController:(id)a3 stateChangedTo:(int64_t)a4
{
  PBFGalleryPosterViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v8;
  id v9;
  RBSAssertion *v10;
  RBSAssertion *posterRuntimeAssertion;
  void *v12;
  void *v13;
  RBSAssertion *v14;
  RBSAssertion *v15;
  RBSAssertion *v16;
  RBSAssertion *v17;
  uint64_t v18;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "galleryPosterViewController:stateChangedTo:", self, a4);

  }
  if (a4 == 1 && !self->_isInvalidated)
  {
    posterRuntimeAssertion = self->_posterRuntimeAssertion;
    if (posterRuntimeAssertion)
      -[RBSAssertion invalidate](posterRuntimeAssertion, "invalidate");
    -[PFPosterExtensionInstance processIdentity](self->_extensionInstance, "processIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithProcessIdentity:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87C98], "pf_posterUpdateRuntimeAssertionForTarget:explanation:", v13, CFSTR("Gallery Poster View Controller Wants This To Run"));
    v14 = (RBSAssertion *)objc_claimAutoreleasedReturnValue();
    v15 = self->_posterRuntimeAssertion;
    self->_posterRuntimeAssertion = v14;

    v16 = self->_posterRuntimeAssertion;
    v18 = 0;
    -[RBSAssertion acquireWithError:](v16, "acquireWithError:", &v18);
    if (v18)
    {
      v17 = self->_posterRuntimeAssertion;
      self->_posterRuntimeAssertion = 0;

    }
  }
  else
  {
    -[RBSAssertion invalidate](self->_posterRuntimeAssertion, "invalidate");
    v10 = self->_posterRuntimeAssertion;
    self->_posterRuntimeAssertion = 0;

  }
}

- (int64_t)state
{
  return -[_PBFPosterSceneSnapshotViewController state](self->_sceneViewController, "state");
}

- (void)invalidate
{
  RBSAssertion *posterRuntimeAssertion;

  self->_isInvalidated = 1;
  -[_PBFPosterSceneSnapshotViewController invalidate](self->_sceneViewController, "invalidate");
  -[RBSAssertion invalidate](self->_posterRuntimeAssertion, "invalidate");
  posterRuntimeAssertion = self->_posterRuntimeAssertion;
  self->_posterRuntimeAssertion = 0;

}

- (PBFGalleryPosterViewControllerDelegate)delegate
{
  return (PBFGalleryPosterViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PFPosterExtensionInstance)extensionInstance
{
  return self->_extensionInstance;
}

- (PBFPosterPreview)preview
{
  return self->_preview;
}

- (PBFPosterSnapshotDefinition)definition
{
  return self->_definition;
}

- (PBFDisplayContext)displayContext
{
  return self->_displayContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayContext, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_extensionInstance, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_posterRuntimeAssertion, 0);
  objc_storeStrong((id *)&self->_transformView, 0);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
}

- (void)initWithExtensionInstance:preview:definition:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithExtensionInstance:preview:definition:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithExtensionInstance:preview:definition:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setDisplayContext:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
