@implementation UIPrintOptionViewCell

- (void)printOptionCellTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D60]), "initWithNibName:bundle:", 0, 0);
  -[UIPrintOptionViewCell optionViewDelegate](self, "optionViewDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printOptionDetailView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setView:", v4);

  -[UIPrintOptionViewCell optionViewDelegate](self, "optionViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v6);

  -[UIPrintOptionViewCell optionViewDelegate](self, "optionViewDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "printPanelViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addPrintShareButtonsToNavItem:", v9);

  objc_msgSend(v8, "printOptionsNavController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushViewController:animated:", v11, 1);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPrintOptionViewCell;
  -[UIPrintOptionCell prepareForReuse](&v3, sel_prepareForReuse);
  -[UIPrintOptionViewCell setOptionViewDelegate:](self, "setOptionViewDelegate:", 0);
  -[UIPrintOptionViewCell setPrintOptionView:](self, "setPrintOptionView:", 0);
}

- (UIPrintOptionViewDelegate)optionViewDelegate
{
  return (UIPrintOptionViewDelegate *)objc_loadWeakRetained((id *)&self->_optionViewDelegate);
}

- (void)setOptionViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_optionViewDelegate, a3);
}

- (UIView)printOptionView
{
  return self->_printOptionView;
}

- (void)setPrintOptionView:(id)a3
{
  objc_storeStrong((id *)&self->_printOptionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printOptionView, 0);
  objc_destroyWeak((id *)&self->_optionViewDelegate);
}

@end
