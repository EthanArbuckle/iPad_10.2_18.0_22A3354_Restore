@implementation QLItemViewController

- (void)setAppearance:(id)a3
{
  -[QLItemViewController setAppearance:animated:](self, "setAppearance:animated:", a3, 0);
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  QLAppearance *v6;
  QLAppearance *appearance;
  QLAppearance *v8;
  QLAppearance *v9;

  v4 = a4;
  v6 = (QLAppearance *)a3;
  appearance = self->_appearance;
  self->_appearance = v6;
  v9 = v6;
  v8 = appearance;

  -[QLItemViewController updateScrollViewContentOffset:withPreviousAppearance:](self, "updateScrollViewContentOffset:withPreviousAppearance:", v4, v8);
}

- (void)setContentFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentFrame;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentFrame = &self->_contentFrame;
  if (!CGRectEqualToRect(self->_contentFrame, a3))
  {
    p_contentFrame->origin.x = x;
    p_contentFrame->origin.y = y;
    p_contentFrame->size.width = width;
    p_contentFrame->size.height = height;
    -[QLItemViewController notifyDelegateWantsChromelessBars](self, "notifyDelegateWantsChromelessBars");
    -[QLItemViewController delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "previewItemViewControllerDidUpdateContentFrame:", self);

  }
}

- (void)notifyDelegateWantsChromelessBars
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v11;
  void *v12;
  id v13;

  if (!CGRectIsEmpty(self->_contentFrame))
  {
    -[QLItemViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeAreaInsets");
    v7 = v6;
    if (v8 != *(double *)(MEMORY[0x1E0CEB4B0] + 8)
      || v4 != *MEMORY[0x1E0CEB4B0]
      || v5 != *(double *)(MEMORY[0x1E0CEB4B0] + 24))
    {

LABEL_12:
      -[QLItemViewController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "previewItemViewController:wantsChromelessNavigationBar:", self, -[QLItemViewController navigationBarShouldBeChromeless](self, "navigationBarShouldBeChromeless"));

      -[QLItemViewController delegate](self, "delegate");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "previewItemViewController:wantsChromelessToolbar:", self, -[QLItemViewController toolbarShouldBeChromeless](self, "toolbarShouldBeChromeless"));

      return;
    }
    v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);

    if (v7 != v11)
      goto LABEL_12;
  }
}

- (BOOL)supportsChromeless
{
  return 0;
}

- (BOOL)navigationBarShouldBeChromeless
{
  double y;
  void *v4;
  double v5;
  BOOL v6;

  if (!-[QLItemViewController supportsChromeless](self, "supportsChromeless"))
    return 0;
  y = self->_contentFrame.origin.y;
  -[QLItemViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeAreaInsets");
  v6 = y >= v5;

  return v6;
}

- (BOOL)toolbarShouldBeChromeless
{
  CGFloat v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  BOOL v9;

  if (!-[QLItemViewController supportsChromeless](self, "supportsChromeless"))
    return 0;
  v3 = self->_contentFrame.origin.y + self->_contentFrame.size.height;
  -[QLItemViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  -[QLItemViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaInsets");
  v9 = v3 <= v6 - v8;

  return v9;
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QLItemViewController;
  -[QLItemViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  -[QLItemViewController notifyDelegateWantsChromelessBars](self, "notifyDelegateWantsChromelessBars");
}

- (void)updateScrollViewContentOffset
{
  -[QLItemViewController updateScrollViewContentOffset:withPreviousAppearance:](self, "updateScrollViewContentOffset:withPreviousAppearance:", 0, 0);
}

- (void)updateScrollViewContentOffset:(BOOL)a3 withPreviousAppearance:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  int64_t lastScrollViewUpdateInterfaceOrientation;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  void (**v41)(_QWORD);
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  void (**v48)(_QWORD);
  _QWORD v49[5];
  id v50;
  double v51;
  double v52;
  uint64_t v53;
  double v54;

  v4 = a3;
  v6 = a4;
  -[QLItemViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[QLItemViewController automaticallyUpdateScrollViewContentOffset](self, "automaticallyUpdateScrollViewContentOffset")|| -[QLItemViewController automaticallyUpdateScrollViewContentInset](self, "automaticallyUpdateScrollViewContentInset"))&& v7)
  {
    -[QLItemViewController appearance](self, "appearance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "peripheryInsets");
    v10 = v9;

    objc_msgSend(v6, "topInset");
    v12 = v11;
    objc_msgSend(v6, "peripheryInsets");
    if (v12 >= v13)
      v14 = v12;
    else
      v14 = v13;
    -[QLItemViewController appearance](self, "appearance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topInset");
    v17 = v16;

    -[QLItemViewController appearance](self, "appearance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "peripheryInsets");
    v20 = v19;

    if (v17 >= v20)
      v21 = v17;
    else
      v21 = v20;
    -[QLItemViewController appearance](self, "appearance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bottomInset");
    v24 = v23;

    -[QLItemViewController appearance](self, "appearance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "peripheryInsets");
    v27 = v26;

    if (v24 >= v27)
      v28 = v24;
    else
      v28 = v27;
    objc_msgSend(v7, "contentOffset");
    v31 = v30;
    v32 = v29;
    if (v21 <= 0.0 || v29 != -v14)
    {
      if (v21 == v10)
      {
        v33 = -v10;
        if (v29 < -v10)
        {
LABEL_22:
          v39 = MEMORY[0x1E0C809B0];
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          if (v33 >= -v21)
            v40 = v33;
          else
            v40 = -v21;
          v49[2] = __77__QLItemViewController_updateScrollViewContentOffset_withPreviousAppearance___block_invoke;
          v49[3] = &unk_1E9EFC6E0;
          v51 = v21;
          v52 = v28;
          v49[4] = self;
          v50 = v7;
          v53 = v31;
          v54 = v40;
          v41 = (void (**)(_QWORD))MEMORY[0x1DF089CE8](v49);
          v42 = v41;
          if (v4)
          {
            v43 = (void *)MEMORY[0x1E0CEABB0];
            v44 = *MEMORY[0x1E0CEB9E0];
            v47[0] = v39;
            v47[1] = 3221225472;
            v47[2] = __77__QLItemViewController_updateScrollViewContentOffset_withPreviousAppearance___block_invoke_2;
            v47[3] = &unk_1E9EFC500;
            v48 = v41;
            objc_msgSend(v43, "animateWithDuration:animations:", v47, v44);

          }
          else
          {
            v41[2](v41);
          }
          -[QLItemViewController view](self, "view");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "window");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          self->_lastScrollViewUpdateInterfaceOrientation = objc_msgSend(v46, "_windowInterfaceOrientation");

          goto LABEL_29;
        }
      }
      if (!v6 || (objc_msgSend(v6, "topInset"), v32 != -v34))
      {
        lastScrollViewUpdateInterfaceOrientation = self->_lastScrollViewUpdateInterfaceOrientation;
        -[QLItemViewController view](self, "view");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "window");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "_windowInterfaceOrientation");

        v33 = v14 + v32 - v21;
        if (lastScrollViewUpdateInterfaceOrientation == v38)
          v33 = v32;
        goto LABEL_22;
      }
    }
    v33 = -v21;
    goto LABEL_22;
  }
LABEL_29:

}

uint64_t __77__QLItemViewController_updateScrollViewContentOffset_withPreviousAppearance___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t result;

  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  if (objc_msgSend(*(id *)(a1 + 32), "automaticallyUpdateScrollViewContentInset"))
    objc_msgSend(*(id *)(a1 + 40), "setContentInset:", v2, 0.0, v3, 0.0);
  if (objc_msgSend(*(id *)(a1 + 32), "automaticallyUpdateScrollViewIndicatorInset"))
    objc_msgSend(*(id *)(a1 + 40), "setScrollIndicatorInsets:", v2, 0.0, v3, 0.0);
  result = objc_msgSend(*(id *)(a1 + 40), "isDecelerating");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "automaticallyUpdateScrollViewContentOffset");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 40), "setContentOffset:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  return result;
}

uint64_t __77__QLItemViewController_updateScrollViewContentOffset_withPreviousAppearance___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (QLItemViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QLItemViewController;
  return -[QLItemViewController init](&v3, sel_init);
}

- (void)loadPreviewControllerIfNeededWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSMutableArray *completionBlocks;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (self->_isLoaded)
  {
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
  }
  else if (self->_isLoading)
  {
    completionBlocks = self->_completionBlocks;
    v14 = (void *)MEMORY[0x1DF089CE8](v11);
    -[NSMutableArray addObject:](completionBlocks, "addObject:", v14);

  }
  else
  {
    self->_isLoaded = 0;
    self->_isLoading = 1;
    objc_storeStrong(&self->_contents, a3);
    objc_storeStrong((id *)&self->_context, a4);
    v15 = (NSMutableArray *)objc_opt_new();
    v16 = self->_completionBlocks;
    self->_completionBlocks = v15;

    if (v12)
    {
      v17 = self->_completionBlocks;
      v18 = (void *)MEMORY[0x1DF089CE8](v12);
      -[NSMutableArray addObject:](v17, "addObject:", v18);

    }
    objc_initWeak(&location, self);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __92__QLItemViewController_loadPreviewControllerIfNeededWithContents_context_completionHandler___block_invoke;
    v23[3] = &unk_1E9EFC708;
    objc_copyWeak(&v25, &location);
    v19 = v10;
    v24 = v19;
    -[QLItemViewController loadPreviewControllerWithContents:context:completionHandler:](self, "loadPreviewControllerWithContents:context:completionHandler:", v9, v19, v23);
    objc_msgSend(v19, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v19, "backgroundColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLItemViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setBackgroundColor:", v21);

    }
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

}

void __92__QLItemViewController_loadPreviewControllerIfNeededWithContents_context_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id v6;
  id v7;
  NSObject **v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setIsLoaded:", v3 == 0);

  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "setLoadingFailed:", v3 != 0);

  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v7, "setIsLoading:", 0);

  if (v3)
  {
    v8 = (NSObject **)MEMORY[0x1E0D83678];
    v9 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v13 = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_1D936E000, v9, OS_LOG_TYPE_ERROR, "Error while attempting to load preview controller for context '%@': %@ #ItemViewController", (uint8_t *)&v13, 0x16u);
    }
  }
  v11 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v11, "_addDragInteractionIfNeeded");

  v12 = objc_loadWeakRetained(v4);
  objc_msgSend(v12, "performCompletionBlocksWithError:", v3);

}

- (void)performCompletionBlocksWithError:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_completionBlocks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_completionBlocks, "removeAllObjects", (_QWORD)v10);
}

- (void)previewDidAppear:(BOOL)a3
{
  self->_didAppearOnce = 1;
}

- (BOOL)canEnterFullScreen
{
  return 1;
}

- (BOOL)canToggleFullScreen
{
  void *v3;
  void *v4;
  int v5;

  -[QLItemViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[QLItemViewController scrollView](self, "scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDecelerating") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)canClickToToggleFullscreen
{
  return 1;
}

- (BOOL)canBeLocked
{
  return 0;
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)excludedToolbarButtonIdentifiersForTraitCollection:(id)a3
{
  return 0;
}

- (id)scrollView
{
  return 0;
}

- (id)_cancelTouchToken
{
  return 0;
}

- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)canSwipeToDismiss
{
  return 1;
}

- (BOOL)canPinchToDismiss
{
  return 1;
}

- (BOOL)canShowToolBar
{
  return 1;
}

- (BOOL)canShowNavBar
{
  return 1;
}

- (BOOL)shouldRecognizeGestureRecognizer:(id)a3
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (double)edgePanGestureWidth
{
  return 0.0;
}

- (BOOL)automaticallyUpdateScrollViewContentOffset
{
  return 0;
}

- (BOOL)automaticallyUpdateScrollViewContentInset
{
  return 0;
}

- (BOOL)automaticallyUpdateScrollViewIndicatorInset
{
  return 0;
}

- (id)fullscreenBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
}

- (BOOL)shouldAlwaysRunFullscreen
{
  return 0;
}

- (BOOL)presenterShouldHandleLoadingView:(id)a3 readyToDisplay:(id)a4
{
  return 1;
}

- (void)prepareForInvalidationWithCompletionHandler:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (NSArray)registeredKeyCommands
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  -[QLItemViewController scrollView](self, "scrollView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[QLItemViewController supportsScrollingUpAndDownUsingKeyCommands](self, "supportsScrollingUpAndDownUsingKeyCommands");

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB728], 0, sel__scrollScrollViewDown);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      QLLocalizedString(CFSTR("Scroll Down"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDiscoverabilityTitle:", v8);

      objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB7D0], 0, sel__scrollScrollViewUp);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      QLLocalizedString(CFSTR("Scroll Up"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDiscoverabilityTitle:", v10);

      +[QLKeyCommand keyCommandWithKeyCommand:identifier:](QLKeyCommand, "keyCommandWithKeyCommand:identifier:", v7, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v11);

      +[QLKeyCommand keyCommandWithKeyCommand:identifier:](QLKeyCommand, "keyCommandWithKeyCommand:identifier:", v9, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v12);

    }
  }
  return (NSArray *)v3;
}

- (BOOL)supportsScrollingUpAndDownUsingKeyCommands
{
  return 1;
}

- (void)handlePerformedKeyCommandIfNeeded:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "keyCommandIdentifier") == 2)
  {
    -[QLItemViewController _scrollScrollViewUp](self, "_scrollScrollViewUp");
  }
  else if (objc_msgSend(v4, "keyCommandIdentifier") == 3)
  {
    -[QLItemViewController _scrollScrollViewDown](self, "_scrollScrollViewDown");
  }

}

- (void)_scrollScrollViewUp
{
  -[QLItemViewController _scrollScrollViewByPercentualOffset:](self, "_scrollScrollViewByPercentualOffset:", 1.0);
}

- (void)_scrollScrollViewDown
{
  -[QLItemViewController _scrollScrollViewByPercentualOffset:](self, "_scrollScrollViewByPercentualOffset:", -1.0);
}

- (void)_scrollScrollViewByPercentualOffset:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double Height;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  _QWORD v26[6];
  CGRect v27;

  -[QLItemViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[QLItemViewController scrollView](self, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentInset");
    v8 = v7;

    -[QLItemViewController scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    Height = CGRectGetHeight(v27);
    -[QLItemViewController scrollView](self, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentInset");
    v13 = Height - v12;
    -[QLItemViewController scrollView](self, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentInset");
    v16 = v13 - v15;

    -[QLItemViewController scrollView](self, "scrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contentSize");
    v19 = v18;

    -[QLItemViewController scrollView](self, "scrollView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contentOffset");
    v22 = v21 - v16 * a3;

    v23 = v19 - v16 - v8;
    if (v22 < v23)
      v23 = v22;
    if (v23 >= -v8)
      v24 = v23;
    else
      v24 = -v8;
    -[QLItemViewController scrollView](self, "scrollView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "flashScrollIndicators");

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __60__QLItemViewController__scrollScrollViewByPercentualOffset___block_invoke;
    v26[3] = &unk_1E9EFC0C8;
    v26[4] = self;
    *(double *)&v26[5] = v24;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v26, 0.4);
  }
}

void __60__QLItemViewController__scrollScrollViewByPercentualOffset___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOffset");
  v3 = v2;
  v4 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentOffset:", v3, v4);

}

- (id)parallaxView
{
  return 0;
}

- (void)performFirstTimeAppearanceActionsIfNeeded:(unint64_t)a3
{
  if (a3)
  {
    if (-[QLItemViewController canPerformFirstTimeAppearanceActions:](self, "canPerformFirstTimeAppearanceActions:"))
      -[QLItemViewController performFirstTimeAppearanceActions:](self, "performFirstTimeAppearanceActions:", a3);
  }
}

- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3
{
  return 0;
}

- (id)stateRestorationDictionary
{
  return 0;
}

- (void)notifyDelegatesDidFailWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[QLItemViewController presentingDelegate](self, "presentingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewItemViewController:didFailWithError:", self, v4);

  -[QLItemViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewItemViewController:didFailWithError:", self, v4);

}

- (id)draggableView
{
  return 0;
}

- (BOOL)draggableViewShouldStartDragSession:(id)a3
{
  void *v3;
  BOOL v4;

  -[QLItemViewController draggableView](self, "draggableView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_addDragInteractionIfNeeded
{
  void *v3;
  UIDragInteraction *v4;
  UIDragInteraction *dragInteraction;
  id v6;

  -[QLItemViewController draggableView](self, "draggableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !self->_dragInteraction)
  {
    v6 = v3;
    v4 = (UIDragInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA550]), "initWithDelegate:", self);
    dragInteraction = self->_dragInteraction;
    self->_dragInteraction = v4;

    objc_msgSend(v6, "addInteraction:", self->_dragInteraction);
    v3 = v6;
  }

}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!-[QLItemViewController draggableViewShouldStartDragSession:](self, "draggableViewShouldStartDragSession:", a4))
    return MEMORY[0x1E0C9AA60];
  -[QLItemViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editedFileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "path"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "fileExistsAtPath:", v9),
        v9,
        v8,
        v10))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithContentsOfURL:", v7);
  }
  else
  {
    -[QLItemViewController context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "item");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v15, "newItemProvider");

  }
  -[QLItemViewController context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "previewTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSuggestedName:", v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA558]), "initWithItemProvider:", v11);
  v20[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  void *v5;
  int64_t v6;

  -[QLItemViewController delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dragDataOwnerForPreviewItemViewController:", self);

  return v6;
}

- (void)savePreviewEditedCopyWithCompletionHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)editedCopyToSaveChangesWithOutputType:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  QLItemViewController *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[QLItemViewController context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLItemViewController saveEditsQueue](self, "saveEditsQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke;
  v14[3] = &unk_1E9EFC7A8;
  v15 = v9;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v11 = v6;
  v12 = v7;
  v13 = v9;
  dispatch_async(v10, v14);

}

void __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    return;
  }
  objc_msgSend(v2, "editedCopy");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_10;
  v4 = (void *)v3;
  objc_msgSend(*(id *)(a1 + 32), "editedCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containerStillExists") & 1) == 0)
  {

    goto LABEL_10;
  }
  v6 = (void *)MEMORY[0x1E0CEC3F8];
  objc_msgSend(*(id *)(a1 + 32), "editedCopy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outputURLContentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "typeWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 40));

  if (!v10)
  {
LABEL_10:
    v16 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke_2;
    v20[3] = &unk_1E9EFC780;
    v20[4] = *(_QWORD *)(a1 + 48);
    v21 = v16;
    v22 = *(id *)(a1 + 40);
    v23 = *(id *)(a1 + 56);
    objc_msgSend(v21, "prepareSaveURL:", v20);

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "editedCopy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "containerURL");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(*(id *)(a1 + 32), "shouldCreateTemporaryDirectoryInHost"))
  {
    v17 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "editedCopy");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v17 + 16))(v17, v18, 0);

    goto LABEL_12;
  }
  v12 = objc_msgSend(v19, "startAccessingSecurityScopedResource");
  v13 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "editedCopy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v14, 0);

  v15 = v19;
  if (v12)
  {
    objc_msgSend(v19, "stopAccessingSecurityScopedResource");
LABEL_12:
    v15 = v19;
  }

}

void __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke_2(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(a1[4], "saveEditsQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke_3;
  v5[3] = &unk_1E9EFC780;
  v3 = a1[5];
  v4 = a1[4];
  v6 = v3;
  v7 = v4;
  v8 = a1[6];
  v9 = a1[7];
  dispatch_async(v2, v5);

}

void __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke_3(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldCreateTemporaryDirectoryInHost");
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke_4;
    v6[3] = &unk_1E9EFC758;
    v5 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = v5;
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v4, "previewItemViewController:requestsTemporaryEditDirectoryWithCompletionHandler:", v7, v6);

  }
  else
  {
    objc_msgSend(v3, "createEditedCopyForItem:outputType:directoryURL:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
  }
}

void __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "saveEditsQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke_5;
  block[3] = &unk_1E9EFC730;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v11 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(v4, block);

}

void __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "url");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createEditedCopyForItem:outputType:directoryURL:completionHandler:", v3, v4, v5, *(_QWORD *)(a1 + 64));

}

- (void)createEditedCopyForItem:(id)a3 outputType:(id)a4 directoryURL:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *, _QWORD);
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _copyfile_state *v21;
  id v22;
  const char *v23;
  void *v24;
  QLPreviewItemEditedCopy *v25;
  QLPreviewItemEditedCopy *v26;
  NSObject **v27;
  NSObject *v28;
  uint8_t v29[16];
  id v30;
  id v31;

  v9 = a3;
  v10 = a5;
  v11 = (void (**)(id, void *, _QWORD))a6;
  v12 = v10;
  v13 = a4;
  v14 = objc_msgSend(v9, "shouldCreateTemporaryDirectoryInHost");
  objc_msgSend(v9, "saveURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99E98];
  if (!v15)
  {
    objc_msgSend(v9, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_QLTemporaryFileURLWithType:uuid:", v13, v24);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    v20 = v12;
    if (!v19)
      goto LABEL_8;
LABEL_6:
    if (v20)
    {
      v25 = -[QLPreviewItemEditedCopy initWithEditedCopyURL:containerTemporaryURL:temporaryDirectoryCreatedInHost:]([QLPreviewItemEditedCopy alloc], "initWithEditedCopyURL:containerTemporaryURL:temporaryDirectoryCreatedInHost:", v19, v20, v14);
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  objc_msgSend(v9, "saveURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v12;
  v31 = 0;
  objc_msgSend(v9, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_QLTemporaryFileURLWithType:forOriginalFileAtURL:temporaryFileURL:temporaryDirectoryURL:fallbackUUID:", v13, v17, &v31, &v30, v18);

  v19 = v31;
  v20 = v30;

  if (!v19)
    goto LABEL_11;
  *(_DWORD *)v29 = 2;
  v21 = copyfile_state_alloc();
  copyfile_state_set(v21, 0x100u, v29);
  objc_msgSend(v9, "saveURL", *(_QWORD *)v29);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = (const char *)objc_msgSend(v22, "fileSystemRepresentation");
  v19 = objc_retainAutorelease(v19);
  copyfile(v23, (const char *)objc_msgSend(v19, "fileSystemRepresentation"), v21, 4u);

  copyfile_state_free(v21);
  if (v19)
    goto LABEL_6;
LABEL_8:
  if (v19)
  {
    v25 = -[QLPreviewItemEditedCopy initWithEditedCopyURL:]([QLPreviewItemEditedCopy alloc], "initWithEditedCopyURL:", v19);
LABEL_10:
    v26 = v25;
    if (v25)
      goto LABEL_16;
  }
LABEL_11:
  v27 = (NSObject **)MEMORY[0x1E0D83678];
  v28 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v28 = *v27;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_1D936E000, v28, OS_LOG_TYPE_ERROR, "Could not create QLPreviewItemEditedCopy because could not generate a URL to save the file. #AnyItemViewController", v29, 2u);
  }
  v26 = 0;
LABEL_16:
  objc_msgSend(v9, "setEditedCopy:", v26);
  if ((_DWORD)v14)
    LODWORD(v14) = objc_msgSend(v20, "startAccessingSecurityScopedResource");
  if (v11)
    v11[2](v11, v26, 0);
  if ((_DWORD)v14)
    objc_msgSend(v20, "stopAccessingSecurityScopedResource");

}

- (void)showSaveEditsProgressIndicatorAfterDelay
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__QLItemViewController_showSaveEditsProgressIndicatorAfterDelay__block_invoke;
  v2[3] = &unk_1E9EFC370;
  v2[4] = self;
  QLRunInMainThread(v2);
}

uint64_t __64__QLItemViewController_showSaveEditsProgressIndicatorAfterDelay__block_invoke(uint64_t a1, double a2)
{
  NSObject **v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t v21[16];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056))
  {
    v3 = (NSObject **)MEMORY[0x1E0D83678];
    v4 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1D936E000, v4, OS_LOG_TYPE_FAULT, "_saveEditProgressView should be nil when showSaveEditsProgressIndicatorAfterDelay is called. #Media", v21, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "hideSaveEditProgressIndicator");
  }
  gotLoadHelper_x8__OBJC_CLASS___PUProgressIndicatorView(a2);
  v6 = objc_msgSend(objc_alloc(*(Class *)(v5 + 528)), "initWithStyle:", 0);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 1056);
  *(_QWORD *)(v7 + 1056) = v6;

  objc_msgSend(*(id *)(a1 + 32), "editProgressIndicatorMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setLocalizedMessage:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setShowsBackground:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setDeterminate:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056));

  objc_msgSend(*(id *)(a1 + 32), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(*(id *)(a1 + 32), "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 9, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056), 9, 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addConstraint:", v14);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(*(id *)(a1 + 32), "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 10, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056), 10, 1.0, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addConstraint:", v18);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bringSubviewToFront:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056));

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "beginShowingProgressWithDelay:animated:", 1, 0.6);
}

- (void)hideSaveEditProgressIndicator
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __53__QLItemViewController_hideSaveEditProgressIndicator__block_invoke;
  v2[3] = &unk_1E9EFC370;
  v2[4] = self;
  QLRunInMainThread(v2);
}

void __53__QLItemViewController_hideSaveEditProgressIndicator__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1056);
  *(_QWORD *)(v2 + 1056) = 0;

}

- (id)editProgressIndicatorMessage
{
  return QLLocalizedString(CFSTR("Saving Changes"));
}

- (OS_dispatch_queue)saveEditsQueue
{
  QLItemViewController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *saveEditsQueue;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_saveEditsQueue)
  {
    v3 = dispatch_queue_create("com.apple.quicklook.editing.saveEditsQueue", 0);
    saveEditsQueue = v2->_saveEditsQueue;
    v2->_saveEditsQueue = (OS_dispatch_queue *)v3;

  }
  objc_sync_exit(v2);

  return v2->_saveEditsQueue;
}

- (void)didStartSavingEdits
{
  _QWORD v2[5];

  self->_isSavingEdits = 1;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__QLItemViewController_didStartSavingEdits__block_invoke;
  v2[3] = &unk_1E9EFC370;
  v2[4] = self;
  QLRunInMainThread(v2);
}

uint64_t __43__QLItemViewController_didStartSavingEdits__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateInterfaceForSavingEdits");
}

- (void)didFinishSavingEdits
{
  _QWORD v2[5];

  self->_isSavingEdits = 0;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__QLItemViewController_didFinishSavingEdits__block_invoke;
  v2[3] = &unk_1E9EFC370;
  v2[4] = self;
  QLRunInMainThread(v2);
}

uint64_t __44__QLItemViewController_didFinishSavingEdits__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateInterfaceAfterSavingEdits");
}

- (void)updateInterfaceForSavingEdits
{
  id v2;

  -[QLItemViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);

}

- (void)updateInterfaceAfterSavingEdits
{
  id v2;

  -[QLItemViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)QLItemViewController;
  -[QLItemViewController description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLItemViewController additionalItemViewControllerDescription](self, "additionalItemViewControllerDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {\n%@\n}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)additionalItemViewControllerDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[QLItemViewController contents](self, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("\tContents: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (QLPreviewItemViewControllerDelegate)delegate
{
  return (QLPreviewItemViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void)setDragInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_dragInteraction, a3);
}

- (BOOL)didAppearOnce
{
  return self->_didAppearOnce;
}

- (void)setDidAppearOnce:(BOOL)a3
{
  self->_didAppearOnce = a3;
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void)setIsLoaded:(BOOL)a3
{
  self->_isLoaded = a3;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (BOOL)loadingFailed
{
  return self->_loadingFailed;
}

- (void)setLoadingFailed:(BOOL)a3
{
  self->_loadingFailed = a3;
}

- (id)contents
{
  return objc_getProperty(self, a2, 1024, 1);
}

- (void)setContents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (QLPreviewContext)context
{
  return (QLPreviewContext *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (QLAppearance)appearance
{
  return self->_appearance;
}

- (QLItemViewControllerPresentingDelegate)presentingDelegate
{
  return (QLItemViewControllerPresentingDelegate *)objc_loadWeakRetained((id *)&self->_presentingDelegate);
}

- (void)setPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentingDelegate, a3);
}

- (PUProgressIndicatorView)saveEditProgressView
{
  return self->_saveEditProgressView;
}

- (void)setSaveEditProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_saveEditProgressView, a3);
}

- (void)setSaveEditsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_saveEditsQueue, a3);
}

- (BOOL)isSavingEdits
{
  return self->_isSavingEdits;
}

- (void)setIsSavingEdits:(BOOL)a3
{
  self->_isSavingEdits = a3;
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrame.origin.x;
  y = self->_contentFrame.origin.y;
  width = self->_contentFrame.size.width;
  height = self->_contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveEditsQueue, 0);
  objc_storeStrong((id *)&self->_saveEditProgressView, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_contents, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 0;
}

@end
