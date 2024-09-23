@implementation SBDeckSwitcherPanGestureWorkspaceTransaction

- (int64_t)_gestureType
{
  return 1;
}

- (id)selectedAppLayoutForGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;

  v4 = a3;
  -[SBFluidSwitcherGestureWorkspaceTransaction switcherViewController](self, "switcherViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unlockedEnvironmentMode");

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transientOverlayContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "layoutContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activeTransitionContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "transientOverlayContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12
    && objc_msgSend(v12, "transitionType") == 1
    && !-[SBFluidSwitcherGestureWorkspaceTransaction hasCompletedAtLeastOneGesture](self, "hasCompletedAtLeastOneGesture"))
  {
    objc_msgSend(v12, "transientOverlay");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_appLayoutForWorkspaceTransientOverlay:", v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (v10 == 2)
  {
    objc_msgSend(v7, "bounds");
    UIRectGetCenter();
    v24 = v5;
    goto LABEL_14;
  }
  if (v10 != 1)
  {
LABEL_10:
    -[SBFluidSwitcherGestureWorkspaceTransaction switcherController](self, "switcherController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "windowManagementStyle");

    if (v19 == 2)
    {
      objc_msgSend(v5, "layoutContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "layoutState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "appLayout");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
      goto LABEL_17;
    }
    objc_msgSend(v4, "locationInView:", v6);
    objc_msgSend(v6, "size");
    v26 = v25 * 0.5;
    objc_msgSend(v6, "size");
    v22 = v27 * 0.5;
    v24 = v5;
    v23 = v26;
LABEL_14:
    objc_msgSend(v24, "_adjustedAppLayoutForItemContainerAtLocation:environment:", 1, v22, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v17 = 0;
  if (v14 && v16)
  {
    if (objc_msgSend(v16, "transitionType"))
    {
      v17 = 0;
      goto LABEL_17;
    }
    goto LABEL_10;
  }
LABEL_17:

  return v17;
}

- (void)_begin
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "Began bottom edge pan gesture transaction.", a5, a6, a7, a8, 0);
}

- (void)_didComplete
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "Completed bottom edge pan gesture transaction.", a5, a6, a7, a8, 0);
}

- (void)_beginWithGesture:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  int v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];
  void (*v17)(_QWORD *);
  void *v18;
  SBDeckSwitcherPanGestureWorkspaceTransaction *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  kdebug_trace();
  -[SBDeckSwitcherPanGestureWorkspaceTransaction _removeHysteresisFromTranslation](self, "_removeHysteresisFromTranslation");
  -[SBFluidSwitcherGestureWorkspaceTransaction switcherViewController](self, "switcherViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  SBSafeCast(v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "touchedEdges");
  if (v7)
  {
    objc_msgSend(v7, "_touchInterfaceOrientation");
    v8 = _screenRegionGivenInterfaceOrientedRegion();
    objc_msgSend(v5, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "switcherInterfaceOrientationForSwitcherContentController:", v5);

    if ((_interfaceOrientedRegionGivenScreenRegion() & 4) == 0)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v17 = (void (*)(_QWORD *))__66__SBDeckSwitcherPanGestureWorkspaceTransaction__beginWithGesture___block_invoke;
      v18 = &unk_1E8EB7FA8;
      v20 = v8;
      v21 = v10;
      v19 = self;
      v11 = v16;
      v12 = 0;
      v22 = 0;
      v13 = 4;
      do
      {
        if (((1 << v12) & 0x1E) != 0)
        {
          v17(v11);
          if (v22)
            break;
          --v13;
        }
        if (v12 > 0x3E)
          break;
        ++v12;
      }
      while (v13 > 0);

    }
  }
  -[SBDeckSwitcherPanGestureWorkspaceTransaction selectedAppLayoutForGestureRecognizer:](self, "selectedAppLayoutForGestureRecognizer:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherGestureWorkspaceTransaction setSelectedAppLayout:](self, "setSelectedAppLayout:", v14);
  v15.receiver = self;
  v15.super_class = (Class)SBDeckSwitcherPanGestureWorkspaceTransaction;
  -[SBFluidSwitcherGestureWorkspaceTransaction _beginWithGesture:](&v15, sel__beginWithGesture_, v4);
  kdebug_trace();

}

void __66__SBDeckSwitcherPanGestureWorkspaceTransaction__beginWithGesture___block_invoke(uint64_t a1, uint64_t a2, int a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;

  v6 = a3;
  if ((_interfaceOrientedRegionGivenScreenRegion() & 4) != 0)
  {
    if (*(_QWORD *)(a1 + 48) != v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "windowScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "switcherController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "_attemptContentViewInterfaceOrientationUpdateForPanGesture:", v6);
      objc_msgSend((id)SBApp, "updateNativeOrientationWithOrientation:logMessage:", v6, CFSTR("Force updating orientation for deck switcher pan gesture transaction"));

    }
    *a4 = 1;
  }
}

- (void)_finishWithGesture:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  kdebug_trace();
  v5.receiver = self;
  v5.super_class = (Class)SBDeckSwitcherPanGestureWorkspaceTransaction;
  -[SBFluidSwitcherGestureWorkspaceTransaction _finishWithGesture:](&v5, sel__finishWithGesture_, v4);

  kdebug_trace();
}

- (void)_removeHysteresisFromTranslation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v3 = objc_opt_class();
  -[SBSystemGestureWorkspaceTransaction gestureRecognizer](self, "gestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v4);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SBFluidSwitcherGestureWorkspaceTransaction switcherViewController](self, "switcherViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "translationInView:", v6);
    v8 = v7;
    objc_msgSend(v12, "_hysteresis");
    v10 = v8 + v9;
    if (v8 + v9 > 0.0)
      v10 = 0.0;
    v11 = fmax(v8 - v9, 0.0);
    if (v8 > 0.0)
      v10 = v11;
    objc_msgSend(v12, "setTranslation:inView:", v6, 0.0, v10);

  }
}

@end
