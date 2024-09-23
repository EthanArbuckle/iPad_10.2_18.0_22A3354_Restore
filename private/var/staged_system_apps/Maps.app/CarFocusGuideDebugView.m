@implementation CarFocusGuideDebugView

- (CarFocusGuideDebugView)initWithDirection:(unint64_t)a3
{
  double y;
  double width;
  double height;
  CarFocusGuideDebugView *v7;
  CarFocusGuideDebugView *v8;
  UILabel *v9;
  UILabel *directionLabel;
  void *v11;
  id v12;
  _QWORD *v13;
  void (**v14)(_QWORD, _QWORD);
  __CFString *v15;
  void *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;

  v19.receiver = self;
  v19.super_class = (Class)CarFocusGuideDebugView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[CarFocusGuideDebugView initWithFrame:](&v19, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = v7;
  if (v7)
  {
    v7->_direction = a3;
    v9 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    directionLabel = v8->_directionLabel;
    v8->_directionLabel = v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_directionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (a3)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x2020000000;
      v24 = 0;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10076C9E4;
      v20[3] = &unk_1011C5EC8;
      v12 = v11;
      v21 = v12;
      v22 = v23;
      v13 = objc_retainBlock(v20);
      v14 = (void (**)(_QWORD, _QWORD))v13;
      if ((a3 & 1) != 0)
        ((void (*)(_QWORD *, const __CFString *))v13[2])(v13, CFSTR("Up"));
      if ((a3 & 2) != 0)
        ((void (**)(_QWORD, const __CFString *))v14)[2](v14, CFSTR("Down"));
      if ((a3 & 4) != 0)
        ((void (**)(_QWORD, const __CFString *))v14)[2](v14, CFSTR("Left"));
      if ((a3 & 8) != 0)
        ((void (**)(_QWORD, const __CFString *))v14)[2](v14, CFSTR("Right"));
      if ((a3 & 0x20) != 0)
        ((void (**)(_QWORD, const __CFString *))v14)[2](v14, CFSTR("Previous"));
      if ((a3 & 0x10) != 0)
        ((void (**)(_QWORD, const __CFString *))v14)[2](v14, CFSTR("Next"));
      v15 = (__CFString *)v12;

      _Block_object_dispose(v23, 8);
    }
    else
    {
      v15 = CFSTR("None");
    }
    -[UILabel setText:](v8->_directionLabel, "setText:", v15);

    -[UILabel setTextAlignment:](v8->_directionLabel, "setTextAlignment:", 1);
    -[CarFocusGuideDebugView addSubview:](v8, "addSubview:", v8->_directionLabel);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel _maps_constraintsForCenteringInView:](v8->_directionLabel, "_maps_constraintsForCenteringInView:", v8));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    -[CarFocusGuideDebugView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuideDebugView layer](v8, "layer"));
    objc_msgSend(v17, "setBorderWidth:", 1.0);

    -[CarFocusGuideDebugView _updateColors](v8, "_updateColors");
  }
  return v8;
}

- (void)_updateColors
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  if ((-[CarFocusGuideDebugView isUserInteractionEnabled](self, "isUserInteractionEnabled") & 1) != 0)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuideDebugView _colorForDirection:](self, "_colorForDirection:", self->_direction));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v9 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorWithAlphaComponent:", 0.200000003));
  -[CarFocusGuideDebugView setBackgroundColor:](self, "setBackgroundColor:", v4);

  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", 0.300000012)));
  v6 = objc_msgSend(v5, "CGColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuideDebugView layer](self, "layer"));
  objc_msgSend(v7, "setBorderColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", 0.5));
  -[UILabel setTextColor:](self->_directionLabel, "setTextColor:", v8);

}

- (id)_colorForDirection:(unint64_t)a3
{
  void *v3;

  if (a3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkPinkColor](UIColor, "systemDarkPinkColor"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkPurpleColor](UIColor, "systemDarkPurpleColor"));
  return v3;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarFocusGuideDebugView;
  -[CarFocusGuideDebugView setUserInteractionEnabled:](&v4, "setUserInteractionEnabled:", a3);
  -[CarFocusGuideDebugView _updateColors](self, "_updateColors");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionLabel, 0);
}

@end
