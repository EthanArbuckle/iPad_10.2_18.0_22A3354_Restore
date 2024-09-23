@implementation MTSwitch

- (MTSwitch)initWithFrame:(CGRect)a3
{
  MTSwitch *v3;
  id v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *backgroundImageView;
  UIView *v9;
  UIView *thumbView;
  id v11;
  void *v12;
  void *v13;
  UIImageView *v14;
  UIImageView *thumbImageView;
  UIView *v16;
  UIImageView *v17;
  void *v18;
  double v19;
  double v20;
  objc_super v22;
  CGRect v23;
  CGRect v24;

  v22.receiver = self;
  v22.super_class = (Class)MTSwitch;
  v3 = -[MTSwitch initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UIImageView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("TunerSwitchWell")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resizableImageWithCapInsets:", 0.0, 7.0, 0.0, 7.0));
    v7 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v6);
    backgroundImageView = v3->_backgroundImageView;
    v3->_backgroundImageView = v7;

    v9 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    thumbView = v3->_thumbView;
    v3->_thumbView = v9;

    v11 = objc_alloc((Class)UIImageView);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("TunerSwitchKnob")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("TunerSwitchKnobPressed")));
    v14 = (UIImageView *)objc_msgSend(v11, "initWithImage:highlightedImage:", v12, v13);
    thumbImageView = v3->_thumbImageView;
    v3->_thumbImageView = v14;

    -[UIView setClipsToBounds:](v3->_thumbView, "setClipsToBounds:", 0);
    v16 = v3->_thumbView;
    -[UIImageView frame](v3->_thumbImageView, "frame");
    v24 = CGRectInset(v23, 2.0, 2.0);
    -[UIView setFrame:](v16, "setFrame:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
    v17 = v3->_thumbImageView;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](v17, "image"));
    objc_msgSend(v18, "size");
    -[UIImageView setFrame:](v17, "setFrame:", -1.0, -1.0, v19, v20);

    -[UIView addSubview:](v3->_thumbView, "addSubview:", v3->_thumbImageView);
    -[MTSwitch addSubview:](v3, "addSubview:", v3->_backgroundImageView);
    -[MTSwitch addSubview:](v3, "addSubview:", v3->_thumbView);
  }
  return v3;
}

- (void)layoutSubviews
{
  UIImageView *backgroundImageView;
  UIView *thumbView;

  backgroundImageView = self->_backgroundImageView;
  -[MTSwitch bounds](self, "bounds");
  -[UIImageView setFrame:](backgroundImageView, "setFrame:");
  thumbView = self->_thumbView;
  -[MTSwitch thumbRectForOn:](self, "thumbRectForOn:", self->_on);
  -[UIView setFrame:](thumbView, "setFrame:");
}

- (void)setOn:(BOOL)a3
{
  -[MTSwitch setOn:animated:](self, "setOn:animated:", a3, 0);
}

- (void)setOn:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD *v6;
  void *v7;
  _QWORD v8[5];

  v4 = a4;
  self->_on = a3;
  -[MTSwitch setNeedsLayout](self, "setNeedsLayout");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007A220;
  v8[3] = &unk_1004A6200;
  v8[4] = self;
  v6 = objc_retainBlock(v8);
  v7 = v6;
  if (v4)
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6, 0.200000003);
  else
    ((void (*)(_QWORD *))v6[2])(v6);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_backgroundImageView, "image", a3.width, a3.height));
  objc_msgSend(v3, "size");
  v5 = v4;

  v6 = 60.0;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  NSDate *v10;
  NSDate *trackingStartTime;

  self->_trackingOffset = 0.0;
  objc_msgSend(a3, "locationInView:", self, a4);
  self->_trackingStartLocation = v5;
  -[UIView frame](self->_thumbView, "frame");
  self->_startThumbRect.origin.x = v6;
  self->_startThumbRect.origin.y = v7;
  self->_startThumbRect.size.width = v8;
  self->_startThumbRect.size.height = v9;
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  trackingStartTime = self->_trackingStartTime;
  self->_trackingStartTime = v10;

  -[UIImageView setHighlighted:](self->_thumbImageView, "setHighlighted:", 1);
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  double v5;
  UIView *thumbView;

  objc_msgSend(a3, "locationInView:", self, a4);
  self->_trackingOffset = v5 - self->_trackingStartLocation;
  thumbView = self->_thumbView;
  -[MTSwitch thumbRectForOffset:](self, "thumbRectForOffset:");
  -[UIView setFrame:](thumbView, "setFrame:");
  -[UIImageView setHighlighted:](self->_thumbImageView, "setHighlighted:", 1);
  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  UIImageView *thumbImageView;
  id v6;
  double v7;
  double v8;
  _BOOL4 on;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  _BOOL8 v22;
  double MidX;
  CGRect v24;
  CGRect v25;

  thumbImageView = self->_thumbImageView;
  v6 = a3;
  -[UIImageView setHighlighted:](thumbImageView, "setHighlighted:", 0);
  objc_msgSend(v6, "locationInView:", self);
  v8 = v7;

  self->_trackingOffset = v8 - self->_trackingStartLocation;
  on = self->_on;
  -[MTSwitch thumbRectForOffset:](self, "thumbRectForOffset:");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = self->_startThumbRect.origin.x - v10;
  if (v18 < 0.0)
    v18 = -v18;
  if (v18 >= 8.0
    || (v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date")),
        objc_msgSend(v19, "timeIntervalSinceDate:", self->_trackingStartTime),
        v21 = v20,
        v19,
        v21 >= 0.5))
  {
    v24.origin.x = v11;
    v24.origin.y = v13;
    v24.size.width = v15;
    v24.size.height = v17;
    MidX = CGRectGetMidX(v24);
    -[MTSwitch bounds](self, "bounds");
    v22 = MidX >= CGRectGetWidth(v25) * 0.5;
  }
  else
  {
    v22 = !self->_on;
  }
  -[MTSwitch setOn:animated:](self, "setOn:animated:", v22, 1);
  if (on != self->_on)
    -[MTSwitch sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)cancelTrackingWithEvent:(id)a3
{
  _BOOL4 on;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double trackingOffset;
  void *v14;
  double v15;
  double v16;
  _BOOL8 v17;
  double MidX;
  CGRect v19;
  CGRect v20;

  -[UIImageView setHighlighted:](self->_thumbImageView, "setHighlighted:", 0);
  on = self->_on;
  -[MTSwitch thumbRectForOffset:](self, "thumbRectForOffset:", self->_trackingOffset);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  trackingOffset = self->_trackingOffset;
  if (trackingOffset < 0.0)
    trackingOffset = -trackingOffset;
  if (trackingOffset >= 8.0
    || (v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date")),
        objc_msgSend(v14, "timeIntervalSinceDate:", self->_trackingStartTime),
        v16 = v15,
        v14,
        v16 >= 0.5))
  {
    v19.origin.x = v6;
    v19.origin.y = v8;
    v19.size.width = v10;
    v19.size.height = v12;
    MidX = CGRectGetMidX(v19);
    -[MTSwitch bounds](self, "bounds");
    v17 = MidX >= CGRectGetWidth(v20) * 0.5;
  }
  else
  {
    v17 = !self->_on;
  }
  -[MTSwitch setOn:animated:](self, "setOn:animated:", v17, 1);
  if (on != self->_on)
    -[MTSwitch sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[MTSwitch bounds](self, "bounds", a4);
  v9 = CGRectInset(v8, -25.0, -25.0);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v9, v7);
}

- (void)swiped:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = objc_msgSend(a3, "direction");
  if (v4 == (id)1)
  {
    if (!self->_on)
    {
      v5 = 1;
      goto LABEL_8;
    }
  }
  else if (v4 == (id)2 && self->_on)
  {
    v5 = 0;
LABEL_8:
    -[MTSwitch setOn:animated:](self, "setOn:animated:", v5, 1);
  }
}

- (CGRect)thumbRectForOffset:(double)a3
{
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v6;
  double v7;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect result;

  y = self->_startThumbRect.origin.y;
  width = self->_startThumbRect.size.width;
  height = self->_startThumbRect.size.height;
  v6 = self->_startThumbRect.origin.x + a3;
  v7 = 0.0;
  if (v6 >= 0.0)
  {
    v14.origin.x = v6;
    v14.origin.y = self->_startThumbRect.origin.y;
    v14.size.width = self->_startThumbRect.size.width;
    v14.size.height = self->_startThumbRect.size.height;
    v9 = v6 + CGRectGetWidth(v14);
    -[MTSwitch frame](self, "frame");
    if (v9 >= CGRectGetWidth(v15))
    {
      -[MTSwitch frame](self, "frame");
      v10 = CGRectGetWidth(v16);
      v17.origin.x = v6;
      v17.origin.y = y;
      v17.size.width = width;
      v17.size.height = height;
      v7 = v10 - CGRectGetWidth(v17);
    }
    else
    {
      v7 = v6;
    }
  }
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v7;
  return result;
}

- (CGRect)thumbRectForOn:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double Width;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect result;

  v3 = a3;
  -[UIView frame](self->_thumbView, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = 0.0;
  if (v3)
  {
    -[MTSwitch bounds](self, "bounds", 0.0);
    Width = CGRectGetWidth(v16);
    v17.origin.y = 0.0;
    v17.origin.x = v6;
    v17.size.width = v8;
    v17.size.height = v10;
    v11 = Width - CGRectGetWidth(v17);
  }
  v13 = 0.0;
  v14 = v8;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v11;
  return result;
}

- (BOOL)isOn
{
  return self->_on;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingStartTime, 0);
  objc_storeStrong((id *)&self->_thumbView, 0);
  objc_storeStrong((id *)&self->_thumbImageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end
