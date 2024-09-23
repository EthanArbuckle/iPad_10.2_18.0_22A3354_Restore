@implementation SBDashBoardTraitsAwareAppHostingViewController

- (SBDashBoardTraitsAwareAppHostingViewController)initWithAppHosting:(id)a3 targetWindow:(id)a4
{
  id v6;
  id v7;
  SBDashBoardTraitsAwareAppHostingViewController *v8;
  SBDashBoardTraitsAwareAppHostingViewController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBDashBoardTraitsAwareAppHostingViewController;
  v8 = -[SBDashBoardTraitsAwareAppHostingViewController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_appHosting, v6);
    objc_storeStrong((id *)&v9->_targetWindow, a4);
    -[SBDashBoardTraitsAwareAppHostingViewController _acquireTraitsParticipantIfNeeded](v9, "_acquireTraitsParticipantIfNeeded");
  }

  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardTraitsAwareAppHostingViewController;
  -[SBDashBoardTraitsAwareAppHostingViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBDashBoardTraitsAwareAppHostingViewController _acquireTraitsParticipantIfNeeded](self, "_acquireTraitsParticipantIfNeeded");
  -[SBDashBoardTraitsAwareAppHostingViewController _updateWindowLevel](self, "_updateWindowLevel");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardTraitsAwareAppHostingViewController;
  -[SBDashBoardTraitsAwareAppHostingViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[SBDashBoardTraitsAwareAppHostingViewController _invalidateTraitsParticipant](self, "_invalidateTraitsParticipant");
}

- (void)setAppHosting:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appHosting);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_appHosting, obj);
    -[SBDashBoardTraitsAwareAppHostingViewController _acquireTraitsParticipantIfNeeded](self, "_acquireTraitsParticipantIfNeeded");
    v5 = obj;
  }

}

- (void)setContentViewBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBTraitsOrientedContentViewController view](self->_orientedContentViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", x, y, width, height);

  -[SBTraitsOrientedContentViewController view](self->_orientedContentViewController, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardTraitsAwareAppHostingViewController _referenceBoundsForBounds:](self, "_referenceBoundsForBounds:", x, y, width, height);
  objc_msgSend(v9, "setContentViewBoundsInReferenceSpace:");

}

- (void)sceneDidAttach
{
  -[SBDashBoardTraitsAwareAppHostingViewController _acquireTraitsParticipantIfNeeded](self, "_acquireTraitsParticipantIfNeeded");
  -[SBDashBoardTraitsAwareAppHostingViewController _updateWindowLevel](self, "_updateWindowLevel");
}

- (void)sceneWasDestroyed
{
  -[SBDashBoardTraitsAwareAppHostingViewController _invalidateTraitsParticipant](self, "_invalidateTraitsParticipant");
  -[SBDashBoardTraitsAwareAppHostingViewController _updateWindowLevel](self, "_updateWindowLevel");
}

- (SBTraitsOrientedContentViewController)orientedContentViewController
{
  return self->_orientedContentViewController;
}

- (id)_traitsArbiter
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBDashBoardTraitsAwareAppHostingViewController _effectiveWindow](self, "_effectiveWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_sbWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitsArbiter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDashBoardTraitsAwareAppHostingViewController.m"), 93, CFSTR("Unexpected nil window"));
    v7 = 0;
  }

  return v7;
}

- (id)_hostedSceneHandle
{
  void *v2;
  void *v3;

  -[SBDashBoardTraitsAwareAppHostingViewController _hostedAppViewController](self, "_hostedAppViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationSceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_hostedAppViewController
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_appHosting);
  v3 = objc_opt_class();
  v4 = WeakRetained;
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

  return v6;
}

- (id)_effectiveWindow
{
  void *v3;
  void *targetWindow;
  void *v5;
  id v6;

  -[SBDashBoardTraitsAwareAppHostingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  targetWindow = (void *)objc_claimAutoreleasedReturnValue();
  v5 = targetWindow;
  if (!targetWindow)
    targetWindow = self->_targetWindow;
  v6 = targetWindow;

  return v6;
}

- (void)_updateWindowLevel
{
  void *v3;
  SBTraitsSceneParticipantDelegate *traitsParticipantDelegate;
  void *v5;
  void *v6;
  id v7;

  -[SBDashBoardTraitsAwareAppHostingViewController _effectiveWindow](self, "_effectiveWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    traitsParticipantDelegate = self->_traitsParticipantDelegate;
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v7 = v3;
    objc_msgSend(v3, "windowLevel");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTraitsSceneParticipantDelegate setPreferredSceneLevel:](traitsParticipantDelegate, "setPreferredSceneLevel:", v6);

    v3 = v7;
  }

}

- (void)_acquireTraitsParticipantIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  SBTraitsSceneParticipantDelegate *v16;
  void *v17;
  SBTraitsSceneParticipantDelegate *v18;
  SBTraitsSceneParticipantDelegate *traitsParticipantDelegate;
  TRAParticipant *v20;
  TRAParticipant *traitsParticipant;
  SBTraitsSceneParticipantDelegate *v22;
  void *v23;
  void *v24;
  SBTraitsOrientedContentViewController *v25;
  SBTraitsOrientedContentViewController *orientedContentViewController;
  uint64_t v27;
  void *v28;
  void *v29;
  SBTraitsOrientedContentViewController *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  SBTraitsOrientedContentViewController *v42;
  void *v43;
  uint64_t v44;
  id v45;
  SBTraitsSceneParticipantDelegate *v46;
  SBTraitsOrientedContentViewController *v47;
  SBTraitsOrientedContentViewController *v48;
  id v49;
  id v50;
  _QWORD v51[5];
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  id location;
  _QWORD v57[4];
  id v58;
  SBDashBoardTraitsAwareAppHostingViewController *v59;

  if (self->_traitsParticipant
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_appHosting), WeakRetained, !WeakRetained))
  {
    -[SBTraitsOrientedContentViewController view](self->_orientedContentViewController, "view");
    v49 = (id)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardTraitsAwareAppHostingViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    objc_msgSend(v49, "setFrame:", v5, v7, v9, v11);
    -[SBDashBoardTraitsAwareAppHostingViewController _referenceBoundsForBounds:](self, "_referenceBoundsForBounds:", v5, v7, v9, v11);
    objc_msgSend(v49, "setContentViewBoundsInReferenceSpace:");

  }
  else
  {
    -[SBDashBoardTraitsAwareAppHostingViewController _effectiveWindow](self, "_effectiveWindow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[SBDashBoardTraitsAwareAppHostingViewController _hostedAppViewController](self, "_hostedAppViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMode:", 2);

      -[SBDashBoardTraitsAwareAppHostingViewController _traitsArbiter](self, "_traitsArbiter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = [SBTraitsSceneParticipantDelegate alloc];
      -[SBDashBoardTraitsAwareAppHostingViewController _hostedSceneHandle](self, "_hostedSceneHandle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[SBTraitsSceneParticipantDelegate initWithSceneHandle:](v16, "initWithSceneHandle:", v17);
      traitsParticipantDelegate = self->_traitsParticipantDelegate;
      self->_traitsParticipantDelegate = v18;

      objc_msgSend(v15, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRoleCoverSheetPosterSwitcher"), self->_traitsParticipantDelegate);
      v20 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
      traitsParticipant = self->_traitsParticipant;
      self->_traitsParticipant = v20;

      v50 = v15;
      -[SBTraitsSceneParticipantDelegate setArbiter:](self->_traitsParticipantDelegate, "setArbiter:", v15);
      -[SBTraitsSceneParticipantDelegate setParticipant:](self->_traitsParticipantDelegate, "setParticipant:", self->_traitsParticipant);
      v22 = self->_traitsParticipantDelegate;
      v23 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v13, "windowLevel");
      objc_msgSend(v23, "numberWithDouble:");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBTraitsSceneParticipantDelegate setPreferredSceneLevel:](v22, "setPreferredSceneLevel:", v24);

      v25 = -[SBTraitsOrientedContentViewController initWithNibName:bundle:]([SBTraitsOrientedContentViewController alloc], "initWithNibName:bundle:", 0, 0);
      orientedContentViewController = self->_orientedContentViewController;
      self->_orientedContentViewController = v25;

      -[SBTraitsOrientedContentViewController setContentParticipant:](self->_orientedContentViewController, "setContentParticipant:", self->_traitsParticipant);
      v27 = objc_opt_class();
      SBSafeCast(v27, v13);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        v30 = self->_orientedContentViewController;
        objc_msgSend(v28, "traitsParticipant");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBTraitsOrientedContentViewController setContainerParticipant:](v30, "setContainerParticipant:", v31);

      }
      -[SBDashBoardTraitsAwareAppHostingViewController view](self, "view");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "bounds");
      v34 = v33;
      v36 = v35;
      v38 = v37;
      v40 = v39;

      -[SBTraitsOrientedContentViewController view](self->_orientedContentViewController, "view");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setFrame:", v34, v36, v38, v40);
      -[SBDashBoardTraitsAwareAppHostingViewController _referenceBoundsForBounds:](self, "_referenceBoundsForBounds:", v34, v36, v38, v40);
      objc_msgSend(v41, "setContentViewBoundsInReferenceSpace:");
      objc_msgSend(v41, "setAutoresizingMask:", 18);
      v42 = self->_orientedContentViewController;
      -[SBDashBoardTraitsAwareAppHostingViewController _hostedAppViewController](self, "_hostedAppViewController");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = MEMORY[0x1E0C809B0];
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __83__SBDashBoardTraitsAwareAppHostingViewController__acquireTraitsParticipantIfNeeded__block_invoke;
      v57[3] = &unk_1E8E9EA00;
      v45 = v41;
      v58 = v45;
      v59 = self;
      -[SBTraitsOrientedContentViewController bs_addChildViewController:animated:transitionBlock:](v42, "bs_addChildViewController:animated:transitionBlock:", v43, 0, v57);

      objc_initWeak(&location, self);
      v46 = self->_traitsParticipantDelegate;
      v54[0] = v44;
      v54[1] = 3221225472;
      v54[2] = __83__SBDashBoardTraitsAwareAppHostingViewController__acquireTraitsParticipantIfNeeded__block_invoke_2;
      v54[3] = &unk_1E8EA3840;
      objc_copyWeak(&v55, &location);
      -[SBTraitsSceneParticipantDelegate setActuateOrientationAlongsideBlock:](v46, "setActuateOrientationAlongsideBlock:", v54);
      v47 = self->_orientedContentViewController;
      v52[0] = v44;
      v52[1] = 3221225472;
      v52[2] = __83__SBDashBoardTraitsAwareAppHostingViewController__acquireTraitsParticipantIfNeeded__block_invoke_3;
      v52[3] = &unk_1E8EA3868;
      objc_copyWeak(&v53, &location);
      -[SBTraitsOrientedContentViewController setActuateAlongsideBlock:](v47, "setActuateAlongsideBlock:", v52);
      -[TRAParticipant setNeedsUpdatePreferencesWithReason:](self->_traitsParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("setup"));
      v48 = self->_orientedContentViewController;
      v51[0] = v44;
      v51[1] = 3221225472;
      v51[2] = __83__SBDashBoardTraitsAwareAppHostingViewController__acquireTraitsParticipantIfNeeded__block_invoke_4;
      v51[3] = &unk_1E8EA0048;
      v51[4] = self;
      -[SBDashBoardTraitsAwareAppHostingViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v48, 0, v51);
      objc_destroyWeak(&v53);
      objc_destroyWeak(&v55);
      objc_destroyWeak(&location);

    }
  }
}

void __83__SBDashBoardTraitsAwareAppHostingViewController__acquireTraitsParticipantIfNeeded__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_hostedAppViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setContentView:", v2);

}

void __83__SBDashBoardTraitsAwareAppHostingViewController__acquireTraitsParticipantIfNeeded__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[124], "updateOrientationIfNeeded");
    WeakRetained = v2;
  }

}

void __83__SBDashBoardTraitsAwareAppHostingViewController__acquireTraitsParticipantIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2, double a3, double a4)
{
  id *WeakRetained;
  id v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v8 = objc_loadWeakRetained(WeakRetained + 121);
    objc_msgSend(v8, "setHostedAppReferenceSize:withInterfaceOrientation:", a2, a3, a4);

    WeakRetained = v9;
  }

}

void __83__SBDashBoardTraitsAwareAppHostingViewController__acquireTraitsParticipantIfNeeded__block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v2);

}

- (void)_invalidateTraitsParticipant
{
  SBTraitsSceneParticipantDelegate *traitsParticipantDelegate;
  TRAParticipant *traitsParticipant;

  -[TRAParticipant invalidate](self->_traitsParticipant, "invalidate");
  -[SBTraitsSceneParticipantDelegate invalidate](self->_traitsParticipantDelegate, "invalidate");
  traitsParticipantDelegate = self->_traitsParticipantDelegate;
  self->_traitsParticipantDelegate = 0;

  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = 0;

}

- (CGRect)_referenceBoundsForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = CGRectGetHeight(a3);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v8 = CGRectGetWidth(v13);
  if (v7 >= v8)
    v9 = v8;
  else
    v9 = v7;
  if (v7 >= v8)
    v10 = v7;
  else
    v10 = v8;
  v11 = x;
  v12 = y;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[TRAParticipant invalidate](self->_traitsParticipant, "invalidate");
  -[SBTraitsSceneParticipantDelegate invalidate](self->_traitsParticipantDelegate, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardTraitsAwareAppHostingViewController;
  -[SBDashBoardTraitsAwareAppHostingViewController dealloc](&v3, sel_dealloc);
}

- (SBApplicationHosting)appHosting
{
  return (SBApplicationHosting *)objc_loadWeakRetained((id *)&self->_appHosting);
}

- (TRAParticipant)traitsParticipant
{
  return self->_traitsParticipant;
}

- (void)setTraitsParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_traitsParticipant, a3);
}

- (SBTraitsSceneParticipantDelegate)traitsParticipantDelegate
{
  return self->_traitsParticipantDelegate;
}

- (void)setTraitsParticipantDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_traitsParticipantDelegate, a3);
}

- (void)setOrientedContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_orientedContentViewController, a3);
}

- (UIWindow)targetWindow
{
  return self->_targetWindow;
}

- (void)setTargetWindow:(id)a3
{
  objc_storeStrong((id *)&self->_targetWindow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetWindow, 0);
  objc_storeStrong((id *)&self->_orientedContentViewController, 0);
  objc_storeStrong((id *)&self->_traitsParticipantDelegate, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_destroyWeak((id *)&self->_appHosting);
}

@end
