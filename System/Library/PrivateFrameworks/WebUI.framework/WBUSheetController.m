@implementation WBUSheetController

- (WBUSheetController)initWithDelegate:(id)a3
{
  id v5;
  WBUSheetController *v6;
  WBUSheetController *v7;
  WBUSheetController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBUSheetController;
  v6 = -[WBUSheetController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_delegate, a3);
    v8 = v7;
  }

  return v7;
}

- (void)showSheetForAlert:(id)a3
{
  id v6;
  NSMutableArray *v7;
  NSMutableArray *alertInvocationQueue;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  WebUIAlert *alert;
  UIAlertController *v15;
  UIAlertController *alertController;
  void *v17;
  UIAlertController *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;

  v6 = a3;
  if (self->_alertController)
  {
    if (!self->_alertInvocationQueue)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      alertInvocationQueue = self->_alertInvocationQueue;
      self->_alertInvocationQueue = v7;

    }
    v21 = v6;
    v9 = (void *)MEMORY[0x24BDBCE98];
    -[WBUSheetController methodSignatureForSelector:](self, "methodSignatureForSelector:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invocationWithMethodSignature:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setSelector:", a2);
    objc_msgSend(v11, "setTarget:", self);
    objc_msgSend(v11, "setArgument:atIndex:", &v21, 2);
    -[NSMutableArray addObject:](self->_alertInvocationQueue, "addObject:", v11);

  }
  else
  {
    objc_storeStrong((id *)&self->_alert, a3);
    v12 = (void *)objc_opt_class();
    v13 = MEMORY[0x24BDAC760];
    alert = self->_alert;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __40__WBUSheetController_showSheetForAlert___block_invoke;
    v20[3] = &unk_24CB8D0F0;
    v20[4] = self;
    objc_msgSend(v12, "alertControllerForAlert:automaticallyDismiss:withCompletionHandler:", alert, 1, v20);
    v15 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
    alertController = self->_alertController;
    self->_alertController = v15;

    objc_msgSend(self->_delegate, "sheetController:viewControllerForAlert:", self, self->_alert);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = self->_alertController;
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __40__WBUSheetController_showSheetForAlert___block_invoke_2;
    v19[3] = &unk_24CB8D118;
    v19[4] = self;
    objc_msgSend(v17, "presentViewController:animated:completion:", v18, 1, v19);

  }
}

uint64_t __40__WBUSheetController_showSheetForAlert___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_alertDidDismissWithAction:", a2);
}

uint64_t __40__WBUSheetController_showSheetForAlert___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "sheetControllerDidShowSheet:");
}

- (void)hideSheet
{
  UIAlertController *alertController;
  _QWORD v3[5];

  alertController = self->_alertController;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __31__WBUSheetController_hideSheet__block_invoke;
  v3[3] = &unk_24CB8D118;
  v3[4] = self;
  -[UIAlertController dismissViewControllerAnimated:completion:](alertController, "dismissViewControllerAnimated:completion:", 1, v3);
}

uint64_t __31__WBUSheetController_hideSheet__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_alertDidDismissWithAction:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hideAction"));
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong(&self->_delegate, a3);
}

- (void)_alertDidDismissWithAction:(int)a3
{
  uint64_t v3;
  UIAlertController *alertController;
  WebUIAlert *alert;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  WebUIAlert *v10;

  v3 = *(_QWORD *)&a3;
  v10 = self->_alert;
  alertController = self->_alertController;
  self->_alertController = 0;

  alert = self->_alert;
  self->_alert = 0;

  -[WebUIAlert actionHandler](v10, "actionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WebUIAlert actionHandler](v10, "actionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, WebUIAlert *, uint64_t))v8)[2](v8, v10, v3);

  }
  objc_msgSend(self->_delegate, "sheetController:performAction:forAlert:", self, v3, v10);
  objc_msgSend(self->_delegate, "sheetControllerDidHideSheet:", self);
  if (-[NSMutableArray count](self->_alertInvocationQueue, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_alertInvocationQueue, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invoke");

    -[NSMutableArray removeObjectAtIndex:](self->_alertInvocationQueue, "removeObjectAtIndex:", 0);
  }

}

+ (id)alertControllerForAlert:(id)a3 automaticallyDismiss:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  WBUAlertController *v9;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  v9 = -[WBUAlertController initWithAlert:automaticallyDismiss:completionHandler:]([WBUAlertController alloc], "initWithAlert:automaticallyDismiss:completionHandler:", v8, v5, v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delegate, 0);
  objc_storeStrong((id *)&self->_alertInvocationQueue, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end
