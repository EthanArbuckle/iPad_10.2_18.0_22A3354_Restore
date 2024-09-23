@implementation SiriUIAudioRoutePickerController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SiriUIAudioRoutePickerController;
  -[SiriUIAudioRoutePickerController dealloc](&v4, sel_dealloc);
}

- (SiriUIAudioRoutePickerController)initWithCategory:(id)a3 mode:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  SiriUIAudioRoutePickerController *v11;
  SiriUIAudioRoutePickerController *v12;
  uint64_t v13;
  NSString *audioCategory;
  uint64_t v15;
  NSString *audioMode;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  objc_super v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)SiriUIAudioRoutePickerController;
  v11 = -[SiriUIAudioRoutePickerController init](&v27, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    v13 = objc_msgSend(v8, "copy");
    audioCategory = v12->_audioCategory;
    v12->_audioCategory = (NSString *)v13;

    v15 = objc_msgSend(v9, "copy");
    audioMode = v12->_audioMode;
    v12->_audioMode = (NSString *)v15;

    objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (uint64_t *)MEMORY[0x24BE64898];
    v19 = *MEMORY[0x24BE647D8];
    v28[0] = *MEMORY[0x24BE64898];
    v28[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAttribute:forKey:error:", v20, *MEMORY[0x24BE64930], 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *v18;
    objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v12, sel__pickableRoutesChanged_, v22, v23);

    v24 = *MEMORY[0x24BE647D8];
    objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v12, sel__routeChanged_, v24, v25);

    -[SiriUIAudioRoutePickerController refreshRoutes](v12, "refreshRoutes");
  }

  return v12;
}

- (void)_fetchPickableRoutesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__SiriUIAudioRoutePickerController__fetchPickableRoutesWithCompletion___block_invoke;
  v7[3] = &unk_24D7D9E88;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __71__SiriUIAudioRoutePickerController__fetchPickableRoutesWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  BOOL v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id *from;
  uint64_t v19;
  void *v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  char v25;
  BOOL v26;
  id v27;
  char v28;
  __int16 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    from = v2;
    objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = a1;
    objc_msgSend(v4, "pickableRoutesForCategory:andMode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v6);
          v13 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          v29 = 0;
          v28 = 0;
          v14 = (void *)objc_opt_class();
          v27 = 0;
          v15 = (id)objc_msgSend(v14, "_nameForRouteInfo:isSelected:isBluetooth:isOverride:audioRouteName:", v13, (char *)&v29 + 1, &v29, &v28, &v27);
          v16 = v27;
          v17 = v16;
          if (!v28 && (objc_msgSend(v16, "isEqualToString:", CFSTR("AirTunes")) & 1) == 0)
          {
            if (HIBYTE(v29))
              v10 = (_BYTE)v29 != 0;
            v9 |= (_BYTE)v29 != 0;
            objc_msgSend(v20, "addObject:", v13);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }

    if (*(_QWORD *)(v19 + 40))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __71__SiriUIAudioRoutePickerController__fetchPickableRoutesWithCompletion___block_invoke_2;
      block[3] = &unk_24D7D9E60;
      objc_copyWeak(&v24, from);
      v23 = *(id *)(v19 + 40);
      v22 = v20;
      v25 = v9 & 1;
      v26 = v10;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      objc_destroyWeak(&v24);
    }

  }
}

void __71__SiriUIAudioRoutePickerController__fetchPickableRoutesWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v3;
  }

}

- (BOOL)hasRoutesToPick
{
  return self->_hasRoutesToPick;
}

- (BOOL)bluetoothIsPicked
{
  return self->_bluetoothIsPicked;
}

- (void)showPickerFromViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SiriUIAudioRoutePickerControllerDelegate **p_delegate;
  id WeakRetained;
  id v8;

  v4 = a4;
  p_delegate = &self->_delegate;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "routePickerControllerWillShow:", self);

  -[SiriUIAudioRoutePickerController _showAlertControllerFromViewController:animated:](self, "_showAlertControllerFromViewController:animated:", v8, v4);
}

- (void)_showAlertControllerFromViewController:(id)a3 animated:(BOOL)a4
{
  id v5;
  id v6;
  SiriRoutePickerAlertWindow *v7;
  void *v8;
  UIWindow *v9;
  UIWindow *window;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  SiriRoutePickerAlertController *v15;
  SiriRoutePickerAlertController *pickerAlertController;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id location;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDF6F98]);
  v7 = [SiriRoutePickerAlertWindow alloc];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = -[SiriRoutePickerAlertWindow initWithFrame:](v7, "initWithFrame:");
  window = self->_window;
  self->_window = v9;

  -[UIWindow setRootViewController:](self->_window, "setRootViewController:", v6);
  -[UIWindow setHidden:](self->_window, "setHidden:", 0);
  objc_msgSend(v5, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "windowLevel");
  -[UIWindow setWindowLevel:](self->_window, "setWindowLevel:", v13 + 1.0);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SiriRoutePickerAlertController alertControllerWithTitle:message:preferredStyle:](SiriRoutePickerAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v15 = (SiriRoutePickerAlertController *)objc_claimAutoreleasedReturnValue();
  pickerAlertController = self->_pickerAlertController;
  self->_pickerAlertController = v15;

  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke;
  v19[3] = &unk_24D7D9F00;
  objc_copyWeak(&v22, &location);
  v19[4] = self;
  v17 = v14;
  v20 = v17;
  v18 = v6;
  v21 = v18;
  -[SiriUIAudioRoutePickerController _fetchPickableRoutesWithCompletion:](self, "_fetchPickableRoutesWithCompletion:", v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  double v19;
  double v20;
  id v21;
  id obj;
  id *WeakRetained;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  id v27;
  unsigned __int8 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v21 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v21;
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v30;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v30 != v4)
            objc_enumerationMutation(obj);
          v6 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v5);
          v28 = 0;
          objc_msgSend((id)objc_opt_class(), "_nameForRouteInfo:isSelected:isBluetooth:isOverride:audioRouteName:", v6, &v28, 0, 0, 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)MEMORY[0x24BDF67E8];
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke_2;
          v26[3] = &unk_24D7D9EB0;
          objc_copyWeak(&v27, (id *)(a1 + 56));
          v26[4] = v6;
          objc_msgSend(v8, "actionWithTitle:style:handler:", v7, 0, v26);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_setChecked:", v28);
          objc_msgSend(WeakRetained, "pickerAlertController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addAction:", v9);

          objc_destroyWeak(&v27);
          ++v5;
        }
        while (v3 != v5);
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v3);
    }

    objc_msgSend(*(id *)(a1 + 40), "localizedStringForKey:value:table:", CFSTR("SIRI_ROUTE_PICKER_CANCEL_BUTTON_TITLE"), 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDF67E8];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke_4;
    v24[3] = &unk_24D7D9ED8;
    objc_copyWeak(&v25, (id *)(a1 + 56));
    objc_msgSend(v12, "actionWithTitle:style:handler:", v11, 1, v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "pickerAlertController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v13);

    v15 = *(void **)(a1 + 48);
    objc_msgSend(WeakRetained, "pickerAlertController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentViewController:animated:completion:", v16, 1, 0);

    objc_msgSend(WeakRetained, "pickerAlertController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "popoverPresentationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setPermittedArrowDirections:", 0);
    objc_msgSend(v18, "setSourceView:", WeakRetained[4]);
    objc_msgSend(WeakRetained[4], "bounds");
    objc_msgSend(v18, "setSourceRect:", v19 * 0.5, v20 * 0.5, 1.0, 1.0);

    objc_destroyWeak(&v25);
  }

}

void __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke_3;
  v2[3] = &unk_24D7D93A0;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
}

void __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_selectRouteWithInfo:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissAlertController:", 1);

}

void __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke_4(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke_5;
  block[3] = &unk_24D7D94A0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissAlertController:", 1);

}

+ (id)_nameForRouteInfo:(id)a3 isSelected:(BOOL *)a4 isBluetooth:(BOOL *)a5 isOverride:(BOOL *)a6 audioRouteName:(id *)a7
{
  id v11;
  _QWORD *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v11 = a3;
  v12 = (_QWORD *)MEMORY[0x24BE648F0];
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE648F0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE64880]);
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE648C0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Speaker"));
  if (!v14 || (v16 & 1) == 0)
  {
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE648E0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
LABEL_6:
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE648D8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = objc_msgSend(v19, "BOOLValue");

  }
LABEL_7:
  if ((unint64_t)a5 | (unint64_t)a6)
  {
    objc_msgSend(v11, "objectForKey:", *v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a5)
      *a5 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x24BE64890]);
    if (a6)
      *a6 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BE64888]);

  }
  if (a7)
    *a7 = objc_retainAutorelease(v15);

  return v18;
}

- (void)_selectRouteWithInfo:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;

  v3 = a3;
  ADClientAddValueForScalarKey();
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE648A0];
  v9 = 0;
  v6 = objc_msgSend(v4, "setAttribute:forKey:error:", v3, v5, &v9);

  v7 = v9;
  if ((v6 & 1) == 0)
  {
    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SiriUIAudioRoutePickerController _selectRouteWithInfo:].cold.1((uint64_t)v7, v8);
  }

}

- (void)_dismissAlertController:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "routePickerControllerWillDismiss:", self);

  -[SiriRoutePickerAlertController dismissViewControllerAnimated:completion:](self->_pickerAlertController, "dismissViewControllerAnimated:completion:", v3, 0);
  -[SiriUIAudioRoutePickerController _removeWindow](self, "_removeWindow");
}

- (void)_removeWindow
{
  UIWindow *window;

  -[UIWindow setHidden:](self->_window, "setHidden:", 1);
  -[UIWindow setRootViewController:](self->_window, "setRootViewController:", 0);
  window = self->_window;
  self->_window = 0;

}

- (BOOL)isShowingPicker
{
  void *v2;
  BOOL v3;

  -[SiriRoutePickerAlertController presentingViewController](self->_pickerAlertController, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)refreshRoutes
{
  -[SiriUIAudioRoutePickerController _routeChanged:](self, "_routeChanged:", 0);
}

- (void)_pickableRoutesChanged:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__SiriUIAudioRoutePickerController__pickableRoutesChanged___block_invoke;
  v5[3] = &unk_24D7D9F28;
  objc_copyWeak(&v6, &location);
  -[SiriUIAudioRoutePickerController _fetchPickableRoutesWithCompletion:](self, "_fetchPickableRoutesWithCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __59__SiriUIAudioRoutePickerController__pickableRoutesChanged___block_invoke(uint64_t a1, uint64_t a2, unsigned __int8 a3, unsigned __int8 a4)
{
  unsigned __int8 *WeakRetained;
  unsigned __int8 *v7;
  int v8;
  id *v9;
  id v10;
  id v11;
  unsigned __int8 *v12;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v12 = WeakRetained;
    if ((a3 & 1) == 0)
    {
      v8 = objc_msgSend(WeakRetained, "isShowingPicker");
      v7 = v12;
      if (v8)
      {
        objc_msgSend(v12, "cancelPickerAnimated:", 1);
        v7 = v12;
      }
    }
    v7[40] = a3;
    v7[41] = a4;
    v9 = (id *)(v7 + 8);
    v10 = objc_loadWeakRetained((id *)v7 + 1);
    objc_msgSend(v10, "routePickerController:hasRoutesToPick:", v12, v12[40]);

    v11 = objc_loadWeakRetained(v9);
    objc_msgSend(v11, "routePickerControllerPickedNewRoute:isBluetooth:", v12, v12[41]);

    v7 = v12;
  }

}

- (SiriUIAudioRoutePickerControllerDelegate)delegate
{
  return (SiriUIAudioRoutePickerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SiriRoutePickerAlertController)pickerAlertController
{
  return self->_pickerAlertController;
}

- (void)setPickerAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_pickerAlertController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerAlertController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_audioMode, 0);
  objc_storeStrong((id *)&self->_audioCategory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_selectRouteWithInfo:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[SiriUIAudioRoutePickerController _selectRouteWithInfo:]";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_21764F000, a2, OS_LOG_TYPE_ERROR, "%s Failed picking route %{public}@", (uint8_t *)&v2, 0x16u);
}

@end
