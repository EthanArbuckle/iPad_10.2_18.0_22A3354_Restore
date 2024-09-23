@implementation SPUIGradientMaskView

- (SPUIGradientMaskView)init
{
  SPUIGradientMaskView *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)SPUIGradientMaskView;
  v2 = -[SPUIGradientMaskView init](&v19, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceLayoutDirection");

    if (v4 == 1)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21[0] = objc_msgSend(v5, "CGColor");
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21[1] = objc_msgSend(v6, "CGColor");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIGradientMaskView layer](v2, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setColors:", v7);

      -[SPUIGradientMaskView layer](v2, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setStartPoint:", 0.0, 0.5);

      -[SPUIGradientMaskView layer](v2, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 0.1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20[0] = objc_msgSend(v13, "CGColor");
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20[1] = objc_msgSend(v14, "CGColor");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIGradientMaskView layer](v2, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setColors:", v15);

      -[SPUIGradientMaskView layer](v2, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setStartPoint:", 0.9, 0.5);

      -[SPUIGradientMaskView layer](v2, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 1.0;
    }
    objc_msgSend(v10, "setEndPoint:", v12, 0.5);

  }
  return v2;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
