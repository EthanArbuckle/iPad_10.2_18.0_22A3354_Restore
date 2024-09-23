@implementation WLQRCodeViewController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WLQRCodeViewController;
  -[WLQRCodeViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WLQRCodeViewController initQRCode](self, "initQRCode");
}

- (void)initQRCode
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
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
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];

  v37[3] = *MEMORY[0x24BDAC8D0];
  if (self->_qrcode && !self->_initialized)
  {
    self->_initialized = 1;
    -[WLQRCodeViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "directionalLayoutMargins");
    v5 = v4;
    -[WLQRCodeViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "directionalLayoutMargins");
    v8 = v5 + v7;

    -[WLQRCodeViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;

    -[WLQRCodeViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;

    if (v11 >= v14)
      v15 = v14;
    else
      v15 = v11;
    v16 = v15 - v8;
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "userInterfaceIdiom"))
      v18 = 3.0;
    else
      v18 = 1.70000005;

    v19 = floor(floor((v16 - floor(v16 / v18)) * 0.5) * 0.5);
    -[WLQRCode createQRCodeImage:](self->_qrcode, "createQRCodeImage:");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v36);
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WLQRCodeViewController contentView](self, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v20);

    v31 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v20, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLQRCodeViewController contentView](self, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, v19);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v32;
    objc_msgSend(v20, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLQRCodeViewController contentView](self, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, -v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v25;
    objc_msgSend(v20, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLQRCodeViewController contentView](self, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v30);

  }
}

- (WLQRCode)qrcode
{
  return self->_qrcode;
}

- (void)setQrcode:(id)a3
{
  objc_storeStrong((id *)&self->_qrcode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qrcode, 0);
}

@end
