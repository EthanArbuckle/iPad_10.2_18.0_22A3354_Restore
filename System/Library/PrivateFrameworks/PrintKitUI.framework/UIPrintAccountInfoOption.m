@implementation UIPrintAccountInfoOption

- (UIPrintAccountInfoOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  UIPrintAccountInfoOption *v4;
  UIPrintAccountInfoOption *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIPrintAccountInfoOption;
  v4 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v8, sel_initWithPrintInfo_printPanelViewController_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIPrintOption printInfo](v4, "printInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v5, 0x1E9D987D8, 0, 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D987D8);

  v4.receiver = self;
  v4.super_class = (Class)UIPrintAccountInfoOption;
  -[UIPrintAccountInfoOption dealloc](&v4, sel_dealloc);
}

- (BOOL)isJobAccountIDRequired
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPrinter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentPrinter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "jobAccountIDSupport") == 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)printOptionTableViewCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printOptionsTableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", CFSTR("JobAccountIDCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("JobAccountIDCell"));
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Account"), CFSTR("Account"), CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    objc_msgSend(v5, "setSelectionStyle:", 0);
    v9 = objc_alloc(MEMORY[0x1E0DC3DB8]);
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v14 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
    -[UIPrintAccountInfoOption setJobAccountIDTextField:](self, "setJobAccountIDTextField:", v14);

    -[UIPrintAccountInfoOption jobAccountIDTextField](self, "jobAccountIDTextField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", self);

    v16 = 2 * (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 0);
    -[UIPrintAccountInfoOption jobAccountIDTextField](self, "jobAccountIDTextField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextAlignment:", v16);

    -[UIPrintAccountInfoOption jobAccountIDTextField](self, "jobAccountIDTextField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setEnabled:", 1);

    -[UIPrintAccountInfoOption jobAccountIDTextField](self, "jobAccountIDTextField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSpellCheckingType:", 1);

    -[UIPrintAccountInfoOption jobAccountIDTextField](self, "jobAccountIDTextField");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAutocorrectionType:", 1);

    -[UIPrintAccountInfoOption jobAccountIDTextField](self, "jobAccountIDTextField");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHoverStyle:", 0);

    -[UIPrintAccountInfoOption jobAccountIDTextField](self, "jobAccountIDTextField");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel_changeJobAccountID_, 0x40000);

    -[UIPrintAccountInfoOption jobAccountIDTextField](self, "jobAccountIDTextField");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessoryView:", v23);

    objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v10, v11, v12, v13);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Account"), CFSTR("Account"), CFSTR("Localizable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v27);

    objc_msgSend(v24, "textProperties");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "font");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFont:", v29);

    objc_msgSend(v25, "setNumberOfLines:", 1);
    objc_msgSend(v25, "sizeToFit");
    -[UIPrintOption printPanelViewController](self, "printPanelViewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "printOptionsTableView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "rectForRowAtIndexPath:", v32);
    v34 = v33;
    v36 = v35;

    -[UIPrintAccountInfoOption jobAccountIDTextField](self, "jobAccountIDTextField");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "frame");
    v39 = v38;
    v41 = v40;

    objc_msgSend(v25, "frame");
    v43 = v34 - (v42 + 64.0);
    -[UIPrintAccountInfoOption jobAccountIDTextField](self, "jobAccountIDTextField");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setFrame:", v39, v41, v43, v36 + -8.0);

  }
  v45 = -[UIPrintAccountInfoOption isJobAccountIDRequired](self, "isJobAccountIDRequired");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v45)
    v48 = CFSTR("Account Information (Required)");
  else
    v48 = CFSTR("Account Information");
  objc_msgSend(v46, "localizedStringForKey:value:table:", v48, v48, CFSTR("Localizable"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintAccountInfoOption jobAccountIDTextField](self, "jobAccountIDTextField");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setPlaceholder:", v49);

  -[UIPrintOption printInfo](self, "printInfo");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "jobAccountID");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintAccountInfoOption jobAccountIDTextField](self, "jobAccountIDTextField");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setText:", v52);

  -[UIPrintAccountInfoOption jobAccountIDTextField](self, "jobAccountIDTextField");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setHoverStyle:", 0);

  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v5);
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__UIPrintAccountInfoOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __75__UIPrintAccountInfoOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFromPrintInfo");
}

- (void)updateFromPrintInfo
{
  void *v3;
  void *v4;
  id v5;

  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jobAccountID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintAccountInfoOption jobAccountIDTextField](self, "jobAccountIDTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

}

- (void)changeJobAccountID:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setJobAccountID:", v5);

}

- (BOOL)shouldShow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPrinter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentPrinter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsJobAccountID");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)summary
{
  return 0;
}

- (void)promptForJobAccountID
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Account information required for “%@”"), CFSTR("Account information required for “%@”"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption printInfo](self, "printInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPrinter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Enter the account information in the print options."), CFSTR("Enter the account information in the print options."), CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v9, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_ID_ALERT_BUTTON_TEXT"), CFSTR("OK"), CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __49__UIPrintAccountInfoOption_promptForJobAccountID__block_invoke;
  v19[3] = &unk_1E9D97920;
  v19[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v17);
  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "presentViewController:animated:completion:", v13, 1, 0);

}

uint64_t __49__UIPrintAccountInfoOption_promptForJobAccountID__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "selectJobAccountID");
}

- (void)selectJobAccountID
{
  void *v2;
  void *v3;
  id v4;

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editableTextField");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(v4, "becomeFirstResponder");
    v3 = v4;
  }

}

- (BOOL)canDismiss
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "isFirstResponder"))
    objc_msgSend(v4, "resignFirstResponder");
  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPrinter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "jobAccountIDSupport") == 1)
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "jobAccountID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {

LABEL_11:
      -[UIPrintAccountInfoOption promptForJobAccountID](self, "promptForJobAccountID");
      v13 = 0;
      goto LABEL_12;
    }
    v9 = (void *)v8;
    -[UIPrintOption printInfo](self, "printInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "jobAccountID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (!v12)
      goto LABEL_11;
  }
  else
  {

  }
  v13 = 1;
LABEL_12:

  return v13;
}

- (UITextField)jobAccountIDTextField
{
  return self->_jobAccountIDTextField;
}

- (void)setJobAccountIDTextField:(id)a3
{
  objc_storeStrong((id *)&self->_jobAccountIDTextField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jobAccountIDTextField, 0);
}

@end
