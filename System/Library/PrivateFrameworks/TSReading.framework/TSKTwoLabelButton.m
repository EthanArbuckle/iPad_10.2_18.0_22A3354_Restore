@implementation TSKTwoLabelButton

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKTwoLabelButton;
  -[TSKTwoLabelButton dealloc](&v3, sel_dealloc);
}

- (void)p_syncButtonState
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  UIFont *v6;
  UIImageView *mImageView;
  int *v8;

  v3 = -[TSKTwoLabelButton state](self, "state");
  v4 = -[TSKTwoLabelButton titleColorForState:](self, "titleColorForState:", v3);
  v5 = -[TSKTwoLabelButton titleShadowColorForState:](self, "titleShadowColorForState:", v3);
  v6 = -[UILabel font](-[TSKTwoLabelButton secondLabel](self, "secondLabel"), "font");
  -[UILabel setShadowColor:](self->mSecondLabel, "setShadowColor:", v5);
  objc_msgSend((id)-[TSKTwoLabelButton titleLabel](self, "titleLabel"), "shadowOffset");
  -[UILabel setShadowOffset:](self->mSecondLabel, "setShadowOffset:");
  -[UILabel setFont:](self->mSecondLabel, "setFont:", v6);
  if (v3 == 1)
  {
    -[UILabel setTextColor:](self->mSecondLabel, "setTextColor:", v4);
    -[UILabel setShadowOffset:](self->mSecondLabel, "setShadowOffset:", 0.0, -1.0);
    mImageView = self->mImageView;
    if (!mImageView)
      return;
    v8 = &OBJC_IVAR___TSKTwoLabelButton_mHighlightedStateImage;
    goto LABEL_9;
  }
  if (self->mSecondLabelTextColor)
    -[UILabel setTextColor:](self->mSecondLabel, "setTextColor:");
  mImageView = self->mImageView;
  if (mImageView)
  {
    v8 = &OBJC_IVAR___TSKTwoLabelButton_mNormalStateImage;
    if (v3 == 2)
      v8 = &OBJC_IVAR___TSKTwoLabelButton_mDisabledStateImage;
LABEL_9:
    -[UIImageView setImage:](mImageView, "setImage:", *(Class *)((char *)&self->super.super.super.super.super.isa + *v8));
  }
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double MidY;
  double v22;
  CGFloat v23;
  double y;
  double x;
  double v26;
  double v27;
  double v28;
  double v29;
  double MaxX;
  double MidX;
  double v32;
  double v33;
  double v34;
  CGFloat rect;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  objc_super v39;
  uint64_t v40;
  _QWORD v41[2];
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v41[1] = *MEMORY[0x24BDAC8D0];
  if (self->mImageView)
  {
    -[TSKTwoLabelButton addSubview:](self, "addSubview:");
    -[TSKTwoLabelButton setContentHorizontalAlignment:](self, "setContentHorizontalAlignment:", 1);
    -[TSKTwoLabelButton setContentVerticalAlignment:](self, "setContentVerticalAlignment:", 1);
    v37 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v38 = *MEMORY[0x24BDBF090];
    -[TSKTwoLabelButton bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v11 = (void *)-[TSKTwoLabelButton currentTitle](self, "currentTitle");
    v40 = *MEMORY[0x24BDF65F8];
    v41[0] = objc_msgSend((id)-[TSKTwoLabelButton titleLabel](self, "titleLabel"), "font");
    objc_msgSend(v11, "sizeWithAttributes:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1));
    v13 = v12;
    v33 = v12;
    v15 = v14;
    -[UIImageView frame](self->mImageView, "frame");
    v34 = v17;
    rect = v10;
    v18 = v16;
    v19 = v13 + 0.0 + v17;
    v32 = v15;
    if (v15 <= v16)
      v20 = v16;
    else
      v20 = v15;
    v36 = v6;
    v42.origin.x = v4;
    v42.origin.y = v6;
    v42.size.width = v8;
    v42.size.height = v10;
    MidX = CGRectGetMidX(v42);
    v43.origin.x = v4;
    v43.origin.y = v6;
    v43.size.width = v8;
    v43.size.height = v10;
    MidY = CGRectGetMidY(v43);
    v44.origin.x = v38;
    v44.origin.y = v37;
    v44.size.width = v19;
    v44.size.height = v20;
    v22 = CGRectGetMidX(v44);
    v45.origin.x = v38;
    v45.origin.y = v37;
    v45.size.width = v19;
    v45.size.height = v20;
    v23 = MidY - CGRectGetMidY(v45);
    v46.origin.x = v38;
    v46.origin.y = v37;
    v46.size.width = v19;
    v46.size.height = v20;
    v47 = CGRectOffset(v46, MidX - v22, v23);
    y = v47.origin.y;
    if (v47.origin.x >= 0.0)
      x = v47.origin.x;
    else
      x = 5.0;
    v26 = x;
    v28 = v32;
    v27 = v33;
    v29 = CGRectGetMaxX(v47) + 0.0;
    v48.origin.x = v29;
    v48.origin.y = y + 1.0;
    v48.size.width = v34;
    v48.size.height = v18;
    MaxX = CGRectGetMaxX(v48);
    v49.origin.y = v36;
    v49.origin.x = v4;
    v49.size.width = v8;
    v49.size.height = rect;
    if (MaxX > CGRectGetMaxX(v49) + -5.0)
      v29 = v8 - (v34 + 5.0);
    -[TSKTwoLabelButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", y, x, 0.0, *(_QWORD *)&MidX);
    -[UIImageView setFrame:](self->mImageView, "setFrame:", v29, y + 1.0, v34, v18);
  }
  v39.receiver = self;
  v39.super_class = (Class)TSKTwoLabelButton;
  -[TSKTwoLabelButton layoutSubviews](&v39, sel_layoutSubviews);
  -[TSKTwoLabelButton p_syncButtonState](self, "p_syncButtonState");
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSKTwoLabelButton;
  v5 = -[TSKTwoLabelButton beginTrackingWithTouch:withEvent:](&v7, sel_beginTrackingWithTouch_withEvent_, a3, a4);
  -[TSKTwoLabelButton p_syncButtonState](self, "p_syncButtonState");
  return v5;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSKTwoLabelButton;
  v5 = -[TSKTwoLabelButton continueTrackingWithTouch:withEvent:](&v7, sel_continueTrackingWithTouch_withEvent_, a3, a4);
  -[TSKTwoLabelButton p_syncButtonState](self, "p_syncButtonState");
  return v5;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSKTwoLabelButton;
  -[TSKTwoLabelButton endTrackingWithTouch:withEvent:](&v5, sel_endTrackingWithTouch_withEvent_, a3, a4);
  -[TSKTwoLabelButton p_syncButtonState](self, "p_syncButtonState");
}

- (void)cancelTrackingWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSKTwoLabelButton;
  -[TSKTwoLabelButton cancelTrackingWithEvent:](&v4, sel_cancelTrackingWithEvent_, a3);
  -[TSKTwoLabelButton p_syncButtonState](self, "p_syncButtonState");
}

- (UILabel)secondLabel
{
  return self->mSecondLabel;
}

- (void)setSecondLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 752);
}

- (UIImageView)imageView
{
  return self->mImageView;
}

- (void)setImageView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 760);
}

- (UIImage)normalStateImage
{
  return self->mNormalStateImage;
}

- (void)setNormalStateImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 768);
}

- (UIImage)highlightedStateImage
{
  return self->mHighlightedStateImage;
}

- (void)setHighlightedStateImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 776);
}

- (UIImage)disabledStateImage
{
  return self->mDisabledStateImage;
}

- (void)setDisabledStateImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 784);
}

- (UIColor)secondLabelTextColor
{
  return self->mSecondLabelTextColor;
}

- (void)setSecondLabelTextColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 792);
}

@end
