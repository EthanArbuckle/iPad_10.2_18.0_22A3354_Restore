@implementation RCMPDetailScrubController

- (RCMPDetailScrubController)initWithScrubbingControl:(id)a3
{
  id v4;
  RCMPDetailScrubController *v5;
  RCMPDetailScrubController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RCMPDetailScrubController;
  v5 = -[RCMPDetailScrubController init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scrubbingControl, v4);
    v6->_scrubbingVerticalRange = 220.0;
    v6->_detailedScrubbingEnabled = 1;
  }

  return v6;
}

- (RCMPDetailScrubController)init
{
  +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("-init is invalid. Use -initWithScrubbingControl: instead."));

  return 0;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  RCMPDetailedScrubbing **p_scrubbingControl;
  id v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  UISelectionFeedbackGenerator *feedbackGenerator;
  UISelectionFeedbackGenerator *v14;
  UISelectionFeedbackGenerator *v15;
  CGPoint v17;
  CGRect v18;

  self->_didBeginTracking = 0;
  p_scrubbingControl = &self->_scrubbingControl;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_scrubbingControl);
  objc_msgSend(v6, "locationInView:", WeakRetained);
  v9 = v8;
  v11 = v10;

  v12 = objc_loadWeakRetained((id *)p_scrubbingControl);
  objc_msgSend(v12, "thumbHitRect");
  v17.x = v9;
  v17.y = v11;
  LODWORD(v6) = CGRectContainsPoint(v18, v17);

  self->_beginLocationInView.x = v9;
  self->_beginLocationInView.y = v11;
  self->_previousLocationInView.x = v9;
  self->_previousLocationInView.y = v11;
  if ((_DWORD)v6)
    -[RCMPDetailScrubController _beginScrubbing](self, "_beginScrubbing");
  else
    -[RCMPDetailScrubController _calculateAndCommitLocation:force:](self, "_calculateAndCommitLocation:force:", 1, v9, v11);
  feedbackGenerator = self->_feedbackGenerator;
  if (!feedbackGenerator)
  {
    v14 = (UISelectionFeedbackGenerator *)objc_alloc_init((Class)UISelectionFeedbackGenerator);
    v15 = self->_feedbackGenerator;
    self->_feedbackGenerator = v14;

    feedbackGenerator = self->_feedbackGenerator;
  }
  -[UISelectionFeedbackGenerator prepare](feedbackGenerator, "prepare");
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  RCMPDetailedScrubbing **p_scrubbingControl;
  id v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  int64_t v14;
  id v15;
  char v16;
  id v17;

  p_scrubbingControl = &self->_scrubbingControl;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_scrubbingControl);
  objc_msgSend(v6, "locationInView:", WeakRetained);
  v9 = v8;
  v11 = v10;

  if (self->_detailedScrubbingEnabled
    && -[RCMPDetailScrubController durationAllowsForDetailedScrubbing](self, "durationAllowsForDetailedScrubbing"))
  {
    -[RCMPDetailScrubController scaleForVerticalPosition:](self, "scaleForVerticalPosition:", v11);
    v13 = v12;
    if (v12 <= 0.1)
    {
      v14 = 3;
    }
    else if (v13 > 0.35 || v13 <= 0.1)
    {
      v14 = v13 > 0.35 && v12 <= 0.75;
    }
    else
    {
      v14 = 2;
    }
    if (self->_currentScrubSpeed != v14)
    {
      self->_currentScrubSpeed = v14;
      -[UISelectionFeedbackGenerator selectionChanged](self->_feedbackGenerator, "selectionChanged");
      v15 = objc_loadWeakRetained((id *)&self->_delegate);
      v16 = objc_opt_respondsToSelector(v15, "detailScrubController:didChangeScrubSpeed:");

      if ((v16 & 1) != 0)
      {
        v17 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v17, "detailScrubController:didChangeScrubSpeed:", self, self->_currentScrubSpeed);

      }
    }
  }
  if (self->_didBeginTracking)
    goto LABEL_18;
  if (vabdd_f64(self->_beginLocationInView.x, v9) >= 12.0)
  {
    self->_didBeginTracking = 1;
    self->_accumulatedDelta = 0.0;
LABEL_18:
    -[RCMPDetailScrubController _calculateAndCommitLocation:force:](self, "_calculateAndCommitLocation:force:", 0, v9, v11);
    return 1;
  }
  self->_previousLocationInView.x = v9;
  self->_previousLocationInView.y = v11;
  return 1;
}

- (void)_calculateAndCommitLocation:(CGPoint)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  double v8;
  float v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  char isKindOfClass;
  id v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  float v24;
  float v25;
  id v26;
  float v27;
  double v28;
  id v29;
  float v30;
  float v31;
  double v32;
  id v33;
  float v34;
  float v35;
  id v36;
  float v37;
  float v38;
  double v39;
  float v40;
  id v41;
  float v42;
  float v43;
  id v44;
  float v45;
  float v46;
  double v47;
  RCMPDetailScrubController *v48;
  float v49;
  double v50;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v8 = 1.0;
  if (self->_detailedScrubbingEnabled
    && -[RCMPDetailScrubController durationAllowsForDetailedScrubbing](self, "durationAllowsForDetailedScrubbing"))
  {
    -[RCMPDetailScrubController scaleForVerticalPosition:](self, "scaleForVerticalPosition:", y);
    v8 = v9;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  v12 = objc_opt_class(UISlider, v11);
  isKindOfClass = objc_opt_isKindOfClass(WeakRetained, v12);

  v14 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  v15 = v14;
  if ((isKindOfClass & 1) != 0)
  {
    v16 = v14;
    objc_msgSend(v16, "bounds");
    objc_msgSend(v16, "trackRectForBounds:");
    v50 = v17;
    v19 = v18;

  }
  else
  {
    objc_msgSend(v14, "bounds");
    v50 = v20;
    v19 = v21;
  }

  v22 = x - self->_previousLocationInView.x;
  v23 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_msgSend(v23, "maximumValue");
  v25 = v24;
  v26 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_msgSend(v26, "minimumValue");
  v28 = (float)(v25 - v27) / v19;

  v29 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_msgSend(v29, "value");
  v31 = v30;

  v32 = v31 + v22 * v28 * v8;
  v33 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_msgSend(v33, "minimumValue");
  v35 = v34;

  v36 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_msgSend(v36, "maximumValue");
  v38 = v37;

  v39 = v38;
  if (v32 <= v38)
    v39 = v32;
  if (v39 <= v35)
    v39 = v35;
  v40 = v39;
  if (vabds_f32(v40, v31) > 0.00000011921)
    self->_needsCommit = 1;
  if (v4)
  {
    v41 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
    objc_msgSend(v41, "minimumValue");
    v43 = v42;

    v44 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
    objc_msgSend(v44, "maximumValue");
    v46 = v45;

    v47 = v46;
    if ((x - v50) * v28 <= v46)
      v47 = (x - v50) * v28;
    if (v47 > v43)
      v43 = v47;
    if (!self->_isTracking)
    {
      *(float *)&v47 = v43;
      -[RCMPDetailScrubController _beginScrubbingWithValue:](self, "_beginScrubbingWithValue:", v47);
    }
    self->_needsCommit = 1;
    v48 = self;
    *(float *)&v47 = v43;
  }
  else
  {
    if (vabdd_f64(self->_lastCommittedLocationInView.x, x) <= 8.0
      && vabdd_f64(self->_lastCommittedLocationInView.y, y) <= 4.0)
    {
      v49 = v39 - v31 + self->_accumulatedDelta;
      self->_accumulatedDelta = v49;
      goto LABEL_25;
    }
    v47 = v39 + self->_accumulatedDelta;
    *(float *)&v47 = v47;
    v48 = self;
  }
  -[RCMPDetailScrubController _commitValue:](v48, "_commitValue:", v47);
  self->_accumulatedDelta = 0.0;
  self->_lastCommittedLocationInView.x = x;
  self->_lastCommittedLocationInView.y = y;
LABEL_25:
  self->_previousLocationInView.x = x;
  self->_previousLocationInView.y = y;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[RCMPDetailScrubController _endScrubbing](self, "_endScrubbing", a3, a4);
}

- (void)cancelTrackingWithEvent:(id)a3
{
  -[RCMPDetailScrubController _endScrubbing](self, "_endScrubbing", a3);
}

- (BOOL)durationAllowsForDetailedScrubbing
{
  double duration;
  id WeakRetained;
  BOOL v4;
  CGRect v6;

  duration = self->_duration;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_msgSend(WeakRetained, "bounds");
  v4 = duration / CGRectGetWidth(v6) >= 0.1;

  return v4;
}

- (float)scaleForVerticalPosition:(double)a3
{
  void *v5;
  id v6;
  double scrubbingVerticalRange;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  float v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  float v18;
  float v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  scrubbingVerticalRange = self->_scrubbingVerticalRange;
  v8 = vabdd_f64(a3, self->_beginLocationInView.y);
  if (scrubbingVerticalRange >= v8)
    scrubbingVerticalRange = v8;
  if (v6 == (id)1)
    v9 = 20.0;
  else
    v9 = 0.0;
  if (v9 >= scrubbingVerticalRange)
    v10 = v9;
  else
    v10 = scrubbingVerticalRange;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v11, "userInterfaceIdiom") == (id)1)
    v12 = 20.0;
  else
    v12 = 0.0;
  v13 = v10 - v12;

  v14 = v13;
  v15 = self->_scrubbingVerticalRange;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v16, "userInterfaceIdiom") == (id)1)
    v17 = 20.0;
  else
    v17 = 0.0;
  v18 = v14 / (v15 - v17);
  v19 = 1.0 - v18;

  return v19;
}

- (float)_minimumScale
{
  id WeakRetained;
  float Width;
  float duration;
  float v6;
  CGRect v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_msgSend(WeakRetained, "bounds");
  Width = CGRectGetWidth(v8);
  duration = self->_duration;
  v6 = (float)(Width / duration) / 20.0;

  return v6;
}

- (float)_scaleForIdealValueForVerticalPosition:(double)a3
{
  double scrubbingVerticalRange;
  double v4;
  double v5;
  BOOL v6;
  BOOL v7;
  double v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;

  scrubbingVerticalRange = self->_scrubbingVerticalRange;
  v4 = vabdd_f64(a3, self->_beginLocationInView.y);
  if (scrubbingVerticalRange < v4)
    v4 = self->_scrubbingVerticalRange;
  v5 = v4 + -20.0;
  v6 = v4 == 20.0;
  v7 = v4 < 20.0;
  v8 = 0.0;
  if (!v7 && !v6)
    v8 = v5;
  v9 = v8;
  v10 = v9 / (scrubbingVerticalRange + -20.0);
  if (v10 <= 0.15)
  {
    v10 = v10 / 0.15;
    v11 = 0.33333;
  }
  else
  {
    v11 = 0.025;
  }
  v12 = powf(v10, v11);
  if (v12 <= 0.0)
    v13 = 1.0;
  else
    v13 = 1.0 - v12;
  if (v13 > 1.0)
    v13 = 1.0;
  return fmaxf(v13, 0.0);
}

- (void)_beginScrubbingWithValue:(float)a3
{
  RCMPDetailedScrubbing **p_scrubbingControl;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;
  id v10;
  double v11;

  p_scrubbingControl = &self->_scrubbingControl;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  v8 = objc_opt_class(UISlider, v7);
  isKindOfClass = objc_opt_isKindOfClass(WeakRetained, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_scrubbingControl);
    *(float *)&v11 = a3;
    objc_msgSend(v10, "setValue:", v11);

  }
  -[RCMPDetailScrubController _beginScrubbing](self, "_beginScrubbing");
}

- (void)_beginScrubbing
{
  RCMPDetailScrubControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  id v7;
  char v8;
  id v9;

  if (!self->_isTracking)
  {
    self->_isTracking = 1;
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector(WeakRetained, "detailScrubController:didChangeScrubSpeed:");

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v6, "detailScrubController:didChangeScrubSpeed:", self, 0);

    }
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector(v7, "detailScrubControllerDidBeginScrubbing:");

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "detailScrubControllerDidBeginScrubbing:", self);

    }
  }
}

- (void)_endScrubbing
{
  RCMPDetailScrubControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  if (self->_isTracking)
  {
    self->_isTracking = 0;
    self->_currentScrubSpeed = 0;
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector(WeakRetained, "detailScrubControllerDidEndScrubbing:");

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v6, "detailScrubControllerDidEndScrubbing:", self);

    }
  }
}

- (void)_commitValue:(float)a3
{
  RCMPDetailScrubControllerDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;
  double v9;

  if (self->_needsCommit)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector(WeakRetained, "detailScrubController:didChangeValue:");

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      v9 = self->_duration * a3;
      *(float *)&v9 = v9;
      objc_msgSend(v8, "detailScrubController:didChangeValue:", self, v9);

      self->_needsCommit = 0;
    }
  }
}

- (RCMPDetailedScrubbing)scrubbingControl
{
  return (RCMPDetailedScrubbing *)objc_loadWeakRetained((id *)&self->_scrubbingControl);
}

- (void)setScrubbingControl:(id)a3
{
  objc_storeWeak((id *)&self->_scrubbingControl, a3);
}

- (RCMPDetailScrubControllerDelegate)delegate
{
  return (RCMPDetailScrubControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)scrubbingVerticalRange
{
  return self->_scrubbingVerticalRange;
}

- (void)setScrubbingVerticalRange:(double)a3
{
  self->_scrubbingVerticalRange = a3;
}

- (BOOL)detailedScrubbingEnabled
{
  return self->_detailedScrubbingEnabled;
}

- (void)setDetailedScrubbingEnabled:(BOOL)a3
{
  self->_detailedScrubbingEnabled = a3;
}

- (BOOL)isTracking
{
  return self->_isTracking;
}

- (int64_t)currentScrubSpeed
{
  return self->_currentScrubSpeed;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scrubbingControl);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
}

@end
