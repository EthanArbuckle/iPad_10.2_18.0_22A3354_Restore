@implementation TSASingleTouchButton

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSASingleTouchButton;
  -[TSASingleTouchButton dealloc](&v3, sel_dealloc);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  if (objc_msgSend((id)objc_msgSend(a4, "allTouches"), "count") == 1)
  {
    v7.receiver = self;
    v7.super_class = (Class)TSASingleTouchButton;
    -[TSASingleTouchButton touchesBegan:withEvent:](&v7, sel_touchesBegan_withEvent_, a3, a4);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  if (objc_msgSend((id)objc_msgSend(a4, "allTouches"), "count") == 1)
  {
    v7.receiver = self;
    v7.super_class = (Class)TSASingleTouchButton;
    -[TSASingleTouchButton touchesEnded:withEvent:](&v7, sel_touchesEnded_withEvent_, a3, a4);
  }
  else if (-[TSASingleTouchButton isHighlighted](self, "isHighlighted"))
  {
    -[TSASingleTouchButton setHighlighted:](self, "setHighlighted:", 0);
  }
}

- (CGPoint)_pressFeedbackPosition
{
  CGFloat MidX;
  double MidY;
  double v5;
  CGPoint result;
  CGRect v7;
  CGRect v8;

  -[TSASingleTouchButton bounds](self, "bounds");
  MidX = CGRectGetMidX(v7);
  -[TSASingleTouchButton bounds](self, "bounds");
  MidY = CGRectGetMidY(v8);
  v5 = MidX;
  result.y = MidY;
  result.x = v5;
  return result;
}

- (id)_pressFeedbackImage
{
  id result;

  result = -[TSASingleTouchButton touchImage](self, "touchImage");
  if (!result)
    return (id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("TSA_ButtonBarPressedIndicator"));
  return result;
}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSASingleTouchButton;
  -[TSASingleTouchButton layoutSubviews](&v5, sel_layoutSubviews);
  if (self->_showsTouchOnTopWhenHighlighted)
  {
    v3 = -[TSASingleTouchButton viewWithTag:](self, "viewWithTag:", 1);
    if (v3)
    {
      v4 = (void *)v3;
      -[TSASingleTouchButton _pressFeedbackPosition](self, "_pressFeedbackPosition");
      objc_msgSend(v4, "setCenter:");
    }
  }
}

- (void)setShowsTouchOnTopWhenHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  int v8;
  double v9;

  if (self->_showsTouchOnTopWhenHighlighted != a3)
  {
    v3 = a3;
    self->_showsTouchOnTopWhenHighlighted = a3;
    v5 = (void *)-[TSASingleTouchButton viewWithTag:](self, "viewWithTag:", 1);
    if (v5 || !v3)
    {
      if (v5)
        objc_msgSend(v5, "removeFromSuperview");
    }
    else
    {
      v6 = -[TSASingleTouchButton _pressFeedbackImage](self, "_pressFeedbackImage");
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v6);
      objc_msgSend(v7, "setUserInteractionEnabled:", 0);
      objc_msgSend(v7, "setOpaque:", 0);
      v8 = -[TSASingleTouchButton isHighlighted](self, "isHighlighted");
      v9 = 0.0;
      if (v8)
        v9 = 1.0;
      objc_msgSend(v7, "setAlpha:", v9);
      objc_msgSend(v7, "setTag:", 1);
      -[TSASingleTouchButton _pressFeedbackPosition](self, "_pressFeedbackPosition");
      objc_msgSend(v7, "setCenter:");
      -[TSASingleTouchButton addSubview:](self, "addSubview:", v7);

      -[TSASingleTouchButton setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setTouchImage:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (self->_touchImage != a3)
  {
    v5 = a3;

    self->_touchImage = (UIImage *)a3;
    v6 = -[TSASingleTouchButton viewWithTag:](self, "viewWithTag:", 1);
    if (v6)
    {
      v7 = (void *)v6;
      v8 = -[TSASingleTouchButton _pressFeedbackImage](self, "_pressFeedbackImage");
      objc_msgSend(v8, "size");
      objc_msgSend(v7, "setBounds:", TSDRectWithSize());
      objc_msgSend(v7, "setImage:", v8);
      -[TSASingleTouchButton setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  _QWORD v7[5];
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TSASingleTouchButton;
  -[TSASingleTouchButton setHighlighted:](&v8, sel_setHighlighted_);
  if (self->_showsTouchOnTopWhenHighlighted)
  {
    v5 = (void *)-[TSASingleTouchButton viewWithTag:](self, "viewWithTag:", 1);
    if (v3)
    {
      if ((void *)objc_msgSend((id)-[TSASingleTouchButton subviews](self, "subviews"), "lastObject") != v5)
      {
        v6 = v5;
        objc_msgSend(v5, "removeFromSuperview");
        -[TSASingleTouchButton addSubview:](self, "addSubview:", v5);

      }
      objc_msgSend(v5, "setAlpha:", 1.0);
    }
    else
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __39__TSASingleTouchButton_setHighlighted___block_invoke;
      v7[3] = &unk_24D829278;
      v7[4] = v5;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v7, 0.25);
    }
  }
}

uint64_t __39__TSASingleTouchButton_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (BOOL)showsTouchOnTopWhenHighlighted
{
  return self->_showsTouchOnTopWhenHighlighted;
}

- (UIImage)touchImage
{
  return self->_touchImage;
}

@end
