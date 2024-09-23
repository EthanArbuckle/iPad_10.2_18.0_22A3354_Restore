@implementation _UIDragSetDownItemAnimation

- (_UIDragSetDownItemAnimation)initWithDragItem:(id)a3 droppedItem:(id)a4 dropContainerView:(id)a5 defaultAnimation:(BOOL)a6 sourceAnimation:(BOOL)a7 delegate:(id)a8
{
  id v15;
  id v16;
  id v17;
  _UIDragSetDownItemAnimation *v18;
  _UIDragSetDownItemAnimation *v19;
  uint64_t v20;
  _UIDragSetDownAnimationTarget *visualTarget;
  id v23;
  objc_super v24;
  objc_super v25;

  v15 = a3;
  v23 = a4;
  v16 = a5;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)_UIDragSetDownItemAnimation;
  v24.receiver = -[_UIDragSetDownItemAnimation init](&v25, sel_init);
  v24.super_class = (Class)_UIDragSetDownItemAnimation;
  v18 = -[_UIDragSetDownItemAnimation init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_item, a3);
    objc_storeStrong((id *)&v19->_droppedItem, a4);
    objc_storeStrong((id *)&v19->_dropContainerView, a5);
    v19->_sourceAnimation = a7;
    v19->_defaultAnimation = a6;
    if (a7)
      objc_msgSend(v15, "_sourceVisualTarget");
    else
      objc_msgSend(v15, "_destinationVisualTarget");
    v20 = objc_claimAutoreleasedReturnValue();
    visualTarget = v19->_visualTarget;
    v19->_visualTarget = (_UIDragSetDownAnimationTarget *)v20;

    objc_storeWeak((id *)&v19->_delegate, v17);
    -[_UIDragSetDownItemAnimation prepareAnimationInWindow](v19, "prepareAnimationInWindow");
    -[_UIDragSetDownItemAnimation configureAnimation](v19, "configureAnimation");
  }

  return v19;
}

- (void)prepareAnimationInWindow
{
  double v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  _UIDragSetDownAnimationTarget *v7;
  void *v8;
  void *v9;
  UITargetedDragPreview *v10;
  UITargetedDragPreview *targetedDropPreview;
  _UIDragSetDownAnimationTarget *visualTarget;
  void *v13;
  double v14;
  double v15;
  double v16;
  UITargetedDragPreview *v17;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v7 = self->_visualTarget;
  if (!v7)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_UIDragSetDownAnimationTarget _window](v7, "_window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8 || (objc_msgSend(v8, "isHidden") & 1) != 0)
    {

LABEL_6:
      goto LABEL_9;
    }

  }
  if (!self->_defaultAnimation)
  {
    visualTarget = self->_visualTarget;
    -[_UIDragSetDownItemAnimation delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDragSetDownAnimationTarget _setDownAnimation:prepareForSetDownOfDragItem:visibleDroppedItem:](visualTarget, "_setDownAnimation:prepareForSetDownOfDragItem:visibleDroppedItem:", v13, self->_item, self->_droppedItem);
    v10 = (UITargetedDragPreview *)objc_claimAutoreleasedReturnValue();

    v3 = _targetFrameForTargetedPreviewInContainerView(v10, self->_dropContainerView);
    v4 = v14;
    v5 = v15;
    v6 = v16;
    goto LABEL_10;
  }
LABEL_9:
  v10 = 0;
LABEL_10:
  self->_targetFrame.origin.x = v3;
  self->_targetFrame.origin.y = v4;
  self->_targetFrame.size.width = v5;
  self->_targetFrame.size.height = v6;
  targetedDropPreview = self->_targetedDropPreview;
  self->_targetedDropPreview = v10;
  v17 = v10;

  -[_UIDragSetDownItemAnimation _setCenterAndVelocityFromDroppedItem:](self, "_setCenterAndVelocityFromDroppedItem:", self->_droppedItem);
}

- (void)prepareToBeginAnimation
{
  int has_internal_diagnostics;
  UIViewPropertyAnimator *propertyAnimator;
  void *v5;
  UIDragItem *item;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  propertyAnimator = self->_propertyAnimator;
  if (has_internal_diagnostics)
  {
    if (!propertyAnimator)
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "property animator passed to delegate API must be non-nil", buf, 2u);
      }

    }
  }
  else if (!propertyAnimator)
  {
    v8 = prepareToBeginAnimation___s_category;
    if (!prepareToBeginAnimation___s_category)
    {
      v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&prepareToBeginAnimation___s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "property animator passed to delegate API must be non-nil", v10, 2u);
    }
  }
  -[_UIDragSetDownItemAnimation delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDragSetDownAnimationTarget _setDownAnimation:willAnimateSetDownOfDragItem:withAnimator:preview:](self->_visualTarget, "_setDownAnimation:willAnimateSetDownOfDragItem:withAnimator:preview:", v5, self->_item, self->_propertyAnimator, self->_targetedDropPreview);
  item = self->_item;
  if (item)
    objc_storeWeak((id *)&item->__currentSetDownAnimation, v5);

}

- (void)beginAnimation
{
  -[UIView setHidden:](self->_retargetingContainerView, "setHidden:", 0);
  if (self->_defaultAnimation)
    -[UIViewPropertyAnimator startAnimation](self->_propertyAnimator, "startAnimation");
}

- (void)animationReachedTarget
{
  id v3;

  self->_reachedTarget = 1;
  -[_UIDragSetDownItemAnimation delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemAnimationReachedTarget:", self);

}

- (void)animationCompleted
{
  id v3;

  self->_done = 1;
  -[UIView removeFromSuperview](self->_appPlatterView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_updatedAppPlatterView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_druidPlatterView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_retargetingContainerPortalView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_retargetingContainerView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_defaultPlatterView, "removeFromSuperview");
  -[_UIDragSetDownItemAnimation delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemAnimationCompleted:", self);

}

- (UIWindow)targetContainerWindow
{
  void *v2;
  void *v3;
  void *v4;

  -[UITargetedPreview target](self->_targetedDropPreview, "target");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindow *)v4;
}

- (void)configureAnimation
{
  if (self->_defaultAnimation || CGRectIsNull(self->_targetFrame))
  {
    self->_defaultAnimation = 1;
    -[_UIDragSetDownItemAnimation configureSystemDefaultAnimation](self, "configureSystemDefaultAnimation");
  }
  else
  {
    -[_UIDragSetDownItemAnimation configureCrossfadingAnimationToTargetedPreview](self, "configureCrossfadingAnimationToTargetedPreview");
  }
}

- (void)configureSystemDefaultAnimation
{
  _UIPlatterView *v3;
  UIViewPropertyAnimator *v4;
  UIViewPropertyAnimator *propertyAnimator;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  UIViewPropertyAnimator *v9;
  id *v10;
  _QWORD *v11;
  UIViewPropertyAnimator *v12;
  _UIPlatterView *v13;
  _QWORD v14[4];
  _UIPlatterView *v15;
  id v16;
  id location;
  _QWORD v18[4];
  _UIPlatterView *v19;
  _QWORD v20[4];
  _UIPlatterView *v21;
  _QWORD v22[4];
  _UIPlatterView *v23;

  v3 = -[_UIPlatterView initWithDroppedItem:]([_UIPlatterView alloc], "initWithDroppedItem:", self->_droppedItem);
  -[UIView setCenter:](v3, "setCenter:", self->_center.x, self->_center.y);
  objc_storeStrong((id *)&self->_defaultPlatterView, v3);
  -[UIView insertSubview:atIndex:](self->_dropContainerView, "insertSubview:atIndex:", v3, 0);
  objc_msgSend((id)objc_opt_class(), "defaultSetDownPropertyAnimator");
  v4 = (UIViewPropertyAnimator *)objc_claimAutoreleasedReturnValue();
  propertyAnimator = self->_propertyAnimator;
  self->_propertyAnimator = v4;

  v6 = MEMORY[0x1E0C809B0];
  if (self->_sourceAnimation)
  {
    -[_UIDragSetDownItemAnimation droppedItem](self, "droppedItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "itemIndex");

    v9 = self->_propertyAnimator;
    if (v8)
    {
      v20[0] = v6;
      v20[1] = 3221225472;
      v20[2] = __62___UIDragSetDownItemAnimation_configureSystemDefaultAnimation__block_invoke_2;
      v20[3] = &unk_1E16B1B28;
      v10 = (id *)&v21;
      v21 = v3;
      v11 = v20;
    }
    else
    {
      v22[0] = v6;
      v22[1] = 3221225472;
      v22[2] = __62___UIDragSetDownItemAnimation_configureSystemDefaultAnimation__block_invoke;
      v22[3] = &unk_1E16B1B28;
      v10 = (id *)&v23;
      v23 = v3;
      v11 = v22;
    }
  }
  else
  {
    v9 = self->_propertyAnimator;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __62___UIDragSetDownItemAnimation_configureSystemDefaultAnimation__block_invoke_3;
    v18[3] = &unk_1E16B1B28;
    v10 = (id *)&v19;
    v19 = v3;
    v11 = v18;
  }
  -[UIViewPropertyAnimator addAnimations:](v9, "addAnimations:", v11);

  objc_initWeak(&location, self);
  v12 = self->_propertyAnimator;
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __62___UIDragSetDownItemAnimation_configureSystemDefaultAnimation__block_invoke_4;
  v14[3] = &unk_1E16BE4C8;
  objc_copyWeak(&v16, &location);
  v13 = v3;
  v15 = v13;
  -[UIViewPropertyAnimator addCompletion:](v12, "addCompletion:", v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)configureCrossfadingAnimationToTargetedPreview
{
  UIViewPropertyAnimator *v3;
  UIViewPropertyAnimator *propertyAnimator;
  void *v5;
  UIView *v6;
  UIView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _UIPlatterContainerView *v12;
  _UIPlatterContainerView *platterContainerView;
  _UIPlatterContainerView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _UIPlatterView *v24;
  _UIPlatterView *appPlatterView;
  _DUIVisibleDroppedItem *droppedItem;
  _UIPlatterView *v27;
  _UIPlatterView *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _UIPlatterView *v34;
  _UIPlatterView *v35;
  _UIPlatterView *druidPlatterView;
  _UIPlatterView *v37;
  uint64_t v38;
  void *v39;
  _UIDragSlotHostingView *v40;
  _UIDragSlotHostingView *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  void *v54;
  id positionHandler;
  _UIPlatterView *v56;
  _UIPlatterContainerView *v57;
  _UIPlatterView *v58;
  void *v59;
  id morphHandler;
  _UIPlatterView *v61;
  void *v62;
  id midpointHandler;
  _UIPlatterView *v64;
  void *v65;
  id nearCompletionHandler;
  id v67;
  void *v68;
  id completionHandler;
  void *v70;
  UIView *v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  BOOL v79;
  _QWORD v80[4];
  _UIPlatterView *v81;
  _QWORD v82[4];
  _UIPlatterView *v83;
  _QWORD v84[4];
  _UIPlatterView *v85;
  _UIPlatterView *v86;
  _UIPlatterContainerView *v87;
  id v88;
  _QWORD aBlock[4];
  id v90;
  CGAffineTransform location;
  CATransform3D v92;
  CGAffineTransform v93;
  _OWORD v94[3];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;

  v3 = (UIViewPropertyAnimator *)objc_opt_new();
  propertyAnimator = self->_propertyAnimator;
  self->_propertyAnimator = v3;

  -[_DUIVisibleDroppedItem preview](self->_droppedItem, "preview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [UIView alloc];
  -[UIView bounds](self->_dropContainerView, "bounds");
  v7 = -[UIView initWithFrame:](v6, "initWithFrame:");
  -[UIView setHidden:](v7, "setHidden:", 1);
  -[UIView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
  -[UIView insertSubview:atIndex:](self->_dropContainerView, "insertSubview:atIndex:", v7, 0);
  v71 = v7;
  objc_storeStrong((id *)&self->_retargetingContainerView, v7);
  v72 = v5;
  objc_msgSend(v5, "unscaledSize");
  v9 = v8;
  v11 = v10;
  v12 = -[_UIPlatterContainerView initWithFrame:]([_UIPlatterContainerView alloc], "initWithFrame:", 0.0, 0.0, v8, v10);
  platterContainerView = self->_platterContainerView;
  self->_platterContainerView = v12;

  -[UIView setCenter:](self->_platterContainerView, "setCenter:", self->_center.x, self->_center.y);
  -[UIView addSubview:](self->_retargetingContainerView, "addSubview:", self->_platterContainerView);
  v14 = self->_platterContainerView;
  v99 = 0u;
  v100 = 0u;
  v98 = 0u;
  -[UITargetedPreview target](self->_targetedDropPreview, "target");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "transform");
  }
  else
  {
    v99 = 0u;
    v100 = 0u;
    v98 = 0u;
  }

  -[UITargetedPreview view](self->_targetedDropPreview, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITargetedDragPreview _duiPreview](self->_targetedDropPreview, "_duiPreview");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[UITargetedPreview parameters](self->_targetedDropPreview, "parameters");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidesSourceView:", objc_msgSend(v20, "hidesSourceViewDuringDropAnimation"));

  }
  else
  {
    objc_msgSend(v18, "setHidesSourceView:", 1);
  }

  objc_msgSend(v17, "window");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    -[UITargetedPreview target](self->_targetedDropPreview, "target");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "container");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v17);

    objc_msgSend(v17, "setAlpha:", 0.0);
  }
  v24 = -[_UIPlatterView initWithDUIPreview:]([_UIPlatterView alloc], "initWithDUIPreview:", v18);
  appPlatterView = self->_appPlatterView;
  self->_appPlatterView = v24;

  -[_UIPlatterView setTransformAppliedExternally:](self->_appPlatterView, "setTransformAppliedExternally:", 1);
  -[_UIPlatterView setSourceView:](self->_appPlatterView, "setSourceView:", v17);
  -[_DUIVisibleDroppedItem rotation](self->_droppedItem, "rotation");
  -[_UIPlatterView setStackRotation:](self->_appPlatterView, "setStackRotation:");
  droppedItem = self->_droppedItem;
  if (droppedItem)
  {
    -[_DUIVisibleDroppedItem appliedTransform](droppedItem, "appliedTransform");
  }
  else
  {
    v96 = 0u;
    v97 = 0u;
    v95 = 0u;
  }
  v27 = self->_appPlatterView;
  v94[0] = v95;
  v94[1] = v96;
  v94[2] = v97;
  -[_UIPlatterView setAppliedTransform:](v27, "setAppliedTransform:", v94);
  if (objc_msgSend(v18, "previewMode") != 2)
  {
    -[UIView setAlpha:](self->_appPlatterView, "setAlpha:", 0.0);
    -[_UIPlatterView setLifted:](self->_appPlatterView, "setLifted:", 1);
  }
  v28 = self->_appPlatterView;

  if ((unint64_t)(-[_UIDragSetDownItemAnimation previewMode](self, "previewMode") - 3) < 2
    || -[UITargetedPreview _isDefaultPreview](self->_targetedDropPreview, "_isDefaultPreview"))
  {
    -[UITargetedDragPreview _duiPreview](self->_targetedDropPreview, "_duiPreview");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stackAlpha");
    -[UIView setAlpha:](v28, "setAlpha:");

    -[_UIPlatterView setLifted:](v28, "setLifted:", 1);
    -[_UIPlatterView setConstrainSize:](v28, "setConstrainSize:", -[_DUIVisibleDroppedItem constrainSize](self->_droppedItem, "constrainSize"));
    if (-[UITargetedPreview _isDefaultPreview](self->_targetedDropPreview, "_isDefaultPreview"))
    {
      -[_DUIVisibleDroppedItem preview](self->_droppedItem, "preview");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "shadowProperties");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v31, "copy");

      if (objc_msgSend(v32, "shadowType") == 1)
      {
        -[_DUIVisibleDroppedItem createSnapshotView](self->_droppedItem, "createSnapshotView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "set_localShadowView:", v33);

      }
      -[_UIPlatterView setShadowProperties:](v28, "setShadowProperties:", v32);

    }
    v34 = 0;
  }
  else
  {
    v35 = -[_UIPlatterView initWithDroppedItem:]([_UIPlatterView alloc], "initWithDroppedItem:", self->_droppedItem);
    druidPlatterView = self->_druidPlatterView;
    self->_druidPlatterView = v35;

    -[_UIPlatterView setTransformAppliedExternally:](self->_druidPlatterView, "setTransformAppliedExternally:", 1);
    v34 = self->_druidPlatterView;
  }
  -[_UIPlatterContainerView setSource:](self->_platterContainerView, "setSource:", v34);
  -[_UIPlatterContainerView setTarget:](self->_platterContainerView, "setTarget:", v28);
  memset(&v93, 0, sizeof(v93));
  if (v34)
  {
    v37 = v34;
LABEL_26:
    -[_UIPlatterView targetTransform](v37, "targetTransform");
    goto LABEL_27;
  }
  if (v28)
  {
    v37 = v28;
    goto LABEL_26;
  }
  memset(&v92, 0, sizeof(v92));
LABEL_27:
  CATransform3DGetAffineTransform(&v93, &v92);
  location = v93;
  -[_UIPlatterContainerView applyTransform:withSize:](v14, "applyTransform:withSize:", &location, v9, v11);
  -[UITargetedDragPreview _previewContainer](self->_targetedDropPreview, "_previewContainer");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    -[_DUIVisibleDroppedItem imageComponent](self->_droppedItem, "imageComponent");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UITargetedPreview _isDefaultPreview](self->_targetedDropPreview, "_isDefaultPreview")
      && (objc_msgSend(v39, "representsPortal") & 1) == 0)
    {
      v41 = [_UIDragSlotHostingView alloc];
      objc_msgSend(v39, "frame");
      v43 = v42;
      v45 = v44;
      v47 = v46;
      v49 = v48;
      objc_msgSend(v39, "size3D");
      v40 = -[_UIDragSlotHostingView initWithFrame:contentSize:slotID:](v41, "initWithFrame:contentSize:slotID:", objc_msgSend(v39, "slotID"), v43, v45, v47, v49, v50, v51, v52);
    }
    else
    {
      v40 = 0;
    }
    -[_UIPlatterContainerView installPreviewContainer:overrideSourceView:](v14, "installPreviewContainer:overrideSourceView:", v38, v40);
    ++self->_animationCount;

  }
  v70 = (void *)v38;
  if (-[_UIDragSetDownItemAnimation needsReparenting](self, "needsReparenting"))
    -[_UIDragSetDownItemAnimation reparentRetargetingContainerViewInTargetContainer](self, "reparentRetargetingContainerViewInTargetContainer");
  objc_initWeak((id *)&location, self);
  v53 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke;
  aBlock[3] = &unk_1E16B3F40;
  objc_copyWeak(&v90, (id *)&location);
  v54 = _Block_copy(aBlock);
  positionHandler = self->_positionHandler;
  self->_positionHandler = v54;

  v84[0] = v53;
  v84[1] = 3221225472;
  v84[2] = __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_2;
  v84[3] = &unk_1E16D5FE8;
  objc_copyWeak(&v88, (id *)&location);
  v56 = v28;
  v85 = v56;
  v86 = v34;
  v87 = v14;
  v57 = v14;
  v58 = v34;
  v59 = _Block_copy(v84);
  morphHandler = self->_morphHandler;
  self->_morphHandler = v59;

  v82[0] = v53;
  v82[1] = 3221225472;
  v82[2] = __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_3;
  v82[3] = &unk_1E16B1B28;
  v61 = v56;
  v83 = v61;
  v62 = _Block_copy(v82);
  midpointHandler = self->_midpointHandler;
  self->_midpointHandler = v62;

  v80[0] = v53;
  v80[1] = 3221225472;
  v80[2] = __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_4;
  v80[3] = &unk_1E16B1B28;
  v81 = v61;
  v64 = v61;
  v65 = _Block_copy(v80);
  nearCompletionHandler = self->_nearCompletionHandler;
  self->_nearCompletionHandler = v65;

  v73[0] = v53;
  v73[1] = 3221225472;
  v73[2] = __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_5;
  v73[3] = &unk_1E16EC4E8;
  objc_copyWeak(&v75, (id *)&location);
  v79 = v21 == 0;
  v74 = v17;
  v76 = v98;
  v77 = v99;
  v78 = v100;
  v67 = v17;
  v68 = _Block_copy(v73);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v68;

  objc_destroyWeak(&v75);
  objc_destroyWeak(&v88);
  objc_destroyWeak(&v90);
  objc_destroyWeak((id *)&location);

}

- (void)reparentRetargetingContainerViewInTargetContainer
{
  UIView *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  long double v34;
  long double v35;
  double RotationAngleFromViewToView;
  UIView *retargetingContainerView;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  _UIPortalView *v60;
  _UIPortalView *v61;
  _UIPortalView *retargetingContainerPortalView;
  _QWORD v63[5];
  CGAffineTransform v64;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v67;
  CGAffineTransform v68;
  CGAffineTransform v69;

  v3 = self->_dropContainerView;
  -[UITargetedPreview target](self->_targetedDropPreview, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bounds");
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "flipsHorizontalAxis");
  -[UIView layer](self->_retargetingContainerView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFlipsHorizontalAxis:", v7);

  objc_msgSend(v5, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentationLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentationLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "isDescendantOf:", v13);

  objc_msgSend(v5, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
  {
    objc_msgSend(v15, "presentationLayer");
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  objc_msgSend(v5, "_window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "convertPoint:toLayer:", v16, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v21 = v20;
  v23 = v22;

  objc_msgSend(v18, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "convertPoint:toLayer:", v16, 1.0, 0.0);
  v26 = v25;
  v28 = v27;

  objc_msgSend(v18, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "convertPoint:toLayer:", v16, 0.0, 1.0);
  v31 = v30;
  v33 = v32;

  v34 = hypot(v26 - v21, v28 - v23);
  v35 = hypot(v31 - v21, v33 - v23);
  memset(&v68, 0, sizeof(v68));
  CGAffineTransformMakeScale(&v68, v34, v35);
  RotationAngleFromViewToView = DUIPreviewGetRotationAngleFromViewToView(v5, v3, 1);
  memset(&v67, 0, sizeof(v67));
  CGAffineTransformMakeRotation(&v67, -RotationAngleFromViewToView);
  t1 = v68;
  t2 = v67;
  CGAffineTransformConcat(&v69, &t1, &t2);

  retargetingContainerView = self->_retargetingContainerView;
  v64 = v69;
  -[UIView setTransform:](retargetingContainerView, "setTransform:", &v64);
  objc_msgSend(v5, "addSubview:", self->_retargetingContainerView);
  -[UIView bounds](v3, "bounds");
  v40 = v39 + v38 * 0.5;
  v43 = v42 + v41 * 0.5;
  objc_msgSend(v5, "_window");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:toCoordinateSpace:](v3, "convertPoint:toCoordinateSpace:", v44, v40, v43);
  v46 = v45;
  v48 = v47;

  objc_msgSend(v5, "_window");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "layer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "convertPoint:toLayer:", v16, v46, v48);
  v52 = v51;
  v54 = v53;

  -[UIView setCenter:](self->_retargetingContainerView, "setCenter:", v52, v54);
  -[UITargetedPreview view](self->_targetedDropPreview, "view");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "layer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "zPosition");
  v58 = v57;
  -[UIView layer](self->_retargetingContainerView, "layer");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setZPosition:", v58);

  -[UIView setAlpha:](self->_retargetingContainerView, "setAlpha:", 0.0);
  v60 = [_UIPortalView alloc];
  -[UIView bounds](v3, "bounds");
  v61 = -[_UIPortalView initWithFrame:](v60, "initWithFrame:");
  -[_UIPortalView setMatchesTransform:](v61, "setMatchesTransform:", 1);
  -[_UIPortalView setMatchesAlpha:](v61, "setMatchesAlpha:", 0);
  -[_UIPortalView setMatchesPosition:](v61, "setMatchesPosition:", 1);
  -[_UIPortalView setSourceView:](v61, "setSourceView:", self->_platterContainerView);
  -[_UIPortalView setAllowsHitTesting:](v61, "setAllowsHitTesting:", -[_UIDragSetDownItemAnimation previewMode](self, "previewMode") == 4);
  -[UIView insertSubview:atIndex:](v3, "insertSubview:atIndex:", v61, 0);
  retargetingContainerPortalView = self->_retargetingContainerPortalView;
  self->_retargetingContainerPortalView = v61;

  if (-[_UIDragSetDownItemAnimation previewMode](self, "previewMode") == 4)
  {
    -[UIView setAlpha:](self->_retargetingContainerView, "setAlpha:", 1.0);
    -[_UIPortalView setHidden:](self->_retargetingContainerPortalView, "setHidden:", 1);
    self->_reparentingCrossfadeComplete = 1;
  }
  else
  {
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __80___UIDragSetDownItemAnimation_reparentRetargetingContainerViewInTargetContainer__block_invoke;
    v63[3] = &unk_1E16B1B28;
    v63[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v63);
  }

}

- (void)updateCurrentTargetFrame
{
  _UIPlatterView *updatedAppPlatterView;
  UITargetedDragPreview *updatedTargetedDropPreview;
  UITargetedDragPreview *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  _UIPlatterView *v24;

  updatedAppPlatterView = self->_updatedAppPlatterView;
  if (!updatedAppPlatterView)
    updatedAppPlatterView = self->_appPlatterView;
  v24 = updatedAppPlatterView;
  updatedTargetedDropPreview = self->_updatedTargetedDropPreview;
  if (!updatedTargetedDropPreview)
    updatedTargetedDropPreview = self->_targetedDropPreview;
  v5 = updatedTargetedDropPreview;
  -[UITargetedPreview target](v5, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "container");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "center");
  objc_msgSend(v7, "convertPoint:toCoordinateSpace:", self->_dropContainerView);
  v9 = v8;
  v11 = v10;

  v12 = -[_UIPlatterView constrainSize](v24, "constrainSize");
  -[UITargetedDragPreview _duiPreview](v5, "_duiPreview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v13, "scaledSize");
  else
    objc_msgSend(v13, "unscaledSize");
  v16 = v14;
  v17 = v15;

  objc_msgSend(v6, "container");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_currentScreenScale");
  UIRectCenteredAboutPointScale(0.0, 0.0, v16, v17, v9, v11, v19);
  self->_targetFrame.origin.x = v20;
  self->_targetFrame.origin.y = v21;
  self->_targetFrame.size.width = v22;
  self->_targetFrame.size.height = v23;

}

- (double)estimatedFractionCompleteOfAnimation
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v14;
  double v15;

  -[UIView layer](self->_platterContainerView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "position");
  v6 = v5;
  v8 = v7;

  __asm { FMOV            V2.2D, #0.5 }
  -[UIView convertPoint:toCoordinateSpace:](self->_dropContainerView, "convertPoint:toCoordinateSpace:", self->_retargetingContainerView, vaddq_f64((float64x2_t)self->_targetFrame.origin, vmulq_f64((float64x2_t)self->_targetFrame.size, _Q2)));
  return (self->_initialDistanceFromTargetFrame - sqrt((v14 - v6) * (v14 - v6) + (v15 - v8) * (v15 - v8)))
       / self->_initialDistanceFromTargetFrame;
}

- (void)performTrackingAnimations:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  UIViewSpringAnimationBehaviorDescribing *customSpringAnimationBehavior;
  _QWORD aBlock[4];
  id v13;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    if (_UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_21_0, (uint64_t)CFSTR("DNDSetDownDampingRatio")))v6 = 0.85;
    else
      v6 = *(double *)&qword_1ECD76B08;
    if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76B10, (uint64_t)CFSTR("DNDSetDownResponse")))
      v7 = 0.55;
    else
      v7 = *(double *)&qword_1ECD76B18;
    v8 = MEMORY[0x1E0C809B0];
    ++self->_animationCount;
    aBlock[0] = v8;
    aBlock[1] = 3221225472;
    aBlock[2] = __57___UIDragSetDownItemAnimation_performTrackingAnimations___block_invoke;
    aBlock[3] = &unk_1E16B1BF8;
    v13 = v5;
    v9 = _Block_copy(aBlock);
    if (self->_hasStartedSpringAnimation)
    {
      -[_UIDragSetDownItemAnimation animationCompletionHandler](self, "animationCompletionHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 1, v9, v10, v6, 0.0015, 1.0, 1.0, 0.0, 0.0);
    }
    else
    {
      customSpringAnimationBehavior = self->_customSpringAnimationBehavior;
      -[_UIDragSetDownItemAnimation animationCompletionHandler](self, "animationCompletionHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (customSpringAnimationBehavior)
        +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", customSpringAnimationBehavior, 1, v9, v10);
      else
        +[UIView _animateUsingSpringWithDampingRatio:response:tracking:initialDampingRatio:initialResponse:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:initialDampingRatio:initialResponse:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 1, v9, v10, v6, v7, v6, v7, 1.0, 1.0, 0.0, 0.0);
    }

  }
}

- (void)previewContainerAnimationDidComplete
{
  void (**v2)(id, uint64_t, _QWORD);

  -[_UIDragSetDownItemAnimation animationCompletionHandler](self, "animationCompletionHandler");
  v2 = (void (**)(id, uint64_t, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, 1, 0);

}

- (void)performSpringAnimations:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  UIViewSpringAnimationBehaviorDescribing *customSpringAnimationBehavior;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD aBlock[4];
  id v14;

  v4 = a3;
  if (v4)
  {
    v5 = MEMORY[0x1E0C809B0];
    ++self->_animationCount;
    aBlock[0] = v5;
    aBlock[1] = 3221225472;
    aBlock[2] = __55___UIDragSetDownItemAnimation_performSpringAnimations___block_invoke;
    aBlock[3] = &unk_1E16B1BF8;
    v14 = v4;
    v6 = _Block_copy(aBlock);
    customSpringAnimationBehavior = self->_customSpringAnimationBehavior;
    if (customSpringAnimationBehavior)
    {
      -[_UIDragSetDownItemAnimation animationCompletionHandler](self, "animationCompletionHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", customSpringAnimationBehavior, 0, v6, v8);
    }
    else
    {
      if (_UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_21_0, (uint64_t)CFSTR("DNDSetDownDampingRatio")))v9 = 0.85;
      else
        v9 = *(double *)&qword_1ECD76B08;
      if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76B10, (uint64_t)CFSTR("DNDSetDownResponse")))
        v10 = 0.55;
      else
        v10 = *(double *)&qword_1ECD76B18;
      if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76B20, (uint64_t)CFSTR("DNDSetDownTargetResponse")))v11 = 0.15;
      else
        v11 = *(double *)&qword_1ECD76B28;
      if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76B30, (uint64_t)CFSTR("DNDSetDownProjectionFactor")))v12 = 0.996;
      else
        v12 = *(double *)&qword_1ECD76B38;
      -[_UIDragSetDownItemAnimation animationCompletionHandler](self, "animationCompletionHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v6, v8, v9, v10, 0.0, 0.0, v11, v12);
    }

  }
}

- (id)animationCompletionHandler
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57___UIDragSetDownItemAnimation_animationCompletionHandler__block_invoke;
  aBlock[3] = &unk_1E16B2588;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

- (BOOL)needsReparenting
{
  if (-[_UIDragSetDownItemAnimation previewMode](self, "previewMode") == 2)
    return 0;
  if (-[_UIDragSetDownItemAnimation previewMode](self, "previewMode") == 3)
    return _UIApplicationIsExtension() ^ 1;
  return 1;
}

- (int64_t)previewMode
{
  UITargetedDragPreview *updatedTargetedDropPreview;
  void *v4;
  int64_t v5;

  updatedTargetedDropPreview = self->_updatedTargetedDropPreview;
  if (!updatedTargetedDropPreview)
    updatedTargetedDropPreview = self->_targetedDropPreview;
  -[UITargetedDragPreview _duiPreview](updatedTargetedDropPreview, "_duiPreview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "previewMode");

  return v5;
}

- (void)updateAnimationTargeting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double targetCenterZ;
  double v25;
  double v26;
  void (**nonAnimatedMidpointHandler)(void);
  void *v28;
  double v29;
  long double v30;
  double v31;
  long double v32;
  _UIPlatterContainerView *platterContainerView;
  void *v34;
  _UIPlatterContainerView *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[5];
  CGRect v40;

  if (!self->_reachedTarget && !self->_defaultAnimation)
  {
    if (self->_hasStartedSpringAnimation)
    {
      if (-[_UIDragSetDownItemAnimation needsReparenting](self, "needsReparenting")
        && self->_hasStartedSpringAnimation
        && !self->_reparentingCrossfadeComplete)
      {
        -[UITargetedPreview target](self->_targetedDropPreview, "target");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "container");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIView layer](self->_platterContainerView, "layer");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "presentationLayer");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          -[UIView layer](self->_platterContainerView, "layer");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "presentationLayer");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "position");
          v10 = v9;
          v12 = v11;

          -[UIView convertPoint:toCoordinateSpace:](self->_retargetingContainerView, "convertPoint:toCoordinateSpace:", v4, v10, v12);
          if (objc_msgSend(v4, "pointInside:withEvent:", 0))
          {
            self->_reparentingCrossfadeComplete = 1;
            v13 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_DNDSetDownReparentingCrossfadeDuration, (uint64_t)CFSTR("DNDSetDownReparentingCrossfadeDuration"));
            v14 = *(double *)&qword_1EDDA84E8;
            if (v13)
              v14 = 0.2;
            v38[4] = self;
            v39[0] = MEMORY[0x1E0C809B0];
            v39[1] = 3221225472;
            v39[2] = __55___UIDragSetDownItemAnimation_updateAnimationTargeting__block_invoke;
            v39[3] = &unk_1E16B1B28;
            v39[4] = self;
            v38[0] = MEMORY[0x1E0C809B0];
            v38[1] = 3221225472;
            v38[2] = __55___UIDragSetDownItemAnimation_updateAnimationTargeting__block_invoke_62;
            v38[3] = &unk_1E16B3FD8;
            +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v39, v38, v14);
          }
        }

      }
      x = self->_targetFrame.origin.x;
      y = self->_targetFrame.origin.y;
      width = self->_targetFrame.size.width;
      height = self->_targetFrame.size.height;
      targetCenterZ = self->_targetCenterZ;
      -[_UIDragSetDownItemAnimation updateCurrentTargetFrame](self, "updateCurrentTargetFrame");
      __asm { FMOV            V2.2D, #0.5 }
      *(float64x2_t *)&self->_center.x = vaddq_f64((float64x2_t)self->_targetFrame.origin, vmulq_f64((float64x2_t)self->_targetFrame.size, _Q2));
      self->_center.z = self->_targetCenterZ;
      if (self->_hasStartedSpringAnimation && (!self->_almostToTarget || !self->_midwayToTarget))
      {
        -[_UIDragSetDownItemAnimation estimatedFractionCompleteOfAnimation](self, "estimatedFractionCompleteOfAnimation");
        v26 = v25;
        if (!self->_midwayToTarget && v25 >= 0.5)
        {
          self->_midwayToTarget = 1;
          -[_UIDragSetDownItemAnimation performSpringAnimations:](self, "performSpringAnimations:", self->_midpointHandler);
          nonAnimatedMidpointHandler = (void (**)(void))self->_nonAnimatedMidpointHandler;
          if (nonAnimatedMidpointHandler)
            nonAnimatedMidpointHandler[2]();
        }
        if (v26 >= 0.9)
        {
          -[UIView _velocityForKey:](self->_platterContainerView, "_velocityForKey:", CFSTR("position"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "CGPointValue");
          v30 = v29;
          v32 = v31;

          if (hypot(v30, v32) < 175.0)
          {
            self->_almostToTarget = 1;
            -[_UIDragSetDownItemAnimation performSpringAnimations:](self, "performSpringAnimations:", self->_nearCompletionHandler);
          }
        }
      }
      v40.origin.x = x;
      v40.origin.y = y;
      v40.size.width = width;
      v40.size.height = height;
      if (!CGRectEqualToRect(v40, self->_targetFrame)
        || vabdd_f64(targetCenterZ, self->_targetCenterZ) > 2.22044605e-16)
      {
        -[_UIDragSetDownItemAnimation performTrackingAnimations:](self, "performTrackingAnimations:", self->_positionHandler);
      }
    }
    else
    {
      platterContainerView = self->_platterContainerView;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", self->_initialVelocity.var0.x, self->_initialVelocity.var0.y);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _setVelocity:forKey:](platterContainerView, "_setVelocity:forKey:", v34, CFSTR("position"));

      v35 = self->_platterContainerView;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", self->_initialTargetVelocity.var0.x, self->_initialTargetVelocity.var0.y);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _setTargetVelocity:forKey:](v35, "_setTargetVelocity:forKey:", v36, CFSTR("position"));

      -[UIView layer](self->_platterContainerView, "layer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v36) = objc_msgSend(v37, "hasBeenCommitted");

      if ((_DWORD)v36)
      {
        -[_UIDragSetDownItemAnimation performTrackingAnimations:](self, "performTrackingAnimations:", self->_positionHandler);
        -[_UIDragSetDownItemAnimation performSpringAnimations:](self, "performSpringAnimations:", self->_morphHandler);
        self->_hasStartedSpringAnimation = 1;
      }
    }
  }
}

- (void)dirtyTargetedDropPreview
{
  void *v3;
  id v4;

  if (!self->_defaultAnimation && !self->_almostToTarget)
  {
    -[_UIDragSetDownItemAnimation delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIDragSetDownAnimationTarget _setDownAnimation:updatedSetDownOfDragItem:preview:](self->_visualTarget, "_setDownAnimation:updatedSetDownOfDragItem:preview:", v4, self->_item, self->_targetedDropPreview);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDragSetDownItemAnimation updateTargetedDropPreview:](self, "updateTargetedDropPreview:", v3);

  }
}

- (void)updateTargetedDropPreview:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id nonAnimatedMidpointHandler;
  _UIPlatterView *v19;
  _UIPlatterView *updatedAppPlatterView;
  _QWORD v21[5];
  _QWORD aBlock[4];
  id v23;
  id v24;
  id location;
  CGRect v26;

  v5 = a3;
  v6 = v5;
  if (!self->_defaultAnimation && !self->_almostToTarget && !self->_updatedTargetedDropPreview)
  {
    if (self->_midwayToTarget)
    {
      v26.origin.x = _targetFrameForTargetedPreviewInContainerView(v5, self->_dropContainerView);
      if (!CGRectIsNull(v26))
      {
        objc_storeStrong((id *)&self->_updatedTargetedDropPreview, a3);
        objc_msgSend(v6, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_duiPreview");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "window");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setHidesSourceView:", v9 == 0);

        objc_msgSend(v7, "window");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          objc_msgSend(v6, "target");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "container");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView superview](self->_retargetingContainerView, "superview");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "target");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "container");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v12 == v13)
            objc_msgSend(v15, "_addSubview:positioned:relativeTo:", v7, -3, self->_retargetingContainerView);
          else
            objc_msgSend(v15, "addSubview:", v7);

          objc_msgSend(v7, "setAlpha:", 0.0);
          self->_updatedPreviewWasAdded = 1;
        }
        v19 = -[_UIPlatterView initWithDUIPreview:]([_UIPlatterView alloc], "initWithDUIPreview:", v8);
        -[_UIPlatterView setTransformAppliedExternally:](v19, "setTransformAppliedExternally:", 1);
        -[_UIPlatterView setSourceView:](v19, "setSourceView:", v7);
        -[UIView setAlpha:](v19, "setAlpha:", 0.0);
        -[_UIPlatterView setLifted:](v19, "setLifted:", 0);
        -[_UIPlatterView setShadowVisible:](v19, "setShadowVisible:", 0);
        -[_UIPlatterView setBackgroundVisible:](v19, "setBackgroundVisible:", 0);
        -[_UIPlatterContainerView setUpdatedTarget:](self->_platterContainerView, "setUpdatedTarget:", v19);

        updatedAppPlatterView = self->_updatedAppPlatterView;
        self->_updatedAppPlatterView = v19;

        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __57___UIDragSetDownItemAnimation_updateTargetedDropPreview___block_invoke_2;
        v21[3] = &unk_1E16B1B28;
        v21[4] = self;
        -[_UIDragSetDownItemAnimation performSpringAnimations:](self, "performSpringAnimations:", v21);

      }
    }
    else
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __57___UIDragSetDownItemAnimation_updateTargetedDropPreview___block_invoke;
      aBlock[3] = &unk_1E16B1500;
      objc_copyWeak(&v24, &location);
      v23 = v6;
      v17 = _Block_copy(aBlock);
      nonAnimatedMidpointHandler = self->_nonAnimatedMidpointHandler;
      self->_nonAnimatedMidpointHandler = v17;

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }

}

- (void)updateDroppedItem:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double z;
  void *v9;
  CGAffineTransform v10;
  CGAffineTransformComponents v11;

  v4 = a3;
  -[_UIDragSetDownItemAnimation _setCenterAndVelocityFromDroppedItem:](self, "_setCenterAndVelocityFromDroppedItem:", v4);
  objc_msgSend(v4, "rotation");
  v6 = v5;
  memset(&v11, 0, sizeof(v11));
  if (v4)
    objc_msgSend(v4, "appliedTransform");
  else
    memset(&v10, 0, sizeof(v10));
  CGAffineTransformDecompose(&v11, &v10);
  v7 = v6 + v11.rotation;
  -[UIView setCenter:](self->_platterContainerView, "setCenter:", self->_center.x, self->_center.y);
  -[_UIPlatterContainerView applyRotation:](self->_platterContainerView, "applyRotation:", v7);
  z = self->_center.z;
  -[UIView layer](self->_platterContainerView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setZPosition:", z);

  -[_UIPlatterView setStackRotation:](self->_appPlatterView, "setStackRotation:", v7);
  -[_UIPlatterView setStackRotation:](self->_druidPlatterView, "setStackRotation:", v7);
  -[UIView setCenter:](self->_defaultPlatterView, "setCenter:", self->_center.x, self->_center.y);

}

- (void)_setCenterAndVelocityFromDroppedItem:(id)a3
{
  id v4;
  float64x2_t v5;
  double v6;
  $E89D6745A9CD2F18EE16539BC75FC32A *p_initialVelocity;
  float64x2_t v13;
  __int128 v14;
  __int128 v15;

  v4 = a3;
  objc_msgSend(v4, "center");
  self->_center.x = v5.f64[0];
  self->_center.y = v6;
  self->_center.z = 0.0;
  p_initialVelocity = &self->_initialVelocity;
  if (v4)
  {
    objc_msgSend(v4, "velocity3D");
    *(_OWORD *)&p_initialVelocity->var0.x = v14;
    *(_OWORD *)&self->_initialVelocity.var0.z = v15;
    objc_msgSend(v4, "targetVelocity3D");
    v5 = *(float64x2_t *)&self->_center.x;
  }
  else
  {
    *(_OWORD *)&p_initialVelocity->var0.x = 0u;
    *(_OWORD *)&self->_initialVelocity.var0.z = 0u;
    v14 = 0u;
    v15 = 0u;
    v5.f64[1] = v6;
  }
  *(_OWORD *)&self->_initialTargetVelocity.var0.x = v14;
  *(_OWORD *)&self->_initialTargetVelocity.var0.z = v15;
  __asm { FMOV            V3.2D, #0.5 }
  v13 = vsubq_f64(vaddq_f64((float64x2_t)self->_targetFrame.origin, vmulq_f64((float64x2_t)self->_targetFrame.size, _Q3)), v5);
  self->_initialDistanceFromTargetFrame = sqrt(vaddvq_f64(vmulq_f64(v13, v13)));

}

- (UIDragItem)item
{
  return self->_item;
}

- (_DUIVisibleDroppedItem)droppedItem
{
  return self->_droppedItem;
}

- (BOOL)reachedTarget
{
  return self->_reachedTarget;
}

- (BOOL)done
{
  return self->_done;
}

- (UIViewSpringAnimationBehaviorDescribing)customSpringAnimationBehavior
{
  return self->_customSpringAnimationBehavior;
}

- (void)setCustomSpringAnimationBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_customSpringAnimationBehavior, a3);
}

- (_UIDragSetDownItemAnimationDelegate)delegate
{
  return (_UIDragSetDownItemAnimationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)dropContainerView
{
  return self->_dropContainerView;
}

- (void)setDropContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_dropContainerView, a3);
}

- (_UIDragSetDownAnimationTarget)visualTarget
{
  return self->_visualTarget;
}

- (void)setVisualTarget:(id)a3
{
  objc_storeStrong((id *)&self->_visualTarget, a3);
}

- (UITargetedDragPreview)targetedDropPreview
{
  return self->_targetedDropPreview;
}

- (void)setTargetedDropPreview:(id)a3
{
  objc_storeStrong((id *)&self->_targetedDropPreview, a3);
}

- (UITargetedDragPreview)updatedTargetedDropPreview
{
  return self->_updatedTargetedDropPreview;
}

- (void)setUpdatedTargetedDropPreview:(id)a3
{
  objc_storeStrong((id *)&self->_updatedTargetedDropPreview, a3);
}

- (CAPoint3D)center
{
  double x;
  double y;
  double z;
  CAPoint3D result;

  x = self->_center.x;
  y = self->_center.y;
  z = self->_center.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenter:(CAPoint3D)a3
{
  self->_center = a3;
}

- (double)initialDistanceFromTargetFrame
{
  return self->_initialDistanceFromTargetFrame;
}

- (void)setInitialDistanceFromTargetFrame:(double)a3
{
  self->_initialDistanceFromTargetFrame = a3;
}

- (double)targetCenterZ
{
  return self->_targetCenterZ;
}

- (void)setTargetCenterZ:(double)a3
{
  self->_targetCenterZ = a3;
}

- (CGRect)targetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetFrame.origin.x;
  y = self->_targetFrame.origin.y;
  width = self->_targetFrame.size.width;
  height = self->_targetFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTargetFrame:(CGRect)a3
{
  self->_targetFrame = a3;
}

- (BOOL)defaultAnimation
{
  return self->_defaultAnimation;
}

- (void)setDefaultAnimation:(BOOL)a3
{
  self->_defaultAnimation = a3;
}

- (BOOL)sourceAnimation
{
  return self->_sourceAnimation;
}

- (void)setSourceAnimation:(BOOL)a3
{
  self->_sourceAnimation = a3;
}

- (UIViewPropertyAnimator)propertyAnimator
{
  return self->_propertyAnimator;
}

- (void)setPropertyAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_propertyAnimator, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)hasStartedSpringAnimation
{
  return self->_hasStartedSpringAnimation;
}

- (void)setHasStartedSpringAnimation:(BOOL)a3
{
  self->_hasStartedSpringAnimation = a3;
}

- (BOOL)midwayToTarget
{
  return self->_midwayToTarget;
}

- (void)setMidwayToTarget:(BOOL)a3
{
  self->_midwayToTarget = a3;
}

- (BOOL)almostToTarget
{
  return self->_almostToTarget;
}

- (void)setAlmostToTarget:(BOOL)a3
{
  self->_almostToTarget = a3;
}

- (BOOL)reparentingCrossfadeComplete
{
  return self->_reparentingCrossfadeComplete;
}

- (void)setReparentingCrossfadeComplete:(BOOL)a3
{
  self->_reparentingCrossfadeComplete = a3;
}

- (BOOL)updatedPreviewWasAdded
{
  return self->_updatedPreviewWasAdded;
}

- (void)setUpdatedPreviewWasAdded:(BOOL)a3
{
  self->_updatedPreviewWasAdded = a3;
}

- (int)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(int)a3
{
  self->_animationCount = a3;
}

- ($1352053F64C5A5C6DA1735287371E169)initialVelocity
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  $1352053F64C5A5C6DA1735287371E169 result;

  v3 = *(_OWORD *)&self->_initialVelocity.var0.x;
  v4 = *(_OWORD *)&self->_initialVelocity.var0.z;
  *v2 = v3;
  v2[1] = v4;
  result.var0.var1 = *(double *)&v4;
  result.var0.var0 = *(double *)&v3;
  return result;
}

- (void)setInitialVelocity:(id)a3
{
  _OWORD *v3;
  __int128 v4;

  v4 = v3[1];
  *(_OWORD *)&self->_initialVelocity.var0.x = *v3;
  *(_OWORD *)&self->_initialVelocity.var0.z = v4;
}

- ($1352053F64C5A5C6DA1735287371E169)initialTargetVelocity
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  $1352053F64C5A5C6DA1735287371E169 result;

  v3 = *(_OWORD *)&self->_initialTargetVelocity.var0.x;
  v4 = *(_OWORD *)&self->_initialTargetVelocity.var0.z;
  *v2 = v3;
  v2[1] = v4;
  result.var0.var1 = *(double *)&v4;
  result.var0.var0 = *(double *)&v3;
  return result;
}

- (void)setInitialTargetVelocity:(id)a3
{
  _OWORD *v3;
  __int128 v4;

  v4 = v3[1];
  *(_OWORD *)&self->_initialTargetVelocity.var0.x = *v3;
  *(_OWORD *)&self->_initialTargetVelocity.var0.z = v4;
}

- (UIView)retargetingContainerView
{
  return self->_retargetingContainerView;
}

- (void)setRetargetingContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_retargetingContainerView, a3);
}

- (_UIPortalView)retargetingContainerPortalView
{
  return self->_retargetingContainerPortalView;
}

- (void)setRetargetingContainerPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_retargetingContainerPortalView, a3);
}

- (_UIPlatterView)appPlatterView
{
  return self->_appPlatterView;
}

- (void)setAppPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_appPlatterView, a3);
}

- (_UIPlatterView)updatedAppPlatterView
{
  return self->_updatedAppPlatterView;
}

- (void)setUpdatedAppPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_updatedAppPlatterView, a3);
}

- (_UIPlatterView)druidPlatterView
{
  return self->_druidPlatterView;
}

- (void)setDruidPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_druidPlatterView, a3);
}

- (_UIPlatterContainerView)platterContainerView
{
  return self->_platterContainerView;
}

- (void)setPlatterContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_platterContainerView, a3);
}

- (_UIPlatterView)defaultPlatterView
{
  return self->_defaultPlatterView;
}

- (void)setDefaultPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_defaultPlatterView, a3);
}

- (id)positionHandler
{
  return self->_positionHandler;
}

- (void)setPositionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)morphHandler
{
  return self->_morphHandler;
}

- (void)setMorphHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)midpointHandler
{
  return self->_midpointHandler;
}

- (void)setMidpointHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)nonAnimatedMidpointHandler
{
  return self->_nonAnimatedMidpointHandler;
}

- (void)setNonAnimatedMidpointHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (id)nearCompletionHandler
{
  return self->_nearCompletionHandler;
}

- (void)setNearCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nearCompletionHandler, 0);
  objc_storeStrong(&self->_nonAnimatedMidpointHandler, 0);
  objc_storeStrong(&self->_midpointHandler, 0);
  objc_storeStrong(&self->_morphHandler, 0);
  objc_storeStrong(&self->_positionHandler, 0);
  objc_storeStrong((id *)&self->_defaultPlatterView, 0);
  objc_storeStrong((id *)&self->_platterContainerView, 0);
  objc_storeStrong((id *)&self->_druidPlatterView, 0);
  objc_storeStrong((id *)&self->_updatedAppPlatterView, 0);
  objc_storeStrong((id *)&self->_appPlatterView, 0);
  objc_storeStrong((id *)&self->_retargetingContainerPortalView, 0);
  objc_storeStrong((id *)&self->_retargetingContainerView, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
  objc_storeStrong((id *)&self->_updatedTargetedDropPreview, 0);
  objc_storeStrong((id *)&self->_targetedDropPreview, 0);
  objc_storeStrong((id *)&self->_visualTarget, 0);
  objc_storeStrong((id *)&self->_dropContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customSpringAnimationBehavior, 0);
  objc_storeStrong((id *)&self->_droppedItem, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
