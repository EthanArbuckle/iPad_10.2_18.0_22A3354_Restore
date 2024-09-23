@implementation PLPhotoTileCloudPlaceholderView

- (PLPhotoTileCloudPlaceholderView)initWithFrame:(CGRect)a3
{
  PLPhotoTileCloudPlaceholderView *v3;
  double v4;
  id v5;
  PLRoundProgressView *v6;
  double v7;
  double v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLPhotoTileCloudPlaceholderView;
  v3 = -[PLPhotoTileCloudPlaceholderView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v3->_lastViewPhaseChangeDate = v4;
    -[PLPhotoTileCloudPlaceholderView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[PLPhotoTileCloudPlaceholderView setBackgroundColor:](v3, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "clearColor"));
    v5 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v3->_loadingContainerView = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = [PLRoundProgressView alloc];
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v7 = 44.0;
    else
      v7 = 22.0;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v8 = 44.0;
    else
      v8 = 22.0;
    v9 = -[PLRoundProgressView initWithFrame:](v6, "initWithFrame:", 0.0, 0.0, v7, v8);
    v3->_loadingIndicatorView = (PLRoundProgressView *)v9;
    -[UIView addSubview:](v3->_loadingContainerView, "addSubview:", v9);
    -[PLPhotoTileCloudPlaceholderView addSubview:](v3, "addSubview:", v3->_loadingContainerView);
    -[PLPhotoTileCloudPlaceholderView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
    v3->_toolbarVisible = 1;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->_loadingErrorButton = 0;
  -[PLRoundProgressView stopProgressTimer](self->_loadingIndicatorView, "stopProgressTimer");

  self->_loadingIndicatorView = 0;
  self->_loadingContainerView = 0;
  v3.receiver = self;
  v3.super_class = (Class)PLPhotoTileCloudPlaceholderView;
  -[PLPhotoTileCloudPlaceholderView dealloc](&v3, sel_dealloc);
}

- (void)fadeOutSoonIfNeededAndRemoveFromSuperview:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = a3;
  self->_delegate = 0;
  -[PLRoundProgressView setProgress:](self->_loadingIndicatorView, "setProgress:", 1.0);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  if (v3)
  {
    v6 = v5 - self->_lastViewPhaseChangeDate;
    v7 = 0.3 - v6;
    v8 = v6 < 0.3;
    v9 = 0.0;
    if (v8)
      v9 = v7;
    v10[4] = self;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__PLPhotoTileCloudPlaceholderView_fadeOutSoonIfNeededAndRemoveFromSuperview___block_invoke;
    v11[3] = &unk_1E70B6370;
    v11[4] = self;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__PLPhotoTileCloudPlaceholderView_fadeOutSoonIfNeededAndRemoveFromSuperview___block_invoke_2;
    v10[3] = &unk_1E70B6398;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 2, v11, v10, 0.3, v9);
  }
  else
  {
    -[PLRoundProgressView stopProgressTimer](self->_loadingIndicatorView, "stopProgressTimer");
    -[PLPhotoTileCloudPlaceholderView removeFromSuperview](self, "removeFromSuperview");
  }
}

- (void)updateCloudDownloadProgress:(double)a3
{
  -[PLRoundProgressView setProgress:](self->_loadingIndicatorView, "setProgress:", a3);
}

- (void)showLoadingIndicatorWhenReady
{
  if (!self->_indicatorIsVisible)
  {
    self->_indicatorIsVisible = 1;
    -[PLPhotoTileCloudPlaceholderView showLoadingIndicator](self, "showLoadingIndicator");
  }
}

- (void)showLoadingIndicator
{
  _QWORD v2[5];
  _QWORD v3[5];

  if (self->_indicatorIsVisible && (self->_showingError || !self->_showingLoading))
  {
    self->_showingError = 0;
    self->_showingLoading = 1;
    v2[4] = self;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __55__PLPhotoTileCloudPlaceholderView_showLoadingIndicator__block_invoke;
    v3[3] = &unk_1E70B6370;
    v3[4] = self;
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __55__PLPhotoTileCloudPlaceholderView_showLoadingIndicator__block_invoke_2;
    v2[3] = &unk_1E70B6398;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v3, v2, 0.25, 1.0);
  }
}

- (void)showErrorIndicator
{
  BOOL *p_showingError;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  UIButton *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIButton *loadingErrorButton;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD v23[5];

  if (self->_indicatorIsVisible)
  {
    if (self->_loadingErrorButton)
    {
      p_showingError = &self->_showingError;
      if (self->_showingError && !self->_showingLoading)
        return;
    }
    else
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v5 = CFSTR("_iPad");
      else
        v5 = &stru_1E70B6A68;
      v6 = objc_msgSend(v4, "stringWithFormat:", CFSTR("Loading_Error%@.png"), v5);
      v7 = objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", v6, PLPhotoLibraryFrameworkBundle());
      v8 = (UIButton *)(id)objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
      self->_loadingErrorButton = v8;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v9 = 44.0;
      else
        v9 = 22.0;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v10 = 60.0;
      else
        v10 = 40.0;
      v11 = v9 - v10;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v12 = 44.0;
      else
        v12 = 22.0;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v13 = 60.0;
      else
        v13 = 40.0;
      v14 = v12 - v13;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v15 = 60.0;
      else
        v15 = 40.0;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v16 = 60.0;
      else
        v16 = 40.0;
      -[UIButton setFrame:](v8, "setFrame:", v11, v14, v15, v16);
      -[UIButton setImage:forState:](self->_loadingErrorButton, "setImage:forState:", v7, 0);
      loadingErrorButton = self->_loadingErrorButton;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v18 = 60.0;
      else
        v18 = 40.0;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v19 = 44.0;
      else
        v19 = 22.0;
      v20 = v18 - v19;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v21 = 60.0;
      else
        v21 = 40.0;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v22 = 44.0;
      else
        v22 = 22.0;
      -[UIButton setImageEdgeInsets:](loadingErrorButton, "setImageEdgeInsets:", v20, v21 - v22, 0.0, 0.0);
      -[UIButton addTarget:action:forControlEvents:](self->_loadingErrorButton, "addTarget:action:forControlEvents:", self, sel__retryDownload, 64);
      -[UIButton setAlpha:](self->_loadingErrorButton, "setAlpha:", 0.0);
      -[UIView addSubview:](self->_loadingContainerView, "addSubview:", self->_loadingErrorButton);
      p_showingError = &self->_showingError;
      self->_showingError = 0;
    }
    *p_showingError = 1;
    self->_showingLoading = 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __53__PLPhotoTileCloudPlaceholderView_showErrorIndicator__block_invoke;
    v23[3] = &unk_1E70B6370;
    v23[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v23, &__block_literal_global_1387, 0.25, 0.0);
  }
}

- (void)setToolbarVisible:(BOOL)a3
{
  if (self->_toolbarVisible != a3)
  {
    self->_toolbarVisible = a3;
    -[PLPhotoTileCloudPlaceholderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRetryDelegate:(id)a3
{
  self->_delegate = (PLPhotoTileCloudPlaceholderViewDelegate *)a3;
}

- (void)_retryDownload
{
  if (self->_delegate)
  {
    -[PLRoundProgressView resetProgress](self->_loadingIndicatorView, "resetProgress");
    -[PLPhotoTileCloudPlaceholderView showLoadingIndicator](self, "showLoadingIndicator");
    -[PLPhotoTileCloudPlaceholderViewDelegate retryDownload](self->_delegate, "retryDownload");
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  UIButton *loadingErrorButton;

  if (!self->_showingError)
    return 0;
  loadingErrorButton = self->_loadingErrorButton;
  -[UIButton convertPoint:fromView:](loadingErrorButton, "convertPoint:fromView:", self, a3.x, a3.y);
  return -[UIButton pointInside:withEvent:](loadingErrorButton, "pointInside:withEvent:", a4);
}

- (void)setImageRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_imageRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_imageRect = &self->_imageRect;
  if (!CGRectEqualToRect(self->_imageRect, a3))
  {
    p_imageRect->origin.x = x;
    p_imageRect->origin.y = y;
    p_imageRect->size.width = width;
    p_imageRect->size.height = height;
    -[PLPhotoTileCloudPlaceholderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v15;
  double v16;
  CGFloat v17;
  double v18;
  double height;
  double y;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;

  v34.receiver = self;
  v34.super_class = (Class)PLPhotoTileCloudPlaceholderView;
  -[PLPhotoTileCloudPlaceholderView layoutSubviews](&v34, sel_layoutSubviews);
  -[PLPhotoTileCloudPlaceholderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "statusBarOrientation");
  v12 = (void *)MEMORY[0x1E0CEAB20];
  v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL;
  if ((unint64_t)(v11 - 1) < 2 || v13 == 1)
    v15 = 0;
  else
    v15 = 2;
  objc_msgSend(v12, "defaultHeightForBarSize:", v15);
  v17 = 0.0;
  if (!self->_toolbarVisible)
    v16 = 0.0;
  v18 = v10 - v16;
  if (CGRectIsEmpty(self->_imageRect))
  {
    v17 = v6;
  }
  else
  {
    height = self->_imageRect.size.height;
    y = self->_imageRect.origin.y;
    if (self->_imageRect.size.width + self->_imageRect.origin.x < v8)
      v8 = self->_imageRect.size.width + self->_imageRect.origin.x;
    if (height + y < v18)
      v18 = height + y;
    v4 = 0.0;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v21 = 44.0;
  else
    v21 = 22.0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v22 = 44.0;
  else
    v22 = 22.0;
  v23 = 0;
  v24 = 0;
  v25 = v21;
  v26 = CGRectGetMaxX(*(CGRect *)(&v22 - 3)) + 8.0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v27 = 44.0;
  else
    v27 = 22.0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v28 = 44.0;
  else
    v28 = 22.0;
  v29 = 0;
  v30 = 0;
  v31 = v27;
  v32 = CGRectGetMaxY(*(CGRect *)(&v28 - 3)) + 8.0;
  v35.origin.x = v4;
  v35.origin.y = v17;
  v35.size.width = v8;
  v35.size.height = v18;
  v33 = CGRectGetMaxX(v35) - v26;
  v36.origin.x = v4;
  v36.origin.y = v17;
  v36.size.width = v8;
  v36.size.height = v18;
  -[UIView setFrame:](self->_loadingContainerView, "setFrame:", v33, CGRectGetMaxY(v36) - v32, v26, v32);
}

uint64_t __53__PLPhotoTileCloudPlaceholderView_showErrorIndicator__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "stopProgressTimer");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
}

uint64_t __55__PLPhotoTileCloudPlaceholderView_showLoadingIndicator__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "startProgressTimer");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
}

uint64_t __55__PLPhotoTileCloudPlaceholderView_showLoadingIndicator__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 488) = v3;
  return result;
}

uint64_t __77__PLPhotoTileCloudPlaceholderView_fadeOutSoonIfNeededAndRemoveFromSuperview___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __77__PLPhotoTileCloudPlaceholderView_fadeOutSoonIfNeededAndRemoveFromSuperview___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "stopProgressTimer");
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

@end
