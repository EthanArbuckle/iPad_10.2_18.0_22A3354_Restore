@implementation SFIndiaBISView

- (SFIndiaBISView)initWithFrame:(CGRect)a3
{
  SFIndiaBISView *v3;
  SFIndiaBISView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFIndiaBISView;
  v3 = -[SFIndiaBISView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SFIndiaBISView render](v3, "render");
  return v4;
}

- (SFIndiaBISView)init
{
  SFIndiaBISView *v2;
  SFIndiaBISView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFIndiaBISView;
  v2 = -[SFIndiaBISView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SFIndiaBISView render](v2, "render");
  return v3;
}

- (void)render
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x24BDAC8D0];
  -[SFIndiaBISView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    -[SFIndiaBISView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "setAxis:", 1);
    objc_msgSend(v5, "setAlignment:", 3);
    -[SFIndiaBISView addSubview:](self, "addSubview:", v5);
    SFIndiaBISRegulatoryImage();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithRenderingMode:", 2);
    v7 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)v7;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v7);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v9);

    v30 = v8;
    objc_msgSend(v5, "addArrangedSubview:", v8);
    v10 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    SFIndiaBISNumber();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v11);

    objc_msgSend(v10, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      objc_msgSend(v10, "setText:", CFSTR("Unknown"));
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v13);

    objc_msgSend(v5, "addArrangedSubview:", v10);
    v14 = objc_alloc_init(MEMORY[0x24BDF6B68]);

    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v14, "setText:", CFSTR("www.bis.gov.in"));
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v15);

    objc_msgSend(v5, "addArrangedSubview:", v14);
    v24 = (void *)MEMORY[0x24BDD1628];
    -[SFIndiaBISView leadingAnchor](self, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v27;
    -[SFIndiaBISView trailingAnchor](self, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v16;
    objc_msgSend(v5, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFIndiaBISView topAnchor](self, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v18, 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v19;
    -[SFIndiaBISView bottomAnchor](self, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v21, 1.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v23);

  }
}

@end
