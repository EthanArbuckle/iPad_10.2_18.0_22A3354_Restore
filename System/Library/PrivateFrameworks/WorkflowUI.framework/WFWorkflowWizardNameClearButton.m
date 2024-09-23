@implementation WFWorkflowWizardNameClearButton

- (WFWorkflowWizardNameClearButton)initWithFrame:(CGRect)a3
{
  WFWorkflowWizardNameClearButton *v3;
  WFWorkflowWizardNameClearButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  WFWorkflowWizardNameClearButton *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)WFWorkflowWizardNameClearButton;
  v3 = -[WFWorkflowWizardNameClearButton initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WFWorkflowWizardNameClearButton layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMasksToBounds:", 1);

    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowWizardNameClearButton setTintColor:](v4, "setTintColor:", v6);

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 19.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scaledFontForFont:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithFont:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("xmark.circle.fill"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowWizardNameClearButton setImage:forState:](v4, "setImage:forState:", v11, 0);
    LODWORD(v12) = 1148846080;
    -[WFWorkflowWizardNameClearButton setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 0, v12);
    LODWORD(v13) = 1148846080;
    -[WFWorkflowWizardNameClearButton setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 1, v13);
    LODWORD(v14) = 1148846080;
    -[WFWorkflowWizardNameClearButton setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v14);
    LODWORD(v15) = 1148846080;
    -[WFWorkflowWizardNameClearButton setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v15);
    v16 = v4;

  }
  return v4;
}

- (id)accessibilityLabel
{
  return WFLocalizedStringWithKey(CFSTR("Clear (Accessibility label)"), CFSTR("Clear"));
}

@end
