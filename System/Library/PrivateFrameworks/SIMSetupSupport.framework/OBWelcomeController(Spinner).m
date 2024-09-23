@implementation OBWelcomeController(Spinner)

- (void)_prepareSpinner
{
  void *v2;
  void *v3;
  void *v4;
  SSSpinner *v5;
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
  id v18;

  objc_msgSend(a1, "spinnerContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setSpinnerContainer:", v3);

    objc_msgSend(a1, "spinnerContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:forState:", CFSTR(" "), 0);

    v5 = -[SSSpinner initWithText:]([SSSpinner alloc], "initWithText:", CFSTR(" "));
    objc_msgSend(a1, "setSpinner:", v5);

    objc_msgSend(a1, "spinner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(a1, "spinnerContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "spinner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    objc_msgSend(a1, "spinner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "spinnerContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    objc_msgSend(a1, "spinner");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "spinnerContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

  }
}

- (void)_showButtonTraySpinnerWithBusyText:()Spinner
{
  id v4;
  char v5;
  id v6;
  _QWORD block[5];
  id v8;
  char v9;

  v4 = a3;
  v5 = objc_msgSend(a1, "animating");
  objc_msgSend(a1, "setAnimating:", 1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__OBWelcomeController_Spinner___showButtonTraySpinnerWithBusyText___block_invoke;
  block[3] = &unk_24DEF2B50;
  v9 = v5;
  block[4] = a1;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)_hideButtonTraySpinner
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__OBWelcomeController_Spinner___hideButtonTraySpinner__block_invoke;
  block[3] = &unk_24DEF29A8;
  block[4] = a1;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_updateTrayButtonText:()Spinner
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v12, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("InstallStateKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PostInstall"));
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7)
        v10 = CFSTR("CONTINUE_BUTTON_STATE_POST_INSTALLING");
      else
        v10 = CFSTR("CONTINUE_BUTTON_STATE_INSTALLING");
      objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24DEF4290, CFSTR("Localizable"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_updateBusyText:", v11);

    }
  }

}

- (void)_updateBusyText:()Spinner
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "buttonTray", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "updateBusyText:", v4);
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(a1, "spinner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateText:", v4);
LABEL_11:

}

@end
