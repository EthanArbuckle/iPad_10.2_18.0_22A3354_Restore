@implementation _TVCollectionViewLockupCell

- (_TVCollectionViewLockupCell)initWithFrame:(CGRect)a3
{
  _TVCollectionViewLockupCell *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVCollectionViewLockupCell;
  v3 = -[TVContainerCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v3, sel__handleSelect);
    objc_msgSend(v4, "setAllowedPressTypes:", &unk_24EBCD3D0);
    objc_msgSend(v4, "setCancelsTouchesInView:", 0);
    -[_TVCollectionViewLockupCell addGestureRecognizer:](v3, "addGestureRecognizer:", v4);

  }
  return v3;
}

- (id)selectingView
{
  return self->__selectingView;
}

- (void)setDelegate:(id)a3
{
  TVCollectionViewLockupCellDelegate **p_delegate;
  id WeakRetained;
  id v6;
  $63075CFEFC7E993B43FD9062DD0C0247 *p_delegateFlags;
  id v8;
  id v9;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v6 = objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    self->_delegateFlags.respondsToDidUnfocus = objc_opt_respondsToSelector() & 1;

    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    p_delegateFlags->respondsToDidSelect = objc_opt_respondsToSelector() & 1;

    v9 = objc_loadWeakRetained((id *)p_delegate);
    p_delegateFlags->respondsToLayeredImageContainerLayerWithinCollectionViewCell = objc_opt_respondsToSelector() & 1;

  }
}

- (BOOL)_isFocusedOrParentOfFocusedHierarchyAndSelectingViewIsPoster
{
  void *v3;
  _TVCollectionViewLockupCell *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  char v9;

  objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusedItem");
  v4 = (_TVCollectionViewLockupCell *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (-[_TVCollectionViewLockupCell _selectingView](self, "_selectingView"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    if (v4 == self)
    {
      v9 = 1;
    }
    else
    {
      v7 = (void *)MEMORY[0x24BDF6A68];
      -[_TVCollectionViewLockupCell _selectingView](self, "_selectingView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "environment:containsEnvironment:", v8, v4);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v23 = *MEMORY[0x24BDAC8D0];
  if (-[_TVCollectionViewLockupCell _isFocusedOrParentOfFocusedHierarchyAndSelectingViewIsPoster](self, "_isFocusedOrParentOfFocusedHierarchyAndSelectingViewIsPoster"))
  {
    -[_TVCollectionViewLockupCell _selectingView](self, "_selectingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v8, "preferredFocusEnvironments", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v9, "addObject:", v15);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v12);
    }

  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)_TVCollectionViewLockupCell;
    -[_TVCollectionViewLockupCell focusItemsInRect:](&v21, sel_focusItemsInRect_, x, y, width, height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (UIEdgeInsets)_additionalFocusableContentInsets
{
  void *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat MinY;
  double v16;
  CGFloat v17;
  double MaxY;
  double MaxX;
  double v20;
  double v21;
  double MinX;
  CGFloat v23;
  double v24;
  CGFloat rect;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  UIEdgeInsets result;
  CGRect v39;

  if (!-[_TVCollectionViewLockupCell _isFocusedOrParentOfFocusedHierarchyAndSelectingViewIsPoster](self, "_isFocusedOrParentOfFocusedHierarchyAndSelectingViewIsPoster"))goto LABEL_6;
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  -[_TVCollectionViewLockupCell _selectingView](self, "_selectingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "cellMetrics");
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v26 = 0u;
  }

  -[_TVCollectionViewLockupCell bounds](self, "bounds");
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  v9 = v29.origin.x + *((double *)&v27 + 1);
  v10 = v29.origin.y + *(double *)&v27;
  v39.origin.x = v29.origin.x + *((double *)&v27 + 1);
  v39.origin.y = v29.origin.y + *(double *)&v27;
  v39.size.width = *(double *)&v26 - (*((double *)&v27 + 1) + *((double *)&v28 + 1));
  v39.size.height = *((double *)&v26 + 1) - (*(double *)&v27 + *(double *)&v28);
  if (!CGRectEqualToRect(v29, v39))
  {
    v30.origin.x = v9;
    v30.origin.y = v10;
    v30.size.width = *(double *)&v26 - (*((double *)&v27 + 1) + *((double *)&v28 + 1));
    v30.size.height = *((double *)&v26 + 1) - (*(double *)&v27 + *(double *)&v28);
    MinY = CGRectGetMinY(v30);
    v31.size.height = height;
    rect = height;
    v16 = MinY;
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v24 = v16 - CGRectGetMinY(v31);
    v32.origin.x = v9;
    v32.origin.y = v10;
    v32.size.width = *(double *)&v26 - (*((double *)&v27 + 1) + *((double *)&v28 + 1));
    v32.size.height = *((double *)&v26 + 1) - (*(double *)&v27 + *(double *)&v28);
    MinX = CGRectGetMinX(v32);
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = rect;
    v17 = CGRectGetMinX(v33);
    v34.size.width = width;
    v23 = width;
    v12 = MinX - v17;
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.height = rect;
    MaxY = CGRectGetMaxY(v34);
    v35.origin.x = v9;
    v35.origin.y = v10;
    v35.size.width = *(double *)&v26 - (*((double *)&v27 + 1) + *((double *)&v28 + 1));
    v35.size.height = *((double *)&v26 + 1) - (*(double *)&v27 + *(double *)&v28);
    v14 = MaxY - CGRectGetMaxY(v35);
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = v23;
    v36.size.height = rect;
    MaxX = CGRectGetMaxX(v36);
    v37.origin.x = v9;
    v37.origin.y = v10;
    v37.size.width = *(double *)&v26 - (*((double *)&v27 + 1) + *((double *)&v28 + 1));
    v37.size.height = *((double *)&v26 + 1) - (*(double *)&v27 + *(double *)&v28);
    v13 = MaxX - CGRectGetMaxX(v37);
    v11 = v24;
  }
  else
  {
LABEL_6:
    v11 = *MEMORY[0x24BDF7718];
    v12 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v14 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v13 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }
  v20 = v12;
  v21 = v14;
  result.right = v13;
  result.bottom = v21;
  result.left = v20;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)_focusableContentMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  v7.receiver = self;
  v7.super_class = (Class)_TVCollectionViewLockupCell;
  -[_TVCollectionViewLockupCell _focusableContentMargins](&v7, sel__focusableContentMargins);
  -[_TVCollectionViewLockupCell _additionalFocusableContentInsets](self, "_additionalFocusableContentInsets");
  UIEdgeInsetsAdd();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)_tvAllowsFocusInChildrenWhenFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TVCollectionViewLockupCell *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_TVCollectionViewLockupCell;
  -[TVContainerCollectionViewCell didUpdateFocusInContext:withAnimationCoordinator:](&v17, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, v7);
  objc_msgSend(v6, "nextFocusedView");
  v8 = (_TVCollectionViewLockupCell *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    objc_initWeak(&location, self);
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __80___TVCollectionViewLockupCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
    v14 = &unk_24EB854F8;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v7, "addCoordinatedFocusingAnimations:completion:", 0, &v11);
    -[_TVCollectionViewLockupCell superview](self, "superview", v11, v12, v13, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bringSubviewToFront:", self);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else if (self->_delegateFlags.respondsToDidUnfocus)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "collectionViewCellDidUnfocus:", self);

  }
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  TVAuxiliaryViewSelecting *selectingView;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_TVCollectionViewLockupCell;
  -[TVContainerCollectionViewCell prepareForReuse](&v15, sel_prepareForReuse);
  -[_TVCollectionViewLockupCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVMLUtilities disassociateIKViewElementsRecursivelyFromView:](TVMLUtilities, "disassociateIKViewElementsRecursivelyFromView:", v3);

  -[_TVCollectionViewLockupCell _selectingView](self, "_selectingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      v9 = MEMORY[0x24BDBD1A8];
      do
      {
        objc_msgSend(v8, "objectAtIndex:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObject:", v10);
        objc_msgSend(v10, "clearHasBeenCommitted");
        objc_msgSend(v10, "removeAllAnimations");
        objc_msgSend(v10, "sublayers");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
          v13 = v11;
        else
          v13 = v9;
        objc_msgSend(v8, "addObjectsFromArray:", v13);

      }
      while (objc_msgSend(v8, "count"));
    }

  }
  selectingView = self->__selectingView;
  self->__selectingView = 0;

}

- (id)layeredImageContainerLayer
{
  id WeakRetained;
  void *v4;

  if (self->_delegateFlags.respondsToLayeredImageContainerLayerWithinCollectionViewCell)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "layeredImageContainerLayerWithinCollectionViewCell:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a4;
  -[_TVCollectionViewLockupCell _selectingView](self, "_selectingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "_preferredConfigurationForFocusAnimation:inContext:", a3, v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_TVCollectionViewLockupCell layeredImageContainerLayer](self, "layeredImageContainerLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[_TVCollectionViewLockupCell layeredImageContainerLayer](self, "layeredImageContainerLayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "focusAnimationConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    v15.receiver = self;
    v15.super_class = (Class)_TVCollectionViewLockupCell;
    -[TVContainerCollectionViewCell _preferredConfigurationForFocusAnimation:inContext:](&v15, sel__preferredConfigurationForFocusAnimation_inContext_, a3, v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_6:

  return v10;
}

- (BOOL)_descendantsShouldHighlight
{
  return 0;
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  height = a3.height;
  width = a3.width;
  -[_TVCollectionViewLockupCell _selectingView](self, "_selectingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionMarginsForSize:", width, height);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (id)_selectingView
{
  TVAuxiliaryViewSelecting **p_selectingView;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  p_selectingView = &self->__selectingView;
  if (!self->__selectingView)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[_TVCollectionViewLockupCell contentView](self, "contentView", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v9, "conformsToProtocol:", &unk_25578CA30))
          {
            objc_storeStrong((id *)p_selectingView, v9);
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return *p_selectingView;
}

- (void)_handleSelect
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id WeakRetained;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->_delegateFlags.respondsToDidSelect)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "collectionViewCellDidSelect:", self);

  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[_TVCollectionViewLockupCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "didSelect");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)_TVCollectionViewLockupCell;
  -[UIView setHighlighted:](&v16, sel_setHighlighted_);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_TVCollectionViewLockupCell contentView](self, "contentView", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "setHighlighted:", v3);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }

}

- (TVCollectionViewLockupCellDelegate)delegate
{
  return (TVCollectionViewLockupCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__selectingView, 0);
}

@end
