@implementation PTUIEditRowTableViewCell

+ (int64_t)cellStyleForRow:(id)a3
{
  return 1000;
}

- (PTUIEditRowTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PTUIEditRowTableViewCell *v4;
  PTUIEditRowTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PTUIEditRowTableViewCell;
  v4 = -[PTUIEditRowTableViewCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PTUIEditRowTableViewCell editableTextField](v4, "editableTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextAlignment:", 2);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || !PTUINumericKeypadIsNeeded())
    {
      -[PTUIEditRowTableViewCell editableTextField](v5, "editableTextField");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 1;
    }
    else
    {
      -[PTUIEditRowTableViewCell editableTextField](v5, "editableTextField");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 0;
    }
    objc_msgSend(v7, "setClearButtonMode:", v9);

    -[PTUIEditRowTableViewCell editableTextField](v5, "editableTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v5);

  }
  return v5;
}

- (void)updateDisplayedValue
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PTUIRowTableViewCell row](self, "row");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PTUIEditRowTableViewCell editableTextField](self, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTUIEditRowTableViewCell textForValue:](self, "textForValue:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

}

- (id)textForValue:(id)a3
{
  return 0;
}

- (id)valueForText:(id)a3
{
  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && PTUINumericKeypadIsNeeded())
  {
    +[PTUINumericKeypad sharedKeypad](PTUINumericKeypad, "sharedKeypad");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStringValue:", v5);

    +[PTUINumericKeypad sharedKeypad](PTUINumericKeypad, "sharedKeypad");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "showAnimated:forDelegate:", 1, self);

  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "setTextAlignment:", 2);
  -[PTUIEditRowTableViewCell editableTextField](self, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PTUIRowTableViewCell row](self, "row");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTUIEditRowTableViewCell valueForText:](self, "valueForText:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:", v6);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && PTUINumericKeypadIsNeeded())
  {
    +[PTUINumericKeypad sharedKeypad](PTUINumericKeypad, "sharedKeypad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hideAnimated:", 1);

  }
}

- (void)numericKeypadDidUpdateValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PTUIEditRowTableViewCell editableTextField](self, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setText:", v6);
  -[PTUIEditRowTableViewCell editableTextField](self, "editableTextField");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendActionsForControlEvents:", 4096);

}

- (void)numericKeypadWillDismiss:(id)a3
{
  id v3;

  -[PTUIEditRowTableViewCell editableTextField](self, "editableTextField", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

@end
