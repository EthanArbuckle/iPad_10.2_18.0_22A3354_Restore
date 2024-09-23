@implementation UICollectionViewAnimation

void __47__UICollectionViewAnimation_startWithAnimator___block_invoke_2(uint64_t a1)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  id v14;
  char v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _OWORD v24[8];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "center");
    objc_msgSend(v2, "setPosition:");
    objc_msgSend(v2, "bounds");
    v4 = v3;
    v6 = v5;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "size");
    objc_msgSend(v2, "setBounds:", v4, v6, v7, v8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "alpha");
    *(float *)&v9 = v9;
    objc_msgSend(v2, "setOpacity:", v9);
    v10 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    if (v10)
    {
      objc_msgSend(v10, "transform3D");
    }
    else
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
    }
    v24[4] = v29;
    v24[5] = v30;
    v24[6] = v31;
    v24[7] = v32;
    v24[0] = v25;
    v24[1] = v26;
    v24[2] = v27;
    v24[3] = v28;
    objc_msgSend(v2, "setTransform:", v24);

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "alpha");
  v12 = v11;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "alpha");
  if (v12 != v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = *(id *)(a1 + 32);
      v15 = objc_msgSend(v14, "_disableRasterizeInAnimations");
      v16 = objc_msgSend(v14, "_disableGroupOpacityInAnimations");

      if ((v15 & 1) != 0)
      {
        if (!v16)
          goto LABEL_14;
        goto LABEL_13;
      }
    }
    else
    {
      LOBYTE(v16) = 1;
    }
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v17, "shouldRasterize") ^ 1;

    objc_msgSend(*(id *)(a1 + 32), "_currentScreenScale");
    v19 = v18;
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setRasterizationScale:", v19);

    objc_msgSend(*(id *)(a1 + 32), "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setShouldRasterize:", 1);

    if ((v16 & 1) != 0)
    {
LABEL_13:
      objc_msgSend(*(id *)(a1 + 32), "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v22, "allowsGroupOpacity");

      objc_msgSend(*(id *)(a1 + 32), "layer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setAllowsGroupOpacity:", 0);

    }
  }
LABEL_14:
  objc_msgSend(*(id *)(a1 + 48), "_applyLayoutAttributes:toView:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), *(_QWORD *)(a1 + 32));
  if (dyld_program_sdk_at_least() && *(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __47__UICollectionViewAnimation_startWithAnimator___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setShouldRasterize:", 0);

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAllowsGroupOpacity:", 1);

  }
  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 40), "_reparentViewIntoCorrectContainer:", *(_QWORD *)(a1 + 32));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 48) + 48);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "removeAllObjects", (_QWORD)v10);
}

uint64_t __47__UICollectionViewAnimation_startWithAnimator___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "layoutBelowIfNeeded");
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 40), "_reparentViewIntoSelf:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationBlock, 0);
  objc_storeStrong((id *)&self->_startupHandlers, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_finalLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

- (UICollectionViewAnimation)initWithView:(id)a3 viewType:(int64_t)a4 finalLayoutAttributes:(id)a5 startFraction:(double)a6 endFraction:(double)a7 animateFromCurrentPostion:(BOOL)a8 deleteAfterAnimation:(BOOL)a9 customAnimations:(id)a10
{
  _BOOL4 v11;
  id v19;
  id v20;
  id v21;
  UICollectionViewAnimation *v22;
  UICollectionReusableView *v23;
  UICollectionReusableView *view;
  char v25;
  void *v26;
  uint64_t v27;
  NSMutableArray *v28;
  NSMutableArray *completionHandlers;
  NSMutableArray *v30;
  NSMutableArray *startupHandlers;
  uint64_t v32;
  id animationBlock;
  void *v35;
  objc_super v36;

  v11 = a9;
  v19 = a3;
  v20 = a5;
  v21 = a10;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionView_InternalHelperClasses.m"), 255, CFSTR("attempt to create view animation for nil view"));

  }
  v36.receiver = self;
  v36.super_class = (Class)UICollectionViewAnimation;
  v22 = -[UICollectionViewAnimation init](&v36, sel_init);
  if (v22)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(v19, "layer");
      v23 = (UICollectionReusableView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = (UICollectionReusableView *)v19;
    }
    view = v22->_view;
    v22->_view = v23;

    v22->_viewType = a4;
    objc_storeStrong((id *)&v22->_finalLayoutAttributes, a5);
    v22->_startFraction = a6;
    v22->_endFraction = a7;
    if (v11)
      v25 = 2;
    else
      v25 = 0;
    *(_BYTE *)&v22->_collectionViewAnimationFlags = v25 | a8 | *(_BYTE *)&v22->_collectionViewAnimationFlags & 0xFC;
    objc_msgSend(v19, "_layoutAttributes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "zIndex");
    *(_BYTE *)&v22->_collectionViewAnimationFlags = *(_BYTE *)&v22->_collectionViewAnimationFlags & 0xEF | (16 * (v27 != objc_msgSend(v20, "zIndex")));

    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionHandlers = v22->_completionHandlers;
    v22->_completionHandlers = v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    startupHandlers = v22->_startupHandlers;
    v22->_startupHandlers = v30;

    v32 = objc_msgSend(v21, "copy");
    animationBlock = v22->_animationBlock;
    v22->_animationBlock = (id)v32;

  }
  return v22;
}

- (void)addStartupHandler:(id)a3
{
  NSMutableArray *startupHandlers;
  id v4;

  if (a3)
  {
    startupHandlers = self->_startupHandlers;
    v4 = (id)objc_msgSend(a3, "copy");
    -[NSMutableArray addObject:](startupHandlers, "addObject:", v4);

  }
}

- (void)setParentInCollectionViewDuringAnimation:(BOOL)a3
{
  self->_parentInCollectionViewDuringAnimation = a3;
}

- (UICollectionReusableView)view
{
  return self->_view;
}

- (UICollectionViewLayoutAttributes)finalLayoutAttributes
{
  return self->_finalLayoutAttributes;
}

- (BOOL)deleteAfterAnimation
{
  return (*(_BYTE *)&self->_collectionViewAnimationFlags >> 1) & 1;
}

- (void)addCompletionHandler:(id)a3
{
  NSMutableArray *completionHandlers;
  id v4;

  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    v4 = (id)objc_msgSend(a3, "copy");
    -[NSMutableArray addObject:](completionHandlers, "addObject:", v4);

  }
}

- (void)startWithAnimator:(id)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  UICollectionReusableView *v9;
  UICollectionReusableView *v10;
  id v11;
  int has_internal_diagnostics;
  double endFraction;
  double startFraction;
  double v15;
  double v16;
  double v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void (**animationBlock)(void);
  char v23;
  UICollectionReusableView *v24;
  id v25;
  void *v26;
  void *v27;
  dispatch_time_t v28;
  void *v29;
  NSObject *v30;
  unint64_t v31;
  NSObject *v32;
  char collectionViewAnimationFlags;
  id v34;
  _QWORD block[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  UICollectionReusableView *v40;
  id v41;
  UICollectionViewAnimation *v42;
  uint8_t *v43;
  _QWORD *v44;
  BOOL v45;
  _QWORD aBlock[4];
  UICollectionReusableView *v47;
  UICollectionViewAnimation *v48;
  id v49;
  uint8_t *v50;
  _QWORD *v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t);
  void *v56;
  UICollectionViewAnimation *v57;
  _QWORD v58[3];
  char v59;
  uint8_t buf[8];
  uint8_t *v61;
  uint64_t v62;
  char v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  UICollectionReusableView *v69;
  id v70;
  BOOL v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  if (-[UICollectionViewAnimation parentInCollectionViewDuringAnimation](self, "parentInCollectionViewDuringAnimation"))
  {
    -[UIView superview](self->_view, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionReusableView _collectionView](self->_view, "_collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 != v6;

  }
  else
  {
    v7 = 0;
  }
  -[UICollectionReusableView _collectionView](self->_view, "_collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_view;
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __47__UICollectionViewAnimation_startWithAnimator___block_invoke;
  v68[3] = &unk_1E16B4008;
  v10 = v9;
  v69 = v10;
  v71 = v7;
  v11 = v8;
  v70 = v11;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v68);
  collectionViewAnimationFlags = (char)self->_collectionViewAnimationFlags;
  if (self->_startFraction <= 0.0 && self->_endFraction >= 1.0)
  {
    v17 = 0.0;
    v16 = 0.3;
  }
  else
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    startFraction = self->_startFraction;
    endFraction = self->_endFraction;
    if (has_internal_diagnostics)
    {
      if (endFraction < startFraction)
      {
        __UIFaultDebugAssertLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v30, OS_LOG_TYPE_FAULT, "Cell animation stop fraction must be greater than start fraction", buf, 2u);
        }

      }
    }
    else if (endFraction < startFraction)
    {
      v31 = startWithAnimator____s_category;
      if (!startWithAnimator____s_category)
      {
        v31 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v31, (unint64_t *)&startWithAnimator____s_category);
      }
      v32 = *(NSObject **)(v31 + 8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_ERROR, "Cell animation stop fraction must be greater than start fraction", buf, 2u);
      }
    }
    v15 = self->_startFraction;
    v16 = (self->_endFraction - v15) * 0.3;
    v17 = v15 * 0.3;
  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v18 = self->_startupHandlers;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v65 != v20)
          objc_enumerationMutation(v18);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i) + 16))();
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    }
    while (v19);
  }

  -[NSMutableArray removeAllObjects](self->_startupHandlers, "removeAllObjects");
  *(_QWORD *)buf = 0;
  v61 = buf;
  v62 = 0x2020000000;
  v63 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  v59 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionView_InternalHelperClasses.m"), 352, CFSTR("Collection View no longer support raw layer or view animations."));

  }
  if (self->_animationBlock)
  {
    -[UICollectionReusableView _setBaseLayoutAttributes:](v10, "_setBaseLayoutAttributes:", self->_finalLayoutAttributes);
    animationBlock = (void (**)(void))self->_animationBlock;
    v53 = MEMORY[0x1E0C809B0];
    v54 = 3221225472;
    v55 = __47__UICollectionViewAnimation_startWithAnimator___block_invoke_86;
    v56 = &unk_1E16B3FD8;
    v57 = self;
    animationBlock[2]();
    -[UICollectionReusableView applyLayoutAttributes:](v10, "applyLayoutAttributes:", self->_finalLayoutAttributes);
  }
  else
  {
    if (v34)
      v23 = objc_msgSend(v34, "shouldLayoutSubviews");
    else
      v23 = 1;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__UICollectionViewAnimation_startWithAnimator___block_invoke_2;
    aBlock[3] = &unk_1E16BE230;
    v24 = v10;
    v47 = v24;
    v48 = self;
    v50 = buf;
    v51 = v58;
    v25 = v11;
    v49 = v25;
    v52 = v23;
    v26 = _Block_copy(aBlock);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __47__UICollectionViewAnimation_startWithAnimator___block_invoke_3;
    v39[3] = &unk_1E16BE258;
    v43 = buf;
    v40 = v24;
    v44 = v58;
    v45 = v7;
    v41 = v25;
    v42 = self;
    v27 = _Block_copy(v39);
    if (v34)
    {
      objc_msgSend(v34, "addAnimations:", v26);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __47__UICollectionViewAnimation_startWithAnimator___block_invoke_4;
      v37[3] = &unk_1E16BDBD8;
      v38 = v27;
      objc_msgSend(v34, "addCompletion:", v37);
      if ((objc_msgSend(v34, "isRunning") & 1) == 0)
      {
        if (v17 <= 0.0)
        {
          objc_msgSend(v34, "startAnimation");
        }
        else
        {
          v28 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __47__UICollectionViewAnimation_startWithAnimator___block_invoke_5;
          block[3] = &unk_1E16B1B28;
          v36 = v34;
          dispatch_after(v28, MEMORY[0x1E0C80D38], block);

        }
      }

    }
    else
    {
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4 * (collectionViewAnimationFlags & 1), v26, v27, v16, v17);
    }

  }
  _Block_object_dispose(v58, 8);
  _Block_object_dispose(buf, 8);

}

- (BOOL)parentInCollectionViewDuringAnimation
{
  return self->_parentInCollectionViewDuringAnimation;
}

- (BOOL)resetRasterizationAfterAnimation
{
  return (*(_BYTE *)&self->_collectionViewAnimationFlags >> 3) & 1;
}

- (BOOL)updateZIndexAfterAnimation
{
  return (*(_BYTE *)&self->_collectionViewAnimationFlags >> 4) & 1;
}

- (int64_t)viewType
{
  return self->_viewType;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewAnimation;
  -[UICollectionViewAnimation description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" view: %@; finalLayoutAttributes = %@"),
    self->_view,
    self->_finalLayoutAttributes);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)animateFromCurrentPosition
{
  return *(_BYTE *)&self->_collectionViewAnimationFlags & 1;
}

- (void)setRasterizeAfterAnimation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_collectionViewAnimationFlags = *(_BYTE *)&self->_collectionViewAnimationFlags & 0xFB | v3;
}

- (BOOL)rasterizeAfterAnimation
{
  return (*(_BYTE *)&self->_collectionViewAnimationFlags >> 2) & 1;
}

- (void)setResetRasterizationAfterAnimation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_collectionViewAnimationFlags = *(_BYTE *)&self->_collectionViewAnimationFlags & 0xF7 | v3;
}

- (void)start
{
  -[UICollectionViewAnimation startWithAnimator:](self, "startWithAnimator:", 0);
}

uint64_t __47__UICollectionViewAnimation_startWithAnimator___block_invoke_86(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects", (_QWORD)v8);
}

uint64_t __47__UICollectionViewAnimation_startWithAnimator___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

uint64_t __47__UICollectionViewAnimation_startWithAnimator___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startAnimation");
}

- (double)startFraction
{
  return self->_startFraction;
}

- (double)endFraction
{
  return self->_endFraction;
}

@end
