@implementation CACDisambiguationPresentationViewController

- (CACDisambiguationPresentationViewController)initWithTitle:(id)a3
{
  return -[CACDisambiguationPresentationViewController initWithTitle:message:](self, "initWithTitle:message:", a3, 0);
}

- (CACDisambiguationPresentationViewController)initWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  CACDisambiguationPresentationViewController *v8;
  CACDisambiguationPresentationViewController *v9;
  uint64_t v10;
  UIAlertController *alertController;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CACDisambiguationPresentationViewController;
  v8 = -[CACDisambiguationPresentationViewController init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = -[CACDisambiguationPresentationViewController newAlertControllerWithTitle:message:](v8, "newAlertControllerWithTitle:message:", v6, v7);
    alertController = v9->_alertController;
    v9->_alertController = (UIAlertController *)v10;

  }
  return v9;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CACDisambiguationPresentationViewController;
  -[CACDisambiguationPresentationViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[CACDisambiguationPresentationViewController alertController](self, "alertController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACDisambiguationPresentationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[CACDisambiguationPresentationViewController alertController](self, "alertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  v6.receiver = self;
  v6.super_class = (Class)CACDisambiguationPresentationViewController;
  -[CACDisambiguationPresentationViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)setDisambiguationItems:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_disambiguationItems, a3);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        -[CACDisambiguationPresentationViewController actionForItem:](self, "actionForItem:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACDisambiguationPresentationViewController alertController](self, "alertController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addAction:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v13 = (void *)MEMORY[0x24BEBD3A8];
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommonStrings.Cancel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __70__CACDisambiguationPresentationViewController_setDisambiguationItems___block_invoke;
  v17[3] = &unk_24F2AA888;
  v17[4] = self;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CACDisambiguationPresentationViewController alertController](self, "alertController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v15);

}

uint64_t __70__CACDisambiguationPresentationViewController_setDisambiguationItems___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performHideWithCompletion:", 0);
}

- (id)newAlertControllerWithTitle:(id)a3 message:(id)a4
{
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)actionForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[CACDisambiguationPresentationViewController newActionCustomContentView:](self, "newActionCustomContentView:", v4);
  objc_msgSend(v5, "setView:", v6);

  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BEBD3A8];
  if (v7)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __61__CACDisambiguationPresentationViewController_actionForItem___block_invoke;
    v17[3] = &unk_24F2AA8B0;
    v9 = &v18;
    v17[4] = self;
    v18 = v4;
    v10 = v4;
    objc_msgSend(v8, "_actionWithContentViewController:style:handler:", v5, 0, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "displayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __61__CACDisambiguationPresentationViewController_actionForItem___block_invoke_3;
    v15[3] = &unk_24F2AA8B0;
    v9 = &v16;
    v15[4] = self;
    v16 = v4;
    v13 = v4;
    objc_msgSend(v8, "actionWithTitle:style:handler:", v12, 0, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __61__CACDisambiguationPresentationViewController_actionForItem___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __61__CACDisambiguationPresentationViewController_actionForItem___block_invoke_2;
  v2[3] = &unk_24F2AA860;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "performHideWithCompletion:", v2);

}

uint64_t __61__CACDisambiguationPresentationViewController_actionForItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startInteraction");
}

void __61__CACDisambiguationPresentationViewController_actionForItem___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __61__CACDisambiguationPresentationViewController_actionForItem___block_invoke_4;
  v2[3] = &unk_24F2AA860;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "performHideWithCompletion:", v2);

}

uint64_t __61__CACDisambiguationPresentationViewController_actionForItem___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startInteraction");
}

- (id)newActionCustomContentView:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  __objc2_class **v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  if ((unint64_t)(v4 - 1) < 2)
  {
    v6 = off_24F2A9688;
    goto LABEL_6;
  }
  v5 = 0;
  if (v4)
  {
    if (v4 != 3)
    {
LABEL_7:
      objc_msgSend(v3, "displayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "textLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", v7);

      objc_msgSend(v3, "displayDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "detailTextLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v9);

      objc_msgSend(v3, "displayImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "imageView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setImage:", v11);

      LODWORD(v13) = 1112014848;
      LODWORD(v14) = 1112014848;
      objc_msgSend(v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8), v13, v14);
      v16 = v15;
      objc_msgSend(v5, "heightAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintLessThanOrEqualToConstant:", v16);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "setActive:", 1);
      v35 = v3;
      v18 = (void *)objc_opt_new();
      objc_msgSend(v18, "addSubview:", v5);
      v28 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v5, "leadingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "leadingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v32);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v31;
      objc_msgSend(v5, "trailingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "trailingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:", v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v19;
      objc_msgSend(v5, "centerYAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "centerYAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v36[2] = v22;
      objc_msgSend(v18, "heightAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "heightAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v36[3] = v25;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "activateConstraints:", v26);

      v5 = v18;
      v3 = v35;
      goto LABEL_8;
    }
    v6 = off_24F2A9638;
LABEL_6:
    v5 = (void *)objc_msgSend(objc_alloc(*v6), "initWithStyle:reuseIdentifier:", 0, 0);
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (int64_t)zOrder
{
  return 15;
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
  -[CACDisambiguationPresentationViewController contactDisambiguationDelegate](self, "contactDisambiguationDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dialDiambiguationPresentationViewController:hideWithCompletion:", self, v4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACContactDisambiguationPresentationViewControllerDelegate)contactDisambiguationDelegate
{
  return (CACContactDisambiguationPresentationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_contactDisambiguationDelegate);
}

- (void)setContactDisambiguationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contactDisambiguationDelegate, a3);
}

- (NSString)alertTitle
{
  return self->_alertTitle;
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
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_destroyWeak((id *)&self->_contactDisambiguationDelegate);
  objc_storeStrong((id *)&self->_disambiguationItems, 0);
}

@end
