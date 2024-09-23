@implementation WFCircularImageView

- (WFCircularImageView)initWithFrame:(CGRect)a3
{
  WFCircularImageView *v3;
  WFCircularImageView *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WFCircularImageView *v13;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)WFCircularImageView;
  v3 = -[WFCircularImageView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WFCircularImageView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[WFCircularImageView setContentMode:](v4, "setContentMode:", 2);
    objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "CGColor");
    -[WFCircularImageView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderColor:", v6);

    v8 = (void *)MEMORY[0x24BDD1628];
    -[WFCircularImageView widthAnchor](v4, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCircularImageView heightAnchor](v4, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activateConstraints:", v12);

    v13 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  int v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFCircularImageView;
  -[WFCircularImageView layoutSubviews](&v10, sel_layoutSubviews);
  v3 = 5.0;
  if (-[WFCircularImageView isCircular](self, "isCircular"))
  {
    -[WFCircularImageView bounds](self, "bounds");
    v3 = v4 * 0.5;
  }
  -[WFCircularImageView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v3);

  v6 = 0.0;
  if (-[WFCircularImageView isCircular](self, "isCircular") && -[WFCircularImageView hasBorder](self, "hasBorder"))
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = 1;
    v6 = 1.0 / v8;
  }
  else
  {
    v7 = 0;
  }
  -[WFCircularImageView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderWidth:", v6);

  if (v7)
}

- (BOOL)isCircular
{
  return self->_circular;
}

- (void)setCircular:(BOOL)a3
{
  self->_circular = a3;
}

- (BOOL)hasBorder
{
  return self->_hasBorder;
}

- (void)setHasBorder:(BOOL)a3
{
  self->_hasBorder = a3;
}

@end
