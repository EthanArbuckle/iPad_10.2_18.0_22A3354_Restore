@implementation PKAccountSupportTopicExplanationContentSectionController

- (PKAccountSupportTopicExplanationContentSectionController)initWithContent:(id)a3
{
  id v5;
  PKAccountSupportTopicExplanationContentSectionController *v6;
  PKAccountSupportTopicExplanationContentSectionController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountSupportTopicExplanationContentSectionController;
  v6 = -[PKPaymentSetupListSectionController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_content, a3);

  return v7;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
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
  if (self->_content)
  {
    v9[0] = self->_content;
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
  return (id)objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), &__block_literal_global_78);
}

uint64_t __84__PKAccountSupportTopicExplanationContentSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "setExplanationContent:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
