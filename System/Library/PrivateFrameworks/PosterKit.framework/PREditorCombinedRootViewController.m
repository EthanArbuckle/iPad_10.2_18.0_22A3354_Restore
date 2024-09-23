@implementation PREditorCombinedRootViewController

- (void)loadView
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PREditorLookViews *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  PREditorLookViews *v29;
  PREditorCombinedRootViewController *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[8];
  objc_super v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)PREditorCombinedRootViewController;
  -[PREditorRootViewController loadView](&v39, sel_loadView);
  -[PREditorCombinedRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = objc_alloc_init(PREditorLookViews);
  -[PREditorCombinedRootViewController setViews:](self, "setViews:", v12);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __46__PREditorCombinedRootViewController_loadView__block_invoke;
  v38[3] = &__block_descriptor_64_e27_v24__0__UIView_8__UIView_16l;
  v38[4] = v5;
  v38[5] = v7;
  v38[6] = v9;
  v38[7] = v11;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __46__PREditorCombinedRootViewController_loadView__block_invoke_2;
  v36[3] = &unk_1E2184A20;
  v36[4] = self;
  v13 = (id)MEMORY[0x18D77C604](v38);
  v37 = v13;
  -[PREditorLookViews enumerateViewsUsingBlock:](v12, "enumerateViewsUsingBlock:", v36);
  -[PREditorRootViewController contentOverlayView](self, "contentOverlayView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeFromSuperview");

  -[PREditorRootViewController contentOverlayView](self, "contentOverlayView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = self;
  -[PREditorRootViewController contentOverlayContainerView](self, "contentOverlayContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v13;
  (*((void (**)(id, void *, void *))v13 + 2))(v13, v15, v16);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v29 = v12;
  -[PREditorLookViews contentViews](v12, "contentViews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    v20 = *MEMORY[0x1E0CD2B58];
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v21);
        objc_msgSend(MEMORY[0x1E0CD27C0], "animation");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "layer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setSourceLayer:", v24);

        objc_msgSend(v23, "setDuration:", INFINITY);
        objc_msgSend(v23, "setFillMode:", v20);
        objc_msgSend(v23, "setRemovedOnCompletion:", 0);
        objc_msgSend(v23, "setUsesNormalizedCoordinates:", 1);
        objc_msgSend(v23, "setAppliesY:", 1);
        objc_msgSend(v23, "setAppliesX:", 1);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.5, 0.5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setSourcePoints:", v26);

        objc_msgSend(v22, "layer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addAnimation:forKey:", v23, CFSTR("match-move"));

        ++v21;
      }
      while (v18 != v21);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v18);
  }

  -[PREditorCombinedRootViewController _updateCounterRotationLayout](v30, "_updateCounterRotationLayout");
}

void __46__PREditorCombinedRootViewController_loadView__block_invoke(double *a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0D01940];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithFrame:", a1[4], a1[5], a1[6], a1[7]);
  objc_msgSend(v8, "setCounterTransformView:", 1);
  objc_msgSend(v8, "addContentView:", v7);

  objc_msgSend(v6, "addSubview:", v8);
}

void __46__PREditorCombinedRootViewController_loadView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "floatingContainerView");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "foregroundContainerView");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      v6 = 0;
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 32), "backgroundContainerView");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PREditorCombinedRootViewController;
  -[PREditorCombinedRootViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PREditorCombinedRootViewController _updateCounterRotationLayout](self, "_updateCounterRotationLayout");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PREditorCombinedRootViewController;
  -[PREditorRootViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PREditorRootViewController updateReticleViewFrames](self, "updateReticleViewFrames");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;
  _QWORD v9[5];
  _QWORD v10[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[PREditorCombinedRootViewController _updateScrollViewClipping:](self, "_updateScrollViewClipping:", 0);
  v9[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__PREditorCombinedRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E2184798;
  v10[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__PREditorCombinedRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v9[3] = &unk_1E2184798;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, v9);
  v8.receiver = self;
  v8.super_class = (Class)PREditorCombinedRootViewController;
  -[PREditorRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

uint64_t __89__PREditorCombinedRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateReticleViewFrames");
  return objc_msgSend(*(id *)(a1 + 32), "_updateCounterRotationLayout");
}

uint64_t __89__PREditorCombinedRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateScrollViewClipping:", 1);
}

- (void)_updateCounterRotationLayout
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void (**v16)(id, void *);
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[9];

  if (PUIDynamicRotationIsActive())
    v3 = -[PREditorCombinedRootViewController _windowInterfaceOrientation](self, "_windowInterfaceOrientation");
  else
    v3 = 1;
  -[PREditorCombinedRootViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__PREditorCombinedRootViewController__updateCounterRotationLayout__block_invoke;
  v20[3] = &__block_descriptor_72_e16_v16__0__UIView_8l;
  v20[4] = v6;
  v20[5] = v8;
  v20[6] = v10;
  v20[7] = v12;
  v20[8] = v3;
  v14 = (void *)MEMORY[0x18D77C604](v20);
  -[PREditorCombinedRootViewController views](self, "views");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __66__PREditorCombinedRootViewController__updateCounterRotationLayout__block_invoke_2;
  v18[3] = &unk_1E2184A20;
  v18[4] = self;
  v19 = v14;
  v16 = v14;
  objc_msgSend(v15, "enumerateViewsUsingBlock:", v18);

  -[PREditorRootViewController contentOverlayContainerView](self, "contentOverlayContainerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2](v16, v17);

}

void __66__PREditorCombinedRootViewController__updateCounterRotationLayout__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "setFrame:", *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(v8, "setContentOrientation:", 1);
  objc_msgSend(v8, "setContainerOrientation:", *(_QWORD *)(a1 + 64));

}

void __66__PREditorCombinedRootViewController__updateCounterRotationLayout__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "floatingContainerView");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "foregroundContainerView");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      v6 = 0;
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 32), "backgroundContainerView");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_updateScrollViewClipping:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PREditorRootViewController scrollView](self, "scrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClipsToBounds:", v3);

}

- (int64_t)_windowInterfaceOrientation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int64_t v7;

  -[PREditorCombinedRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)-[PREditorCombinedRootViewController performSelector:](self, "performSelector:", sel__window);
  v6 = v4;

  v7 = objc_msgSend(v6, "_windowInterfaceOrientation");
  return v7;
}

- (PREditingLookViewProviding)views
{
  return self->_views;
}

- (void)setViews:(id)a3
{
  objc_storeStrong((id *)&self->_views, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_views, 0);
}

@end
