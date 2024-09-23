@implementation PNPAnimatedHardwareView

- (void)setPencilLayer:(id)a3
{
  CALayer *v4;
  CALayer *pencilLayer;
  CALayer *v6;
  id v7;

  v4 = (CALayer *)a3;
  -[CALayer removeFromSuperlayer](self->_pencilLayer, "removeFromSuperlayer");
  pencilLayer = self->_pencilLayer;
  self->_pencilLayer = v4;
  v6 = v4;

  -[CALayer setAnchorPoint:](self->_pencilLayer, "setAnchorPoint:", 0.0, 0.5);
  -[CALayer setPosition:](self->_pencilLayer, "setPosition:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[CALayer setGeometryFlipped:](self->_pencilLayer, "setGeometryFlipped:", 1);
  -[PNPAnimatedHardwareView layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSublayer:", self->_pencilLayer);

}

- (void)setHardwareType:(unint64_t)a3 deviceType:(int64_t)a4
{
  -[PNPAnimatedHardwareView setHardwareType:](self, "setHardwareType:", a3);
  -[PNPAnimatedHardwareView setDeviceType:](self, "setDeviceType:", a4);
  -[PNPAnimatedHardwareView configureForCurrentHardwareAndDevice](self, "configureForCurrentHardwareAndDevice");
}

- (void)configureForCurrentHardwareAndDevice
{
  void *v3;
  id v4;

  -[PNPAnimatedHardwareView layerForHardwareType:deviceType:](self, "layerForHardwareType:deviceType:", -[PNPAnimatedHardwareView hardwareType](self, "hardwareType"), -[PNPAnimatedHardwareView deviceType](self, "deviceType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPAnimatedHardwareView setPencilLayer:](self, "setPencilLayer:", v3);

  if (-[PNPAnimatedHardwareView hardwareType](self, "hardwareType") - 1 <= 1)
  {
    -[PNPAnimatedHardwareView pencilLayer](self, "pencilLayer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAnchorPoint:", 0.0, 0.5);

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PNPAnimatedHardwareView;
  -[PNPAnimatedHardwareView layoutSubviews](&v15, sel_layoutSubviews);
  -[PNPAnimatedHardwareView bounds](self, "bounds");
  v4 = v3;
  -[PNPAnimatedHardwareView pencilLayer](self, "pencilLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;

  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeScale(&v14, v4 / v7, v4 / v7);
  v13 = v14;
  -[PNPAnimatedHardwareView pencilLayer](self, "pencilLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v13;
  objc_msgSend(v8, "setAffineTransform:", &v12);

  -[PNPAnimatedHardwareView bounds](self, "bounds");
  v10 = v9 * 0.5 + 8.0;
  -[PNPAnimatedHardwareView pencilLayer](self, "pencilLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPosition:", 0.0, v10);

}

- (id)layerForHardwareType:(unint64_t)a3 deviceType:(int64_t)a4
{
  const __CFString *v4;
  __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("DoubleTap");
  if (a3 != 1)
    v4 = 0;
  if (a3 == 2)
    v5 = CFSTR("Squeeze");
  else
    v5 = (__CFString *)v4;
  if (a4 == 2)
  {
    v6 = CFSTR("-B332");
  }
  else
  {
    if (a4 != 4)
      goto LABEL_11;
    v6 = CFSTR("-B532");
  }
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v6);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForResource:withExtension:", v5, CFSTR("caar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x24BDE5D48];
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDE5718], "packageWithContentsOfURL:type:options:error:", v8, v9, 0, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;
  if (v11)
  {
    v12 = os_log_create("com.apple.pencilpairingui", ");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl(&dword_22ACC1000, v12, OS_LOG_TYPE_DEFAULT, "Error getting animation package: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v10, "rootLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)preferredHeightForWidth:(double)a3
{
  return 76.0;
}

- (unint64_t)hardwareType
{
  return self->_hardwareType;
}

- (void)setHardwareType:(unint64_t)a3
{
  self->_hardwareType = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (CALayer)pencilLayer
{
  return self->_pencilLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pencilLayer, 0);
}

@end
