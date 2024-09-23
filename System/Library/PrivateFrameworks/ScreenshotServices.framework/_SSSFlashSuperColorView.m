@implementation _SSSFlashSuperColorView

- (_SSSFlashSuperColorView)initWithFrame:(CGRect)a3
{
  _SSSFlashSuperColorView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SSSFlashSuperColorView;
  v3 = -[_SSSFlashSuperColorView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_SSSFlashSuperColorView _updateBackgroundColor](v3, "_updateBackgroundColor");
  return v3;
}

- (void)setStyle:(unint64_t)a3
{
  if (-[_SSSFlashSuperColorView style](self, "style") != a3)
  {
    self->_style = a3;
    -[_SSSFlashSuperColorView _updateBackgroundColor](self, "_updateBackgroundColor");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SSSFlashSuperColorView;
  v4 = a3;
  -[_SSSFlashSuperColorView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  -[_SSSFlashSuperColorView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[_SSSFlashSuperColorView _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)_updateBackgroundColor
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  v3 = -[_SSSFlashSuperColorView style](self, "style");
  if (v3 == 2)
  {
    -[_SSSFlashSuperColorView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    v6 = (void *)MEMORY[0x24BDF6950];
    if (v8 != 2)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.1, 1.1, 1.1, 1.0);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_6:
    objc_msgSend(v6, "colorWithWhite:alpha:", 0.85, 1.0);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v15 = (void *)v9;
    v17 = 0;
    goto LABEL_12;
  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD0]);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDF6950];
    v11 = -2.0;
    v12 = -2.0;
    v13 = -2.0;
    v14 = 0.75;
  }
  else
  {
    -[_SSSFlashSuperColorView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    if (v5 == 2)
    {
      v6 = (void *)MEMORY[0x24BDF6950];
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDF6950];
    v11 = 2.0;
    v12 = 2.0;
    v13 = 2.0;
    v14 = 1.0;
  }
  objc_msgSend(v10, "colorWithRed:green:blue:alpha:", v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  -[_SSSFlashSuperColorView layer](self, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCompositingFilter:", v17);

  -[_SSSFlashSuperColorView setBackgroundColor:](self, "setBackgroundColor:", v15);
}

- (unint64_t)style
{
  return self->_style;
}

@end
