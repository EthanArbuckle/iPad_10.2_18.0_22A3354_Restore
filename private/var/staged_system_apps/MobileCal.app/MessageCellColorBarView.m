@implementation MessageCellColorBarView

- (MessageCellColorBarView)init
{
  MessageCellColorBarView *v2;
  uint64_t v3;
  MessageCellColorBarView *v4;
  double v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MessageCellColorBarView;
  v2 = -[MessageCellColorBarView init](&v9, "init");
  v4 = v2;
  if (v2)
  {
    v5 = CalRoundToScreenScale(v2, v3, 4.0) * 0.5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageCellColorBarView layer](v4, "layer"));
    objc_msgSend(v6, "setCornerRadius:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageCellColorBarView layer](v4, "layer"));
    objc_msgSend(v7, "setMasksToBounds:", 1);

  }
  return v4;
}

- (UIColor)backgroundColor
{
  return 0;
}

- (void)setColor:(id)a3
{
  id v5;
  objc_super v6;

  objc_storeStrong((id *)&self->_color, a3);
  v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MessageCellColorBarView;
  -[MessageCellColorBarView setBackgroundColor:](&v6, "setBackgroundColor:", v5);

}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
