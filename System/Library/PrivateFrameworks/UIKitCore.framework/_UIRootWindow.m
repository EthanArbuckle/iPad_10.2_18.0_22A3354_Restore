@implementation _UIRootWindow

- (id)_layerForCoordinateSpaceConversion
{
  return self->super._rootLayer;
}

- (BOOL)_isWindowServerHostingManaged
{
  return 0;
}

- (_UIRootWindow)initWithDisplay:(id)a3
{
  id v5;
  FBSDisplayIdentity *v6;
  FBSDisplayIdentity *currentDisplayIdentity;
  void *v8;
  double v9;
  _OWORD *v10;
  __int128 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  _UIRootWindow *v22;
  void *v24;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIRootWindow.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("display"));

  }
  objc_msgSend(v5, "identity");
  v6 = (FBSDisplayIdentity *)objc_claimAutoreleasedReturnValue();
  currentDisplayIdentity = self->_currentDisplayIdentity;
  self->_currentDisplayIdentity = v6;

  +[UIScreen _FBSDisplayConfigurationConnected:andNotify:](UIScreen, "_FBSDisplayConfigurationConnected:andNotify:", v5, objc_msgSend((id)UIApp, "_hasCalledRunWithMainScene"));
  +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", self->_currentDisplayIdentity);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_scale");
  self->_scale = v9;
  self->super._viewOrientation = 1;
  v10 = (_OWORD *)MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&self->_additionalRootLayerAffineTransform.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v11 = v10[1];
  *(_OWORD *)&self->_additionalRootLayerAffineTransform.a = *v10;
  *(_OWORD *)&self->_additionalRootLayerAffineTransform.c = v11;
  objc_msgSend(v5, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - display %@"), objc_opt_class(), v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIWindowScene _unassociatedWindowSceneForScreen:create:](UIWindowScene, "_unassociatedWindowSceneForScreen:create:", v8, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[UIWindow _initWithFrame:debugName:windowScene:](self, "_initWithFrame:debugName:windowScene:", v20, v21, v13, v15, v17, v19);

  if (v22)
  {
    if (objc_msgSend(v5, "isExternal"))
      -[UIWindow setFrame:](v22, "setFrame:", v13, v15, v17, v19);
    -[_UIRootWindow _updateVisibility](v22, "_updateVisibility");
  }

  return v22;
}

- (_UIRootWindow)initWithScreen:(id)a3
{
  void *v4;
  _UIRootWindow *v5;

  objc_msgSend(a3, "displayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIRootWindow initWithDisplay:](self, "initWithDisplay:", v4);

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIScreenDisplayConfigurationUpdatedNotification"), 0);

  -[RBSAssertion invalidate](self->_visibilityProcessingLock_assertion, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)_UIRootWindow;
  -[UIWindow dealloc](&v4, sel_dealloc);
}

- (NSString)visibilityEnvironment
{
  os_unfair_lock_s *p_visibilityLock;
  void *v4;

  p_visibilityLock = &self->_visibilityLock;
  os_unfair_lock_lock(&self->_visibilityLock);
  -[_UIRootWindow _visibilityLock_environment](self, "_visibilityLock_environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_visibilityLock);
  return (NSString *)v4;
}

- (void)setVisibilityIdentifier:(id)a3
{
  NSString *v4;
  NSString *visibilityLock_identifier;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_visibilityLock);
  if ((BSEqualStrings() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    visibilityLock_identifier = self->_visibilityLock_identifier;
    self->_visibilityLock_identifier = v4;

    -[_UIRootWindow _visibilityLock_enqueueUpdateIfNecessary](self, "_visibilityLock_enqueueUpdateIfNecessary");
  }
  os_unfair_lock_unlock(&self->_visibilityLock);

}

- (id)_context
{
  return objc_loadWeakRetained((id *)&self->super._layerContext);
}

- (void)_setAdditionalRootLayerAffineTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_additionalRootLayerAffineTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform t1;

  p_additionalRootLayerAffineTransform = &self->_additionalRootLayerAffineTransform;
  v6 = *(_OWORD *)&self->_additionalRootLayerAffineTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_additionalRootLayerAffineTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_additionalRootLayerAffineTransform.tx;
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_additionalRootLayerAffineTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_additionalRootLayerAffineTransform->tx = v9;
    *(_OWORD *)&p_additionalRootLayerAffineTransform->a = v8;
    -[UIWindow _updateTransformLayer](self, "_updateTransformLayer");
  }
}

- (BOOL)_extendsScreenSceneLifetime
{
  return 1;
}

- (BOOL)_wantsSceneAssociation
{
  return 0;
}

- (BOOL)_touchesInsideShouldHideCalloutBar
{
  return 0;
}

+ (BOOL)_needsPassthroughInteraction
{
  return 0;
}

- ($015CE332057EA49C37F0282AEB389482)_bindingDescription
{
  $015CE332057EA49C37F0282AEB389482 *result;
  objc_super v5;

  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  *(_QWORD *)&retstr->var9 = 0;
  v5.receiver = self;
  v5.super_class = (Class)_UIRootWindow;
  result = ($015CE332057EA49C37F0282AEB389482 *)-[$015CE332057EA49C37F0282AEB389482 _bindingDescription](&v5, sel__bindingDescription);
  retstr->var1 = 1;
  return result;
}

- (BOOL)_transformLayerIncludesScreenRotation
{
  return 1;
}

- (void)_configureRootLayer:(id)a3 sceneTransformLayer:(id)a4 transformLayer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  int64_t viewOrientation;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CGAffineTransform v37;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[UIWindow screen](self, "screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_unjailedReferenceBounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = v12 + v16 * 0.5;
  v21 = v14 + v18 * 0.5;
  objc_msgSend(v11, "scale");
  v23 = v22;
  objc_msgSend(v11, "_rotation");
  CGAffineTransformMakeRotation(&v41, -v24);
  *(float64x2_t *)&v41.a = vrndaq_f64(*(float64x2_t *)&v41.a);
  *(float64x2_t *)&v41.c = vrndaq_f64(*(float64x2_t *)&v41.c);
  *(float64x2_t *)&v41.tx = vrndaq_f64(*(float64x2_t *)&v41.tx);
  v42 = v41;
  v40 = v41;
  CGAffineTransformScale(&v42, &v40, v23, v23);
  v25 = *(_OWORD *)&self->_additionalRootLayerAffineTransform.c;
  *(_OWORD *)&v40.a = *(_OWORD *)&self->_additionalRootLayerAffineTransform.a;
  *(_OWORD *)&v40.c = v25;
  *(_OWORD *)&v40.tx = *(_OWORD *)&self->_additionalRootLayerAffineTransform.tx;
  if (!CGAffineTransformIsIdentity(&v40))
  {
    t1 = v42;
    v26 = *(_OWORD *)&self->_additionalRootLayerAffineTransform.c;
    *(_OWORD *)&t2.a = *(_OWORD *)&self->_additionalRootLayerAffineTransform.a;
    *(_OWORD *)&t2.c = v26;
    *(_OWORD *)&t2.tx = *(_OWORD *)&self->_additionalRootLayerAffineTransform.tx;
    CGAffineTransformConcat(&v40, &t1, &t2);
    v42 = v40;
  }
  objc_msgSend(v11, "displayConfiguration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "renderingCenter");
  objc_msgSend(v10, "setPosition:");

  v40 = v42;
  objc_msgSend(v10, "setAffineTransform:", &v40);
  objc_msgSend(v10, "setBounds:", v13, v15, v17, v19);

  v35 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v36 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v40.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v40.c = v35;
  v34 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v40.tx = v34;
  objc_msgSend(v9, "setAffineTransform:", &v40);
  objc_msgSend(v9, "setPosition:", v20, v21);
  objc_msgSend(v9, "setBounds:", v13, v15, v17, v19);

  objc_msgSend(v8, "setPosition:", v20, v21);
  if (objc_msgSend((id)objc_opt_class(), "_transformLayerRotationsAreEnabled"))
  {
    viewOrientation = self->super._viewOrientation;
    switch(viewOrientation)
    {
      case 1:
        v29 = 0.0;
        break;
      case 3:
        v29 = 1.57079633;
        break;
      case 4:
        v29 = -1.57079633;
        break;
      default:
        v29 = 3.14159265;
        if (viewOrientation != 2)
          v29 = 0.0;
        break;
    }
    CGAffineTransformMakeRotation(&v37, v29);
    *(float64x2_t *)&v37.a = vrndaq_f64(*(float64x2_t *)&v37.a);
    *(float64x2_t *)&v37.c = vrndaq_f64(*(float64x2_t *)&v37.c);
    *(float64x2_t *)&v37.tx = vrndaq_f64(*(float64x2_t *)&v37.tx);
    v40 = v37;
    objc_msgSend(v8, "setAffineTransform:", &v40);
    v13 = _UIWindowConvertRectFromOrientationToOrientation(1, self->super._viewOrientation, v13, v15, v17, v19, v17, v19);
    v15 = v30;
    v17 = v31;
    v19 = v32;
  }
  else
  {
    *(_OWORD *)&v40.a = v36;
    *(_OWORD *)&v40.c = v35;
    *(_OWORD *)&v40.tx = v34;
    objc_msgSend(v8, "setAffineTransform:", &v40);
  }
  objc_msgSend(v8, "setBounds:", v13, v15, v17, v19);
  objc_msgSend(v8, "setMasksToBounds:", 1);
  if (self->_scale != v23)
  {
    self->_scale = v23;
    -[UIWindow windowScene](self, "windowScene");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_recycleAttachmentForWindow:", self);

  }
}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIRootWindow;
  -[UIWindow setHidden:](&v4, sel_setHidden_, a3);
  -[_UIRootWindow _updateVisibility](self, "_updateVisibility");
}

- (void)_didMoveFromScene:(id)a3 toScene:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  FBSDisplayIdentity *v17;
  FBSDisplayIdentity *currentDisplayIdentity;
  FBSDisplayIdentity *v19;
  FBSDisplayIdentity *v20;
  FBSDisplayIdentity *v21;
  char v22;
  FBSDisplayIdentity *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_UIRootWindow;
  v6 = a4;
  v7 = a3;
  -[UIWindow _didMoveFromScene:toScene:](&v24, sel__didMoveFromScene_toScene_, v7, v6);
  objc_msgSend(v7, "_screen", v24.receiver, v24.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "displayIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "displayConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  v14 = v12;
  v15 = v14;
  if (v13 == v14)
  {

    v17 = (FBSDisplayIdentity *)v13;
LABEL_25:

    goto LABEL_26;
  }
  if (!v13 || !v14)
  {

    if (v7)
      goto LABEL_15;
LABEL_9:
    if (v6)
    {
      currentDisplayIdentity = self->_currentDisplayIdentity;
      v19 = v15;
      v20 = currentDisplayIdentity;
      if (v19 == v20)
      {

LABEL_24:
        v23 = v15;
        v17 = self->_currentDisplayIdentity;
        self->_currentDisplayIdentity = v23;
        goto LABEL_25;
      }
      v21 = v20;
      if (v15 && v20)
      {
        v22 = -[FBSDisplayIdentity isEqual:](v19, "isEqual:", v20);

        if ((v22 & 1) != 0)
          goto LABEL_24;
      }
      else
      {

      }
LABEL_23:
      +[UIScreen _FBSDisplayConfigurationConnected:andNotify:](UIScreen, "_FBSDisplayConfigurationConnected:andNotify:", v11, objc_msgSend((id)UIApp, "_hasCalledRunWithMainScene"));
      goto LABEL_24;
    }
LABEL_15:
    if (!v7 || !v6)
      goto LABEL_24;
    if (self->_currentDisplayIdentity)
      +[UIScreen _FBSDisplayIdentityDisconnected:](UIScreen, "_FBSDisplayIdentityDisconnected:");
    if (!v15)
      goto LABEL_24;
    goto LABEL_23;
  }
  v16 = objc_msgSend(v13, "isEqual:", v14);

  if ((v16 & 1) == 0)
  {
    if (v7)
      goto LABEL_15;
    goto LABEL_9;
  }
LABEL_26:

}

- (void)_prepareHierarchyForWindowHostingSceneRemoval
{
  FBSDisplayIdentity *currentDisplayIdentity;
  objc_super v4;

  +[UIScreen _FBSDisplayIdentityDisconnected:](UIScreen, "_FBSDisplayIdentityDisconnected:", self->_currentDisplayIdentity);
  currentDisplayIdentity = self->_currentDisplayIdentity;
  self->_currentDisplayIdentity = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UIRootWindow;
  -[UIWindow _prepareHierarchyForWindowHostingSceneRemoval](&v4, sel__prepareHierarchyForWindowHostingSceneRemoval);
}

- (void)_didMoveFromScreen:(id)a3 toScreen:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  objc_super v10;

  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", self);
  v10.receiver = self;
  v10.super_class = (Class)_UIRootWindow;
  -[UIWindow _didMoveFromScreen:toScreen:](&v10, sel__didMoveFromScreen_toScreen_, v8, v7);

  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__noteScreenDidChangeMode_, CFSTR("_UIScreenDisplayConfigurationUpdatedNotification"), v7);
}

- (void)_noteScreenDidChangeMode:(id)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIRootWindow.m"), 278, CFSTR("got a screen mode change notification without a screen -> %@"), v17);

  }
  objc_msgSend(v5, "displayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[UIWindow setFrame:](self, "setFrame:", v8, v10, v12, v14);
  -[UIWindow _updateTransformLayer](self, "_updateTransformLayer");
  -[UIWindow windowScene](self, "windowScene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_recycleAttachmentForWindow:", self);

}

- (void)_updateVisibility
{
  os_unfair_lock_s *p_visibilityLock;
  _BOOL4 v4;

  p_visibilityLock = &self->_visibilityLock;
  os_unfair_lock_lock(&self->_visibilityLock);
  v4 = -[UIView isHidden](self, "isHidden");
  if (self->_visibilityLock_enabled != !v4)
  {
    self->_visibilityLock_enabled = !v4;
    -[_UIRootWindow _visibilityLock_enqueueUpdateIfNecessary](self, "_visibilityLock_enqueueUpdateIfNecessary");
  }
  os_unfair_lock_unlock(p_visibilityLock);
}

- (id)_visibilityLock_environment
{
  NSString *visibilityLock_environment;
  void *v4;
  NSString *v5;
  NSString *v6;

  os_unfair_lock_assert_owner(&self->_visibilityLock);
  visibilityLock_environment = self->_visibilityLock_environment;
  if (!visibilityLock_environment)
  {
    _UIVisibilityEnvironmentForRootWindow((uint64_t)self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSString *)objc_msgSend(v4, "copy");
    v6 = self->_visibilityLock_environment;
    self->_visibilityLock_environment = v5;

    visibilityLock_environment = self->_visibilityLock_environment;
  }
  return visibilityLock_environment;
}

- (void)_visibilityLock_enqueueUpdateIfNecessary
{
  NSObject *v3;
  _QWORD block[5];
  _QWORD v5[5];
  _UIRootWindow *v6;

  os_unfair_lock_assert_owner(&self->_visibilityLock);
  if (!self->_visibilityLock_updateEnqueued && (*(_QWORD *)&self->super.super._viewFlags & 0x1000) == 0)
  {
    self->_visibilityLock_updateEnqueued = 1;
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x3032000000;
    v5[3] = __Block_byref_object_copy__164;
    v5[4] = __Block_byref_object_dispose__164;
    v6 = self;
    dispatch_get_global_queue(25, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57___UIRootWindow__visibilityLock_enqueueUpdateIfNecessary__block_invoke;
    block[3] = &unk_1E16B14C0;
    block[4] = v5;
    dispatch_async(v3, block);

    _Block_object_dispose(v5, 8);
  }
}

- (void)_visibilityLock_enqueueUpdateIfNecessary_body
{
  os_unfair_lock_s *p_visibilityProcessingLock;
  _BOOL4 visibilityLock_enabled;
  void *v5;
  NSString *visibilityLock_identifier;
  NSString *v7;
  RBSAssertion *v8;
  RBSAssertion *visibilityProcessingLock_assertion;
  void *v10;
  NSString *v11;
  void *v12;
  os_unfair_lock_s *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  RBSAssertion *v18;
  RBSAssertion *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  p_visibilityProcessingLock = &self->_visibilityProcessingLock;
  os_unfair_lock_lock(&self->_visibilityProcessingLock);
  os_unfair_lock_lock(&self->_visibilityLock);
  visibilityLock_enabled = self->_visibilityLock_enabled;
  -[_UIRootWindow _visibilityLock_environment](self, "_visibilityLock_environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  visibilityLock_identifier = self->_visibilityLock_identifier;
  v7 = visibilityLock_identifier;
  self->_visibilityLock_updateEnqueued = 0;
  os_unfair_lock_unlock(&self->_visibilityLock);
  if (!BSEqualBools() || (BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_visibilityProcessingLock_identifier, visibilityLock_identifier);
    v8 = self->_visibilityProcessingLock_assertion;
    visibilityProcessingLock_assertion = self->_visibilityProcessingLock_assertion;
    self->_visibilityProcessingLock_assertion = 0;

    if (visibilityLock_enabled)
    {
      objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:environmentIdentifier:", getpid(), v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("creating %@ visibility"), v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v11 = v7;
      else
        v11 = (NSString *)MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0D87CE8], "grantWithNamespace:endowment:", *MEMORY[0x1E0DC5DA8], v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = p_visibilityProcessingLock;
      v14 = v5;
      v15 = objc_alloc(MEMORY[0x1E0D87C98]);
      v21[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v15;
      v5 = v14;
      p_visibilityProcessingLock = v13;
      v18 = (RBSAssertion *)objc_msgSend(v17, "initWithExplanation:target:attributes:", v20, v10, v16);
      v19 = self->_visibilityProcessingLock_assertion;
      self->_visibilityProcessingLock_assertion = v18;

      -[RBSAssertion acquireWithError:](self->_visibilityProcessingLock_assertion, "acquireWithError:", 0);
    }
    -[RBSAssertion invalidate](v8, "invalidate");

  }
  os_unfair_lock_unlock(p_visibilityProcessingLock);

}

- (CGAffineTransform)_additionalRootLayerAffineTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[20].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[20].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[20].ty;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityProcessingLock_assertion, 0);
  objc_storeStrong((id *)&self->_visibilityProcessingLock_identifier, 0);
  objc_storeStrong((id *)&self->_visibilityLock_identifier, 0);
  objc_storeStrong((id *)&self->_visibilityLock_environment, 0);
  objc_storeStrong((id *)&self->_currentDisplayIdentity, 0);
}

@end
