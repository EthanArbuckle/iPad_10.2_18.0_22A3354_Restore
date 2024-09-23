@implementation PKPGSVTransitionInterstitialView

- (PKPGSVTransitionInterstitialView)init
{

  return 0;
}

- (PKPGSVTransitionInterstitialView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (id)_initForItem:(void *)a3 inView:(void *)a4 withSpringFactory:(void *)a5 dismissalSpringFactory:(void *)a6 defaultSize:(double)a7 containerAlpha:(double)a8 activationObserver:(double)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  id result;
  void *v22;
  id *v23;
  uint64_t v24;
  BOOL v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  objc_super v35;

  v17 = a2;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  result = a6;
  if (v19)
  {
    v22 = result;
    v35.receiver = a1;
    v35.super_class = (Class)PKPGSVTransitionInterstitialView;
    v23 = (id *)objc_msgSendSuper2(&v35, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v24 = (uint64_t)v23;
    if (v23)
    {
      objc_storeStrong(v23 + 54, a4);
      objc_storeStrong((id *)(v24 + 440), a5);
      v25 = !UIAccessibilityIsReduceTransparencyEnabled() && !UIAccessibilityIsReduceMotionEnabled();
      *(_BYTE *)(v24 + 416) = v25;
      v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = *(void **)(v24 + 520);
      *(_QWORD *)(v24 + 520) = v26;

      v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v29 = *(void **)(v24 + 528);
      *(_QWORD *)(v24 + 528) = v28;

      v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v31 = *(void **)(v24 + 536);
      *(_QWORD *)(v24 + 536) = v30;

      objc_msgSend(v18, "addSubview:", v24);
      -[PKPGSVTransitionInterstitialView _setContainerAlpha:animated:]((_QWORD *)v24, 0, a9);
      -[PKPGSVTransitionInterstitialView _setCurrentItem:withDefaultSize:force:animated:](v24, v17, 1, 0, a7, a8);
      -[PKPGSVTransitionInterstitialView _setPreviousItem:withDefaultSize:force:animated:](v24, 0, 1, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      if (v17)
        -[PKPGSVTransitionInterstitialView _updatePositionAnimated:](v24, 0);
      -[PKPGSVTransitionInterstitialView _updateActive](v24);
      v32 = _Block_copy(v22);
      v33 = *(void **)(v24 + 448);
      *(_QWORD *)(v24 + 448) = v32;

      v34 = *(_QWORD *)(v24 + 448);
      if (v34)
      {
        if (*(_BYTE *)(v24 + 420))
          (*(void (**)(uint64_t, uint64_t))(v34 + 16))(v34, 1);
      }
    }

    return (id)v24;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)_setContainerAlpha:(double)a3 animated:
{
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  objc_msgSend(a1, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v17 = 0;
  if (a2)
    v7 = a1[54];
  objc_msgSend(a1, "pkui_setAlpha:withAnimationFactory:animation:", v7, &v17, a3);
  if (v17)
  {
    v9 = -[PKPGSVTransitionInterstitialView _incrementAnimationCount](a1);
    v10 = v17;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __64__PKPGSVTransitionInterstitialView__setContainerAlpha_animated___block_invoke;
    v15 = &unk_1E3E614F0;
    v16 = v9;
    v11 = v9;
    objc_msgSend(v10, "pkui_setCompletionHandler:", &v12);
    objc_msgSend(v6, "removeAnimationForKey:", CFSTR("opacity"), v12, v13, v14, v15);
    objc_msgSend(v6, "addAnimation:forKey:", v17, CFSTR("opacity"));

  }
  else if (v8 != a3)
  {
    objc_msgSend(v6, "removeAnimationForKey:", CFSTR("opacity"));
  }

}

- (double)_setCurrentItem:(int)a3 withDefaultSize:(char)a4 force:(double)a5 animated:(double)a6
{
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  const void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  double *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v27[5];

  v12 = a2;
  v13 = v12;
  if (!*(_BYTE *)(a1 + 421))
  {
    if (*(id *)(a1 + 456) == v12 && (a3 & 1) == 0)
      goto LABEL_18;
    objc_msgSend((id)a1, "layoutIfNeeded");
    if (*(_QWORD *)(a1 + 464))
      v14 = a3 == 0;
    else
      v14 = 1;
    if (!v14)
    {
      objc_msgSend(*(id *)(a1 + 520), "addObject:");
      v15 = *(void **)(a1 + 464);
      *(_QWORD *)(a1 + 464) = 0;

    }
    if (*(_QWORD *)(a1 + 472))
    {
      objc_msgSend(*(id *)(a1 + 528), "addObject:");
      v16 = *(void **)(a1 + 472);
      *(_QWORD *)(a1 + 472) = 0;

    }
    v17 = *(const void **)(a1 + 480);
    if (v17)
    {
      v18 = *(void **)(a1 + 536);
      v19 = _Block_copy(v17);
      objc_msgSend(v18, "addObject:", v19);

      v20 = *(void **)(a1 + 480);
      *(_QWORD *)(a1 + 480) = 0;

    }
    objc_storeStrong((id *)(a1 + 456), a2);
    if (v13)
    {
      v21 = *(_BYTE *)(a1 + 416);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __83__PKPGSVTransitionInterstitialView__setCurrentItem_withDefaultSize_force_animated___block_invoke;
      v27[3] = &unk_1E3E64CA8;
      v27[4] = a1;
      -[PKPGSVTransitionInterstitialItem beginTrackingWithConfiguration:handler:]((uint64_t)v13, v21, v27);
    }
    else if (!*(_QWORD *)(a1 + 464))
    {
      v22 = -[PKPGSVTransitionInterstitialSnapshotContainerView initWithSnapshotSize:]((double *)[PKPGSVTransitionInterstitialSnapshotContainerView alloc], a5, a6);
      v23 = *(void **)(a1 + 464);
      *(_QWORD *)(a1 + 464) = v22;

      v24 = *(void **)(a1 + 464);
      objc_msgSend((id)a1, "anchorPoint");
      objc_msgSend(v24, "setAnchorPoint:");
      objc_msgSend(*(id *)(a1 + 464), "setHidden:", 1);
      objc_msgSend((id)a1, "addSubview:", *(_QWORD *)(a1 + 464));
    }
    objc_msgSend((id)a1, "setNeedsLayout");
    *(_BYTE *)(a1 + 417) = a4;
    objc_msgSend((id)a1, "layoutIfNeeded");
    *(_BYTE *)(a1 + 417) = 0;
    -[PKPGSVTransitionInterstitialView _pruneObsoleteSnapshots](a1);
    if (*(_QWORD *)(a1 + 456))
    {
LABEL_18:
      v25 = *(_QWORD *)(a1 + 464);
      if (v25)
        a5 = *(double *)(v25 + 416);
      else
        a5 = 0.0;
    }
  }

  return a5;
}

- (void)_setPreviousItem:(int)a3 withDefaultSize:(char)a4 force:(double)a5 animated:(double)a6
{
  id v12;
  BOOL v14;
  void *v15;
  void *v16;
  const void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  double *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  _QWORD v27[5];

  v12 = a2;
  if (!*(_BYTE *)(a1 + 421) && (*(id *)(a1 + 488) != v12 || a3 != 0))
  {
    v26 = v12;
    objc_msgSend((id)a1, "layoutIfNeeded");
    if (*(_QWORD *)(a1 + 496))
      v14 = a3 == 0;
    else
      v14 = 1;
    if (!v14)
    {
      objc_msgSend(*(id *)(a1 + 520), "addObject:");
      v15 = *(void **)(a1 + 496);
      *(_QWORD *)(a1 + 496) = 0;

    }
    if (*(_QWORD *)(a1 + 504))
    {
      objc_msgSend(*(id *)(a1 + 528), "addObject:");
      v16 = *(void **)(a1 + 504);
      *(_QWORD *)(a1 + 504) = 0;

    }
    v17 = *(const void **)(a1 + 512);
    if (v17)
    {
      v18 = *(void **)(a1 + 536);
      v19 = _Block_copy(v17);
      objc_msgSend(v18, "addObject:", v19);

      v20 = *(void **)(a1 + 512);
      *(_QWORD *)(a1 + 512) = 0;

    }
    objc_storeStrong((id *)(a1 + 488), a2);
    if (v26)
    {
      v21 = *(_BYTE *)(a1 + 416);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __84__PKPGSVTransitionInterstitialView__setPreviousItem_withDefaultSize_force_animated___block_invoke;
      v27[3] = &unk_1E3E64CA8;
      v27[4] = a1;
      -[PKPGSVTransitionInterstitialItem beginTrackingWithConfiguration:handler:]((uint64_t)v26, v21, v27);
    }
    else if (!*(_QWORD *)(a1 + 496))
    {
      v22 = -[PKPGSVTransitionInterstitialSnapshotContainerView initWithSnapshotSize:]((double *)[PKPGSVTransitionInterstitialSnapshotContainerView alloc], a5, a6);
      v23 = *(void **)(a1 + 496);
      *(_QWORD *)(a1 + 496) = v22;

      v24 = *(void **)(a1 + 496);
      objc_msgSend((id)a1, "anchorPoint");
      objc_msgSend(v24, "setAnchorPoint:");
      objc_msgSend(*(id *)(a1 + 496), "setHidden:", 1);
      v25 = *(_QWORD *)(a1 + 496);
      if (*(_QWORD *)(a1 + 464))
        objc_msgSend((id)a1, "insertSubview:belowSubview:", v25);
      else
        objc_msgSend((id)a1, "addSubview:", v25);
    }
    objc_msgSend((id)a1, "setNeedsLayout");
    *(_BYTE *)(a1 + 417) = a4;
    objc_msgSend((id)a1, "layoutIfNeeded");
    *(_BYTE *)(a1 + 417) = 0;
    -[PKPGSVTransitionInterstitialView _pruneObsoleteSnapshots](a1);
    v12 = v26;
  }

}

- (void)_updatePositionAnimated:(uint64_t)a1
{
  uint64_t v4;
  id v5;
  void *v6;
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
  double v18;
  _BOOL4 v19;
  id v20;

  if (*(_QWORD *)(a1 + 456))
  {
    objc_msgSend((id)a1, "superview");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 456);
    if (v4)
      v5 = *(id *)(v4 + 8);
    else
      v5 = 0;
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 && v6)
    {
      objc_msgSend(v5, "bounds");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      objc_msgSend(v5, "alignmentRectInsets");
      objc_msgSend(v20, "convertPoint:fromView:", v5, v8 + v15 + (v12 - (v15 + v17)) * 0.5, v10 + v16 + (v14 - (v16 + v18)) * 0.5);
      if (a2)
        v19 = *(_BYTE *)(a1 + 419) != 0;
      else
        v19 = 0;
      -[PKPGSVTransitionInterstitialView _setPosition:animated:](a1, v19);
    }

  }
}

- (void)_updateActive
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  id v6;

  if (*(_BYTE *)(a1 + 421))
    v2 = 0;
  else
    v2 = *(_QWORD *)(a1 + 424) != 0;
  if (*(unsigned __int8 *)(a1 + 420) != v2)
  {
    *(_BYTE *)(a1 + 420) = v2;
    -[PKPGSVTransitionInterstitialView _pruneObsoleteSnapshots](a1);
    v3 = *(_QWORD *)(a1 + 448);
    if (v3)
    {
      v4 = *(unsigned __int8 *)(a1 + 420);
      v5 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
      v6 = (id)a1;
      v5(v3, v4);

    }
  }
}

- (void)dealloc
{
  void *v3;
  NSMutableArray *v4;
  id currentSnapshotCompletion;
  void *v6;
  id previousSnapshotCompletion;
  void *v8;
  objc_super v9;
  _QWORD block[4];
  NSMutableArray *v11;
  id v12;

  if (self->_active)
    v3 = _Block_copy(self->_activation);
  else
    v3 = 0;
  v4 = self->_obsoleteCompletions;
  currentSnapshotCompletion = self->_currentSnapshotCompletion;
  if (currentSnapshotCompletion)
  {
    v6 = _Block_copy(currentSnapshotCompletion);
    -[NSMutableArray addObject:](v4, "addObject:", v6);

  }
  previousSnapshotCompletion = self->_previousSnapshotCompletion;
  if (previousSnapshotCompletion)
  {
    v8 = _Block_copy(previousSnapshotCompletion);
    -[NSMutableArray addObject:](v4, "addObject:", v8);

  }
  if (v3 || -[NSMutableArray count](v4, "count"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PKPGSVTransitionInterstitialView_dealloc__block_invoke;
    block[3] = &unk_1E3E618A0;
    v12 = v3;
    v11 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  v9.receiver = self;
  v9.super_class = (Class)PKPGSVTransitionInterstitialView;
  -[PKPGSVTransitionInterstitialView dealloc](&v9, sel_dealloc);
}

void __43__PKPGSVTransitionInterstitialView_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

uint64_t __46__PKPGSVTransitionInterstitialView_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)setAnchorPoint:(CGPoint)a3
{
  double y;
  double x;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)PKPGSVTransitionInterstitialView;
  -[PKPGSVTransitionInterstitialView setAnchorPoint:](&v6, sel_setAnchorPoint_);
  -[PKPGSVTransitionInterstitialSnapshotContainerView setAnchorPoint:](self->_currentContainer, "setAnchorPoint:", x, y);
  -[PKPGSVTransitionInterstitialSnapshotContainerView setAnchorPoint:](self->_previousContainer, "setAnchorPoint:", x, y);
  -[PKPGSVTransitionInterstitialView setNeedsLayout](self, "setNeedsLayout");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)willMoveToSuperview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPGSVTransitionInterstitialView;
  -[PKPGSVTransitionInterstitialView willMoveToSuperview:](&v4, sel_willMoveToSuperview_, a3);
  if (!self->_transferring)
    self->_hasPosition = 0;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int *v13;
  PKPGSVTransitionInterstitialSnapshotContainerView *previousContainer;
  CGSize *p_snapshotSize;
  double v16;
  double v17;
  uint64_t v18;
  CGFloat height;
  Class v20;
  PKPGSVTransitionInterstitialSnapshotContainerView *currentContainer;
  CGSize *v22;
  CGFloat v23;
  Class v24;
  uint64_t v25;
  void (**v26)(_QWORD);
  void (**v27)(void *, UIImageView *, uint64_t);
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  UIImageView *currentSnapshot;
  UIImageView *previousSnapshot;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[10];
  _QWORD aBlock[16];
  objc_super v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)PKPGSVTransitionInterstitialView;
  -[PKPGSVTransitionInterstitialView layoutSubviews](&v50, sel_layoutSubviews);
  -[PKPGSVTransitionInterstitialView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKPGSVTransitionInterstitialView anchorPoint](self, "anchorPoint");
  if (!self->_currentItem || (v13 = &OBJC_IVAR___PKPGSVTransitionInterstitialView__springFactory, !self->_previousItem))
    v13 = &OBJC_IVAR___PKPGSVTransitionInterstitialView__dismissalSpringFactory;
  previousContainer = self->_previousContainer;
  if (previousContainer)
    p_snapshotSize = &previousContainer->_snapshotSize;
  else
    p_snapshotSize = (CGSize *)MEMORY[0x1E0C9D820];
  v16 = v4 + v11 * v8;
  v17 = v6 + v12 * v10;
  v18 = *(uint64_t *)((char *)&self->super.super.super.isa + *v13);
  v20 = *(Class *)&p_snapshotSize->width;
  height = p_snapshotSize->height;
  currentContainer = self->_currentContainer;
  if (currentContainer)
    v22 = &currentContainer->_snapshotSize;
  else
    v22 = (CGSize *)MEMORY[0x1E0C9D820];
  v24 = *(Class *)&v22->width;
  v23 = v22->height;
  v25 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke;
  aBlock[3] = &unk_1E3E64C58;
  aBlock[4] = self;
  *(double *)&aBlock[5] = v4;
  *(double *)&aBlock[6] = v6;
  *(double *)&aBlock[7] = v8;
  *(double *)&aBlock[8] = v10;
  *(double *)&aBlock[9] = v16;
  *(double *)&aBlock[10] = v17;
  aBlock[11] = v24;
  *(CGFloat *)&aBlock[12] = v23;
  aBlock[13] = v20;
  *(CGFloat *)&aBlock[14] = height;
  aBlock[15] = v18;
  v26 = (void (**)(_QWORD))_Block_copy(aBlock);
  v48[0] = v25;
  v48[1] = 3221225472;
  v48[2] = __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke_3;
  v48[3] = &unk_1E3E64C80;
  *(double *)&v48[5] = v4;
  *(double *)&v48[6] = v6;
  *(double *)&v48[7] = v8;
  *(double *)&v48[8] = v10;
  v48[4] = self;
  v48[9] = v18;
  v27 = (void (**)(void *, UIImageView *, uint64_t))_Block_copy(v48);
  if (self->_currentContainer)
    v26[2](v26);
  if (self->_previousContainer)
    v26[2](v26);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v28 = self->_obsoleteContainers;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(v28);
        ((void (*)(void (**)(_QWORD), _QWORD))v26[2])(v26, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v30);
  }

  currentSnapshot = self->_currentSnapshot;
  if (currentSnapshot)
    v27[2](v27, currentSnapshot, 1);
  previousSnapshot = self->_previousSnapshot;
  if (previousSnapshot)
    v27[2](v27, previousSnapshot, 0);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v35 = self->_obsoleteSnapshots;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v41 != v38)
          objc_enumerationMutation(v35);
        v27[2](v27, *(UIImageView **)(*((_QWORD *)&v40 + 1) + 8 * j), 0);
      }
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    }
    while (v37);
  }

}

void __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  double *v3;
  int v4;
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  id v35;
  CATransform3D v36;
  id v37;
  CATransform3D v38;

  v3 = a2;
  v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 417);
  objc_msgSend(v3, "pkui_setBounds:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(v3, "pkui_setPosition:animated:", 0, *(double *)(a1 + 72), *(double *)(a1 + 80));
  v5 = *(double **)(*(_QWORD *)(a1 + 32) + 464);
  if (v3)
  {
    v7 = v3[52];
    v6 = v3[53];
  }
  else
  {
    v6 = 0.0;
    v7 = 0.0;
  }
  if (v5 == v3)
  {
    v11 = 1.0;
  }
  else
  {
    v8 = fmax(*(double *)(a1 + 88), 0.0);
    v9 = fmax(*(double *)(a1 + 96), 0.0);
    v10 = 0.236067977;
    v11 = 0.236067977;
    if (v8 > 0.0)
    {
      v12 = fmax(v7, 0.0);
      v11 = 0.0;
      if (v12 > 0.0)
        v11 = fmax(v8 / v12, 0.236067977);
    }
    if (v9 > 0.0)
    {
      v10 = 0.0;
      v13 = fmax(v6, 0.0);
      if (v13 > 0.0)
        v10 = fmax(v9 / v13, 0.236067977);
    }
    if (v11 <= 0.0 || v10 <= 0.0)
    {
      if (v11 <= 0.0)
      {
        if (v10 > 0.0)
          v11 = v10;
        else
          v11 = 0.236067977;
      }
    }
    else
    {
      v11 = fmin(v11, v10);
    }
  }
  if (objc_msgSend(v3, "isHidden"))
  {
    objc_msgSend(v3, "setHidden:", 0);
    if (v4)
    {
      v14 = 96;
      if (v5 == v3)
        v14 = 112;
      v15 = 88;
      if (v5 == v3)
        v15 = 104;
      v16 = fmax(*(double *)(a1 + v15), 0.0);
      v17 = fmax(*(double *)(a1 + v14), 0.0);
      v18 = 0.236067977;
      v19 = 0.236067977;
      if (v16 > 0.0)
      {
        v20 = fmax(v7, 0.0);
        v19 = 0.0;
        if (v20 > 0.0)
          v19 = fmax(v16 / v20, 0.236067977);
      }
      if (v17 > 0.0)
      {
        v18 = 0.0;
        v21 = fmax(v6, 0.0);
        if (v21 > 0.0)
          v18 = fmax(v17 / v21, 0.236067977);
      }
      if (v19 <= 0.0 || v18 <= 0.0)
      {
        if (v19 <= 0.0)
        {
          v19 = 0.236067977;
          if (v18 > 0.0)
            v19 = v18;
        }
      }
      else
      {
        v19 = fmin(v19, v18);
      }
      CATransform3DMakeScale(&v38, v19, v19, 1.0);
      objc_msgSend(v3, "pkui_setTransform:animated:", &v38, 0);
      v37 = 0;
      CATransform3DMakeScale(&v36, v11, v11, 1.0);
      goto LABEL_41;
    }
    v37 = 0;
    CATransform3DMakeScale(&v36, v11, v11, 1.0);
LABEL_36:
    v22 = 0;
    goto LABEL_42;
  }
  v37 = 0;
  CATransform3DMakeScale(&v36, v11, v11, 1.0);
  if (!v4)
    goto LABEL_36;
LABEL_41:
  v22 = *(_QWORD *)(a1 + 120);
LABEL_42:
  objc_msgSend(v3, "pkui_setTransform:withAdditiveAnimationFactory:animation:", &v36, v22, &v37);
  if (v37)
  {
    objc_msgSend(v37, "setHighFrameRateReason:", 2162689);
    LODWORD(v23) = 1117782016;
    LODWORD(v24) = 1123024896;
    LODWORD(v25) = 1123024896;
    objc_msgSend(v37, "setPreferredFrameRateRange:", v23, v24, v25);
    v26 = -[PKPGSVTransitionInterstitialView _incrementAnimationCount](*(_QWORD **)(a1 + 32));
    v27 = v37;
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke_2;
    v34 = &unk_1E3E614F0;
    v35 = v26;
    v28 = v26;
    objc_msgSend(v27, "pkui_setCompletionHandler:", &v31);
    objc_msgSend(v3, "layer", v31, v32, v33, v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend(v29, "pkui_addAdditiveAnimation:", v37);

  }
}

- (void)_incrementAnimationCount
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[4];
  id v16;
  id location;

  if (!a1)
    return 0;
  ++a1[53];
  -[PKPGSVTransitionInterstitialView _updateActive]((uint64_t)a1);
  objc_initWeak(&location, a1);
  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PKPGSVTransitionInterstitialView__incrementAnimationCount__block_invoke;
  aBlock[3] = &unk_1E3E61310;
  objc_copyWeak(&v16, &location);
  v3 = _Block_copy(aBlock);
  v4 = objc_alloc(MEMORY[0x1E0D66CA8]);
  v13[0] = v2;
  v13[1] = 3221225472;
  v13[2] = __60__PKPGSVTransitionInterstitialView__incrementAnimationCount__block_invoke_2;
  v13[3] = &unk_1E3E61590;
  v5 = v3;
  v14 = v5;
  v10[0] = v2;
  v10[1] = 3221225472;
  v10[2] = __60__PKPGSVTransitionInterstitialView__incrementAnimationCount__block_invoke_3;
  v10[3] = &unk_1E3E61850;
  v11 = (id)objc_msgSend(v4, "initWithBlock:", v13);
  v12 = v5;
  v6 = v5;
  v7 = v11;
  v8 = _Block_copy(v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return v8;
}

uint64_t __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke_3(uint64_t a1, void *a2, unsigned int a3)
{
  id v5;
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
  int v18;
  void *v19;
  uint64_t v20;
  double v21;
  void *v22;
  id v23;
  double v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;

  v5 = a2;
  if (objc_msgSend(v5, "isHidden"))
    objc_msgSend(v5, "setHidden:", 0);
  objc_msgSend(v5, "anchorPoint");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "bounds");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "alignmentRectInsets");
  objc_msgSend(v5, "pkui_setPosition:animated:", 0, *(double *)(a1 + 40) + (*(double *)(a1 + 56) - (v11 - (v14 + v15))) * 0.5 - v14 + v7 * v11, *(double *)(a1 + 48) + (*(double *)(a1 + 64) - (v13 - (v16 + v17))) * 0.5 - v16 + v9 * v13);
  v18 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 417);
  objc_msgSend(v5, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  if (v18)
    v20 = *(_QWORD *)(a1 + 72);
  else
    v20 = 0;
  objc_msgSend(v5, "pkui_setAlpha:withAnimationFactory:animation:", v20, &v42, (double)a3);
  if (v42 || v21 != (double)a3)
  {
    if (v42)
      v22 = -[PKPGSVTransitionInterstitialView _incrementAnimationCount](*(_QWORD **)(a1 + 32));
    else
      v22 = 0;
    objc_msgSend(v19, "removeAnimationForKey:", CFSTR("opacity"));
    v23 = v42;
    if (v42)
    {
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke_4;
      v40[3] = &unk_1E3E614F0;
      v41 = v22;
      objc_msgSend(v23, "pkui_setCompletionHandler:", v40);
      objc_msgSend(v19, "addAnimation:forKey:", v42, CFSTR("opacity"));

    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 416))
    goto LABEL_32;
  if (a3)
    v24 = 0.0;
  else
    v24 = 8.33333333;
  if (v18)
    v25 = *(void **)(a1 + 72);
  else
    v25 = 0;
  v26 = v19;
  v27 = v25;
  if (v26)
  {
    v28 = v27;
    objc_msgSend(v26, "valueForKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      objc_msgSend(v29, "doubleValue");
      v32 = v31;
    }
    else
    {
      v32 = 0.0;
    }
    if (v32 == v24
      || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24),
          v34 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v26, "setValue:forKeyPath:", v34, CFSTR("filters.gaussianBlur.inputRadius")),
          v34,
          !v28))
    {
      v33 = 0;
    }
    else
    {
      objc_msgSend(v28, "springAnimationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v32, v24);
    }

    if (v33)
    {
      v35 = -[PKPGSVTransitionInterstitialView _incrementAnimationCount](*(_QWORD **)(a1 + 32));
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke_5;
      v38[3] = &unk_1E3E614F0;
      v39 = v35;
      v36 = v35;
      objc_msgSend(v33, "pkui_setCompletionHandler:", v38);
      v37 = (id)objc_msgSend(v26, "pkui_addAdditiveAnimation:", v33);

    }
LABEL_32:

    return;
  }
  __break(1u);
}

uint64_t __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_pruneObsoleteSnapshots
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 420))
  {
    if (objc_msgSend(*(id *)(a1 + 520), "count"))
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v2 = *(id *)(a1 + 520);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v3)
      {
        v4 = v3;
        v5 = *(_QWORD *)v27;
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v27 != v5)
              objc_enumerationMutation(v2);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v6++), "removeFromSuperview");
          }
          while (v4 != v6);
          v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        }
        while (v4);
      }

      objc_msgSend(*(id *)(a1 + 520), "removeAllObjects");
    }
    if (objc_msgSend(*(id *)(a1 + 528), "count"))
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v7 = *(id *)(a1 + 528);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v23;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v23 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11++), "removeFromSuperview");
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
        }
        while (v9);
      }

      objc_msgSend(*(id *)(a1 + 528), "removeAllObjects");
    }
    if (objc_msgSend(*(id *)(a1 + 536), "count"))
    {
      v12 = (void *)objc_msgSend(*(id *)(a1 + 536), "copy");
      objc_msgSend(*(id *)(a1 + 536), "removeAllObjects");
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v19;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v19 != v16)
              objc_enumerationMutation(v13);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17) + 16))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17));
            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
        }
        while (v15);
      }

    }
  }
}

- (void)_swapItemsAnimated:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (!*(_BYTE *)(a1 + 421))
  {
    objc_msgSend((id)a1, "layoutIfNeeded");
    v2 = *(id *)(a1 + 488);
    objc_storeStrong((id *)(a1 + 488), *(id *)(a1 + 456));
    v3 = *(void **)(a1 + 456);
    *(_QWORD *)(a1 + 456) = v2;
    v15 = v2;

    v4 = *(id *)(a1 + 496);
    objc_storeStrong((id *)(a1 + 496), *(id *)(a1 + 464));
    v5 = *(void **)(a1 + 464);
    *(_QWORD *)(a1 + 464) = v4;
    v6 = v4;

    v7 = *(id *)(a1 + 504);
    objc_storeStrong((id *)(a1 + 504), *(id *)(a1 + 472));
    v8 = *(void **)(a1 + 472);
    *(_QWORD *)(a1 + 472) = v7;
    v9 = v7;

    v10 = _Block_copy(*(const void **)(a1 + 512));
    v11 = _Block_copy(*(const void **)(a1 + 480));
    v12 = *(void **)(a1 + 512);
    *(_QWORD *)(a1 + 512) = v11;

    v13 = _Block_copy(v10);
    v14 = *(void **)(a1 + 480);
    *(_QWORD *)(a1 + 480) = v13;

    objc_msgSend((id)a1, "setNeedsLayout");
    *(_BYTE *)(a1 + 417) = 1;
    objc_msgSend((id)a1, "layoutIfNeeded");
    *(_BYTE *)(a1 + 417) = 0;

  }
}

void __83__PKPGSVTransitionInterstitialView__setCurrentItem_withDefaultSize_force_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
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
  uint64_t v17;
  double *v18;
  double *v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v5, "alignmentRectInsets");
  v13 = v8 - (v11 + v12);
  v16 = v10 - (v14 + v15);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464);
  if (v17)
  {
    v18 = (double *)(v17 + 416);
    *v18 = v13;
    v18[1] = v16;
  }
  else
  {
    v19 = -[PKPGSVTransitionInterstitialSnapshotContainerView initWithSnapshotSize:]((double *)[PKPGSVTransitionInterstitialSnapshotContainerView alloc], v13, v16);
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(v20 + 464);
    *(_QWORD *)(v20 + 464) = v19;

    v22 = *(_QWORD **)(a1 + 32);
    v23 = (void *)v22[58];
    objc_msgSend(v22, "anchorPoint");
    objc_msgSend(v23, "setAnchorPoint:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setHidden:", 1);
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "addSubview:", v5);
  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(void **)(v24 + 472);
  *(_QWORD *)(v24 + 472) = v5;
  v29 = v5;

  v26 = _Block_copy(v6);
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(void **)(v27 + 480);
  *(_QWORD *)(v27 + 480) = v26;

}

void __84__PKPGSVTransitionInterstitialView__setPreviousItem_withDefaultSize_force_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
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
  uint64_t v17;
  double *v18;
  double *v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v5, "alignmentRectInsets");
  v13 = v8 - (v11 + v12);
  v16 = v10 - (v14 + v15);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 496);
  if (v17)
  {
    v18 = (double *)(v17 + 416);
    *v18 = v13;
    v18[1] = v16;
  }
  else
  {
    v19 = -[PKPGSVTransitionInterstitialSnapshotContainerView initWithSnapshotSize:]((double *)[PKPGSVTransitionInterstitialSnapshotContainerView alloc], v13, v16);
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(v20 + 496);
    *(_QWORD *)(v20 + 496) = v19;

    v22 = *(_QWORD **)(a1 + 32);
    v23 = (void *)v22[62];
    objc_msgSend(v22, "anchorPoint");
    objc_msgSend(v23, "setAnchorPoint:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setHidden:", 1);
    v24 = *(_QWORD **)(a1 + 32);
    v25 = v24[62];
    if (v24[58])
      objc_msgSend(v24, "insertSubview:belowSubview:", v25);
    else
      objc_msgSend(v24, "addSubview:", v25);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "addSubview:", v5);
  v26 = *(_QWORD *)(a1 + 32);
  v27 = *(void **)(v26 + 504);
  *(_QWORD *)(v26 + 504) = v5;
  v31 = v5;

  v28 = _Block_copy(v6);
  v29 = *(_QWORD *)(a1 + 32);
  v30 = *(void **)(v29 + 512);
  *(_QWORD *)(v29 + 512) = v28;

}

- (void)_setPosition:(uint64_t)a1 animated:(int)a2
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  v3 = 0;
  v17 = 0;
  *(_BYTE *)(a1 + 419) = 1;
  if (a2)
    v3 = *(_QWORD *)(a1 + 432);
  objc_msgSend((id)a1, "pkui_setPosition:withAdditiveAnimationFactory:animation:", v3, &v17);
  if (v17)
  {
    objc_msgSend(v17, "setHighFrameRateReason:", 2162689);
    LODWORD(v4) = 1117782016;
    LODWORD(v5) = 1123024896;
    LODWORD(v6) = 1123024896;
    objc_msgSend(v17, "setPreferredFrameRateRange:", v4, v5, v6);
    v7 = -[PKPGSVTransitionInterstitialView _incrementAnimationCount]((_QWORD *)a1);
    v8 = v17;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __58__PKPGSVTransitionInterstitialView__setPosition_animated___block_invoke;
    v15 = &unk_1E3E614F0;
    v16 = v7;
    v9 = v7;
    objc_msgSend(v8, "pkui_setCompletionHandler:", &v12);
    objc_msgSend((id)a1, "layer", v12, v13, v14, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v17);

  }
}

uint64_t __58__PKPGSVTransitionInterstitialView__setPosition_animated___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__PKPGSVTransitionInterstitialView__setContainerAlpha_animated___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__PKPGSVTransitionInterstitialView_transferToView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGFloat)resolveIndeterminatePositionWithPriorItemFrame:(CGFloat)a3 animated:(CGFloat)a4
{
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  _BOOL4 v19;
  CGRect v21;

  if (!a1)
    return 0.0;
  objc_msgSend((id)a1, "bounds");
  v13 = v12;
  objc_msgSend((id)a1, "anchorPoint");
  v15 = v14;
  if (*(_QWORD *)(a1 + 456))
  {
    objc_msgSend((id)a1, "center");
    v17 = *(_QWORD *)(a1 + 464);
    if (v17)
      v18 = *(double *)(v17 + 416);
    else
      v18 = 0.0;
    return v16 - v15 * v13 + (v13 - v18) * 0.5;
  }
  else
  {
    v21.origin.x = a3;
    v21.origin.y = a4;
    v21.size.width = a5;
    v21.size.height = a6;
    if (!CGRectIsNull(v21))
    {
      if (a2)
        v19 = *(_BYTE *)(a1 + 419) != 0;
      else
        v19 = 0;
      -[PKPGSVTransitionInterstitialView _setPosition:animated:](a1, v19);
    }
  }
  return a3;
}

- (double)pushItem:(double)a3 withDefaultSize:(double)a4 containerAlpha:(double)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;

  v9 = a2;
  if (!a1)
  {
    a3 = 0.0;
    goto LABEL_14;
  }
  -[PKPGSVTransitionInterstitialView _setContainerAlpha:animated:]((_QWORD *)a1, 1, a5);
  v10 = v9;
  v11 = v10;
  if (!*(_BYTE *)(a1 + 421))
  {
    if (!v10)
      goto LABEL_6;
    if (*(id *)(a1 + 456) != v10)
    {
      if (*(id *)(a1 + 488) != v10)
      {
LABEL_6:
        -[PKPGSVTransitionInterstitialView _setPreviousItem:withDefaultSize:force:animated:](a1, v10, 1, 1, a3, a4);
        -[PKPGSVTransitionInterstitialView _swapItemsAnimated:](a1);
        -[PKPGSVTransitionInterstitialView _pruneObsoleteSnapshots](a1);
        if (!*(_QWORD *)(a1 + 456))
          goto LABEL_12;
        v12 = *(_QWORD *)(a1 + 464);
        if (!v12)
        {
          a3 = 0.0;
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      -[PKPGSVTransitionInterstitialView _swapItemsAnimated:](a1);
    }
    v12 = *(_QWORD *)(a1 + 464);
    if (!v12)
    {

      a3 = 0.0;
      goto LABEL_13;
    }
LABEL_11:
    a3 = *(double *)(v12 + 416);
  }
LABEL_12:

  if (v11)
LABEL_13:
    -[PKPGSVTransitionInterstitialView _updatePositionAnimated:](a1, 1);
LABEL_14:

  return a3;
}

- (double)updateCurrentItem:(double)a3 withDefaultSize:(double)a4 containerAlpha:(double)a5
{
  double v8;

  if (!a1)
    return 0.0;
  v8 = -[PKPGSVTransitionInterstitialView _setCurrentItem:withDefaultSize:force:animated:]((uint64_t)a1, a2, 0, 1, a3, a4);
  if (a2)
    -[PKPGSVTransitionInterstitialView _updatePositionAnimated:]((uint64_t)a1, 1);
  -[PKPGSVTransitionInterstitialView _setContainerAlpha:animated:](a1, 1, a5);
  return v8;
}

void __60__PKPGSVTransitionInterstitialView__incrementAnimationCount__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    --WeakRetained[53];
    v2 = WeakRetained;
    -[PKPGSVTransitionInterstitialView _updateActive]((uint64_t)WeakRetained);
    WeakRetained = v2;
  }

}

uint64_t __60__PKPGSVTransitionInterstitialView__incrementAnimationCount__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__PKPGSVTransitionInterstitialView__incrementAnimationCount__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obsoleteCompletions, 0);
  objc_storeStrong((id *)&self->_obsoleteSnapshots, 0);
  objc_storeStrong((id *)&self->_obsoleteContainers, 0);
  objc_storeStrong(&self->_previousSnapshotCompletion, 0);
  objc_storeStrong((id *)&self->_previousSnapshot, 0);
  objc_storeStrong((id *)&self->_previousContainer, 0);
  objc_storeStrong((id *)&self->_previousItem, 0);
  objc_storeStrong(&self->_currentSnapshotCompletion, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_currentContainer, 0);
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_storeStrong(&self->_activation, 0);
  objc_storeStrong((id *)&self->_dismissalSpringFactory, 0);
  objc_storeStrong((id *)&self->_springFactory, 0);
}

@end
