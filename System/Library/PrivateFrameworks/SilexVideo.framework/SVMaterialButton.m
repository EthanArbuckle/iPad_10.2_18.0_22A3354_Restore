@implementation SVMaterialButton

- (SVMaterialButton)initWithFrame:(CGRect)a3
{
  SVMaterialButton *v3;
  AVBackgroundView *v4;
  AVBackgroundView *backgroundView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SVMaterialButton;
  v3 = -[SVButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (AVBackgroundView *)objc_alloc_init(MEMORY[0x24BDB2770]);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v4;

    -[AVBackgroundView setUserInteractionEnabled:](v3->_backgroundView, "setUserInteractionEnabled:", 0);
    -[AVBackgroundView setAutomaticallyDrawsRoundedCorners:](v3->_backgroundView, "setAutomaticallyDrawsRoundedCorners:", 0);
    -[SVMaterialButton addSubview:](v3, "addSubview:", v3->_backgroundView);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SVMaterialButton;
  -[SVMaterialButton layoutSubviews](&v4, sel_layoutSubviews);
  -[SVMaterialButton backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVMaterialButton bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (AVBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
