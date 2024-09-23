@implementation SVAdGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SVAdGradientView)initWithFrame:(CGRect)a3
{
  SVAdGradientView *v3;
  SVAdGradientView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)SVAdGradientView;
  v3 = -[SVAdGradientView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SVAdGradientView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStartPoint:", 0.5, 0.0);
    objc_msgSend(v5, "setEndPoint:", 0.5, 1.0);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.03);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.35);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDBCE30];
    v28 = objc_retainAutorelease(v6);
    v11 = objc_msgSend(v28, "CGColor");
    v27 = objc_retainAutorelease(v7);
    v12 = objc_msgSend(v27, "CGColor");
    v13 = objc_retainAutorelease(v8);
    v14 = objc_msgSend(v13, "CGColor");
    v15 = objc_retainAutorelease(v9);
    objc_msgSend(v10, "arrayWithObjects:", v11, v12, v14, objc_msgSend(v15, "CGColor"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColors:", v16);
    LODWORD(v17) = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = 0.5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = 0.75;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = 1.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v18, v20, v22, v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocations:", v25);

  }
  return v4;
}

@end
