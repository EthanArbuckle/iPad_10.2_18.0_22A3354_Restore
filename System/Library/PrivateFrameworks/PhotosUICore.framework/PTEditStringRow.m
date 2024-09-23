@implementation PTEditStringRow

void __97__PTEditStringRow_PXEditStringRow___px_configureTextField_withTextPlaceholder_saveAction_forRow___block_invoke(id *a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  _BOOL8 v5;
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v3 = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_px_validatedTextFromText:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v7, "length") != 0;
  v6 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v6, "setEnabled:", v5);

}

uint64_t __129__PTEditStringRow_PXEditStringRow__px_rowWithTitle_valueKeyPath_alertTitle_alertMessage_textPlaceholder_textValidator_condition___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17[2];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id from;
  id location;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
  objc_msgSend(v5, "_px_setEditStringRowTextValidationAction:", v7);

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v8);
  objc_initWeak(&from, v5);
  v9 = (void *)MEMORY[0x1E0DC3448];
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __129__PTEditStringRow_PXEditStringRow__px_rowWithTitle_valueKeyPath_alertTitle_alertMessage_textPlaceholder_textValidator_condition___block_invoke_2;
  v19[3] = &unk_1E511FAE8;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &from);
  objc_msgSend(v9, "actionWithTitle:style:handler:", CFSTR("Save"), 0, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v11);
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v12);
  objc_initWeak(&v18, v11);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __129__PTEditStringRow_PXEditStringRow__px_rowWithTitle_valueKeyPath_alertTitle_alertMessage_textPlaceholder_textValidator_condition___block_invoke_3;
  v14[3] = &unk_1E511FB10;
  v17[1] = *(id *)(a1 + 64);
  v15 = *(id *)(a1 + 48);
  objc_copyWeak(&v16, &v18);
  objc_copyWeak(v17, &from);
  objc_msgSend(v8, "addTextFieldWithConfigurationHandler:", v14);
  objc_msgSend(v6, "presentViewController:animated:completion:", v8, 1, 0);
  objc_destroyWeak(v17);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __129__PTEditStringRow_PXEditStringRow__px_rowWithTitle_valueKeyPath_alertTitle_alertMessage_textPlaceholder_textValidator_condition___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "textFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v5, "setValue:", v4);

}

void __129__PTEditStringRow_PXEditStringRow__px_rowWithTitle_valueKeyPath_alertTitle_alertMessage_textPlaceholder_textValidator_condition___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v3 = *(void **)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "_px_configureTextField:withTextPlaceholder:saveAction:forRow:", v6, v4, WeakRetained, v7);

}

@end
