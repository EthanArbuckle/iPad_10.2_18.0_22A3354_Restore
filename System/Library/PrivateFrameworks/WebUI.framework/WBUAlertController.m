@implementation WBUAlertController

- (WBUAlertController)initWithAlert:(id)a3 automaticallyDismiss:(BOOL)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  WBUAlertController *v11;
  WBUAlertController *v12;
  uint64_t v13;
  id handler;
  WBUAlertController *v15;

  v9 = a3;
  v10 = a5;
  v11 = -[WBUAlertController init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_alert, a3);
    v12->_automaticallyDismiss = a4;
    v13 = MEMORY[0x212BD7EA4](v10);
    handler = v12->_handler;
    v12->_handler = (id)v13;

    -[WBUAlertController _setUpAlert](v12, "_setUpAlert");
    v15 = v12;
  }

  return v12;
}

- (void)_setUpAlert
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UITableView *v9;
  UITableView *tableView;
  UITableView *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL automaticallyDismiss;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  BOOL v31;
  id location[2];

  objc_initWeak(location, self);
  -[WebUIAlert buttonTitles](self->_alert, "buttonTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == 2)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v4 == 1 && -[WebUIAlert defaultAction](self->_alert, "defaultAction") != 4)
  {

    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
  }
  else
  {
    v6 = 0;
  }
  -[WBUAlertController setPreferredStyle:](self, "setPreferredStyle:", 1);
  -[WebUIAlert titles](self->_alert, "titles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E68]), "initWithStyle:", 0);
    -[WBUAlertController setContentViewController:](self, "setContentViewController:", v8);
    objc_msgSend(v8, "tableView");
    v9 = (UITableView *)objc_claimAutoreleasedReturnValue();
    tableView = self->_tableView;
    self->_tableView = v9;

    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    v11 = self->_tableView;
    -[UITableView indexPathForSelectedRow](v11, "indexPathForSelectedRow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView deselectRowAtIndexPath:animated:](v11, "deselectRowAtIndexPath:animated:", v12, 0);

  }
  -[WebUIAlert title](self->_alert, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBUAlertController setTitle:](self, "setTitle:", v13);

  -[WebUIAlert bodyText](self->_alert, "bodyText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBUAlertController setMessage:](self, "setMessage:", v14);

  automaticallyDismiss = self->_automaticallyDismiss;
  v16 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __33__WBUAlertController__setUpAlert__block_invoke;
  v30[3] = &__block_descriptor_33_e5_B8__0l;
  v31 = automaticallyDismiss;
  v17 = (void *)MEMORY[0x212BD7EA4](v30);
  if (v5)
  {
    v18 = (void *)MEMORY[0x24BDF67E8];
    v28[0] = v16;
    v28[1] = 3221225472;
    v28[2] = __33__WBUAlertController__setUpAlert__block_invoke_2;
    v28[3] = &unk_24CB8D160;
    objc_copyWeak(&v29, location);
    objc_msgSend(v18, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v5, 0, 1, v28, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBUAlertController addAction:](self, "addAction:", v19);

    objc_destroyWeak(&v29);
  }
  if (v6)
  {
    v20 = (void *)MEMORY[0x24BDF67E8];
    v22 = v16;
    v23 = 3221225472;
    v24 = __33__WBUAlertController__setUpAlert__block_invoke_3;
    v25 = &unk_24CB8D188;
    objc_copyWeak(&v27, location);
    v26 = v5;
    objc_msgSend(v20, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v6, 0, 0, &v22, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBUAlertController addAction:](self, "addAction:", v21, v22, v23, v24, v25);

    objc_destroyWeak(&v27);
  }

  objc_destroyWeak(location);
}

uint64_t __33__WBUAlertController__setUpAlert__block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

void __33__WBUAlertController__setUpAlert__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    (*((void (**)(id, uint64_t))WeakRetained[166] + 2))(WeakRetained[166], objc_msgSend(WeakRetained[163], "actionForButtonTag:", 0));
    WeakRetained = v2;
  }

}

void __33__WBUAlertController__setUpAlert__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*((void (**)(id, uint64_t))WeakRetained[166] + 2))(WeakRetained[166], objc_msgSend(WeakRetained[163], "actionForButtonTag:", *(_QWORD *)(a1 + 32) != 0));
    WeakRetained = v3;
  }

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[WebUIAlert identities](self->_alert, "identities", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a4;
  -[WebUIAlert titles](self->_alert, "titles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDF6E60]);
  v8 = objc_msgSend(v5, "row");
  if (v8 < objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void (**handler)(id, _QWORD);
  _QWORD v9[5];

  v5 = a4;
  -[WebUIAlert titles](self->_alert, "titles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");
  if (v7 < objc_msgSend(v6, "count"))
  {
    -[WebUIAlert setSelectedTableItemIndex:](self->_alert, "setSelectedTableItemIndex:", objc_msgSend(v5, "row"));
    if (self->_automaticallyDismiss)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __56__WBUAlertController_tableView_didSelectRowAtIndexPath___block_invoke;
      v9[3] = &unk_24CB8D118;
      v9[4] = self;
      -[WBUAlertController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v9);
    }
    else
    {
      handler = (void (**)(id, _QWORD))self->_handler;
      if (handler)
        handler[2](handler, -[WebUIAlert tableAction](self->_alert, "tableAction"));
    }
  }

}

uint64_t __56__WBUAlertController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 1328);
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(*(id *)(v1 + 1304), "tableAction"));
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_alert, 0);
}

@end
