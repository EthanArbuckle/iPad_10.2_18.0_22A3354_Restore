@implementation UIPrintOptionListCell

- (void)printOptionCellTapped
{
  void *v3;
  UIPrintOptionListViewController *v4;
  void *v5;
  UIPrintOptionListViewController *v6;
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
  void *v19;
  _QWORD v20[5];

  -[UIPrintOptionListCell printOptionListViewController](self, "printOptionListViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [UIPrintOptionListViewController alloc];
    -[UIPrintOptionListCell itemListDelegate](self, "itemListDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIPrintOptionListViewController initWithListDelegate:](v4, "initWithListDelegate:", v5);
    -[UIPrintOptionListCell setPrintOptionListViewController:](self, "setPrintOptionListViewController:", v6);

    -[UIPrintOptionListCell itemListDelegate](self, "itemListDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOptionListCell printOptionListViewController](self, "printOptionListViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v8);

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __46__UIPrintOptionListCell_printOptionCellTapped__block_invoke;
    v20[3] = &unk_1E9D96D90;
    v20[4] = self;
    -[UIPrintOptionListCell printOptionListViewController](self, "printOptionListViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setOnDoneBlock:", v20);

    -[UIPrintOptionListCell itemListDelegate](self, "itemListDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "printPanelViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIPrintOptionListCell printOptionListViewController](self, "printOptionListViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addPrintShareButtonsToNavItem:", v15);

    objc_msgSend(v13, "printOptionsNavController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setDelegate:", self);
    objc_msgSend(v13, "printOptionsNavController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOptionListCell printOptionListViewController](self, "printOptionListViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pushViewController:animated:", v19, 1);

  }
}

uint64_t __46__UIPrintOptionListCell_printOptionCellTapped__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPrintOptionListViewController:", 0);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIPrintOptionListCell;
  -[UIPrintOptionCell prepareForReuse](&v4, sel_prepareForReuse);
  -[UIPrintOptionListCell setItemListDelegate:](self, "setItemListDelegate:", 0);
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrintOptionListViewController:", 0);

}

- (UIPrintOptionListDelegate)itemListDelegate
{
  return (UIPrintOptionListDelegate *)objc_loadWeakRetained((id *)&self->_itemListDelegate);
}

- (void)setItemListDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_itemListDelegate, a3);
}

- (UIPrintOptionListViewController)printOptionListViewController
{
  return self->_printOptionListViewController;
}

- (void)setPrintOptionListViewController:(id)a3
{
  objc_storeStrong((id *)&self->_printOptionListViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printOptionListViewController, 0);
  objc_destroyWeak((id *)&self->_itemListDelegate);
}

@end
