@implementation PLProgressView

- (PLProgressView)initWithFrame:(CGRect)a3
{
  PLProgressView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLProgressView;
  result = -[PLProgressView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_backgroundType = 2;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLProgressView;
  -[PLProgressView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double MinX;
  double MinY;
  double Width;
  double v14;
  double v15;
  UIView *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIProgressView *progressView;
  UIProgressView *v23;
  double x;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  -[PLProgressView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PLProgressView setOpaque:](self, "setOpaque:", 0);
  -[PLProgressView setBackgroundColor:](self, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "clearColor"));
  if (!-[PLProgressView backgroundView](self, "backgroundView"))
    -[PLProgressView _installBackgroundView](self, "_installBackgroundView");
  -[PLProgressView _syncToBackgroundType](self, "_syncToBackgroundType");
  if (!self->_topDivider)
  {
    v31.origin.x = v4;
    v31.origin.y = v6;
    v31.size.width = v8;
    v31.size.height = v10;
    MinX = CGRectGetMinX(v31);
    v32.origin.x = v4;
    v32.origin.y = v6;
    v32.size.width = v8;
    v32.size.height = v10;
    MinY = CGRectGetMinY(v32);
    v33.origin.x = v4;
    v33.origin.y = v6;
    v33.size.width = v8;
    v33.size.height = v10;
    Width = CGRectGetWidth(v33);
    PLPhysicalScreenScale();
    if (v14 <= 1.0)
      v15 = 1.0;
    else
      v15 = 0.5;
    v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", MinX, MinY, Width, v15);
    self->_topDivider = v16;
    -[PLProgressView addSubview:](self, "addSubview:", v16);
    -[UIView setAutoresizingMask:](self->_topDivider, "setAutoresizingMask:", 34);
    -[UIView setBackgroundColor:](self->_topDivider, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.200000003));
  }
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  if (self->_cancelButton
    && -[PLProgressView showsCancelButton](self, "showsCancelButton")
    && (-[UIButton isHidden](self->_cancelButton, "isHidden") & 1) == 0)
  {
    -[UIButton frame](self->_cancelButton, "frame");
    v19 = v18;
    v21 = v20;
    v34.origin.x = v4;
    v34.origin.y = v6;
    v34.size.width = v8;
    v34.size.height = v10;
    v35.origin.x = CGRectGetMaxX(v34) + -10.0 - v19;
    v35.origin.y = (v10 - v21) * 0.5;
    v35.size.width = v19;
    v35.size.height = v21;
    v36 = CGRectIntegral(v35);
    v17 = v36.size.width;
    -[UIButton setFrame:](self->_cancelButton, "setFrame:", v36.origin.x, v36.origin.y);
  }
  progressView = self->_progressView;
  if (!progressView)
  {
    v23 = (UIProgressView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA8E8]), "initWithProgressViewStyle:", 0);
    self->_progressView = v23;
    -[UIProgressView setAutoresizingMask:](v23, "setAutoresizingMask:", 34);
    -[PLProgressView addSubview:](self, "addSubview:", self->_progressView);
    -[PLProgressView bounds](self, "bounds");
    v38 = CGRectInset(v37, 10.0, 0.0);
    x = v38.origin.x;
    v25 = v17 + 20.0;
    if (v17 == 0.0)
      v25 = 0.0;
    v26 = v38.size.width - v25;
    v27 = v38.origin.y + 12.0;
    -[UIProgressView bounds](self->_progressView, "bounds");
    -[UIProgressView setFrame:](self->_progressView, "setFrame:", x, v27, v26, CGRectGetHeight(v39));
    LODWORD(v28) = 0;
    -[PLProgressView setPercentComplete:](self, "setPercentComplete:", v28);
    progressView = self->_progressView;
  }
  -[UIProgressView frame](progressView, "frame");
  -[UILabel setFrame:](self->_labelView, "setFrame:", v4, v29 + v30 + 4.0, v8, 20.0);
}

- (void)setBackgroundType:(int64_t)a3
{
  if (self->_backgroundType != a3)
  {
    self->_backgroundType = a3;
    -[PLProgressView _syncToBackgroundType](self, "_syncToBackgroundType");
  }
}

- (void)_syncToBackgroundType
{
  UILabel *labelView;
  uint64_t v4;

  switch(-[PLProgressView backgroundType](self, "backgroundType"))
  {
    case 0:
      -[PLProgressView _removeBackgroundTintedView](self, "_removeBackgroundTintedView");
      -[PLProgressView _removeBackgroundBlurredView](self, "_removeBackgroundBlurredView");
      goto LABEL_5;
    case 1:
      -[PLProgressView _removeBackgroundTintedView](self, "_removeBackgroundTintedView");
      -[PLProgressView _removeBackgroundBlurredView](self, "_removeBackgroundBlurredView");
      goto LABEL_7;
    case 2:
      -[PLProgressView _removeBackgroundTintedView](self, "_removeBackgroundTintedView");
      -[PLProgressView _installBackgroundBlurredView](self, "_installBackgroundBlurredView");
LABEL_5:
      labelView = self->_labelView;
      v4 = objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      goto LABEL_8;
    case 3:
      -[PLProgressView _removeBackgroundBlurredView](self, "_removeBackgroundBlurredView");
      -[PLProgressView _installBackgroundTintedView](self, "_installBackgroundTintedView");
LABEL_7:
      labelView = self->_labelView;
      v4 = objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
LABEL_8:
      -[UILabel setTextColor:](labelView, "setTextColor:", v4);
      break;
    default:
      return;
  }
}

- (void)_installBackgroundView
{
  id v3;
  id v4;

  if (!-[PLProgressView backgroundView](self, "backgroundView"))
  {
    v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[PLProgressView bounds](self, "bounds");
    v4 = (id)objc_msgSend(v3, "initWithFrame:");
    -[PLProgressView setBackgroundView:](self, "setBackgroundView:", v4);
    objc_msgSend(v4, "setOpaque:", 0);
    objc_msgSend(v4, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "clearColor"));
    -[PLProgressView addSubview:](self, "addSubview:", v4);
    -[PLProgressView sendSubviewToBack:](self, "sendSubviewToBack:", v4);
    objc_msgSend(v4, "setAutoresizingMask:", 18);
  }
}

- (void)_installBackgroundBlurredView
{
  UIView *v3;
  id v4;

  if (!-[PLProgressView backgroundBlurredView](self, "backgroundBlurredView"))
  {
    v3 = -[PLProgressView backgroundView](self, "backgroundView");
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithPrivateStyle:", 2010);
    -[PLProgressView setBackgroundBlurredView:](self, "setBackgroundBlurredView:", v4);
    -[UIView addSubview:](v3, "addSubview:", v4);
    -[UIView sendSubviewToBack:](v3, "sendSubviewToBack:", v4);
  }
}

- (void)_removeBackgroundBlurredView
{
  if (-[PLProgressView backgroundBlurredView](self, "backgroundBlurredView"))
  {
    -[_UIBackdropView removeFromSuperview](-[PLProgressView backgroundBlurredView](self, "backgroundBlurredView"), "removeFromSuperview");
    -[PLProgressView setBackgroundBlurredView:](self, "setBackgroundBlurredView:", 0);
  }
}

- (void)_installBackgroundTintedView
{
  UIView *v3;
  id v4;
  id v5;

  if (!-[PLProgressView backgroundTintedView](self, "backgroundTintedView"))
  {
    v3 = -[PLProgressView backgroundView](self, "backgroundView");
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[UIView bounds](v3, "bounds");
    v5 = (id)objc_msgSend(v4, "initWithFrame:");
    -[PLProgressView setBackgroundTintedView:](self, "setBackgroundTintedView:", v5);
    objc_msgSend(v5, "setOpaque:", 0);
    objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.101960786, 0.75));
    -[UIView addSubview:](v3, "addSubview:", v5);
    -[UIView sendSubviewToBack:](v3, "sendSubviewToBack:", v5);
    objc_msgSend(v5, "setAutoresizingMask:", 18);
  }
}

- (void)_removeBackgroundTintedView
{
  if (-[PLProgressView backgroundTintedView](self, "backgroundTintedView"))
  {
    -[UIView removeFromSuperview](-[PLProgressView backgroundTintedView](self, "backgroundTintedView"), "removeFromSuperview");
    -[PLProgressView setBackgroundTintedView:](self, "setBackgroundTintedView:", 0);
  }
}

- (void)updateUIForPublishingAgent:(id)a3
{
  double v5;
  double v6;
  int v7;
  int v8;
  double v9;
  NSDateComponentsFormatter *timeRemainingFormatter;
  NSDateComponentsFormatter *v11;
  UILabel *labelView;
  uint64_t v13;
  UILabel *v14;

  if (objc_msgSend(a3, "isRemaking"))
  {
    objc_msgSend(a3, "remakingPercentComplete");
    -[PLProgressView setPercentComplete:](self, "setPercentComplete:");
    if ((*((_BYTE *)self + 448) & 2) == 0)
    {
      -[PLProgressView setLabelText:](self, "setLabelText:", objc_msgSend(a3, "progressViewMessageDuringRemake"));
      *((_BYTE *)self + 448) |= 2u;
    }
  }
  else
  {
    objc_msgSend(a3, "snapshot");
    objc_msgSend(a3, "estimatedTimeRemaining");
    v6 = v5;
    objc_msgSend(a3, "percentComplete");
    v8 = v7;
    -[PLProgressView setNeedsLayout](self, "setNeedsLayout");
    LODWORD(v9) = v8;
    -[PLProgressView setPercentComplete:](self, "setPercentComplete:", v9);
    if (v6 <= 0.0)
    {
      PLLocalizedFrameworkString();
      labelView = self->_labelView;
      objc_msgSend(a3, "serviceName");
      v13 = PFStringWithValidatedFormat();
      v14 = labelView;
    }
    else
    {
      if (v6 <= 1.0)
      {
        PLLocalizedFrameworkString();
      }
      else
      {
        timeRemainingFormatter = self->_timeRemainingFormatter;
        if (!timeRemainingFormatter)
        {
          v11 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E0CB3570]);
          self->_timeRemainingFormatter = v11;
          -[NSDateComponentsFormatter setUnitsStyle:](v11, "setUnitsStyle:", 3);
          -[NSDateComponentsFormatter setIncludesApproximationPhrase:](self->_timeRemainingFormatter, "setIncludesApproximationPhrase:", 1);
          -[NSDateComponentsFormatter setIncludesTimeRemainingPhrase:](self->_timeRemainingFormatter, "setIncludesTimeRemainingPhrase:", 1);
          -[NSDateComponentsFormatter setAllowedUnits:](self->_timeRemainingFormatter, "setAllowedUnits:", 64);
          timeRemainingFormatter = self->_timeRemainingFormatter;
        }
        -[NSDateComponentsFormatter stringFromTimeInterval:](timeRemainingFormatter, "stringFromTimeInterval:", v6);
      }
      PLLocalizedFrameworkString();
      objc_msgSend(a3, "serviceName");
      v13 = PFStringWithValidatedFormat();
      v14 = self->_labelView;
    }
    -[UILabel setText:](v14, "setText:", v13);
  }
}

- (void)setLabelText:(id)a3
{
  UILabel *labelView;
  id v6;
  UILabel *v7;

  labelView = self->_labelView;
  if (!labelView)
  {
    v6 = objc_alloc(MEMORY[0x1E0CEA700]);
    v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    self->_labelView = v7;
    -[UILabel setAutoresizingMask:](v7, "setAutoresizingMask:", 2);
    -[UILabel setFont:](self->_labelView, "setFont:", objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 12.0));
    -[UILabel setBackgroundColor:](self->_labelView, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "clearColor"));
    -[UILabel setTextColor:](self->_labelView, "setTextColor:", objc_msgSend(MEMORY[0x1E0CEA478], "blackColor"));
    -[UILabel setTextAlignment:](self->_labelView, "setTextAlignment:", 1);
    -[PLProgressView addSubview:](self, "addSubview:", self->_labelView);
    labelView = self->_labelView;
  }
  -[UILabel setText:](labelView, "setText:", a3);
  -[PLProgressView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPercentComplete:(float)a3
{
  -[UIProgressView setProgress:animated:](self->_progressView, "setProgress:animated:", 1);
}

- (float)percentComplete
{
  UIProgressView *progressView;
  float result;

  progressView = self->_progressView;
  if (!progressView)
    return 0.0;
  -[UIProgressView progress](progressView, "progress");
  return result;
}

- (void)_cancel:(id)a3
{
  void (**cancelationHandler)(void);

  -[UIButton setEnabled:](self->_cancelButton, "setEnabled:", 0);
  cancelationHandler = (void (**)(void))self->_cancelationHandler;
  if (cancelationHandler)
  {
    cancelationHandler[2]();
    -[PLProgressView setCancelationHandler:](self, "setCancelationHandler:", 0);
  }
}

- (void)setShowsCancelButton:(BOOL)a3
{
  UIButton *cancelButton;
  UIButton *v5;
  _BOOL8 v6;

  if (self->_showsCancelButton != a3)
  {
    self->_showsCancelButton = a3;
    if (a3)
    {
      cancelButton = self->_cancelButton;
      if (!cancelButton)
      {
        v5 = (UIButton *)objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 122);
        self->_cancelButton = v5;
        -[UIButton setExclusiveTouch:](v5, "setExclusiveTouch:", 1);
        -[UIButton addTarget:action:forControlEvents:](self->_cancelButton, "addTarget:action:forControlEvents:", self, sel__cancel_, 64);
        -[UIButton sizeToFit](self->_cancelButton, "sizeToFit");
        cancelButton = self->_cancelButton;
      }
      -[PLProgressView addSubview:](self, "addSubview:", cancelButton);
      v6 = !self->_showsCancelButton;
    }
    else
    {
      v6 = 1;
    }
    -[UIButton setHidden:](self->_cancelButton, "setHidden:", v6);
    -[UIButton setEnabled:](self->_cancelButton, "setEnabled:", 1);
    -[PLProgressView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (int64_t)backgroundType
{
  return self->_backgroundType;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 472);
}

- (UIView)backgroundTintedView
{
  return self->_backgroundTintedView;
}

- (void)setBackgroundTintedView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 480);
}

- (_UIBackdropView)backgroundBlurredView
{
  return self->_backgroundBlurredView;
}

- (void)setBackgroundBlurredView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 488);
}

- (BOOL)showsCancelButton
{
  return self->_showsCancelButton;
}

- (id)cancelationHandler
{
  return self->_cancelationHandler;
}

- (void)setCancelationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

@end
