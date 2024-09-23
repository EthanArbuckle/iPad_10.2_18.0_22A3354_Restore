@implementation PUExtendedToolbar

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUExtendedToolbar;
  -[PUExtendedToolbar layoutSubviews](&v10, sel_layoutSubviews);
  -[PUExtendedToolbar _containedToolbar](self, "_containedToolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUExtendedToolbar _accessoryViewContainer](self, "_accessoryViewContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *MEMORY[0x1E0C9D648];
  v9 = v5;
  v6 = v8;
  v7 = v5;
  -[PUExtendedToolbar bounds](self, "bounds");
  -[PUExtendedToolbar _getContainedToolbarFrame:accessoryViewContainerFrame:forBounds:](self, "_getContainedToolbarFrame:accessoryViewContainerFrame:forBounds:", &v8, &v6);
  objc_msgSend(v3, "pu_setCenterAndBoundsForFrameRect:", v8, v9);
  objc_msgSend(v4, "pu_setCenterAndBoundsForFrameRect:", v6, v7);

}

- (void)_updateViewsIfNeededWithAnimatorBlock:(id)a3
{
  void (**v4)(id, void (**)(_QWORD), void *);
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  double v30;
  void *v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void (**v51)(_QWORD);
  id v52;
  id v53;
  void (**v54)(void *, uint64_t);
  void *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  PUExtendedToolbar *v59;
  _QWORD aBlock[4];
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  CGRect v66;

  v4 = (void (**)(id, void (**)(_QWORD), void *))a3;
  v5 = -[PUExtendedToolbar _needsUpdateContainedToolbar](self, "_needsUpdateContainedToolbar");
  v6 = -[PUExtendedToolbar _needsUpdateAccessoryViewContainer](self, "_needsUpdateAccessoryViewContainer");
  v7 = v6;
  if (!v5 && !v6)
    goto LABEL_28;
  -[PUExtendedToolbar _setNeedsUpdateContainedToolbar:](self, "_setNeedsUpdateContainedToolbar:", 0);
  -[PUExtendedToolbar _setNeedsUpdateAccessoryViewContainer:](self, "_setNeedsUpdateAccessoryViewContainer:", 0);
  -[PUExtendedToolbar bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[PUExtendedToolbar _toolbarItems](self, "_toolbarItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUExtendedToolbar _accessoryView](self, "_accessoryView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUExtendedToolbar _containedToolbar](self, "_containedToolbar");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (!v5)
  {
    v21 = 0;
    v20 = 0;
    goto LABEL_17;
  }
  if (v18 && !objc_msgSend(v16, "count"))
  {
    -[PUExtendedToolbar _setContainedToolbar:](self, "_setContainedToolbar:", 0);
    v20 = v19;
    v19 = 0;
    if (v4)
    {
LABEL_7:
      objc_msgSend(v19, "snapshotViewAfterScreenUpdates:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      objc_msgSend(v21, "setFrame:");
      -[PUExtendedToolbar addSubview:](self, "addSubview:", v21);
      if (v19)
        goto LABEL_14;
      goto LABEL_12;
    }
  }
  else
  {
    v20 = 0;
    if (v4)
      goto LABEL_7;
  }
  v21 = 0;
  if (v19)
    goto LABEL_14;
LABEL_12:
  if (objc_msgSend(v16, "count"))
  {
    v22 = objc_alloc(MEMORY[0x1E0DC3E68]);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    v19 = (void *)objc_msgSend(v22, "initWithFrame:", 0.0, 0.0);

    objc_msgSend(v19, "setBarStyle:", -[PUExtendedToolbar barStyle](self, "barStyle"));
    -[PUExtendedToolbar tintColor](self, "tintColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTintColor:", v24);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v25);

    v26 = objc_alloc_init(MEMORY[0x1E0DC3870]);
    objc_msgSend(v19, "setBackgroundImage:forToolbarPosition:barMetrics:", v26, 0, 0);

    v27 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBackgroundColor:", v28);

    objc_msgSend(v19, "_setBackgroundView:", v27);
    v29 = objc_alloc_init(MEMORY[0x1E0DC3870]);
    objc_msgSend(v19, "setShadowImage:forToolbarPosition:", v29, 0);

    LODWORD(v30) = 1148846080;
    objc_msgSend(v19, "setContentCompressionResistancePriority:forAxis:", 1, v30);
    -[PUExtendedToolbar _setContainedToolbar:](self, "_setContainedToolbar:", v19);

    if (v19)
    {
LABEL_14:
      objc_msgSend(v19, "setItems:", v16);
      objc_msgSend(v19, "setAlpha:", 0.0);
      objc_msgSend(v19, "superview");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
        -[PUExtendedToolbar addSubview:](self, "addSubview:", v19);
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_17:
  v55 = v17;
  if (v7)
  {
    if (v17)
    {
      v32 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v66.origin.x = v9;
      v66.origin.y = v11;
      v66.size.width = v13;
      v66.size.height = v15;
      objc_msgSend(v32, "setFrame:", v9, CGRectGetMinY(v66), v13, v15, v17);
      objc_msgSend(v32, "setAlpha:", 0.0);
      v33 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v34 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v35 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      -[PUExtendedToolbar _accessoryViewTopOutset](self, "_accessoryViewTopOutset");
      v37 = v36;
      objc_msgSend(v32, "bounds");
      objc_msgSend(v17, "setFrame:", v33 + v38, v39 - v37, v40 - (v33 + v35), v41 - (v34 - v37));
      objc_msgSend(v17, "setAutoresizingMask:", 18);
      objc_msgSend(v32, "addSubview:", v17);
      -[PUExtendedToolbar addSubview:](self, "addSubview:", v32);
      if (v32)
      {
        -[PUExtendedToolbar _accessoryViewContainers](self, "_accessoryViewContainers");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addObject:", v32);

      }
    }
    else
    {
      v32 = 0;
    }
    v43 = v16;
    -[PUExtendedToolbar _accessoryViewContainer](self, "_accessoryViewContainer", v55);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUExtendedToolbar _setAccessoryViewContainer:](self, "_setAccessoryViewContainer:", v32);
  }
  else
  {
    v43 = v16;
    v44 = 0;
    v32 = 0;
  }
  v45 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PUExtendedToolbar__updateViewsIfNeededWithAnimatorBlock___block_invoke;
  aBlock[3] = &unk_1E58A9328;
  v46 = v21;
  v61 = v46;
  v47 = v20;
  v62 = v47;
  v48 = v19;
  v63 = v48;
  v64 = v44;
  v65 = v32;
  v49 = v32;
  v50 = v44;
  v51 = (void (**)(_QWORD))_Block_copy(aBlock);
  v56[0] = v45;
  v56[1] = 3221225472;
  v56[2] = __59__PUExtendedToolbar__updateViewsIfNeededWithAnimatorBlock___block_invoke_2;
  v56[3] = &unk_1E589E760;
  v57 = v46;
  v58 = v47;
  v59 = self;
  v52 = v47;
  v53 = v46;
  v54 = (void (**)(void *, uint64_t))_Block_copy(v56);
  if (v4)
  {
    v4[2](v4, v51, v54);
  }
  else
  {
    v51[2](v51);
    v54[2](v54, 1);
  }

LABEL_28:
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGSize result;

  v22.receiver = self;
  v22.super_class = (Class)PUExtendedToolbar;
  -[PUExtendedToolbar sizeThatFits:](&v22, sel_sizeThatFits_, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[PUExtendedToolbar _setContainedToolbarHeight:](self, "_setContainedToolbarHeight:", v6);
  -[PUExtendedToolbar _containedToolbar](self, "_containedToolbar");
  v8 = objc_claimAutoreleasedReturnValue();
  -[PUExtendedToolbar _accessoryViewContainer](self, "_accessoryViewContainer");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8 | v9)
  {
    if (v8)
      v11 = v7 + 0.0;
    else
      v11 = 0.0;
    if (v9)
    {
      -[PUExtendedToolbar toolbarViewModel](self, "toolbarViewModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accessoryViewMaximumHeight");
      v14 = v13;

      if (v7 >= v14)
        v15 = v14;
      else
        v15 = v7;
      if (v14 <= 0.0)
        v15 = v7;
      v11 = v11 + v15;
    }
    -[PUExtendedToolbar toolbarViewModel](self, "toolbarViewModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "maximumHeight");
    v18 = v17;

    if (v11 >= v18)
      v19 = v18;
    else
      v19 = v11;
    if (v18 <= 0.0)
      v7 = v11;
    else
      v7 = v19;
  }

  v20 = v5;
  v21 = v7;
  result.height = v21;
  result.width = v20;
  return result;
}

- (UIToolbar)_containedToolbar
{
  return self->__containedToolbar;
}

- (UIView)_accessoryViewContainer
{
  return self->__accessoryViewContainer;
}

- (void)_setContainedToolbarHeight:(double)a3
{
  self->__containedToolbarHeight = a3;
}

- (void)_setNeedsUpdateContainedToolbar:(BOOL)a3
{
  self->__needsUpdateContainedToolbar = a3;
}

- (void)_setNeedsUpdateAccessoryViewContainer:(BOOL)a3
{
  self->__needsUpdateAccessoryViewContainer = a3;
}

- (BOOL)_needsUpdateContainedToolbar
{
  return self->__needsUpdateContainedToolbar;
}

- (BOOL)_needsUpdateAccessoryViewContainer
{
  return self->__needsUpdateAccessoryViewContainer;
}

void __59__PUExtendedToolbar__updateViewsIfNeededWithAnimatorBlock___block_invoke_2(id *a1, int a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "removeFromSuperview");
  objc_msgSend(a1[5], "removeFromSuperview");
  if (a2)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(a1[6], "_accessoryViewContainers", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
          objc_msgSend(a1[6], "_accessoryViewContainer");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10 != v11)
          {
            objc_msgSend(v10, "removeFromSuperview");
            objc_msgSend(a1[6], "_accessoryViewContainers");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "removeObject:", v10);

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

uint64_t __59__PUExtendedToolbar__updateViewsIfNeededWithAnimatorBlock___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "setAlpha:", 0.0);
  objc_msgSend(a1[5], "setAlpha:", 0.0);
  objc_msgSend(a1[6], "setAlpha:", 1.0);
  objc_msgSend(a1[7], "setAlpha:", 0.0);
  return objc_msgSend(a1[8], "setAlpha:", 1.0);
}

- (NSArray)_toolbarItems
{
  return self->__toolbarItems;
}

- (void)_setAccessoryViewContainer:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->__accessoryViewContainer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__accessoryViewContainer, a3);
    -[PUExtendedToolbar _invalidateSize](self, "_invalidateSize");
    v5 = v6;
  }

}

- (void)_getContainedToolbarFrame:(CGRect *)a3 accessoryViewContainerFrame:(CGRect *)a4 forBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  CGSize size;
  CGSize v18;
  CGRect v19;
  CGRect slice;
  CGRect v21;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  slice = a5;
  v19 = a5;
  -[PUExtendedToolbar _containedToolbar](self, "_containedToolbar");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PUExtendedToolbar _accessoryViewContainer](self, "_accessoryViewContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[PUExtendedToolbar _containedToolbarHeight](self, "_containedToolbarHeight");
      v16 = v15;
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      CGRectDivide(v21, &slice, &v19, v16, CGRectMaxYEdge);
    }
  }
  if (a3)
  {
    size = slice.size;
    a3->origin = slice.origin;
    a3->size = size;
  }
  if (a4)
  {
    v18 = v19.size;
    a4->origin = v19.origin;
    a4->size = v18;
  }
}

- (UIView)_accessoryView
{
  return self->__accessoryView;
}

- (NSMutableSet)_accessoryViewContainers
{
  return self->__accessoryViewContainers;
}

- (void)setToolbarViewModel:(id)a3 withAnimatorBlock:(id)a4
{
  PUToolbarViewModel *v7;
  PUToolbarViewModel *toolbarViewModel;
  id v9;
  _QWORD v10[5];

  v7 = (PUToolbarViewModel *)a3;
  toolbarViewModel = self->_toolbarViewModel;
  if (toolbarViewModel != v7)
  {
    v9 = a4;
    -[PUViewModel unregisterChangeObserver:](toolbarViewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_toolbarViewModel, a3);
    -[PUViewModel registerChangeObserver:](self->_toolbarViewModel, "registerChangeObserver:", self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__PUExtendedToolbar_setToolbarViewModel_withAnimatorBlock___block_invoke;
    v10[3] = &unk_1E58ABD10;
    v10[4] = self;
    -[PUExtendedToolbar _performChanges:withAnimatorBlock:](self, "_performChanges:withAnimatorBlock:", v10, v9);

  }
}

- (void)_performChanges:(id)a3 withAnimatorBlock:(id)a4
{
  void (**v7)(_QWORD);
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[16];

  v7 = (void (**)(_QWORD))a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUExtendedToolbar.m"), 211, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeBlock"));

  }
  v9 = -[PUExtendedToolbar _numberOfNestedChanges](self, "_numberOfNestedChanges");
  -[PUExtendedToolbar _setNumberOfNestedChanges:](self, "_setNumberOfNestedChanges:", v9 + 1);
  if (v8 && v9 >= 1)
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEFAULT, "animatorBlock ignored for nested PUExtendedToolbar change", buf, 2u);
    }

  }
  v7[2](v7);
  -[PUExtendedToolbar _setNumberOfNestedChanges:](self, "_setNumberOfNestedChanges:", v9);
  if (!v9)
    -[PUExtendedToolbar _updateIfNeededWithAnimatorBlock:](self, "_updateIfNeededWithAnimatorBlock:", v8);

}

- (void)_setNumberOfNestedChanges:(int64_t)a3
{
  self->__numberOfNestedChanges = a3;
}

uint64_t __59__PUExtendedToolbar_setToolbarViewModel_withAnimatorBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateToolbarItems");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAccessoryView");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAccessoryViewTopOutset");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateContainedToolbar");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAccessoryViewContainer");
}

- (void)_assertInsideUpdate
{
  id v4;

  if (!-[PUExtendedToolbar _isUpdating](self, "_isUpdating"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUExtendedToolbar.m"), 235, CFSTR("not withing update"));

  }
}

- (void)_setNeedsUpdate
{
  id v4;

  if (!-[PUExtendedToolbar _isUpdating](self, "_isUpdating")
    && -[PUExtendedToolbar _numberOfNestedChanges](self, "_numberOfNestedChanges") <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUExtendedToolbar.m"), 267, CFSTR("not within an update or change block"));

  }
}

- (BOOL)_isUpdating
{
  return self->__isUpdating;
}

- (int64_t)_numberOfNestedChanges
{
  return self->__numberOfNestedChanges;
}

- (void)_updateAccessoryTopOutsetViewIfNeeded
{
  void *v3;
  double v4;
  double v5;

  if (-[PUExtendedToolbar _needsUpdateAccessoryViewTopOutset](self, "_needsUpdateAccessoryViewTopOutset"))
  {
    -[PUExtendedToolbar _setNeedsUpdateAccessoryViewTopOutset:](self, "_setNeedsUpdateAccessoryViewTopOutset:", 0);
    -[PUExtendedToolbar toolbarViewModel](self, "toolbarViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessoryViewTopOutset");
    v5 = v4;

    -[PUExtendedToolbar _setAccessoryViewTopOutset:](self, "_setAccessoryViewTopOutset:", v5);
  }
}

- (void)_updateIfNeededWithAnimatorBlock:(id)a3
{
  _BOOL8 v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[PUExtendedToolbar _needsUpdate](self, "_needsUpdate"))
  {
    v5 = -[PUExtendedToolbar _isUpdating](self, "_isUpdating");
    -[PUExtendedToolbar _setUpdating:](self, "_setUpdating:", 1);
    -[PUExtendedToolbar _updateToolbarItemsIfNeeded](self, "_updateToolbarItemsIfNeeded");
    -[PUExtendedToolbar _updateAccessoryViewIfNeeded](self, "_updateAccessoryViewIfNeeded");
    -[PUExtendedToolbar _updateAccessoryTopOutsetViewIfNeeded](self, "_updateAccessoryTopOutsetViewIfNeeded");
    -[PUExtendedToolbar _updateViewsIfNeededWithAnimatorBlock:](self, "_updateViewsIfNeededWithAnimatorBlock:", v7);
    -[PUExtendedToolbar _setUpdating:](self, "_setUpdating:", v5);
    if (-[PUExtendedToolbar _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUExtendedToolbar.m"), 251, CFSTR("updates still needed after an update cycle"));

    }
  }

}

- (void)_setUpdating:(BOOL)a3
{
  self->__isUpdating = a3;
}

- (BOOL)_needsUpdate
{
  return -[PUExtendedToolbar _needsUpdateToolbarItems](self, "_needsUpdateToolbarItems")
      || -[PUExtendedToolbar _needsUpdateAccessoryView](self, "_needsUpdateAccessoryView")
      || -[PUExtendedToolbar _needsUpdateAccessoryViewTopOutset](self, "_needsUpdateAccessoryViewTopOutset")
      || -[PUExtendedToolbar _needsUpdateContainedToolbar](self, "_needsUpdateContainedToolbar")
      || -[PUExtendedToolbar _needsUpdateAccessoryViewContainer](self, "_needsUpdateAccessoryViewContainer");
}

- (BOOL)_needsUpdateToolbarItems
{
  return self->__needsUpdateToolbarItems;
}

- (BOOL)_needsUpdateAccessoryViewTopOutset
{
  return self->__needsUpdateAccessoryViewTopOutset;
}

- (void)_updateToolbarItemsIfNeeded
{
  void *v3;
  id v4;

  if (-[PUExtendedToolbar _needsUpdateToolbarItems](self, "_needsUpdateToolbarItems"))
  {
    -[PUExtendedToolbar _setNeedsUpdateToolbarItems:](self, "_setNeedsUpdateToolbarItems:", 0);
    -[PUExtendedToolbar toolbarViewModel](self, "toolbarViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "toolbarItems");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[PUExtendedToolbar _setToolbarItems:](self, "_setToolbarItems:", v4);
  }
}

- (void)_updateAccessoryViewIfNeeded
{
  void *v3;
  id v4;

  if (-[PUExtendedToolbar _needsUpdateAccessoryView](self, "_needsUpdateAccessoryView"))
  {
    -[PUExtendedToolbar _setNeedsUpdateAccessoryView:](self, "_setNeedsUpdateAccessoryView:", 0);
    -[PUExtendedToolbar toolbarViewModel](self, "toolbarViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessoryView");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[PUExtendedToolbar _setAccessoryView:](self, "_setAccessoryView:", v4);
  }
}

- (PUToolbarViewModel)toolbarViewModel
{
  return self->_toolbarViewModel;
}

- (BOOL)_needsUpdateAccessoryView
{
  return self->__needsUpdateAccessoryView;
}

- (void)_setToolbarItems:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *toolbarItems;
  NSArray *v8;

  v8 = (NSArray *)a3;
  -[PUExtendedToolbar _assertInsideUpdate](self, "_assertInsideUpdate");
  v4 = v8;
  if (self->__toolbarItems != v8)
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:");
    v4 = v8;
    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      toolbarItems = self->__toolbarItems;
      self->__toolbarItems = v6;

      -[PUExtendedToolbar _invalidateContainedToolbar](self, "_invalidateContainedToolbar");
      v4 = v8;
    }
  }

}

- (void)_setAccessoryViewTopOutset:(double)a3
{
  -[PUExtendedToolbar _assertInsideUpdate](self, "_assertInsideUpdate");
  if (self->__accessoryViewTopOutset != a3)
  {
    self->__accessoryViewTopOutset = a3;
    -[PUExtendedToolbar _invalidateAccessoryViewContainer](self, "_invalidateAccessoryViewContainer");
  }
}

- (void)_setAccessoryView:(id)a3
{
  UIView *v5;

  v5 = (UIView *)a3;
  -[PUExtendedToolbar _assertInsideUpdate](self, "_assertInsideUpdate");
  if (self->__accessoryView != v5)
  {
    objc_storeStrong((id *)&self->__accessoryView, a3);
    -[PUExtendedToolbar _invalidateAccessoryViewContainer](self, "_invalidateAccessoryViewContainer");
  }

}

- (void)_invalidateToolbarItems
{
  -[PUExtendedToolbar _setNeedsUpdateToolbarItems:](self, "_setNeedsUpdateToolbarItems:", 1);
  -[PUExtendedToolbar _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_setNeedsUpdateToolbarItems:(BOOL)a3
{
  self->__needsUpdateToolbarItems = a3;
}

- (void)_invalidateContainedToolbar
{
  -[PUExtendedToolbar _setNeedsUpdateContainedToolbar:](self, "_setNeedsUpdateContainedToolbar:", 1);
  -[PUExtendedToolbar _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateAccessoryView
{
  -[PUExtendedToolbar _setNeedsUpdateAccessoryView:](self, "_setNeedsUpdateAccessoryView:", 1);
  -[PUExtendedToolbar _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_setNeedsUpdateAccessoryView:(BOOL)a3
{
  self->__needsUpdateAccessoryView = a3;
}

- (void)_invalidateAccessoryViewTopOutset
{
  -[PUExtendedToolbar _setNeedsUpdateAccessoryViewTopOutset:](self, "_setNeedsUpdateAccessoryViewTopOutset:", 1);
  -[PUExtendedToolbar _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_setNeedsUpdateAccessoryViewTopOutset:(BOOL)a3
{
  self->__needsUpdateAccessoryViewTopOutset = a3;
}

- (void)_invalidateAccessoryViewContainer
{
  -[PUExtendedToolbar _setNeedsUpdateAccessoryViewContainer:](self, "_setNeedsUpdateAccessoryViewContainer:", 1);
  -[PUExtendedToolbar _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (PUExtendedToolbar)initWithFrame:(CGRect)a3
{
  PUExtendedToolbar *v3;
  uint64_t v4;
  NSMutableSet *accessoryViewContainers;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUExtendedToolbar;
  v3 = -[PUExtendedToolbar initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 3);
    v4 = objc_claimAutoreleasedReturnValue();
    accessoryViewContainers = v3->__accessoryViewContainers;
    v3->__accessoryViewContainers = (NSMutableSet *)v4;

    -[PUExtendedToolbar layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupOpacity:", 0);

  }
  return v3;
}

- (BOOL)_shouldStretchDuringCrossfadeTransition
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[PUExtendedToolbar toolbarViewModel](self, "toolbarViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toolbarItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
  }
  else
  {
    -[PUExtendedToolbar toolbarViewModel](self, "toolbarViewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 != 0;

  }
  return v5;
}

- (void)setToolbarViewModel:(id)a3
{
  -[PUExtendedToolbar setToolbarViewModel:withAnimatorBlock:](self, "setToolbarViewModel:withAnimatorBlock:", a3, 0);
}

- (void)setBarStyle:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUExtendedToolbar;
  -[PUExtendedToolbar setBarStyle:](&v6, sel_setBarStyle_);
  -[PUExtendedToolbar _containedToolbar](self, "_containedToolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBarStyle:", a3);

}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUExtendedToolbar;
  -[PUExtendedToolbar tintColorDidChange](&v5, sel_tintColorDidChange);
  -[PUExtendedToolbar _containedToolbar](self, "_containedToolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUExtendedToolbar tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v4);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  y = a3.y;
  x = a3.x;
  v29 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[PUExtendedToolbar _containedToolbar](self, "_containedToolbar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUExtendedToolbar convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  v10 = v9;
  v12 = v11;

  -[PUExtendedToolbar _containedToolbar](self, "_containedToolbar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hitTest:withEvent:", v7, v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[PUExtendedToolbar _accessoryViewContainers](self, "_accessoryViewContainers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      while (2)
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v19), "subviews");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          -[PUExtendedToolbar convertPoint:toView:](self, "convertPoint:toView:", v21, x, y);
          objc_msgSend(v21, "hitTest:withEvent:", v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {

            goto LABEL_12;
          }
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v17)
          continue;
        break;
      }
    }

    v23.receiver = self;
    v23.super_class = (Class)PUExtendedToolbar;
    -[PUExtendedToolbar hitTest:withEvent:](&v23, sel_hitTest_withEvent_, v7, x, y);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  return v14;
}

- (double)_containedToolbarHeight
{
  double result;

  result = self->__containedToolbarHeight;
  if (result == 0.0)
  {
    -[PUExtendedToolbar sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    return self->__containedToolbarHeight;
  }
  return result;
}

- (void)_setContainedToolbar:(id)a3
{
  UIToolbar *v5;
  UIToolbar *v6;

  v5 = (UIToolbar *)a3;
  if (self->__containedToolbar != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__containedToolbar, a3);
    -[PUExtendedToolbar _invalidateSize](self, "_invalidateSize");
    v5 = v6;
  }

}

- (void)_invalidateSize
{
  id v2;

  -[PUExtendedToolbar toolbarViewModel](self, "toolbarViewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsToUpdateToolbarSize:", 1);

}

- (void)_performChanges:(id)a3
{
  -[PUExtendedToolbar _performChanges:withAnimatorBlock:](self, "_performChanges:withAnimatorBlock:", a3, 0);
}

- (void)_assertInsideChangeBlock
{
  id v4;

  if (-[PUExtendedToolbar _numberOfNestedChanges](self, "_numberOfNestedChanges") <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUExtendedToolbar.m"), 230, CFSTR("not within a change block"));

  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PUExtendedToolbar *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__PUExtendedToolbar_viewModel_didChange___block_invoke;
  v7[3] = &unk_1E58ABCA8;
  v8 = v5;
  v9 = self;
  v6 = v5;
  -[PUExtendedToolbar _performChanges:](self, "_performChanges:", v7);

}

- (double)_accessoryViewTopOutset
{
  return self->__accessoryViewTopOutset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accessoryViewContainers, 0);
  objc_storeStrong((id *)&self->__accessoryViewContainer, 0);
  objc_storeStrong((id *)&self->__containedToolbar, 0);
  objc_storeStrong((id *)&self->__accessoryView, 0);
  objc_storeStrong((id *)&self->__toolbarItems, 0);
  objc_storeStrong((id *)&self->_toolbarViewModel, 0);
}

uint64_t __41__PUExtendedToolbar_viewModel_didChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "toolbarItemsChanged"))
    objc_msgSend(*(id *)(a1 + 40), "_invalidateToolbarItems");
  if (objc_msgSend(*(id *)(a1 + 32), "accessoryViewChanged"))
    objc_msgSend(*(id *)(a1 + 40), "_invalidateAccessoryView");
  if (objc_msgSend(*(id *)(a1 + 32), "accessoryViewTopOutsetChanged"))
    objc_msgSend(*(id *)(a1 + 40), "_invalidateAccessoryViewTopOutset");
  if ((objc_msgSend(*(id *)(a1 + 32), "maximumHeightChanged") & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  result = objc_msgSend(*(id *)(a1 + 32), "accessoryViewMaximumHeightChanged");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  return result;
}

@end
