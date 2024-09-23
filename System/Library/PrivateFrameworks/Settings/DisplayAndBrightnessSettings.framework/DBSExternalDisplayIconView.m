@implementation DBSExternalDisplayIconView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (DBSExternalDisplayIconView)initWithFrame:(CGRect)a3 displayName:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  DBSExternalDisplayIconView *v10;
  DBSExternalDisplayIconView *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;
  _QWORD v26[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v26[2] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)DBSExternalDisplayIconView;
  v10 = -[DBSExternalDisplayIconView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[DBSExternalDisplayIconView layer](v10, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.576470588, 0.705882353, 0.749019608, 1.0);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26[0] = objc_msgSend(v13, "CGColor");
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.760784314, 0.850980392, 0.874509804, 1.0);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26[1] = objc_msgSend(v14, "CGColor");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setColors:", v15);

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.1);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "setBorderColor:", objc_msgSend(v16, "CGColor"));

    objc_msgSend(v12, "setBorderWidth:", 1.0);
    objc_msgSend(v12, "setCornerRadius:", 5.0);
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "setText:", v9);
    -[DBSExternalDisplayIconView addSubview:](v11, "addSubview:", v17);
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v17, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSExternalDisplayIconView centerXAnchor](v11, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    objc_msgSend(v17, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSExternalDisplayIconView centerYAnchor](v11, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    -[DBSExternalDisplayIconView setNameField:](v11, "setNameField:", v17);
  }

  return v11;
}

- (UILabel)nameField
{
  return self->_nameField;
}

- (void)setNameField:(id)a3
{
  objc_storeStrong((id *)&self->_nameField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameField, 0);
}

@end
