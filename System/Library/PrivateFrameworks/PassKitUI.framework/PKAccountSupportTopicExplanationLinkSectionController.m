@implementation PKAccountSupportTopicExplanationLinkSectionController

- (PKAccountSupportTopicExplanationLinkSectionController)initWithLink:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  PKAccountSupportTopicExplanationLinkSectionController *v9;
  PKAccountSupportTopicExplanationLinkSectionController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountSupportTopicExplanationLinkSectionController;
  v9 = -[PKPaymentSetupListSectionController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    if (v7)
    {
      if (objc_msgSend(v8, "shouldShowSupportLink:", v7))
        objc_storeStrong((id *)&v10->_link, a3);
    }
  }

  return v10;
}

- (void)didSelectItem:(id)a3
{
  PKAccountSupportTopicExplanationLinkSectionControllerDelegate **p_delegate;
  id WeakRetained;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "deselectCells");

    v6 = v8;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "openSupportLink:", v6);

  }
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 1;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v6 = v5;
  if (self->_link)
  {
    v9[0] = self->_link;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendItems:", v7);

  }
  else
  {
    objc_msgSend(v5, "appendItems:", MEMORY[0x1E0C9AA60]);
  }
  return v6;
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
  v5 = (void *)MEMORY[0x1E0DC35C8];
  v6 = objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__PKAccountSupportTopicExplanationLinkSectionController_cellRegistrationForItem___block_invoke;
  v9[3] = &unk_1E3E74000;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v5, "registrationWithCellClass:configurationHandler:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __81__PKAccountSupportTopicExplanationLinkSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;

  v9 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = (id)objc_msgSend(WeakRetained, "_decorateListCell:forExplanationLink:", v9, v6);

}

- (id)_decorateListCell:(id)a3 forExplanationLink:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0DC39A8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "valueCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setText:", v9);
  objc_msgSend(v8, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColor:", v11);

  objc_msgSend(v8, "setDirectionalLayoutMargins:", 12.0, 0.0, 12.0, 0.0);
  objc_msgSend(v7, "setContentConfiguration:", v8);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_link, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
