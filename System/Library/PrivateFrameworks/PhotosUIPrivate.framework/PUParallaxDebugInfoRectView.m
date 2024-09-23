@implementation PUParallaxDebugInfoRectView

- (PUParallaxDebugInfoRectView)initWithFrame:(CGRect)a3
{
  PUParallaxDebugInfoRectView *v3;
  PUParallaxDebugInfoRectView *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  UILabel *v10;
  void *v11;
  void *v12;
  UILabel *textLabel;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PUParallaxDebugInfoRectView;
  v3 = -[PUParallaxDebugInfoRectView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUParallaxDebugInfoRectView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBorderWidth:", 2.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");
    -[PUParallaxDebugInfoRectView layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBorderColor:", v7);

    v9 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PUParallaxDebugInfoRectView bounds](v4, "bounds");
    v10 = (UILabel *)objc_msgSend(v9, "initWithFrame:");
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v10, "setBackgroundColor:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10, "setTextColor:", v12);

    -[UILabel setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 0);
    -[PUParallaxDebugInfoRectView addSubview:](v4, "addSubview:", v10);
    textLabel = v4->_textLabel;
    v4->_textLabel = v10;

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
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
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PUParallaxDebugInfoRectView;
  -[PUParallaxDebugInfoRectView layoutSubviews](&v15, sel_layoutSubviews);
  -[PUParallaxDebugInfoRectView textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxDebugInfoRectView bounds](self, "bounds");
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  PXRectWithOriginAndSize();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[PUParallaxDebugInfoRectView textLabel](self, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *identifier;
  NSString *v8;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  v4 = self->_identifier;
  if (v4 == v10)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v4, "isEqual:", v10);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v10, "copy");
      identifier = self->_identifier;
      self->_identifier = v6;

      v8 = self->_identifier;
      -[PUParallaxDebugInfoRectView textLabel](self, "textLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v8);

      -[PUParallaxDebugInfoRectView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
