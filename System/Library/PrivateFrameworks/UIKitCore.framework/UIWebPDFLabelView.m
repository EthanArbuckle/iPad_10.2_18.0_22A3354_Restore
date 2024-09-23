@implementation UIWebPDFLabelView

- (UIWebPDFLabelView)initWithFrame:(CGRect)a3
{
  UIWebPDFLabelView *v3;
  UIWebPDFLabelView *v4;
  _UIBackdropView *v5;
  UILabel *v6;
  CALayer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIWebPDFLabelView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CALayer setAllowsGroupOpacity:](-[UIView layer](v3, "layer"), "setAllowsGroupOpacity:", 0);
    -[CALayer setAllowsGroupBlending:](-[UIView layer](v4, "layer"), "setAllowsGroupBlending:", 0);
    v5 = -[_UIBackdropView initWithPrivateStyle:]([_UIBackdropView alloc], "initWithPrivateStyle:", 2020);
    v4->_backdropView = v5;
    -[UIView addSubview:](v4, "addSubview:", v5);
    -[UIWebPDFLabelView _makeRoundedCorners](v4, "_makeRoundedCorners");
    v6 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    v4->_label = v6;
    -[UIView setOpaque:](v6, "setOpaque:", 0);
    -[UIView setBackgroundColor:](v4->_label, "setBackgroundColor:", 0);
    -[UILabel setTextAlignment:](v4->_label, "setTextAlignment:", 1);
    -[UILabel setFont:](v4->_label, "setFont:", objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 16.0));
    -[UILabel setTextColor:](v4->_label, "setTextColor:", +[UIColor blackColor](UIColor, "blackColor"));
    -[UIView setAlpha:](v4->_label, "setAlpha:", 0.4);
    v7 = -[UIView layer](v4->_label, "layer");
    -[CALayer setCompositingFilter:](v7, "setCompositingFilter:", objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E98]));
    -[UIView addSubview:](v4, "addSubview:", v4->_label);
  }
  return v4;
}

- (void)clearTimer
{
  -[NSTimer invalidate](self->_timer, "invalidate");

  self->_timer = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[UIWebPDFLabelView clearTimer](self, "clearTimer");

  v3.receiver = self;
  v3.super_class = (Class)UIWebPDFLabelView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[UIView sizeToFit](self->_label, "sizeToFit");
  -[UIView frame](self->_label, "frame");
  v4 = v3 + 20.0;
  v6 = v5 + 12.0;
  -[UIView setSize:](self->_backdropView, "setSize:", v3 + 20.0, v5 + 12.0);
  -[UIView setSize:](self->_label, "setSize:", v4, v6);
  -[UIView setSize:](self, "setSize:", v4, v6);
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
  -[UIWebPDFLabelView sizeToFit](self, "sizeToFit");
}

- (BOOL)isTimerInstalled
{
  return self->_timer != 0;
}

- (double)_fadeOutDelay
{
  return 2.0;
}

- (double)_fadeOutDuration
{
  return 0.5;
}

- (void)showNowInSuperView:(id)a3 atOrigin:(CGPoint)a4 withText:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  double y;
  double x;
  NSTimer *timer;
  _QWORD v13[7];

  v6 = a6;
  y = a4.y;
  x = a4.x;
  -[UIView setAlpha:](self, "setAlpha:", 1.0);
  if (a5)
    -[UIWebPDFLabelView setText:](self, "setText:", a5);
  if (-[UIView superview](self, "superview") == a3)
    objc_msgSend(a3, "bringSubviewToFront:", self);
  else
    objc_msgSend(a3, "addSubview:", self);
  v13[1] = 3221225472;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __67__UIWebPDFLabelView_showNowInSuperView_atOrigin_withText_animated___block_invoke_2;
  v13[3] = &unk_1E16ECDA0;
  v13[4] = self;
  *(double *)&v13[5] = x + 20.0;
  *(double *)&v13[6] = y + 20.0;
  +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v6, &__block_literal_global_690, v13, 0);
  -[UIWebPDFLabelView _fadeOutDelay](self, "_fadeOutDelay");
  timer = self->_timer;
  if (timer)
    -[NSTimer setFireDate:](timer, "setFireDate:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:"));
  else
    self->_timer = (NSTimer *)(id)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_fadeOut, 0, 1);
}

uint64_t __67__UIWebPDFLabelView_showNowInSuperView_atOrigin_withText_animated___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, a2, a3, 0.3, 0.0);
}

uint64_t __67__UIWebPDFLabelView_showNowInSuperView_atOrigin_withText_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrameOrigin:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_fadeOutAnimationDidStop
{
  -[UIView removeFromSuperview](self, "removeFromSuperview");

}

- (void)fadeOut
{
  UIWebPDFLabelView *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  if (-[UIWebPDFLabelView isTimerInstalled](self, "isTimerInstalled"))
  {
    v3 = self;
    -[UIWebPDFLabelView clearTimer](self, "clearTimer");
    -[UIWebPDFLabelView _fadeOutDuration](self, "_fadeOutDuration");
    v4[4] = self;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __28__UIWebPDFLabelView_fadeOut__block_invoke;
    v5[3] = &unk_1E16B41B8;
    v5[4] = self;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __28__UIWebPDFLabelView_fadeOut__block_invoke_2;
    v4[3] = &unk_1E16E8700;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v5, v4);
  }
}

uint64_t __28__UIWebPDFLabelView_fadeOut__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __28__UIWebPDFLabelView_fadeOut__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fadeOutAnimationDidStop");
}

- (void)_makeRoundedCorners
{
  double v3;
  _QWORD *ContextStack;
  CGContext *v5;
  id ImageFromCurrentImageContext;
  UIView *v7;
  UIImageView *v8;
  CGRect v9;

  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  _UIGraphicsBeginImageContextWithOptions(0, 0, 16.0, 16.0, v3);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v5 = 0;
  else
    v5 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSaveGState(v5);
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = 16.0;
  v9.size.height = 16.0;
  CGContextAddRect(v5, v9);
  CGContextAddPath(v5, -[UIBezierPath CGPath](+[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, 0.0, 0.0, 16.0, 16.0, 7.0, 7.0), "CGPath"));
  CGContextEOClip(v5);
  UIRectFillUsingOperation(1, 0.0, 0.0, 16.0, 16.0);
  CGContextRestoreGState(v5);
  ImageFromCurrentImageContext = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();
  v7 = -[_UIBackdropView contentView](self->_backdropView, "contentView");
  v8 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", objc_msgSend(ImageFromCurrentImageContext, "resizableImageWithCapInsets:", 7.0, 7.0, 7.0, 7.0));
  -[UIView setAlpha:](v8, "setAlpha:", 0.0);
  -[UIView _setBackdropMaskViewFlags:](v8, "_setBackdropMaskViewFlags:", 7);
  -[UIView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
  -[UIView bounds](v7, "bounds");
  -[UIImageView setFrame:](v8, "setFrame:");
  -[UIView addSubview:](v7, "addSubview:", v8);

}

- (unint64_t)currentPageIndex
{
  return self->currentPageIndex;
}

- (void)setCurrentPageIndex:(unint64_t)a3
{
  self->currentPageIndex = a3;
}

@end
