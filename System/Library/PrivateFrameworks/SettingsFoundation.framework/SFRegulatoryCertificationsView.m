@implementation SFRegulatoryCertificationsView

- (SFRegulatoryCertificationsView)initWithFrame:(CGRect)a3
{
  SFRegulatoryCertificationsView *v3;
  SFRegulatoryCertificationsView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFRegulatoryCertificationsView;
  v3 = -[SFRegulatoryCertificationsView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SFRegulatoryCertificationsView render](v3, "render");
  return v4;
}

- (SFRegulatoryCertificationsView)init
{
  SFRegulatoryCertificationsView *v2;
  SFRegulatoryCertificationsView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFRegulatoryCertificationsView;
  v2 = -[SFRegulatoryCertificationsView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SFRegulatoryCertificationsView render](v2, "render");
  return v3;
}

- (void)render
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SFIndiaBISView *v9;
  SFEyesightWarningView *v10;
  SFMonthAndYearOfManufactureView *v11;
  SFAlertMarkView *v12;
  SFYearOfManufactureView *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
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
  void *v37;
  void *v38;
  _QWORD v39[5];

  v39[4] = *MEMORY[0x24BDAC8D0];
  -[SFRegulatoryCertificationsView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setAxis:", 1);
  objc_msgSend(v3, "setAlignment:", 3);
  -[SFRegulatoryCertificationsView addSubview:](self, "addSubview:", v3);
  v4 = objc_alloc(MEMORY[0x24BDF6AE8]);
  SFRegulatoryImage();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithImage:", v5);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  SF_LocalizedStringForSettingsFoundation(CFSTR("AX_REGULATORY_INFORMATION"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

  v38 = v6;
  objc_msgSend(v3, "addArrangedSubview:", v6);
  if (SFShouldShowIndiaBIS())
  {
    SFIndiaBISNumber();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_alloc_init(SFIndiaBISView);
      objc_msgSend(v3, "addArrangedSubview:", v9);

    }
  }
  if (SFShouldShowEyesightWarning())
  {
    v10 = objc_alloc_init(SFEyesightWarningView);
    objc_msgSend(v3, "addArrangedSubview:", v10);

  }
  if (SFShouldShowMonthOfManufacture())
  {
    v11 = objc_alloc_init(SFMonthAndYearOfManufactureView);
    objc_msgSend(v3, "addArrangedSubview:", v11);

  }
  if (SFShouldShowAlertMark())
  {
    v12 = objc_alloc_init(SFAlertMarkView);
    objc_msgSend(v3, "addArrangedSubview:", v12);

  }
  if (SFShouldShowYearOfManufacture())
  {
    v13 = objc_alloc_init(SFYearOfManufactureView);
    objc_msgSend(v3, "addArrangedSubview:", v13);

  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "sf_isInternalInstall"))
  {

LABEL_15:
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sf_serialNumberQRImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v18);
    objc_msgSend(v18, "size");
    v21 = v20;
    objc_msgSend(v3, "arrangedSubviews");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCustomSpacing:afterView:", v23, v21);

    objc_msgSend(v3, "addArrangedSubview:", v19);
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "sf_isCarrierInstall");

  if (v16)
    goto LABEL_15;
LABEL_16:
  v33 = (void *)MEMORY[0x24BDD1628];
  -[SFRegulatoryCertificationsView leadingAnchor](self, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v35;
  -[SFRegulatoryCertificationsView trailingAnchor](self, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v25;
  -[SFRegulatoryCertificationsView topAnchor](self, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v28;
  -[SFRegulatoryCertificationsView bottomAnchor](self, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v32);

}

@end
