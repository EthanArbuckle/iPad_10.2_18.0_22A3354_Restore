@implementation _UIDatePickerWheelsTimeLabel

+ (BOOL)supportsScribbleInteraction
{
  return 0;
}

- (_UIDatePickerWheelsTimeLabel)initWithTimeFormat:(id)a3 minuteInterval:(int64_t)a4
{
  _UIDatePickerWheelsTimeLabel *v4;
  UIView *v5;
  UIView *contentView;
  UIView *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  UILabel *hourLabel;
  UILabel *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  UILabel *minuteLabel;
  UILabel *v17;
  UILabel *v18;
  void *v19;
  UILabel *timeSeparatorLabel;
  UILabel *v21;
  UILabel *v22;
  void *v23;
  UILabel *measurementLabel;
  UILabel *v25;
  uint64_t v26;
  _UIControlEventsGestureRecognizer *controlEventsGestureRecognizer;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)_UIDatePickerWheelsTimeLabel;
  v4 = -[_UIDatePickerCalendarTimeLabel initWithTimeFormat:minuteInterval:](&v30, sel_initWithTimeFormat_minuteInterval_, a3, a4);
  if (v4)
  {
    v5 = (UIView *)objc_opt_new();
    -[UIView bounds](v4, "bounds");
    -[UIView setFrame:](v5, "setFrame:");
    -[UIView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v4, "addSubview:", v5);
    contentView = v4->_contentView;
    v4->_contentView = v5;
    v7 = v5;

    v8 = (UILabel *)objc_opt_new();
    -[UILabel setTextAlignment:](v8, "setTextAlignment:", 2);
    -[UILabel setAdjustsFontForContentSizeCategory:](v8, "setAdjustsFontForContentSizeCategory:", 1);
    +[UIColor labelColor](UIColor, "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    -[UILabel setShadowOffset:](v8, "setShadowOffset:", 0.0, 1.0);
    +[UIColor clearColor](UIColor, "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setShadowColor:](v8, "setShadowColor:", v10);

    -[UIView setHidden:](v8, "setHidden:", 1);
    -[UIView addSubview:](v7, "addSubview:", v8);
    hourLabel = v4->_hourLabel;
    v4->_hourLabel = v8;
    v12 = v8;

    v13 = (UILabel *)objc_opt_new();
    -[UILabel setTextAlignment:](v13, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](v13, "setAdjustsFontForContentSizeCategory:", 1);
    +[UIColor labelColor](UIColor, "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    -[UILabel setShadowOffset:](v13, "setShadowOffset:", 0.0, 1.0);
    +[UIColor clearColor](UIColor, "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setShadowColor:](v13, "setShadowColor:", v15);

    -[UIView setHidden:](v13, "setHidden:", 1);
    -[UIView addSubview:](v7, "addSubview:", v13);
    minuteLabel = v4->_minuteLabel;
    v4->_minuteLabel = v13;
    v17 = v13;

    v18 = (UILabel *)objc_opt_new();
    -[UILabel setTextAlignment:](v18, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](v18, "setAdjustsFontForContentSizeCategory:", 1);
    +[UIColor labelColor](UIColor, "labelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v18, "setTextColor:", v19);

    -[UIView setAlpha:](v18, "setAlpha:", 0.0);
    -[UIView sizeToFit](v18, "sizeToFit");
    -[UIView addSubview:](v7, "addSubview:", v18);
    timeSeparatorLabel = v4->_timeSeparatorLabel;
    v4->_timeSeparatorLabel = v18;
    v21 = v18;

    v22 = (UILabel *)objc_opt_new();
    -[UILabel setText:](v22, "setText:", CFSTR("00"));
    -[UILabel setShadowOffset:](v22, "setShadowOffset:", 0.0, 1.0);
    +[UIColor clearColor](UIColor, "clearColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setShadowColor:](v22, "setShadowColor:", v23);

    -[UIView setHidden:](v22, "setHidden:", 1);
    measurementLabel = v4->_measurementLabel;
    v4->_measurementLabel = v22;
    v25 = v22;

    v26 = objc_opt_new();
    controlEventsGestureRecognizer = v4->_controlEventsGestureRecognizer;
    v4->_controlEventsGestureRecognizer = (_UIControlEventsGestureRecognizer *)v26;

    -[_UIControlEventsGestureRecognizer setControlEventsDelegate:](v4->_controlEventsGestureRecognizer, "setControlEventsDelegate:", v4);
    -[UIView layer](v4, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHitTestsAsOpaque:", 1);

  }
  return v4;
}

- (int64_t)decrementBehaviour
{
  return 1;
}

- (void)controlEventsGestureRecognizer:(id)a3 recognizedControlEvent:(unint64_t)a4 withEvent:(id)a5
{
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _UIDatePickerWheelsTimeLabel *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  -[_UIDatePickerWheelsTimeLabel wheelsDelegate](self, "wheelsDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "wheelsTimeLabelShouldReceiveInteraction:", self);

  v9 = v17;
  if (!v8)
    goto LABEL_16;
  objc_msgSend(v17, "locationInView:", self);
  v12 = v10;
  v13 = v11;
  if ((uint64_t)a4 > 63)
  {
    if (a4 == 64)
    {
      -[_UIDatePickerWheelsTimeLabel setHighlightedForTouch:](self, "setHighlightedForTouch:", 0);
      -[_UIDatePickerCalendarTimeLabel didTapInputLabelAtLocation:](self, "didTapInputLabelAtLocation:", v12, v13);
      goto LABEL_15;
    }
    v9 = v17;
    if (a4 == 128 || a4 == 256)
    {
      -[_UIDatePickerWheelsTimeLabel setHighlightedForTouch:](self, "setHighlightedForTouch:", 0);
      objc_storeWeak((id *)&self->_touchHighlightedView, 0);
      -[_UIDatePickerWheelsTimeLabel setContentHidden:](self, "setContentHidden:", 1);
LABEL_15:
      v9 = v17;
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (a4 == 1)
  {
    -[_UIDatePickerWheelsTimeLabel _viewForHighlightedTouchAtPoint:](self, "_viewForHighlightedTouchAtPoint:", v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_touchHighlightedView, v16);

    -[_UIDatePickerWheelsTimeLabel setContentHidden:](self, "setContentHidden:", 0);
    goto LABEL_12;
  }
  if (a4 == 16)
  {
LABEL_12:
    v14 = self;
    v15 = 1;
    goto LABEL_13;
  }
  v9 = v17;
  if (a4 == 32)
  {
    v14 = self;
    v15 = 0;
LABEL_13:
    -[_UIDatePickerWheelsTimeLabel setHighlightedForTouch:](v14, "setHighlightedForTouch:", v15);
    goto LABEL_15;
  }
LABEL_16:

}

- (void)setHighlightedForTouch:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;
  _BOOL4 v6;
  double v7;
  id v8;
  _QWORD v9[4];
  id v10;
  double v11;

  if (self->_highlightedForTouch != a3)
  {
    v3 = a3;
    self->_highlightedForTouch = a3;
    v4 = objc_loadWeakRetained((id *)&self->_touchHighlightedView);
    objc_msgSend(v4, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle") == 2;

    v7 = dbl_186679260[v6];
    if (!v3)
      v7 = 1.0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = ___UIDateLabelAnimateHighlight_block_invoke_1;
    v9[3] = &unk_1E16B1888;
    v10 = v4;
    v11 = v7;
    v8 = v4;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327684, v9, 0, 0.47, 0.0);

  }
}

- (id)_viewForHighlightedTouchAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  CGPoint v12;
  CGPoint v13;
  CGRect v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  if (!-[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope"))
    goto LABEL_6;
  -[_UIDatePickerWheelsTimeLabel hourLabel](self, "hourLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v12.x = x;
  v12.y = y;
  v7 = CGRectContainsPoint(v14, v12);

  if (!v7)
  {
    -[_UIDatePickerWheelsTimeLabel minuteLabel](self, "minuteLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v13.x = x;
    v13.y = y;
    v10 = CGRectContainsPoint(v15, v13);

    if (v10)
    {
      -[_UIDatePickerWheelsTimeLabel minuteLabel](self, "minuteLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    }
LABEL_6:
    -[_UIDatePickerWheelsTimeLabel contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    return v8;
  }
  -[_UIDatePickerWheelsTimeLabel hourLabel](self, "hourLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (void)setContentHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  _QWORD v12[5];
  BOOL v13;

  v3 = a3;
  -[_UIDatePickerWheelsTimeLabel hourLabel](self, "hourLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if (v6 != v3)
  {
    -[_UIDatePickerWheelsTimeLabel hourLabel](self, "hourLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v3);

    -[_UIDatePickerWheelsTimeLabel minuteLabel](self, "minuteLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", v3);

    v9 = 0.1;
    if (v3)
      v9 = 0.14;
    v10 = 0.12;
    if (v3)
      v10 = 0.0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49___UIDatePickerWheelsTimeLabel_setContentHidden___block_invoke;
    v12[3] = &unk_1E16B1B78;
    v12[4] = self;
    v13 = v3;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v12, 0, v9, v10);
    -[_UIDatePickerWheelsTimeLabel wheelsDelegate](self, "wheelsDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wheelsTimeLabel:didChangeVisibility:", self, v3 ^ 1);

  }
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIDatePickerWheelsTimeLabel hourLabel](self, "hourLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[_UIDatePickerWheelsTimeLabel minuteLabel](self, "minuteLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v4);

  objc_msgSend(v4, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)off_1E167DBE8;
  v8 = *(_QWORD *)off_1E167DC18;
  v15[0] = *(_QWORD *)off_1E167DC20;
  v15[1] = v8;
  v16[0] = &unk_1E1A9A6E0;
  v16[1] = &unk_1E1A9A6F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v12, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDatePickerWheelsTimeLabel timeSeparatorLabel](self, "timeSeparatorLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v13);

  -[UILabel setFont:](self->_measurementLabel, "setFont:", v4);
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (id)font
{
  void *v2;
  void *v3;

  -[_UIDatePickerWheelsTimeLabel hourLabel](self, "hourLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)hourRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[_UIDatePickerWheelsTimeLabel hourLabel](self, "hourLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)minuteRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[_UIDatePickerWheelsTimeLabel minuteLabel](self, "minuteLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)pushCurrentStateIntoUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double x;
  double y;
  double height;
  double width;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double MinX;
  void *v32;
  double v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double MinY;
  double MaxX;
  _OWORD v63[3];
  __int128 v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v64 = 0u;
  memset(v63, 0, sizeof(v63));
  -[_UIDatePickerCalendarTimeLabel attributedTextWithRanges:](self, "attributedTextWithRanges:", v63);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedSubstringFromRange:", v64);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerWheelsTimeLabel hourLabel](self, "hourLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

  objc_msgSend(v3, "attributedSubstringFromRange:", v63[1]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerWheelsTimeLabel minuteLabel](self, "minuteLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttributedText:", v6);

  -[_UIDatePickerWheelsTimeLabel hourLabel](self, "hourLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  x = self->_hoursReferenceFrame.origin.x;
  y = self->_hoursReferenceFrame.origin.y;
  width = self->_hoursReferenceFrame.size.width;
  height = self->_hoursReferenceFrame.size.height;
  objc_msgSend(v8, "textRectForBounds:limitedToNumberOfLines:", 1);
  v14 = fmax(width, v13);

  -[_UIDatePickerWheelsTimeLabel minuteLabel](self, "minuteLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  v16 = self->_minutesReferenceFrame.origin.y;
  v17 = self->_minutesReferenceFrame.size.width;
  v18 = self->_minutesReferenceFrame.size.height;
  objc_msgSend(v15, "textRectForBounds:limitedToNumberOfLines:", 1);
  v20 = fmax(v17, v19);

  -[_UIDatePickerWheelsTimeLabel hourLabel](self, "hourLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", x, y, v14, height);

  v22 = round(self->_minutesReferenceFrame.origin.x + (self->_minutesReferenceFrame.size.width - v20) * 0.5);
  -[_UIDatePickerWheelsTimeLabel minuteLabel](self, "minuteLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v22, v16, v20, v18);

  v24 = v64;
  if ((unint64_t)v64 >= *(_QWORD *)&v63[1])
    v25 = (char *)&v63[1] + 8;
  else
    v25 = (char *)&v64 + 8;
  v26 = *(_QWORD *)v25;
  if ((unint64_t)v64 >= *(_QWORD *)&v63[1])
    v27 = *(_QWORD *)&v63[1];
  else
    v27 = v64;
  if ((unint64_t)v64 <= *(_QWORD *)&v63[1])
    v24 = *(_QWORD *)&v63[1];
  objc_msgSend(v3, "attributedSubstringFromRange:", v26 + v27, v24 - (v26 + v27));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerWheelsTimeLabel timeSeparatorLabel](self, "timeSeparatorLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAttributedText:", v28);

  -[_UIDatePickerWheelsTimeLabel hourLabel](self, "hourLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "frame");
  MinX = CGRectGetMinX(v65);
  -[_UIDatePickerWheelsTimeLabel minuteLabel](self, "minuteLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "frame");
  v33 = CGRectGetMinX(v66);

  if (MinX < v33)
  {
    -[_UIDatePickerWheelsTimeLabel hourLabel](self, "hourLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "frame");
    v36 = v44;
    v38 = v45;
    v40 = v46;
    v42 = v47;

    -[_UIDatePickerWheelsTimeLabel minuteLabel](self, "minuteLabel");
  }
  else
  {
    -[_UIDatePickerWheelsTimeLabel minuteLabel](self, "minuteLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "frame");
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;

    -[_UIDatePickerWheelsTimeLabel hourLabel](self, "hourLabel");
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "frame");
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;

  v67.origin.x = v36;
  v67.origin.y = v38;
  v67.size.width = v40;
  v67.size.height = v42;
  MaxX = CGRectGetMaxX(v67);
  v68.origin.x = v36;
  v68.origin.y = v38;
  v68.size.width = v40;
  v68.size.height = v42;
  MinY = CGRectGetMinY(v68);
  v69.origin.x = v50;
  v69.origin.y = v52;
  v69.size.width = v54;
  v69.size.height = v56;
  v57 = CGRectGetMinX(v69);
  v70.origin.x = v36;
  v70.origin.y = v38;
  v70.size.width = v40;
  v70.size.height = v42;
  v58 = v57 - CGRectGetMaxX(v70);
  v71.origin.x = v36;
  v71.origin.y = v38;
  v71.size.width = v40;
  v71.size.height = v42;
  v59 = CGRectGetHeight(v71);
  -[_UIDatePickerWheelsTimeLabel timeSeparatorLabel](self, "timeSeparatorLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setFrame:", MaxX, MinY, v58, v59);

}

- (BOOL)displaysTimeOfDayLabel
{
  return 0;
}

- (void)stateMachineUpdateFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerWheelsTimeLabel;
  -[_UIDatePickerCalendarTimeLabel stateMachineUpdateFromState:toState:](&v6, sel_stateMachineUpdateFromState_toState_, a3);
  -[_UIDatePickerWheelsTimeLabel setContentHidden:](self, "setContentHidden:", a4 - 10 < 0xFFFFFFFFFFFFFFF8);
}

- (void)beginEditingWheels
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDatePickerWheelsTimeLabel;
  -[_UIDatePickerCalendarTimeLabel beginEditingWheels](&v3, sel_beginEditingWheels);
  -[_UIDatePickerWheelsTimeLabel setWheelsActive:](self, "setWheelsActive:", 1);
}

- (void)endEditingWheels
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDatePickerWheelsTimeLabel;
  -[_UIDatePickerCalendarTimeLabel endEditingWheels](&v3, sel_endEditingWheels);
  -[_UIDatePickerWheelsTimeLabel setWheelsActive:](self, "setWheelsActive:", 0);
}

- (void)updateHoursFromDatePicker:(int64_t)a3 wheelsChanged:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;

  v4 = a4;
  -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "clock");

  if (v8)
  {
    if (v8 == 3)
    {
      if (!a3)
        a3 = 24;
    }
    else if (v8 == 1)
    {
      v9 = a3 % 0xCuLL;
      if (a3 <= 11)
        v9 = a3;
      if (v9)
        a3 = v9;
      else
        a3 = 12;
    }
  }
  else if (a3 >= 12)
  {
    a3 %= 0xCuLL;
  }
  -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHourValue:", a3);

  if (v4)
    -[_UIDatePickerCalendarTimeLabel wheelChanged](self, "wheelChanged");
  else
    -[_UIDatePickerWheelsTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");
}

- (void)updateMinutesFromDatePicker:(int64_t)a3 wheelsChanged:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;

  v4 = a4;
  -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMinuteValue:", a3);

  if (v4)
    -[_UIDatePickerCalendarTimeLabel wheelChanged](self, "wheelChanged");
  else
    -[_UIDatePickerWheelsTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");
}

- (BOOL)_treatMinutesAsHoursForState:(unint64_t)a3
{
  return 0;
}

- (void)willBeginWritingInScribbleInteraction
{
  void *v3;
  id v4;

  -[_UIDatePickerWheelsTimeLabel hourLabel](self, "hourLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", 0);

  -[_UIDatePickerWheelsTimeLabel minuteLabel](self, "minuteLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", 0);

}

- (void)configureLabelsForHour:(id *)a3 minute:(id *)a4
{
  int64_t var2;
  void *v8;
  UILabel *measurementLabel;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  int64_t v22;
  void *v23;
  UILabel *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  $A7DAFEFF4FDF007120A996603470390F v37;

  var2 = a3->var2;
  -[_UIDatePickerWheelsTimeLabel hourLabel](self, "hourLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextAlignment:", var2);

  measurementLabel = self->_measurementLabel;
  -[UIView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v37 = *a3;
  self->_hoursReferenceFrame.origin.x = _labelFrame(measurementLabel, (uint64_t)&v37, v11, v13, v15, v17, v18);
  self->_hoursReferenceFrame.origin.y = v19;
  self->_hoursReferenceFrame.size.width = v20;
  self->_hoursReferenceFrame.size.height = v21;
  v22 = a4->var2;
  -[_UIDatePickerWheelsTimeLabel minuteLabel](self, "minuteLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTextAlignment:", v22);

  v24 = self->_measurementLabel;
  -[UIView bounds](self, "bounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v37 = *a4;
  self->_minutesReferenceFrame.origin.x = _labelFrame(v24, (uint64_t)&v37, v26, v28, v30, v32, v33);
  self->_minutesReferenceFrame.origin.y = v34;
  self->_minutesReferenceFrame.size.width = v35;
  self->_minutesReferenceFrame.size.height = v36;
  -[_UIDatePickerWheelsTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");
}

- (CGRect)combinedTextRectFromLabels
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  double width;
  double v8;
  CGFloat v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  CGRect v17;
  CGRect v19;

  -[_UIDatePickerWheelsTimeLabel hourLabel](self, "hourLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  x = self->_hoursReferenceFrame.origin.x;
  y = self->_hoursReferenceFrame.origin.y;
  width = self->_hoursReferenceFrame.size.width;
  height = self->_hoursReferenceFrame.size.height;
  objc_msgSend(v3, "textRectForBounds:limitedToNumberOfLines:", 1);
  v9 = fmax(width, v8);

  -[_UIDatePickerWheelsTimeLabel minuteLabel](self, "minuteLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  v11 = self->_minutesReferenceFrame.origin.x;
  v12 = self->_minutesReferenceFrame.origin.y;
  v14 = self->_minutesReferenceFrame.size.width;
  v13 = self->_minutesReferenceFrame.size.height;
  objc_msgSend(v10, "textRectForBounds:limitedToNumberOfLines:", 1);
  v16 = fmax(v14, v15);

  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = v9;
  v17.size.height = height;
  v19.origin.x = v11;
  v19.origin.y = v12;
  v19.size.width = v16;
  v19.size.height = v13;
  return CGRectUnion(v17, v19);
}

- (_UIControlEventsGestureRecognizer)controlEventsGestureRecognizer
{
  return self->_controlEventsGestureRecognizer;
}

- (_UIDatePickerWheelsTimeLabelDelegate)wheelsDelegate
{
  return (_UIDatePickerWheelsTimeLabelDelegate *)objc_loadWeakRetained((id *)&self->_wheelsDelegate);
}

- (void)setWheelsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_wheelsDelegate, a3);
}

- (BOOL)wheelsActive
{
  return self->_wheelsActive;
}

- (void)setWheelsActive:(BOOL)a3
{
  self->_wheelsActive = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UILabel)hourLabel
{
  return self->_hourLabel;
}

- (UILabel)minuteLabel
{
  return self->_minuteLabel;
}

- (UILabel)timeSeparatorLabel
{
  return self->_timeSeparatorLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeSeparatorLabel, 0);
  objc_storeStrong((id *)&self->_minuteLabel, 0);
  objc_storeStrong((id *)&self->_hourLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_wheelsDelegate);
  objc_storeStrong((id *)&self->_controlEventsGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_touchHighlightedView);
  objc_storeStrong((id *)&self->_measurementLabel, 0);
}

@end
