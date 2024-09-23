@implementation _SMUHandoffAnimationView

- (_SMUHandoffAnimationView)initWithState:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _SMUHandoffAnimationView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BEBB478]);
  -[_SMUHandoffAnimationView iconNameForState:](self, "iconNameForState:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:bundle:", v7, v5);

  objc_msgSend(v8, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29.receiver = self;
  v29.super_class = (Class)_SMUHandoffAnimationView;
  v10 = -[_UICAPackageView initWithData:publishedObjectViewClassMap:](&v29, sel_initWithData_publishedObjectViewClassMap_, v9, 0);

  if (v10)
  {
    -[_SMUHandoffAnimationView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_SMUHandoffAnimationView subviews](v10, "subviews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v28 = v5;
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v12, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SMUHandoffAnimationView topAnchor](v10, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, -6.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v25;
    objc_msgSend(v12, "leftAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SMUHandoffAnimationView leftAnchor](v10, "leftAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, -6.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v21;
    objc_msgSend(v12, "rightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SMUHandoffAnimationView rightAnchor](v10, "rightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 6.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v15;
    objc_msgSend(v12, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SMUHandoffAnimationView bottomAnchor](v10, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 6.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v19);

    v5 = v28;
  }

  return v10;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;
  CGRect v13;
  CGRect v14;

  -[_SMUHandoffAnimationView subviews](self, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "bounds");
    x = v13.origin.x;
    y = v13.origin.y;
    width = v13.size.width;
    height = v13.size.height;
    v8 = CGRectGetWidth(v13) + -12.0;
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    v9 = CGRectGetHeight(v14) + -12.0;
  }
  else
  {
    v8 = *MEMORY[0x24BEBE9C8];
    v9 = *MEMORY[0x24BEBE9C8];
  }

  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)iconNameForState:(unint64_t)a3
{
  if (a3)
    return CFSTR("device-animation-phone-check");
  else
    return CFSTR("device-animation-phone");
}

@end
