@implementation TFDeviceInstructionView

- (TFDeviceInstructionView)initWithFrame:(CGRect)a3
{
  TFDeviceInstructionView *v3;
  id v4;
  uint64_t v5;
  UIImageView *deviceImageView;
  void *v7;
  double v8;
  double v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TFDeviceInstructionView;
  v3 = -[TFDeviceInstructionView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6AE8]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    deviceImageView = v3->_deviceImageView;
    v3->_deviceImageView = (UIImageView *)v5;

    -[UIImageView setContentMode:](v3->_deviceImageView, "setContentMode:", 1);
    -[TFDeviceInstructionView addSubview:](v3, "addSubview:", v3->_deviceImageView);
    +[TFDeviceInstructionView backgroundColor](TFDeviceInstructionView, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFDeviceInstructionView setBackgroundColor:](v3, "setBackgroundColor:", v7);

    +[TFDeviceInstructionView cornerRadius](TFDeviceInstructionView, "cornerRadius");
    v9 = v8;
    -[TFDeviceInstructionView layer](v3, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerRadius:", v9);

  }
  return v3;
}

+ (double)cornerRadius
{
  return 15.0;
}

+ (id)backgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.965, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.855, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dynamicColorWithLightColor:darkColor:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (UIEdgeInsets)imageLayoutInsets
{
  __n128 v2;
  __n128 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v2.n128_u64[0] = 20.0;
  v3.n128_u64[0] = 20.0;
  PPMScaledFloatValue(a1, a2, v2, v3);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (void)displayDeviceImage:(id)a3 inOrientation:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[TFDeviceInstructionView deviceImageView](self, "deviceImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

  -[TFDeviceInstructionView updateCurrentDeviceImageToOrientation:](self, "updateCurrentDeviceImageToOrientation:", a4);
}

- (void)updateCurrentDeviceImageToOrientation:(int64_t)a3
{
  CGFloat v4;
  void *v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  v4 = 0.0;
  if ((unint64_t)(a3 - 2) <= 2)
    v4 = dbl_2174FF840[a3 - 2];
  CGAffineTransformMakeRotation(&v7, v4);
  -[TFDeviceInstructionView deviceImageView](self, "deviceImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  objc_msgSend(v5, "setTransform:", &v6);

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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)TFDeviceInstructionView;
  -[TFDeviceInstructionView layoutSubviews](&v20, sel_layoutSubviews);
  -[TFDeviceInstructionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[TFDeviceInstructionView imageLayoutInsets](TFDeviceInstructionView, "imageLayoutInsets");
  v12 = v4 + v11;
  v14 = v6 + v13;
  v16 = v8 - (v11 + v15);
  v18 = v10 - (v13 + v17);
  -[TFDeviceInstructionView deviceImageView](self, "deviceImageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

}

- (UIImageView)deviceImageView
{
  return self->_deviceImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceImageView, 0);
}

@end
