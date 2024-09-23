@implementation SVVideoAdSkipButton

- (SVVideoAdSkipButton)initWithFrame:(CGRect)a3
{
  SVVideoAdSkipButton *v3;
  SVVideoAdSkipButton *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SVVideoAdSkipButton;
  v3 = -[SVButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SVVideoAdSkipButton titleForDuration:](v3, "titleForDuration:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVVideoAdSkipButton setAttributedTitle:forState:](v4, "setAttributedTitle:forState:", v5, 0);
    -[SVVideoAdSkipButton setEnabled:](v4, "setEnabled:", 0);
    -[SVButton setTouchInsets:](v4, "setTouchInsets:", 10.0, 10.0, 10.0, 10.0);

  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[SVVideoAdSkipButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "capHeight");
  v6 = round(v5) + 12.0;

  -[SVVideoAdSkipButton titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intrinsicContentSize");
  v9 = v8 + 6.0;

  v10 = v9;
  v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setSkipDuration:(unint64_t)a3
{
  id v5;

  self->_skipDuration = a3;
  -[SVVideoAdSkipButton setEnabled:](self, "setEnabled:", a3 == 0);
  -[SVVideoAdSkipButton titleForDuration:](self, "titleForDuration:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SVVideoAdSkipButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v5, 0);

}

- (id)titleForDuration:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3 + 1;
  SVBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 > 1)
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Skip in %lu"), &stru_24DBC27F8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, a3);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.921568627, 0.921568627, 0.960784314, 0.6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Skip"), &stru_24DBC27F8, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v7;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v7);
  objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF77D0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 13.0, *MEMORY[0x24BDF7890]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scaledFontForFont:", v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x24BDF65F8], v22, 0, objc_msgSend(v10, "length"));
  objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x24BDF6600], v8, 0, objc_msgSend(v10, "length"));
  v12 = objc_alloc_init(MEMORY[0x24BDF6768]);
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, 3.0, 0.0);
  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendAttributedString:", v13);
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:weight:", 6, 13.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("forward.end.fill"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageWithTintColor:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc_init(MEMORY[0x24BDF6768]);
  objc_msgSend(v17, "setImage:", v16);
  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendAttributedString:", v18);
  v19 = objc_alloc_init(MEMORY[0x24BDF6748]);
  objc_msgSend(v19, "setAlignment:", 1);
  objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x24BDF6628], v19, 0, objc_msgSend(v10, "length"));

  return v10;
}

- (unint64_t)skipDuration
{
  return self->_skipDuration;
}

@end
