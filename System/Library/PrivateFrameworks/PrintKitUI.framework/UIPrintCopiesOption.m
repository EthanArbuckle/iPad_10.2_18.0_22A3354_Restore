@implementation UIPrintCopiesOption

- (UIPrintCopiesOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6;
  UIPrintCopiesOption *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIPrintCopiesOption;
  v7 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v11, sel_initWithPrintInfo_printPanelViewController_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "printInteractionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption setShouldShow:](v7, "setShouldShow:", objc_msgSend(v8, "_canShowCopies"));

    -[UIPrintOption printInfo](v7, "printInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:forKeyPath:options:context:", v7, 0x1E9D98718, 0, 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D98718);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)UIPrintCopiesOption;
  -[UIPrintCopiesOption dealloc](&v5, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__UIPrintCopiesOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __70__UIPrintCopiesOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFromPrintInfo");
}

- (id)printOptionTableViewCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[3];

  v57[2] = *MEMORY[0x1E0C80C00];
  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printOptionsTableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", CFSTR("UIPrintOptionCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Copies"), CFSTR("Copies"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Copies"), CFSTR("Copies"), CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v11);

  objc_msgSend(v5, "setContentConfiguration:", v9);
  objc_msgSend(v5, "setSelectionStyle:", 0);
  v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v13 = *MEMORY[0x1E0C9D648];
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v17 = (void *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], v14, v15, v16);
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v17, "setUserInteractionEnabled:", 1);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3DB8]), "initWithFrame:", v13, v14, v15, v16);
  -[UIPrintCopiesOption setCopiesTextField:](self, "setCopiesTextField:", v18);

  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelegate:", self);

  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTextAlignment:", 1);

  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setKeyboardType:", 4);

  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBorderStyle:", 3);

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackgroundColor:", v24);

  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v26);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "userInterfaceIdiom");

  if (!v28)
  {
    v29 = objc_alloc_init(MEMORY[0x1E0DC3E68]);
    objc_msgSend(v29, "sizeToFit");
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissKeyboard);
    v57[0] = v30;
    v57[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setItems:", v32);

    -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setInputAccessoryView:", v29);

  }
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CF0]), "initWithFrame:", v13, v14, v15, v16);
  -[UIPrintCopiesOption setCopiesStepper:](self, "setCopiesStepper:", v34);

  -[UIPrintCopiesOption copiesStepper](self, "copiesStepper");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIPrintCopiesOption copiesStepper](self, "copiesStepper");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setMinimumValue:", 1.0);

  -[UIPrintCopiesOption copiesStepper](self, "copiesStepper");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setMaximumValue:", 999.0);

  -[UIPrintCopiesOption copiesStepper](self, "copiesStepper");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addTarget:action:forControlEvents:", self, sel_copiesStepperChanged_, 4096);

  -[UIPrintCopiesOption copiesStepper](self, "copiesStepper");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v39);

  v55[0] = CFSTR("copiesText");
  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = CFSTR("copiesStepper");
  v56[0] = v40;
  -[UIPrintCopiesOption copiesStepper](self, "copiesStepper");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v41;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[copiesText]-[copiesStepper]|"), 0, 0, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addConstraints:", v43);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[copiesText]|"), 0, 0, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addConstraints:", v44);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[copiesStepper]|"), 0, 0, v42);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addConstraints:", v45);

  v46 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v47, 7, 0, 0, 0, 1.0, 76.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addConstraint:", v48);

  objc_msgSend(v17, "layoutIfNeeded");
  objc_msgSend(v17, "bounds");
  objc_msgSend(v17, "setFrame:");
  v49 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v17, "bounds");
  v50 = (void *)objc_msgSend(v49, "initWithFrame:");
  objc_msgSend(v50, "setUserInteractionEnabled:", 1);
  objc_msgSend(v50, "addSubview:", v17);
  objc_msgSend(v5, "setAccessoryView:", v50);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = *MEMORY[0x1E0DC54D0];
  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addObserver:selector:name:object:", self, sel_copiesTextFieldDidChange, v52, v53);

  -[UIPrintCopiesOption updateFromPrintInfo](self, "updateFromPrintInfo");
  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v5);

  return v5;
}

- (void)updateFromPrintInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copies");

  -[UIPrintCopiesOption copiesStepper](self, "copiesStepper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:", (double)v4);

  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEditing");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld"), v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);

  }
}

- (void)copiesStepperChanged:(id)a3
{
  double v4;
  unint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "value");
  v5 = vcvtmd_s64_f64(v4);
  -[UIPrintOption printInfo](self, "printInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCopies:", v5);

  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEditing");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld"), v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v10);

  }
}

- (void)copiesTextFieldDidChange
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (double)objc_msgSend(v4, "integerValue");

  -[UIPrintCopiesOption copiesStepper](self, "copiesStepper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:", (double)(uint64_t)v5);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  if (objc_msgSend(v10, "length"))
  {
    if (objc_msgSend(v9, "keyboardType") == 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invertedSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "rangeOfCharacterFromSet:", v12);

      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = 0;
        goto LABEL_13;
      }
    }
    objc_msgSend(v9, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", location, length, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v15, "length") > 4)
      goto LABEL_5;
    v17 = objc_msgSend(v15, "integerValue");
    -[UIPrintCopiesOption copiesStepper](self, "copiesStepper");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "minimumValue");
    v16 = v19 <= (double)v17;
    if (v19 <= (double)v17)
    {
      -[UIPrintCopiesOption copiesStepper](self, "copiesStepper");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "maximumValue");
      v22 = v21;

      if (v22 < (double)v17)
      {
LABEL_5:
        v16 = 0;
LABEL_11:

        goto LABEL_13;
      }
      -[UIPrintOption printInfo](self, "printInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCopies:", v17);
    }

    goto LABEL_11;
  }
  v16 = 1;
LABEL_13:

  return v16;
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  -[UIPrintOption printInfo](self, "printInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (!v5)
  {
    v8 = 1;
LABEL_6:
    objc_msgSend(v6, "setCopies:", v8);

    return;
  }
  v7 = objc_msgSend(v6, "copies");

  if (v5 != v7)
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    v8 = v5;
    goto LABEL_6;
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (BOOL)keyboardShowing
{
  void *v2;
  char v3;

  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstResponder");

  return v3;
}

- (void)dismissKeyboard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginningOfDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textRangeFromPosition:toPosition:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectedTextRange:", v9);

  -[UIPrintCopiesOption copiesTextField](self, "copiesTextField");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resignFirstResponder");

}

- (id)textField:(id)a3 editMenuForCharactersInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = a5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = *MEMORY[0x1E0DC5120];
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      v11 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v10);
      objc_msgSend(v11, "identifier", (_QWORD)v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v9);

      if ((v13 & 1) != 0)
        break;

      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

- (UIStepper)copiesStepper
{
  return self->_copiesStepper;
}

- (void)setCopiesStepper:(id)a3
{
  objc_storeStrong((id *)&self->_copiesStepper, a3);
}

- (UITextField)copiesTextField
{
  return self->_copiesTextField;
}

- (void)setCopiesTextField:(id)a3
{
  objc_storeStrong((id *)&self->_copiesTextField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_copiesTextField, 0);
  objc_storeStrong((id *)&self->_copiesStepper, 0);
}

@end
