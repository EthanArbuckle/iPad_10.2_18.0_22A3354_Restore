@implementation StocksListBoxView

- (StocksListBoxView)initWithBackgroundMask:(id)a3
{
  id v4;
  StocksListBoxView *v5;
  StocksListBoxView *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)StocksListBoxView;
  v5 = -[StocksListBoxView init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[StocksListBoxView setImage:](v5, "setImage:", v4);
    -[StocksListBoxView setContentMode:](v6, "setContentMode:", 3);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[StocksListBoxView setTintColor:](v6, "setTintColor:", v7);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[StocksListBoxView setBackgroundColor:](v6, "setBackgroundColor:", v8);

  }
  return v6;
}

- (UIColor)imageMaskColor
{
  return self->_imageMaskColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageMaskColor, 0);
}

@end
