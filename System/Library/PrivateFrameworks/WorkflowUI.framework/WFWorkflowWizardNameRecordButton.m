@implementation WFWorkflowWizardNameRecordButton

- (WFWorkflowWizardNameRecordButton)initWithFrame:(CGRect)a3
{
  WFWorkflowWizardNameRecordButton *v3;
  WFWorkflowWizardNameRecordButton *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  WFWorkflowWizardNameRecordButton *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WFWorkflowWizardNameRecordButton;
  v3 = -[WFWorkflowWizardNameRecordButton initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WFWorkflowWizardNameRecordButton layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMasksToBounds:", 1);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowWizardNameRecordButton setTintColor:](v4, "setTintColor:", v6);

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("mic.fill"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowWizardNameRecordButton setImage:forState:](v4, "setImage:forState:", v7, 0);
    LODWORD(v8) = 1148846080;
    -[WFWorkflowWizardNameRecordButton setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 0, v8);
    LODWORD(v9) = 1148846080;
    -[WFWorkflowWizardNameRecordButton setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 1, v9);
    LODWORD(v10) = 1148846080;
    -[WFWorkflowWizardNameRecordButton setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v10);
    LODWORD(v11) = 1148846080;
    -[WFWorkflowWizardNameRecordButton setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v11);
    v12 = v4;

  }
  return v4;
}

- (id)accessibilityLabel
{
  return WFLocalizedString(CFSTR("Record name"));
}

@end
