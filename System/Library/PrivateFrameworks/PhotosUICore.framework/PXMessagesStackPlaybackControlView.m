@implementation PXMessagesStackPlaybackControlView

- (PXMessagesStackPlaybackControlView)initWithFrame:(CGRect)a3
{
  PXMessagesStackPlaybackControlView *v3;
  _PXMessagesStackPlayButton *v4;
  _PXMessagesStackPlayButton *v5;
  _PXMessagesStackPlayButton *button;
  _PXMessagesStackPlayButton *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXMessagesStackPlaybackControlView;
  v3 = -[PXMessagesStackPlaybackControlView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [_PXMessagesStackPlayButton alloc];
    v5 = -[_PXMessagesStackPlayButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[_PXMessagesStackPlayButton setHidden:](v5, "setHidden:", 1);
    button = v3->_button;
    v3->_button = v5;
    v7 = v5;

    -[_PXMessagesStackPlayButton addTarget:action:forControlEvents:](v3->_button, "addTarget:action:forControlEvents:", v3, sel__handleButton_, 64);
    -[PXMessagesStackPlaybackControlView addSubview:](v3, "addSubview:", v7);

    v3->_itemIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (BOOL)_shouldPauseOnTap
{
  BOOL v3;
  void *v4;

  if (-[PXMessagesStackPlaybackControlView _wantsButton](self, "_wantsButton"))
    return 0;
  -[PXMessagesStackPlaybackControlView videoController](self, "videoController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "desiredPlayState") == 1;

  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  char v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PXMessagesStackPlaybackControlView;
  if (-[PXMessagesStackPlaybackControlView pointInside:withEvent:](&v10, sel_pointInside_withEvent_, v7, x, y))
  {
    if (-[PXMessagesStackPlaybackControlView _shouldPauseOnTap](self, "_shouldPauseOnTap"))
    {
      v8 = 1;
    }
    else
    {
      -[_PXMessagesStackPlayButton convertPoint:fromView:](self->_button, "convertPoint:fromView:", self, x, y);
      v8 = -[_PXMessagesStackPlayButton pointInside:withEvent:](self->_button, "pointInside:withEvent:", v7);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)handleTapAtPoint:(CGPoint)a3
{
  _PXMessagesStackPlayButton *v4;
  _PXMessagesStackPlayButton *button;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  uint8_t v10[16];

  -[PXMessagesStackPlaybackControlView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  v4 = (_PXMessagesStackPlayButton *)objc_claimAutoreleasedReturnValue();
  button = self->_button;

  if (v4 == button)
  {
    -[PXMessagesStackPlaybackControlView _handleButton:](self, "_handleButton:", self->_button);
LABEL_7:
    LOBYTE(v6) = 1;
    return v6;
  }
  v6 = -[PXMessagesStackPlaybackControlView _shouldPauseOnTap](self, "_shouldPauseOnTap");
  if (v6)
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "[Stack Playback] Attempting to pause video playback due to tap on playing item", v10, 2u);
    }

    -[PXMessagesStackPlaybackControlView videoController](self, "videoController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performChanges:", &__block_literal_global_241186);

    goto LABEL_7;
  }
  return v6;
}

- (void)setViewModel:(id)a3
{
  PXMessagesStackPlaybackControlViewModel *v5;
  PXMessagesStackPlaybackControlViewModel *viewModel;
  PXMessagesStackPlaybackControlViewModel *v7;

  v5 = (PXMessagesStackPlaybackControlViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    v7 = v5;
    -[PXMessagesStackPlaybackControlViewModel unregisterChangeObserver:context:](viewModel, "unregisterChangeObserver:context:", self, ViewModelObservationContext_241172);
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[PXMessagesStackPlaybackControlViewModel registerChangeObserver:context:](self->_viewModel, "registerChangeObserver:context:", self, ViewModelObservationContext_241172);
    v5 = v7;
  }

}

- (void)setVideoController:(id)a3
{
  PXGDisplayAssetVideoPresentationController *v5;
  PXGDisplayAssetVideoPresentationController *videoController;
  PXGDisplayAssetVideoPresentationController *v7;

  v5 = (PXGDisplayAssetVideoPresentationController *)a3;
  videoController = self->_videoController;
  if (videoController != v5)
  {
    v7 = v5;
    -[PXGDisplayAssetVideoPresentationController unregisterChangeObserver:context:](videoController, "unregisterChangeObserver:context:", self, VideoControllerObservationContext);
    objc_storeStrong((id *)&self->_videoController, a3);
    -[PXGDisplayAssetVideoPresentationController registerChangeObserver:context:](self->_videoController, "registerChangeObserver:context:", self, VideoControllerObservationContext);
    v5 = v7;
  }

}

- (BOOL)_wantsButton
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t itemIndex;
  unint64_t v8;
  int v9;

  -[PXMessagesStackPlaybackControlView videoController](self, "videoController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "desiredPlayState") == 1)
    v4 = objc_msgSend(v3, "isAtEnd");
  else
    v4 = 1;
  -[PXMessagesStackPlaybackControlView viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentItem");
  itemIndex = self->_itemIndex;
  v8 = v6 - itemIndex;
  if (v6 - itemIndex < 0)
    v8 = itemIndex - v6;
  if (!v4)
    goto LABEL_11;
  if (v6 != itemIndex)
  {
    if (v8 <= 1)
    {
      v9 = objc_msgSend(v5, "isSettled") ^ 1;
      goto LABEL_12;
    }
LABEL_11:
    LOBYTE(v9) = 0;
    goto LABEL_12;
  }
  LOBYTE(v9) = 1;
LABEL_12:

  return v9;
}

- (void)_updateButtonVisibility
{
  _BOOL8 v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t itemIndex;
  _PXMessagesStackPlayButton *button;
  void *v9;
  _QWORD v10[5];

  v3 = -[PXMessagesStackPlaybackControlView _wantsButton](self, "_wantsButton");
  -[PXMessagesStackPlaybackControlView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v3);
  v4 = -[_PXMessagesStackPlayButton isHidden](self->_button, "isHidden");
  if (v3)
  {
    if (v4)
    {
      -[_PXMessagesStackPlayButton setHidden:](self->_button, "setHidden:", 0);
      -[PXMessagesStackPlaybackControlView viewModel](self, "viewModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "currentItem");
      itemIndex = self->_itemIndex;

      button = self->_button;
      if (v6 == itemIndex)
      {
        -[_PXMessagesStackPlayButton setAlpha:](button, "setAlpha:", 0.0);
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __61__PXMessagesStackPlaybackControlView__updateButtonVisibility__block_invoke;
        v10[3] = &unk_1E5149198;
        v10[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v10, 0.3);
      }
      else
      {
        -[_PXMessagesStackPlayButton setAlpha:](button, "setAlpha:", 1.0);
      }
    }
  }
  else if ((v4 & 1) == 0)
  {
    -[_PXMessagesStackPlayButton layer](self->_button, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllAnimations");

    -[_PXMessagesStackPlayButton setHidden:](self->_button, "setHidden:", 1);
  }
}

- (void)_handleButton:(id)a3
{
  void *v4;
  uint64_t v5;
  int64_t itemIndex;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  char v14;
  uint8_t buf[16];

  -[PXMessagesStackPlaybackControlView viewModel](self, "viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentItem");
  itemIndex = self->_itemIndex;

  if (v5 == itemIndex)
  {
    -[PXMessagesStackPlaybackControlView videoController](self, "videoController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isAtEnd");

    if ((v8 & 1) != 0
      || (-[PXMessagesStackPlaybackControlView videoController](self, "videoController"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "desiredPlayState"),
          v9,
          v10 != 1))
    {
      PLUIGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "[Stack Playback] Attempting to start video playback due to play button tap", buf, 2u);
      }

    }
    -[PXMessagesStackPlaybackControlView videoController](self, "videoController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__PXMessagesStackPlaybackControlView__handleButton___block_invoke;
    v13[3] = &__block_descriptor_33_e61_v16__0___PXGMutableDisplayAssetVideoPresentationController__8l;
    v14 = v8;
    objc_msgSend(v12, "performChanges:", v13);

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackPlaybackControlView;
  -[PXMessagesStackPlaybackControlView layoutSubviews](&v3, sel_layoutSubviews);
  -[PXMessagesStackPlaybackControlView bounds](self, "bounds");
  PXRectGetCenter();
  PXRectWithCenterAndSize();
  -[_PXMessagesStackPlayButton setFrame:](self->_button, "setFrame:");
}

- (void)setUserData:(id)a3
{
  id v4;
  PXMessagesStackPlaybackControlUserData *v5;
  PXMessagesStackPlaybackControlUserData *userData;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  if (self->_userData != a3)
  {
    v4 = a3;
    v5 = (PXMessagesStackPlaybackControlUserData *)objc_msgSend(v4, "copy");
    userData = self->_userData;
    self->_userData = v5;

    objc_msgSend(v4, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMessagesStackPlaybackControlView setViewModel:](self, "setViewModel:", v7);

    objc_msgSend(v4, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "videoController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMessagesStackPlaybackControlView setVideoController:](self, "setVideoController:", v9);

    v10 = objc_msgSend(v4, "itemIndex");
    self->_itemIndex = v10;
    -[PXMessagesStackPlaybackControlView _updateButtonVisibility](self, "_updateButtonVisibility");
  }
}

- (void)becomeReusable
{
  void *v3;

  -[PXMessagesStackPlaybackControlView setViewModel:](self, "setViewModel:", 0);
  -[PXMessagesStackPlaybackControlView setVideoController:](self, "setVideoController:", 0);
  self->_itemIndex = 0x7FFFFFFFFFFFFFFFLL;
  -[_PXMessagesStackPlayButton layer](self->_button, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  -[_PXMessagesStackPlayButton setHidden:](self->_button, "setHidden:", 1);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if ((void *)ViewModelObservationContext_241172 == a5)
  {
    if ((v6 & 4) == 0)
    {
      if ((v6 & 7) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
    -[PXMessagesStackPlaybackControlView viewModel](self, "viewModel");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject videoController](v10, "videoController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMessagesStackPlaybackControlView setVideoController:](self, "setVideoController:", v17);

LABEL_12:
LABEL_13:
    -[PXMessagesStackPlaybackControlView _updateButtonVisibility](self, "_updateButtonVisibility");
    goto LABEL_14;
  }
  if ((void *)VideoControllerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackPlaybackControlView.m"), 249, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 0x206) != 0)
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[PXMessagesStackPlaybackControlView videoController](self, "videoController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "actualPlayState");
      -[PXMessagesStackPlaybackControlView videoController](self, "videoController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isAtEnd");
      v15 = CFSTR("NO");
      if (v14)
        v15 = CFSTR("YES");
      v16 = v15;
      v19 = 134218242;
      v20 = v12;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "[Stack Playback] Updated play state: %ld isAtEnd: %@", (uint8_t *)&v19, 0x16u);

    }
    goto LABEL_12;
  }
LABEL_14:

}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->clippingRect.origin.x;
  y = self->clippingRect.origin.y;
  width = self->clippingRect.size.width;
  height = self->clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->clippingRect = a3;
}

- (PXMessagesStackPlaybackControlUserData)userData
{
  return self->_userData;
}

- (PXMessagesStackPlaybackControlViewModel)viewModel
{
  return self->_viewModel;
}

- (PXGDisplayAssetVideoPresentationController)videoController
{
  return self->_videoController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoController, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

void __52__PXMessagesStackPlaybackControlView__handleButton___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(v3, "seekToBeginning");
    v3 = v4;
  }
  objc_msgSend(v3, "setDesiredPlayState:", 1);

}

uint64_t __61__PXMessagesStackPlaybackControlView__updateButtonVisibility__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
}

uint64_t __55__PXMessagesStackPlaybackControlView_handleTapAtPoint___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDesiredPlayState:", 0);
}

@end
