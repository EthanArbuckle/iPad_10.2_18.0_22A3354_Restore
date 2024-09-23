@implementation SKUIOnboardingAffiliationCirclesViewController

- (void)dealloc
{
  NSObject *deletionTimer;
  objc_super v4;

  deletionTimer = self->_deletionTimer;
  if (deletionTimer)
    dispatch_source_cancel(deletionTimer);
  -[SKUIPhysicalCirclesView setDataSource:](self->_circlesView, "setDataSource:", 0);
  -[SKUIPhysicalCirclesView setDelegate:](self->_circlesView, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SKUIOnboardingAffiliationCirclesViewController;
  -[SKUIOnboardingAffiliationCirclesViewController dealloc](&v4, sel_dealloc);
}

- (void)addAffiliationItems:(id)a3
{
  NSMutableArray *affiliationItems;
  id v5;
  SKUIPhysicalCirclesView *circlesView;
  uint64_t v7;

  affiliationItems = self->_affiliationItems;
  v5 = a3;
  -[NSMutableArray addObjectsFromArray:](affiliationItems, "addObjectsFromArray:", v5);
  circlesView = self->_circlesView;
  v7 = objc_msgSend(v5, "count");

  -[SKUIPhysicalCirclesView addCirclesWithCount:](circlesView, "addCirclesWithCount:", v7);
}

- (SKUIOnboardingInstructionsView)instructionsView
{
  SKUIOnboardingInstructionsView *instructionsView;
  SKUIOnboardingInstructionsView *v4;
  SKUIOnboardingInstructionsView *v5;
  SKUIOnboardingInstructionsView *v6;
  SKUIOnboardingInstructionsView *v7;
  void *v8;

  instructionsView = self->_instructionsView;
  if (!instructionsView)
  {
    v4 = [SKUIOnboardingInstructionsView alloc];
    -[SKUIPhysicalCirclesView bounds](self->_circlesView, "bounds");
    v5 = -[SKUIOnboardingInstructionsView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_instructionsView;
    self->_instructionsView = v5;

    -[SKUIOnboardingInstructionsView setAutoresizingMask:](self->_instructionsView, "setAutoresizingMask:", 18);
    v7 = self->_instructionsView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIOnboardingInstructionsView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[SKUIOnboardingInstructionsView setContentPosition:](self->_instructionsView, "setContentPosition:", 1);
    -[SKUIOnboardingInstructionsView setUserInteractionEnabled:](self->_instructionsView, "setUserInteractionEnabled:", 0);
    instructionsView = self->_instructionsView;
  }
  return instructionsView;
}

- (double)maximumCircleDiameter
{
  void *v2;
  _BOOL4 v3;

  -[SKUIOnboardingAffiliationCirclesViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return dbl_1BBED1270[v3];
}

- (void)performFinishAnimationWithCompletionBlock:(id)a3
{
  void (**v4)(id, id);
  id v5;
  id v6;
  NSMutableArray *affiliationItems;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SKUIPhysicalCirclesView *circlesView;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  SKUIPhysicalCirclesView *v26;
  SKUIPhysicalCirclesView *v27;
  NSObject *v28;
  _QWORD block[4];
  id v30;
  void (**v31)(id, id);
  _QWORD v32[4];
  NSObject *v33;
  _QWORD v34[4];
  NSObject *v35;
  _QWORD v36[4];
  NSObject *v37;
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  id v41;

  v4 = (void (**)(id, id))a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  affiliationItems = self->_affiliationItems;
  v8 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __92__SKUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke;
  v39[3] = &unk_1E73A2EE0;
  v9 = v5;
  v40 = v9;
  v10 = v6;
  v41 = v10;
  -[NSMutableArray enumerateObjectsUsingBlock:](affiliationItems, "enumerateObjectsUsingBlock:", v39);
  if (self->_didPerformFinishAnimation)
  {
    if (v4)
      v4[2](v4, v10);
  }
  else
  {
    v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    v12 = (void *)MEMORY[0x1E0DC3F10];
    v38[0] = v8;
    v38[1] = 3221225472;
    v38[2] = __92__SKUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_2;
    v38[3] = &unk_1E739FD38;
    v38[4] = self;
    v36[0] = v8;
    v36[1] = 3221225472;
    v36[2] = __92__SKUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_3;
    v36[3] = &unk_1E73A0108;
    v13 = v11;
    v37 = v13;
    objc_msgSend(v12, "animateWithDuration:animations:completion:", v38, v36, 0.25);
    if (objc_msgSend(v10, "count"))
    {
      -[UIView frame](self->_footerView, "frame");
      *(float *)&v15 = v15 + v14 * 0.5;
      v16 = floorf(*(float *)&v15);
      *(float *)&v15 = v18 + v17 * 0.5;
      v19 = floorf(*(float *)&v15);
      circlesView = self->_circlesView;
      -[UIView superview](self->_footerView, "superview");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIPhysicalCirclesView convertPoint:fromView:](circlesView, "convertPoint:fromView:", v21, v16, v19);
      v23 = v22;
      v25 = v24;

      dispatch_group_enter(v13);
      v26 = self->_circlesView;
      v34[0] = v8;
      v34[1] = 3221225472;
      v34[2] = __92__SKUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_4;
      v34[3] = &unk_1E73A0108;
      v35 = v13;
      -[SKUIPhysicalCirclesView removeCirclesInIndexSet:byAnimatingToPoint:delay:completionBlock:](v26, "removeCirclesInIndexSet:byAnimatingToPoint:delay:completionBlock:", v9, v34, v23, v25, 0.25);

    }
    dispatch_group_enter(v13);
    v27 = self->_circlesView;
    v32[0] = v8;
    v32[1] = 3221225472;
    v32[2] = __92__SKUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_5;
    v32[3] = &unk_1E73A0108;
    v33 = v13;
    v28 = v13;
    -[SKUIPhysicalCirclesView removeAllCirclesAnimated:completionBlock:](v27, "removeAllCirclesAnimated:completionBlock:", 1, v32);
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __92__SKUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_6;
    block[3] = &unk_1E73A17D0;
    v31 = v4;
    v30 = v10;
    dispatch_group_notify(v28, MEMORY[0x1E0C80D38], block);
    self->_didPerformFinishAnimation = 1;

  }
}

void __92__SKUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "userAffinityCount") >= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

uint64_t __92__SKUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setAlpha:", 0.0);
}

void __92__SKUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __92__SKUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __92__SKUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __92__SKUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)removeAffiliationItemsInIndexSet:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v5;
  NSMutableArray *affiliationItems;
  id v9;
  id v10;

  v5 = a4;
  affiliationItems = self->_affiliationItems;
  v9 = a5;
  v10 = a3;
  -[NSMutableArray removeObjectsAtIndexes:](affiliationItems, "removeObjectsAtIndexes:", v10);
  -[SKUIPhysicalCirclesView removeCirclesInIndexSet:animated:completionBlock:](self->_circlesView, "removeCirclesInIndexSet:animated:completionBlock:", v10, v5, v9);

}

- (void)resetWithAffiliationItems:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  SKUIPhysicalCirclesView *circlesView;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (self->_didPerformFinishAnimation)
  {
    if (v9)
      (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }
  else
  {
    objc_initWeak(&location, self);
    circlesView = self->_circlesView;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __101__SKUIOnboardingAffiliationCirclesViewController_resetWithAffiliationItems_animated_completionBlock___block_invoke;
    v12[3] = &unk_1E73A2F08;
    objc_copyWeak(&v15, &location);
    v13 = v8;
    v14 = v10;
    -[SKUIPhysicalCirclesView removeAllCirclesAnimated:completionBlock:](circlesView, "removeAllCirclesAnimated:completionBlock:", v6, v12);
    self->_didPerformFinishAnimation = 1;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

uint64_t __101__SKUIOnboardingAffiliationCirclesViewController_resetWithAffiliationItems_animated_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (*(_QWORD *)(a1 + 32))
    v6 = *(_QWORD *)(a1 + 32);
  else
    v6 = MEMORY[0x1E0C9AA60];
  objc_msgSend(WeakRetained, "setAffiliationItems:", v6);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)setAffiliationItems:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *affiliationItems;
  NSMutableArray *v6;

  v4 = (NSMutableArray *)a3;
  affiliationItems = self->_affiliationItems;
  if (affiliationItems != v4)
  {
    v6 = v4;
    if (v4)
    {
      v4 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", v4, 1);
      affiliationItems = self->_affiliationItems;
    }
    self->_affiliationItems = v4;

    -[SKUIPhysicalCirclesView reloadData](self->_circlesView, "reloadData");
    self->_didPerformFinishAnimation = 0;
    v4 = v6;
  }

}

- (void)setFooterView:(id)a3
{
  -[SKUIOnboardingAffiliationCirclesViewController setFooterView:animated:](self, "setFooterView:animated:", a3, 0);
}

- (void)setFooterView:(id)a3 animated:(BOOL)a4
{
  UIView *v6;
  UIView **p_footerView;
  UIView *footerView;
  void *v9;
  UIView *v10;

  v6 = (UIView *)a3;
  p_footerView = &self->_footerView;
  footerView = self->_footerView;
  v10 = v6;
  if (footerView != v6)
  {
    -[UIView removeFromSuperview](footerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_footerView, a3);
    if (*p_footerView)
    {
      -[SKUIOnboardingAffiliationCirclesViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", *p_footerView);
      objc_msgSend(v9, "setNeedsLayout");

    }
  }

}

- (void)setImage:(id)a3 forAffiliationItem:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  NSMapTable *images;
  NSMapTable *v10;
  NSMapTable *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = -[NSMutableArray indexOfObject:](self->_affiliationItems, "indexOfObject:", v6);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SKUIPhysicalCirclesView circleViewAtIndex:](self->_circlesView, "circleViewAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundImage:", v12);
    images = self->_images;
    if (v12)
    {
      if (!images)
      {
        v10 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
        v11 = self->_images;
        self->_images = v10;

        images = self->_images;
      }
      -[NSMapTable setObject:forKey:](images, "setObject:forKey:");
    }
    else
    {
      -[NSMapTable removeObjectForKey:](images, "removeObjectForKey:", v6);
    }

  }
}

- (void)setUserAffinityCount:(int64_t)a3 forAffiliationItemAtIndex:(int64_t)a4 animated:(BOOL)a5 completionBlock:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD aBlock[9];

  v10 = a6;
  -[NSMutableArray objectAtIndex:](self->_affiliationItems, "objectAtIndex:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserAffinityCount:", a3);
  -[SKUIOnboardingAffiliationCirclesViewController _circleSizeForAffinityCount:](self, "_circleSizeForAffinityCount:", a3);
  v13 = v12;
  v15 = v14;
  -[SKUIPhysicalCirclesView setSize:forCircleAtIndex:](self->_circlesView, "setSize:forCircleAtIndex:", a4);
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __122__SKUIOnboardingAffiliationCirclesViewController_setUserAffinityCount_forAffiliationItemAtIndex_animated_completionBlock___block_invoke;
  aBlock[3] = &unk_1E73A2F30;
  aBlock[4] = self;
  aBlock[5] = a4;
  aBlock[6] = v13;
  aBlock[7] = v15;
  aBlock[8] = a3;
  v17 = _Block_copy(aBlock);
  v18 = v17;
  if (a5)
  {
    +[SKUISimpleAnimationFactory backOutTimingFunction](SKUISimpleAnimationFactory, "backOutTimingFunction");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKUISimpleAnimationFactory factoryWithTimingFunction:](SKUISimpleAnimationFactory, "factoryWithTimingFunction:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0DC3F10];
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __122__SKUIOnboardingAffiliationCirclesViewController_setUserAffinityCount_forAffiliationItemAtIndex_animated_completionBlock___block_invoke_2;
    v22[3] = &unk_1E73A0220;
    v23 = v10;
    objc_msgSend(v21, "_animateWithDuration:delay:options:factory:animations:completion:", 0, v20, v18, v22, 0.3, 0.1);

  }
  else
  {
    (*((void (**)(void *))v17 + 2))(v17);
  }

}

void __122__SKUIOnboardingAffiliationCirclesViewController_setUserAffinityCount_forAffiliationItemAtIndex_animated_completionBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "circleViewAtIndex:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(v2, "setBounds:");
  objc_msgSend(v2, "setTitlePosition:", objc_msgSend(*(id *)(a1 + 32), "_titlePositionForAffinityCount:", *(_QWORD *)(a1 + 64)));
  objc_msgSend(*(id *)(a1 + 32), "_circleImageAlphaForAffinityCount:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v2, "setBackgroundImageAlpha:");
  objc_msgSend(v2, "layoutIfNeeded");
  objc_msgSend(v2, "setNeedsDisplay");

}

uint64_t __122__SKUIOnboardingAffiliationCirclesViewController_setUserAffinityCount_forAffiliationItemAtIndex_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)loadView
{
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIOnboardingAffiliationCirclesViewController viewDidAppear:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIOnboardingAffiliationCirclesViewController _reloadRepellors](self, "_reloadRepellors");
  -[SKUIPhysicalCirclesView startPhysics](self->_circlesView, "startPhysics");
  self->_didPerformFinishAnimation = 0;
  if (self->_needsReloadOnDidAppear)
  {
    -[SKUIPhysicalCirclesView reloadData](self->_circlesView, "reloadData");
    self->_needsReloadOnDidAppear = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIOnboardingAffiliationCirclesViewController;
  -[SKUIOnboardingAffiliationCirclesViewController viewDidAppear:](&v13, sel_viewDidAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SKUIPhysicalCirclesView stopPhysics](self->_circlesView, "stopPhysics");
  v5.receiver = self;
  v5.super_class = (Class)SKUIOnboardingAffiliationCirclesViewController;
  -[SKUIOnboardingAffiliationCirclesViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIView *footerView;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  double v17;
  double v18;
  UIView *v19;
  objc_super v20;
  CGRect v21;

  -[SKUIOnboardingAffiliationCirclesViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[SKUIOnboardingAffiliationCirclesViewController _topLayoutMargin](self, "_topLayoutMargin");
  v9 = v8;
  footerView = self->_footerView;
  if (footerView)
  {
    -[UIView frame](footerView, "frame");
    -[UIView sizeThatFits:](self->_footerView, "sizeThatFits:", v5, 1.79769313e308);
    v12 = v11;
    v14 = fmax(v13, 375.0);
    if (v5 >= 375.0)
      v15 = v14;
    else
      v15 = v5;
    v16 = (v5 - v15) * 0.5;
    v17 = floorf(v16);
    v18 = v7 + -20.0 - v11;
    v19 = self->_footerView;
    v21 = CGRectIntegral(*(CGRect *)(&v12 - 3));
    -[UIView setFrame:](v19, "setFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
  }
  -[SKUIOnboardingInstructionsView setContentInset:](self->_instructionsView, "setContentInset:", v9, 20.0, 20.0, 20.0);
  -[SKUIOnboardingAffiliationCirclesViewController _reloadRepellors](self, "_reloadRepellors");
  v20.receiver = self;
  v20.super_class = (Class)SKUIOnboardingAffiliationCirclesViewController;
  -[SKUIOnboardingAffiliationCirclesViewController viewDidLayoutSubviews](&v20, sel_viewDidLayoutSubviews);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SKUIOnboardingInstructionsView setAlpha:](self->_instructionsView, "setAlpha:", 1.0);
  v5.receiver = self;
  v5.super_class = (Class)SKUIOnboardingAffiliationCirclesViewController;
  -[SKUIOnboardingAffiliationCirclesViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[SKUIOnboardingAffiliationCirclesViewController transitionCoordinator](self, "transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  self->_needsReloadOnDidAppear = v5 != 0;
  v6.receiver = self;
  v6.super_class = (Class)SKUIOnboardingAffiliationCirclesViewController;
  -[SKUIOnboardingAffiliationCirclesViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (id)circlesView:(id)a3 circleForIndex:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  SKUIOnboardingCircleView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  -[NSMutableArray objectAtIndex:](self->_affiliationItems, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userAffinityCount");
  -[SKUIOnboardingAffiliationCirclesViewController _circleSizeForAffinityCount:](self, "_circleSizeForAffinityCount:", v8);
  v11 = -[SKUIOnboardingCircleView initWithFrame:]([SKUIOnboardingCircleView alloc], "initWithFrame:", 0.0, 0.0, v9, v10);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIOnboardingCircleView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  -[SKUIOnboardingCircleView setEdgeInsets:](v11, "setEdgeInsets:", 1.0, 1.0, 1.0, 1.0);
  -[SKUIOnboardingAffiliationCirclesViewController _circleSizeForAffinityCount:](self, "_circleSizeForAffinityCount:", 0);
  -[SKUIOnboardingCircleView setMinimumDiameter:](v11, "setMinimumDiameter:");
  -[SKUIOnboardingCircleView setTitlePosition:](v11, "setTitlePosition:", -[SKUIOnboardingAffiliationCirclesViewController _titlePositionForAffinityCount:](self, "_titlePositionForAffinityCount:", v8));
  objc_msgSend(v7, "fillColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[SKUIOnboardingCircleView setFillColor:](v11, "setFillColor:", v13);
  }
  else
  {
    objc_msgSend(v6, "tintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIOnboardingCircleView setFillColor:](v11, "setFillColor:", v14);

  }
  -[SKUIOnboardingAffiliationCirclesViewController _circleImageAlphaForAffinityCount:](self, "_circleImageAlphaForAffinityCount:", v8);
  -[SKUIOnboardingCircleView setBackgroundImageAlpha:](v11, "setBackgroundImageAlpha:");
  -[NSMapTable objectForKey:](self->_images, "objectForKey:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIOnboardingCircleView setBackgroundImage:](v11, "setBackgroundImage:", v15);

  -[SKUIOnboardingCircleView titleLabel](v11, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v17);

  return v11;
}

- (int64_t)numberOfCirclesInCircleView:(id)a3
{
  return -[NSMutableArray count](self->_affiliationItems, "count", a3);
}

- (void)circleView:(id)a3 didBeginLongPressForCircleAtIndex:(int64_t)a4
{
  SKUIOnboardingInstructionsView *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *deletionTimer;
  NSObject *v9;
  SKUIOnboardingInstructionsView *v10;
  _QWORD v11[5];
  SKUIOnboardingInstructionsView *v12;
  _QWORD *v13;
  id v14[2];
  id location;
  _QWORD v16[4];

  -[SKUIOnboardingAffiliationCirclesViewController _cancelDeletionTimer](self, "_cancelDeletionTimer", a3);
  v6 = self->_instructionsView;
  -[SKUIOnboardingInstructionsView pushLabelState](v6, "pushLabelState");
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  deletionTimer = self->_deletionTimer;
  self->_deletionTimer = v7;

  dispatch_source_set_timer((dispatch_source_t)self->_deletionTimer, 0, 0x3B9ACA00uLL, 0);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 2;
  objc_initWeak(&location, self);
  v9 = self->_deletionTimer;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__SKUIOnboardingAffiliationCirclesViewController_circleView_didBeginLongPressForCircleAtIndex___block_invoke;
  v11[3] = &unk_1E73A2F58;
  v13 = v16;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a4;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  dispatch_source_set_event_handler(v9, v11);
  dispatch_resume((dispatch_object_t)self->_deletionTimer);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(v16, 8);
}

void __95__SKUIOnboardingAffiliationCirclesViewController_circleView_didBeginLongPressForCircleAtIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    WeakRetained = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(WeakRetained, "setNumberStyle:", 1);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 984);
    if (v2)
      objc_msgSend(v2, "localizedStringForKey:inTable:", CFSTR("REMOVE_ITEM_%@"), CFSTR("Onboarding"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REMOVE_ITEM_%@"), 0, CFSTR("Onboarding"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "stringFromNumber:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithValidatedFormat:validFormatSpecifiers:error:", v3, CFSTR("%@"), 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "titleAttributedStringWithString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttributedText:", v9);

    objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
    --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_completeDeletionForCircleAtIndex:", *(_QWORD *)(a1 + 64));
  }

}

- (void)circleView:(id)a3 didEndLongPressForCircleAtIndex:(int64_t)a4
{
  void *v5;

  -[SKUIOnboardingInstructionsView popLabelState](self->_instructionsView, "popLabelState", a3, a4);
  -[SKUIOnboardingAffiliationCirclesViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  -[SKUIOnboardingAffiliationCirclesViewController _cancelDeletionTimer](self, "_cancelDeletionTimer");
}

- (void)circleView:(id)a3 didTapCircleAtIndex:(int64_t)a4
{
  char v6;
  void *v7;
  void *v8;
  id v9;

  -[SKUIOnboardingAffiliationCirclesViewController delegate](self, "delegate", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();
  -[NSMutableArray objectAtIndex:](self->_affiliationItems, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v9, "onboardingCircles:didSelectAffiliationItem:atIndex:", self, v7, a4);
  }
  else
  {
    -[SKUIOnboardingAffiliationCirclesViewController setUserAffinityCount:forAffiliationItemAtIndex:animated:completionBlock:](self, "setUserAffinityCount:forAffiliationItemAtIndex:animated:completionBlock:", (objc_msgSend(v7, "userAffinityCount") + 1) % 3, a4, 1, 0);
    -[SKUIOnboardingAffiliationCirclesViewController _reloadRepellors](self, "_reloadRepellors");
    -[SKUIOnboardingAffiliationCirclesViewController _sendAffilationItemsDidChange](self, "_sendAffilationItemsDidChange");
  }

}

- (void)_cancelDeletionTimer
{
  NSObject *deletionTimer;
  OS_dispatch_source *v4;

  deletionTimer = self->_deletionTimer;
  if (deletionTimer)
  {
    dispatch_source_cancel(deletionTimer);
    v4 = self->_deletionTimer;
    self->_deletionTimer = 0;

  }
}

- (double)_circleImageAlphaForAffinityCount:(int64_t)a3
{
  double result;

  result = 0.0;
  if (a3 == 1)
    result = 0.5;
  if (a3 == 2)
    return 1.0;
  return result;
}

- (CGSize)_circleSizeForAffinityCount:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  CGSize result;

  -[SKUIOnboardingAffiliationCirclesViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  if (v5 == 2)
  {
    if (a3 == 2)
    {
      v6 = 180.0;
      goto LABEL_11;
    }
    if (a3 != 1)
    {
      v6 = 120.0;
      goto LABEL_11;
    }
LABEL_8:
    v6 = 150.0;
    goto LABEL_11;
  }
  if (a3 == 2)
    goto LABEL_8;
  if (a3 == 1)
    v6 = 110.0;
  else
    v6 = 78.0;
LABEL_11:
  v7 = v6;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)_completeDeletionForCircleAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[NSMutableArray objectAtIndex:](self->_affiliationItems, "objectAtIndex:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](self->_images, "removeObjectForKey:");
  -[NSMutableArray removeObjectAtIndex:](self->_affiliationItems, "removeObjectAtIndex:", a3);
  -[SKUIPhysicalCirclesView removeCircleAtIndex:animated:completionBlock:](self->_circlesView, "removeCircleAtIndex:animated:completionBlock:", a3, 1, 0);
  -[SKUIOnboardingInstructionsView popLabelState](self->_instructionsView, "popLabelState");
  -[SKUIOnboardingAffiliationCirclesViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  -[SKUIOnboardingAffiliationCirclesViewController _cancelDeletionTimer](self, "_cancelDeletionTimer");
  -[SKUIOnboardingAffiliationCirclesViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "onboardingCircles:didRemoveAffiliationItem:", self, v7);
  -[SKUIOnboardingAffiliationCirclesViewController _sendAffilationItemsDidChange](self, "_sendAffilationItemsDidChange");

}

- (void)_reloadRepellors
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  UIView *footerView;
  double v12;
  double v13;
  double v14;
  double Height;
  void *v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat Width;
  CGFloat v31;
  double v32;
  CGFloat v33;
  id v34;
  double v35;
  CGFloat rect;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  -[SKUIPhysicalCirclesView bounds](self->_circlesView, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SKUIPhysicalCirclesView removeAllRepellors](self->_circlesView, "removeAllRepellors");
  footerView = self->_footerView;
  if (footerView)
  {
    -[UIView frame](footerView, "frame");
    if (v12 > 0.00000011920929)
    {
      v13 = v12;
      v37.origin.x = v4;
      v37.origin.y = v6;
      v37.size.width = v8;
      v37.size.height = v10;
      v14 = floor(CGRectGetWidth(v37) * 0.5);
      v38.origin.x = v4;
      v38.origin.y = v6;
      v38.size.width = v8;
      v38.size.height = v10;
      Height = CGRectGetHeight(v38);
      -[SKUIOnboardingAffiliationCirclesViewController bottomLayoutGuide](self, "bottomLayoutGuide");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "length");
      v18 = Height - v17 + 90.0;

      v19 = -[SKUIPhysicalCirclesView addRepellorWithCenter:radius:bufferSize:](self->_circlesView, "addRepellorWithCenter:radius:bufferSize:", v14, v18, ceil(v13 * 0.600000024), 20.0);
    }
  }
  v39.origin.x = v4;
  v39.origin.y = v6;
  v39.size.width = v8;
  v39.size.height = v10;
  v35 = ceil(CGRectGetWidth(v39) * 1.79999995);
  -[SKUIOnboardingInstructionsView explanationLabel](self->_instructionsView, "explanationLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  rect = v10;
  v27 = v4;
  v29 = v28;

  v40.origin.x = v22;
  v40.origin.y = v24;
  v40.size.width = v26;
  v40.size.height = v29;
  Width = CGRectGetWidth(v40);
  *(float *)&Width = v35 * v35 - Width * 0.5 * (Width * 0.5);
  v31 = v8;
  v32 = sqrtf(*(float *)&Width);
  v41.origin.x = v22;
  v41.origin.y = v24;
  v41.size.width = v26;
  v41.size.height = v29;
  v33 = CGRectGetMaxY(v41) - v32;
  v42.origin.x = v27;
  v42.origin.y = v6;
  v42.size.width = v31;
  v42.size.height = rect;
  v34 = -[SKUIPhysicalCirclesView addRepellorWithCenter:radius:bufferSize:](self->_circlesView, "addRepellorWithCenter:radius:bufferSize:", floor(CGRectGetWidth(v42) * 0.5), v33, v35, 20.0);
}

- (void)_sendAffilationItemsDidChange
{
  id v3;

  -[SKUIOnboardingAffiliationCirclesViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "onboardingCirclesDidChangeAffiliationItems:", self);

}

- (int64_t)_titlePositionForAffinityCount:(int64_t)a3
{
  return a3 != 0;
}

- (double)_topLayoutMargin
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  int v6;

  -[SKUIOnboardingAffiliationCirclesViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 13.0;
  if (v2)
  {
    +[SKUINavigationControllerAssistant existingAssistantForNavigationController:](SKUINavigationControllerAssistant, "existingAssistantForNavigationController:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      v6 = objc_msgSend(v4, "hidesShadow");

      if (v6)
        v3 = 0.0;
      else
        v3 = 13.0;
    }
  }

  return v3;
}

- (NSArray)affiliationItems
{
  return &self->_affiliationItems->super;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SKUIOnboardingAffiliationCirclesDelegate)delegate
{
  return (SKUIOnboardingAffiliationCirclesDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionsView, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_deletionTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_circlesView, 0);
  objc_storeStrong((id *)&self->_affiliationItems, 0);
}

- (void)viewDidAppear:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
