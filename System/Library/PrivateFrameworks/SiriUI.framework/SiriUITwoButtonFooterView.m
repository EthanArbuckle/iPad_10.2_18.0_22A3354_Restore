@implementation SiriUITwoButtonFooterView

- (SiriUITwoButtonFooterView)initWithFrame:(CGRect)a3
{
  SiriUITwoButtonFooterView *v3;
  void *v4;
  uint64_t v5;
  SiriUIKeyline *verticalKeyline;
  uint64_t v7;
  SiriUIKeyline *horizontalKeyline;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SiriUITwoButtonFooterView;
  v3 = -[SiriUITwoButtonFooterView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUITwoButtonFooterView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    +[SiriUIKeyline verticalKeyline](SiriUIKeyline, "verticalKeyline");
    v5 = objc_claimAutoreleasedReturnValue();
    verticalKeyline = v3->_verticalKeyline;
    v3->_verticalKeyline = (SiriUIKeyline *)v5;

    -[SiriUITwoButtonFooterView addSubview:](v3, "addSubview:", v3->_verticalKeyline);
    +[SiriUIKeyline keylineWithKeylineType:](SiriUIKeyline, "keylineWithKeylineType:", 2);
    v7 = objc_claimAutoreleasedReturnValue();
    horizontalKeyline = v3->_horizontalKeyline;
    v3->_horizontalKeyline = (SiriUIKeyline *)v7;

    -[SiriUITwoButtonFooterView addSubview:](v3, "addSubview:", v3->_horizontalKeyline);
    -[SiriUITwoButtonFooterView prepareForReuse](v3, "prepareForReuse");
  }
  return v3;
}

+ (double)defaultHeight
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");

  return 44.0;
}

- (void)prepareForReuse
{
  SiriUIContentButton *v3;
  SiriUIContentButton *rightButton;
  SiriUIContentButton *v5;
  SiriUIContentButton *leftButton;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriUITwoButtonFooterView;
  -[SiriUITwoButtonFooterView prepareForReuse](&v7, sel_prepareForReuse);
  -[SiriUIContentButton removeFromSuperview](self->_rightButton, "removeFromSuperview");
  +[SiriUIContentButton buttonWithLightWeightFont](SiriUIContentButton, "buttonWithLightWeightFont");
  v3 = (SiriUIContentButton *)objc_claimAutoreleasedReturnValue();
  rightButton = self->_rightButton;
  self->_rightButton = v3;

  -[SiriUITwoButtonFooterView addSubview:](self, "addSubview:", self->_rightButton);
  -[SiriUIContentButton removeFromSuperview](self->_leftButton, "removeFromSuperview");
  +[SiriUIContentButton buttonWithLightWeightFont](SiriUIContentButton, "buttonWithLightWeightFont");
  v5 = (SiriUIContentButton *)objc_claimAutoreleasedReturnValue();
  leftButton = self->_leftButton;
  self->_leftButton = v5;

  -[SiriUITwoButtonFooterView addSubview:](self, "addSubview:", self->_leftButton);
}

- (void)layoutSubviews
{
  double x;
  CGFloat y;
  double width;
  double height;
  double MidX;
  double v8;
  double MinX;
  void *v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double MaxY;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v24.receiver = self;
  v24.super_class = (Class)SiriUITwoButtonFooterView;
  -[SiriUITwoButtonFooterView layoutSubviews](&v24, sel_layoutSubviews);
  -[SiriUITwoButtonFooterView bounds](self, "bounds");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  MidX = CGRectGetMidX(v25);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MinX = CGRectGetMinX(v26);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11 < 2.0;
  v13 = 0.5;
  if (v12)
    v13 = 1.0;
  v14 = MidX + v13;

  -[SiriUIContentButton setFrame:](self->_leftButton, "setFrame:", MinX, v8, v14, height);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v23 = MidX;
  -[SiriUIContentButton setFrame:](self->_rightButton, "setFrame:", MidX, v8, CGRectGetMaxX(v27) - MidX, height);
  -[SiriUIKeyline sizeThatFits:](self->_horizontalKeyline, "sizeThatFits:", width, height);
  v16 = v15;
  v18 = v17;
  -[SiriUIKeyline setFrame:](self->_horizontalKeyline, "setFrame:", x, 0.0, v15, v17);
  v28.origin.y = 0.0;
  v28.origin.x = x;
  v28.size.width = v16;
  v28.size.height = v18;
  MaxY = CGRectGetMaxY(v28);
  -[SiriUIKeyline sizeThatFits:](self->_verticalKeyline, "sizeThatFits:", width, height);
  v21 = v20;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v22 = CGRectGetHeight(v29);
  v30.origin.y = 0.0;
  v30.origin.x = x;
  v30.size.width = v16;
  v30.size.height = v18;
  -[SiriUIKeyline setFrame:](self->_verticalKeyline, "setFrame:", v23, MaxY, v21, v22 - CGRectGetMaxY(v30));
}

- (SiriUIContentButton)leftButton
{
  return self->_leftButton;
}

- (SiriUIContentButton)rightButton
{
  return self->_rightButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_horizontalKeyline, 0);
  objc_storeStrong((id *)&self->_verticalKeyline, 0);
}

@end
