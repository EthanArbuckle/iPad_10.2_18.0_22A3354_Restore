@implementation _UIKBRTFingerDetectionFingerFeedbackView

- (_UIKBRTFingerDetectionFingerFeedbackView)initWithFrame:(CGRect)a3
{
  _UIKBRTFingerDetectionFingerFeedbackView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKBRTFingerDetectionFingerFeedbackView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (UILabel)fingerLabel
{
  UILabel *fingerLabel;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;

  fingerLabel = self->_fingerLabel;
  if (!fingerLabel)
  {
    v4 = [UILabel alloc];
    v5 = -[UILabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_fingerLabel;
    self->_fingerLabel = v5;

    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_fingerLabel, "setBackgroundColor:", v7);

    -[UIView addSubview:](self, "addSubview:", self->_fingerLabel);
    fingerLabel = self->_fingerLabel;
  }
  return fingerLabel;
}

- (_UIKBRTFingerDetectionFingerCircleView)fingerDot
{
  _UIKBRTFingerDetectionFingerCircleView *fingerDot;
  _UIKBRTFingerDetectionFingerCircleView *v4;
  _UIKBRTFingerDetectionFingerCircleView *v5;
  _UIKBRTFingerDetectionFingerCircleView *v6;
  void *v7;

  fingerDot = self->_fingerDot;
  if (!fingerDot)
  {
    v4 = [_UIKBRTFingerDetectionFingerCircleView alloc];
    v5 = -[_UIKBRTFingerDetectionFingerCircleView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_fingerDot;
    self->_fingerDot = v5;

    +[UIColor purpleColor](UIColor, "purpleColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_fingerDot, "setBackgroundColor:", v7);

    -[UIView addSubview:](self, "addSubview:", self->_fingerDot);
    fingerDot = self->_fingerDot;
  }
  return fingerDot;
}

- (double)radius
{
  return self->_radiusInt * 1.25;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  float v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double MidX;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  CGRect v28;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIKBRTFingerDetectionFingerFeedbackView fingerLabel](self, "fingerLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;

  v14 = (v8 - v13) * 0.5;
  v15 = floorf(v14);
  -[_UIKBRTFingerDetectionFingerFeedbackView fingerLabel](self, "fingerLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "intrinsicContentSize");
  *(float *)&v17 = v17;
  v18 = ceilf(*(float *)&v17);
  *(float *)&v17 = v19;
  v20 = ceilf(*(float *)&v17);

  -[_UIKBRTFingerDetectionFingerFeedbackView fingerLabel](self, "fingerLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v15, 0.0, v18, v20);

  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  MidX = CGRectGetMidX(v28);
  -[_UIKBRTFingerDetectionFingerFeedbackView radius](self, "radius");
  v24 = MidX - v23;
  -[_UIKBRTFingerDetectionFingerFeedbackView radius](self, "radius");
  v26 = v25 + v25;
  -[_UIKBRTFingerDetectionFingerFeedbackView fingerDot](self, "fingerDot");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v24, v20 + 0.0, v26, v26);

}

- (void)centerOn:(CGPoint)a3 withRadius:(double)a4 andIdentifier:(unint64_t)a5
{
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGPoint *p_framelocation;
  BOOL v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float v27;
  float v28;
  float v29;
  float v30;
  double v31;
  id v32;

  y = a3.y;
  x = a3.x;
  if (qword_1ECD7AD70 != -1)
    dispatch_once(&qword_1ECD7AD70, &__block_literal_global_249_2);
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (void *)qword_1ECD7AD68;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR(" %@ "), v13);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  p_framelocation = &self->_framelocation;
  v15 = x == self->_framelocation.x && y == self->_framelocation.y;
  if (!v15
    || self->_radiusInt != a4
    || (-[_UIKBRTFingerDetectionFingerFeedbackView fingerLabel](self, "fingerLabel"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "text"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "isEqualToString:", v32),
        v17,
        v16,
        (v18 & 1) == 0))
  {
    p_framelocation->x = x;
    self->_framelocation.y = y;
    self->_radiusInt = a4;
    -[_UIKBRTFingerDetectionFingerFeedbackView fingerLabel](self, "fingerLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v32);

    -[_UIKBRTFingerDetectionFingerFeedbackView fingerLabel](self, "fingerLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "intrinsicContentSize");
    *(float *)&v21 = v21;
    v22 = ceilf(*(float *)&v21);
    *(float *)&v21 = v23;
    v24 = ceilf(*(float *)&v21);

    -[_UIKBRTFingerDetectionFingerFeedbackView radius](self, "radius");
    v26 = v25 + 1.0;
    v27 = (v22 + 1.0) * 0.5;
    v28 = floorf(v27);
    if (v26 >= v28)
    {
      v29 = v26;
      v30 = v29;
    }
    else
    {
      v30 = v28;
    }
    v31 = ceilf(v30);
    -[UIView setFrame:](self, "setFrame:", p_framelocation->x - v31, self->_framelocation.y - v31 - v24, v31 + v31, v31 + v31 + v24);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[_UIKBRTFingerDetectionFingerFeedbackView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setUnknownSeen:(BOOL)a3
{
  void *v4;
  void *v5;

  if (self->_unknownSeen != a3)
  {
    self->_unknownSeen = a3;
    if (a3)
      +[UIColor redColor](UIColor, "redColor");
    else
      +[UIColor purpleColor](UIColor, "purpleColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBRTFingerDetectionFingerFeedbackView fingerDot](self, "fingerDot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    -[_UIKBRTFingerDetectionFingerFeedbackView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setNeedsDisplay
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIKBRTFingerDetectionFingerFeedbackView;
  -[UIView setNeedsDisplay](&v4, sel_setNeedsDisplay);
  -[_UIKBRTFingerDetectionFingerFeedbackView fingerDot](self, "fingerDot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDisplay");

}

- (void)setFingerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_fingerLabel, a3);
}

- (void)setFingerDot:(id)a3
{
  objc_storeStrong((id *)&self->_fingerDot, a3);
}

- (BOOL)unknownSeen
{
  return self->_unknownSeen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerDot, 0);
  objc_storeStrong((id *)&self->_fingerLabel, 0);
}

@end
