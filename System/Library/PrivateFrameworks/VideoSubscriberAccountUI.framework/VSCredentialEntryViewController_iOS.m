@implementation VSCredentialEntryViewController_iOS

- (Class)tableViewClass
{
  return (Class)objc_opt_class();
}

- (VSCredentialEntryViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  VSCredentialEntryViewController_iOS *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;
  _QWORD v27[3];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)VSCredentialEntryViewController_iOS;
  v8 = -[VSCredentialEntryViewController_iOS initWithNibName:bundle:](&v26, sel_initWithNibName_bundle_, v6, v7);
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDF8CE8]);
    objc_msgSend(v9, "setObject:", v8);
    -[VSCredentialEntryViewController_iOS setWeakTarget:](v8, "setWeakTarget:", v9);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v8);
    v12 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke;
    v23[3] = &unk_24FE1AF48;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x24BDF7F58], 0, v11, v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&v8->_textFieldTextDidChangeObserver, v13);

    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_2;
    v21[3] = &unk_24FE1AF48;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x24BDF7B80], 0, v11, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&v8->_keyboardWillShowObserver, v14);

    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_4;
    v19[3] = &unk_24FE1AF48;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x24BDF7B78], 0, v11, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&v8->_keyboardWillHideObserver, v15);

    v27[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)-[VSCredentialEntryViewController_iOS registerForTraitChanges:withHandler:](v8, "registerForTraitChanges:withHandler:", v16, &__block_literal_global_18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  id WeakRetained;
  id v5;
  id v6;
  objc_super v7;

  -[VSCredentialEntryViewController_iOS _stopObservingViewModel:](self, "_stopObservingViewModel:", self->_viewModel);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained(&self->_textFieldTextDidChangeObserver);
  if (WeakRetained)
    objc_msgSend(v3, "removeObserver:", WeakRetained);
  v5 = objc_loadWeakRetained(&self->_keyboardWillShowObserver);
  if (v5)
    objc_msgSend(v3, "removeObserver:", v5);

  v6 = objc_loadWeakRetained(&self->_keyboardWillHideObserver);
  if (v6)
    objc_msgSend(v3, "removeObserver:", v6);

  v7.receiver = self;
  v7.super_class = (Class)VSCredentialEntryViewController_iOS;
  -[ACUIViewController dealloc](&v7, sel_dealloc);
}

- (void)_presentError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  VSErrorLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[VSCredentialEntryViewController_iOS _presentError:].cold.1((uint64_t)v4, v5);

  VSAlertForError(v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSCredentialEntryViewController_iOS presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (id)_specifierForTextField:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ACUIViewController specifiers](self, "specifiers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[VSCredentialEntryViewController_iOS _textFieldForSpecifier:](self, "_textFieldForSpecifier:", v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (v11 == v4)
        {
          v12 = v10;

          goto LABEL_11;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)_textFieldForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  void *v12;

  -[VSCredentialEntryViewController_iOS indexPathForSpecifier:](self, "indexPathForSpecifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSCredentialEntryViewController_iOS table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v6)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The cellOrNil parameter must not be nil."));
    v7 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = (void *)MEMORY[0x24BDBCE88];
      v9 = *MEMORY[0x24BDBCAB8];
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise:format:", v9, CFSTR("Unexpectedly, cell was %@, instead of PSEditableTableCell."), v11);

    }
    objc_msgSend(v7, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_credentialEntryFieldForSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[VSCredentialEntryViewController_iOS viewModel](self, "viewModel", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "credentialEntryFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if (v15)
        {
          v16 = v12;

          v9 = v16;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_textForSpecifier:(id)a3
{
  void *v3;
  void *v4;

  -[VSCredentialEntryViewController_iOS _credentialEntryFieldForSpecifier:](self, "_credentialEntryFieldForSpecifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setText:(id)a3 forSpecifier:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  v6 = (__CFString *)a3;
  v7 = &stru_24FE1B848;
  if (v6)
    v7 = v6;
  v10 = v7;
  -[VSCredentialEntryViewController_iOS _credentialEntryFieldForSpecifier:](self, "_credentialEntryFieldForSpecifier:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v10);

  -[VSCredentialEntryViewController_iOS viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "validateCredentialEntryFields");

}

- (id)_linkURL
{
  void *v2;
  void *v3;

  -[VSCredentialEntryViewController_iOS viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "linkURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_linkButtonTapped:(id)a3
{
  void *v3;
  id v4;

  -[VSCredentialEntryViewController_iOS _linkURL](self, "_linkURL", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    VSOpenURL();
    v3 = v4;
  }

}

- (void)_jsButtonTapped:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[VSCredentialEntryViewController_iOS buttons](self, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  -[VSCredentialEntryViewController_iOS viewModel](self, "viewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buttonTappedAtIndex:", v6);

}

- (void)_startValidation
{
  void *v2;
  id v3;

  -[VSCredentialEntryViewController_iOS table](self, "table");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

}

- (void)_startObservingViewModel:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = kVSKeyValueObservingContext_DoneButton;
  v5 = a3;
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("beginValidationButtonEnabled"), 4, v4);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("logo"), 4, kVSKeyValueObservingContext_Image);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("validationState"), 3, kVSKeyValueObservingContext_ValidationState_0);
  objc_msgSend(v5, "picker");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("selectedIndex"), 4, kVSKeyValueObservingContext_PickerSelectedItemIndex);
}

- (void)_stopObservingViewModel:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = kVSKeyValueObservingContext_DoneButton;
  v5 = a3;
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("beginValidationButtonEnabled"), v4);
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("logo"), kVSKeyValueObservingContext_Image);
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("validationState"), kVSKeyValueObservingContext_ValidationState_0);
  objc_msgSend(v5, "picker");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("selectedIndex"), kVSKeyValueObservingContext_PickerSelectedItemIndex);
}

- (id)_createSpecifierForField:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "isSecure"))
    v5 = 12;
  else
    v5 = 8;
  v6 = (void *)MEMORY[0x24BE755F0];
  objc_msgSend(v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSCredentialEntryViewController_iOS weakTarget](self, "weakTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, v8, sel__setText_forSpecifier_, sel__textForSpecifier_, 0, v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isSecure"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v10, *MEMORY[0x24BE75BE8]);

  }
  objc_msgSend(v9, "setKeyboardType:autoCaps:autoCorrection:", objc_msgSend(v4, "keyboardType"), objc_msgSend(v4, "autocapitalizationType"), objc_msgSend(v4, "autocorrectionType"));
  objc_msgSend(v4, "placeholder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPlaceholder:", v11);

  return v9;
}

- (void)setViewModel:(id)a3
{
  VSCredentialEntryViewModel *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
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
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[2];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = (VSCredentialEntryViewModel *)a3;
  if (self->_viewModel != v5)
  {
    -[VSCredentialEntryViewController_iOS _stopObservingViewModel:](self, "_stopObservingViewModel:");
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[VSViewModel title](v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSCredentialEntryViewController_iOS setTitle:](self, "setTitle:", v6);

    v7 = objc_alloc(MEMORY[0x24BDF6860]);
    -[VSCuratedViewModel beginValidationButtonTitle](v5, "beginValidationButtonTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithTitle:style:target:action:", v8, 0, self, sel_doneButtonPressed_);

    objc_msgSend(v9, "setEnabled:", 0);
    -[ACUIViewController setDoneButton:](self, "setDoneButton:", v9);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[VSCredentialEntryViewModel credentialEntryFields](v5, "credentialEntryFields");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v38 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          -[VSCredentialEntryViewController_iOS _createSpecifierForField:](self, "_createSpecifierForField:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setIdentifier:", v18);

          objc_msgSend(v10, "addObject:", v17);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v13);
    }

    -[VSCredentialEntryViewModel picker](v5, "picker");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[VSCredentialEntryViewModel picker](v5, "picker");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [viewModel picker] parameter must not be nil."));
      -[VSCredentialEntryViewModel picker](v5, "picker");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSCredentialEntryViewController_iOS setPicker:](self, "setPicker:", v21);
      v22 = (void *)MEMORY[0x24BE75590];
      -[VSCredentialEntryViewController_iOS pickerTitle](self, "pickerTitle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, self, 0, 0, 0, 13, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "setButtonAction:", sel_pickerButtonSelected);
      -[VSCredentialEntryViewController_iOS setPickerButtonSpecifier:](self, "setPickerButtonSpecifier:", v24);
      objc_msgSend(v10, "addObject:", v24);

    }
    if (-[VSCuratedViewModel showFooter](v5, "showFooter"))
    {
      -[VSCuratedViewModel message](v5, "message");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSCredentialEntryViewModel additionalMessage](v5, "additionalMessage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v25 && objc_msgSend(v26, "length"))
      {
        v28 = v25;
        if (!v27)
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The additionalMessageOrNil parameter must not be nil."));
        v41[0] = v28;
        v41[1] = v27;
        v29 = (void *)MEMORY[0x24BDBCE30];
        v30 = v27;
        objc_msgSend(v29, "arrayWithObjects:count:", v41, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[VSCuratedViewModel notice](v5, "notice");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSCuratedViewModel footerText](v5, "footerText");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      VSSpecifierForFooter(v25, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v34);

    }
    -[VSCredentialEntryViewController_iOS setSpecifiers:](self, "setSpecifiers:", v10);
    -[VSCredentialEntryViewController_iOS logoView](self, "logoView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSCuratedViewModel logoAccessibilityLabel](v5, "logoAccessibilityLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAccessibilityLabel:", v36);

    -[VSCredentialEntryViewController_iOS _startObservingViewModel:](self, "_startObservingViewModel:", v5);
  }

}

- (void)buildButtonsIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  double v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  CGFloat Width;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t i;
  void *v23;
  void *v24;
  VSMultilineButton *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  VSMultilineButton *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  uint64_t j;
  void *v62;
  double x;
  double v64;
  double height;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  id obj;
  double v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v85 = *MEMORY[0x24BDAC8D0];
  -[VSCredentialEntryViewController_iOS viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[VSCredentialEntryViewController_iOS buttonView](self, "buttonView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    v72 = v3;
    v5 = v3;
    v6 = objc_alloc(MEMORY[0x24BDF6F90]);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v8 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], v7, *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[VSCredentialEntryViewController_iOS view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    Width = CGRectGetWidth(v86);

    v69 = v12;
    v70 = v10;
    v87.origin.x = v10;
    v87.origin.y = v12;
    v68 = Width;
    v87.size.width = Width;
    v87.size.height = v14;
    v17 = CGRectGetWidth(v87);
    -[VSCredentialEntryViewController_iOS setButtons:](self, "setButtons:", MEMORY[0x24BDBD1A8]);
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v71 = v5;
    objc_msgSend(v5, "buttons");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v80;
      v74 = v17 + -40.0;
      v21 = 0.0;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          v23 = v8;
          if (*(_QWORD *)v80 != v20)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
          v25 = objc_alloc_init(VSMultilineButton);
          objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSMultilineButton setTitleColor:forState:](v25, "setTitleColor:forState:", v26, 1);

          objc_msgSend(v24, "title");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSMultilineButton setTitle:forState:](v25, "setTitle:forState:", v27, 0);

          -[VSMultilineButton titleLabel](v25, "titleLabel");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setTextAlignment:", 1);

          -[VSMultilineButton titleLabel](v25, "titleLabel");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setNumberOfLines:", 0);

          -[VSMultilineButton addTarget:action:forControlEvents:](v25, "addTarget:action:forControlEvents:", self, sel__jsButtonTapped_, 64);
          -[VSMultilineButton sizeThatFits:](v25, "sizeThatFits:", v74, 1.79769313e308);
          v31 = v30 + 20.0;
          v33 = v32 + 10.0;
          v34 = v17;
          *(float *)&v30 = v17 - (v30 + 20.0);
          v35 = floorf(*(float *)&v30 * 0.5);
          -[VSMultilineButton setFrame:](v25, "setFrame:", v35, v7, v31, v32 + 10.0);
          -[VSCredentialEntryViewController_iOS buttons](self, "buttons");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_msgSend(v36, "mutableCopy");
          v38 = v37;
          if (v37)
          {
            v39 = v37;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v39 = (id)objc_claimAutoreleasedReturnValue();
          }
          v40 = v39;

          objc_msgSend(v40, "addObject:", v25);
          v41 = (void *)objc_msgSend(v40, "copy");
          -[VSCredentialEntryViewController_iOS setButtons:](self, "setButtons:", v41);

          v8 = v23;
          objc_msgSend(v23, "addSubview:", v25);
          v88.origin.x = v35;
          v88.origin.y = v7;
          v88.size.width = v31;
          v88.size.height = v33;
          v21 = v21 + CGRectGetHeight(v88) + 20.0;

          v17 = v34;
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
      }
      while (v19);
    }
    else
    {
      v21 = 0.0;
    }

    objc_msgSend(v71, "linkURL");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = objc_alloc_init(VSMultilineButton);
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSMultilineButton setTitleColor:forState:](v43, "setTitleColor:forState:", v44, 1);

      objc_msgSend(v71, "linkTitle");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSMultilineButton setTitle:forState:](v43, "setTitle:forState:", v45, 0);

      -[VSMultilineButton titleLabel](v43, "titleLabel");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setNumberOfLines:", 0);

      -[VSMultilineButton titleLabel](v43, "titleLabel");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setTextAlignment:", 1);

      -[VSMultilineButton addTarget:action:forControlEvents:](v43, "addTarget:action:forControlEvents:", self, sel__linkButtonTapped_, 64);
      -[VSMultilineButton sizeThatFits:](v43, "sizeThatFits:", v17 + -40.0, 1.79769313e308);
      v49 = v48 + 20.0;
      v51 = v50 + 10.0;
      *(float *)&v48 = v17 - (v48 + 20.0);
      v52 = floorf(*(float *)&v48 * 0.5);
      -[VSMultilineButton setFrame:](v43, "setFrame:", v52, v7, v49, v50 + 10.0);
      -[VSCredentialEntryViewController_iOS setLinkButton:](self, "setLinkButton:", v43);
      objc_msgSend(v8, "addSubview:", v43);
      v89.origin.x = v52;
      v89.origin.y = v7;
      v89.size.width = v49;
      v89.size.height = v51;
      v21 = v21 + CGRectGetHeight(v89) + 20.0;

    }
    objc_msgSend(v8, "setFrame:", v70, v69, v68, v21);
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    -[VSCredentialEntryViewController_iOS linkButton](self, "linkButton");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSCredentialEntryViewController_iOS buttons](self, "buttons");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      -[VSCredentialEntryViewController_iOS linkButton](self, "linkButton");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "arrayByAddingObject:", v55);
      v56 = objc_claimAutoreleasedReturnValue();

      v54 = (void *)v56;
    }

    v57 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v76;
      v60 = 0.0;
      do
      {
        for (j = 0; j != v58; ++j)
        {
          if (*(_QWORD *)v76 != v59)
            objc_enumerationMutation(v54);
          v62 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
          objc_msgSend(v62, "frame");
          x = v90.origin.x;
          v64 = v90.size.width;
          height = v90.size.height;
          v66 = v60 + 20.0;
          v90.origin.y = v60 + 20.0;
          v60 = v60 + 20.0 + CGRectGetHeight(v90);
          objc_msgSend(v62, "setFrame:", x, v66, v64, height);
        }
        v58 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      }
      while (v58);
    }

    -[VSCredentialEntryViewController_iOS setButtonView:](self, "setButtonView:", v8);
    -[VSCredentialEntryViewController_iOS view](self, "view");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addSubview:", v8);

    v3 = v72;
  }

}

- (void)pickerButtonSelected
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

  -[VSCredentialEntryViewController_iOS pickerSpecifier](self, "pickerSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ACUIViewController specifiers](self, "specifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    -[VSCredentialEntryViewController_iOS pickerSpecifier](self, "pickerSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [self pickerSpecifier] parameter must not be nil."));
    -[VSCredentialEntryViewController_iOS pickerSpecifier](self, "pickerSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v7);

    -[VSCredentialEntryViewController_iOS setPickerSpecifier:](self, "setPickerSpecifier:", 0);
    -[VSCredentialEntryViewController_iOS setSpecifiers:](self, "setSpecifiers:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24FE1B848, self, 0, 0, 0, 3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", CFSTR("TIME_PICKER"));
    v8 = (void *)MEMORY[0x24BDD16E0];
    +[VSPSPickerTableViewCell preferredHeight](VSPSPickerTableViewCell, "preferredHeight");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProperty:forKey:", v9, *MEMORY[0x24BE75D10]);

    objc_msgSend(v5, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    -[VSCredentialEntryViewController_iOS setPickerSpecifier:](self, "setPickerSpecifier:", v5);
    -[ACUIViewController specifiers](self, "specifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    -[VSCredentialEntryViewController_iOS pickerButtonSpecifier](self, "pickerButtonSpecifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ps_insertObject:afterObject:", v5, v12);

    -[VSCredentialEntryViewController_iOS setSpecifiers:](self, "setSpecifiers:", v11);
  }

  -[VSCredentialEntryViewController_iOS _updateLinkButtonLayout](self, "_updateLinkButtonLayout");
}

- (id)pickerTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[VSCredentialEntryViewController_iOS picker](self, "picker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [self picker] parameter must not be nil."));
  -[VSCredentialEntryViewController_iOS picker](self, "picker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  -[VSCredentialEntryViewController_iOS picker](self, "picker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pickerItemAtCurrentIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@"), v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)pickerViewCell:(id)a3 titleForRow:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[VSCredentialEntryViewController_iOS picker](self, "picker", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [self picker] parameter must not be nil."));
  -[VSCredentialEntryViewController_iOS picker](self, "picker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pickerItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)pickerViewCellInitialSelectedRow:(id)a3
{
  void *v3;
  int64_t v4;

  -[VSCredentialEntryViewController_iOS picker](self, "picker", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedIndex");

  return v4;
}

- (int64_t)pickerViewCellNumberOfRows:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[VSCredentialEntryViewController_iOS picker](self, "picker", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pickerItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)pickerViewCell:(id)a3 didSelectRow:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[VSCredentialEntryViewController_iOS picker](self, "picker", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectedIndex:", a4);

  -[VSCredentialEntryViewController_iOS viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pickerDidSelectRow:", a4);

  -[VSCredentialEntryViewController_iOS pickerButtonSpecifier](self, "pickerButtonSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSCredentialEntryViewController_iOS pickerTitle](self, "pickerTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setName:", v9);

  -[VSCredentialEntryViewController_iOS pickerButtonSpecifier](self, "pickerButtonSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSCredentialEntryViewController_iOS reloadSpecifier:](self, "reloadSpecifier:", v10);

  -[VSCredentialEntryViewController_iOS _updateLinkButtonLayout](self, "_updateLinkButtonLayout");
}

- (CGSize)preferredLogoSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[VSCredentialEntryViewController_iOS logoView](self, "logoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredImageSize");
  v4 = v3;
  v6 = v5;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  v10 = v6 * v9;
  v11 = v4 * v9;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_super v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  VSCredentialEntryViewController_iOS *v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if ((void *)kVSKeyValueObservingContext_DoneButton == a6)
  {
    -[ACUIViewController doneButton](self, "doneButton");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[VSCredentialEntryViewController_iOS viewModel](self, "viewModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEnabled:", objc_msgSend(v15, "isBeginValidationButtonEnabled"));

LABEL_14:
    goto LABEL_15;
  }
  if ((void *)kVSKeyValueObservingContext_Image == a6)
  {
    if (!v11)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The objectOrNil parameter must not be nil."));
    v16 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = (void *)MEMORY[0x24BDBCE88];
      v18 = *MEMORY[0x24BDBCAB8];
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "raise:format:", v18, CFSTR("Unexpectedly, object was %@, instead of VSCredentialEntryViewModel."), v20);

    }
    v14 = v16;
    if (!v10)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The keyPathOrNil parameter must not be nil."));
    objc_msgSend(v14, "valueForKeyPath:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSCredentialEntryViewController_iOS logoView](self, "logoView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLogo:", v21);

    goto LABEL_14;
  }
  if ((void *)kVSKeyValueObservingContext_ValidationState_0 == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E80]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "unsignedIntegerValue");

    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "unsignedIntegerValue");

    VSDefaultLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v35 = v24;
      v36 = 2048;
      v37 = v26;
      _os_log_impl(&dword_2303C5000, v27, OS_LOG_TYPE_DEFAULT, "credential entry controller validation state changed from %lu to %lu", buf, 0x16u);
    }

    if (v26 != 3)
    {
      if (v26 == 2)
      {
        if (v24)
          goto LABEL_15;
      }
      else if (v26 != 1)
      {
        goto LABEL_15;
      }
      -[VSCredentialEntryViewController_iOS _startValidation](self, "_startValidation");
      goto LABEL_15;
    }
    if (v24 == 2)
      -[ACUIViewController setCellsChecked:](self, "setCellsChecked:", 1);
  }
  else if ((void *)kVSKeyValueObservingContext_PickerSelectedItemIndex == a6)
  {
    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = __86__VSCredentialEntryViewController_iOS_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v32 = &unk_24FE19778;
    v33 = self;
    VSPerformBlockOnMainThread();
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)VSCredentialEntryViewController_iOS;
    -[VSCredentialEntryViewController_iOS observeValueForKeyPath:ofObject:change:context:](&v28, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }
LABEL_15:

}

- (void)cancelButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[VSCredentialEntryViewController_iOS viewModel](self, "viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "credentialEntryFields", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "setText:", &stru_24FE1B848);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[VSCredentialEntryViewController_iOS delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "authenticationViewControllerDidCancel:", self);

}

- (void)doneButtonPressed:(id)a3
{
  id v3;

  -[VSCredentialEntryViewController_iOS viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValidationState:", 1);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  VSIdentityProviderLogoView *v5;
  VSIdentityProviderLogoView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VSCredentialEntryViewController_iOS;
  -[ACUIViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[VSCredentialEntryViewController_iOS table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VSCredentialEntryViewController_iOS table](self, "table");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setViewController:", self);

  }
  objc_msgSend(v3, "setPreservesSuperviewLayoutMargins:", 1);
  v5 = [VSIdentityProviderLogoView alloc];
  objc_msgSend(v3, "bounds");
  v6 = -[VSIdentityProviderLogoView initWithFrame:](v5, "initWithFrame:");
  -[VSCredentialEntryViewController_iOS viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderLogoView setLogo:](v6, "setLogo:", v8);

  -[VSCredentialEntryViewController_iOS viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logoAccessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderLogoView setAccessibilityLabel:](v6, "setAccessibilityLabel:", v10);

  -[VSCredentialEntryViewController_iOS setLogoView:](self, "setLogoView:", v6);
  -[VSIdentityProviderLogoView sizeToFit](v6, "sizeToFit");
  objc_msgSend(v3, "setTableHeaderView:", v6);
  VSAuthenticationViewControllerViewDidLoad(self);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSCredentialEntryViewController_iOS;
  -[VSCredentialEntryViewController_iOS viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[VSCredentialEntryViewController_iOS buildButtonsIfNeeded](self, "buildButtonsIfNeeded");
  VSAuthenticationViewControllerViewWillAppear(self);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSCredentialEntryViewController_iOS;
  -[VSCredentialEntryViewController_iOS viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  VSAuthenticationViewControllerViewDidAppear(self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSCredentialEntryViewController_iOS;
  -[VSCredentialEntryViewController_iOS viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  VSAuthenticationViewControllerViewWillDisappear(self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSCredentialEntryViewController_iOS;
  -[VSCredentialEntryViewController_iOS viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  VSAuthenticationViewControllerViewDidDisappear(self);
}

- (void)_updateLinkButtonLayout
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  CGRect v37;

  -[VSCredentialEntryViewController_iOS view](self, "view");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VSCredentialEntryViewController_iOS keyboardHeight](self, "keyboardHeight");
  v12 = v11;
  -[VSCredentialEntryViewController_iOS buttonView](self, "buttonView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v37.origin.x = v4;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  v20 = CGRectGetMaxY(v37) - v12 - v19 + -20.0;
  -[VSCredentialEntryViewController_iOS table](self, "table");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "contentSize");
  v23 = v22;
  objc_msgSend(v21, "contentOffset");
  v25 = v24;
  -[VSCredentialEntryViewController_iOS view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  objc_msgSend(v26, "convertRect:fromView:", v21);
  v28 = v27;

  if (v23 + v28 - v25 + 10.0 <= v20)
    v29 = v20;
  else
    v29 = v23 + v28 - v25 + 10.0;
  objc_msgSend(v21, "contentInset");
  v31 = v30;
  v33 = v32;
  v35 = v34;
  objc_msgSend(v13, "setFrame:", v15, v29, v17, v19);
  objc_msgSend(v21, "setContentInset:", v31, v33, v12 + v19 + 40.0, v35);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSCredentialEntryViewController_iOS;
  -[VSCredentialEntryViewController_iOS viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[VSCredentialEntryViewController_iOS _updateLinkButtonLayout](self, "_updateLinkButtonLayout");
}

- (void)scrollViewDidScroll:(id)a3
{
  id v5;
  objc_super v6;

  v5 = a3;
  if (objc_msgSend(MEMORY[0x24BE00F00], "instancesRespondToSelector:", a2))
  {
    v6.receiver = self;
    v6.super_class = (Class)VSCredentialEntryViewController_iOS;
    -[VSCredentialEntryViewController_iOS scrollViewDidScroll:](&v6, sel_scrollViewDidScroll_, v5);
  }
  -[VSCredentialEntryViewController_iOS _updateLinkButtonLayout](self, "_updateLinkButtonLayout");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double width;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  float v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  width = a3.width;
  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[VSCredentialEntryViewController_iOS buttonView](self, "buttonView", a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "frame");
        v13 = width - v12;
        objc_msgSend(v11, "setFrame:", floorf(v13 * 0.5));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (BOOL)isCancellationAllowed
{
  return self->_cancellationAllowed;
}

- (void)setCancellationAllowed:(BOOL)a3
{
  self->_cancellationAllowed = a3;
}

- (VSCredentialEntryViewModel)viewModel
{
  return self->_viewModel;
}

- (VSAuthenticationViewControllerDelegate)delegate
{
  return (VSAuthenticationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSIdentityProviderLogoView)logoView
{
  return self->_logoView;
}

- (void)setLogoView:(id)a3
{
  objc_storeStrong((id *)&self->_logoView, a3);
}

- (UIButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
  objc_storeStrong((id *)&self->_linkButton, a3);
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (UIView)buttonView
{
  return self->_buttonView;
}

- (void)setButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonView, a3);
}

- (NSArray)fieldSpecifiers
{
  return self->_fieldSpecifiers;
}

- (void)setFieldSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_fieldSpecifiers, a3);
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (id)textFieldTextDidChangeObserver
{
  return objc_loadWeakRetained(&self->_textFieldTextDidChangeObserver);
}

- (void)setTextFieldTextDidChangeObserver:(id)a3
{
  objc_storeWeak(&self->_textFieldTextDidChangeObserver, a3);
}

- (id)keyboardWillShowObserver
{
  return objc_loadWeakRetained(&self->_keyboardWillShowObserver);
}

- (void)setKeyboardWillShowObserver:(id)a3
{
  objc_storeWeak(&self->_keyboardWillShowObserver, a3);
}

- (id)keyboardWillHideObserver
{
  return objc_loadWeakRetained(&self->_keyboardWillHideObserver);
}

- (void)setKeyboardWillHideObserver:(id)a3
{
  objc_storeWeak(&self->_keyboardWillHideObserver, a3);
}

- (id)weakTarget
{
  return self->_weakTarget;
}

- (void)setWeakTarget:(id)a3
{
  objc_storeStrong(&self->_weakTarget, a3);
}

- (PSSpecifier)pickerButtonSpecifier
{
  return self->_pickerButtonSpecifier;
}

- (void)setPickerButtonSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_pickerButtonSpecifier, a3);
}

- (PSSpecifier)pickerSpecifier
{
  return self->_pickerSpecifier;
}

- (void)setPickerSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_pickerSpecifier, a3);
}

- (VSCredentialEntryPicker)picker
{
  return self->_picker;
}

- (void)setPicker:(id)a3
{
  objc_storeStrong((id *)&self->_picker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_picker, 0);
  objc_storeStrong((id *)&self->_pickerSpecifier, 0);
  objc_storeStrong((id *)&self->_pickerButtonSpecifier, 0);
  objc_storeStrong(&self->_weakTarget, 0);
  objc_destroyWeak(&self->_keyboardWillHideObserver);
  objc_destroyWeak(&self->_keyboardWillShowObserver);
  objc_destroyWeak(&self->_textFieldTextDidChangeObserver);
  objc_storeStrong((id *)&self->_fieldSpecifiers, 0);
  objc_storeStrong((id *)&self->_buttonView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)_presentError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2303C5000, a2, OS_LOG_TYPE_ERROR, "Will present error: %@", (uint8_t *)&v2, 0xCu);
}

@end
