@implementation WFAutomationSwitchCell

- (WFAutomationSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFAutomationSwitchCell *v4;
  WFAutomationSwitchCell *v5;
  UISwitch *v6;
  UISwitch *switchControl;
  WFAutomationSwitchCell *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFAutomationSwitchCell;
  v4 = -[WFAutomationSwitchCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
  {
    -[WFAutomationSwitchCell setAccessoryType:](v4, "setAccessoryType:", 0);
    v6 = (UISwitch *)objc_alloc_init(MEMORY[0x24BEBD9B8]);
    switchControl = v5->_switchControl;
    v5->_switchControl = v6;

    -[WFAutomationSwitchCell setAccessoryView:](v5, "setAccessoryView:", v5->_switchControl);
    v8 = v5;
  }

  return v5;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFAutomationSwitchCell;
  -[WFAutomationSwitchCell prepareForReuse](&v4, sel_prepareForReuse);
  -[WFAutomationSwitchCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

}

- (UISwitch)switchControl
{
  return self->_switchControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchControl, 0);
}

@end
