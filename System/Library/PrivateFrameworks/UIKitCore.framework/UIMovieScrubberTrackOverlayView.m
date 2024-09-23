@implementation UIMovieScrubberTrackOverlayView

- (UIMovieScrubberTrackOverlayView)initWithFrame:(CGRect)a3
{
  UIMovieScrubberTrackOverlayView *v3;
  void *v4;
  UIImageView *v5;
  UIImageView *leftFillView;
  UIImageView *v7;
  UIImageView *rightFillView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIMovieScrubberTrackOverlayView;
  v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    _UIImageWithName(CFSTR("UIMovieScrubberFill.png"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v4);
    leftFillView = v3->_leftFillView;
    v3->_leftFillView = v5;

    -[UIImageView setContentMode:](v3->_leftFillView, "setContentMode:", 0);
    -[UIView setAlpha:](v3->_leftFillView, "setAlpha:", 0.0);
    -[UIView addSubview:](v3, "addSubview:", v3->_leftFillView);
    v7 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v4);
    rightFillView = v3->_rightFillView;
    v3->_rightFillView = v7;

    -[UIImageView setContentMode:](v3->_rightFillView, "setContentMode:", 0);
    -[UIView setAlpha:](v3->_rightFillView, "setAlpha:", 0.0);
    -[UIView addSubview:](v3, "addSubview:", v3->_rightFillView);
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);

  }
  return v3;
}

- (void)_updateLeftFill
{
  if ((*((_BYTE *)self + 476) & 1) != 0)
  {
    -[UIView bounds](self, "bounds");
    -[UIImageView setFrame:](self->_leftFillView, "setFrame:");
  }
}

- (void)_updateRightFill
{
  double v3;
  double maximumValue;
  double minimumValue;
  double v6;
  double endValue;
  float v8;
  float v9;

  if ((*((_BYTE *)self + 476) & 1) != 0)
  {
    -[UIView bounds](self, "bounds");
    maximumValue = self->_maximumValue;
    minimumValue = self->_minimumValue;
    v6 = 0.0;
    if (maximumValue != minimumValue)
    {
      endValue = self->_endValue;
      if (maximumValue < endValue)
        endValue = self->_maximumValue;
      v8 = endValue;
      v6 = (maximumValue - v8) / (maximumValue - minimumValue);
    }
    v9 = v3 * v6;
    -[UIImageView setFrame:](self->_rightFillView, "setFrame:", v3 - rintf(v9));
  }
}

- (void)animateFillFramesAway
{
  double v3;
  double v4;

  -[UIView frame](self->_leftFillView, "frame");
  -[UIImageView setFrame:](self->_leftFillView, "setFrame:");
  -[UIView frame](self->_rightFillView, "frame");
  -[UIImageView setFrame:](self->_rightFillView, "setFrame:", v3 + v4);
  *((_BYTE *)self + 476) &= ~1u;
}

- (void)_clampValueAndLayout
{
  double value;
  double minimumValue;
  double maximumValue;

  value = self->_value;
  minimumValue = self->_minimumValue;
  if (value < minimumValue)
  {
    self->_value = minimumValue;
    value = minimumValue;
  }
  maximumValue = self->_maximumValue;
  if (value > maximumValue)
    self->_value = maximumValue;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setEditing:(BOOL)a3
{
  char v3;
  UIImageView *rightFillView;
  double v6;
  double v7;

  v3 = *((_BYTE *)self + 476);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((_BYTE *)self + 476) = v3 & 0xFE | a3;
    rightFillView = self->_rightFillView;
    if (a3)
      v6 = 1.0;
    else
      v6 = 0.0;
    -[UIView setAlpha:](rightFillView, "setAlpha:", v6);
    if ((*((_BYTE *)self + 476) & 1) != 0)
      v7 = 1.0;
    else
      v7 = 0.0;
    -[UIView setAlpha:](self->_leftFillView, "setAlpha:", v7);
    -[UIMovieScrubberTrackOverlayView _clampValueAndLayout](self, "_clampValueAndLayout");
  }
}

- (void)setValue:(double)a3
{
  if (self->_value != a3)
  {
    self->_value = a3;
    -[UIMovieScrubberTrackOverlayView _clampValueAndLayout](self, "_clampValueAndLayout");
  }
}

- (void)setStartValue:(double)a3
{
  if (self->_startValue != a3)
  {
    self->_startValue = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEndValue:(double)a3
{
  if (self->_endValue != a3)
  {
    self->_endValue = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMinimumValue:(double)a3
{
  if (self->_minimumValue != a3)
    self->_minimumValue = a3;
}

- (void)setMaximumValue:(double)a3
{
  if (self->_maximumValue != a3)
    self->_maximumValue = a3;
}

- (void)setIsZoomed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 476) = *((_BYTE *)self + 476) & 0xFD | v3;
}

- (void)setEditingHandle:(int)a3
{
  self->_editingHandle = a3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIMovieScrubberTrackOverlayView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIMovieScrubberTrackOverlayView _updateLeftFill](self, "_updateLeftFill");
  -[UIMovieScrubberTrackOverlayView _updateRightFill](self, "_updateRightFill");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightFillView, 0);
  objc_storeStrong((id *)&self->_leftFillView, 0);
}

@end
