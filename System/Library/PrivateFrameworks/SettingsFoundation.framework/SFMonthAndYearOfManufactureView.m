@implementation SFMonthAndYearOfManufactureView

- (SFMonthAndYearOfManufactureView)initWithFrame:(CGRect)a3
{
  SFMonthAndYearOfManufactureView *v3;
  SFMonthAndYearOfManufactureView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFMonthAndYearOfManufactureView;
  v3 = -[SFMonthAndYearOfManufactureView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SFMonthAndYearOfManufactureView render](v3, "render");
  return v4;
}

- (SFMonthAndYearOfManufactureView)init
{
  SFMonthAndYearOfManufactureView *v2;
  SFMonthAndYearOfManufactureView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFMonthAndYearOfManufactureView;
  v2 = -[SFMonthAndYearOfManufactureView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SFMonthAndYearOfManufactureView render](v2, "render");
  return v3;
}

- (void)render
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
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
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  -[SFMonthAndYearOfManufactureView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    -[SFMonthAndYearOfManufactureView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFMonthAndYearOfManufactureView labelText](self, "labelText");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "setText:", v6);
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 15.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFont:", v7);

    }
    -[SFMonthAndYearOfManufactureView addSubview:](self, "addSubview:", v5);
    v17 = (void *)MEMORY[0x24BDD1628];
    -[SFMonthAndYearOfManufactureView leadingAnchor](self, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v20;
    -[SFMonthAndYearOfManufactureView trailingAnchor](self, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v9;
    objc_msgSend(v5, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMonthAndYearOfManufactureView topAnchor](self, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v11, 1.0);
    v18 = (void *)v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v12;
    -[SFMonthAndYearOfManufactureView bottomAnchor](self, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v14, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v16);

  }
}

- (id)labelText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sf_monthAndYearOfManufacture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("year"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("month"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("year"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("제조년월: %@월-%@"), v6, v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
