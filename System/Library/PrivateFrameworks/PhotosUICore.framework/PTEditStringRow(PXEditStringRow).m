@implementation PTEditStringRow(PXEditStringRow)

- (id)_px_editStringRowTextValidationAction
{
  void *v1;
  void *v2;

  objc_getAssociatedObject(a1, (const void *)_PXPTEditStringRowTextValidationActionAssociationKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = _Block_copy(v1);

  return v2;
}

- (void)_px_setEditStringRowTextValidationAction:()PXEditStringRow
{
  const void *v4;
  id v5;

  v4 = (const void *)_PXPTEditStringRowTextValidationActionAssociationKey;
  v5 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, v4, v5, (void *)1);

}

- (id)_px_validatedTextFromText:()PXEditStringRow
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v4 = a3;
  objc_msgSend(a1, "_px_editStringRowTextValidationAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "_px_editStringRowTextValidationAction");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

- (id)_px_editStringRowTextFieldAction
{
  void *v1;
  void *v2;

  objc_getAssociatedObject(a1, (const void *)_PXPTEditStringRowTextFieldActionAssociationKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = _Block_copy(v1);

  return v2;
}

- (void)_px_setEditStringRowTextFieldAction:()PXEditStringRow
{
  const void *v4;
  id v5;

  v4 = (const void *)_PXPTEditStringRowTextFieldActionAssociationKey;
  v5 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, v4, v5, (void *)1);

}

- (void)_px_updateSaveActionFromTextField
{
  void (**v1)(void);

  objc_msgSend(a1, "_px_editStringRowTextFieldAction");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (void)setValue:()PXEditStringRow
{
  void *v2;
  objc_super v3;

  objc_msgSend(a1, "_px_validatedTextFromText:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3.receiver = a1;
  v3.super_class = (Class)&off_1EEB938E0;
  objc_msgSendSuper2(&v3, sel_setValue_, v2);

}

+ (id)px_rowWithTitle:()PXEditStringRow valueKeyPath:alertTitle:alertMessage:textPlaceholder:textValidator:condition:
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;

  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  objc_msgSend(a1, "rowWithTitle:valueKeyPath:", a3, a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCondition:", v19);

  v21 = (void *)MEMORY[0x1E0D830A0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __129__PTEditStringRow_PXEditStringRow__px_rowWithTitle_valueKeyPath_alertTitle_alertMessage_textPlaceholder_textValidator_condition___block_invoke;
  v28[3] = &unk_1E511FB38;
  v29 = v15;
  v30 = v16;
  v32 = v18;
  v33 = a1;
  v31 = v17;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v18;
  objc_msgSend(v21, "actionWithHandler:", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAction:", v26);

  return v20;
}

+ (void)_px_configureTextField:()PXEditStringRow withTextPlaceholder:saveAction:forRow:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(id *);
  void *v17;
  id v18;
  id v19;
  id v20;
  id from;
  id v22;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "setAutocapitalizationType:", 0);
  objc_msgSend(v9, "setAutocorrectionType:", 1);
  objc_msgSend(v9, "setEnablesReturnKeyAutomatically:", 1);
  objc_msgSend(v9, "setPlaceholder:", v10);
  objc_msgSend(v12, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v13);

  objc_initWeak(&location, v9);
  objc_initWeak(&v22, v11);
  objc_initWeak(&from, v12);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __97__PTEditStringRow_PXEditStringRow___px_configureTextField_withTextPlaceholder_saveAction_forRow___block_invoke;
  v17 = &unk_1E513E990;
  objc_copyWeak(&v18, &from);
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &v22);
  objc_msgSend(v12, "_px_setEditStringRowTextFieldAction:", &v14);
  objc_msgSend(v12, "_px_updateSaveActionFromTextField", v14, v15, v16, v17);
  objc_msgSend(v9, "addTarget:action:forControlEvents:", v12, sel__px_updateSaveActionFromTextField, 0x20000);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

@end
