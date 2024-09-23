@implementation SFEyesightWarningView

- (SFEyesightWarningView)initWithFrame:(CGRect)a3
{
  SFEyesightWarningView *v3;
  SFEyesightWarningView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFEyesightWarningView;
  v3 = -[SFEyesightWarningView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SFEyesightWarningView render](v3, "render");
  return v4;
}

- (SFEyesightWarningView)init
{
  SFEyesightWarningView *v2;
  SFEyesightWarningView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFEyesightWarningView;
  v2 = -[SFEyesightWarningView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SFEyesightWarningView render](v2, "render");
  return v3;
}

- (void)render
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  -[SFEyesightWarningView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    -[SFEyesightWarningView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = objc_alloc(MEMORY[0x24BDF6DD0]);
    -[SFEyesightWarningView labelForString:](self, "labelForString:", CFSTR("國家通訊傳播委員會規定，應標示顯示器使用"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v6;
    -[SFEyesightWarningView labelForString:](self, "labelForString:", CFSTR("相關警語。請參閱警語的簡介指南。"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithArrangedSubviews:", v8);

    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "setAxis:", 1);
    objc_msgSend(v9, "setAlignment:", 3);
    -[SFEyesightWarningView addSubview:](self, "addSubview:", v9);
    v19 = (void *)MEMORY[0x24BDD1628];
    -[SFEyesightWarningView leadingAnchor](self, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v21;
    -[SFEyesightWarningView trailingAnchor](self, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v11;
    objc_msgSend(v9, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFEyesightWarningView topAnchor](self, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v13, 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v14;
    -[SFEyesightWarningView bottomAnchor](self, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v16, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v18);

  }
}

- (id)labelForString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDF6B68];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 15.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  return v5;
}

@end
