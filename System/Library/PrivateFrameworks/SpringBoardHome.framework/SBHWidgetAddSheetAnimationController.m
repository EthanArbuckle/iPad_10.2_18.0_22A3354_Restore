@implementation SBHWidgetAddSheetAnimationController

- (SBHWidgetAddSheetAnimationController)initWithSourceCell:(id)a3
{
  id v5;
  SBHWidgetAddSheetAnimationController *v6;
  SBHWidgetAddSheetAnimationController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHWidgetAddSheetAnimationController;
  v6 = -[_UISheetAnimationController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sourceCell, a3);

  return v7;
}

- (SBHPortaledShadowedWidgetView)portaledShadowedWidgetView
{
  SBHPortaledShadowedWidgetView *portaledShadowedWidgetView;
  void *v4;
  void *v5;
  SBHPortaledShadowedWidgetView *v6;
  SBHPortaledShadowedWidgetView *v7;

  portaledShadowedWidgetView = self->_portaledShadowedWidgetView;
  if (!portaledShadowedWidgetView)
  {
    -[SBHAddWidgetSheetGalleryCollectionViewCell widgetWrapperViewController](self->_sourceCell, "widgetWrapperViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wrapperView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (SBHPortaledShadowedWidgetView *)objc_msgSend(v5, "newPortaledShadowedWidgetView");
    v7 = self->_portaledShadowedWidgetView;
    self->_portaledShadowedWidgetView = v6;

    portaledShadowedWidgetView = self->_portaledShadowedWidgetView;
  }
  return portaledShadowedWidgetView;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;
  SBHWidgetAddSheetAnimationController *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__SBHWidgetAddSheetAnimationController_animateTransition___block_invoke;
  v8[3] = &unk_1E8D84EF0;
  v9 = v4;
  v10 = self;
  v6 = v4;
  objc_msgSend(v5, "performWithoutAnimation:", v8);
  v7.receiver = self;
  v7.super_class = (Class)SBHWidgetAddSheetAnimationController;
  -[_UISheetAnimationController animateTransition:](&v7, sel_animateTransition_, v6);

}

void __58__SBHWidgetAddSheetAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "widgetWrapperViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "galleryItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "widgetWrapperViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureForGalleryItem:selectedSizeClass:", v3, objc_msgSend(v4, "selectedSizeClass"));

}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  id v4;
  void *v5;
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
  double v16;
  double v17;
  BOOL v18;
  char v19;
  UIView *v20;
  void *v21;
  void *v22;
  void *v23;
  UIView *v24;
  void *v25;
  UIView *v26;
  void *v27;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  UIView *v54;
  UIView *matchMoveView;
  UIView *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  UIView *v69;
  id v70;
  id v71;
  id v72;
  char v73;
  objc_super v74;
  _QWORD v75[3];

  v75[1] = *MEMORY[0x1E0C80C00];
  v74.receiver = self;
  v74.super_class = (Class)SBHWidgetAddSheetAnimationController;
  v4 = a3;
  -[_UISheetAnimationController interruptibleAnimatorForTransition:](&v74, sel_interruptibleAnimatorForTransition_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetGalleryCollectionViewCell widgetWrapperViewController](self->_sourceCell, "widgetWrapperViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wrapperView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentPage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "widgetWrapperViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "wrapperView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "containerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHWidgetAddSheetAnimationController portaledShadowedWidgetView](self, "portaledShadowedWidgetView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHWidgetAddSheetAnimationController fromPoint](self, "fromPoint");
  v18 = v17 == *MEMORY[0x1E0C9D538] && v16 == *(double *)(MEMORY[0x1E0C9D538] + 8);
  v66 = v6;
  v67 = v14;
  if (v18)
  {
    objc_msgSend(v9, "bounds");
    UIRectGetCenter();
    objc_msgSend(v15, "convertPoint:fromView:", v9);
    self->_fromPoint.x = v29;
    self->_fromPoint.y = v30;
    objc_msgSend(v13, "bounds");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    objc_msgSend(v6, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bounds");
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;
    objc_msgSend(v6, "view");
    v65 = v10;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertRect:fromView:", v48, v41, v43, v45, v47);
    v50 = v49;
    v52 = v51;

    objc_msgSend(v15, "bounds");
    v26 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v50, 0.0, v52, v53);
    -[UIView setClipsToBounds:](v26, "setClipsToBounds:", 1);
    -[UIView setUserInteractionEnabled:](v26, "setUserInteractionEnabled:", 0);
    objc_msgSend(v15, "addSubview:", v26);
    v54 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v32, v34, v36, v38);
    matchMoveView = self->_matchMoveView;
    self->_matchMoveView = v54;

    v56 = self->_matchMoveView;
    UIRectGetCenter();
    -[UIView convertPoint:fromView:](v26, "convertPoint:fromView:", v13);
    -[UIView setCenter:](v56, "setCenter:");
    -[UIView setClipsToBounds:](self->_matchMoveView, "setClipsToBounds:", 0);
    -[UIView setUserInteractionEnabled:](self->_matchMoveView, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](self->_matchMoveView, "addSubview:", v14);
    -[UIView addSubview:](v26, "addSubview:", self->_matchMoveView);
    objc_msgSend(MEMORY[0x1E0CD27C0], "animation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v64 = v7;
    v23 = v9;
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSourceLayer:", v57);

    objc_msgSend(v27, "setDuration:", INFINITY);
    objc_msgSend(v27, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v27, "setRemovedOnCompletion:", 0);
    objc_msgSend(v27, "setAppliesY:", 1);
    objc_msgSend(v27, "setAppliesX:", 1);
    v58 = (void *)MEMORY[0x1E0CB3B18];
    UIRectGetCenter();
    objc_msgSend(v58, "valueWithCGPoint:");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v59;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 1);
    v60 = v5;
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSourcePoints:", v61);

    v5 = v60;
    -[UIView layer](self->_matchMoveView, "layer");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "addAnimation:forKey:", v27, CFSTR("match-move"));

    v28 = v64;
    v25 = v65;
  }
  else
  {
    v19 = objc_msgSend(v7, "forcesEdgeAntialiasing");
    objc_msgSend(v7, "setForcesEdgeAntialiasing:", 1);
    objc_msgSend(v10, "setJumpAnimationInProgress:", 1);
    -[UIView convertPoint:fromView:](self->_matchMoveView, "convertPoint:fromView:", v15, self->_fromPoint.x, self->_fromPoint.y);
    objc_msgSend(v14, "setCenter:");
    v20 = self->_matchMoveView;
    v21 = v14;
    v22 = v7;
    v23 = v9;
    v24 = v20;
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke;
    v68[3] = &unk_1E8D85290;
    v69 = v20;
    v70 = v21;
    v71 = v10;
    v72 = v22;
    v73 = v19;
    v25 = v10;
    v26 = v24;
    objc_msgSend(v5, "addAnimations:", v68);

    v27 = v69;
    v28 = v22;
  }

  return v5;
}

void __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  UIRectGetCenter();
  objc_msgSend(*(id *)(a1 + 40), "setCenter:");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke_2;
  block[3] = &unk_1E8D85290;
  v3 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 56);
  v7 = *(_BYTE *)(a1 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  char v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;

  memset(&v20, 0, sizeof(v20));
  CGAffineTransformMakeScale(&v20, 1.4, 1.4);
  v18 = v20;
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformTranslate(&v19, &v18, 0.0, 25.0);
  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke_3;
  v14[3] = &unk_1E8D85240;
  v15 = *(id *)(a1 + 32);
  v16 = v20;
  v17 = v19;
  objc_msgSend(v3, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v14, 0, 0.375, 0.0, 1.0, 5.0);
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v10[0] = v2;
  v10[1] = 3221225472;
  v10[2] = __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke_4;
  v10[3] = &unk_1E8D84F18;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 32);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke_5;
  v5[3] = &unk_1E8D85268;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 56);
  v9 = *(_BYTE *)(a1 + 64);
  objc_msgSend(v4, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v10, v5, 1.5, 0.0, 1.0, 0.0);

}

uint64_t __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke_3(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  __int128 v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v7 = *(_OWORD *)(a1 + 40);
  v8 = v3;
  v9 = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "setContentTransform:", &v7);
  v4 = *(void **)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 104);
  v7 = *(_OWORD *)(a1 + 88);
  v8 = v5;
  v9 = *(_OWORD *)(a1 + 120);
  return objc_msgSend(v4, "setShadowSupplementalTransform:", &v7);
}

void __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v12[8];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "wrapperViewTransform");
  v3 = *(void **)(a1 + 40);
  v13 = v16;
  v14 = v17;
  v15 = v18;
  objc_msgSend(v3, "setTransform:", &v13);
  v4 = *(void **)(a1 + 48);
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v13 = *MEMORY[0x1E0C9BAA8];
  v10 = v13;
  v14 = v11;
  v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v9 = v15;
  objc_msgSend(v4, "setContentTransform:", &v13);
  v5 = *(void **)(a1 + 48);
  v13 = v10;
  v14 = v11;
  v15 = v9;
  objc_msgSend(v5, "setShadowSupplementalTransform:", &v13);
  objc_msgSend(*(id *)(a1 + 32), "widgetWrapperViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wrapperView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 48);
  if (v7)
    objc_msgSend(v7, "hoverTransform");
  else
    memset(v12, 0, sizeof(v12));
  objc_msgSend(v8, "setTransform3D:", v12);
  objc_msgSend(*(id *)(a1 + 48), "setPerspectiveEnabled:", objc_msgSend(v7, "isHoverAnimationEnabled"));

}

uint64_t __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setJumpAnimationInProgress:", 0);
  return objc_msgSend(*(id *)(a1 + 48), "setForcesEdgeAntialiasing:", *(unsigned __int8 *)(a1 + 56));
}

- (void)interruptAnimation
{
  -[SBHPortaledShadowedWidgetView setHidesSourceViews:](self->_portaledShadowedWidgetView, "setHidesSourceViews:", 0);
}

- (SBHAddWidgetSheetGalleryCollectionViewCell)sourceCell
{
  return self->_sourceCell;
}

- (void)setSourceCell:(id)a3
{
  objc_storeStrong((id *)&self->_sourceCell, a3);
}

- (void)setPortaledShadowedWidgetView:(id)a3
{
  objc_storeStrong((id *)&self->_portaledShadowedWidgetView, a3);
}

- (CGPoint)fromPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_fromPoint.x;
  y = self->_fromPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFromPoint:(CGPoint)a3
{
  self->_fromPoint = a3;
}

- (UIView)matchMoveView
{
  return self->_matchMoveView;
}

- (void)setMatchMoveView:(id)a3
{
  objc_storeStrong((id *)&self->_matchMoveView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchMoveView, 0);
  objc_storeStrong((id *)&self->_portaledShadowedWidgetView, 0);
  objc_storeStrong((id *)&self->_sourceCell, 0);
}

@end
