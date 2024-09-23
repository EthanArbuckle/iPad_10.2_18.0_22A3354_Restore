@implementation WFWorkflowWizardNameIconButton

- (WFWorkflowWizardNameIconButton)initWithFrame:(CGRect)a3
{
  WFWorkflowWizardNameIconButton *v3;
  WFWorkflowWizardNameIconButton *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  WFWorkflowWizardNameIconButton *v29;
  objc_super v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v31.receiver = self;
  v31.super_class = (Class)WFWorkflowWizardNameIconButton;
  v3 = -[WFWorkflowWizardNameIconButton initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WFWorkflowWizardNameIconButton layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMasksToBounds:", 1);

    -[WFWorkflowWizardNameIconButton layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", 12.0);

    v7 = *MEMORY[0x24BDE58E8];
    -[WFWorkflowWizardNameIconButton layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerCurve:", v7);

    objc_msgSend(MEMORY[0x24BEBD4B8], "linkColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "CGColor");
    -[WFWorkflowWizardNameIconButton layer](v4, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderColor:", v10);

    UIRoundToViewScale();
    v13 = v12;
    -[WFWorkflowWizardNameIconButton layer](v4, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBorderWidth:", v13);

    -[WFWorkflowWizardNameIconButton layer](v4, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowsEdgeAntialiasing:", 1);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", 0);
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeWeak((id *)&v4->_backgroundImageView, v16);
    -[WFWorkflowWizardNameIconButton addSubview:](v4, "addSubview:", v16);
    v17 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v16, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowWizardNameIconButton centerXAnchor](v4, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v20;
    objc_msgSend(v16, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowWizardNameIconButton centerYAnchor](v4, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v24);

    LODWORD(v25) = 1148846080;
    -[WFWorkflowWizardNameIconButton setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 0, v25);
    LODWORD(v26) = 1148846080;
    -[WFWorkflowWizardNameIconButton setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 1, v26);
    LODWORD(v27) = 1148846080;
    -[WFWorkflowWizardNameIconButton setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v27);
    LODWORD(v28) = 1148846080;
    -[WFWorkflowWizardNameIconButton setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v28);
    v29 = v4;

  }
  return v4;
}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEBD4B8], "linkColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v5, "CGColor");
  -[WFWorkflowWizardNameIconButton layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderColor:", v3);

}

- (void)setIcon:(id)a3 customImageData:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_icon, a3);
  objc_storeStrong((id *)&self->_customImageData, a4);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1688]), "initWithIcon:", v13);
  objc_msgSend(v8, "setCornerRadius:", 8.10000038);
  -[WFWorkflowWizardNameIconButton traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDark:", objc_msgSend(v9, "userInterfaceStyle") == 2);
  objc_msgSend(v8, "setHighContrast:", objc_msgSend(v9, "accessibilityContrast") == 1);
  if (v7)
  {
    objc_msgSend(v8, "setCustomImageData:", v7);
    objc_msgSend(v8, "setUseCustomImage:", 1);
  }
  objc_msgSend(v8, "imageWithSize:", 36.0, 36.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UIImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWorkflowWizardNameIconButton backgroundImageView](self, "backgroundImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v11);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 44.0;
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)redrawIcon
{
  void *v3;
  id v4;

  -[WFWorkflowWizardNameIconButton icon](self, "icon");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowWizardNameIconButton customImageData](self, "customImageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowWizardNameIconButton setIcon:customImageData:](self, "setIcon:customImageData:", v4, v3);

}

- (WFWorkflowIcon)icon
{
  return self->_icon;
}

- (NSData)customImageData
{
  return self->_customImageData;
}

- (UIImageView)backgroundImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_backgroundImageView);
}

- (void)setBackgroundImageView:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundImageView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundImageView);
  objc_storeStrong((id *)&self->_customImageData, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
