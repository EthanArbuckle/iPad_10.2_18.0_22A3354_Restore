@implementation PKAccountSupportTopicsSectionController

- (PKAccountSupportTopicsSectionController)initWithAccount:(id)a3 topics:(id)a4 sectionTitle:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKAccountSupportTopicsSectionController *v15;
  PKAccountSupportTopicsSectionController *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t, void *);
  void *v24;
  id v25;
  id location;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)PKAccountSupportTopicsSectionController;
  v15 = -[PKPaymentSetupListSectionController init](&v27, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v14);
    objc_storeStrong((id *)&v16->_account, a3);
    objc_storeStrong((id *)&v16->_topics, a4);
    objc_storeStrong((id *)&v16->_sectionTitle, a5);
    objc_initWeak(&location, v16);
    v17 = (void *)MEMORY[0x1E0DC35C8];
    v18 = objc_opt_class();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __88__PKAccountSupportTopicsSectionController_initWithAccount_topics_sectionTitle_delegate___block_invoke;
    v24 = &unk_1E3E62748;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v17, "registrationWithCellClass:configurationHandler:", v18, &v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupListSectionController setCellRegistration:](v16, "setCellRegistration:", v19, v21, v22, v23, v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __88__PKAccountSupportTopicsSectionController_initWithAccount_topics_sectionTitle_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;

  v9 = a2;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = (id)objc_msgSend(WeakRetained, "_decorateListCell:forRowItem:", v9, v6);

  }
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  id v4;
  NSString *sectionTitle;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  sectionTitle = self->_sectionTitle;
  v11[0] = *MEMORY[0x1E0DC1138];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC4918], 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v11[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithString:attributes:", sectionTitle, v8);

  return v9;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  objc_msgSend(v5, "appendItems:", self->_topics);
  return v5;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKAccountSupportTopicsSectionController;
  v4 = a3;
  -[PKPaymentSetupListSectionController defaultListLayout](&v8, sel_defaultListLayout);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFooterMode:", 1, v8.receiver, v8.super_class);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)didSelectItem:(id)a3
{
  PKAccountSupportTopicsSectionControllerDelegate **p_delegate;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "deselectCells");

    v6 = v9;
    objc_msgSend(v6, "explanation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else if (objc_msgSend(v6, "supportsBusinessChat"))
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "openBusinessChatForTopic:", v6);
LABEL_7:

      goto LABEL_8;
    }
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "showExplanationForTopic:", v6);
    goto LABEL_7;
  }
LABEL_8:

}

- (id)_decorateListCell:(id)a3 forRowItem:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0DC39A8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "valueCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setText:", v9);
  objc_msgSend(v7, "setContentConfiguration:", v8);
  v10 = objc_alloc_init(MEMORY[0x1E0DC3568]);
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessories:", v11);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
