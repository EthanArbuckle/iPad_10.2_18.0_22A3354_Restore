@implementation RUIReadableContentContainer

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
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
  objc_super v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)RUIReadableContentContainer;
  -[RUIReadableContentContainer layoutSubviews](&v23, sel_layoutSubviews);
  -[RUIReadableContentContainer subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "sizeToFit");
    v15 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v4, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIReadableContentContainer readableContentGuide](self, "readableContentGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v19;
    objc_msgSend(v4, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIReadableContentContainer readableContentGuide](self, "readableContentGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v14;
    objc_msgSend(v4, "trailingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIReadableContentContainer readableContentGuide](self, "readableContentGuide");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v8;
    objc_msgSend(v4, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIReadableContentContainer readableContentGuide](self, "readableContentGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v13);

  }
}

@end
