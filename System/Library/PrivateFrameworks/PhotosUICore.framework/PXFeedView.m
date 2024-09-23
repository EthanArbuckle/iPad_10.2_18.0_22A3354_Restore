@implementation PXFeedView

- (PXFeedView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedView.m"), 58, CFSTR("%s is not available as initializer"), "-[PXFeedView initWithFrame:]");

  abort();
}

- (PXFeedView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedView.m"), 62, CFSTR("%s is not available as initializer"), "-[PXFeedView initWithCoder:]");

  abort();
}

- (PXFeedView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  PXFeedView *v10;
  void *v11;
  void *v12;
  PXFeedViewModel *v13;
  PXFeedViewModel *viewModel;
  void *v15;
  int v16;
  PXFeedContentLayout *v17;
  PXFeedContentLayout *feedContentLayout;
  PXFeedViewScrollLayout *v19;
  PXFeedViewScrollLayout *v20;
  void *v21;
  void *v22;
  PXFeedTitleLayout *v23;
  PXFeedTitleLayout *titleLayout;
  PXGSplitLayout *v25;
  PXGSplitLayout *splitLayout;
  PXGSplitLayout *v27;
  PXFeedViewScrollLayout *v28;
  char v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  PXGViewCoordinator *v37;
  void *v38;
  void *v39;
  id v40;
  id *v41;
  id v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  id *v54;
  id v55;
  char v56;
  objc_super v57;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v57.receiver = self;
  v57.super_class = (Class)PXFeedView;
  v10 = -[PXFeedView initWithFrame:](&v57, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    objc_msgSend(v9, "feedConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PXFeedViewModel initWithFeedViewConfiguration:]([PXFeedViewModel alloc], "initWithFeedViewConfiguration:", v9);
    viewModel = v10->_viewModel;
    v10->_viewModel = v13;

    objc_msgSend(v9, "feedConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "wantsEmbeddedScrollView");

    v17 = -[PXFeedContentLayout initWithViewModel:]([PXFeedContentLayout alloc], "initWithViewModel:", v10->_viewModel);
    feedContentLayout = v10->_feedContentLayout;
    v10->_feedContentLayout = v17;

    if (v16)
      v19 = -[PXFeedViewScrollLayout initWithViewModel:displayingFeedContentLayout:]([PXFeedViewScrollLayout alloc], "initWithViewModel:displayingFeedContentLayout:", v10->_viewModel, v10->_feedContentLayout);
    else
      v19 = v10->_feedContentLayout;
    v20 = v19;
    objc_msgSend(v9, "feedConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedSubtitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = -[PXFeedTitleLayout initWithViewModel:]([PXFeedTitleLayout alloc], "initWithViewModel:", v10->_viewModel);
      titleLayout = v10->_titleLayout;
      v10->_titleLayout = v23;

      v25 = objc_alloc_init(PXGSplitLayout);
      splitLayout = v10->_splitLayout;
      v10->_splitLayout = v25;

      -[PXGSplitLayout setFirstSublayout:](v10->_splitLayout, "setFirstSublayout:", v10->_titleLayout);
      -[PXGSplitLayout setSecondSublayout:](v10->_splitLayout, "setSecondSublayout:", v20);
      -[PXGSplitLayout setObjectReferenceLookup:](v10->_splitLayout, "setObjectReferenceLookup:", 2);
      v27 = v10->_splitLayout;

      v20 = (PXFeedViewScrollLayout *)v27;
    }
    v51 = v9;
    v50 = v16;
    v28 = v20;
    if ((v16 & 1) != 0)
    {
      v29 = 0;
    }
    else
    {
      -[PXFeedViewModel spec](v10->_viewModel, "spec");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v30, "wantsScrollIndicators");

    }
    -[PXFeedView bounds](v10, "bounds");
    -[PXFeedViewModel spec](v10->_viewModel, "spec");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "viewOutsets");
    sub_1A7AE3F38();
    PXEdgeInsetsInsetRect();
    PXAddEdgeOverlaySubviewsToWorkAround53118165(v10, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = [PXGViewCoordinator alloc];
    objc_msgSend(v36, "firstObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "containerViewController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __42__PXFeedView_initWithFrame_configuration___block_invoke;
    v52[3] = &unk_1E513D9A8;
    v40 = v12;
    v53 = v40;
    v41 = v10;
    v54 = v41;
    v42 = v11;
    v55 = v42;
    v56 = v29;
    v43 = -[PXGViewCoordinator initWithContentLayout:containerView:belowSubview:containerViewController:configuration:](v37, "initWithContentLayout:containerView:belowSubview:containerViewController:configuration:", v28, v41, v38, v39, v52);
    v44 = v41[64];
    v41[64] = (id)v43;

    objc_msgSend(v41[64], "tungstenView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setAxNextResponder:", v41);

    if (v50)
    {
      objc_msgSend(v41[64], "tungstenView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "scrollViewController");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "scrollView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setScrollEnabled:", 0);

    }
    objc_msgSend(v41, "_installGestureRecognizers");

    v9 = v51;
  }

  return v10;
}

- (void)setIsActive:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    -[PXFeedView viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __26__PXFeedView_setIsActive___block_invoke;
    v5[3] = &__block_descriptor_33_e39_v16__0___PXStoryMutableFeedViewModel__8l;
    v6 = a3;
    objc_msgSend(v4, "performChanges:", v5);

  }
}

- (PXGView)tungstenView
{
  void *v2;
  void *v3;

  -[PXFeedView tungstenViewCoordinator](self, "tungstenViewCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tungstenView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXGView *)v3;
}

- (id)regionOfInterestForObjectReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PXFeedView feedContentLayout](self, "feedContentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spriteReferenceForObjectReference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXFeedView tungstenView](self, "tungstenView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "regionOfInterestForSpriteReference:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)scrollObjectReference:(id)a3 toScrollPosition:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v6 = a3;
  -[PXFeedView tungstenView](self, "tungstenView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rootLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createAnchorForScrollingSpriteForObjectReference:toScrollPosition:padding:", v6, a4, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v8, "autoInvalidate");
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXFeedView feedContentLayout](self, "feedContentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemPlacementControllerForItemReference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setCurrentTouchCompletion:(id)a3
{
  void (**v4)(void);
  void (**currentTouchCompletion)(void);
  void *v6;
  id v7;
  void (**v8)(void);

  v4 = (void (**)(void))a3;
  currentTouchCompletion = (void (**)(void))self->_currentTouchCompletion;
  if (currentTouchCompletion != v4)
  {
    v8 = v4;
    if (currentTouchCompletion)
    {
      currentTouchCompletion[2]();
      v4 = v8;
    }
    v6 = _Block_copy(v4);
    v7 = self->_currentTouchCompletion;
    self->_currentTouchCompletion = v6;

    v4 = v8;
  }

}

- (void)setCurrentHoverCompletion:(id)a3
{
  void (**v4)(void);
  void (**currentHoverCompletion)(void);
  void *v6;
  id v7;
  void (**v8)(void);

  v4 = (void (**)(void))a3;
  currentHoverCompletion = (void (**)(void))self->_currentHoverCompletion;
  if (currentHoverCompletion != v4)
  {
    v8 = v4;
    if (currentHoverCompletion)
    {
      currentHoverCompletion[2]();
      v4 = v8;
    }
    v6 = _Block_copy(v4);
    v7 = self->_currentHoverCompletion;
    self->_currentHoverCompletion = v6;

    v4 = v8;
  }

}

- (BOOL)handlePrimaryInteractionAtPoint:(CGPoint)a3
{
  double y;
  double x;
  PXFeedView *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  v5 = self;
  -[PXFeedView tungstenView](self, "tungstenView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromView:", v5, x, y);
  LOBYTE(v5) = objc_msgSend(v6, "handlePrimaryInteractionAtPoint:");

  return (char)v5;
}

- (void)beginTouchingAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  -[PXFeedView tungstenView](self, "tungstenView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:fromView:", self, x, y);
  objc_msgSend(v7, "handleTouchAtPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedView setCurrentTouchCompletion:](self, "setCurrentTouchCompletion:", v6);

}

- (void)endTouching
{
  -[PXFeedView setCurrentTouchCompletion:](self, "setCurrentTouchCompletion:", 0);
}

- (PXSimpleIndexPath)indexPathClosestToIndexPath:(SEL)a3 inDirection:(PXSimpleIndexPath *)a4
{
  void *v8;
  void *v9;
  __int128 v10;
  PXSimpleIndexPath *result;
  _OWORD v12[2];

  -[PXFeedView feedContentLayout](self, "feedContentLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = *(_OWORD *)&a4->item;
    v12[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v12[1] = v10;
    objc_msgSend(v8, "indexPathClosestToIndexPath:inDirection:", v12, a5);
  }
  else
  {
    *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
    *(_OWORD *)&retstr->item = 0u;
  }

  return result;
}

- (void)_handleHoverEventAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(void);
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  y = a3.y;
  x = a3.x;
  -[PXFeedView tungstenView](self, "tungstenView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromView:", 0, x, y);
  objc_msgSend(v6, "feedHitTestResultAtPoint:ignoringOverlayContent:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedView viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "dataSourceIndexPath");
    objc_msgSend(v9, "objectIDAtIndexPath:", &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[PXFeedView hoveredItemObjectID](self, "hoveredItemObjectID");
  v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
  {
LABEL_10:

    goto LABEL_11;
  }
  if (v10)
  {

LABEL_8:
    -[PXFeedView setHoveredItemObjectID:](self, "setHoveredItemObjectID:", v10);
    objc_msgSend(v7, "hoverAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[PXFeedView setCurrentHoverCompletion:](self, "setCurrentHoverCompletion:", 0);
      goto LABEL_11;
    }
    objc_msgSend(v7, "hoverAction");
    v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v11[2]();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFeedView setCurrentHoverCompletion:](self, "setCurrentHoverCompletion:", v14);

    goto LABEL_10;
  }
  -[PXFeedView hoveredItemObjectID](self, "hoveredItemObjectID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_8;
LABEL_11:

}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PXFeedView tungstenView](self, "tungstenView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if ((a4 & 2) != 0)
  {
    v15 = 0;
    PXGAXGetFocusFromAndToInfosForUserInfo(v9, 0, &v15);
    if (v15)
      -[PXFeedView _handleChangeToModifySelectionWithUserInfo:](self, "_handleChangeToModifySelectionWithUserInfo:", v10);
  }
  if ((a4 & 4) != 0)
  {
    v14 = 0;
    PXGAXGetSelectionFromAndToInfosForUserInfo(v10, &v14);
    v11 = v14;
    v12 = v11;
    if (v11 && objc_msgSend(v11, "axContentKind") == 6)
      -[PXFeedView _handleChangeToModifySelectionWithUserInfo:](self, "_handleChangeToModifySelectionWithUserInfo:", v10);

  }
  -[PXFeedView axNextResponder](self, "axNextResponder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "axGroup:didChange:userInfo:", v8, a4, v10);

}

- (void)_handleChangeToModifySelectionWithUserInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v4 = a3;
  -[PXFeedView viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  PXGAXGetToSimpleIndexPathForUserInfo(v4, (uint64_t)&v10);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PXFeedView__handleChangeToModifySelectionWithUserInfo___block_invoke;
  v7[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
  v8 = v10;
  v9 = v11;
  objc_msgSend(v6, "performChanges:", v7);

}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[PXFeedView axNextResponder](self, "axNextResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v10, "axGroup:didRequestToPerformAction:userInfo:", v9, a4, v8);

  return a4;
}

- (void)_installGestureRecognizers
{
  PXTouchingUIGestureRecognizer *v3;
  PXTouchingUIGestureRecognizer *touchingGestureRecognizer;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v7;
  void *v8;
  int v9;
  UIHoverGestureRecognizer *v10;
  UIHoverGestureRecognizer *hoverGesture;
  UIHoverGestureRecognizer *v12;

  v3 = -[PXTouchingUIGestureRecognizer initWithTarget:action:]([PXTouchingUIGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleTouch_);
  touchingGestureRecognizer = self->_touchingGestureRecognizer;
  self->_touchingGestureRecognizer = v3;

  -[PXTouchingUIGestureRecognizer setMaximumTouchMovement:](self->_touchingGestureRecognizer, "setMaximumTouchMovement:", 20.0);
  -[PXTouchingUIGestureRecognizer setTouchDelegate:](self->_touchingGestureRecognizer, "setTouchDelegate:", self);
  -[PXTouchingUIGestureRecognizer setDelegate:](self->_touchingGestureRecognizer, "setDelegate:", self);
  -[PXFeedView addGestureRecognizer:](self, "addGestureRecognizer:", self->_touchingGestureRecognizer);
  v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTap_);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v5;

  -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", self);
  -[PXFeedView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGestureRecognizer);
  -[PXFeedView viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "spec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "wantsItemHoverEvents");

  if (v9)
  {
    v10 = (UIHoverGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", self, sel__handleHover_);
    -[UIHoverGestureRecognizer setDelegate:](v10, "setDelegate:", self);
    hoverGesture = self->_hoverGesture;
    self->_hoverGesture = v10;
    v12 = v10;

    -[PXFeedView addGestureRecognizer:](self, "addGestureRecognizer:", v12);
  }
}

- (void)_handleTap:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    objc_msgSend(v4, "locationInView:", self);
    -[PXFeedView handlePrimaryInteractionAtPoint:](self, "handlePrimaryInteractionAtPoint:");
  }

}

- (void)_handleHover:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1 || objc_msgSend(v4, "state") == 2)
  {
    objc_msgSend(v4, "locationInView:", 0);
    -[PXFeedView _handleHoverEventAtPoint:](self, "_handleHoverEventAtPoint:");
  }

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  -[PXFeedView touchingGestureRecognizer](self, "touchingGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {

LABEL_5:
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__PXFeedView_gestureRecognizerShouldBegin___block_invoke;
    v11[3] = &unk_1E5140E10;
    v12 = v4;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __43__PXFeedView_gestureRecognizerShouldBegin___block_invoke_2;
    v10[3] = &unk_1E513DA10;
    v10[4] = &v13;
    -[PXFeedView px_enumerateDescendantSubviewsPassingTest:usingBlock:](self, "px_enumerateDescendantSubviewsPassingTest:usingBlock:", v11, v10);

    goto LABEL_6;
  }
  -[PXFeedView tapGestureRecognizer](self, "tapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
    goto LABEL_5;
LABEL_6:
  v8 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  int v10;
  id v11;
  void *v12;
  id v14;

  v6 = a4;
  v7 = a3;
  -[PXFeedView touchingGestureRecognizer](self, "touchingGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    v14 = 0;
    v10 = objc_msgSend(v6, "px_isPanGestureRecognizerOfScrollView:", &v14);
    v11 = v14;
    v12 = v11;
    v9 = !v10 || (objc_msgSend(v11, "px_isDecelerating") & 1) == 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)touchingUIGestureRecognizerWillBeginTouching:(id)a3
{
  objc_msgSend(a3, "locationInView:", self);
  -[PXFeedView beginTouchingAtPoint:](self, "beginTouchingAtPoint:");
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PXFeedView viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubprovider:", v5);

  -[PXFeedView tungstenView](self, "tungstenView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubprovider:", v6);

}

- (PXGAXResponder)axNextResponder
{
  return (PXGAXResponder *)objc_loadWeakRetained((id *)&self->_axNextResponder);
}

- (void)setAxNextResponder:(id)a3
{
  objc_storeWeak((id *)&self->_axNextResponder, a3);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (PXTouchingUIGestureRecognizer)touchingGestureRecognizer
{
  return self->_touchingGestureRecognizer;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (UIHoverGestureRecognizer)hoverGesture
{
  return self->_hoverGesture;
}

- (PXGSplitLayout)splitLayout
{
  return self->_splitLayout;
}

- (PXFeedTitleLayout)titleLayout
{
  return self->_titleLayout;
}

- (PXFeedContentLayout)feedContentLayout
{
  return self->_feedContentLayout;
}

- (id)currentTouchCompletion
{
  return self->_currentTouchCompletion;
}

- (id)currentHoverCompletion
{
  return self->_currentHoverCompletion;
}

- (NSObject)hoveredItemObjectID
{
  return self->_hoveredItemObjectID;
}

- (void)setHoveredItemObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_hoveredItemObjectID, a3);
}

- (PXFeedViewModel)viewModel
{
  return self->_viewModel;
}

- (PXGViewCoordinator)tungstenViewCoordinator
{
  return self->_tungstenViewCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tungstenViewCoordinator, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_hoveredItemObjectID, 0);
  objc_storeStrong(&self->_currentHoverCompletion, 0);
  objc_storeStrong(&self->_currentTouchCompletion, 0);
  objc_storeStrong((id *)&self->_feedContentLayout, 0);
  objc_storeStrong((id *)&self->_titleLayout, 0);
  objc_storeStrong((id *)&self->_splitLayout, 0);
  objc_storeStrong((id *)&self->_hoverGesture, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchingGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_axNextResponder);
}

BOOL __43__PXFeedView_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  _BOOL8 v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGPoint v17;
  CGRect v18;

  v3 = a2;
  objc_msgSend(v3, "alpha");
  if (v4 <= 0.0 || (objc_msgSend(v3, "isHidden") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(*(id *)(a1 + 32), "locationInView:", v3);
    v17.x = v14;
    v17.y = v15;
    v18.origin.x = v7;
    v18.origin.y = v9;
    v18.size.width = v11;
    v18.size.height = v13;
    v5 = CGRectContainsPoint(v18, v17);
  }

  return v5;
}

void __43__PXFeedView_gestureRecognizerShouldBegin___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  char isKindOfClass;

  v5 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
}

uint64_t __57__PXFeedView__handleChangeToModifySelectionWithUserInfo___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend(a2, "setSelectedIndexPath:", v4);
}

uint64_t __26__PXFeedView_setIsActive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", *(unsigned __int8 *)(a1 + 32));
}

void __42__PXFeedView_initWithFrame_configuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setMediaProvider:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 504), "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewOutsets");
  sub_1A7AE3F38();
  objc_msgSend(v4, "setInsets:");

  objc_msgSend(v4, "setShouldEmbedContentLayout:", objc_msgSend(*(id *)(a1 + 48), "shouldEmbedContentLayout"));
  objc_msgSend(v4, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v4, "setShowsVerticalScrollIndicator:", *(unsigned __int8 *)(a1 + 56));
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentationType:", objc_msgSend(v6, "feedPresentationType"));

}

@end
