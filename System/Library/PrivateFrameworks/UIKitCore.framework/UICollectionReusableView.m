@implementation UICollectionReusableView

- (UIEdgeInsets)_concreteDefaultLayoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  objc_super v7;
  UIEdgeInsets result;

  if (dyld_program_sdk_at_least() && (*(_WORD *)&self->_reusableViewFlags & 0x4000) != 0)
  {
    top = self->_defaultLayoutMargins.top;
    left = self->_defaultLayoutMargins.left;
    bottom = self->_defaultLayoutMargins.bottom;
    right = self->_defaultLayoutMargins.right;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UICollectionReusableView;
    -[UIView _concreteDefaultLayoutMargins](&v7, sel__concreteDefaultLayoutMargins);
  }
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)didMoveToSuperview
{
  objc_super v3;

  if ((*(_WORD *)&self->_reusableViewFlags & 0x800) == 0)
    objc_storeWeak((id *)&self->_collectionView, 0);
  v3.receiver = self;
  v3.super_class = (Class)UICollectionReusableView;
  -[UIView didMoveToSuperview](&v3, sel_didMoveToSuperview);
}

- (BOOL)_disableGroupOpacityInAnimations
{
  void *v2;
  BOOL v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_userInterfaceRenderingMode") == 2;

  return v3;
}

- (BOOL)_disableRasterizeInAnimations
{
  void *v2;
  BOOL v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_userInterfaceRenderingMode") == 2;

  return v3;
}

- (int64_t)_contentViewListStyleFromLayoutAttributes:(id)a3
{
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (_QWORD *)v3;
  if (!v3)
    goto LABEL_9;
  v5 = *(_QWORD *)(v3 + 16);
  if (v5 >= 5)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v11 = v4[2];
        v12 = 134217984;
        v13 = v11;
        _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Unhandled _UICollectionViewListLayoutAppearanceStyle (%ld)", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      v6 = _contentViewListStyleFromLayoutAttributes____s_category;
      if (!_contentViewListStyleFromLayoutAttributes____s_category)
      {
        v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v6, (unint64_t *)&_contentViewListStyleFromLayoutAttributes____s_category);
      }
      v7 = *(NSObject **)(v6 + 8);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      v8 = v7;
      v9 = v4[2];
      v12 = 134217984;
      v13 = v9;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Unhandled _UICollectionViewListLayoutAppearanceStyle (%ld)", (uint8_t *)&v12, 0xCu);
    }

LABEL_9:
    v5 = -1;
  }

  return v5;
}

- (void)_setLayoutAttributes:(id)a3
{
  -[UICollectionReusableView _setLayoutAttributes:force:](self, "_setLayoutAttributes:force:", a3, 0);
}

- (void)_setLayoutAttributes:(id)a3 force:(BOOL)a4
{
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  UICollectionViewLayoutAttributes *v12;
  UICollectionViewLayoutAttributes *layoutAttributes;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  _OWORD v39[8];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CGSize v48;
  CGSize v49;

  v7 = a3;
  if (a4
    || !-[UICollectionViewLayoutAttributes isEqual:](self->_layoutAttributes, "isEqual:", v7)
    || (objc_msgSend(v7, "alpha"), v9 = v8, -[UIView alpha](self, "alpha"), vabdd_f64(v9, v10) > 0.0001))
  {
    -[UICollectionViewLayoutAttributes size](self->_layoutAttributes, "size");
    -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)&self->_layoutAttributes->super.isa);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (UICollectionViewLayoutAttributes *)objc_msgSend(v7, "copy");
    layoutAttributes = self->_layoutAttributes;
    self->_layoutAttributes = v12;

    -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)&self->_layoutAttributes->super.isa);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionReusableView _setReuseIdentifier:](self, "_setReuseIdentifier:", v15);

    }
    -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionReusableView _applyListEnvironmentTraitOverridesUsingNewListAttributes:previousListAttributes:](self, "_applyListEnvironmentTraitOverridesUsingNewListAttributes:previousListAttributes:", v16, v11);

    objc_msgSend(v7, "center");
    -[UIView setCenter:](self, "setCenter:");
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(v7, "bounds");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      objc_msgSend(v7, "size");
      if (!_UISizeEqualToSizeWithPrecision(v22, v24, v25, v26, 0.0001))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v48.width = v22;
        v48.height = v24;
        NSStringFromCGSize(v48);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "size");
        NSStringFromCGSize(v49);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCell.m"), 338, CFSTR("UICollectionViewReusableView received malformed layout attributes. attributes.bounds.size (%@) and attributes.size (%@) must be equal. This is a client error. Layout attributes: %@\nView: %@"), v28, v29, v7, self);

      }
    }
    else
    {
      -[UIView bounds](self, "bounds");
      v18 = v30;
      v20 = v31;
      objc_msgSend(v7, "size");
      v22 = v32;
      v24 = v33;
    }
    -[UIView setBounds:](self, "setBounds:", v18, v20, v22, v24);
    objc_msgSend(v7, "alpha");
    -[UIView setAlpha:](self, "setAlpha:");
    if (v7)
    {
      objc_msgSend(v7, "transform3D");
    }
    else if ((dyld_program_sdk_at_least() & 1) != 0)
    {
      v34 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      v44 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      v45 = v34;
      v35 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      v46 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      v47 = v35;
      v36 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      v40 = *MEMORY[0x1E0CD2610];
      v41 = v36;
      v37 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      v42 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      v43 = v37;
    }
    else
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
    }
    v39[4] = v44;
    v39[5] = v45;
    v39[6] = v46;
    v39[7] = v47;
    v39[0] = v40;
    v39[1] = v41;
    v39[2] = v42;
    v39[3] = v43;
    -[UIView setTransform3D:](self, "setTransform3D:", v39);
    -[UICollectionReusableView _updateMaskingUsingAttributes:](self, "_updateMaskingUsingAttributes:", v7);
    -[UICollectionReusableView _updateMaskViewUsingAttributes:](self, "_updateMaskViewUsingAttributes:", v7);
    -[UICollectionReusableView _updateDefaultLayoutMarginsUsingAttributes:](self, "_updateDefaultLayoutMarginsUsingAttributes:", v7);
    -[UICollectionReusableView applyLayoutAttributes:](self, "applyLayoutAttributes:", v7);
    if (!-[UICollectionReusableView _isInUpdateAnimation](self, "_isInUpdateAnimation")
      && +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __55__UICollectionReusableView__setLayoutAttributes_force___block_invoke;
      v38[3] = &unk_1E16B3FD8;
      v38[4] = self;
      +[UIView _addCompletion:](UIView, "_addCompletion:", v38);
    }

  }
}

- (void)_updateDefaultLayoutMarginsUsingAttributes:(id)a3
{
  const UIEdgeInsets *v4;
  UIEdgeInsets *v5;
  __int16 reusableViewFlags;
  unsigned int v7;
  int v8;
  const UIEdgeInsets *v9;
  CGFloat *p_bottom;
  CGFloat *p_left;
  CGFloat *p_right;
  double top;
  double v14;
  double v15;
  double v16;
  __int16 v17;
  UIEdgeInsets *p_defaultLayoutMargins;
  const UIEdgeInsets *v19;
  CGFloat *v20;
  CGFloat *v21;
  CGFloat *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  const UIEdgeInsets *v27;

  v4 = (const UIEdgeInsets *)a3;
  v5 = (UIEdgeInsets *)v4;
  reusableViewFlags = (__int16)self->_reusableViewFlags;
  v7 = reusableViewFlags & 0x4000;
  if (v4)
    v8 = (LOWORD(v4[9].top) >> 9) & 1;
  else
    v8 = 0;
  if (v8 == v7 >> 14)
  {
    if ((reusableViewFlags & 0x4000) != 0)
    {
      if (v4)
      {
        v9 = &UIEdgeInsetsZero;
        p_bottom = &UIEdgeInsetsZero.bottom;
        p_left = &UIEdgeInsetsZero.left;
        if ((LOWORD(v4[9].top) & 0x200) != 0)
          p_right = &v4[10].right;
        else
          p_right = &UIEdgeInsetsZero.right;
        if ((LOWORD(v4[9].top) & 0x200) != 0)
        {
          p_left = &v4[10].left;
          p_bottom = &v4[10].bottom;
          v9 = v4 + 10;
        }
        top = v9->top;
        v14 = *p_bottom;
        v15 = *p_left;
        v16 = *p_right;
      }
      else
      {
        v15 = 0.0;
        v14 = 0.0;
        v16 = 0.0;
        top = 0.0;
      }
      v7 = self->_defaultLayoutMargins.left != v15;
      if (self->_defaultLayoutMargins.top != top)
        v7 = 1;
      if (self->_defaultLayoutMargins.right != v16)
        v7 = 1;
      if (self->_defaultLayoutMargins.bottom != v14)
        v7 = 1;
    }
  }
  else
  {
    v7 = 1;
  }
  if (v8)
    v17 = 0x4000;
  else
    v17 = 0;
  *(_WORD *)&self->_reusableViewFlags = v17 | reusableViewFlags & 0xBFFF;
  p_defaultLayoutMargins = &self->_defaultLayoutMargins;
  if (!v8)
  {
    *(_OWORD *)&p_defaultLayoutMargins->top = 0u;
    *(_OWORD *)&self->_defaultLayoutMargins.bottom = 0u;
    if (!v7)
      goto LABEL_34;
LABEL_33:
    v27 = v4;
    -[UIView _updateInferredLayoutMargins](self, "_updateInferredLayoutMargins");
    v5 = (UIEdgeInsets *)v27;
    goto LABEL_34;
  }
  if (v4)
  {
    v19 = &UIEdgeInsetsZero;
    v20 = &UIEdgeInsetsZero.bottom;
    v21 = &UIEdgeInsetsZero.left;
    if ((LOWORD(v4[9].top) & 0x200) != 0)
      v22 = &v4[10].right;
    else
      v22 = &UIEdgeInsetsZero.right;
    if ((LOWORD(v4[9].top) & 0x200) != 0)
    {
      v21 = &v4[10].left;
      v20 = &v4[10].bottom;
      v19 = v4 + 10;
    }
    v23 = v19->top;
    v24 = *v20;
    v25 = *v21;
    v26 = *v22;
  }
  else
  {
    v25 = 0.0;
    v24 = 0.0;
    v26 = 0.0;
    v23 = 0.0;
  }
  p_defaultLayoutMargins->top = v23;
  self->_defaultLayoutMargins.left = v25;
  self->_defaultLayoutMargins.bottom = v24;
  self->_defaultLayoutMargins.right = v26;
  if (v7)
    goto LABEL_33;
LABEL_34:

}

- (BOOL)_isInUpdateAnimation
{
  return self->_updateAnimationCount > 0;
}

- (void)_updateMaskViewUsingAttributes:(id)a3
{
  double *v4;
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
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _UICollectionViewMaskView *v21;
  uint64_t v22;
  uint64_t *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  _QWORD *v33;
  UICollectionReusableView *v34;
  uint64_t v35;

  v4 = (double *)a3;
  if (-[UICollectionViewLayoutAttributes _hasMaskViewFrame]((_BOOL8)v4))
  {
    -[UIView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v6 = v4[30];
      v7 = v4[31];
      v8 = v4[32];
      v9 = v4[33];
    }
    else
    {
      v7 = 0.0;
      v8 = 0.0;
      v9 = 0.0;
      v6 = 0.0;
    }
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v5, v6, v7, v8, v9);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[UICollectionReusableView _internalMaskView](self);
    v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);
      if (!v4)
        goto LABEL_22;
    }
    else
    {
      v21 = -[_UICollectionViewMaskView initWithFrame:]([_UICollectionViewMaskView alloc], "initWithFrame:", v11, v13, v15, v17);
      -[UICollectionReusableView _setInternalMaskView:](self, v21);

      if (!v4)
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    if (((_WORD)v4[36] & 0x400) != 0)
    {
      if (self->_updateAnimationCount < 1)
      {
        -[UICollectionReusableView _setInternalMaskView:](self, 0);
      }
      else
      {
        if (v19)
        {
          v22 = v19[52] + 1;
          v19[52] = v22;
        }
        else
        {
          v22 = 1;
        }
        v29 = MEMORY[0x1E0C809B0];
        v30 = 3221225472;
        v31 = __59__UICollectionReusableView__updateMaskViewUsingAttributes___block_invoke;
        v32 = &unk_1E16BCE30;
        v33 = v19;
        v34 = self;
        v35 = v22;
        v23 = &v29;
        if (self->_updateAnimationCount <= 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", sel__addUpdateAnimationCompletionBlock_, self, CFSTR("UICollectionViewCell.m"), 673, CFSTR("UIKit internal bug: Attempting to add an update animation completion block without an inflight animation: %@"), self, v29, v30, v31, v32);

        }
        -[UICollectionReusableView _updateAnimationCompletionBlocks](self);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = _Block_copy(v23);
          objc_msgSend(v24, "addObject:", v25);
        }
        else
        {
          v26 = (void *)MEMORY[0x1E0C99DE8];
          v25 = _Block_copy(v23);
          objc_msgSend(v26, "arrayWithObject:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setAssociatedObject(self, &_UpdateCompletionBlocksKey, v27, (void *)1);

        }
      }
    }
    goto LABEL_22;
  }
  -[UICollectionReusableView _internalMaskView](self);
  v20 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v20;
  if (v20 && !*(_QWORD *)(v20 + 416))
    -[UICollectionReusableView _setInternalMaskView:](self, 0);
LABEL_23:

}

- (_WORD)_internalMaskView
{
  if (a1)
  {
    if ((a1[236] & 0x80) == 0)
      return 0;
    -[UIView _safeMaskView](a1);
    a1 = (_WORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_preferredLayoutAttributesFittingAttributes:(id)a3 isAnimatingExistingView:(BOOL)a4
{
  id v6;
  void *v7;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  BOOL IsDiscrete;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  UICollectionReusableView *v44;
  uint64_t v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  *(_WORD *)&self->_reusableViewFlags |= 0xCu;
  -[UIView updateTraitsIfNeeded](self, "updateTraitsIfNeeded");
  kdebug_trace();
  -[UICollectionReusableView preferredLayoutAttributesFittingAttributes:](self, "preferredLayoutAttributesFittingAttributes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  kdebug_trace();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionReusableView _collectionView](self, "_collectionView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCell.m"), 757, CFSTR("Received nil preferred attributes from -preferredLayoutAttributesFittingAttributes: in view %@. Original attributes: %@. Collection view: %@"), self, v6, v31);

  }
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    v17 = UIPointRoundToScale(v9, v11, v16);
    v19 = v18;
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    v21 = UISizeRoundToScale(v13, v15, v20);
    v23 = v22;
    v24 = dyld_program_sdk_at_least();
    IsDiscrete = UIRectIsDiscrete(v17, v19, v21, v23);
    if (v24)
    {
      if (!IsDiscrete)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v46.origin.x = v9;
        v46.origin.y = v11;
        v46.size.width = v13;
        v46.size.height = v15;
        NSStringFromCGRect(v46);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v47.origin.x = v17;
        v47.origin.y = v19;
        v47.size.width = v21;
        v47.size.height = v23;
        NSStringFromCGRect(v47);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCell.m"), 776, CFSTR("Rounding frame (%@) from preferred layout attributes resulted in a frame with one or more invalid members (%@).\nLayout attributes: %@\nView: %@"), v27, v28, v7, self);

      }
    }
    else if (!IsDiscrete)
    {
      v32 = _preferredLayoutAttributesFittingAttributes_isAnimatingExistingView____s_category;
      if (!_preferredLayoutAttributesFittingAttributes_isAnimatingExistingView____s_category)
      {
        v32 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v32, (unint64_t *)&_preferredLayoutAttributesFittingAttributes_isAnimatingExistingView____s_category);
      }
      v33 = *(NSObject **)(v32 + 8);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = v33;
        v49.origin.x = v9;
        v49.origin.y = v11;
        v49.size.width = v13;
        v49.size.height = v15;
        NSStringFromCGRect(v49);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v50.origin.x = v17;
        v50.origin.y = v19;
        v50.size.width = v21;
        v50.size.height = v23;
        NSStringFromCGRect(v50);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v38 = v35;
        v39 = 2112;
        v40 = v36;
        v41 = 2112;
        v42 = v7;
        v43 = 2112;
        v44 = self;
        _os_log_impl(&dword_185066000, v34, OS_LOG_TYPE_ERROR, "Rounding frame (%@) from preferred layout attributes resulted in a frame with one or more invalid members (%@).\nLayout attributes: %@\nView: %@", buf, 0x2Au);

      }
    }
    v48.origin.x = v17;
    v48.origin.y = v19;
    v48.size.width = v21;
    v48.size.height = v23;
    v51.origin.x = v9;
    v51.origin.y = v11;
    v51.size.width = v13;
    v51.size.height = v15;
    if (!CGRectEqualToRect(v48, v51))
      objc_msgSend(v7, "setFrame:", v17, v19, v21, v23);
  }
  *(_WORD *)&self->_reusableViewFlags &= ~8u;

  return v7;
}

- (void)_updateMaskingUsingAttributes:(id)a3
{
  __int16 v4;
  void *v5;
  unsigned __int16 *v6;
  $3649BDB68877BB411F224B683377ABCB *p_reusableViewFlags;
  __int16 v8;
  unint64_t v9;
  char v10;
  char v11;
  __int16 v12;
  unsigned __int16 *v13;

  v13 = (unsigned __int16 *)a3;
  v4 = -[UICollectionReusableView _appliesLayoutAttributesMaskingToReusableView](self, "_appliesLayoutAttributesMaskingToReusableView");
  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v13)
  {
    p_reusableViewFlags = &self->_reusableViewFlags;
    v8 = *(_WORD *)p_reusableViewFlags;
    if ((*(_DWORD *)&v4 & (v13[144] >> 4) & 1) != 0)
    {
      *(_WORD *)p_reusableViewFlags = v8 | 0x10;
      objc_msgSend(v5, "setMasksToBounds:", 1);
      v6 = v13;
      v8 = *(_WORD *)p_reusableViewFlags;
LABEL_8:
      v9 = ((unint64_t)v6[144] >> 5) & 0xF;
      goto LABEL_9;
    }
  }
  else
  {
    p_reusableViewFlags = &self->_reusableViewFlags;
    v8 = *(_WORD *)p_reusableViewFlags;
  }
  if ((v8 & 0x10) != 0)
  {
    objc_msgSend(v5, "setMasksToBounds:", 0);
    v6 = v13;
    v8 = *(_WORD *)p_reusableViewFlags & 0xFFEF;
    *(_WORD *)p_reusableViewFlags = v8;
  }
  if (v6)
    goto LABEL_8;
  v9 = 0;
LABEL_9:
  if (v9 == 15)
    v10 = 0;
  else
    v10 = v4;
  if ((v10 & 1) != 0)
  {
    *(_WORD *)p_reusableViewFlags = v8 | 0x20;
    objc_msgSend(v5, "setMaskedCorners:");
    v6 = v13;
  }
  else if ((v8 & 0x20) != 0)
  {
    objc_msgSend(v5, "setMaskedCorners:", 15);
    v6 = v13;
    *(_WORD *)p_reusableViewFlags &= ~0x20u;
  }
  if (v6)
  {
    if (*((double *)v6 + 39) == 0.0)
      v11 = 0;
    else
      v11 = v4;
    v12 = *(_WORD *)p_reusableViewFlags;
    if ((v11 & 1) != 0)
    {
      *(_WORD *)p_reusableViewFlags = v12 | 0x40;
      objc_msgSend(v5, "setCornerRadius:");
      objc_msgSend(v5, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
      goto LABEL_25;
    }
  }
  else
  {
    v12 = *(_WORD *)p_reusableViewFlags;
  }
  if ((v12 & 0x40) != 0)
  {
    objc_msgSend(v5, "setCornerRadius:", 0.0);
    objc_msgSend(v5, "setCornerCurve:", *MEMORY[0x1E0CD2A60]);
    *(_WORD *)p_reusableViewFlags &= ~0x40u;
  }
LABEL_25:

}

- (BOOL)_appliesLayoutAttributesMaskingToReusableView
{
  return 1;
}

- (UICollectionViewLayoutAttributes)_layoutAttributes
{
  return self->_layoutAttributes;
}

- (BOOL)_arePreferredAttributesValid
{
  return (*(_WORD *)&self->_reusableViewFlags >> 2) & 1;
}

- (UICollectionViewLayoutAttributes)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
  UICollectionViewLayoutAttributes *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  _BOOL4 v11;
  float v12;
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
  UICollectionViewLayoutAttributes *v24;

  v4 = layoutAttributes;
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  objc_msgSend(WeakRetained, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)&self->_collectionView);
    objc_msgSend(v7, "collectionViewLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_cellsShouldConferWithAutolayoutEngineForSizingInfo");

    if (!v9)
      goto LABEL_14;
  }
  v10 = -[UICollectionReusableView _shouldConstrainWidth](self, "_shouldConstrainWidth");
  v11 = -[UICollectionReusableView _shouldConstrainHeight](self, "_shouldConstrainHeight");
  if (v10 && v11)
    goto LABEL_14;
  v12 = v10 ? 1000.0 : 50.0;
  -[UICollectionReusableView _updateDefaultLayoutMarginsUsingAttributes:](self, "_updateDefaultLayoutMarginsUsingAttributes:", v4);
  -[UICollectionViewLayoutAttributes size](v4, "size");
  v14 = v13;
  v16 = v15;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
  v18 = v17;
  v20 = v19;
  -[UICollectionViewLayoutAttributes _listLayoutItemMaxWidth](v4, "_listLayoutItemMaxWidth");
  if (v12 != 1000.0 && v21 != 0.0 && v18 > v21)
  {
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
    v18 = v22;
    v20 = v23;
  }
  if (v14 == v18 && v16 == v20)
  {
LABEL_14:
    v24 = v4;
  }
  else
  {
    v24 = (UICollectionViewLayoutAttributes *)-[UICollectionViewLayoutAttributes copy](v4, "copy");
    -[UICollectionViewLayoutAttributes setSize:](v24, "setSize:", v18, v20);
  }

  return v24;
}

- (void)_setHiddenForReuse:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  UICollectionReusableView *v20;
  __int16 v21;
  _BYTE v22[14];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  if (-[UIView _isHiddenForReuse](self, "_isHiddenForReuse") != a3)
  {
    v5 = _MergedGlobals_85;
    if (!_MergedGlobals_85)
    {
      v5 = __UILogCategoryGetNode("UICollectionViewCellReuse", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_MergedGlobals_85);
    }
    if ((*(_BYTE *)v5 & 1) != 0)
    {
      v7 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = v7;
        v9 = objc_opt_class();
        -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionReusableView _collectionView](self, "_collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v18 = v9;
        v19 = 2048;
        v20 = self;
        v21 = 1024;
        *(_DWORD *)v22 = v3;
        *(_WORD *)&v22[4] = 2112;
        *(_QWORD *)&v22[6] = v10;
        v23 = 2112;
        v24 = v11;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "[%@ %p] _setHiddenForReuse: Setting hidden for reuse:%d on cell with attributes:%@ in collection view: %@", buf, 0x30u);

      }
    }
    v6 = qword_1ECD78228;
    if (!qword_1ECD78228)
    {
      v6 = __UILogCategoryGetNode("UICollectionViewCellReuse", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&qword_1ECD78228);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v12 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = v12;
        v14 = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v18 = v14;
        v19 = 2048;
        v20 = self;
        v21 = 2112;
        *(_QWORD *)v22 = v15;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "[%@ %p] _setHiddenForReuse: Call stack: %@", buf, 0x20u);

      }
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)UICollectionReusableView;
  -[UIView _setHiddenForReuse:](&v16, sel__setHiddenForReuse_, v3);
}

- (BOOL)_shouldConstrainWidth
{
  return (*(_WORD *)&self->_reusableViewFlags >> 12) & 1;
}

- (BOOL)_shouldConstrainHeight
{
  return (*(_WORD *)&self->_reusableViewFlags >> 13) & 1;
}

- (BOOL)_isStyledAsHeaderOrFooterFromLayoutAttributes:(id)a3
{
  id *v3;
  id *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  _BYTE *v8;

  v3 = (id *)a3;
  v4 = v3;
  if (v3 && ((_WORD)v3[36] & 3) == 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "indexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "item");

    if (v6)
    {
      v7 = 0;
    }
    else
    {
      -[UICollectionViewLayoutAttributes _existingListAttributes](v4);
      v8 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      if (v8)
        v7 = v8[8] & 1;
      else
        v7 = 0;

    }
  }

  return v7;
}

- (int64_t)_styleFromLayoutAttributes:(id)a3
{
  _QWORD *v3;
  int64_t v4;

  -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)a3);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3[2];
  else
    v4 = 0;

  return v4;
}

- (void)_setShouldConstrainWidth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_reusableViewFlags = *(_WORD *)&self->_reusableViewFlags & 0xEFFF | v3;
}

- (void)_setShouldConstrainHeight:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_reusableViewFlags = *(_WORD *)&self->_reusableViewFlags & 0xDFFF | v3;
}

- (BOOL)_hasNotifiedIsDisplaying
{
  return (*(_WORD *)&self->_reusableViewFlags >> 10) & 1;
}

- (void)_notifyIsDisplaying:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_reusableViewFlags = *(_WORD *)&self->_reusableViewFlags & 0xFBFF | v3;
}

- (void)_addUpdateAnimation
{
  ++self->_updateAnimationCount;
}

- (void)invalidateIntrinsicContentSize
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UICollectionReusableView _collectionView](self, "_collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_reusableViewDidInvalidateIntrinsicContentSize:", self);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UICollectionReusableView;
    -[UIView invalidateIntrinsicContentSize](&v5, sel_invalidateIntrinsicContentSize);
  }

}

- (UICollectionView)_collectionView
{
  UICollectionView **p_collectionView;
  void *WeakRetained;
  uint64_t v5;
  id v6;

  p_collectionView = &self->_collectionView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  if (!WeakRetained)
  {
    v5 = objc_opt_class();
    _UIFallbackViewOfClassForReusableView(v5, self);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    if (WeakRetained)
      objc_storeWeak((id *)p_collectionView, WeakRetained);
  }
  v6 = WeakRetained;

  return (UICollectionView *)v6;
}

- (BOOL)_wasDequeued
{
  return *(_WORD *)&self->_reusableViewFlags & 1;
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (BOOL)_hasBeenReused
{
  return (*(_WORD *)&self->_reusableViewFlags >> 1) & 1;
}

- (NSString)_elementKind
{
  return self->_elementKind;
}

- (void)_setReuseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (UICollectionReusableView)initWithFrame:(CGRect)a3
{
  UICollectionReusableView *v3;
  UICollectionReusableView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UICollectionReusableView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    _UICollectionReusableViewCommonInit(v3);
  return v4;
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  char isKindOfClass;
  const __CFString *v9;
  objc_super v10;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  UICollectionReusableView *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (!a3
    && -[UIView translatesAutoresizingMaskIntoConstraints](self, "translatesAutoresizingMaskIntoConstraints")
    && dyld_program_sdk_at_least())
  {
    v5 = setTranslatesAutoresizingMaskIntoConstraints____s_category;
    if (!setTranslatesAutoresizingMaskIntoConstraints____s_category)
    {
      v5 = __UILogCategoryGetNode("LayoutConstraints", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&setTranslatesAutoresizingMaskIntoConstraints____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v9 = CFSTR("UICollectionReusableView");
      if ((isKindOfClass & 1) != 0)
        v9 = CFSTR("UICollectionViewCell");
      *(_DWORD *)buf = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = self;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Changing the translatesAutoresizingMaskIntoConstraints property of a %@ that is managed by a UICollectionView is not supported, and will result in incorrect self-sizing. View: %@", buf, 0x16u);

    }
  }
  v10.receiver = self;
  v10.super_class = (Class)UICollectionReusableView;
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](&v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, v3);
}

- (void)_markAsDequeued
{
  *(_WORD *)&self->_reusableViewFlags |= 1u;
}

- (void)_setCollectionView:(id)a3
{
  *(_WORD *)&self->_reusableViewFlags = *(_WORD *)&self->_reusableViewFlags & 0xF7FF | ((a3 != 0) << 11);
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (void)_setElementKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (void)_setAutomaticIntrinsicContentSizeInvalidationEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *(_WORD *)&self->_reusableViewFlags = v3 & 0x8000 | *(_WORD *)&self->_reusableViewFlags & 0x7FFF;
}

- (void)_clearUpdateAnimation
{
  int64_t updateAnimationCount;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  updateAnimationCount = self->_updateAnimationCount;
  if (updateAnimationCount <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCell.m"), 659, CFSTR("unbalanced ending to update animation which apparently never began for this view (%@)"), self);

    self->_updateAnimationCount = updateAnimationCount - 1;
  }
  else
  {
    self->_updateAnimationCount = updateAnimationCount - 1;
    if (updateAnimationCount == 1)
    {
      -[UICollectionReusableView _updateAnimationCompletionBlocks](self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(self, &_UpdateCompletionBlocksKey, 0, (void *)1);
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++) + 16))();
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }

    }
  }
}

- (id)_updateAnimationCompletionBlocks
{
  objc_getAssociatedObject(a1, &_UpdateCompletionBlocksKey);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setIsBeingReused:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_reusableViewFlags = *(_WORD *)&self->_reusableViewFlags & 0xFDFF | v3;
}

- (BOOL)_isBeingReused
{
  return (*(_WORD *)&self->_reusableViewFlags >> 9) & 1;
}

- (void)_invalidatePreferredAttributes
{
  __int16 reusableViewFlags;

  reusableViewFlags = (__int16)self->_reusableViewFlags;
  if ((reusableViewFlags & 8) == 0)
    *(_WORD *)&self->_reusableViewFlags = reusableViewFlags & 0xFFFB;
}

- (void)prepareForReuse
{
  void *v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  UICollectionReusableView *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  *(_WORD *)&self->_reusableViewFlags = *(_WORD *)&self->_reusableViewFlags & 0xCFF9 | 2;
  -[UIView _safeMaskView](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
      objc_msgSend(WeakRetained, "collectionViewLayout");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if (v5)
      {
        objc_msgSend(*(id *)(v5 + 136), "currentSwipeOccurrence");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          objc_msgSend(v7, "swipedView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView _safeMaskView](v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10 == v3)
          {
            if (os_variant_has_internal_diagnostics())
            {
              __UIFaultDebugAssertLog();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
              {
                v14 = 138412802;
                v15 = self;
                v16 = 2112;
                v17 = WeakRetained;
                v18 = 2112;
                v19 = v8;
                _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: unexpected removal of the current swipe occurrence's mask view. Please file a bug against UICollectionView. Reusable view: %@; Collection view: %@; Swipe occurrence: %@",
                  (uint8_t *)&v14,
                  0x20u);
              }

            }
            else
            {
              v11 = prepareForReuse___s_category_0;
              if (!prepareForReuse___s_category_0)
              {
                v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v11, (unint64_t *)&prepareForReuse___s_category_0);
              }
              v12 = *(NSObject **)(v11 + 8);
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              {
                v14 = 138412802;
                v15 = self;
                v16 = 2112;
                v17 = WeakRetained;
                v18 = 2112;
                v19 = v8;
                _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: unexpected removal of the current swipe occurrence's mask view. Please file a bug against UICollectionView. Reusable view: %@; Collection view: %@; Swipe occurrence: %@",
                  (uint8_t *)&v14,
                  0x20u);
              }
            }
          }
        }

      }
      -[UIView _setSafeMaskView:](self, 0);

    }
  }
  -[UICollectionReusableView _notifyIsDisplaying:](self, "_notifyIsDisplaying:", 0);

}

- (BOOL)canBeEdited
{
  return 0;
}

- (void)_setMaskView:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICollectionReusableView;
  -[UIView _setMaskView:](&v5, sel__setMaskView_);
  if (a3)
    -[UICollectionReusableView _addBackdropViewForMaskingIfNeeded](self, "_addBackdropViewForMaskingIfNeeded");
  else
    -[UICollectionReusableView _removeExistingBackdropViewForMasking](self, "_removeExistingBackdropViewForMasking");
}

- (void)_removeExistingBackdropViewForMasking
{
  void *v3;
  id v4;

  objc_getAssociatedObject(self, &_UICollectionReusableViewBackdropViewForMasking);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "removeFromSuperview");
    objc_setAssociatedObject(self, &_UICollectionReusableViewBackdropViewForMasking, 0, (void *)1);
    v3 = v4;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementKind, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
}

- (UICollectionReusableView)initWithCoder:(id)a3
{
  id v4;
  UICollectionReusableView *v5;
  void *v6;
  uint64_t v7;
  NSString *reuseIdentifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UICollectionReusableView;
  v5 = -[UIView initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIReuseIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    reuseIdentifier = v5->_reuseIdentifier;
    v5->_reuseIdentifier = (NSString *)v7;

    _UICollectionReusableViewCommonInit(v5);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *reuseIdentifier;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UICollectionReusableView;
  -[UIView encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  reuseIdentifier = self->_reuseIdentifier;
  if (reuseIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", reuseIdentifier, CFSTR("UIReuseIdentifier"));

}

- (void)_setHiddenForReordering:(BOOL)a3
{
  -[UIView _setHidden:forReason:]((uint64_t)self, a3, 2uLL);
}

- (BOOL)_isHiddenForReordering
{
  if (self)
    return (*((_QWORD *)&self->super._viewFlags + 1) >> 17) & 1;
  return (char)self;
}

- (void)_setBaseLayoutAttributes:(id)a3
{
  UICollectionViewLayoutAttributes *v4;
  UICollectionViewLayoutAttributes *layoutAttributes;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[UICollectionViewLayoutAttributes isEqual:](self->_layoutAttributes, "isEqual:"))
  {
    v4 = (UICollectionViewLayoutAttributes *)objc_msgSend(v8, "copy");
    layoutAttributes = self->_layoutAttributes;
    self->_layoutAttributes = v4;

    -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)&self->_layoutAttributes->super.isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionReusableView _setReuseIdentifier:](self, "_setReuseIdentifier:", v7);

    }
  }

}

- (void)_willRevealWithLayoutAttributes:(id)a3
{
  void *v4;
  id v5;

  -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)&self->_layoutAttributes->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionReusableView _applyListEnvironmentTraitOverridesUsingNewListAttributes:previousListAttributes:](self, "_applyListEnvironmentTraitOverridesUsingNewListAttributes:previousListAttributes:", v5, v4);

}

void __55__UICollectionReusableView__setLayoutAttributes_force___block_invoke(uint64_t a1, char a2)
{
  void *v3;

  if ((a2 & 1) == 0 && (objc_msgSend(*(id *)(a1 + 32), "_isHiddenForReuse") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "_setLayoutAttributes:force:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416), 1);
  }
}

- (void)_applyListEnvironmentTraitOverridesUsingNewListAttributes:(id)a3 previousListAttributes:(id)a4
{
  uint64_t v5;
  id v6;

  if (a3 || !a4)
  {
    if (!a3)
      return;
    v5 = _UIListEnvironmentFromListStyle(*((_QWORD *)a3 + 2));
    -[UIView _internalTraitOverrides](self);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setListEnvironment:", v5);
  }
  else
  {
    -[UIView _internalTraitOverrides](self);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeTrait:", objc_opt_class());
  }

}

- (void)_setInternalMaskView:(_WORD *)a1
{
  id v3;
  void *v4;
  __int16 v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = a1[236];
    if (v3)
    {
      a1[236] = v5 | 0x80;
      v6 = a1;
      v7 = v4;
LABEL_6:
      -[UIView _setSafeMaskView:](v6, v4);
      v4 = v7;
      goto LABEL_7;
    }
    if ((v5 & 0x80) != 0)
    {
      a1[236] = v5 & 0xFF7F;
      v6 = a1;
      v7 = 0;
      v4 = 0;
      goto LABEL_6;
    }
  }
LABEL_7:

}

void __59__UICollectionReusableView__updateMaskViewUsingAttributes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  -[UICollectionReusableView _internalMaskView](*(_WORD **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      v5 = *(_QWORD *)(v4 + 416);
    else
      v5 = 0;
    v6 = *(_QWORD *)(a1 + 48);

    if (v5 == v6)
      -[UICollectionReusableView _setInternalMaskView:](*(_WORD **)(a1 + 40), 0);
  }
  else
  {

  }
}

- (void)_addBackdropViewForMaskingIfNeeded
{
  void *v3;
  _UIVisualEffectBackdropView *v4;
  _UIVisualEffectBackdropView *value;

  objc_getAssociatedObject(self, &_UICollectionReusableViewBackdropViewForMasking);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [_UIVisualEffectBackdropView alloc];
    -[UIView bounds](self, "bounds");
    value = -[_UIVisualEffectSubview initWithFrame:](v4, "initWithFrame:");
    -[UIView setAutoresizingMask:](value, "setAutoresizingMask:", 18);
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", value, 0);
    objc_setAssociatedObject(self, &_UICollectionReusableViewBackdropViewForMasking, value, (void *)1);
    v3 = value;
  }

}

- (BOOL)_isFocusableWhenStyledAsHeader
{
  return 0;
}

- (BOOL)_automaticIntrinsicContentSizeInvalidationEnabled
{
  return *(_WORD *)&self->_reusableViewFlags >> 15;
}

- (BOOL)isEditing
{
  return 0;
}

- (void)setPreferredAttributesValid:(BOOL)a3
{
  self->_preferredAttributesValid = a3;
}

@end
