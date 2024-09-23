@implementation WFAddToHomeIconPreviewCell

- (WFAddToHomeIconPreviewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFAddToHomeIconPreviewCell *v4;
  WFAddToHomeIconPreviewCell *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WFAddToHomeIconPreviewCell *v18;
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
  void *v32;
  void *v33;
  objc_super v34;
  _QWORD v35[9];

  v35[7] = *MEMORY[0x24BDAC8D0];
  v34.receiver = self;
  v34.super_class = (Class)WFAddToHomeIconPreviewCell;
  v4 = -[WFAddToHomeIconPreviewCell initWithStyle:reuseIdentifier:](&v34, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WFAddToHomeIconPreviewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "wf_settingsCellColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAddToHomeIconPreviewCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", 0);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeWeak((id *)&v5->_iconImageView, v7);
    v8 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v9);

    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 12.0, *MEMORY[0x24BEBB600]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v10);

    objc_msgSend(v8, "setTextAlignment:", 1);
    objc_msgSend(v8, "setAllowsDefaultTighteningForTruncation:", 1);
    objc_msgSend(v8, "setText:", &stru_24E605650);
    objc_storeWeak((id *)&v5->_iconLabel, v8);
    -[WFAddToHomeIconPreviewCell addSubview:](v5, "addSubview:", v7);
    -[WFAddToHomeIconPreviewCell addSubview:](v5, "addSubview:", v8);
    v25 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v7, "centerXAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAddToHomeIconPreviewCell centerXAnchor](v5, "centerXAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v31;
    objc_msgSend(v7, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAddToHomeIconPreviewCell centerYAnchor](v5, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, -9.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v28;
    objc_msgSend(v7, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToConstant:", 60.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v26;
    objc_msgSend(v7, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToConstant:", 60.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v23;
    objc_msgSend(v8, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 6.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35[4] = v20;
    objc_msgSend(v8, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAddToHomeIconPreviewCell centerXAnchor](v5, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[5] = v13;
    objc_msgSend(v8, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "widthAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 32.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[6] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v17);

    v18 = v5;
  }

  return v5;
}

- (void)configureWithName:(id)a3 icon:(id)a4
{
  id v6;

  v6 = a4;
  -[WFAddToHomeIconPreviewCell configureName:](self, "configureName:", a3);
  -[WFAddToHomeIconPreviewCell configureIcon:](self, "configureIcon:", v6);

}

- (void)configureName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFAddToHomeIconPreviewCell iconLabel](self, "iconLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)configureIcon:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)&self->_icon, a3);
  v5 = a3;
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC1688]), "initWithHomeScreenIcon:", v5);

  objc_msgSend(v10, "setCornerRadius:", 13.5);
  -[WFAddToHomeIconPreviewCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDark:", objc_msgSend(v6, "userInterfaceStyle") == 2);
  objc_msgSend(v10, "setHighContrast:", objc_msgSend(v6, "accessibilityContrast") == 1);
  objc_msgSend(v10, "imageWithSize:", 60.0, 60.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UIImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAddToHomeIconPreviewCell iconImageView](self, "iconImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v8);

}

- (void)redrawIcon
{
  id v3;

  -[WFAddToHomeIconPreviewCell icon](self, "icon");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAddToHomeIconPreviewCell configureIcon:](self, "configureIcon:", v3);

}

- (UIImageView)iconImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_iconImageView);
}

- (void)setIconImageView:(id)a3
{
  objc_storeWeak((id *)&self->_iconImageView, a3);
}

- (UILabel)iconLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_iconLabel);
}

- (void)setIconLabel:(id)a3
{
  objc_storeWeak((id *)&self->_iconLabel, a3);
}

- (WFHomeScreenIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_destroyWeak((id *)&self->_iconLabel);
  objc_destroyWeak((id *)&self->_iconImageView);
}

+ (double)defaultRowHeight
{
  return 118.0;
}

@end
