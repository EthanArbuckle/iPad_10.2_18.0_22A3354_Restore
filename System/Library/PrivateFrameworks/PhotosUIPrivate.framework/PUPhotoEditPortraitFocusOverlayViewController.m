@implementation PUPhotoEditPortraitFocusOverlayViewController

- (PUPhotoEditPortraitFocusOverlayViewController)initWithMediaView:(id)a3 isHDR:(BOOL)a4 delegate:(id)a5
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  PUPhotoEditPortraitFocusOverlayViewController *v13;
  PUPhotoEditPortraitFocusOverlayViewController *v14;
  uint64_t v15;
  PXUIPortraitFocusView *portraitFocusView;
  void *v18;
  void *v19;
  objc_super v20;

  v6 = a4;
  v10 = a3;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditPortraitFocusOverlayViewController.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaView != nil"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditPortraitFocusOverlayViewController.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate != nil"));

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)PUPhotoEditPortraitFocusOverlayViewController;
  v13 = -[PUPhotoEditPortraitFocusOverlayViewController init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_mediaView, a3);
    objc_storeWeak((id *)&v14->_delegate, v12);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7BB70]), "initWithMediaView:isHDR:", v10, v6);
    portraitFocusView = v14->_portraitFocusView;
    v14->_portraitFocusView = (PXUIPortraitFocusView *)v15;

    -[PXUIPortraitFocusView setFocusViewDelegate:](v14->_portraitFocusView, "setFocusViewDelegate:", v14);
  }

  return v14;
}

- (void)loadView
{
  -[PUPhotoEditPortraitFocusOverlayViewController setView:](self, "setView:", self->_portraitFocusView);
}

- (void)viewDidLayoutSubviews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  const CGPath *v23;
  void *v24;
  void *v25;
  objc_super v26;
  CGRect v27;

  v26.receiver = self;
  v26.super_class = (Class)PUPhotoEditPortraitFocusOverlayViewController;
  -[PUPhotoEditPortraitFocusOverlayViewController viewDidLayoutSubviews](&v26, sel_viewDidLayoutSubviews);
  v3 = objc_alloc_init(MEMORY[0x1E0CD2840]);
  -[NUMediaView imageFrame](self->_mediaView, "imageFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PUPhotoEditPortraitFocusOverlayViewController parentViewController](self, "parentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUMediaView superview](self->_mediaView, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:fromView:", v14, v5, v7, v9, v11);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v27.origin.x = v16;
  v27.origin.y = v18;
  v27.size.width = v20;
  v27.size.height = v22;
  v23 = CGPathCreateWithRect(v27, 0);
  objc_msgSend(v3, "setPath:", v23);
  CGPathRelease(v23);
  -[PUPhotoEditPortraitFocusOverlayViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setMask:", v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[PXUIPortraitFocusView setDrawingEnabled:](self->_portraitFocusView, "setDrawingEnabled:", 0);
  v5.receiver = self;
  v5.super_class = (Class)PUPhotoEditPortraitFocusOverlayViewController;
  -[PUPhotoEditPortraitFocusOverlayViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)PUPhotoEditPortraitFocusOverlayViewController;
  v7 = a4;
  -[PUPhotoEditPortraitFocusOverlayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[PUPhotoEditPortraitFocusOverlayViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 0.0);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __100__PUPhotoEditPortraitFocusOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E58A7A08;
  v9[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v9);

}

- (BOOL)_isValidRect:(CGRect)a3
{
  BOOL v3;
  BOOL v4;

  v3 = 0;
  if (fabs(a3.origin.x) != INFINITY)
    v3 = fabs(a3.origin.y) != INFINITY;
  v4 = 0;
  if (fabs(a3.size.width) != INFINITY)
  {
    v4 = fabs(a3.size.height) != INFINITY;
    if (a3.size.width < 0.0)
      v4 = 0;
    if (a3.size.height < 0.0)
      v4 = 0;
  }
  return v3 && v4;
}

- (void)focusPointChanged:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int8x16_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  float64x2_t v27;
  float64x2_t v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  float64x2_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  double v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;
  CGPoint v45;
  CGSize v46;
  CGPoint v47;
  CGPoint v48;
  CGSize v49;

  y = a3.y;
  x = a3.x;
  v44 = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditPortraitFocusOverlayViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toolControllerOriginalImageSize:", 0);
  v8 = v7;
  v10 = v9;

  v11 = v8 / v10;
  v12 = fabs(v8 / v10);
  if ((unint64_t)(*(_QWORD *)&v12 - 0x10000000000000) >> 53 >= 0x3FF
    && (unint64_t)(*(_QWORD *)&v12 - 1) >= 0xFFFFFFFFFFFFFLL)
  {
    v49.width = v8;
    v49.height = v10;
    NSStringFromCGSize(v49);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    _PFAssertContinueHandler();

  }
  else
  {
    -[PUPhotoEditPortraitFocusOverlayViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditPortraitFocusOverlayViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "toolController:originalPointFromViewPoint:view:", 0, v15, x, y);
    v17 = v16;
    v19 = v18;

    v20 = v19 / v10;
    *(double *)v21.i64 = v17 / v8;
    *(double *)&v21.i64[1] = v19 / v10;
    if (v17 / v8 < 0.0 || v17 / v8 > 1.0 || v20 < 0.0 || v20 > 1.0)
    {
      v33 = (float64x2_t)v21;
      PLPhotoEditGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v45.x = x;
        v45.y = y;
        NSStringFromCGPoint(v45);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v46.width = v8;
        v46.height = v10;
        NSStringFromCGSize(v46);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v47.x = v17;
        v47.y = v19;
        NSStringFromCGPoint(v47);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v48.x = v17 / v8;
        v48.y = v19 / v10;
        NSStringFromCGPoint(v48);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v35 = v23;
        v36 = 2112;
        v37 = v24;
        v38 = 2048;
        v39 = v8 / v10;
        v40 = 2112;
        v41 = v25;
        v42 = 2112;
        v43 = v26;
        _os_log_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_ERROR, "Portrait focus rect normalized point outside of bounds: focusPoint: %@, originalSize: %@, aspect: %0.2f, originalPoint: %@, normalizedPoint: %@", buf, 0x34u);

      }
      v27 = vaddq_f64(*MEMORY[0x1E0D71110], *(float64x2_t *)(MEMORY[0x1E0D71110] + 16));
      v28 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v27, v33), (int8x16_t)v33, (int8x16_t)v27);
      v21 = vbslq_s8((int8x16_t)vcgtq_f64(v28, *MEMORY[0x1E0D71110]), (int8x16_t)v28, *MEMORY[0x1E0D71110]);
    }
    v29 = *(double *)v21.i64 + -0.1 / v11;
    v30 = *(double *)&v21.i64[1] + -0.1;
    -[PUPhotoEditPortraitFocusOverlayViewController portraitFocusDelegate](self, "portraitFocusDelegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "focusRectChanged:", v29, v30, 0.2 / v11, 0.2);

    -[PXUIPortraitFocusView animateNextRender](self->_portraitFocusView, "animateNextRender");
    -[PXUIPortraitFocusView setNeedsDisplay](self->_portraitFocusView, "setNeedsDisplay");
  }
}

- (CGRect)currentFocusRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double MidX;
  CGFloat v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  -[PUPhotoEditPortraitFocusOverlayViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toolControllerOriginalImageSize:", 0);
  v5 = v4;
  v7 = v6;

  -[PUPhotoEditPortraitFocusOverlayViewController portraitFocusDelegate](self, "portraitFocusDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentFocusRect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v33.origin.x = v10;
  v33.origin.y = v12;
  v33.size.width = v14;
  v33.size.height = v16;
  MidX = CGRectGetMidX(v33);
  v34.origin.x = v10;
  v34.origin.y = v12;
  v34.size.width = v14;
  v34.size.height = v16;
  v18 = CGRectGetMidY(v34) * v7;
  -[PUPhotoEditPortraitFocusOverlayViewController delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditPortraitFocusOverlayViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "toolController:viewPointFromOriginalPoint:view:", 0, v20, MidX * v5, v18);
  v22 = v21;
  v24 = v23;

  v25 = v22 + -37.5;
  v26 = v24 + -37.5;
  *(double *)&v27 = 75.0;
  if (-[PUPhotoEditPortraitFocusOverlayViewController _isValidRect:](self, "_isValidRect:", v25, v26, 75.0, 75.0))
  {
    v28 = 75.0;
  }
  else
  {
    v35.origin.x = v25;
    v35.origin.y = v26;
    v35.size.width = 75.0;
    v35.size.height = 75.0;
    NSStringFromCGRect(v35);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    _PFAssertContinueHandler();

    v25 = *MEMORY[0x1E0C9D648];
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v27 = *(uint64_t *)(MEMORY[0x1E0C9D648] + 16);
    v28 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v29 = v25;
  v30 = v26;
  v31 = *(double *)&v27;
  result.size.height = v28;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)mediaViewIsReady
{
  id v3;

  if ((-[PXUIPortraitFocusView drawingEnabled](self->_portraitFocusView, "drawingEnabled") & 1) == 0)
  {
    -[PXUIPortraitFocusView setDrawingEnabled:](self->_portraitFocusView, "setDrawingEnabled:", 1);
    -[PUPhotoEditPortraitFocusOverlayViewController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsDisplay");

  }
}

- (PUPhotoEditToolControllerDelegate)delegate
{
  return (PUPhotoEditToolControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PUPhotoEditPortraitFocusDelegate)portraitFocusDelegate
{
  return (PUPhotoEditPortraitFocusDelegate *)objc_loadWeakRetained((id *)&self->_portraitFocusDelegate);
}

- (void)setPortraitFocusDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_portraitFocusDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_portraitFocusDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_portraitFocusView, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
}

void __100__PUPhotoEditPortraitFocusOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  v2 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PUPhotoEditPortraitFocusOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  block[3] = &unk_1E58ABD10;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
}

uint64_t __100__PUPhotoEditPortraitFocusOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsDisplay");

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __100__PUPhotoEditPortraitFocusOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v4[3] = &unk_1E58ABD10;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v4, 0.2);
}

void __100__PUPhotoEditPortraitFocusOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

@end
