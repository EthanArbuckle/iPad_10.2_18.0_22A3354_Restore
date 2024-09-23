@implementation PUVideoEditOverlayViewController

- (PUVideoEditOverlayViewController)initWithMediaView:(id)a3 cineController:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PUVideoEditOverlayViewController *v11;
  uint64_t v12;
  PXUISubjectTrackingView *trackingView;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUVideoEditOverlayViewController.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaView != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUVideoEditOverlayViewController.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cineController != nil"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)PUVideoEditOverlayViewController;
  v11 = -[PUVideoEditOverlayViewController init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7BB88]), "initWithMediaView:cineController:", v8, v10);
    trackingView = v11->_trackingView;
    v11->_trackingView = (PXUISubjectTrackingView *)v12;

    -[PXUISubjectTrackingView setDelegate:](v11->_trackingView, "setDelegate:", v11);
    objc_storeStrong((id *)&v11->_mediaView, a3);
  }

  return v11;
}

- (void)loadView
{
  -[PUVideoEditOverlayViewController setView:](self, "setView:", self->_trackingView);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[7];

  v37[6] = *MEMORY[0x1E0C80C00];
  -[PUVideoEditOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "toolbarShadowsEnabled");

  if (v7)
  {
    -[PUVideoEditOverlayViewController safeAreaMask](self, "safeAreaMask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sublayers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUVideoEditOverlayViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    objc_msgSend(v8, "setFrame:");

    objc_msgSend(v8, "bounds");
    objc_msgSend(v10, "setFrame:");
    -[PUVideoEditOverlayViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;

    v15 = v5 / v14;
    v37[0] = &unk_1E59BC4C0;
    v16 = 20.0 / v14;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v17;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15 + v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v18;
    v19 = 1.0 - v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19 - v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v20;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[4] = v21;
    v37[5] = &unk_1E59BC4D0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLocations:", v22);

    -[PXUISubjectTrackingView layer](self->_trackingView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMask:", v8);

LABEL_5:
LABEL_6:

    goto LABEL_7;
  }
  if (v5 > 0.0)
  {
    -[PUVideoEditOverlayViewController safeAreaMask](self, "safeAreaMask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUISubjectTrackingView bounds](self->_trackingView, "bounds");
    objc_msgSend(v8, "setFrame:");
    objc_msgSend(v8, "frame");
    v25 = v24;
    objc_msgSend(v8, "frame");
    v27 = v26 - v5;
    objc_msgSend(v8, "sublayers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFrame:", 0.0, v5, v25, v27);

    -[PXUISubjectTrackingView layer](self->_trackingView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMask:", v8);
    goto LABEL_5;
  }
  -[PXUISubjectTrackingView layer](self->_trackingView, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "mask");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[PXUISubjectTrackingView layer](self->_trackingView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMask:", 0);
    goto LABEL_6;
  }
LABEL_7:
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "debugTrackerMask");

  if (v31)
  {
    -[PUVideoEditOverlayViewController view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUVideoEditOverlayViewController safeAreaMask](self, "safeAreaMask");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSublayer:", v34);

  }
}

- (CALayer)safeAreaMask
{
  CALayer *safeAreaMask;
  CALayer *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  CALayer *v25;
  id v27;
  id v28;
  _QWORD v29[6];
  _QWORD v30[7];

  v30[6] = *MEMORY[0x1E0C80C00];
  safeAreaMask = self->_safeAreaMask;
  if (!safeAreaMask)
  {
    v4 = (CALayer *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v4, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "toolbarShadowsEnabled");

    if (v7)
    {
      v8 = (void *)objc_opt_new();
      +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "debugTrackerMask");

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v30[0] = objc_msgSend(v27, "CGColor");
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v30[1] = objc_msgSend(v11, "CGColor");
        objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v30[2] = objc_msgSend(v12, "CGColor");
        objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v30[3] = objc_msgSend(v13, "CGColor");
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v30[4] = objc_msgSend(v14, "CGColor");
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v30[5] = objc_msgSend(v15, "CGColor");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setColors:", v16);

        LODWORD(v17) = 0.5;
        -[CALayer setOpacity:](v4, "setOpacity:", v17);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v29[0] = objc_msgSend(v28, "CGColor");
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v29[1] = objc_msgSend(v19, "CGColor");
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v29[2] = objc_msgSend(v20, "CGColor");
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v29[3] = objc_msgSend(v21, "CGColor");
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v29[4] = objc_msgSend(v22, "CGColor");
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v29[5] = objc_msgSend(v23, "CGColor");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setColors:", v24);

      }
    }
    else
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v8, "setBackgroundColor:", objc_msgSend(v18, "CGColor"));

    }
    -[CALayer addSublayer:](v4, "addSublayer:", v8);

    v25 = self->_safeAreaMask;
    self->_safeAreaMask = v4;

    safeAreaMask = self->_safeAreaMask;
  }
  return safeAreaMask;
}

- (void)renderDidChange:(BOOL)a3
{
  -[PXUISubjectTrackingView renderDidChange:](self->_trackingView, "renderDidChange:", a3);
}

- (void)frameTimeDidChange
{
  -[PXUISubjectTrackingView setNeedsUpdateFrameTime](self->_trackingView, "setNeedsUpdateFrameTime");
  -[PXUISubjectTrackingView scriptDidUpdate](self->_trackingView, "scriptDidUpdate");
}

- (void)scriptDidUpdate
{
  -[PXUISubjectTrackingView scriptDidUpdate](self->_trackingView, "scriptDidUpdate");
}

- (BOOL)isHidden
{
  void *v2;
  char v3;

  -[PUVideoEditOverlayViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  -[PUVideoEditOverlayViewController setHidden:animated:](self, "setHidden:animated:", a3, 0);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  int v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  char v19;
  _QWORD v20[4];
  id v21;
  double v22;

  v4 = a4;
  v5 = a3;
  -[PUVideoEditOverlayViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHidden");
  v9 = -[PUVideoEditOverlayViewController disabledForCinematographyScriptLoad](self, "disabledForCinematographyScriptLoad") | v5;
  if (v8 != (_DWORD)v9)
  {
    if (v4)
    {
      objc_msgSend(v7, "setHidden:", 0);
      v10 = 1.0;
      if (v8)
        v11 = 0.0;
      else
        v11 = 1.0;
      objc_msgSend(v7, "setAlpha:", v11);
      if ((_DWORD)v9)
        v10 = 0.0;
      v12 = (void *)MEMORY[0x1E0DC3F10];
      v13 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __55__PUVideoEditOverlayViewController_setHidden_animated___block_invoke;
      v20[3] = &unk_1E58AACF0;
      v21 = v7;
      v22 = v10;
      v14 = v13;
      v15 = 3221225472;
      v16 = __55__PUVideoEditOverlayViewController_setHidden_animated___block_invoke_2;
      v17 = &unk_1E58A7A58;
      v18 = v21;
      v19 = v9;
      objc_msgSend(v12, "animateWithDuration:animations:completion:", v20, &v14, 0.2);

    }
    else
    {
      objc_msgSend(v7, "setAlpha:", 1.0);
      objc_msgSend(v7, "setHidden:", v9);
    }
  }
  -[PXUISubjectTrackingView setViewEnabled:](self->_trackingView, "setViewEnabled:", v9 ^ 1, v14, v15, v16, v17);

}

- (void)enableUIForCinematographyScriptLoad:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PUVideoEditOverlayViewController setDisabledForCinematographyScriptLoad:](self, "setDisabledForCinematographyScriptLoad:", !a3);
  -[PXUISubjectTrackingView enableUIForCinematographyScriptLoad:](self->_trackingView, "enableUIForCinematographyScriptLoad:", v3);
  -[PXUISubjectTrackingView setViewEnabled:](self->_trackingView, "setViewEnabled:", v3);
}

- (void)setNeedsUpdateTrackingFrame
{
  -[PXUISubjectTrackingView setNeedsUpdateFrame](self->_trackingView, "setNeedsUpdateFrame");
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unadjustedTimeForPlayerTime:(SEL)a3
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;
  CMTime rhs;
  CMTime v14;

  *retstr = *a4;
  -[PUVideoEditOverlayViewController compositionController](self, "compositionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trimAdjustmentController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PUVideoEditOverlayViewController overlayControllerDelegate](self, "overlayControllerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasTrimmedVideo");

    if (v10)
    {
      objc_msgSend(v8, "startTime");
      v12 = *a4;
      CMTimeAdd(&v14, (CMTime *)&v12, &rhs);
      *(CMTime *)retstr = v14;
    }
  }

  return result;
}

- (void)trackingWasEdited
{
  void *v2;
  __int128 v3;
  uint64_t v4;

  -[PUVideoEditOverlayViewController overlayControllerDelegate](self, "overlayControllerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CA2E18];
  v4 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  objc_msgSend(v2, "cinematographyWasEditedAtTime:", &v3);

}

- (void)trackingWasEditedAtTime:(id *)a3
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  -[PUVideoEditOverlayViewController overlayControllerDelegate](self, "overlayControllerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *a3;
  objc_msgSend(v4, "cinematographyWasEditedAtTime:", &v5);

}

- (id)compositionController
{
  void *v2;
  void *v3;

  -[PUVideoEditOverlayViewController overlayControllerDelegate](self, "overlayControllerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)composition
{
  void *v2;
  void *v3;
  void *v4;

  -[PUVideoEditOverlayViewController overlayControllerDelegate](self, "overlayControllerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "composition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)newTrackingViewWithFrame:(CGRect)a3 initialState:(int64_t)a4
{
  PUCinematicSubjectIndicator *v6;

  v6 = -[PUCinematicSubjectIndicator initWithFrame:]([PUCinematicSubjectIndicator alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PUVideoEditOverlayViewController _setState:forView:animated:](self, "_setState:forView:animated:", a4, v6, 0);
  return v6;
}

- (id)newFocusStatusBadge
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0D0D028]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setFillColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setContentColor:", v7);

  return v3;
}

- (CGRect)rectForFocusStateBadge:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  objc_msgSend(a3, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v5 = v4;
  v7 = v6;
  -[PUVideoEditOverlayViewController mediaView](self, "mediaView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = (v9 - v5) * 0.5;
  objc_msgSend(v8, "imageFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[PUVideoEditOverlayViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:toView:", v19, v12, v14, v16, v18);
  v21 = v20 + 9.0;

  -[PUVideoEditOverlayViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safeAreaInsets");
  v24 = v23 + 20.0;

  if (v21 < v24)
    v21 = v24;

  v25 = v10;
  v26 = v21;
  v27 = v5;
  v28 = v7;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)setTrackingInProgressTextForFocusStateBadge:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUVideoEditOverlayViewController.m"), 255, CFSTR("Unexpected focus state badge view class"));

  }
  PULocalizedString(CFSTR("PHOTOEDIT_CINEMATIC_TRACKING_IN_PROGRESS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setText:", v5);

}

- (void)setMessage:(id)a3 forFocusStateBadge:(id)a4
{
  objc_msgSend(a4, "_setText:", a3);
}

- (void)_setState:(int64_t)a3 forView:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a5;
  switch(a3)
  {
    case 1:
      v6 = 0;
      goto LABEL_7;
    case 2:
      v6 = 0;
      v7 = 1;
      break;
    case 3:
    case 4:
      v6 = 0;
      v7 = 3;
      break;
    case 5:
      v6 = 1;
LABEL_7:
      v7 = 2;
      break;
    default:
      v6 = 0;
      v7 = 0;
      break;
  }
  v8 = a4;
  objc_msgSend(v8, "setShape:animated:", v7, v5);
  objc_msgSend(v8, "setIsPulsing:", v6);

}

- (void)subjectFocusStateDidChange:(int64_t)a3 forBadge:(id)a4 focusedDisparity:(double)a5
{
  const __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  id v14;

  v14 = a4;
  v7 = CFSTR("UNKNOWN");
  if (a3 == 2)
    v7 = CFSTR("PHOTOEDIT_CINEMATIC_FOCUS_STATE_HARD");
  if (a3 == 4)
    v8 = CFSTR("PHOTOEDIT_CINEMATIC_FOCUS_STATE_FIXED");
  else
    v8 = (__CFString *)v7;
  PULocalizedString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(a3 - 3) <= 1 && a5 != 0.0)
  {
    PULocalizedString(CFSTR("PHOTOEDIT_CINEMATIC_FOCUS_STATE_FIXED_DISTANCE_FMT"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 1.0 / a5;
    v12 = v9;
    PUStringWithValidatedFormat();
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  objc_msgSend(v14, "_setText:", v9, v12, *(_QWORD *)&v13);

}

- (void)objectTrackingStartedAtTime:(id *)a3
{
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  -[PXUISubjectTrackingView setViewEnabled:](self->_trackingView, "setViewEnabled:", 0);
  -[PUVideoEditOverlayViewController overlayControllerDelegate](self, "overlayControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  objc_msgSend(v5, "objectTrackingStartedAtTime:", &v6);

}

- (void)trackedObjectWasUpdatedAtTime:(id *)a3 shouldStop:(BOOL *)a4
{
  void *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  -[PUVideoEditOverlayViewController overlayControllerDelegate](self, "overlayControllerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *a3;
  objc_msgSend(v6, "trackedObjectWasUpdatedAtTime:shouldStop:", &v7, a4);

}

- (void)objectTrackingFinishedWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PXUISubjectTrackingView setViewEnabled:](self->_trackingView, "setViewEnabled:", 1);
  -[PUVideoEditOverlayViewController overlayControllerDelegate](self, "overlayControllerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectTrackingFinishedWithSuccess:", v3);

}

- (void)interactionBegan
{
  id v2;

  -[PUVideoEditOverlayViewController overlayControllerDelegate](self, "overlayControllerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interactionBegan");

}

- (id)localizedStringForCinematicTrackingBadgeMessage:(int64_t)a3
{
  __CFString *v3;

  v3 = CFSTR("PHOTOEDIT_CINEMATIC_TRACKING_MESSAGE_ON");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return PULocalizedString(v3);
  else
    return PULocalizedString(CFSTR("PHOTOEDIT_CINEMATIC_TRACKING_MESSAGE_OFF"));
}

- (void)showTrackingInformationalString:(id)a3
{
  -[PXUISubjectTrackingView showTrackingInformationalString:](self->_trackingView, "showTrackingInformationalString:", a3);
}

- (PUVideoEditOverlayViewControllerDelegate)overlayControllerDelegate
{
  return (PUVideoEditOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_overlayControllerDelegate);
}

- (void)setOverlayControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_overlayControllerDelegate, a3);
}

- (PXUISubjectTrackingView)trackingView
{
  return self->_trackingView;
}

- (void)setTrackingView:(id)a3
{
  objc_storeStrong((id *)&self->_trackingView, a3);
}

- (NUMediaView)mediaView
{
  return self->_mediaView;
}

- (void)setMediaView:(id)a3
{
  objc_storeStrong((id *)&self->_mediaView, a3);
}

- (void)setSafeAreaMask:(id)a3
{
  objc_storeStrong((id *)&self->_safeAreaMask, a3);
}

- (BOOL)disabledForCinematographyScriptLoad
{
  return self->_disabledForCinematographyScriptLoad;
}

- (void)setDisabledForCinematographyScriptLoad:(BOOL)a3
{
  self->_disabledForCinematographyScriptLoad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safeAreaMask, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_trackingView, 0);
  objc_destroyWeak((id *)&self->_overlayControllerDelegate);
}

uint64_t __55__PUVideoEditOverlayViewController_setHidden_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __55__PUVideoEditOverlayViewController_setHidden_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", *(unsigned __int8 *)(a1 + 40));
}

@end
