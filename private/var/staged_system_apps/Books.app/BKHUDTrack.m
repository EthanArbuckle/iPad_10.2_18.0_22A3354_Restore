@implementation BKHUDTrack

- (id)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack textLabel](self, "textLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!v12
    || (v4 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v12, v4) & 1) != 0)
    || (v5 = objc_opt_class(NSAttributedString), (objc_opt_isKindOfClass(v12, v5) & 1) != 0))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack textLabel](self, "textLabel"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
    if (v7 == v12)
    {

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack textLabel](self, "textLabel"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
      v10 = objc_msgSend(v9, "isEqualToString:", v12);

      if ((v10 & 1) == 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack textLabel](self, "textLabel"));
        objc_msgSend(v11, "setText:", v12);

        -[BKHUDTrack _invalidateTextSize](self, "_invalidateTextSize");
        -[BKHUDTrack setNeedsLayout](self, "setNeedsLayout");
      }
    }
  }
  else
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Audiobooks/BKHUDTrack.m", 48, "-[BKHUDTrack setTitle:]", "NO", CFSTR("Unexpected type."));
  }

}

- (UIFont)font
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v3 = objc_opt_class(UIFont);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack textLabel](self, "textLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "font"));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
    v8 = v7;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  v9 = v8;

  return (UIFont *)v9;
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack textLabel](self, "textLabel"));
  objc_msgSend(v5, "setFont:", v4);

  -[BKHUDTrack _invalidateTextSize](self, "_invalidateTextSize");
}

- (UIColor)textColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack textLabel](self, "textLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textColor"));

  return (UIColor *)v3;
}

- (void)setTextColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKHUDTrack textLabel](self, "textLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)a3
{
  if (self->_value != a3)
  {
    self->_value = a3;
    -[BKHUDTrack setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)textSize
{
  UILabel *textLabel;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  double width;
  double height;
  CGSize result;

  if (!-[BKHUDTrack textSizeValid](self, "textSizeValid"))
  {
    textLabel = self->_textLabel;
    -[BKHUDTrack bounds](self, "bounds");
    -[UILabel sizeThatFits:](textLabel, "sizeThatFits:", v4, v5);
    self->_textSize.width = v6;
    self->_textSize.height = v7;
    -[BKHUDTrack setTextSizeValid:](self, "setTextSizeValid:", 1);
  }
  width = self->_textSize.width;
  height = self->_textSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BKHUDTrack)initWithFrame:(CGRect)a3
{
  BKHUDTrack *v3;
  BKHUDTrack *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKHUDTrack;
  v3 = -[BKHUDTrack initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[BKHUDTrack _setupCommon](v3, "_setupCommon");
  return v4;
}

- (BKHUDTrack)initWithCoder:(id)a3
{
  BKHUDTrack *v3;
  BKHUDTrack *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKHUDTrack;
  v3 = -[BKHUDTrack initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[BKHUDTrack _setupCommon](v3, "_setupCommon");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UILabel removeFromSuperview](self->_textLabel, "removeFromSuperview");
  -[UIVisualEffectView removeFromSuperview](self->_visualEffectView, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)BKHUDTrack;
  -[BKHUDTrack dealloc](&v3, "dealloc");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[BKHUDTrack textSize](self, "textSize");
  v5 = CGRectMakeWithSize(v3, v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack textLabel](self, "textLabel"));
  objc_msgSend(v12, "setBounds:", v5, v7, v9, v11);

  if (-[BKHUDTrack hudWidthChangeRequired](self, "hudWidthChangeRequired"))
  {
    -[BKHUDTrack horizontalMargin](self, "horizontalMargin");
    v14 = v9 + v13 * 2.0;
    -[BKHUDTrack verticalMargin](self, "verticalMargin");
    v16 = v11 + v15 * 2.0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack visualEffectView](self, "visualEffectView"));
    objc_msgSend(v17, "setBounds:", 0.0, 0.0, v14, v16);

    -[BKHUDTrack cornerRadius](self, "cornerRadius");
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack visualEffectView](self, "visualEffectView"));
    objc_msgSend(v20, "_setContinuousCornerRadius:", v19);

  }
  -[BKHUDTrack _updateBubblePosition](self, "_updateBubblePosition");
  +[CATransaction commit](CATransaction, "commit");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)hudWidthChangeRequired
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double Width;
  void *v9;
  double v10;
  CGRect v12;
  CGRect v13;

  -[BKHUDTrack horizontalMargin](self, "horizontalMargin");
  v4 = v3 * 2.5;
  -[BKHUDTrack horizontalMargin](self, "horizontalMargin");
  v6 = v5 * 1.5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack visualEffectView](self, "visualEffectView"));
  objc_msgSend(v7, "bounds");
  Width = CGRectGetWidth(v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack textLabel](self, "textLabel"));
  objc_msgSend(v9, "bounds");
  v10 = Width - CGRectGetWidth(v13);

  return v10 > v4 || v10 < v6;
}

- (double)_centerX
{
  double v3;
  double v4;
  double v5;
  float v6;
  double v7;
  double v8;

  -[BKHUDTrack value](self, "value");
  if (*(float *)&v3 >= self->_maximumValue)
    *(float *)&v3 = self->_maximumValue;
  -[BKHUDTrack setValue:](self, "setValue:", v3);
  -[BKHUDTrack value](self, "value");
  if (*(float *)&v4 < self->_minimumValue)
    *(float *)&v4 = self->_minimumValue;
  -[BKHUDTrack setValue:](self, "setValue:", v4);
  v5 = 0.0;
  if (self->_maximumValue > self->_minimumValue)
  {
    -[BKHUDTrack value](self, "value");
    v5 = (float)((float)(v6 - self->_minimumValue) / (float)(self->_maximumValue - self->_minimumValue));
  }
  -[BKHUDTrack bounds](self, "bounds");
  return round(v7 + v5 * v8);
}

- (void)_updateBubblePosition
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double Width;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double MidY;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  id v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack visualEffectView](self, "visualEffectView"));
  objc_msgSend(v3, "bounds");
  if (CGRectIsEmpty(v44))
  {
    -[BKHUDTrack horizontalMargin](self, "horizontalMargin");
    v5 = v4;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack visualEffectView](self, "visualEffectView"));
    objc_msgSend(v6, "bounds");
    Width = CGRectGetWidth(v45);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack textLabel](self, "textLabel"));
    objc_msgSend(v8, "bounds");
    v5 = (Width - CGRectGetWidth(v46)) * 0.5;

  }
  -[BKHUDTrack _centerX](self, "_centerX");
  v10 = v9;
  -[BKHUDTrack bounds](self, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack visualEffectView](self, "visualEffectView"));
  objc_msgSend(v19, "bounds");
  v21 = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack traitCollection](self, "traitCollection"));
  objc_msgSend(v22, "displayScale");
  if (v23 == 0.0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v24, "scale");
    v26 = v25;

  }
  else
  {
    v26 = v23;
  }
  v27 = v21 * 0.5;

  v28 = v16 - v27;
  if (v16 - v27 >= v10)
    v28 = v10;
  if (v27 >= v28)
    v29 = v27;
  else
    v29 = v28;
  v47.origin.x = v12;
  v47.origin.y = v14;
  v47.size.width = v16;
  v47.size.height = v18;
  MidY = CGRectGetMidY(v47);
  v31 = -[BKHUDTrack verticalOffset](self, "verticalOffset");
  v33 = CGPointRoundForScale(v31, v29, MidY + v32, v26);
  v35 = v34;
  -[BKHUDTrack textSize](self, "textSize");
  v37 = v36;
  v39 = v38;
  -[BKHUDTrack verticalMargin](self, "verticalMargin");
  v41 = round(v40 + -1.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKHUDTrack visualEffectView](self, "visualEffectView"));
  objc_msgSend(v42, "setPosition:", v33, v35);

  v43 = (id)objc_claimAutoreleasedReturnValue(-[BKHUDTrack textLabel](self, "textLabel"));
  objc_msgSend(v43, "setFrame:", round(v5), v41, v37, v39);

}

- (void)_setupCommon
{
  void *v3;
  id v4;
  void *v5;
  UIVisualEffectView *v6;
  UIVisualEffectView *visualEffectView;
  UILabel *v8;
  UILabel *textLabel;
  void *v10;
  void *v11;
  void *v12;

  self->_maximumValue = 1.0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[BKHUDTrack setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[BKHUDTrack setOpaque:](self, "setOpaque:", 0);
  v4 = objc_alloc((Class)UIVisualEffectView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 2));
  v6 = (UIVisualEffectView *)objc_msgSend(v4, "initWithEffect:", v5);
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v6;

  -[UIVisualEffectView setUserInteractionEnabled:](self->_visualEffectView, "setUserInteractionEnabled:", 0);
  -[UIVisualEffectView setClipsToBounds:](self->_visualEffectView, "setClipsToBounds:", 1);
  v8 = (UILabel *)objc_alloc_init((Class)UILabel);
  textLabel = self->_textLabel;
  self->_textLabel = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  -[UILabel setFont:](self->_textLabel, "setFont:", v11);

  -[UILabel setUserInteractionEnabled:](self->_textLabel, "setUserInteractionEnabled:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_visualEffectView, "contentView"));
  objc_msgSend(v12, "addSubview:", self->_textLabel);

  -[BKHUDTrack addSubview:](self, "addSubview:", self->_visualEffectView);
  self->_horizontalMargin = 20.0;
  self->_verticalMargin = 6.0;
  self->_cornerRadius = 10.0;
  -[BKHUDTrack _updateBubblePosition](self, "_updateBubblePosition");
}

- (void)_invalidateTextSize
{
  -[BKHUDTrack setTextSizeValid:](self, "setTextSizeValid:", 0);
}

- (double)verticalOffset
{
  return self->_verticalOffset;
}

- (void)setVerticalOffset:(double)a3
{
  self->_verticalOffset = a3;
}

- (double)horizontalMargin
{
  return self->_horizontalMargin;
}

- (void)setHorizontalMargin:(double)a3
{
  self->_horizontalMargin = a3;
}

- (double)verticalMargin
{
  return self->_verticalMargin;
}

- (void)setVerticalMargin:(double)a3
{
  self->_verticalMargin = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (float)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(float)a3
{
  self->_minimumValue = a3;
}

- (float)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(float)a3
{
  self->_maximumValue = a3;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (BOOL)textSizeValid
{
  return self->_textSizeValid;
}

- (void)setTextSizeValid:(BOOL)a3
{
  self->_textSizeValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end
