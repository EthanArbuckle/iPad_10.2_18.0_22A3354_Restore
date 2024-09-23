@implementation MTATimerIntervalPickerView

- (MTATimerIntervalPickerView)initWithFrame:(CGRect)a3
{
  MTATimerIntervalPickerView *v3;
  UIPickerView *v4;
  UIPickerView *timePicker;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTATimerIntervalPickerView;
  v3 = -[MTATimerIntervalPickerView initWithFrame:](&v7, "initWithFrame:", 0.0, 0.0, 320.0, 216.0);
  if (v3)
  {
    v4 = (UIPickerView *)objc_msgSend(objc_alloc((Class)UIPickerView), "initWithFrame:", 0.0, 0.0, 320.0, 216.0);
    timePicker = v3->_timePicker;
    v3->_timePicker = v4;

    -[UIPickerView setDataSource:](v3->_timePicker, "setDataSource:", v3);
    -[UIPickerView setDelegate:](v3->_timePicker, "setDelegate:", v3);
    -[MTATimerIntervalPickerView addSubview:](v3, "addSubview:", v3->_timePicker);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTATimerIntervalPickerView;
  -[MTATimerIntervalPickerView layoutSubviews](&v6, "layoutSubviews");
  -[MTATimerIntervalPickerView frame](self, "frame");
  v4 = v3 * 0.5 + -160.0;
  -[MTATimerIntervalPickerView frame](self, "frame");
  -[UIPickerView setFrame:](self->_timePicker, "setFrame:", v4, v5 * 0.5 + -108.0, 320.0, 216.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 320.0;
  v4 = 216.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 3;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  int64_t v4;

  v4 = 60;
  if ((unint64_t)a4 >= 3)
    v4 = 0;
  if (a4)
    return v4;
  else
    return 24;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v9;
  uint64_t v10;
  MTATimerIntervalPickerCell *v11;
  MTATimerIntervalPickerCell *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  NSAttributedStringKey v27;
  void *v28;

  v9 = a6;
  v10 = objc_opt_class(MTATimerIntervalPickerCell);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    v11 = (MTATimerIntervalPickerCell *)v9;
  else
    v11 = objc_alloc_init(MTATimerIntervalPickerCell);
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerCell textLabel](v11, "textLabel"));
  objc_msgSend(v13, "setTextAlignment:", 2);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 22.0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerCell textLabel](v12, "textLabel"));
  objc_msgSend(v15, "setFont:", v14);

  -[MTATimerIntervalPickerView pickerView:widthForComponent:](self, "pickerView:widthForComponent:", self->_timePicker, a5);
  v17 = v16;
  -[MTATimerIntervalPickerView pickerView:rowHeightForComponent:](self, "pickerView:rowHeightForComponent:", self->_timePicker, a5);
  -[MTATimerIntervalPickerCell setFrame:](v12, "setFrame:", 0.0, 0.0, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v20, 0));

  v22 = objc_alloc((Class)NSAttributedString);
  v27 = NSForegroundColorAttributeName;
  v28 = v19;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  v24 = objc_msgSend(v22, "initWithString:attributes:", v21, v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerCell textLabel](v12, "textLabel"));
  objc_msgSend(v25, "setAttributedText:", v24);

  return v12;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  -[MTATimerIntervalPickerView _updateLabels:](self, "_updateLabels:", 1, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView delegate](self, "delegate"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView delegate](self, "delegate"));
    v9 = objc_opt_respondsToSelector(v8, "pickerView:didChangeSelectedDuration:");

    if ((v9 & 1) != 0)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView delegate](self, "delegate"));
      -[MTATimerIntervalPickerView selectedDuration](self, "selectedDuration");
      objc_msgSend(v10, "pickerView:didChangeSelectedDuration:", self);

    }
  }
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  double v4;
  double result;

  -[UIPickerView bounds](self->_timePicker, "bounds", a3, a4);
  result = v4 / 3.0;
  if (v4 / 3.0 > 105.0)
    return 105.0;
  return result;
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  return 32.0;
}

- (void)_updateLabels:(BOOL)a3
{
  _BOOL8 v3;
  NSInteger v5;
  NSInteger v6;
  NSInteger v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  v5 = -[UIPickerView selectedRowInComponent:](self->_timePicker, "selectedRowInComponent:", 0);
  v6 = -[UIPickerView selectedRowInComponent:](self->_timePicker, "selectedRowInComponent:", 1);
  v7 = -[UIPickerView selectedRowInComponent:](self->_timePicker, "selectedRowInComponent:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView _hoursStringForHour:](self, "_hoursStringForHour:", v5));
  -[MTATimerIntervalPickerView _fadeLabelForComponent:toText:animated:](self, "_fadeLabelForComponent:toText:animated:", 0, v8, v3);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView _minutesStringForMinutes:](self, "_minutesStringForMinutes:", v6));
  -[MTATimerIntervalPickerView _fadeLabelForComponent:toText:animated:](self, "_fadeLabelForComponent:toText:animated:", 1, v9, v3);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView _secondsStringForSeconds:](self, "_secondsStringForSeconds:", v7));
  -[MTATimerIntervalPickerView _fadeLabelForComponent:toText:animated:](self, "_fadeLabelForComponent:toText:animated:", 2, v10, v3);

}

- (id)_makeNewComponentLabel
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 17.0));
  objc_msgSend(v2, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
  objc_msgSend(v2, "setTextColor:", v4);

  objc_msgSend(v2, "setTextAlignment:", 4);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v2;
}

- (id)_labelForComponent:(int64_t)a3 createIfNecessary:(BOOL)a4
{
  UILabel **p_secondsLabel;
  UILabel *secondsLabel;
  BOOL v7;
  void *v8;
  MTATimerIntervalPickerView *v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;
  UILabel *v13;

  if (a3 == 2)
  {
    p_secondsLabel = &self->_secondsLabel;
    secondsLabel = self->_secondsLabel;
    if (secondsLabel)
      v11 = 1;
    else
      v11 = !a4;
    if (v11)
      goto LABEL_20;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView _secondsStringForSeconds:](self, "_secondsStringForSeconds:", 0, a4));
    v9 = self;
    v10 = 2;
    goto LABEL_19;
  }
  if (a3 == 1)
  {
    p_secondsLabel = &self->_minutesLabel;
    secondsLabel = self->_minutesLabel;
    if (secondsLabel)
      v12 = 1;
    else
      v12 = !a4;
    if (v12)
      goto LABEL_20;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView _minutesStringForMinutes:](self, "_minutesStringForMinutes:", 0, a4));
    v9 = self;
    v10 = 1;
    goto LABEL_19;
  }
  if (a3)
  {
    v13 = 0;
    return v13;
  }
  p_secondsLabel = &self->_hoursLabel;
  secondsLabel = self->_hoursLabel;
  if (secondsLabel)
    v7 = 1;
  else
    v7 = !a4;
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView _hoursStringForHour:](self, "_hoursStringForHour:", 0, a4));
    v9 = self;
    v10 = 0;
LABEL_19:
    -[MTATimerIntervalPickerView _fadeLabelForComponent:toText:animated:](v9, "_fadeLabelForComponent:toText:animated:", v10, v8, 0);

    secondsLabel = *p_secondsLabel;
  }
LABEL_20:
  v13 = secondsLabel;
  return v13;
}

- (void)_setLabel:(id)a3 forComponent:(int64_t)a4
{
  id v7;
  id v8;

  v7 = a3;
  if ((unint64_t)a4 <= 2)
  {
    v8 = v7;
    objc_storeStrong((id *)((char *)&self->super.super.super.super.isa + *(&off_10009A040)[a4]), a3);
    v7 = v8;
  }

}

- (void)_positionLabel:(id)a3 forComponent:(int64_t)a4
{
  id v6;
  unsigned int v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v6 = a3;
  v7 = -[MTATimerIntervalPickerView mtui_isRTL](self, "mtui_isRTL");
  if (a4 == 2)
  {
    v10 = v7 == 0;
    v8 = 271.0;
    v11 = 283.0;
  }
  else if (a4 == 1)
  {
    v10 = v7 == 0;
    v8 = 161.0;
    v11 = 173.0;
  }
  else
  {
    v9 = 0.0;
    if (a4)
      goto LABEL_10;
    v10 = v7 == 0;
    v8 = 51.0;
    v11 = 69.0;
  }
  if (v10)
    v9 = v8;
  else
    v9 = v11;
LABEL_10:
  LODWORD(v8) = 1148846080;
  objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v8);
  LODWORD(v12) = 1148846080;
  objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIPickerView leadingAnchor](self->_timePicker, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, v9));
  v20[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerYAnchor"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIPickerView centerYAnchor](self->_timePicker, "centerYAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 1.0));
  v20[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

}

- (void)_fadeLabelForComponent:(int64_t)a3 toText:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView _labelForComponent:createIfNecessary:](self, "_labelForComponent:createIfNecessary:", a3, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
  v11 = objc_msgSend(v10, "isEqualToString:", v8);

  v12 = v9;
  if ((v11 & 1) == 0)
  {
    if (v5)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView _makeNewComponentLabel](self, "_makeNewComponentLabel"));

      objc_msgSend(v13, "setText:", v8);
      -[MTATimerIntervalPickerView addSubview:](self, "addSubview:", v13);
      -[MTATimerIntervalPickerView _positionLabel:forComponent:](self, "_positionLabel:forComponent:", v13, a3);
      objc_msgSend(v13, "setAlpha:", 0.0);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100056BE4;
      v18[3] = &unk_100099320;
      v19 = v9;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100056BF0;
      v16[3] = &unk_100099878;
      v17 = v19;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v18, v16, 0.2, 0.0);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100056BF8;
      v14[3] = &unk_100099320;
      v12 = v13;
      v15 = v12;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v14, 0, 0.2, 0.0);

    }
    else
    {
      v12 = v9;
      if (!v9)
      {
        v12 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView _makeNewComponentLabel](self, "_makeNewComponentLabel"));
        -[MTATimerIntervalPickerView addSubview:](self, "addSubview:", v12);
      }
      objc_msgSend(v12, "setText:", v8);
      -[MTATimerIntervalPickerView _positionLabel:forComponent:](self, "_positionLabel:forComponent:", v12, a3);
    }
  }
  -[MTATimerIntervalPickerView _setLabel:forComponent:](self, "_setLabel:forComponent:", v12, a3);

}

- (BOOL)isSelectedDurationValid
{
  NSInteger v3;
  NSInteger v4;

  v3 = -[UIPickerView selectedRowInComponent:](self->_timePicker, "selectedRowInComponent:", 0);
  v4 = -[UIPickerView selectedRowInComponent:](self->_timePicker, "selectedRowInComponent:", 1);
  return (v3 | v4 | -[UIPickerView selectedRowInComponent:](self->_timePicker, "selectedRowInComponent:", 2)) != 0;
}

- (void)setDuration:(double)a3
{
  uint64_t v5;
  NSObject *v6;

  if (a3 < 0.0 || a3 > 86399.0)
  {
    v5 = MTLogForCategory(8, a2);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100065A18((uint64_t)self, v6, a3);

  }
  else
  {
    -[UIPickerView selectRow:inComponent:animated:](self->_timePicker, "selectRow:inComponent:animated:", (uint64_t)(a3 / 3600.0), 0, 0);
    -[UIPickerView selectRow:inComponent:animated:](self->_timePicker, "selectRow:inComponent:animated:", (int)(((__int16)((34953 * ((int)(uint64_t)a3 % 3600)) >> 16) >> 5)+ ((((int)(uint64_t)a3 % 3600 + ((-30583 * ((int)(uint64_t)a3 % 3600)) >> 16)) & 0x8000) >> 15)), 1, 0);
    -[UIPickerView selectRow:inComponent:animated:](self->_timePicker, "selectRow:inComponent:animated:", (uint64_t)a3 % 60, 2, 0);
    -[MTATimerIntervalPickerView _updateLabels:](self, "_updateLabels:", 1);
  }
}

- (double)selectedDuration
{
  double v3;
  double v4;

  v3 = (double)(3600 * -[UIPickerView selectedRowInComponent:](self->_timePicker, "selectedRowInComponent:", 0));
  v4 = v3 + (double)(60 * -[UIPickerView selectedRowInComponent:](self->_timePicker, "selectedRowInComponent:", 1));
  return v4 + (double)-[UIPickerView selectedRowInComponent:](self->_timePicker, "selectedRowInComponent:", 2);
}

- (id)_hoursStringForHour:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("hour[singular]");
  }
  else if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("hour[plural]");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("hour[zero]");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_10009A4D0, 0));

  return v6;
}

- (id)_minutesStringForMinutes:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("min[singular]");
  }
  else if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("min[plural]");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("min[zero]");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_10009A4D0, 0));

  return v6;
}

- (id)_secondsStringForSeconds:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("sec[singular]");
  }
  else if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("sec[plural]");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("sec[zero]");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_10009A4D0, 0));

  return v6;
}

- (MTATimerIntervalPickerViewDelegate)delegate
{
  return (MTATimerIntervalPickerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondsLabel, 0);
  objc_storeStrong((id *)&self->_minutesLabel, 0);
  objc_storeStrong((id *)&self->_hoursLabel, 0);
  objc_storeStrong((id *)&self->_timePicker, 0);
}

@end
