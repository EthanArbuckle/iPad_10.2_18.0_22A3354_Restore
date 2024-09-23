@implementation TFFeedbackFormGroupToggleCell

- (TFFeedbackFormGroupToggleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TFFeedbackFormGroupToggleCell *v4;
  id v5;
  uint64_t v6;
  UISwitch *toggleSwitch;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TFFeedbackFormGroupToggleCell;
  v4 = -[TFFeedbackFormBaseCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDF6E28]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    toggleSwitch = v4->_toggleSwitch;
    v4->_toggleSwitch = (UISwitch *)v6;

    -[UISwitch addTarget:action:forControlEvents:](v4->_toggleSwitch, "addTarget:action:forControlEvents:", v4, sel_didUpdateToggleSwitchValue_, 4096);
    -[TFFeedbackFormGroupToggleCell setAccessoryView:](v4, "setAccessoryView:", v4->_toggleSwitch);
  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TFFeedbackFormGroupToggleCell;
  -[TFFeedbackFormGroupToggleCell prepareForReuse](&v3, sel_prepareForReuse);
  -[TFFeedbackFormGroupToggleCell setGroupToggleEntry:](self, "setGroupToggleEntry:", 0);
}

- (void)applyContentsOfEntry:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "type") == 2)
  {
    -[TFFeedbackFormGroupToggleCell setGroupToggleEntry:](self, "setGroupToggleEntry:", v7);
    -[TFFeedbackFormGroupToggleCell groupToggleEntry](self, "groupToggleEntry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackFormGroupToggleCell textLabel](self, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

  }
}

- (unint64_t)displayableDataType
{
  return 2;
}

- (void)setDisplayedDataGroupInclusionBool:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TFFeedbackFormGroupToggleCell toggleSwitch](self, "toggleSwitch");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOn:", v3);

}

- (void)didUpdateToggleSwitchValue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[TFFeedbackFormGroupToggleCell groupToggleEntry](self, "groupToggleEntry", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TFFeedbackFormBaseCell updateProxy](self, "updateProxy");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackFormGroupToggleCell groupToggleEntry](self, "groupToggleEntry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackFormGroupToggleCell toggleSwitch](self, "toggleSwitch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didUpdateEntry:toGroupInclusionBool:", v5, objc_msgSend(v6, "isOn"));

  }
}

- (UISwitch)toggleSwitch
{
  return self->_toggleSwitch;
}

- (TFFeedbackEntryGroupToggle)groupToggleEntry
{
  return self->_groupToggleEntry;
}

- (void)setGroupToggleEntry:(id)a3
{
  objc_storeStrong((id *)&self->_groupToggleEntry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupToggleEntry, 0);
  objc_storeStrong((id *)&self->_toggleSwitch, 0);
}

@end
