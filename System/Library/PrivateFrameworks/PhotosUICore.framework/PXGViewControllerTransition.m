@implementation PXGViewControllerTransition

- (PXGViewControllerTransition)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewControllerTransition.m"), 176, CFSTR("%s is not available as initializer"), "-[PXGViewControllerTransition init]");

  abort();
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGViewControllerTransition;
  -[PXGViewControllerTransition performChanges:](&v3, sel_performChanges_, a3);
}

- (_PXGTransitionEndPointInfo)summaryEndPointInfo
{
  void *v2;
  void *v3;

  -[PXGViewControllerTransition endPointInfos](self, "endPointInfos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_PXGTransitionEndPointInfo *)v3;
}

- (_PXGTransitionEndPointInfo)detailEndPointInfo
{
  void *v2;
  void *v3;

  -[PXGViewControllerTransition endPointInfos](self, "endPointInfos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_PXGTransitionEndPointInfo *)v3;
}

- (void)setSummaryItemOriginalPlacement:(id)a3
{
  PXGItemPlacement *v4;
  char v5;
  PXGItemPlacement *v6;
  PXGItemPlacement *summaryItemOriginalPlacement;
  PXGItemPlacement *v8;

  v8 = (PXGItemPlacement *)a3;
  v4 = self->_summaryItemOriginalPlacement;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXGItemPlacement isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (PXGItemPlacement *)-[PXGItemPlacement copy](v8, "copy");
      summaryItemOriginalPlacement = self->_summaryItemOriginalPlacement;
      self->_summaryItemOriginalPlacement = v6;

      -[PXGViewControllerTransition signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setDetailItemOriginalPlacement:(id)a3
{
  PXGItemPlacement *v4;
  char v5;
  PXGItemPlacement *v6;
  PXGItemPlacement *detailItemOriginalPlacement;
  PXGItemPlacement *v8;

  v8 = (PXGItemPlacement *)a3;
  v4 = self->_detailItemOriginalPlacement;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXGItemPlacement isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (PXGItemPlacement *)-[PXGItemPlacement copy](v8, "copy");
      detailItemOriginalPlacement = self->_detailItemOriginalPlacement;
      self->_detailItemOriginalPlacement = v6;

      -[PXGViewControllerTransition signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)animateAlongside:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PXGViewControllerTransition alongsideAnimationBlocks](self, "alongsideAnimationBlocks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = _Block_copy(v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (void)setIsVerticalOnly:(BOOL)a3
{
  self->_isVerticalOnly = a3;
}

- (void)setInteractiveTransition:(id)a3
{
  UIPercentDrivenInteractiveTransition *v5;
  NSObject *v6;
  void *v7;
  UIPercentDrivenInteractiveTransition *interactiveTransition;
  UIPercentDrivenInteractiveTransition *v9;
  int v10;
  PXGViewControllerTransition *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  UIPercentDrivenInteractiveTransition *v15;
  __int16 v16;
  UIPercentDrivenInteractiveTransition *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (UIPercentDrivenInteractiveTransition *)a3;
  PXGTungstenGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    interactiveTransition = self->_interactiveTransition;
    v10 = 134218754;
    v11 = self;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = interactiveTransition;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p %@ %@ -> %@", (uint8_t *)&v10, 0x2Au);

  }
  v9 = self->_interactiveTransition;
  self->_interactiveTransition = v5;

}

- (void)installCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  -[PXGViewControllerTransition completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__PXGViewControllerTransition_installCompletionHandler___block_invoke;
  v8[3] = &unk_1E5123038;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  -[PXGViewControllerTransition setCompletionHandler:](self, "setCompletionHandler:", v8);

}

- (void)cancel
{
  NSObject *v4;
  void *v5;
  int v6;
  PXGViewControllerTransition *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PXGTungstenGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134218242;
    v7 = self;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p %@", (uint8_t *)&v6, 0x16u);

  }
  -[PXGViewControllerTransition _endTransitionAnimation:](self, "_endTransitionAnimation:", 0);
}

- (void)finish
{
  NSObject *v4;
  void *v5;
  int v6;
  PXGViewControllerTransition *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PXGTungstenGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134218242;
    v7 = self;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p %@", (uint8_t *)&v6, 0x16u);

  }
  -[PXGViewControllerTransition _endTransitionAnimation:](self, "_endTransitionAnimation:", 1);
}

- (id)_initWithSummaryViewController:(id)a3 presentedViewController:(id)a4 detailViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXGViewControllerTransition *v11;
  PXGViewControllerTransition *v12;
  NSMutableArray *v13;
  NSMutableArray *alongsideAnimationBlocks;
  id WeakRetained;
  void *v16;
  id v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PXGViewControllerTransition;
  v11 = -[PXGViewControllerTransition init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_summaryViewController, v8);
    objc_storeWeak((id *)&v12->_presentedViewController, v9);
    objc_storeWeak((id *)&v12->_detailViewController, v10);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    alongsideAnimationBlocks = v12->_alongsideAnimationBlocks;
    v12->_alongsideAnimationBlocks = v13;

    WeakRetained = objc_loadWeakRetained((id *)&v12->_summaryViewController);
    __107__PXGViewControllerTransition__initWithSummaryViewController_presentedViewController_detailViewController___block_invoke(WeakRetained);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v12->_summaryEndPoint, v16);

    v17 = objc_loadWeakRetained((id *)&v12->_detailViewController);
    __107__PXGViewControllerTransition__initWithSummaryViewController_presentedViewController_detailViewController___block_invoke(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v12->_detailEndPoint, v18);

  }
  return v12;
}

- (BOOL)_isTransitionAllowedWithKind:(int64_t)a3
{
  NSObject *v5;
  BOOL v6;
  void *v7;
  void *v8;
  int v10;
  PXGViewControllerTransition *v11;
  __int16 v12;
  int64_t v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[PXGViewControllerTransition transitionKind](self, "transitionKind"))
  {
    PXGTungstenGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412802;
      v11 = self;
      v12 = 2048;
      v13 = a3;
      v14 = 2048;
      v15 = -[PXGViewControllerTransition transitionKind](self, "transitionKind");
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "%@ unexpectedly asked for transition kind %li while in %li", (uint8_t *)&v10, 0x20u);
    }

    return 0;
  }
  else
  {
    -[PXGViewControllerTransition summaryEndPoint](self, "summaryEndPoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGViewControllerTransition detailEndPoint](self, "detailEndPoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8
      && (a3 == 1
       || a3 == 2 && -[PXGViewControllerTransition isInteractive](self, "isInteractive")
       || ((objc_opt_respondsToSelector() & 1) == 0
        || v7 && objc_msgSend(v8, "allowsTransition:withEndPoint:", self, v7))
       && ((objc_opt_respondsToSelector() & 1) == 0
        || objc_msgSend(v7, "allowsTransition:withEndPoint:", self, v8)));

  }
  return v6;
}

- (void)_prepareTransitionAnimationWithReadinessHandler:(id)a3 completionHandler:(id)a4
{
  void (**v7)(id);
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void (**v34)(id);
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;

  v7 = (void (**)(id))a3;
  v8 = a4;
  -[PXGViewControllerTransition transitionContext](self, "transitionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewControllerTransition.m"), 318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionContext != nil"));

  }
  objc_msgSend(v9, "containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewForKey:", *MEMORY[0x1E0DC55C0]);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewForKey:", *MEMORY[0x1E0DC55D0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "finalFrameForViewController:", v14);
  objc_msgSend(v12, "setFrame:");
  v35 = v13;
  objc_msgSend(v13, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGViewControllerTransition setFromContentView:](self, "setFromContentView:", v15);
  -[PXGViewControllerTransition setToContentView:](self, "setToContentView:", v16);
  v17 = -[PXGViewControllerTransition transitionKind](self, "transitionKind");
  v18 = v12;
  switch(v17)
  {
    case 1:
      goto LABEL_8;
    case 2:
      objc_msgSend(v10, "addSubview:", v12);
      v18 = (void *)v11;
LABEL_8:
      objc_msgSend(v10, "addSubview:", v18);
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGViewControllerTransition _prepareTransitionAnimationWithReadinessHandler:completionHandler:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v19;
      v22 = v20;
      v23 = 334;
      goto LABEL_13;
  }
  objc_msgSend(v10, "layoutBelowIfNeeded", v18);
  v7[2](v7);
  v24 = -[PXGViewControllerTransition transitionKind](self, "transitionKind");
  v33 = (void *)v11;
  v34 = v7;
  switch(v24)
  {
    case 1:
      objc_msgSend(v10, "bringSubviewToFront:", v12);
      objc_msgSend(v16, "setAlpha:", 0.0);
      break;
    case 2:
      objc_msgSend(v10, "bringSubviewToFront:", v11);
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGViewControllerTransition _prepareTransitionAnimationWithReadinessHandler:completionHandler:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v19;
      v22 = v20;
      v23 = 351;
LABEL_13:
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PXGViewControllerTransition.m"), v23, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, -1000.0, 50.0, 50.0);
  objc_msgSend(v10, "addSubview:", v25);
  v26 = (void *)MEMORY[0x1E0DC3F10];
  -[PXGViewControllerTransition transitionDuration](self, "transitionDuration");
  v28 = v27;
  v29 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __97__PXGViewControllerTransition__prepareTransitionAnimationWithReadinessHandler_completionHandler___block_invoke;
  v39[3] = &unk_1E5149198;
  v40 = v25;
  v36[0] = v29;
  v36[1] = 3221225472;
  v36[2] = __97__PXGViewControllerTransition__prepareTransitionAnimationWithReadinessHandler_completionHandler___block_invoke_2;
  v36[3] = &unk_1E5140638;
  v37 = v40;
  v38 = v8;
  v30 = v8;
  v31 = v40;
  objc_msgSend(v26, "animateWithDuration:animations:completion:", v39, v36, v28);

}

- (void)_handleDisplayLink:(id)a3
{
  void (**v3)(void);

  -[PXGViewControllerTransition animationUpdateBlock](self, "animationUpdateBlock", a3);
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();

}

- (void)_endTransitionAnimation:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  char *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  PXGViewControllerTransition *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  PXGTungstenGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    -[PXGViewControllerTransition interactiveTransition](self, "interactiveTransition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    v16 = 1024;
    v17 = v3;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p %@ %i %@", buf, 0x26u);

  }
  -[PXGViewControllerTransition interactiveTransition](self, "interactiveTransition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (-[PXGViewControllerTransition isEnding](self, "isEnding"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewControllerTransition.m"), 383, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self.isEnding"));

    }
    -[PXGViewControllerTransition setIsEnding:](self, "setIsEnding:", 1);
  }
  else
  {
    PXAssertGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218242;
      v13 = self;
      v14 = 2080;
      v15 = "-[PXGViewControllerTransition _endTransitionAnimation:]";
      _os_log_fault_impl(&dword_1A6789000, v10, OS_LOG_TYPE_FAULT, "[PXGViewControllerTransition] %p missing interactive transition in %s", buf, 0x16u);
    }

  }
  if (v3)
    objc_msgSend(v9, "finishInteractiveTransition");
  else
    objc_msgSend(v9, "cancelInteractiveTransition");

}

- (void)_transitionWillBegin
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(void *, void *, void *, _QWORD, uint64_t, id *);
  void *v18;
  id v19;
  void *v20;
  id v21;
  int64_t v22;
  id v23;
  id v24;
  PXGViewControllerItemPlacementInterpolator *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  PXGViewControllerItemPlacementInterpolator *v31;
  id v32;
  id v33;
  PXGViewControllerItemPlacementInterpolator *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  PXGViewControllerItemPlacementInterpolator *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD aBlock[5];
  id v50;
  id v51;
  id v52;
  SEL v53;

  -[PXGViewControllerTransition transitionContext](self, "transitionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewControllerTransition.m"), 395, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionContext != nil"));

  }
  v41 = v4;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  -[PXGViewControllerTransition summaryEndPoint](self, "summaryEndPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGViewControllerTransition detailEndPoint](self, "detailEndPoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "summaryItemReferenceForTransitionWithSummaryEndPoint:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "detailItemReferenceForTransitionWithSummaryEndPoint:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (-[PXGViewControllerTransition transitionKind](self, "transitionKind") == 2)
      v11 = v9;
    else
      v11 = 0;
    objc_msgSend(v7, "willBeginTransition:withEndPoint:anchorItemReference:", self, v8, v11);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "willBeginTransition:withEndPoint:anchorItemReference:", self, v7, 0);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PXGViewControllerTransition__transitionWillBegin__block_invoke;
  aBlock[3] = &unk_1E5123060;
  aBlock[4] = self;
  v12 = v5;
  v13 = v7;
  v14 = v12;
  v50 = v12;
  v15 = v6;
  v51 = v15;
  v16 = v8;
  v52 = v16;
  v53 = a2;
  v17 = (void (**)(void *, void *, void *, _QWORD, uint64_t, id *))_Block_copy(aBlock);
  -[PXGViewControllerTransition summaryViewController](self, "summaryViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v38 = v13;
  v17[2](v17, v18, v13, 0, v9, &v48);
  v19 = v48;

  -[PXGViewControllerTransition detailViewController](self, "detailViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v39 = (void *)v10;
  v17[2](v17, v20, v16, 1, v10, &v47);
  v21 = v47;

  v22 = -[PXGViewControllerTransition transitionKind](self, "transitionKind");
  v40 = (void *)v9;
  v37 = v16;
  if (v22 == 1)
  {
    v28 = -1;
    v29 = v19;
    v30 = v21;
    goto LABEL_22;
  }
  if (v22 == 2)
  {
    v28 = 1;
    v29 = v21;
    v30 = v19;
LABEL_22:
    v24 = v29;
    v23 = v30;
    if (v23)
    {
      v31 = [PXGViewControllerItemPlacementInterpolator alloc];
      -[PXGViewControllerTransition transitionDuration](self, "transitionDuration");
      v25 = -[PXGViewControllerItemPlacementInterpolator initWithSourcePlacement:targetPlacement:layering:containerView:duration:](v31, "initWithSourcePlacement:targetPlacement:layering:containerView:duration:", v24, v23, v28, v14);
    }
    else
    {
      v25 = 0;
    }
    goto LABEL_25;
  }
  v23 = 0;
  v24 = 0;
  v25 = 0;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGViewControllerTransition _transitionWillBegin]");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("PXGViewControllerTransition.m"), 470, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
LABEL_25:
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __51__PXGViewControllerTransition__transitionWillBegin__block_invoke_89;
  v42[3] = &unk_1E5123088;
  v42[4] = self;
  v43 = v15;
  v44 = v25;
  v45 = v19;
  v46 = v21;
  v32 = v21;
  v33 = v19;
  v34 = v25;
  v35 = v15;
  -[PXGViewControllerTransition performChanges:](self, "performChanges:", v42);

}

- (CGRect)_rectInContainerView:(id)a3 fromRect:(CGRect)a4 inCoordinateSpace:(id)a5 inContentViewController:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
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
  double v25;
  int v26;
  id v27;
  uint64_t v28;
  CGRect result;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  -[PXGViewControllerTransition _transitionViewControllerForContentViewController:](self, "_transitionViewControllerForContentViewController:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    PXAssertGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v26 = 138412290;
      v27 = v11;
      _os_log_fault_impl(&dword_1A6789000, v13, OS_LOG_TYPE_FAULT, "missing transitionViewController for %@", (uint8_t *)&v26, 0xCu);
    }

  }
  PXRectConvertFromCoordinateSpaceToCoordinateSpace();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)_isContentViewControllerHidden:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[PXGViewControllerTransition _transitionViewControllerForContentViewController:](self, "_transitionViewControllerForContentViewController:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alpha");
  v6 = v5 == 0.0;

  return v6;
}

- (id)_transitionViewControllerForContentViewController:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v5 = a3;
  -[PXGViewControllerTransition detailViewController](self, "detailViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    -[PXGViewControllerTransition presentedViewController](self, "presentedViewController");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXGViewControllerTransition summaryViewController](self, "summaryViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewControllerTransition.m"), 511, CFSTR("unknown view controller %@"), v5);

      abort();
    }
    -[PXGViewControllerTransition presentingViewController](self, "presentingViewController");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (void)_transitionDidUpdateWithTransitionTime:(double)a3
{
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  char v39;
  NSObject *v40;
  void *v41;
  const char *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  PXGViewControllerTransition *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = -[PXGViewControllerTransition isInteractive](self, "isInteractive");
  if (v6)
  {
    -[PXGViewControllerTransition fractionCompleted](self, "fractionCompleted");
    v8 = v7;
  }
  else
  {
    -[PXGViewControllerTransition transitionDuration](self, "transitionDuration");
    v8 = a3 / v9;
  }
  if (!-[PXGViewControllerTransition isEnding](self, "isEnding"))
  {
    -[PXGViewControllerTransition interactiveTransition](self, "interactiveTransition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateInteractiveTransition:", v8);

  }
  v11 = -[PXGViewControllerTransition transitionKind](self, "transitionKind");
  switch(v11)
  {
    case 1:
      -[PXGViewControllerTransition toContentView](self, "toContentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = v8;
LABEL_12:
      objc_msgSend(v14, "setAlpha:", v16);

      break;
    case 2:
      -[PXGViewControllerTransition fromContentView](self, "fromContentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = 1.0 - v8;
      goto LABEL_12;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGViewControllerTransition _transitionDidUpdateWithTransitionTime:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGViewControllerTransition.m"), 530, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  if (v6)
  {
    -[PXGViewControllerTransition summaryEndPointInfo](self, "summaryEndPointInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGViewControllerTransition summaryItemPlacementOverride](self, "summaryItemPlacementOverride");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    __70__PXGViewControllerTransition__transitionDidUpdateWithTransitionTime___block_invoke(v17, v18);

    -[PXGViewControllerTransition detailEndPointInfo](self, "detailEndPointInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGViewControllerTransition detailItemPlacementOverride](self, "detailItemPlacementOverride");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    __70__PXGViewControllerTransition__transitionDidUpdateWithTransitionTime___block_invoke(v19, v20);

  }
  else
  {
    -[PXGViewControllerTransition itemPlacementInterpolator](self, "itemPlacementInterpolator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v21;
    if (v21)
    {
      v42 = a2;
      objc_msgSend(v21, "setTime:", a3);
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      -[PXGViewControllerTransition endPointInfos](self, "endPointInfos");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v48 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend(v27, "originalItemPlacement");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "adjustedPlacement:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v27, "itemReference");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              objc_msgSend(v27, "itemPlacementController");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setPlacementOverride:forItemReference:", v29, v30);

            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        }
        while (v24);
      }

      a2 = v42;
    }
  }

  if (a3 == 0.0)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[PXGViewControllerTransition endPointInfos](self, "endPointInfos");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v44 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "tungstenViewCoordinator");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "tungstenView");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "forceUpdate");

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      }
      while (v34);
    }

  }
  -[PXGViewControllerTransition _notifyAlongsideAnimationBlocks:](self, "_notifyAlongsideAnimationBlocks:", v8);
  v39 = v8 < 1.0 || v6;
  if ((v39 & 1) == 0 && !-[PXGViewControllerTransition isEnding](self, "isEnding"))
  {
    PXGTungstenGetLog();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v52 = self;
      v53 = 2112;
      v54 = v41;
      _os_log_impl(&dword_1A6789000, v40, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p %@ ending transition", buf, 0x16u);

    }
    -[PXGViewControllerTransition _endTransitionAnimation:](self, "_endTransitionAnimation:", 1);
  }
}

- (void)_transitionDidEnd:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  PXGViewControllerTransition *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  _BOOL4 v45;
  uint64_t v46;

  v3 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  PXGTungstenGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v41 = self;
    v42 = 2112;
    v43 = v7;
    v44 = 1024;
    v45 = v3;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p %@ %i", buf, 0x1Cu);

  }
  -[PXGViewControllerTransition displayLink](self, "displayLink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  -[PXGViewControllerTransition _notifyAlongsideAnimationBlocks:](self, "_notifyAlongsideAnimationBlocks:", (double)v3);
  -[PXGViewControllerTransition alongsideAnimationBlocks](self, "alongsideAnimationBlocks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  -[PXGViewControllerTransition transitionContext](self, "transitionContext");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewControllerTransition.m"), 586, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionContext != nil"));

  }
  -[PXGViewControllerTransition summaryEndPoint](self, "summaryEndPoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGViewControllerTransition detailEndPoint](self, "detailEndPoint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "didEndTransition:withEndPoint:finished:", self, v12, v3);
  v33 = (void *)v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "didEndTransition:withEndPoint:finished:", self, v11, v3);
  v32 = v11;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[PXGViewControllerTransition endPointInfos](self, "endPointInfos");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v18, "itemReference");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v18, "itemPlacementController");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setPlacementOverride:forItemReference:", 0, v19);

        }
        objc_msgSend(v18, "tungstenViewCoordinator");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "restoreAfterTransition");

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v15);
  }

  -[PXGViewControllerTransition fromContentView](self, "fromContentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAlpha:", 1.0);

  -[PXGViewControllerTransition toContentView](self, "toContentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAlpha:", 1.0);

  if (!v3)
  {
    objc_msgSend(v33, "viewForKey:", *MEMORY[0x1E0DC55D0]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeFromSuperview");

  }
  objc_msgSend(v33, "completeTransition:", v3);
  -[PXGViewControllerTransition completionHandler](self, "completionHandler");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    (*(void (**)(uint64_t, _BOOL8))(v25 + 16))(v25, v3);
  if (-[PXGViewControllerTransition transitionKind](self, "transitionKind") == 2 && v3)
  {
    v27 = (void *)_transitionsByPresentedViewController;
    -[PXGViewControllerTransition presentedViewController](self, "presentedViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "removeObjectForKey:", v28);

  }
  PXGTungstenGetLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v41 = self;
    _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p will perform clean up", buf, 0xCu);
  }

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __49__PXGViewControllerTransition__transitionDidEnd___block_invoke;
  v34[3] = &unk_1E5146E50;
  v34[4] = self;
  -[PXGViewControllerTransition performChanges:](self, "performChanges:", v34);
  PXGTungstenGetLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v41 = self;
    _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p did perform clean up", buf, 0xCu);
  }

}

- (void)_willDismissWithoutTransition
{
  void *v3;
  id v4;

  -[PXGViewControllerTransition detailEndPoint](self, "detailEndPoint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXGViewControllerTransition summaryEndPoint](self, "summaryEndPoint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "willDismissWithoutTransitionToEndPoint:", v3);

  }
}

- (void)_notifyAlongsideAnimationBlocks:(double)a3
{
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PXGViewControllerTransition _progressForFractionCompleted:](self, "_progressForFractionCompleted:", a3);
  v5 = v4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PXGViewControllerTransition alongsideAnimationBlocks](self, "alongsideAnimationBlocks", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(double))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++) + 16))(v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (double)_progressForFractionCompleted:(double)a3
{
  int64_t v4;
  void *v6;
  void *v7;

  v4 = -[PXGViewControllerTransition transitionKind](self, "transitionKind");
  if (v4 != 1)
  {
    if (v4 == 2)
    {
      return 1.0 - a3;
    }
    else
    {
      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGViewControllerTransition _progressForFractionCompleted:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGViewControllerTransition.m"), 662, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      return 0.0;
    }
  }
  return a3;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  PXGViewControllerTransition *v15;
  NSObject *v16;
  int v18;
  PXGViewControllerTransition *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  PXGTungstenGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 134219010;
    v19 = self;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p %@ presented:%@ presenting:%@ source:%@", (uint8_t *)&v18, 0x34u);

  }
  if (-[PXGViewControllerTransition _isTransitionAllowedWithKind:](self, "_isTransitionAllowedWithKind:", 1))
  {
    -[PXGViewControllerTransition setPresentingViewController:](self, "setPresentingViewController:", v10);
    -[PXGViewControllerTransition setTransitionKind:](self, "setTransitionKind:", 1);
    v14 = objc_alloc_init(MEMORY[0x1E0DC3AD0]);
    -[PXGViewControllerTransition setInteractiveTransition:](self, "setInteractiveTransition:", v14);

    v15 = self;
  }
  else
  {
    PXGTungstenGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134217984;
      v19 = self;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p aborting, presented not allowed", (uint8_t *)&v18, 0xCu);
    }

    v15 = 0;
  }

  return v15;
}

- (id)interactionControllerForPresentation:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  PXGViewControllerTransition *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PXGTungstenGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGViewControllerTransition interactiveTransition](self, "interactiveTransition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218754;
    v12 = self;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p %@ %@ -> %@", (uint8_t *)&v11, 0x2Au);

  }
  -[PXGViewControllerTransition interactiveTransition](self, "interactiveTransition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  PXGViewControllerTransition *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  PXGViewControllerTransition *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PXGTungstenGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218498;
    v15 = self;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p %@ dismissed:%@", (uint8_t *)&v14, 0x20u);

  }
  if (-[PXGViewControllerTransition _isTransitionAllowedWithKind:](self, "_isTransitionAllowedWithKind:", 2))
  {
    -[PXGViewControllerTransition setTransitionKind:](self, "setTransitionKind:", 2);
    v8 = objc_alloc_init(MEMORY[0x1E0DC3AD0]);
    -[PXGViewControllerTransition setInteractiveTransition:](self, "setInteractiveTransition:", v8);

    v9 = self;
  }
  else
  {
    -[PXGViewControllerTransition presentedViewController](self, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_transitionsByPresentedViewController, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_willDismissWithoutTransition");

    objc_msgSend((id)_transitionsByPresentedViewController, "removeObjectForKey:", v10);
    PXGTungstenGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134217984;
      v15 = self;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p aborting, dismissal not allowed", (uint8_t *)&v14, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (id)interactionControllerForDismissal:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  PXGViewControllerTransition *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PXGTungstenGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGViewControllerTransition interactiveTransition](self, "interactiveTransition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218754;
    v12 = self;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p %@ %@ -> %@", (uint8_t *)&v11, 0x2Au);

  }
  -[PXGViewControllerTransition interactiveTransition](self, "interactiveTransition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)animateTransition:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  PXGViewControllerTransition *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PXGTungstenGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v19 = self;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p %@ %@", buf, 0x20u);

  }
  -[PXGViewControllerTransition transitionDuration:](self, "transitionDuration:", v5);
  v9 = v8;
  -[PXGViewControllerTransition setTransitionContext:](self, "setTransitionContext:", v5);
  -[PXGViewControllerTransition setTransitionDuration:](self, "setTransitionDuration:", v9);
  objc_initWeak((id *)buf, self);
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__PXGViewControllerTransition_animateTransition___block_invoke;
  v15[3] = &unk_1E5147B18;
  v15[4] = self;
  v16 = v5;
  objc_copyWeak(&v17, (id *)buf);
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __49__PXGViewControllerTransition_animateTransition___block_invoke_2;
  v12[3] = &unk_1E51230B0;
  v12[4] = self;
  v11 = v16;
  v13 = v11;
  objc_copyWeak(&v14, (id *)buf);
  -[PXGViewControllerTransition _prepareTransitionAnimationWithReadinessHandler:completionHandler:](self, "_prepareTransitionAnimationWithReadinessHandler:completionHandler:", v15, v12);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (double)transitionDuration:(id)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(off_1E50B5CD0, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerTransitionDuration");
  v5 = v4;

  return v5;
}

- (double)fractionCompleted
{
  return self->fractionCompleted;
}

- (void)setFractionCompleted:(double)a3
{
  self->fractionCompleted = a3;
}

- (PXGItemPlacement)summaryItemPlacementOverride
{
  return self->_summaryItemPlacementOverride;
}

- (void)setSummaryItemPlacementOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (PXGItemPlacement)detailItemPlacementOverride
{
  return self->_detailItemPlacementOverride;
}

- (void)setDetailItemPlacementOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (UIViewController)summaryViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_summaryViewController);
}

- (UIViewController)detailViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_detailViewController);
}

- (PXGItemPlacement)summaryItemOriginalPlacement
{
  return self->_summaryItemOriginalPlacement;
}

- (PXGItemPlacement)detailItemOriginalPlacement
{
  return self->_detailItemOriginalPlacement;
}

- (BOOL)isVerticalOnly
{
  return self->_isVerticalOnly;
}

- (UIViewController)presentedViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentedViewController);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (int64_t)transitionKind
{
  return self->_transitionKind;
}

- (void)setTransitionKind:(int64_t)a3
{
  self->_transitionKind = a3;
}

- (BOOL)isEnding
{
  return self->_isEnding;
}

- (void)setIsEnding:(BOOL)a3
{
  self->_isEnding = a3;
}

- (UIPercentDrivenInteractiveTransition)interactiveTransition
{
  return self->_interactiveTransition;
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (UIView)fromContentView
{
  return self->_fromContentView;
}

- (void)setFromContentView:(id)a3
{
  objc_storeStrong((id *)&self->_fromContentView, a3);
}

- (UIView)toContentView
{
  return self->_toContentView;
}

- (void)setToContentView:(id)a3
{
  objc_storeStrong((id *)&self->_toContentView, a3);
}

- (id)animationUpdateBlock
{
  return self->_animationUpdateBlock;
}

- (void)setAnimationUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (PXDisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (PXGViewControllerItemPlacementInterpolator)itemPlacementInterpolator
{
  return self->_itemPlacementInterpolator;
}

- (void)setItemPlacementInterpolator:(id)a3
{
  objc_storeStrong((id *)&self->_itemPlacementInterpolator, a3);
}

- (NSMutableArray)alongsideAnimationBlocks
{
  return self->_alongsideAnimationBlocks;
}

- (NSArray)endPointInfos
{
  return self->_endPointInfos;
}

- (void)setEndPointInfos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (PXGViewControllerTransitionEndPoint)summaryEndPoint
{
  return (PXGViewControllerTransitionEndPoint *)objc_loadWeakRetained((id *)&self->_summaryEndPoint);
}

- (PXGViewControllerTransitionEndPoint)detailEndPoint
{
  return (PXGViewControllerTransitionEndPoint *)objc_loadWeakRetained((id *)&self->_detailEndPoint);
}

- (BOOL)isInteractive
{
  return self->_isInteractive;
}

- (void)setIsInteractive:(BOOL)a3
{
  self->_isInteractive = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_detailEndPoint);
  objc_destroyWeak((id *)&self->_summaryEndPoint);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_endPointInfos, 0);
  objc_storeStrong((id *)&self->_alongsideAnimationBlocks, 0);
  objc_storeStrong((id *)&self->_itemPlacementInterpolator, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong(&self->_animationUpdateBlock, 0);
  objc_storeStrong((id *)&self->_toContentView, 0);
  objc_storeStrong((id *)&self->_fromContentView, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_interactiveTransition, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_presentedViewController);
  objc_storeStrong((id *)&self->_detailItemOriginalPlacement, 0);
  objc_storeStrong((id *)&self->_summaryItemOriginalPlacement, 0);
  objc_destroyWeak((id *)&self->_detailViewController);
  objc_destroyWeak((id *)&self->_summaryViewController);
  objc_storeStrong((id *)&self->_detailItemPlacementOverride, 0);
  objc_storeStrong((id *)&self->_summaryItemPlacementOverride, 0);
}

void __49__PXGViewControllerTransition_animateTransition___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  _BYTE buf[24];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PXGTungstenGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p %@ transition animation ready", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_transitionWillBegin");
  objc_msgSend(*(id *)(a1 + 32), "_transitionDidUpdateWithTransitionTime:", 0.0);
  v5 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B2330), "initWithWeakTarget:selector:", *(_QWORD *)(a1 + 32), sel__handleDisplayLink_);
  objc_msgSend(*(id *)(a1 + 32), "setDisplayLink:", v5);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v9 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PXGViewControllerTransition_animateTransition___block_invoke_101;
  v6[3] = &unk_1E5139A08;
  v6[4] = buf;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setAnimationUpdateBlock:", v6);
  objc_destroyWeak(&v7);
  _Block_object_dispose(buf, 8);
}

void __49__PXGViewControllerTransition_animateTransition___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PXGTungstenGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 134218498;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 1024;
    v13 = a2;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p %@ completed %i", (uint8_t *)&v8, 0x1Cu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_transitionDidEnd:", objc_msgSend(*(id *)(a1 + 40), "transitionWasCancelled") ^ 1);

}

void __49__PXGViewControllerTransition_animateTransition___block_invoke_101(uint64_t a1)
{
  double v2;
  uint64_t v3;
  double v4;
  double v5;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(double *)(v3 + 24);
  if (v4 == 0.0)
  {
    *(double *)(v3 + 24) = v2;
    v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  v5 = v2 - v4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_transitionDidUpdateWithTransitionTime:", v5);

}

void __49__PXGViewControllerTransition__transitionDidEnd___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PXGTungstenGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134217984;
    v7 = v5;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %p cleaning up", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setTransitionKind:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setTransitionDuration:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "setInteractiveTransition:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setTransitionContext:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setFromContentView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setToContentView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setAnimationUpdateBlock:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setDisplayLink:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setEndPointInfos:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setItemPlacementInterpolator:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIsInteractive:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIsEnding:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSummaryItemOriginalPlacement:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setDetailItemOriginalPlacement:", 0);
  objc_msgSend(v3, "setSummaryItemPlacementOverride:", 0);
  objc_msgSend(v3, "setDetailItemPlacementOverride:", 0);

}

void __70__PXGViewControllerTransition__transitionDidUpdateWithTransitionTime___block_invoke(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a1;
  v3 = a2;
  objc_msgSend(v7, "itemReference");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    objc_msgSend(v7, "itemPlacementController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlacementOverride:forItemReference:", v3, v5);

  }
}

void __51__PXGViewControllerTransition__transitionWillBegin__block_invoke(id *a1, void *a2, void *a3, char a4, void *a5, _QWORD *a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  PXGItemPlacementContext *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  _PXGTransitionEndPointInfo *v33;
  _QWORD *v34;
  void *v35;
  _QWORD block[4];
  NSObject *v37;
  uint64_t v38;
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a5;
  +[PXGViewCoordinator tungstenViewCoordinatorInContainerViewController:](PXGViewCoordinator, "tungstenViewCoordinatorInContainerViewController:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v35 = v12;
  if (v14)
  {
    v34 = a6;
    objc_msgSend(v14, "tungstenView");
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject ensureUpdatedLayout](v16, "ensureUpdatedLayout");
    v17 = a1[4];
    v18 = a1[5];
    -[NSObject bounds](v16, "bounds");
    objc_msgSend(v17, "_rectInContainerView:fromRect:inCoordinateSpace:inContentViewController:", v18, v16, v11);
    v20 = v19;
    v22 = v21;
    objc_msgSend(v15, "contentLayout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "visibleRect");
    PXPointSubtract();
    v25 = v24;
    v27 = v26;
    v28 = -[PXGItemPlacementContext initWithOriginOfLayout:atPoint:inCoordinateSpace:]([PXGItemPlacementContext alloc], "initWithOriginOfLayout:atPoint:inCoordinateSpace:", v23, a1[5], v24, v26);
    if (v13)
    {
      objc_msgSend(v12, "itemPlacementControllerForItemReference:", v13);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "placementInContext:forItemReference:", v28, v13);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a4 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      v29 = 0;
      v30 = 0;
      if ((a4 & 1) != 0)
        goto LABEL_10;
    }
    objc_msgSend(a1[5], "bounds");
    if ((PXRectApproximatelyEqualToRect() & 1) != 0)
    {
LABEL_13:
      v33 = objc_alloc_init(_PXGTransitionEndPointInfo);
      -[_PXGTransitionEndPointInfo setTungstenViewCoordinator:](v33, "setTungstenViewCoordinator:", v15);
      -[_PXGTransitionEndPointInfo setItemPlacementController:](v33, "setItemPlacementController:", v29);
      -[_PXGTransitionEndPointInfo setPlacementContext:](v33, "setPlacementContext:", v28);
      -[_PXGTransitionEndPointInfo setOriginalItemPlacement:](v33, "setOriginalItemPlacement:", v30);
      -[_PXGTransitionEndPointInfo setItemReference:](v33, "setItemReference:", v13);
      objc_msgSend(a1[6], "addObject:", v33);

      a6 = v34;
      goto LABEL_14;
    }
LABEL_10:
    if (objc_msgSend(a1[4], "_isContentViewControllerHidden:", v11))
    {
      -[NSObject alpha](v16, "alpha");
      v32 = v31;
      -[NSObject setAlpha:](v16, "setAlpha:", 0.0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__PXGViewControllerTransition__transitionWillBegin__block_invoke_2;
      block[3] = &unk_1E5144EB8;
      v37 = v16;
      v38 = v32;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    objc_msgSend(v15, "prepareForTransitionInContainerView:withContentFrame:", a1[5], v25, v27, v20, v22);
    goto LABEL_13;
  }
  if (a1[7] != v12)
  {
    v30 = 0;
    if (!a6)
      goto LABEL_16;
    goto LABEL_15;
  }
  PXAssertGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v11;
    _os_log_fault_impl(&dword_1A6789000, v16, OS_LOG_TYPE_FAULT, "Couldn't find any PXGViewCoordinator inside %@", buf, 0xCu);
  }
  v30 = 0;
LABEL_14:

  if (a6)
LABEL_15:
    *a6 = objc_retainAutorelease(v30);
LABEL_16:

}

uint64_t __51__PXGViewControllerTransition__transitionWillBegin__block_invoke_89(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEndPointInfos:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setItemPlacementInterpolator:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setSummaryItemOriginalPlacement:", *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "setDetailItemOriginalPlacement:", *(_QWORD *)(a1 + 64));
}

uint64_t __51__PXGViewControllerTransition__transitionWillBegin__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "forceUpdate");
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __97__PXGViewControllerTransition__prepareTransitionAnimationWithReadinessHandler_completionHandler___block_invoke(uint64_t a1)
{
  CGRect v3;
  CGRect v4;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  v4 = CGRectOffset(v3, 50.0, 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", v4.origin.x, v4.origin.y, v4.size.width, v4.size.height);
}

uint64_t __97__PXGViewControllerTransition__prepareTransitionAnimationWithReadinessHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __107__PXGViewControllerTransition__initWithSummaryViewController_presentedViewController_detailViewController___block_invoke(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (objc_msgSend(v1, "conformsToProtocol:", &unk_1EEB18568))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

uint64_t __56__PXGViewControllerTransition_installCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)prepareTransitionFromSummaryViewController:(id)a3 toPresentedViewController:(id)a4 detailViewController:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  uint64_t v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v30;
  NSObject *v31;
  _BYTE rect[38];
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  PXGTungstenGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)&rect[16] = 138413058;
    *(_QWORD *)&rect[20] = v13;
    *(_WORD *)&rect[28] = 2112;
    *(_QWORD *)&rect[30] = v9;
    v33 = 2112;
    v34 = v10;
    v35 = 2112;
    v36 = v11;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %@ summary:%@ presented:%@ detail:%@", &rect[16], 0x2Au);

  }
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "allowsViewControllerTransitions");

  if ((v15 & 1) != 0)
  {
    PXViewControllerRootViewController(v9);
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject view](v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v20 = v19;
    *(_QWORD *)&rect[8] = v21;
    v23 = v22;
    v25 = v24;
    objc_msgSend(v18, "bounds");
    objc_msgSend(v17, "convertRect:fromView:", v18);
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
    CGRectGetMinX(v38);
    v39.origin.x = v20;
    v39.origin.y = *(CGFloat *)&rect[8];
    v39.size.width = v23;
    v39.size.height = v25;
    CGRectGetMinX(v39);
    if (!PXFloatApproximatelyEqualToFloat())
      goto LABEL_9;
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    CGRectGetMaxX(v40);
    v41.origin.x = v20;
    v41.origin.y = *(CGFloat *)&rect[8];
    v41.size.width = v23;
    v41.size.height = v25;
    CGRectGetMaxX(v41);
    if ((PXFloatApproximatelyEqualToFloat() & 1) != 0)
    {
      v30 = (id)objc_msgSend(a1, "_createTransitionWithSummaryViewController:presentedViewController:detailViewController:", v9, v10, v11);
    }
    else
    {
LABEL_9:
      PXGTungstenGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)&rect[16] = 0;
        _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] aborting, summary view not extending horizontally to container", &rect[16], 2u);
      }

    }
  }
  else
  {
    PXGTungstenGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)&rect[16] = 0;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] aborting, transitions turned off", &rect[16], 2u);
    }
  }

}

+ (id)_createTransitionWithSummaryViewController:(id)a3 presentedViewController:(id)a4 detailViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithSummaryViewController:presentedViewController:detailViewController:", v10, v8, v9);

  objc_msgSend(v8, "setTransitioningDelegate:", v11);
  v12 = (void *)_transitionsByPresentedViewController;
  if (!_transitionsByPresentedViewController)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)_transitionsByPresentedViewController;
    _transitionsByPresentedViewController = v13;

    v12 = (void *)_transitionsByPresentedViewController;
  }
  objc_msgSend(v12, "setObject:forKey:", v11, v8);
  PXGTungstenGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v11;
    _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] created %@", (uint8_t *)&v17, 0xCu);
  }

  return v11;
}

+ (PXGViewControllerTransition)transitionWithDetailViewController:(id)a3
{
  return (PXGViewControllerTransition *)objc_msgSend(a1, "_transitionWithDetailViewController:createIfNeeded:verticalOnly:", a3, 0, 0);
}

+ (id)_transitionWithDetailViewController:(id)a3 createIfNeeded:(BOOL)a4 verticalOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  _BOOL4 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v22 = a5;
  v5 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend((id)_transitionsByPresentedViewController, "objectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "detailViewController");
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14 == v8)
        {
          objc_msgSend(v8, "presentingViewController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v13, "setPresentingViewController:", v15);
          v10 = v13;

          goto LABEL_13;
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

  if (!v10 && v5)
  {
    objc_msgSend(v8, "presentingViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentedViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PXGTungstenGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v16;
      v29 = 2112;
      v30 = v17;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] create with summary: %@ presented: %@", buf, 0x16u);
    }

    v10 = 0;
    if (v16 && v17)
    {
      objc_msgSend(a1, "_createTransitionWithSummaryViewController:presentedViewController:detailViewController:", v16, v17, v8);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setIsVerticalOnly:", v22);
    }

  }
  PXGTungstenGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v28 = v20;
    v29 = 2112;
    v30 = v8;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %@ %@ -> %@", buf, 0x20u);

  }
  return v10;
}

+ (void)prepareDismissalOfDetailViewController:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(a1, "_transitionWithDetailViewController:createIfNeeded:verticalOnly:", a3, 1, 0);
}

+ (id)interactiveDismissalOfDetailViewController:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a1, "_transitionWithDetailViewController:createIfNeeded:verticalOnly:", v5, 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXGTungstenGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 1024;
    v19 = objc_msgSend(v6, "isInteractive");
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "[PXGViewControllerTransition] %@ %@ -> %@ isInteractive:%i", (uint8_t *)&v12, 0x26u);

  }
  if (v6 && (objc_msgSend(v6, "isInteractive") & 1) == 0)
  {
    objc_msgSend(v6, "setIsInteractive:", 1);
    objc_msgSend(v6, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
      v9 = v5;
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  return v6;
}

@end
