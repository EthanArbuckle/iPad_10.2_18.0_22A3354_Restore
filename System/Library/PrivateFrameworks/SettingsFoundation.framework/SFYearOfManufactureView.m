@implementation SFYearOfManufactureView

- (SFYearOfManufactureView)initWithFrame:(CGRect)a3
{
  SFYearOfManufactureView *v3;
  SFYearOfManufactureView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFYearOfManufactureView;
  v3 = -[SFYearOfManufactureView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SFYearOfManufactureView render](v3, "render");
  return v4;
}

- (SFYearOfManufactureView)init
{
  SFYearOfManufactureView *v2;
  SFYearOfManufactureView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFYearOfManufactureView;
  v2 = -[SFYearOfManufactureView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SFYearOfManufactureView render](v2, "render");
  return v3;
}

- (void)render
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
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
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  -[SFYearOfManufactureView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    -[SFYearOfManufactureView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sf_yearOfManufacture");

    v7 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("製造年份 %lu"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v8);

      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 15.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFont:", v9);

    }
    -[SFYearOfManufactureView addSubview:](self, "addSubview:", v7);
    v19 = (void *)MEMORY[0x24BDD1628];
    -[SFYearOfManufactureView leadingAnchor](self, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v21;
    -[SFYearOfManufactureView trailingAnchor](self, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v11;
    objc_msgSend(v7, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFYearOfManufactureView topAnchor](self, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v13, 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v14;
    -[SFYearOfManufactureView bottomAnchor](self, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v16, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v18);

  }
}

@end
