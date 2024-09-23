@implementation SBHPageManagementCellDragPreview

- (SBHPageManagementCellDragPreview)initWithReferenceIconView:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  SBHPageManagementCellDragPreview *v10;
  SBHPageManagementCellDragPreview *v11;
  objc_super v13;

  v5 = a3;
  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v5, "iconImageInfo");
  v13.receiver = self;
  v13.super_class = (Class)SBHPageManagementCellDragPreview;
  v10 = -[SBHPageManagementCellDragPreview initWithFrame:](&v13, sel_initWithFrame_, v6, v7, v8, v9);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_referenceIconView, a3);

  return v11;
}

- (id)_pageManagementCellView
{
  void *v2;
  void *v3;

  -[SBIconView customIconImageViewController](self->_iconView, "customIconImageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_pageManagementCellViewForIconImageViewController:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_pageManagementCellViewForIconImageViewController:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "pageManagementCellView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_configureIconViewWithReferenceIconView:(id)a3
{
  id v4;
  SBIconView *v5;
  void *v6;
  void *v7;
  void *v8;
  SBIconView *iconView;
  SBIconView *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = (SBIconView *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConfigurationOptions:", 4);
  -[SBIconView setCustomIconImageViewControllerPriority:](v5, "setCustomIconImageViewControllerPriority:", 3);
  -[SBHPageManagementCellDragPreview customIconImageViewController](self, "customIconImageViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_pageManagementCellViewForIconImageViewController:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "listView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ignoreNextWindowChange");

  -[SBIconView setOverrideCustomIconImageViewController:](v5, "setOverrideCustomIconImageViewController:", v12);
  objc_msgSend(v4, "configureMatchingIconView:", v5);
  -[SBIconView setEditing:](v5, "setEditing:", objc_msgSend(v4, "isEditing"));
  objc_msgSend(v4, "accessibilityTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconView setAccessibilityTintColor:](v5, "setAccessibilityTintColor:", v8);
  -[SBIconView setAllowsEditingAnimation:](v5, "setAllowsEditingAnimation:", 0);
  -[SBIconView setIconContentScalingEnabled:](v5, "setIconContentScalingEnabled:", 1);
  -[SBHPageManagementCellDragPreview bounds](self, "bounds");
  -[SBIconView setFrame:](v5, "setFrame:");
  -[SBIconView setIconContentScale:](v5, "setIconContentScale:", 1.1);
  iconView = self->_iconView;
  self->_iconView = v5;
  v10 = v5;

  -[SBHPageManagementCellDragPreview addSubview:](self, "addSubview:", v10);
  objc_msgSend(v6, "setListHighlighted:", 1);
  objc_msgSend(v6, "listView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumerateIconViewsUsingBlock:", &__block_literal_global_40);

}

void __76__SBHPageManagementCellDragPreview__configureIconViewWithReferenceIconView___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(a2, "customIconImageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = v2;
    v3 = objc_opt_class();
    v4 = v7;
    if (v3)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }
    v6 = v5;

    objc_msgSend(v6, "setWantsEditingDisplayStyle:animated:", 1, 0);
    v2 = v7;
  }

}

- (BOOL)iconCanShowCloseBox
{
  return 1;
}

- (SBIcon)icon
{
  return -[SBIconView icon](self->_iconView, "icon");
}

- (void)setIcon:(id)a3
{
  -[SBIconView setIcon:](self->_iconView, "setIcon:", a3);
}

- (void)setDragState:(unint64_t)a3
{
  SBIconView *referenceIconView;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;
  _QWORD v20[5];

  if (self->_dragState == a3)
    return;
  self->_dragState = a3;
  if (a3 < 2 || self->_iconView)
    goto LABEL_6;
  if (self->_referenceIconView)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __49__SBHPageManagementCellDragPreview_setDragState___block_invoke;
    v20[3] = &unk_1E8D84C50;
    v20[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v20);
    referenceIconView = self->_referenceIconView;
    self->_referenceIconView = 0;

LABEL_6:
    -[SBHPageManagementCellDragPreview _pageManagementCellView](self, "_pageManagementCellView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v6;
    if (a3 == 2)
    {
      objc_msgSend(v6, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = *(_DWORD *)"fff>";
      objc_msgSend(v7, "setShadowOpacity:", v8);

      objc_msgSend(v19, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setShadowRadius:", 14.0);

      objc_msgSend(v19, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setShadowOffset:", 0.0, 10.0);

      -[SBIconView setAllowsCloseBox:](self->_iconView, "setAllowsCloseBox:", 0);
    }
    else if (a3 - 3 <= 1)
    {
      -[SBIconView setIconContentScale:](self->_iconView, "setIconContentScale:", 1.0);
      objc_msgSend(v19, "setListHighlighted:", 0);
      objc_msgSend(v19, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = 0;
      objc_msgSend(v11, "setShadowOpacity:", v12);

      objc_msgSend(v19, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShadowRadius:", 0.0);

      objc_msgSend(v19, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

      objc_msgSend(v19, "listView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "model");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isHidden"))
        -[SBIconView setAllowsCloseBox:](self->_iconView, "setAllowsCloseBox:", 1);

    }
    -[SBHPageManagementCellDragPreview setNeedsLayout](self, "setNeedsLayout");
    -[SBHPageManagementCellDragPreview layoutIfNeeded](self, "layoutIfNeeded");

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_referenceIconView != nil"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBHPageManagementCellDragPreview setDragState:].cold.1(a2, (uint64_t)self, (uint64_t)v18);
  objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

uint64_t __49__SBHPageManagementCellDragPreview_setDragState___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "customIconImageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "customIconImageViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShowingContextMenu:", 0);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_configureIconViewWithReferenceIconView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456));
}

- (void)draggingSourceDroppedWithOperation:(unint64_t)a3
{
  if (-[NSHashTable count](self->_cleanupDelayAssertions, "count", a3))
    -[SBHPageManagementCellDragPreview setDelayingCleanup:](self, "setDelayingCleanup:", 1);
  else
    -[SBHPageManagementCellDragPreview handleCleanup](self, "handleCleanup");
}

- (void)cleanUp
{
  if (!-[SBHPageManagementCellDragPreview hasCleanedUp](self, "hasCleanedUp"))
    -[SBHPageManagementCellDragPreview handleCleanup](self, "handleCleanup");
}

- (void)handleCleanup
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(id, SBHPageManagementCellDragPreview *);

  -[SBHPageManagementCellDragPreview setCleanedUp:](self, "setCleanedUp:", 1);
  -[SBHPageManagementCellDragPreview cleanUpHandler](self, "cleanUpHandler");
  v6 = (void (**)(id, SBHPageManagementCellDragPreview *))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SBHPageManagementCellDragPreview customIconImageViewController](self, "customIconImageViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_pageManagementCellViewForIconImageViewController:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ignoreNextWindowChange");

    -[SBHPageManagementCellDragPreview setCleanUpHandler:](self, "setCleanUpHandler:", 0);
    v6[2](v6, self);

  }
}

- (void)dropDestinationAnimationCompleted
{
  void *v3;
  id v4;

  -[SBHPageManagementCellDragPreview iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIcon:", 0);

  -[SBHPageManagementCellDragPreview iconView](self, "iconView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

}

- (void)setIconViewCustomIconImageViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHPageManagementCellDragPreview setCustomIconImageViewController:](self, "setCustomIconImageViewController:", v4);
  -[SBHPageManagementCellDragPreview iconView](self, "iconView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverrideCustomIconImageViewController:", v4);

}

- (id)delayCleanUpForReason:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *cleanupDelayAssertions;
  SBHPageManagementCellDragPreviewDelayCleanupAssertion *v7;

  v4 = a3;
  if (!self->_cleanupDelayAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    cleanupDelayAssertions = self->_cleanupDelayAssertions;
    self->_cleanupDelayAssertions = v5;

  }
  v7 = -[SBHPageManagementCellDragPreviewDelayCleanupAssertion initWithDragPreview:reason:]([SBHPageManagementCellDragPreviewDelayCleanupAssertion alloc], "initWithDragPreview:reason:", self, v4);
  -[NSHashTable addObject:](self->_cleanupDelayAssertions, "addObject:", v7);

  return v7;
}

- (void)_removeDelayCleanupAssertion:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSHashTable containsObject:](self->_cleanupDelayAssertions, "containsObject:"))
  {
    -[NSHashTable removeObject:](self->_cleanupDelayAssertions, "removeObject:", v4);
    if (!-[NSHashTable count](self->_cleanupDelayAssertions, "count"))
    {
      if (-[SBHPageManagementCellDragPreview isDelayingCleanup](self, "isDelayingCleanup"))
        -[SBHPageManagementCellDragPreview handleCleanup](self, "handleCleanup");
    }
  }

}

- (unint64_t)dragState
{
  return self->_dragState;
}

- (BOOL)isFlocked
{
  return self->flocked;
}

- (void)setFlocked:(BOOL)a3
{
  self->flocked = a3;
}

- (BOOL)iconAllowsLabelArea
{
  return self->iconAllowsLabelArea;
}

- (void)setIconAllowsLabelArea:(BOOL)a3
{
  self->iconAllowsLabelArea = a3;
}

- (BOOL)iconAllowsAccessory
{
  return self->iconAllowsAccessory;
}

- (void)setIconAllowsAccessory:(BOOL)a3
{
  self->iconAllowsAccessory = a3;
}

- (void)setIconCanShowCloseBox:(BOOL)a3
{
  self->iconCanShowCloseBox = a3;
}

- (double)iconContentScale
{
  return self->iconContentScale;
}

- (void)setIconContentScale:(double)a3
{
  self->iconContentScale = a3;
}

- (BOOL)iconIsEditing
{
  return self->iconIsEditing;
}

- (void)setIconIsEditing:(BOOL)a3
{
  self->iconIsEditing = a3;
}

- (id)cleanUpHandler
{
  return self->_cleanupHandler;
}

- (void)setCleanUpHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (SBIconView)referenceIconView
{
  return self->_referenceIconView;
}

- (void)setReferenceIconView:(id)a3
{
  objc_storeStrong((id *)&self->_referenceIconView, a3);
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (SBIconViewCustomImageViewControlling)customIconImageViewController
{
  return self->_customIconImageViewController;
}

- (void)setCustomIconImageViewController:(id)a3
{
  objc_storeStrong((id *)&self->_customIconImageViewController, a3);
}

- (BOOL)isDelayingCleanup
{
  return self->_delayingCleanup;
}

- (void)setDelayingCleanup:(BOOL)a3
{
  self->_delayingCleanup = a3;
}

- (BOOL)hasCleanedUp
{
  return self->_cleanedUp;
}

- (void)setCleanedUp:(BOOL)a3
{
  self->_cleanedUp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customIconImageViewController, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_referenceIconView, 0);
  objc_storeStrong(&self->_cleanupHandler, 0);
  objc_storeStrong((id *)&self->_cleanupDelayAssertions, 0);
}

- (void)setDragState:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBHPageManagementCellDragPreview.m");
  v16 = 1024;
  v17 = 137;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1CFEF3000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
