@implementation SiriPresentationSpringBoardMainScreenViewController

- (SiriPresentationSpringBoardMainScreenViewController)initWithIdentifier:(int64_t)a3 hostedPresentationFrame:(CGRect)a4
{
  SiriPresentationSpringBoardMainScreenViewController *v4;
  SiriPresentationSpringBoardMainScreenViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriPresentationSpringBoardMainScreenViewController;
  v4 = -[SiriPresentationViewController initWithIdentifier:hostedPresentationFrame:](&v7, sel_initWithIdentifier_hostedPresentationFrame_, a3, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
  v5 = v4;
  if (v4)
  {
    -[SiriPresentationSpringBoardMainScreenViewController resetGestureBehaviors](v4, "resetGestureBehaviors");
    -[SiriPresentationViewController prewarmMetalLayers](v5, "prewarmMetalLayers");
  }
  return v5;
}

- (SiriPresentationSpringBoardMainScreenViewController)init
{
  SiriPresentationSpringBoardMainScreenViewController *v2;
  SiriPresentationSpringBoardMainScreenViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriPresentationSpringBoardMainScreenViewController;
  v2 = -[SiriPresentationViewController initWithIdentifier:hostedPresentationFrame:](&v5, sel_initWithIdentifier_hostedPresentationFrame_, 1, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
  v3 = v2;
  if (v2)
  {
    -[SiriPresentationSpringBoardMainScreenViewController resetGestureBehaviors](v2, "resetGestureBehaviors");
    -[SiriPresentationViewController prewarmMetalLayers](v3, "prewarmMetalLayers");
  }
  return v3;
}

- (void)resetGestureBehaviors
{
  int v3;
  uint64_t v4;

  v3 = AFDeviceSupportsSystemAssistantExperience();
  v4 = (SiriUIDeviceIsPad() | v3) ^ 1;
  -[SiriPresentationSpringBoardMainScreenViewController setShouldDismissForTapOutsideContent:](self, "setShouldDismissForTapOutsideContent:", v4);
  -[SiriPresentationSpringBoardMainScreenViewController setShouldDismissForTapsOutsideContent:](self, "setShouldDismissForTapsOutsideContent:", v4);
  -[SiriPresentationSpringBoardMainScreenViewController setShouldDismissForSwipesOutsideContent:](self, "setShouldDismissForSwipesOutsideContent:", v4);
  -[SiriPresentationSpringBoardMainScreenViewController setShouldPassTouchesThroughToSpringBoard:](self, "setShouldPassTouchesThroughToSpringBoard:", SiriUIDeviceIsPad() | v3);
  -[SiriPresentationSpringBoardMainScreenViewController setShareHomeGesture:](self, "setShareHomeGesture:", SiriUIDeviceIsPad() & (v3 ^ 1));
}

- (void)loadView
{
  id v3;
  id v4;

  v3 = objc_alloc(MEMORY[0x24BE09550]);
  v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v4, "setOpaque:", 0);
  -[SiriPresentationSpringBoardMainScreenViewController setView:](self, "setView:", v4);

}

- (void)requestPasscodeUnlockWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  -[SiriPresentationViewController siriViewController](self, "siriViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __91__SiriPresentationSpringBoardMainScreenViewController_requestPasscodeUnlockWithCompletion___block_invoke;
    v6[3] = &unk_24D47A5F8;
    v7 = v4;
    objc_msgSend(v5, "handlePasscodeUnlockWithCompletion:", v6);

  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 2);
  }

}

uint64_t __91__SiriPresentationSpringBoardMainScreenViewController_requestPasscodeUnlockWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unsigned int v3;
  uint64_t v4;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2 == 1)
      v3 = 1;
    else
      v3 = 2;
    if (a2)
      v4 = v3;
    else
      v4 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  }
  return result;
}

- (void)setShowsStatusBar:(BOOL)a3
{
  -[SiriPresentationSpringBoardMainScreenViewController requestStatusBarVisible:animated:completion:](self, "requestStatusBarVisible:animated:completion:", a3, 0, 0);
}

- (void)requestStatusBarVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[SiriPresentationViewController siriViewController](self, "siriViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestStatusBarVisible:animated:completion:", v6, v5, v8);

}

- (void)setFluidDismissalState:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  SiriUIInvokeOnMainQueue();

}

void __78__SiriPresentationSpringBoardMainScreenViewController_setFluidDismissalState___block_invoke(uint64_t a1)
{
  id v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 968) = *(_QWORD *)(a1 + 40) != 0;
  objc_msgSend(*(id *)(a1 + 32), "siriViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFluidDismissalState:", *(_QWORD *)(a1 + 40));

}

- (void)noteFluidDismissalCompletedWithSuccess:(BOOL)a3
{
  SiriUIInvokeOnMainQueue();
}

void __94__SiriPresentationSpringBoardMainScreenViewController_noteFluidDismissalCompletedWithSuccess___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "siriViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteFluidDismissalCompletedWithSuccess:", *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)shouldDismissForTapOutsideContent
{
  return self->_shouldDismissForTapOutsideContent;
}

- (BOOL)shouldDismissForTapsOutsideContent
{
  return self->_shouldDismissForTapsOutsideContent;
}

- (BOOL)shouldDismissForTransientOverlayForBundleIdentifier:(id)a3
{
  return 0;
}

- (void)setShouldDismissForTapOutsideContent:(BOOL)a3
{
  id v4;
  BOOL v5;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  v5 = a3;
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __92__SiriPresentationSpringBoardMainScreenViewController_setShouldDismissForTapOutsideContent___block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 *v6;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1400] = *(_BYTE *)(a1 + 40);
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "siriPresentationControllerDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    WeakRetained = v6;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v6, "siriPresentationControllerDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "siriPresentation:didUpdateShouldDismissForTapOutsideContentTo:", v6, v6[1400]);

      WeakRetained = v6;
    }
  }

}

- (void)setShouldDismissForTapsOutsideContent:(BOOL)a3
{
  id v4;
  BOOL v5;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  v5 = a3;
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __93__SiriPresentationSpringBoardMainScreenViewController_setShouldDismissForTapsOutsideContent___block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 *v6;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1401] = *(_BYTE *)(a1 + 40);
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "siriPresentationControllerDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    WeakRetained = v6;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v6, "siriPresentationControllerDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "siriPresentation:didUpdateShouldDismissForTapsOutsideContent:", v6, v6[1401]);

      WeakRetained = v6;
    }
  }

}

- (void)setShouldDismissForSwipesOutsideContent:(BOOL)a3
{
  id v4;
  BOOL v5;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  v5 = a3;
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __95__SiriPresentationSpringBoardMainScreenViewController_setShouldDismissForSwipesOutsideContent___block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 *v6;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1405] = *(_BYTE *)(a1 + 40);
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "siriPresentationControllerDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    WeakRetained = v6;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v6, "siriPresentationControllerDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "siriPresentation:didUpdateShouldDismissForSwipesOutsideContent:", v6, v6[1405]);

      WeakRetained = v6;
    }
  }

}

- (void)setShouldPassTouchesThroughToSpringBoard:(BOOL)a3
{
  id v4;
  BOOL v5;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  v5 = a3;
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __96__SiriPresentationSpringBoardMainScreenViewController_setShouldPassTouchesThroughToSpringBoard___block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 *v6;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1404] = *(_BYTE *)(a1 + 40);
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "siriPresentationControllerDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    WeakRetained = v6;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v6, "siriPresentationControllerDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "siriPresentation:didUpdateShouldPassTouchesThroughToSpringBoard:", v6, v6[1404]);

      WeakRetained = v6;
    }
  }

}

- (void)setShareHomeGesture:(BOOL)a3
{
  id v5;
  BOOL v6;
  id location;

  if ((SiriUIDeviceIsPad() & 1) != 0 || AFDeviceSupportsSystemAssistantExperience())
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v5, &location);
    v6 = a3;
    SiriUIInvokeOnMainQueue();
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __75__SiriPresentationSpringBoardMainScreenViewController_setShareHomeGesture___block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  unsigned __int8 *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[1406] = *(_BYTE *)(a1 + 40);
    objc_msgSend(WeakRetained, "siriPresentationControllerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(v3, "siriPresentationControllerDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "siriPresentation:didUpdateHomeGestureSharing:", v3, v3[1406]);

      v7 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v8 = CFSTR("shared");
        if (!*(_BYTE *)(a1 + 40))
          v8 = CFSTR("not shared");
        v9 = 136315394;
        v10 = "-[SiriPresentationSpringBoardMainScreenViewController setShareHomeGesture:]_block_invoke";
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_215D55000, v7, OS_LOG_TYPE_DEFAULT, "%s #compact: Telling SpringBoard that the Home Gesture is %@ with Siri", (uint8_t *)&v9, 0x16u);
      }
    }
  }

}

- (void)setInputType:(int64_t)a3
{
  id v4[2];
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(v4, &location);
  v4[1] = (id)a3;
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(v4);
  objc_destroyWeak(&location);
}

void __68__SiriPresentationSpringBoardMainScreenViewController_setInputType___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  char v4;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[176] = *(_QWORD *)(a1 + 40);
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "siriPresentationControllerDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    WeakRetained = v6;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v6, "siriPresentationControllerDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "siriPresentation:didUpdateInputType:", v6, v6[176]);

      WeakRetained = v6;
    }
  }

}

- (void)setDockFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SiriPresentationViewController siriViewController](self, "siriViewController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SiriPresentationSpringBoardMainScreenViewController showAppsBehindSiri](self, "showAppsBehindSiri"))
  {
    -[SiriPresentationSpringBoardMainScreenViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertRect:toView:", v9, x, y, width, height);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

  }
  else
  {
    v11 = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v17 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  objc_msgSend(v18, "setDockFrame:", v11, v13, v15, v17);

}

- (void)setSystemApertureFrames:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[SiriPresentationViewController presentationState](self, "presentationState") == 2
    || -[SiriPresentationViewController presentationState](self, "presentationState") == 1
    || -[SiriPresentationViewController presentationState](self, "presentationState") == 4)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[SiriPresentationSpringBoardMainScreenViewController setSystemApertureFrames:]";
      _os_log_impl(&dword_215D55000, v5, OS_LOG_TYPE_DEFAULT, "%s #compact: received system aperture frames", (uint8_t *)&v16, 0xCu);
    }
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "CGRectValue");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      -[SiriPresentationViewController siriViewController](self, "siriViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSystemApertureFrame:", v8, v10, v12, v14);

    }
  }

}

- (BOOL)showAppsBehindSiri
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "alwaysObscureBackgroundContentWhenActive") ^ 1;

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)tapsOutsideContentDismissAssistant
{
  return self->_tapsOutsideContentDismissAssistant;
}

- (BOOL)shouldPassTapsThrough
{
  return self->_shouldPassTapsThrough;
}

- (BOOL)shouldPassTouchesThroughToSpringBoard
{
  return self->_shouldPassTouchesThroughToSpringBoard;
}

- (BOOL)shouldDismissForSwipesOutsideContent
{
  return self->_shouldDismissForSwipesOutsideContent;
}

- (BOOL)shareHomeGesture
{
  return self->_shareHomeGesture;
}

- (int64_t)inputType
{
  return self->_inputType;
}

@end
