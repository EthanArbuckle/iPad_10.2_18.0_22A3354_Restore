@implementation PKDashboardMessageSectionController

- (PKDashboardMessageSectionController)initWithMessages:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  PKDashboardMessageSectionController *v8;
  PKDashboardMessageRowItem *v9;
  PKDashboardMessageRowItem *item;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKDashboardMessageSectionController;
  v8 = -[PKDashboardMessageSectionController init](&v12, sel_init);
  if (v8)
  {
    v9 = -[PKDashboardMessageRowItem initWithMessages:currentMessageIndex:messagesViewDelegate:]([PKDashboardMessageRowItem alloc], "initWithMessages:currentMessageIndex:messagesViewDelegate:", v6, 0, v8);
    item = v8->_item;
    v8->_item = v9;

    objc_storeWeak((id *)&v8->_delegate, v7);
    -[PKDashboardMessageSectionController updateWithMessages:currentMessageIndex:](v8, "updateWithMessages:currentMessageIndex:", v6, 0);
  }

  return v8;
}

- (void)updateWithMessages:(id)a3 currentMessageIndex:(unint64_t)a4
{
  void *v6;
  int64_t v7;
  void *v8;
  id WeakRetained;
  id v10;

  v10 = a3;
  -[PKDashboardMessageRowItem messages](self->_item, "messages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKEqualObjects())
  {
    v7 = -[PKDashboardMessageRowItem currentMessageIndex](self->_item, "currentMessageIndex");

    v8 = v10;
    if (v7 == a4)
      goto LABEL_6;
  }
  else
  {

  }
  -[PKDashboardMessageRowItem setMessages:](self->_item, "setMessages:", v10);
  -[PKDashboardMessageRowItem setCurrentMessageIndex:](self->_item, "setCurrentMessageIndex:", a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadDataAnimated:", 1);

  v8 = v10;
LABEL_6:

}

- (id)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("dashboardMessage");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v8[0] = self->_item;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendItems:", v6);

  return v5;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0DC35C8];
    v6 = objc_opt_class();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__PKDashboardMessageSectionController_cellRegistrationForItem___block_invoke;
    v9[3] = &unk_1E3E70AC8;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v5, "registrationWithCellClass:configurationHandler:", v6, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v10);
  }
  else
  {
    v7 = 0;
  }
  objc_destroyWeak(&location);

  return v7;
}

void __63__PKDashboardMessageSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_decorateCell:forItem:", v7, v6);

}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (void)_decorateCell:(id)a3 forItem:(id)a4
{
  id v5;
  id v6;
  PKDashboardMessagesView *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PKDashboardMessagesView *v12;

  v5 = a4;
  v6 = a3;
  v7 = [PKDashboardMessagesView alloc];
  v12 = -[PKDashboardMessagesView initWithInsets:](v7, "initWithInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v5, "messagesViewDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardMessagesView setDelegate:](v12, "setDelegate:", v8);

  objc_msgSend(v5, "messages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "currentMessageIndex");

  -[PKDashboardMessagesView updateWithMessages:currentIndex:](v12, "updateWithMessages:currentIndex:", v9, v10);
  objc_msgSend(v6, "setHostedContentView:", v12);
  objc_msgSend(v6, "backgroundConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  objc_msgSend(v6, "setBackgroundConfiguration:", v11);

}

- (void)messagesView:(id)a3 scrolledToMessageWithIdentifier:(id)a4
{
  id v6;
  PKDashboardMessageSectionControllerDelegate **p_delegate;
  id WeakRetained;
  char v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "messagesView:scrolledToMessageWithIdentifier:", v11, v6);

  }
}

- (BOOL)messagesView:(id)a3 shouldEnqueueEventForView:(id)a4
{
  return 1;
}

- (PKDashboardMessageSectionControllerDelegate)delegate
{
  return (PKDashboardMessageSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
