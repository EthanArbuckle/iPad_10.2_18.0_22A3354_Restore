@implementation ISUIKitDialogOperation

- (void)run
{
  ISUIKitDialogOperation *v2;
  void *v3;
  void *v4;
  Class UIAlertControllerClass;
  void *v6;
  void *v7;
  uint64_t v8;
  UIAlertController *alert;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  UIAlertController *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  ISUIKitDialogOperation *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  Class UIAlertActionClass;
  void *v32;
  void *v33;
  void *v34;
  Class v35;
  void *v36;
  dispatch_semaphore_t v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  NSObject *v42;
  int v43;
  id v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  dispatch_semaphore_t v49;
  id obj;
  void *v51;
  _QWORD v52[4];
  dispatch_semaphore_t v53;
  _QWORD v54[5];
  NSObject *v55;
  int v56;
  _QWORD v57[5];
  NSObject *v58;
  int v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[5];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  int v71;
  id v72;
  uint64_t v73;

  v2 = self;
  v73 = *MEMORY[0x24BDAC8D0];
  -[ISDialogOperation dialog](self, "dialog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "isDisplayable") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v40 = objc_msgSend(v39, "shouldLog");
    if (objc_msgSend(v39, "shouldLogToDisk"))
      v41 = v40 | 2;
    else
      v41 = v40;
    objc_msgSend(v39, "OSLogObject");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      v43 = v41;
    else
      v43 = v41 & 2;
    if (v43)
    {
      v71 = 138412290;
      v72 = (id)objc_opt_class();
      v44 = v72;
      LODWORD(v47) = 12;
      v45 = (void *)_os_log_send_and_compose_impl();

      if (!v45)
      {
LABEL_34:

        -[ISOperation setSuccess:](v2, "setSuccess:", 1);
        goto LABEL_38;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v45, 4, &v71, v47);
      v42 = objc_claimAutoreleasedReturnValue();
      free(v45);
      SSFileLog();
    }

    goto LABEL_34;
  }
  v49 = dispatch_semaphore_create(0);
  UIAlertControllerClass = getUIAlertControllerClass();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class alertControllerWithTitle:message:preferredStyle:](UIAlertControllerClass, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = objc_claimAutoreleasedReturnValue();
  alert = v2->_alert;
  v2->_alert = (UIAlertController *)v8;

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v48 = v4;
  objc_msgSend(v4, "textFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  v12 = MEMORY[0x24BDAC760];
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v66 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
        v17 = v2->_alert;
        v64[0] = v12;
        v64[1] = 3221225472;
        v64[2] = __29__ISUIKitDialogOperation_run__block_invoke;
        v64[3] = &unk_24C43C800;
        v64[4] = v16;
        -[UIAlertController addTextFieldWithConfigurationHandler:](v17, "addTextFieldWithConfigurationHandler:", v64);
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v13);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v4 = v48;
  objc_msgSend(v48, "buttons");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v51 = 0;
    v22 = *(_QWORD *)v61;
    obj = v18;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        v24 = v12;
        v25 = v2;
        if (*(_QWORD *)v61 != v22)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
        objc_msgSend(v26, "title");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "lowercaseString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("cancel"));

        if (v29)
        {
          v30 = v26;

          v51 = v30;
          v2 = v25;
          v12 = v24;
        }
        else
        {
          UIAlertActionClass = getUIAlertActionClass();
          objc_msgSend(v26, "title");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v24;
          v57[0] = v24;
          v57[1] = 3221225472;
          v57[2] = __29__ISUIKitDialogOperation_run__block_invoke_2;
          v57[3] = &unk_24C43C828;
          v2 = v25;
          v57[4] = v25;
          v59 = v21;
          v58 = v49;
          -[objc_class actionWithTitle:style:handler:](UIAlertActionClass, "actionWithTitle:style:handler:", v32, 0, v57);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIAlertController addAction:](v25->_alert, "addAction:", v33);
          ++v21;

        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    }
    while (v20);

    v34 = v51;
    if (v51)
    {
      v35 = getUIAlertActionClass();
      objc_msgSend(v51, "title");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v12;
      v54[1] = 3221225472;
      v54[2] = __29__ISUIKitDialogOperation_run__block_invoke_3;
      v54[3] = &unk_24C43C828;
      v54[4] = v2;
      v56 = v21;
      v37 = v49;
      v55 = v49;
      -[objc_class actionWithTitle:style:handler:](v35, "actionWithTitle:style:handler:", v36, 1, v54);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIAlertController addAction:](v2->_alert, "addAction:", v38);
      v4 = v48;
    }
    else
    {
      v4 = v48;
      v37 = v49;
    }
  }
  else
  {

    v34 = 0;
    v37 = v49;
  }
  v52[0] = v12;
  v52[1] = 3221225472;
  v52[2] = __29__ISUIKitDialogOperation_run__block_invoke_4;
  v52[3] = &unk_24C43C850;
  v53 = v37;
  v46 = v37;
  -[ISUIKitDialogOperation _showAlertWithCompletion:](v2, "_showAlertWithCompletion:", v52);
  dispatch_semaphore_wait(v46, 0xFFFFFFFFFFFFFFFFLL);

LABEL_38:
}

void __29__ISUIKitDialogOperation_run__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "keyboardType");
  v6 = 4;
  if (v5 != 4)
    v6 = v5 == 0;
  if (v5 == 7)
    v7 = 7;
  else
    v7 = v6;
  objc_msgSend(v4, "setKeyboardType:", v7);
  objc_msgSend(v4, "setSecureTextEntry:", objc_msgSend(*(id *)(a1 + 32), "isSecure"));
  objc_msgSend(*(id *)(a1 + 32), "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", v8);

  objc_msgSend(*(id *)(a1 + 32), "value");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v9);

}

intptr_t __29__ISUIKitDialogOperation_run__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "handleButtonSelected:withResponseDictionary:", *(int *)(a1 + 48), 0);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __29__ISUIKitDialogOperation_run__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "handleButtonSelected:withResponseDictionary:", *(int *)(a1 + 48), 0);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __29__ISUIKitDialogOperation_run__block_invoke_4(intptr_t result, char a2)
{
  if ((a2 & 1) == 0)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(result + 32));
  return result;
}

- (void)_cleanupAlert
{
  UIWindow *window;

  -[UIWindow setHidden:](self->_window, "setHidden:", 1);
  window = self->_window;
  self->_window = 0;

}

- (void)_showAlertWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD block[5];
  id v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (!self->_alert)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      v8 &= 2u;
    if (v8)
    {
      v15 = 138412290;
      v16 = (id)objc_opt_class();
      v10 = v16;
      LODWORD(v12) = 12;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_14:

        v5[2](v5, 0);
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v15, v12);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v11);
      SSFileLog();
    }

    goto LABEL_14;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__ISUIKitDialogOperation__showAlertWithCompletion___block_invoke;
  block[3] = &unk_24C43C878;
  block[4] = self;
  v14 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

LABEL_15:
}

void __51__ISUIKitDialogOperation__showAlertWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  int v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  NSObject *v31;
  id v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  int v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(getUIWindowClass());
  -[objc_class mainScreen](getUIScreenClass(), "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v4 = objc_msgSend(v2, "initWithFrame:");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 384);
  *(_QWORD *)(v5 + 384) = v4;

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 384);
  v8 = objc_alloc_init(getUIViewControllerClass());
  objc_msgSend(v7, "setRootViewController:", v8);

  -[objc_class sharedApplication](getUIApplicationClass(), "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 384);
    objc_msgSend(v10, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTintColor:", v13);

  }
  -[objc_class sharedApplication](getUIApplicationClass(), "sharedApplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "windows");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = *(void **)(*(_QWORD *)(a1 + 32) + 384);
    objc_msgSend(v16, "windowLevel");
    objc_msgSend(v17, "setWindowLevel:", v18 + 1.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "makeKeyAndVisible");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "rootViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = *(void **)(a1 + 40);
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 376);
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __51__ISUIKitDialogOperation__showAlertWithCompletion___block_invoke_7;
      v35[3] = &unk_24C43C150;
      v36 = v20;
      objc_msgSend(v19, "presentViewController:animated:completion:", v21, 1, v35);

LABEL_30:
      goto LABEL_31;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v29 = objc_msgSend(v28, "shouldLog");
    if (objc_msgSend(v28, "shouldLogToDisk"))
      v30 = v29 | 2;
    else
      v30 = v29;
    objc_msgSend(v28, "OSLogObject");
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      v30 &= 2u;
    if (v30)
    {
      v37 = 138412290;
      v38 = (id)objc_opt_class();
      v32 = v38;
      LODWORD(v34) = 12;
      v33 = (void *)_os_log_send_and_compose_impl();

      if (!v33)
      {
LABEL_29:

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v33, 4, &v37, v34);
      v31 = objc_claimAutoreleasedReturnValue();
      free(v33);
      SSFileLog();
    }

    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = objc_msgSend(v22, "shouldLog");
  if (objc_msgSend(v22, "shouldLogToDisk"))
    v24 = v23 | 2;
  else
    v24 = v23;
  objc_msgSend(v22, "OSLogObject");
  v25 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    v24 &= 2u;
  if (!v24)
    goto LABEL_16;
  v37 = 138412290;
  v38 = (id)objc_opt_class();
  v26 = v38;
  LODWORD(v34) = 12;
  v27 = (void *)_os_log_send_and_compose_impl();

  if (v27)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v27, 4, &v37, v34);
    v25 = objc_claimAutoreleasedReturnValue();
    free(v27);
    SSFileLog();
LABEL_16:

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_31:

}

uint64_t __51__ISUIKitDialogOperation__showAlertWithCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleButtonSelected:(int64_t)a3 withResponseDictionary:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *textFieldValues;
  NSArray *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NSArray *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  int v34;
  id v35;
  __int16 v36;
  int64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[ISDialogOperation dialog](self, "dialog", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 < 0
    || objc_msgSend(v7, "count") <= (unint64_t)a3
    || (objc_msgSend(v7, "objectAtIndexedSubscript:", a3), (v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v9, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v12 &= 2u;
    if (v12)
    {
      v34 = 138412546;
      v35 = (id)objc_opt_class();
      v36 = 2048;
      v37 = a3;
      v14 = v35;
      LODWORD(v27) = 22;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (v15)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v34, v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        free(v15);
        SSFileLog();

      }
    }
    else
    {

    }
  }
  else
  {
    v9 = (void *)v8;
    -[ISOperation delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "operation:selectedButton:", self, v9);
    }
    else if (-[ISDialogOperation performDefaultActions](self, "performDefaultActions"))
    {
      -[ISDialogOperation dialog](self, "dialog");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "performDefaultActionForDialog:", v17);

    }
    -[ISDialogOperation setSelectedButton:](self, "setSelectedButton:", v9);
    -[ISOperation lock](self, "lock");
    textFieldValues = self->super._textFieldValues;
    self->super._textFieldValues = 0;

    v19 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[UIAlertController textFields](self->_alert, "textFields");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "text");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v22);
    }

    v26 = self->super._textFieldValues;
    self->super._textFieldValues = v19;

    -[ISOperation unlock](self, "unlock");
    -[ISOperation setSuccess:](self, "setSuccess:", 1);
    -[ISUIKitDialogOperation _cleanupAlert](self, "_cleanupAlert");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_alert, 0);
}

@end
