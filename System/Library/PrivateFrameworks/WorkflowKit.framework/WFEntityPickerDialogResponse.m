@implementation WFEntityPickerDialogResponse

- (WFEntityPickerDialogResponse)initWithSelectedEntry:(id)a3
{
  id v5;
  WFEntityPickerDialogResponse *v6;
  WFEntityPickerDialogResponse *v7;
  WFEntityPickerDialogResponse *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFEntityPickerDialogResponse;
  v6 = -[WFDialogResponse initWithResponseCode:](&v10, sel_initWithResponseCode_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_selectedEntry, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)userRequestedAllOptions
{
  void *v2;
  void *v3;
  char v4;

  -[WFEntityPickerDialogResponse selectedEntry](self, "selectedEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("WFEntityPickerDialogResponseChooseEntryIdentifier"));

  return v4;
}

- (BOOL)userRequestedOpenApp
{
  void *v2;
  void *v3;
  char v4;

  -[WFEntityPickerDialogResponse selectedEntry](self, "selectedEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("WFEntityPickerDialogResponseOpenAppEntryIdentifier"));

  return v4;
}

- (WFEntityPickerDialogResponse)initWithCoder:(id)a3
{
  id v4;
  WFEntityPickerDialogResponse *v5;
  uint64_t v6;
  WFConcreteRunnableEntry *selectedEntry;
  WFEntityPickerDialogResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFEntityPickerDialogResponse;
  v5 = -[WFDialogResponse initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedEntry"));
    v6 = objc_claimAutoreleasedReturnValue();
    selectedEntry = v5->_selectedEntry;
    v5->_selectedEntry = (WFConcreteRunnableEntry *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFEntityPickerDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFEntityPickerDialogResponse selectedEntry](self, "selectedEntry", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("selectedEntry"));

}

- (WFEntityPickerDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  WFEntityPickerDialogResponse *v5;
  uint64_t v6;
  WFConcreteRunnableEntry *selectedEntry;
  WFEntityPickerDialogResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFEntityPickerDialogResponse;
  v5 = -[WFDialogResponse initWithBSXPCCoder:](&v10, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedEntry"));
    v6 = objc_claimAutoreleasedReturnValue();
    selectedEntry = v5->_selectedEntry;
    v5->_selectedEntry = (WFConcreteRunnableEntry *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFEntityPickerDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithBSXPCCoder:](&v6, sel_encodeWithBSXPCCoder_, v4);
  -[WFEntityPickerDialogResponse selectedEntry](self, "selectedEntry", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("selectedEntry"));

}

- (WFConcreteRunnableEntry)selectedEntry
{
  return self->_selectedEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedEntry, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end
