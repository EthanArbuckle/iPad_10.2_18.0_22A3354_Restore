@implementation SFAlertMarkView

- (SFAlertMarkView)initWithFrame:(CGRect)a3
{
  SFAlertMarkView *v3;
  SFAlertMarkView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFAlertMarkView;
  v3 = -[SFAlertMarkView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SFAlertMarkView render](v3, "render");
  return v4;
}

- (SFAlertMarkView)init
{
  SFAlertMarkView *v2;
  SFAlertMarkView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFAlertMarkView;
  v2 = -[SFAlertMarkView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SFAlertMarkView render](v2, "render");
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
  void *v24;
  _QWORD v25[4];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  -[SFAlertMarkView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    -[SFAlertMarkView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = objc_alloc(MEMORY[0x24BDF6DD0]);
    -[SFAlertMarkView alertImage](self, "alertImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v6;
    -[SFAlertMarkView labelForString:](self, "labelForString:", CFSTR("Lihat Panduan Pengguna untuk"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v7;
    -[SFAlertMarkView labelForString:](self, "labelForString:", CFSTR("Penggunaan Yang Tepat"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithArrangedSubviews:", v9);

    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "setAxis:", 1);
    objc_msgSend(v10, "setAlignment:", 3);
    -[SFAlertMarkView addSubview:](self, "addSubview:", v10);
    v20 = (void *)MEMORY[0x24BDD1628];
    -[SFAlertMarkView leadingAnchor](self, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v22;
    -[SFAlertMarkView trailingAnchor](self, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v12;
    objc_msgSend(v10, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAlertMarkView topAnchor](self, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v14, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v15;
    -[SFAlertMarkView bottomAnchor](self, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v17, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v19);

  }
}

- (id)alertImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:weight:scale:", 3, 3, 42.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.triangle"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithRenderingMode:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v4);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

  return v5;
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

  objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 13.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  return v5;
}

@end
