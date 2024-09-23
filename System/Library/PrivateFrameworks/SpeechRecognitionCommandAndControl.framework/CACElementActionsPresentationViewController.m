@implementation CACElementActionsPresentationViewController

- (CACElementActionsPresentationViewController)init
{
  CACElementActionsPresentationViewController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  UIAlertController *alertController;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CACElementActionsPresentationViewController;
  v2 = -[CACElementActionsPresentationViewController init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BEBD3B0];
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("ElementActions"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, 0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    alertController = v2->_alertController;
    v2->_alertController = (UIAlertController *)v5;

    -[UIAlertController popoverPresentationController](v2->_alertController, "popoverPresentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v2);

  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CACElementActionsPresentationViewController;
  -[CACElementActionsPresentationViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[CACElementActionsPresentationViewController alertController](self, "alertController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACElementActionsPresentationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[CACElementActionsPresentationViewController alertController](self, "alertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  v6.receiver = self;
  v6.super_class = (Class)CACElementActionsPresentationViewController;
  -[CACElementActionsPresentationViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

+ (id)_elementActionManager
{
  if (_elementActionManager_onceToken_0 != -1)
    dispatch_once(&_elementActionManager_onceToken_0, &__block_literal_global_23);
  return (id)_elementActionManager_sElementActionManager_0;
}

void __68__CACElementActionsPresentationViewController__elementActionManager__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x24BDFFA58]);
  +[CACAXDragManager sharedManager](CACAXDragManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithDragManager:", v3);
  v2 = (void *)_elementActionManager_sElementActionManager_0;
  _elementActionManager_sElementActionManager_0 = v1;

}

+ (BOOL)canShowElementActionsForElement:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "_elementActionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canShowActionsForElement:", v4);

  return v6;
}

- (void)setElement:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_element, a3);
  objc_msgSend((id)objc_opt_class(), "_elementActionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionsForElement:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        -[CACElementActionsPresentationViewController actionForAXAction:](self, "actionForAXAction:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACElementActionsPresentationViewController alertController](self, "alertController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addAction:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v15 = (void *)MEMORY[0x24BEBD3A8];
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommonStrings.Cancel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __58__CACElementActionsPresentationViewController_setElement___block_invoke;
  v19[3] = &unk_24F2AA888;
  v19[4] = self;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[CACElementActionsPresentationViewController alertController](self, "alertController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v17);

}

uint64_t __58__CACElementActionsPresentationViewController_setElement___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performHideWithCompletion:", 0);
}

- (id)actionForAXAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__CACElementActionsPresentationViewController_actionForAXAction___block_invoke;
  v10[3] = &unk_24F2AA8B0;
  v10[4] = self;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 0, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __65__CACElementActionsPresentationViewController_actionForAXAction___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__CACElementActionsPresentationViewController_actionForAXAction___block_invoke_2;
  v5[3] = &unk_24F2AAD70;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "performHideWithCompletion:", v5);

}

void __65__CACElementActionsPresentationViewController_actionForAXAction___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  id v4[2];
  void *v5;
  _QWORD block[4];
  int8x16_t v7;

  if (objc_msgSend(*(id *)(a1 + 32), "type") == 2)
  {
    v2 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__CACElementActionsPresentationViewController_actionForAXAction___block_invoke_3;
    block[3] = &unk_24F2AAD70;
    *(_OWORD *)v4 = *(_OWORD *)(a1 + 32);
    v3 = v4[0];
    v7 = vextq_s8(*(int8x16_t *)v4, *(int8x16_t *)v4, 8uLL);
    dispatch_after(v2, MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_elementActionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performAction:", *(_QWORD *)(a1 + 32));

  }
}

void __65__CACElementActionsPresentationViewController_actionForAXAction___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "_elementActionManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performAction:", *(_QWORD *)(a1 + 40));

}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v4 = a3;
  -[CACElementActionsPresentationViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceView:", v5);

  objc_msgSend(v4, "setCanOverlapSourceViewRect:", 1);
  -[CACElementActionsPresentationViewController sourceRect](self, "sourceRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[CACElementActionsPresentationViewController view](self, "view");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceRect:", CACViewRectFromPortraitUpRect(v14, v7, v9, v11, v13));

}

- (int64_t)zOrder
{
  return 6;
}

- (BOOL)isOverlay
{
  return 0;
}

- (void)performHideWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CACElementActionsPresentationViewController elementActionsDelegate](self, "elementActionsDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "elementActionsPresentationViewController:hideWithCompletion:", self, v4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACElementActionsPresentationViewControllerDelegate)elementActionsDelegate
{
  return (CACElementActionsPresentationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_elementActionsDelegate);
}

- (void)setElementActionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_elementActionsDelegate, a3);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_destroyWeak((id *)&self->_elementActionsDelegate);
  objc_storeStrong((id *)&self->_element, 0);
}

@end
