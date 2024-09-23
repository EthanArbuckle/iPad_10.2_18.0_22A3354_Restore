@implementation UIPrintOption

- (UIPrintOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v7;
  id v8;
  UIPrintOption *v9;
  UIPrintOption *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIPrintOption;
  v9 = -[UIPrintOption init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_printInfo, a3);
    objc_storeWeak((id *)&v10->_printPanelViewController, v8);
    *(_WORD *)&v10->_collapsed = 257;
  }

  return v10;
}

- (id)printOptionTableViewCell
{
  return 0;
}

- (id)printOptionDetailView
{
  return 0;
}

- (void)updatePrintOptionSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIPrintOption printPanelViewController](self, "printPanelViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "printOptionsTableView");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[UIPrintOption tableViewCell](self, "tableViewCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForCell:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reloadRowsAtIndexPaths:withRowAnimation:", v7, 100);

    }
  }
}

- (BOOL)canDismiss
{
  return 1;
}

- (BOOL)keyboardShowing
{
  return 0;
}

- (UIPrintPanelViewController)printPanelViewController
{
  return (UIPrintPanelViewController *)objc_loadWeakRetained((id *)&self->_printPanelViewController);
}

- (void)setPrintPanelViewController:(id)a3
{
  objc_storeWeak((id *)&self->_printPanelViewController, a3);
}

- (UITableViewCell)tableViewCell
{
  return self->_tableViewCell;
}

- (void)setTableViewCell:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewCell, a3);
}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(id)a3
{
  objc_storeStrong((id *)&self->_printInfo, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (BOOL)collapsed
{
  return self->_collapsed;
}

- (void)setCollapsed:(BOOL)a3
{
  self->_collapsed = a3;
}

- (BOOL)shouldShow
{
  return self->_shouldShow;
}

- (void)setShouldShow:(BOOL)a3
{
  self->_shouldShow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_storeStrong((id *)&self->_tableViewCell, 0);
  objc_destroyWeak((id *)&self->_printPanelViewController);
}

@end
