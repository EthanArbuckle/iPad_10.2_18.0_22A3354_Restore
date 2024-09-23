@implementation WFSelectableListOption

- (WFSelectableListOption)initWithDisplayTitle:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFSelectableListOption *v10;
  uint64_t v11;
  NSString *displayTitle;
  WFSelectableListOption *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerTableViewController.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayTitle"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerTableViewController.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFSelectableListOption;
  v10 = -[WFSelectableListOption init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    displayTitle = v10->_displayTitle;
    v10->_displayTitle = (NSString *)v11;

    objc_storeStrong(&v10->_value, a4);
    v13 = v10;
  }

  return v10;
}

- (NSString)displayTitle
{
  return self->_displayTitle;
}

- (id)value
{
  return self->_value;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_displayTitle, 0);
}

@end
