@implementation SiriSharedUIPanDismissalGestureRecognizer

- (SiriSharedUIPanDismissalGestureRecognizer)initWithCoder:(id)a3
{
  return -[SiriSharedUIPanDismissalGestureRecognizer initWithDismissalDelegate:dismissalStyle:](self, "initWithDismissalDelegate:dismissalStyle:", 0, 0);
}

- (SiriSharedUIPanDismissalGestureRecognizer)initWithDismissalDelegate:(id)a3 dismissalStyle:(int64_t)a4
{
  id v6;
  SiriSharedUIPanDismissalGestureRecognizer *v7;
  SiriSharedUIPanDismissalGestureRecognizer *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SiriSharedUIPanDismissalGestureRecognizer;
  v7 = -[SiriSharedUIPanDismissalGestureRecognizer initWithTarget:action:](&v10, sel_initWithTarget_action_, self, sel_panGestureRecognizerDidPan_);
  v8 = v7;
  if (v7)
  {
    -[SiriSharedUIPanDismissalGestureRecognizer setDismissalDelegate:](v7, "setDismissalDelegate:", v6);
    -[SiriSharedUIPanDismissalGestureRecognizer setDismissalStyle:](v8, "setDismissalStyle:", a4);
    -[SiriSharedUIPanDismissalGestureRecognizer setDelegate:](v8, "setDelegate:", v8);
    -[SiriSharedUIPanDismissalGestureRecognizer _preventHighlightingUntilGestureFaills](v8, "_preventHighlightingUntilGestureFaills");
  }

  return v8;
}

- (SiriSharedUIPanDismissalGestureRecognizer)initWithDismissalDelegate:(id)a3 dismissalStyle:(int64_t)a4 rtlProvider:(id)a5
{
  id v8;
  SiriSharedUIPanDismissalGestureRecognizer *v9;
  uint64_t v10;
  id rtlProvider;

  v8 = a5;
  v9 = -[SiriSharedUIPanDismissalGestureRecognizer initWithDismissalDelegate:dismissalStyle:](self, "initWithDismissalDelegate:dismissalStyle:", a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    rtlProvider = v9->_rtlProvider;
    v9->_rtlProvider = (id)v10;

  }
  return v9;
}

- (void)panGestureRecognizerDidPan:(id)a3
{
  id v4;
  int64_t dismissalStyle;
  id v6;

  v4 = a3;
  dismissalStyle = self->_dismissalStyle;
  if (dismissalStyle == 2)
  {
    v6 = v4;
    -[SiriSharedUIPanDismissalGestureRecognizer _handlePanWithRubberBandUpDownDismissTrailing:requiredDirection:](self, "_handlePanWithRubberBandUpDownDismissTrailing:requiredDirection:", v4, 0);
    goto LABEL_5;
  }
  if (dismissalStyle == 1)
  {
    v6 = v4;
    -[SiriSharedUIPanDismissalGestureRecognizer _handlePanWithRubberBandDownDismissUp:requiredDirection:](self, "_handlePanWithRubberBandDownDismissUp:requiredDirection:", v4, 1);
LABEL_5:
    v4 = v6;
  }

}

- (void)_handlePanWithRubberBandDownDismissUp:(id)a3 requiredDirection:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
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
  CGFloat Height;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28[10];
  _QWORD v29[4];
  id v30[8];
  id location;
  CGRect v32;

  v5 = a3;
  -[SiriSharedUIPanDismissalGestureRecognizer view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[SiriSharedUIPanDismissalGestureRecognizer view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "translationInView:", v15);
  v17 = v16;
  v19 = v18;

  *(_QWORD *)&v32.origin.x = v8;
  *(_QWORD *)&v32.origin.y = v10;
  *(_QWORD *)&v32.size.width = v12;
  *(_QWORD *)&v32.size.height = v14;
  Height = CGRectGetHeight(v32);
  -[SiriSharedUIPanDismissalGestureRecognizer view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "velocityInView:", v21);
  v25 = v23;
  v26 = v22;

  if (objc_msgSend(v5, "state") == 1)
  {
    *(_QWORD *)&self->_initialPosition.x = v8;
    *(_QWORD *)&self->_initialPosition.y = v10;
  }
  objc_initWeak(&location, self);
  v24 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __101__SiriSharedUIPanDismissalGestureRecognizer__handlePanWithRubberBandDownDismissUp_requiredDirection___block_invoke;
  v29[3] = &unk_1EA89CDA0;
  objc_copyWeak(v30, &location);
  v30[1] = v8;
  v30[2] = v10;
  v30[3] = v12;
  v30[4] = v14;
  v30[5] = v17;
  v30[6] = v19;
  v27[0] = v24;
  v30[7] = *(id *)&Height;
  v27[2] = __101__SiriSharedUIPanDismissalGestureRecognizer__handlePanWithRubberBandDownDismissUp_requiredDirection___block_invoke_2;
  v27[3] = &unk_1EA89CDC8;
  v27[1] = 3221225472;
  objc_copyWeak(v28, &location);
  v28[1] = v26;
  v28[2] = v25;
  v28[3] = v17;
  v28[4] = v19;
  v28[5] = v8;
  v28[6] = v10;
  v28[7] = v12;
  v28[8] = v14;
  v28[9] = *(id *)&Height;
  -[SiriSharedUIPanDismissalGestureRecognizer _updatePanGestureRecognizer:changedAnimations:endAnimations:](self, "_updatePanGestureRecognizer:changedAnimations:endAnimations:", v5, v29, v27);
  objc_destroyWeak(v28);
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);

}

void __101__SiriSharedUIPanDismissalGestureRecognizer__handlePanWithRubberBandDownDismissUp_requiredDirection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  CGRect v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = *(double *)(a1 + 40);
    v4 = *(double *)(a1 + 56);
    v5 = *(double *)(a1 + 64);
    v6 = *(double *)(a1 + 80);
    v16 = WeakRetained;
    v7 = objc_msgSend(WeakRetained, "initialPosition");
    v9 = v8;
    v10 = *(double *)(a1 + 80);
    if (v6 > 0.0)
      v10 = SiriSharedUIConstrainValueWithRubberBand(v7, v10, 220.0);
    v11 = v9 + v10;
    v17.origin.x = v3;
    v17.origin.y = v11;
    v17.size.width = v4;
    v17.size.height = v5;
    v12 = fmin((CGRectGetMinY(v17) + *(double *)(a1 + 88)) / *(double *)(a1 + 88), 1.0);
    if (v12 >= 0.0)
      v13 = v12;
    else
      v13 = 0.0;
    objc_msgSend(v16, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v3, v11, v4, v5);

    objc_msgSend(v16, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", v13);

    WeakRetained = v16;
  }

}

void __101__SiriSharedUIPanDismissalGestureRecognizer__handlePanWithRubberBandDownDismissUp_requiredDirection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = *(double *)(a1 + 48);
    v16 = WeakRetained;
    objc_msgSend(WeakRetained, "_contentScaleFactor");
    v5 = -(SiriSharedUIProjectedTranslationWithVelocity(v3, v4) + *(double *)(a1 + 64));
    v6 = CGRectGetHeight(*(CGRect *)(a1 + 72)) * 0.5;
    v7 = *(double *)(a1 + 72);
    v8 = *(double *)(a1 + 88);
    v9 = *(double *)(a1 + 96);
    if (v6 >= v5)
    {
      objc_msgSend(v16, "initialPosition");
      v10 = v12;
      v11 = 1.0;
    }
    else
    {
      v10 = -*(double *)(a1 + 104);
      v11 = 0.0;
    }
    objc_msgSend(v16, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v7, v10, v8, v9);

    objc_msgSend(v16, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlpha:", v11);

    objc_msgSend(v16, "dismissalDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dismissalGestureRecognizerDidFinish:shouldDismiss:", v16, v6 < v5);

    WeakRetained = v16;
  }

}

- (void)_handlePanWithRubberBandUpDownDismissTrailing:(id)a3 requiredDirection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  uint64_t v24;
  void *v25;
  uint64_t (**v26)(void);
  char v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  double Width;
  double v41;
  _QWORD v42[4];
  id v43[11];
  char v44;
  _QWORD v45[4];
  id v46[9];
  char v47;
  id location;
  CGRect v49;
  CGRect v50;

  v6 = a3;
  -[SiriSharedUIPanDismissalGestureRecognizer view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[SiriSharedUIPanDismissalGestureRecognizer _windowBounds](self, "_windowBounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  *(_QWORD *)&v49.origin.x = v9;
  *(_QWORD *)&v49.origin.y = v11;
  *(_QWORD *)&v49.size.width = v13;
  *(_QWORD *)&v49.size.height = v15;
  Width = CGRectGetWidth(v49);
  -[SiriSharedUIPanDismissalGestureRecognizer rtlProvider](self, "rtlProvider");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    if (SiriSharedUILanguageIsRTL())
      goto LABEL_3;
LABEL_5:
    v50.origin.x = v17;
    v50.origin.y = v19;
    v50.size.width = v21;
    v50.size.height = v23;
    v28 = 0;
    v41 = CGRectGetWidth(v50) - Width;
    goto LABEL_6;
  }
  v25 = (void *)v24;
  -[SiriSharedUIPanDismissalGestureRecognizer rtlProvider](self, "rtlProvider");
  v26 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v27 = v26[2]();

  if ((v27 & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v41 = 0.0;
  v28 = 1;
LABEL_6:
  -[SiriSharedUIPanDismissalGestureRecognizer view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "velocityInView:", v29);
  v31 = v30;
  v33 = v32;

  -[SiriSharedUIPanDismissalGestureRecognizer view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "translationInView:", v34);
  v36 = v35;
  v38 = v37;

  if (objc_msgSend(v6, "state") == 1
    && (self->_initialDirection = fabs(*(double *)&v33) > fabs(*(double *)&v31),
        *(_QWORD *)&self->_initialPosition.x = v9,
        *(_QWORD *)&self->_initialPosition.y = v11,
        self->_initialDirection != a4))
  {
    objc_msgSend(v6, "setState:", 4);
  }
  else
  {
    objc_initWeak(&location, self);
    v39 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __109__SiriSharedUIPanDismissalGestureRecognizer__handlePanWithRubberBandUpDownDismissTrailing_requiredDirection___block_invoke;
    v45[3] = &unk_1EA89CDF0;
    objc_copyWeak(v46, &location);
    v46[1] = v9;
    v46[2] = v11;
    v46[3] = v13;
    v46[4] = v15;
    v46[5] = v36;
    v46[6] = v38;
    v47 = v28;
    v42[0] = v39;
    v46[7] = *(id *)&v41;
    v46[8] = *(id *)&Width;
    v42[2] = __109__SiriSharedUIPanDismissalGestureRecognizer__handlePanWithRubberBandUpDownDismissTrailing_requiredDirection___block_invoke_2;
    v42[3] = &unk_1EA89CE18;
    v42[1] = 3221225472;
    objc_copyWeak(v43, &location);
    v43[1] = v9;
    v43[2] = v11;
    v43[3] = v13;
    v43[4] = v15;
    v43[5] = v31;
    v43[6] = v33;
    v43[7] = v36;
    v43[8] = v38;
    v44 = v28;
    v43[9] = *(id *)&Width;
    v43[10] = *(id *)&v41;
    -[SiriSharedUIPanDismissalGestureRecognizer _updatePanGestureRecognizer:changedAnimations:endAnimations:](self, "_updatePanGestureRecognizer:changedAnimations:endAnimations:", v6, v45, v42);
    objc_destroyWeak(v43);
    objc_destroyWeak(v46);
    objc_destroyWeak(&location);
  }

}

void __109__SiriSharedUIPanDismissalGestureRecognizer__handlePanWithRubberBandUpDownDismissTrailing_requiredDirection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double MinX;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  CGRect v26;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = *(double *)(a1 + 40);
    v4 = *(double *)(a1 + 48);
    v5 = *(double *)(a1 + 56);
    v6 = *(double *)(a1 + 64);
    v25 = WeakRetained;
    v7 = objc_msgSend(WeakRetained, "initialDirection");
    if (v7)
    {
      if (v7 == 1)
      {
        if (*(double *)(a1 + 80) <= 0.0)
          v8 = -1.0;
        else
          v8 = 1.0;
        v9 = objc_msgSend(v25, "initialPosition");
        v11 = v10;
        v12 = SiriSharedUIConstrainValueWithRubberBand(v9, fabs(*(double *)(a1 + 80)), 220.0);
        v13 = v25;
        v4 = v11 + v8 * v12;
        goto LABEL_23;
      }
    }
    else
    {
      v14 = *(double *)(a1 + 72);
      v15 = 0.0;
      if (v14 <= 0.0)
        v16 = *(double *)(a1 + 72);
      else
        v16 = 0.0;
      v17 = fmax(v14, 0.0);
      if (*(_BYTE *)(a1 + 104))
        v18 = v16;
      else
        v18 = v17;
      objc_msgSend(v25, "initialPosition");
      v3 = v18 + v19;
      v26.origin.x = v3;
      v26.origin.y = v4;
      v26.size.width = v5;
      v26.size.height = v6;
      MinX = CGRectGetMinX(v26);
      if (*(_BYTE *)(a1 + 104))
        v21 = MinX;
      else
        v21 = *(double *)(a1 + 88);
      if (*(_BYTE *)(a1 + 104))
        MinX = *(double *)(a1 + 88);
      v22 = fmin((*(double *)(a1 + 96) - (MinX - v21)) / *(double *)(a1 + 96), 1.0);
      if (v22 >= 0.0)
        v15 = v22;
      objc_msgSend(v25, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setAlpha:", v15);

    }
    v13 = v25;
LABEL_23:
    objc_msgSend(v13, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v3, v4, v5, v6);

    WeakRetained = v25;
  }

}

void __109__SiriSharedUIPanDismissalGestureRecognizer__handlePanWithRubberBandUpDownDismissTrailing_requiredDirection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = *(double *)(a1 + 40);
    v3 = *(double *)(a1 + 48);
    v5 = *(double *)(a1 + 56);
    v6 = *(double *)(a1 + 64);
    v24 = WeakRetained;
    v7 = objc_msgSend(WeakRetained, "initialDirection");
    if (v7)
    {
      if (v7 == 1)
      {
        objc_msgSend(v24, "initialPosition");
        v3 = v8;
      }
      v9 = 0;
      goto LABEL_14;
    }
    v10 = *(double *)(a1 + 72);
    objc_msgSend(v24, "_contentScaleFactor");
    v12 = SiriSharedUIProjectedTranslationWithVelocity(v10, v11) + *(double *)(a1 + 88);
    v13 = *(unsigned __int8 *)(a1 + 120);
    v14 = *(double *)(a1 + 104);
    objc_msgSend(v24, "initialPosition");
    v3 = v15;
    if (v13)
    {
      if (v12 < v14 * -0.5)
        goto LABEL_8;
    }
    else if (v12 > v14 * 0.5)
    {
LABEL_8:
      v17 = *(double *)(a1 + 104);
      v16 = *(double *)(a1 + 112);
      v18 = v16 + v17;
      v19 = 0.0;
      v20 = v16 - v17;
      v9 = 1;
      if (*(_BYTE *)(a1 + 120))
        v4 = v20;
      else
        v4 = v18;
      goto LABEL_13;
    }
    v9 = 0;
    v4 = *(double *)(a1 + 112);
    v19 = 1.0;
LABEL_13:
    objc_msgSend(v24, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAlpha:", v19);

LABEL_14:
    objc_msgSend(v24, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", v4, v3, v5, v6);

    objc_msgSend(v24, "dismissalDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dismissalGestureRecognizerDidFinish:shouldDismiss:", v24, v9);

    WeakRetained = v24;
  }

}

- (void)_updatePanGestureRecognizer:(id)a3 changedAnimations:(id)a4 endAnimations:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v10, "state") == 2)
    -[SiriSharedUIPanDismissalGestureRecognizer _runAnimationsWithPreferredStyle:](self, "_runAnimationsWithPreferredStyle:", v8);
  if (objc_msgSend(v10, "state") == 3 || objc_msgSend(v10, "state") == 4)
    -[SiriSharedUIPanDismissalGestureRecognizer _runAnimationsWithPreferredStyle:](self, "_runAnimationsWithPreferredStyle:", v9);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[SiriSharedUIPanDismissalGestureRecognizer dismissalDelegate](self, "dismissalDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SiriSharedUIPanDismissalGestureRecognizer dismissalDelegate](self, "dismissalDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldBeginDismissalGestureRecognizer:withTouch:", self, v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)_preventHighlightingUntilGestureFaills
{
  -[SiriSharedUIPanDismissalGestureRecognizer setDelaysTouchesBegan:](self, "setDelaysTouchesBegan:", 1);
}

- (void)_runAnimationsWithPreferredStyle:(id)a3
{
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringInteractive:animations:completion:", 1, a3, 0);
}

- (double)_contentScaleFactor
{
  void *v2;
  double v3;
  double v4;

  -[SiriSharedUIPanDismissalGestureRecognizer view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentScaleFactor");
  v4 = v3;

  return v4;
}

- (CGRect)_windowBounds
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[SiriSharedUIPanDismissalGestureRecognizer view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (SiriSharedUIPanDismissalGestureRecognizerDelegate)dismissalDelegate
{
  return (SiriSharedUIPanDismissalGestureRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_dismissalDelegate);
}

- (void)setDismissalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dismissalDelegate, a3);
}

- (int64_t)dismissalStyle
{
  return self->_dismissalStyle;
}

- (void)setDismissalStyle:(int64_t)a3
{
  self->_dismissalStyle = a3;
}

- (CGPoint)initialPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialPosition.x;
  y = self->_initialPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialPosition:(CGPoint)a3
{
  self->_initialPosition = a3;
}

- (int64_t)initialDirection
{
  return self->_initialDirection;
}

- (void)setInitialDirection:(int64_t)a3
{
  self->_initialDirection = a3;
}

- (id)rtlProvider
{
  return self->_rtlProvider;
}

- (void)setRtlProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rtlProvider, 0);
  objc_destroyWeak((id *)&self->_dismissalDelegate);
}

@end
