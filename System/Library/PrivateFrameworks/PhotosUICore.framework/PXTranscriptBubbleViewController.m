@implementation PXTranscriptBubbleViewController

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  _QWORD block[7];
  CGSize result;

  -[PXTranscriptBubbleViewController _contentViewSizeThatFits:](self, "_contentViewSizeThatFits:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  self->_lastRequestedSize.width = v4;
  self->_lastRequestedSize.height = v6;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PXTranscriptBubbleViewController_contentSizeThatFits___block_invoke;
  block[3] = &unk_1E5149060;
  *(CGFloat *)&block[5] = v4;
  *(CGFloat *)&block[6] = v6;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)_contentViewSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  __int16 v17[8];
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PXTranscriptBubbleViewController targetContentView](self, "targetContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXTranscriptBubbleViewController targetContentView](self, "targetContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = v7;
    objc_msgSend(v7, "sizeThatFits:", width, height);
    v11 = v10;
    v13 = v12;

    v14 = v11;
    v15 = v13;
    goto LABEL_9;
  }
  -[PXTranscriptBubbleViewController contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PXTranscriptBubbleViewController contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  PLUIGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17[0] = 0;
    _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "Unexpected request for transcript bubble content size with no view", (uint8_t *)v17, 2u);
  }

  -[PXTranscriptBubbleViewController workaroundSizeForSize:](self, "workaroundSizeForSize:", width, height);
LABEL_9:
  result.height = v15;
  result.width = v14;
  return result;
}

- (BOOL)_requiresResizeForCurrentSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  _BOOL4 v10;
  _BOOL4 v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  int v17;
  const __CFString *v18;
  __int16 v19;
  PXTranscriptBubbleViewController *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;
  CGSize v26;
  CGSize v27;

  height = a3.height;
  width = a3.width;
  v25 = *MEMORY[0x1E0C80C00];
  -[PXTranscriptBubbleViewController _contentViewSizeThatFits:](self, "_contentViewSizeThatFits:");
  v7 = v6;
  v9 = v8;
  v10 = vabdd_f64(v8, height) > 10.0;
  v11 = vabdd_f64(v6, width) > 10.0 || v10;
  PLUIGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v11)
      v13 = CFSTR("Wants resize");
    else
      v13 = CFSTR("Skipping resize");
    v26.width = width;
    v26.height = height;
    NSStringFromCGSize(v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27.width = v7;
    v27.height = v9;
    NSStringFromCGSize(v27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138413058;
    v18 = v13;
    v19 = 2112;
    v20 = self;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "%@ for %@. Current size: %@. Target size: %@", (uint8_t *)&v17, 0x2Au);

  }
  return v11;
}

- (void)setTargetContentView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_targetContentView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_targetContentView, a3);
    -[PXTranscriptBubbleViewController _scheduleContentViewUpdate](self, "_scheduleContentViewUpdate");
    v5 = v6;
  }

}

- (void)transitionToContentView:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[PXTranscriptBubbleViewController targetContentView](self, "targetContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      PLUIGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "PXTranscriptBubbleViewController: attempting to transition to a new target view while waiting on a transition. This likely indicates a bug or will lead to visual glitches", buf, 2u);
      }

    }
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "PXTranscriptBubbleViewController: Transitioning to new content view", v10, 2u);
    }

    -[PXTranscriptBubbleViewController contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[PXTranscriptBubbleViewController setTargetContentView:](self, "setTargetContentView:", v4);
    }
    else
    {
      -[PXTranscriptBubbleViewController setContentView:](self, "setContentView:", v4);
      -[PXTranscriptBubbleViewController viewIfLoaded](self, "viewIfLoaded");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v4);

    }
  }

}

- (void)_scheduleContentViewUpdate
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD block[4];
  id v18[2];
  uint8_t buf[4];
  PXTranscriptBubbleViewController *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PXTranscriptBubbleViewController targetContentView](self, "targetContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXTranscriptBubbleViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;

    v9 = -[PXTranscriptBubbleViewController _requiresResizeForCurrentSize:](self, "_requiresResizeForCurrentSize:", v6, v8);
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v20 = self;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Requesting resize on content view change for %@", buf, 0xCu);
      }

      v12 = (void *)(self->_lastResizeRequestID + 1);
      self->_lastResizeRequestID = (int64_t)v12;
      -[PXTranscriptBubbleViewController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "requestResizeForBubble:", self);

      objc_initWeak((id *)buf, self);
      v14 = dispatch_time(0, 3000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__PXTranscriptBubbleViewController__scheduleContentViewUpdate__block_invoke;
      block[3] = &unk_1E51447A0;
      objc_copyWeak(v18, (id *)buf);
      v18[1] = v12;
      dispatch_after(v14, MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(v18);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v20 = self;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Skipping resize on content view change for %@", buf, 0xCu);
      }

      v15 = MEMORY[0x1E0C809B0];
      self->_lastRequestedSize.width = v6;
      self->_lastRequestedSize.height = v8;
      v16[0] = v15;
      v16[1] = 3221225472;
      v16[2] = __62__PXTranscriptBubbleViewController__scheduleContentViewUpdate__block_invoke_4;
      v16[3] = &unk_1E5149198;
      v16[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], v16);
    }
  }
}

- (void)_resizeTimeoutForRequestID:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  if (self->_lastResizeRequestID == a3)
  {
    -[PXTranscriptBubbleViewController targetContentView](self, "targetContentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      PLUIGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "PXTranscriptBubbleViewController: Never received size update after requestResize. Forcing UI update. UI may appear truncated", v6, 2u);
      }

      -[PXTranscriptBubbleViewController _switchToPendingTargetViewIfNecessary](self, "_switchToPendingTargetViewIfNecessary");
    }
  }
}

- (void)_switchToPendingTargetViewIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  -[PXTranscriptBubbleViewController targetContentView](self, "targetContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXTranscriptBubbleViewController contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTranscriptBubbleViewController setTargetContentView:](self, "setTargetContentView:", 0);
    objc_msgSend(v3, "setFrame:", 0.0, 0.0, self->_lastRequestedSize.width, self->_lastRequestedSize.height);
    objc_msgSend(v3, "setAlpha:", 0.0);
    -[PXTranscriptBubbleViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v3);

    self->_transitionInProgress = 1;
    v6 = (void *)MEMORY[0x1E0DC3F10];
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__PXTranscriptBubbleViewController__switchToPendingTargetViewIfNecessary__block_invoke;
    v12[3] = &unk_1E5148D08;
    v13 = v4;
    v14 = v3;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __73__PXTranscriptBubbleViewController__switchToPendingTargetViewIfNecessary__block_invoke_2;
    v9[3] = &unk_1E5142230;
    v9[4] = self;
    v10 = v14;
    v11 = v13;
    v8 = v13;
    objc_msgSend(v6, "animateWithDuration:animations:completion:", v12, v9, 0.8);

  }
}

- (void)viewWillLayoutSubviews
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
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXTranscriptBubbleViewController;
  -[PXTranscriptBubbleViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  if (!self->_transitionInProgress)
  {
    -[PXTranscriptBubbleViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[PXTranscriptBubbleViewController contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  _BOOL4 isReadyForDisplay;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  void *v12;
  _QWORD v13[5];
  BOOL v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXTranscriptBubbleViewController;
  -[PXTranscriptBubbleViewController viewDidLayoutSubviews](&v15, sel_viewDidLayoutSubviews);
  -[PXTranscriptBubbleViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    isReadyForDisplay = self->_isReadyForDisplay;

    if (!isReadyForDisplay)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");

      -[PXTranscriptBubbleViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      v8 = v7;
      v10 = v9;

      if ((PXSizeApproximatelyEqualToSize() & 1) == 0)
      {
        v11 = -[PXTranscriptBubbleViewController _requiresResizeForCurrentSize:](self, "_requiresResizeForCurrentSize:", v8, v10);
        v12 = (void *)*MEMORY[0x1E0DC4730];
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __57__PXTranscriptBubbleViewController_viewDidLayoutSubviews__block_invoke;
        v13[3] = &unk_1E5144398;
        v13[4] = self;
        v14 = v11;
        objc_msgSend(v12, "_performBlockAfterCATransactionCommits:", v13);
      }
    }
  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXTranscriptBubbleViewController;
  -[PXTranscriptBubbleViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PXTranscriptBubbleViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXTranscriptBubbleViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTranscriptBubbleViewController contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v5);

  }
}

- (PXTranscriptBubbleDelegate)delegate
{
  return (PXTranscriptBubbleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIView)targetContentView
{
  return self->_targetContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContentView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __57__PXTranscriptBubbleViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1000) = 1;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bubbleDidBecomeReadyForDisplay:", *(_QWORD *)(a1 + 32));

  if (*(_BYTE *)(a1 + 40))
  {
    PLUIGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "Requesting resize on initial display for %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PXTranscriptBubbleViewController_viewDidLayoutSubviews__block_invoke_9;
    block[3] = &unk_1E5149198;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __57__PXTranscriptBubbleViewController_viewDidLayoutSubviews__block_invoke_9(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestResizeForBubble:", *(_QWORD *)(a1 + 32));

}

uint64_t __73__PXTranscriptBubbleViewController__switchToPendingTargetViewIfNecessary__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

void __73__PXTranscriptBubbleViewController__switchToPendingTargetViewIfNecessary__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 968) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setContentView:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "PXTranscriptBubbleViewController %@: Transitioned to new contentView", (uint8_t *)&v4, 0xCu);
  }

}

void __62__PXTranscriptBubbleViewController__scheduleContentViewUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resizeTimeoutForRequestID:", *(_QWORD *)(a1 + 40));

}

uint64_t __62__PXTranscriptBubbleViewController__scheduleContentViewUpdate__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_switchToPendingTargetViewIfNecessary");
}

uint64_t __56__PXTranscriptBubbleViewController_contentSizeThatFits___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromCGSize(*(CGSize *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Provided Messages with new size %@. Updating content view", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_switchToPendingTargetViewIfNecessary");
}

@end
