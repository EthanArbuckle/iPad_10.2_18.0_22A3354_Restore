@implementation SUItemTableViewController

- (SUItemTableViewController)init
{
  SUItemTableViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUItemTableViewController;
  v2 = -[SUTableViewController init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__restrictionsChangedNotification_, *MEMORY[0x24BE63740], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__purchasedItemSetChangedNotification_, CFSTR("SUPurchasedItemIdentifiersChangedNotification"), 0);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE63740], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUPurchasedItemIdentifiersChangedNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)SUItemTableViewController;
  -[SUTableViewController dealloc](&v4, sel_dealloc);
}

- (id)itemAtIndexPath:(id)a3
{
  return 0;
}

- (BOOL)openDocumentForItemAtIndexPath:(id)a3 withApplication:(id)a4
{
  UITableView *v5;

  v5 = -[SUTableViewController tableView](self, "tableView", a3, a4);
  -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](v5, "reloadRowsAtIndexPaths:withRowAnimation:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", a3, 0), 5);
  return 1;
}

- (BOOL)purchaseItemAtIndexPath:(id)a3
{
  UITableView *v4;

  v4 = -[SUTableViewController tableView](self, "tableView");
  -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](v4, "reloadRowsAtIndexPaths:withRowAnimation:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", a3, 0), 5);
  return 1;
}

- (void)reloadData
{
  objc_super v3;

  -[SUItemTableViewController _removeTouchCaptureView](self, "_removeTouchCaptureView");
  v3.receiver = self;
  v3.super_class = (Class)SUItemTableViewController;
  -[SUTableViewController reloadData](&v3, sel_reloadData);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUItemTableViewController _removeTouchCaptureView](self, "_removeTouchCaptureView");
  v5.receiver = self;
  v5.super_class = (Class)SUItemTableViewController;
  -[SUTableViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)itemOfferButtonAction:(id)a3
{
  uint64_t v5;
  NSIndexPath *v6;
  NSIndexPath *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[8];

  if ((objc_msgSend(a3, "isShowingConfirmation") & 1) == 0 && objc_msgSend(a3, "shouldShowConfirmation"))
  {
    -[SUItemTableViewController _showPurchaseConfirmationForButton:](self, "_showPurchaseConfirmationForButton:", a3);
    return;
  }
  v5 = objc_msgSend(a3, "superviewOfClass:", objc_opt_class());
  if (!v5)
    goto LABEL_12;
  v6 = -[UITableView indexPathForCell:](-[SUTableViewController tableView](self, "tableView"), "indexPathForCell:", v5);
  if (!v6)
    goto LABEL_12;
  v7 = v6;
  v8 = -[SUItemTableViewController itemAtIndexPath:](self, "itemAtIndexPath:", v6);
  if (!v8)
    goto LABEL_12;
  v9 = v8;
  if (objc_msgSend(v8, "itemType") == 11
    || (v10 = (void *)objc_msgSend(v9, "itemMediaKind"),
        objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEB2710])))
  {
    objc_msgSend(a3, "setEnabled:", 0);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __51__SUItemTableViewController_itemOfferButtonAction___block_invoke;
    v11[3] = &unk_24DE7CDE0;
    v11[4] = a3;
    v11[5] = self;
    v11[6] = v7;
    v11[7] = v9;
    -[SUItemTableViewController _chooseApplicationToOpenDocumentAtIndexPath:withCompletionHandler:](self, "_chooseApplicationToOpenDocumentAtIndexPath:withCompletionHandler:", v7, v11);
    return;
  }
  if (-[SUItemTableViewController purchaseItemAtIndexPath:](self, "purchaseItemAtIndexPath:", v7))
    -[SUItemTableViewController _removeTouchCaptureView](self, "_removeTouchCaptureView");
  else
LABEL_12:
    -[SUItemTableViewController _hidePurchaseConfirmationForButton:](self, "_hidePurchaseConfirmationForButton:", a3);
}

void __51__SUItemTableViewController_itemOfferButtonAction___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
  if (a3
    && (objc_msgSend(*(id *)(a1 + 40), "openDocumentForItemAtIndexPath:withApplication:", *(_QWORD *)(a1 + 48), a3) & 1) != 0)
  {
    if (!a2)
      return;
    goto LABEL_4;
  }
  objc_msgSend(*(id *)(a1 + 40), "_hidePurchaseConfirmationForButton:", *(_QWORD *)(a1 + 32));
  if (a2)
  {
LABEL_4:
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC8B90]), "initWithDialogDictionary:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "defaultStoreOffer"), "documentCannotOpenDialog"), "dialogDictionary"));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "clientInterface"), "_presentDialog:", v6);

  }
}

- (void)_touchCaptureAction:(id)a3
{
  -[SUItemTableViewController _hidePurchaseConfirmationForButton:](self, "_hidePurchaseConfirmationForButton:", objc_msgSend((id)objc_msgSend(a3, "passThroughViews"), "objectAtIndex:", 0));
}

- (void)_purchasedItemSetChangedNotification:(id)a3
{
  -[UITableView reloadData](-[SUTableViewController tableView](self, "tableView", a3), "reloadData");
}

- (void)_restrictionsChangedNotification:(id)a3
{
  objc_msgSend((id)-[SUItemTableViewController mainThreadProxy](self, "mainThreadProxy", a3), "reloadData");
}

- (void)_chooseApplicationToOpenDocumentAtIndexPath:(id)a3 withCompletionHandler:(id)a4
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  CFStringRef v11;
  __CFString *v12;

  v7 = (void *)objc_msgSend(-[SUItemTableViewController itemAtIndexPath:](self, "itemAtIndexPath:"), "defaultStoreOffer");
  v8 = (void *)objc_msgSend(v7, "documentRequiredHandlers");
  if (objc_msgSend(v8, "count"))
  {
    v9 = -[SUItemTableViewController _preferredApplicationFromCandidates:](self, "_preferredApplicationFromCandidates:", v8);
    if (!a4)
      return;
    goto LABEL_3;
  }
  v10 = (void *)objc_msgSend(v7, "offerMedia");
  v11 = (CFStringRef)(id)objc_msgSend(v7, "documentUTI");
  if (v11 || (v11 = SUCopyUTIForFilePath((void *)objc_msgSend((id)objc_msgSend(v10, "URL"), "path"), 1)) != 0)
  {
    v12 = (__CFString *)v11;
    -[SUItemTableViewController _promptToOpenUTI:fromIndexPath:withCompletionHandler:](self, "_promptToOpenUTI:fromIndexPath:withCompletionHandler:", v11, a3, a4);

  }
  else
  {
    v9 = 0;
    if (a4)
LABEL_3:
      (*((void (**)(id, BOOL))a4 + 2))(a4, v9 == 0);
  }
}

- (void)_hidePurchaseConfirmationForButton:(id)a3
{
  id v5;
  double v6;
  double v7;
  _QWORD v8[6];
  _QWORD v9[5];

  v5 = -[SUItemTableViewController _tableCellForButton:](self, "_tableCellForButton:");
  objc_msgSend((id)objc_opt_class(), "defaultAnimationDuration");
  v7 = v6;
  objc_msgSend(a3, "setShowingConfirmation:duration:", 0);
  v8[5] = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__SUItemTableViewController__hidePurchaseConfirmationForButton___block_invoke;
  v9[3] = &unk_24DE7AF90;
  v9[4] = v5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__SUItemTableViewController__hidePurchaseConfirmationForButton___block_invoke_2;
  v8[3] = &unk_24DE7CE08;
  v8[4] = v5;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v9, v8, v7);
}

uint64_t __64__SUItemTableViewController__hidePurchaseConfirmationForButton___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutSubviews");
}

uint64_t __64__SUItemTableViewController__hidePurchaseConfirmationForButton___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUsesSubviews:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "_removeTouchCaptureView");
}

- (id)_preferredApplicationFromCandidates:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(_QWORD *)v11;
LABEL_3:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v11 != v6)
      objc_enumerationMutation(a3);
    v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
    if (objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v8))
      return v8;
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)_promptToOpenUTI:(id)a3 fromIndexPath:(id)a4 withCompletionHandler:(id)a5
{
  id v9;
  SUDocumentInteractionSession *v10;
  UITableViewCell *v11;
  uint64_t v12;
  _QWORD v13[6];

  v9 = objc_alloc_init(MEMORY[0x24BDF69D8]);
  objc_msgSend(v9, "setName:", &stru_24DE83F60);
  objc_msgSend(v9, "setUTI:", a3);
  v10 = -[SUDocumentInteractionSession initWithDocumentInteractionController:]([SUDocumentInteractionSession alloc], "initWithDocumentInteractionController:", v9);
  self->_documentInteractionSession = v10;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__SUItemTableViewController__promptToOpenUTI_fromIndexPath_withCompletionHandler___block_invoke;
  v13[3] = &unk_24DE7CE30;
  v13[4] = self;
  v13[5] = a5;
  -[SUDocumentInteractionSession setCompletionHandler:](v10, "setCompletionHandler:", v13);
  v11 = -[UITableView cellForRowAtIndexPath:](-[SUTableViewController tableView](self, "tableView"), "cellForRowAtIndexPath:", a4);
  v12 = -[UITableViewCell accessoryView](v11, "accessoryView");
  if (v12)
    v11 = (UITableViewCell *)v12;
  -[UITableViewCell bounds](v11, "bounds");
  if ((objc_msgSend(v9, "presentOpenInMenuFromRect:inView:animated:", v11, 1) & 1) == 0)
    -[SUDocumentInteractionSession cancel](self->_documentInteractionSession, "cancel");

}

uint64_t __82__SUItemTableViewController__promptToOpenUTI_fromIndexPath_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1168) = 0;
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

- (void)_removeTouchCaptureView
{
  if (-[SUItemTableViewController isViewLoaded](self, "isViewLoaded"))
    objc_msgSend((id)objc_msgSend((id)-[SUItemTableViewController view](self, "view"), "window"), "removeTouchCaptureViewWithTag:", 452);
}

- (void)_showPurchaseConfirmationForButton:(id)a3
{
  id v5;
  double v6;
  double v7;
  void *v8;

  v5 = -[SUItemTableViewController _tableCellForButton:](self, "_tableCellForButton:");
  objc_msgSend(v5, "setUsesSubviews:", 1);
  objc_msgSend((id)objc_opt_class(), "defaultAnimationDuration");
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDF6F90], "beginAnimations:context:", 0, a3);
  objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDuration:", v7);
  objc_msgSend(a3, "setShowingConfirmation:duration:", 1, v7);
  objc_msgSend(v5, "layoutSubviews");
  objc_msgSend(MEMORY[0x24BDF6F90], "commitAnimations");
  v8 = (void *)objc_msgSend((id)objc_msgSend(a3, "window"), "addTouchCaptureViewWithTag:", 452);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__touchCaptureAction_, 1);
  objc_msgSend(v8, "setPassThroughViews:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", a3, 0));
}

- (id)_tableCellForButton:(id)a3
{
  void *i;

  for (i = (void *)objc_msgSend(a3, "superview"); i; i = (void *)objc_msgSend(i, "superview"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
  }
  return i;
}

@end
