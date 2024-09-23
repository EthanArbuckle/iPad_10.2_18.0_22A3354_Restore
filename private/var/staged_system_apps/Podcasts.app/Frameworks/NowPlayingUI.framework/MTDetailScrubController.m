@implementation MTDetailScrubController

- (MTDetailScrubController)initWithScrubbingControl:(id)a3
{
  id v4;
  MTDetailScrubController *v5;
  MTDetailScrubController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTDetailScrubController;
  v5 = -[MTDetailScrubController init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scrubbingControl, v4);
    v6->_scrubbingVerticalRange = 220.0;
    v6->_detailedScrubbingEnabled = 1;
  }

  return v6;
}

- (MTDetailScrubController)init
{
  +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("-init is invalid. Use -initWithScrubbingControl: instead."));

  return 0;
}

- (BOOL)beginTrackingWithLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id WeakRetained;
  _BOOL4 v7;
  UISelectionFeedbackGenerator *feedbackGenerator;
  UISelectionFeedbackGenerator *v9;
  UISelectionFeedbackGenerator *v10;
  CGPoint v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  self->_didBeginTracking = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_msgSend(WeakRetained, "thumbHitRect");
  v12.x = x;
  v12.y = y;
  v7 = CGRectContainsPoint(v13, v12);

  if (v7)
  {
    self->_previousLocationInView.x = x;
    self->_previousLocationInView.y = y;
    self->_beginLocationInView.x = x;
    self->_beginLocationInView.y = y;
    -[MTDetailScrubController _beginScrubbing](self, "_beginScrubbing");
    feedbackGenerator = self->_feedbackGenerator;
    if (!feedbackGenerator)
    {
      v9 = (UISelectionFeedbackGenerator *)objc_alloc_init((Class)UISelectionFeedbackGenerator);
      v10 = self->_feedbackGenerator;
      self->_feedbackGenerator = v9;

      feedbackGenerator = self->_feedbackGenerator;
    }
    -[UISelectionFeedbackGenerator prepare](feedbackGenerator, "prepare");
  }
  return v7;
}

- (BOOL)continueTrackingWithLocation:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  int64_t v8;
  id WeakRetained;
  char v10;
  id v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  char isKindOfClass;
  id v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  float v25;
  float v26;
  id v27;
  float v28;
  double v29;
  double v30;
  id v31;
  float v32;
  float v33;
  float v34;
  id v35;
  float v36;
  float v37;
  id v38;
  float v39;
  float v40;
  double v41;

  y = a3.y;
  x = a3.x;
  v6 = 1.0;
  if (self->_detailedScrubbingEnabled
    && -[MTDetailScrubController durationAllowsForDetailedScrubbing](self, "durationAllowsForDetailedScrubbing"))
  {
    -[MTDetailScrubController scaleForVerticalPosition:](self, "scaleForVerticalPosition:", y);
    v6 = v7;
    if (v7 <= 0.1)
    {
      v8 = 3;
    }
    else if (v7 > 0.35 || v7 <= 0.1)
    {
      v8 = v7 > 0.35 && (unint64_t)(v7 <= 0.75);
    }
    else
    {
      v8 = 2;
    }
    if (self->_currentScrubSpeed != v8)
    {
      self->_currentScrubSpeed = v8;
      -[UISelectionFeedbackGenerator selectionChanged](self->_feedbackGenerator, "selectionChanged");
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v10 = objc_opt_respondsToSelector(WeakRetained, "detailScrubController:didChangeScrubSpeed:");

      if ((v10 & 1) != 0)
      {
        v11 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v11, "detailScrubController:didChangeScrubSpeed:", self, self->_currentScrubSpeed);

      }
    }
  }
  -[MTDetailScrubController _minimumScale](self, "_minimumScale");
  if (v12 < v6)
    v12 = v6;
  if (!self->_didBeginTracking)
  {
    if (vabdd_f64(self->_beginLocationInView.x, x) < 12.0)
      goto LABEL_33;
    self->_didBeginTracking = 1;
    self->_accumulatedDelta = 0.0;
  }
  v13 = fmin(v12, 1.0);
  v14 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  v15 = objc_opt_class(UISlider);
  isKindOfClass = objc_opt_isKindOfClass(v14, v15);

  v17 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  v18 = v17;
  if ((isKindOfClass & 1) != 0)
  {
    v19 = v17;
    objc_msgSend(v19, "bounds");
    objc_msgSend(v19, "trackRectForBounds:");
    v21 = v20;

  }
  else
  {
    objc_msgSend(v17, "bounds");
    v21 = v22;
  }

  v23 = x - self->_previousLocationInView.x;
  v24 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_msgSend(v24, "maximumValue");
  v26 = v25;
  v27 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_msgSend(v27, "minimumValue");
  v29 = (float)(v26 - v28) / v21;

  v30 = v23 * v29;
  v31 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_msgSend(v31, "value");
  v33 = v32;

  v34 = v33 + v30 * v13;
  v35 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_msgSend(v35, "minimumValue");
  v37 = v36;

  v38 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_msgSend(v38, "maximumValue");
  v40 = v39;

  if (v40 >= v34)
    *(float *)&v41 = v34;
  else
    *(float *)&v41 = v40;
  if (v37 >= *(float *)&v41)
    *(float *)&v41 = v37;
  if (vabds_f32(*(float *)&v41, v33) > 0.00000011921)
    self->_needsCommit = 1;
  if (vabdd_f64(self->_lastCommittedLocationInView.x, x) <= 1.0
    && vabdd_f64(self->_lastCommittedLocationInView.y, y) <= 4.0)
  {
    self->_accumulatedDelta = (float)(*(float *)&v41 - v33) + self->_accumulatedDelta;
  }
  else
  {
    *(float *)&v41 = *(float *)&v41 + self->_accumulatedDelta;
    -[MTDetailScrubController _commitValue:](self, "_commitValue:", v41);
    self->_accumulatedDelta = 0.0;
    self->_lastCommittedLocationInView.x = x;
    self->_lastCommittedLocationInView.y = y;
  }
LABEL_33:
  self->_previousLocationInView.x = x;
  self->_previousLocationInView.y = y;
  return 1;
}

- (void)endTrackingWithLocation:(CGPoint)a3
{
  double x;
  id WeakRetained;

  x = a3.x;
  -[MTDetailScrubController _endScrubbing](self, "_endScrubbing", a3.x, a3.y);
  if (vabdd_f64(self->_lastCommittedLocationInView.x, x) > 3.0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
    objc_msgSend(WeakRetained, "value");
    -[MTDetailScrubController _commitValue:](self, "_commitValue:");

  }
}

- (BOOL)durationAllowsForDetailedScrubbing
{
  return self->_duration >= 60.0;
}

- (double)scaleForVerticalPosition:(double)a3
{
  void *v5;
  char *v6;
  double scrubbingVerticalRange;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  float v17;
  double v18;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = (char *)objc_msgSend(v5, "userInterfaceIdiom");

  scrubbingVerticalRange = self->_scrubbingVerticalRange;
  v8 = vabdd_f64(a3, self->_beginLocationInView.y);
  if (scrubbingVerticalRange >= v8)
    scrubbingVerticalRange = v8;
  if (v6 == (_BYTE *)&dword_0 + 1)
    v9 = 20.0;
  else
    v9 = 0.0;
  if (v9 >= scrubbingVerticalRange)
    v10 = v9;
  else
    v10 = scrubbingVerticalRange;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v11, "userInterfaceIdiom") == (char *)&dword_0 + 1)
    v12 = 20.0;
  else
    v12 = 0.0;
  v13 = v10 - v12;

  v14 = self->_scrubbingVerticalRange;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v15, "userInterfaceIdiom") == (char *)&dword_0 + 1)
    v16 = 20.0;
  else
    v16 = 0.0;
  v17 = v13 / (v14 - v16);
  v18 = (float)(1.0 - v17);

  return v18;
}

- (double)_minimumScale
{
  id WeakRetained;
  double v4;
  CGRect v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_msgSend(WeakRetained, "bounds");
  v4 = CGRectGetWidth(v6) / self->_duration / 10.0;

  return v4;
}

- (double)_scaleForIdealValueForVerticalPosition:(double)a3
{
  double scrubbingVerticalRange;
  double v4;
  double v5;
  BOOL v6;
  BOOL v7;
  double v8;
  float v9;
  double v10;
  long double v11;
  double v12;
  double v13;

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
  v9 = v8 / (scrubbingVerticalRange + -20.0);
  v10 = v9;
  if (v9 <= 0.15)
  {
    v10 = v10 / 0.150000006;
    v11 = 0.333333333;
  }
  else
  {
    v11 = 0.0250000004;
  }
  v12 = pow(v10, v11);
  if (v12 <= 0.0)
    v13 = 1.0;
  else
    v13 = 1.0 - v12;
  if (v13 > 1.0)
    v13 = 1.0;
  return fmax(v13, 0.0);
}

- (void)_beginScrubbing
{
  MTDetailScrubControllerDelegate **p_delegate;
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
  MTDetailScrubControllerDelegate **p_delegate;
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
  MTDetailScrubControllerDelegate **p_delegate;
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

- (MTDetailedScrubbing)scrubbingControl
{
  return (MTDetailedScrubbing *)objc_loadWeakRetained((id *)&self->_scrubbingControl);
}

- (void)setScrubbingControl:(id)a3
{
  objc_storeWeak((id *)&self->_scrubbingControl, a3);
}

- (MTDetailScrubControllerDelegate)delegate
{
  return (MTDetailScrubControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
