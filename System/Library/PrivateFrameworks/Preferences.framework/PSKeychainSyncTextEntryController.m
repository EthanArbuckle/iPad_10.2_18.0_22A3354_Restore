@implementation PSKeychainSyncTextEntryController

- (PSKeychainSyncTextEntryController)init
{
  PSKeychainSyncTextEntryController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSKeychainSyncTextEntryController;
  v2 = -[PSListController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_textFieldChanged_, *MEMORY[0x1E0CEBD20], 0);

    v2->_numberOfPasscodeFields = 6;
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncTextEntryController;
  -[PSListController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncTextEntryController;
  -[PSListController loadView](&v4, sel_loadView);
  -[PSListController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSeparatorStyle:", 0);

}

- (void)updateNextButton
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  if (self->_textEntryType == 1 || -[PSKeychainSyncTextEntryController hidesNextButton](self, "hidesNextButton"))
  {
    -[PSKeychainSyncTextEntryController navigationItem](self, "navigationItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", 0);
  }
  else
  {
    v3 = objc_alloc(MEMORY[0x1E0CEA380]);
    PS_LocalizedStringForKeychainSync(CFSTR("NEXT"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 2, self, sel_nextPressed);

    objc_msgSend(v6, "setEnabled:", 0);
    -[PSKeychainSyncTextEntryController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItem:", v6);

  }
}

- (void)nextPressed
{
  void *v3;
  id v4;

  -[PSKeychainSyncTextEntryController textEntryView](self, "textEntryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

  -[PSKeychainSyncTextEntryController textValue](self, "textValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncTextEntryController didFinishEnteringText:](self, "didFinishEnteringText:", v4);

}

- (void)didFinishEnteringText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSKeychainSyncViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keychainSyncController:didFinishWithResult:error:", self, v4, 0);

}

- (void)setHidesNextButton:(BOOL)a3
{
  self->_hidesNextButton = a3;
  -[PSKeychainSyncTextEntryController updateNextButton](self, "updateNextButton");
}

- (void)setTextEntryType:(int)a3
{
  -[PSKeychainSyncTextEntryController setTextEntryText:](self, "setTextEntryText:", &stru_1E4A69238);
  self->_textEntryType = a3;
  if (self->super.super._specifiers)
    -[PSListController reloadSpecifiers](self, "reloadSpecifiers");
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  char v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSKeychainSyncTextEntryController;
  -[PSKeychainSyncTextEntryController becomeFirstResponder](&v6, sel_becomeFirstResponder);
  -[PSKeychainSyncTextEntryController textEntryView](self, "textEntryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "becomeFirstResponder");

  return v4;
}

- (void)willBecomeActive
{
  void *v3;
  objc_super v4;

  -[PSKeychainSyncTextEntryController textEntryView](self, "textEntryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncTextEntryController;
  -[PSViewController willBecomeActive](&v4, sel_willBecomeActive);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[PSKeychainSyncTextEntryController updateNextButton](self, "updateNextButton");
  if ((-[PSKeychainSyncTextEntryController isMovingToParentViewController](self, "isMovingToParentViewController") & 1) == 0)
    -[PSListController reloadSpecifiers](self, "reloadSpecifiers");
  v5.receiver = self;
  v5.super_class = (Class)PSKeychainSyncTextEntryController;
  -[PSListController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSKeychainSyncTextEntryController;
  -[PSListController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  -[PSKeychainSyncTextEntryController textEntryCell](self, "textEntryCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PSKeychainSyncTextEntryController textEntryCell](self, "textEntryCell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDenyFirstResponder:", 1);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSKeychainSyncTextEntryController;
  -[PSListController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[PSKeychainSyncTextEntryController textEntryCell](self, "textEntryCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PSKeychainSyncTextEntryController textEntryCell](self, "textEntryCell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDenyFirstResponder:", 0);

  }
}

- (void)setTextEntryText:(id)a3
{
  id v4;

  v4 = a3;
  -[PSKeychainSyncTextEntryController setTextValue:](self, "setTextValue:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIKeyInput setText:](self->_textEntryView, "setText:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIKeyInput setStringValue:](self->_textEntryView, "setStringValue:", v4);
    else
      -[PSListController reloadSpecifier:](self, "reloadSpecifier:", self->_textEntrySpecifier);
  }

}

- (id)textEntryText
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIKeyInput text](self->_textEntryView, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIKeyInput stringValue](self->_textEntryView, "stringValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)specifiers
{
  NSArray *specifiers;
  UIKeyInput *textEntryView;
  PSTableCell *textEntryCell;
  PSSpecifier *textEntrySpecifier;
  NSString *textValue;
  NSArray *v8;
  void *v9;
  NSArray *v10;
  objc_super v12;

  specifiers = self->super.super._specifiers;
  if (!specifiers)
  {
    -[UIKeyInput removeFromSuperview](self->_textEntryView, "removeFromSuperview");
    textEntryView = self->_textEntryView;
    self->_textEntryView = 0;

    -[PSTableCell removeFromSuperview](self->_textEntryCell, "removeFromSuperview");
    textEntryCell = self->_textEntryCell;
    self->_textEntryCell = 0;

    textEntrySpecifier = self->_textEntrySpecifier;
    self->_textEntrySpecifier = 0;

    if (self->_secureTextEntry)
    {
      textValue = self->_textValue;
      self->_textValue = 0;

    }
    v12.receiver = self;
    v12.super_class = (Class)PSKeychainSyncTextEntryController;
    -[PSKeychainSyncViewController specifiers](&v12, sel_specifiers);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[PSKeychainSyncTextEntryController textEntrySpecifier](self, "textEntrySpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v8, "addObject:", v9);

    v10 = self->super.super._specifiers;
    self->super.super._specifiers = v8;

    specifiers = self->super.super._specifiers;
  }
  return specifiers;
}

- (id)placeholderText
{
  return 0;
}

- (id)textEntrySpecifier
{
  int textEntryType;
  PSSpecifier *v4;
  PSSpecifier *v5;
  PSSpecifier *v6;
  void *v7;
  PSSpecifier *v8;
  PSSpecifier *textEntrySpecifier;
  PSSpecifier *v10;

  if (!self->_textEntrySpecifier)
  {
    textEntryType = self->_textEntryType;
    if (textEntryType == 2)
    {
      +[PSTextFieldSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSTextFieldSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, sel_setTextValue_forSpecifier_, sel_getTextValueForSpecifier_, 0, 8, 0);
      v8 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      textEntrySpecifier = self->_textEntrySpecifier;
      self->_textEntrySpecifier = v8;

      v10 = self->_textEntrySpecifier;
      -[PSKeychainSyncTextEntryController placeholderText](self, "placeholderText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setPlaceholder:](v10, "setPlaceholder:", v7);
      goto LABEL_6;
    }
    if (textEntryType == 1)
    {
      +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, sel_setTextValue_forSpecifier_, sel_getTextValueForSpecifier_, 0, 3, 0);
      v4 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      v5 = self->_textEntrySpecifier;
      self->_textEntrySpecifier = v4;

      -[PSSpecifier setProperty:forKey:](self->_textEntrySpecifier, "setProperty:forKey:", objc_opt_class(), CFSTR("cellClass"));
      v6 = self->_textEntrySpecifier;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PSKeychainSyncTextEntryController numberOfPasscodeFields](self, "numberOfPasscodeFields"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setProperty:forKey:](v6, "setProperty:forKey:", v7, CFSTR("numberOfPasscodeFields"));
LABEL_6:

    }
  }
  return self->_textEntrySpecifier;
}

- (Class)textEntryCellClass
{
  return (Class)(id)objc_opt_class();
}

- (id)textEntryCell
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  PSTableCell *v9;
  PSTableCell *textEntryCell;
  int textEntryType;
  UIKeyInput *v12;
  UIKeyInput *v13;
  UIKeyInput *v14;
  UIKeyInput *textEntryView;

  if (!self->_textEntryCell)
  {
    v3 = -[PSKeychainSyncTextEntryController textEntryCellClass](self, "textEntryCellClass");
    v4 = [v3 alloc];
    v5 = -[objc_class cellStyle](v3, "cellStyle");
    -[PSKeychainSyncTextEntryController textEntrySpecifier](self, "textEntrySpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class reuseIdentifierForSpecifier:](v3, "reuseIdentifierForSpecifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSKeychainSyncTextEntryController textEntrySpecifier](self, "textEntrySpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (PSTableCell *)objc_msgSend(v4, "initWithStyle:reuseIdentifier:specifier:", v5, v7, v8);
    textEntryCell = self->_textEntryCell;
    self->_textEntryCell = v9;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSTableCell setConvertsNumeralsToASCII:](self->_textEntryCell, "setConvertsNumeralsToASCII:", -[PSKeychainSyncTextEntryController convertsNumeralsToASCII](self, "convertsNumeralsToASCII"));
    textEntryType = self->_textEntryType;
    if (textEntryType == 2)
    {
      -[PSTableCell editableTextField](self->_textEntryCell, "editableTextField");
      v14 = (UIKeyInput *)objc_claimAutoreleasedReturnValue();
      textEntryView = self->_textEntryView;
      self->_textEntryView = v14;

    }
    else if (textEntryType == 1)
    {
      -[PSTableCell passcodeField](self->_textEntryCell, "passcodeField");
      v12 = (UIKeyInput *)objc_claimAutoreleasedReturnValue();
      v13 = self->_textEntryView;
      self->_textEntryView = v12;

      -[PSTableCell setDelegate:](self->_textEntryCell, "setDelegate:", self);
    }
    -[PSTableCell setSpecifier:](self->_textEntryCell, "setSpecifier:", self->_textEntrySpecifier);
    -[PSTableCell refreshCellContentsWithSpecifier:](self->_textEntryCell, "refreshCellContentsWithSpecifier:", self->_textEntrySpecifier);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIKeyInput setSecureTextEntry:](self->_textEntryView, "setSecureTextEntry:", self->_secureTextEntry);
  }
  return self->_textEntryCell;
}

- (id)textEntryView
{
  id v3;

  v3 = -[PSKeychainSyncTextEntryController textEntryCell](self, "textEntryCell");
  return self->_textEntryView;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_secureTextEntry != a3)
  {
    v3 = a3;
    self->_secureTextEntry = a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIKeyInput setSecureTextEntry:](self->_textEntryView, "setSecureTextEntry:", v3);
  }
}

- (void)textFieldChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PSKeychainSyncTextEntryController textEntryView](self, "textEntryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PSKeychainSyncTextEntryController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", objc_msgSend(v8, "length") != 0);

    objc_msgSend(v10, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSKeychainSyncTextEntryController textEntryViewDidChange:](self, "textEntryViewDidChange:", v9);

  }
}

- (void)passcodeField:(id)a3 didUpdateEnteredPasscode:(id)a4
{
  id v5;

  v5 = a4;
  if ((unint64_t)objc_msgSend(v5, "length") >= 4)
    -[PSKeychainSyncTextEntryController didFinishEnteringText:](self, "didFinishEnteringText:", v5);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  -[PSListController specifierAtIndex:](self, "specifierAtIndex:", -[PSListController indexForIndexPath:](self, "indexForIndexPath:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncTextEntryController textEntrySpecifier](self, "textEntrySpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    -[PSKeychainSyncTextEntryController textEntryCell](self, "textEntryCell");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIKeyInput setAutocorrectionType:](self->_textEntryView, "setAutocorrectionType:", 1);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PSKeychainSyncTextEntryController;
    -[PSListController tableView:cellForRowAtIndexPath:](&v12, sel_tableView_cellForRowAtIndexPath_, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int textEntryType;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  -[PSListController specifierAtIndex:](self, "specifierAtIndex:", -[PSListController indexForIndexPath:](self, "indexForIndexPath:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncTextEntryController textEntrySpecifier](self, "textEntrySpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {
    textEntryType = self->_textEntryType;

    if (textEntryType == 1)
    {
      objc_msgSend(MEMORY[0x1E0CEA800], "defaultHeight");
      if (v11 == 0.0)
        v12 = 52.0;
      else
        v12 = v11;
      goto LABEL_12;
    }
  }
  else
  {

  }
  v27.receiver = self;
  v27.super_class = (Class)PSKeychainSyncTextEntryController;
  -[PSListController tableView:heightForRowAtIndexPath:](&v27, sel_tableView_heightForRowAtIndexPath_, v6, v7);
  v12 = v13;
  v14 = -[PSKeychainSyncTextEntryController textFieldHasRoundBorder](self, "textFieldHasRoundBorder");
  -[PSKeychainSyncTextEntryController textEntryCell](self, "textEntryCell");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v14)
  {
    objc_msgSend(v17, "setBorderWidth:", 1.0);

    -[PSKeychainSyncTextEntryController textEntryCell](self, "textEntryCell");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v21, "setBorderColor:", objc_msgSend(v22, "CGColor"));

    -[PSKeychainSyncTextEntryController textEntryCell](self, "textEntryCell");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCornerRadius:", 10.0);

    if (v12 < 50.0)
      v12 = 50.0;
  }
  else
  {
    objc_msgSend(v17, "setBorderWidth:", 0.0);

  }
LABEL_12:

  return v12;
}

- (int)textEntryType
{
  return self->_textEntryType;
}

- (BOOL)hidesNextButton
{
  return self->_hidesNextButton;
}

- (BOOL)secureTextEntry
{
  return self->_secureTextEntry;
}

- (BOOL)textFieldHasRoundBorder
{
  return self->_textFieldHasRoundBorder;
}

- (void)setTextFieldHasRoundBorder:(BOOL)a3
{
  self->_textFieldHasRoundBorder = a3;
}

- (BOOL)convertsNumeralsToASCII
{
  return self->_convertsNumeralsToASCII;
}

- (void)setConvertsNumeralsToASCII:(BOOL)a3
{
  self->_convertsNumeralsToASCII = a3;
}

- (unint64_t)numberOfPasscodeFields
{
  return self->_numberOfPasscodeFields;
}

- (void)setNumberOfPasscodeFields:(unint64_t)a3
{
  self->_numberOfPasscodeFields = a3;
}

- (NSString)textValue
{
  return self->_textValue;
}

- (void)setTextValue:(id)a3
{
  objc_storeStrong((id *)&self->_textValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textValue, 0);
  objc_storeStrong((id *)&self->_textEntrySpecifier, 0);
  objc_storeStrong((id *)&self->_textEntryView, 0);
  objc_storeStrong((id *)&self->_textEntryCell, 0);
}

@end
