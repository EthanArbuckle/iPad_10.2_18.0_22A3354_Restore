@implementation UIProgressHUD

- (UIProgressHUD)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIProgressHUD *v7;
  UIProgressHUD *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIActivityIndicatorView *v13;
  UILabel *v14;
  UILabel *v15;
  char v16;
  objc_super v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18.receiver = self;
  v18.super_class = (Class)UIProgressHUD;
  v7 = -[UIView initWithFrame:](&v18, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[UIView setOpaque:](v7, "setOpaque:", 0);
    -[UIView setNeedsDisplayOnBoundsChange:](v8, "setNeedsDisplayOnBoundsChange:", 1);
    v9 = *MEMORY[0x1E0C9D538];
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    +[UIActivityIndicatorView defaultSizeForStyle:](UIActivityIndicatorView, "defaultSizeForStyle:", 101);
    v13 = -[UIActivityIndicatorView initWithFrame:]([UIActivityIndicatorView alloc], "initWithFrame:", v9, v10, v11, v12);
    v8->_progressIndicator = v13;
    -[UIActivityIndicatorView setActivityIndicatorViewStyle:](v13, "setActivityIndicatorViewStyle:", 101);
    -[UIActivityIndicatorView setColor:](v8->_progressIndicator, "setColor:", +[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIView addSubview:](v8, "addSubview:", v8->_progressIndicator);
    v14 = [UILabel alloc];
    v15 = -[UILabel initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v8->_progressMessage = v15;
    -[UILabel setTextColor:](v15, "setTextColor:", +[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIView setBackgroundColor:](v8->_progressMessage, "setBackgroundColor:", 0);
    -[UIView setOpaque:](v8->_progressMessage, "setOpaque:", 0);
    -[UILabel setNumberOfLines:](v8->_progressMessage, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v8->_progressMessage, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v8->_progressMessage, "setLineBreakMode:", 0);
    -[UIView addSubview:](v8, "addSubview:", v8->_progressMessage);
    -[UIProgressHUD setText:](v8, "setText:", 0);
    -[UIProgressHUD setFontSize:](v8, "setFontSize:", 24);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    if (CGRectIsEmpty(v19))
      v16 = 2;
    else
      v16 = 6;
    *(_BYTE *)&v8->_progressHUDFlags = *(_BYTE *)&v8->_progressHUDFlags & 0xFB | v16;
  }
  return v8;
}

- (void)setText:(id)a3
{
  UILabel *progressMessage;

  progressMessage = self->_progressMessage;
  if (!a3)
    a3 = _UINSLocalizedStringWithDefaultValue(CFSTR("Loading"), CFSTR("Loading"));
  -[UILabel setText:](progressMessage, "setText:", a3);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowsText:(BOOL)a3
{
  _BOOL4 v3;
  char v5;

  v3 = a3;
  -[UIView setHidden:](self->_progressMessage, "setHidden:", !a3);
  if (v3)
    v5 = 2;
  else
    v5 = 0;
  *(_BYTE *)&self->_progressHUDFlags = *(_BYTE *)&self->_progressHUDFlags & 0xFD | v5;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setFontSize:(int)a3
{
  -[UILabel setFont:](self->_progressMessage, "setFont:", objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", *(_QWORD *)&a3, 24.0));
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)drawRect:(CGRect)a3
{
  id v3;

  -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = +[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadius:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1);
  -[UIColor set](+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.77), "set");
  objc_msgSend(v3, "fill");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double x;
  double y;
  double width;
  double height;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id *p_progressIndicator;
  void *progressIndicator;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;

  +[UIActivityIndicatorView defaultSizeForStyle:](UIActivityIndicatorView, "defaultSizeForStyle:", 101);
  v4 = v3;
  -[UIView frame](self, "frame");
  if ((*(_BYTE *)&self->_progressHUDFlags & 4) != 0)
  {
    v15 = v5;
    v16 = v6;
    -[UILabel textSizeForWidth:](self->_progressMessage, "textSizeForWidth:", v5 + -20.0);
    v13 = v17;
    v14 = v18;
  }
  else
  {
    v29 = v4;
    -[UIView bounds](-[UIView superview](self, "superview"), "bounds");
    v31 = CGRectInset(v30, 20.0, 20.0);
    x = v31.origin.x;
    y = v31.origin.y;
    width = v31.size.width;
    height = v31.size.height;
    -[UILabel textSizeForWidth:](self->_progressMessage, "textSizeForWidth:", v31.size.width + -20.0);
    v13 = v11;
    v14 = v12;
    if ((*(_BYTE *)&self->_progressHUDFlags & 2) != 0)
    {
      v19 = v11 + 20.0;
      if (width < v13 + 20.0)
        v19 = width;
      v15 = fmax(v19, 156.0);
      v20 = v29 + 26.0 + 8.0 + v12 + 25.0;
      if (height < v20)
        v20 = height;
      v16 = fmax(v20, 124.0);
    }
    else
    {
      v15 = 156.0;
      v16 = 124.0;
    }
    -[UIView setFrame:](self, "setFrame:", round(x + (width - v15) * 0.5), round(y + (height - v16) * 0.5), v15, v16);
    v4 = v29;
  }
  p_progressIndicator = (id *)&self->_progressIndicator;
  progressIndicator = self->_progressIndicator;
  if (progressIndicator || (p_progressIndicator = (id *)&self->_doneView, (progressIndicator = self->_doneView) != 0))
  {
    objc_msgSend(progressIndicator, "frame");
    v24 = round((v15 - v23) * 0.5);
    v26 = round((v16 - v25) * 0.5);
    if ((*(_BYTE *)&self->_progressHUDFlags & 2) != 0)
      v26 = 26.0;
    objc_msgSend(*p_progressIndicator, "setFrame:", v24, v26);
  }
  v27 = round((v15 - v13) * 0.5);
  v28 = v15 + -20.0;
  if (v13 < v15 + -20.0)
    v28 = v13;
  -[UILabel setFrame:](self->_progressMessage, "setFrame:", v27, v4 + 26.0 + 8.0, v28, v14);
}

- (void)showInView:(id)a3
{
  *(_BYTE *)&self->_progressHUDFlags |= 1u;
  objc_msgSend(a3, "addSubview:", self);
  -[UIActivityIndicatorView startAnimating](self->_progressIndicator, "startAnimating");
}

- (void)hide
{
  *(_BYTE *)&self->_progressHUDFlags &= ~1u;
  -[UIActivityIndicatorView stopAnimating](self->_progressIndicator, "stopAnimating");
  -[UIView removeFromSuperview](self, "removeFromSuperview");
}

- (void)done
{
  UIImageView *v3;

  -[UIView removeFromSuperview](self->_progressIndicator, "removeFromSuperview");

  self->_progressIndicator = 0;
  v3 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", _UIImageWithName(CFSTR("UIProgressHUDCheck.png")));
  self->_doneView = v3;
  -[UIView addSubview:](self, "addSubview:", v3);
  if ((*(_BYTE *)&self->_progressHUDFlags & 1) != 0)
    -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)dealloc
{
  objc_super v3;

  if ((*(_BYTE *)&self->_progressHUDFlags & 1) != 0)
    -[UIProgressHUD hide](self, "hide");
  -[UIView removeFromSuperview](self->_progressIndicator, "removeFromSuperview");

  -[UIView removeFromSuperview](self->_doneView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_progressMessage, "removeFromSuperview");

  v3.receiver = self;
  v3.super_class = (Class)UIProgressHUD;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (UIProgressHUD)initWithWindow:(id)a3
{
  UIProgressHUD *v4;

  v4 = -[UIView init](self, "init");
  if (v4)
    v4->_parentWindow = (UIWindow *)a3;
  return v4;
}

- (void)show:(BOOL)a3
{
  if (a3)
    -[UIProgressHUD showInView:](self, "showInView:", self->_parentWindow);
  else
    -[UIProgressHUD hide](self, "hide");
}

@end
