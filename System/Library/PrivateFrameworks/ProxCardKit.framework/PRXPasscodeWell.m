@implementation PRXPasscodeWell

- (PRXPasscodeWell)initWithFrame:(CGRect)a3
{
  PRXPasscodeWell *v3;
  PRXPasscodeWell *v4;
  UILabel *v5;
  UILabel *label;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PRXPasscodeWell *v15;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)PRXPasscodeWell;
  v3 = -[PRXPasscodeWell initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PRXPasscodeWell setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    label = v4->_label;
    v4->_label = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXPasscodeWell addSubview:](v4, "addSubview:", v4->_label);
    v7 = (void *)MEMORY[0x24BDD1628];
    -[UILabel centerXAnchor](v4->_label, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXPasscodeWell centerXAnchor](v4, "centerXAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    -[UILabel centerYAnchor](v4->_label, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXPasscodeWell centerYAnchor](v4, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activateConstraints:", v14);

    v15 = v4;
  }

  return v4;
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
