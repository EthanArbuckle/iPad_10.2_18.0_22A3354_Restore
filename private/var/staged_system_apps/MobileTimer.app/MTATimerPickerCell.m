@implementation MTATimerPickerCell

- (MTATimerPickerCell)initWithPicker:(id)a3 timeView:(id)a4 expectedTimeView:(id)a5 countdownView:(id)a6 reuseIdentifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MTATimerPickerCell *v17;
  MTATimerPickerCell *v18;
  void *v19;
  UIView *v20;
  UIView *pickerBackgroundView;
  UIView *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MTATimerPickerCell;
  v17 = -[MTATimerPickerCell initWithStyle:reuseIdentifier:](&v26, "initWithStyle:reuseIdentifier:", 0, a7);
  v18 = v17;
  if (v17)
  {
    -[MTATimerPickerCell setSelectionStyle:](v17, "setSelectionStyle:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPickerCell contentView](v18, "contentView"));
    objc_storeStrong((id *)&v18->_picker, a3);
    objc_storeStrong((id *)&v18->_timeView, a4);
    objc_storeStrong((id *)&v18->_countdownView, a6);
    objc_storeStrong((id *)&v18->_expectedTimeView, a5);
    v20 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    pickerBackgroundView = v18->_pickerBackgroundView;
    v18->_pickerBackgroundView = v20;

    v22 = v18->_pickerBackgroundView;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIView setBackgroundColor:](v22, "setBackgroundColor:", v23);

    objc_msgSend(v19, "addSubview:", v18->_pickerBackgroundView);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_foregroundColor](UIColor, "mtui_foregroundColor"));
    -[MTATimerPickerCell setBackgroundColor:](v18, "setBackgroundColor:", v24);

  }
  return v18;
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD *v5;
  void *v6;
  _QWORD v7[6];

  v4 = a4;
  self->_state = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000501AC;
  v7[3] = &unk_100099EF0;
  v7[4] = self;
  v7[5] = a3;
  v5 = objc_retainBlock(v7);
  v6 = v5;
  if (v4)
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.2);
  else
    ((void (*)(_QWORD *))v5[2])(v5);

}

- (void)setState:(unint64_t)a3
{
  -[MTATimerPickerCell setState:animated:](self, "setState:animated:", a3, 0);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  CGFloat width;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  +[UIPickerView defaultSizeForCurrentOrientation](UIPickerView, "defaultSizeForCurrentOrientation", a3.width, a3.height);
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double Height;
  CGFloat v38;
  objc_super v39;
  CGRect v40;
  CGRect v41;

  v39.receiver = self;
  v39.super_class = (Class)MTATimerPickerCell;
  -[MTATimerPickerCell layoutSubviews](&v39, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPickerCell contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIView setFrame:](self->_pickerBackgroundView, "setFrame:", v5, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView superview](self->_picker, "superview"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPickerCell contentView](self, "contentView"));

  if (v12 == v13)
  {
    -[MTATimerIntervalPickerView frame](self->_picker, "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = -[UIView bounds](self->_pickerBackgroundView, "bounds");
    v27 = UIRectCenteredIntegralRect(v22, v15, v17, v19, v21, v23, v24, v25, v26);
    -[MTATimerIntervalPickerView setFrame:](self->_picker, "setFrame:", v27, UIRoundToViewScale(1.5) + v28, v29, v30);
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_timeView, "superview"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPickerCell contentView](self, "contentView"));

  if (v31 == v32)
  {
    -[UILabel sizeToFit](self->_timeView, "sizeToFit");
    -[UILabel frame](self->_timeView, "frame");
    v34 = v33;
    v36 = v35;
    v40.origin.x = v5;
    v40.origin.y = v7;
    v40.size.width = v9;
    v40.size.height = v11;
    Height = CGRectGetHeight(v40);
    v41.origin.x = 16.0;
    v41.origin.y = v34;
    v41.size.width = v9 + -32.0;
    v41.size.height = v36;
    v38 = CGRectGetHeight(v41);
    -[UILabel setFrame:](self->_timeView, "setFrame:", 16.0, UIRoundToViewScale((Height - v38) * 0.5), v9 + -32.0, v36);
  }
}

- (MTATimerIntervalPickerView)picker
{
  return self->_picker;
}

- (UILabel)timeView
{
  return self->_timeView;
}

- (MTUITimerCountdownView)countdownView
{
  return self->_countdownView;
}

- (MTUIGlyphTimeView)expectedTimeView
{
  return self->_expectedTimeView;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedTimeView, 0);
  objc_storeStrong((id *)&self->_countdownView, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_picker, 0);
  objc_storeStrong((id *)&self->_pickerBackgroundView, 0);
}

@end
