@implementation PKPassDetailsPrecursorPassUpgradeSectionController

- (PKPassDetailsPrecursorPassUpgradeSectionController)init
{

  return 0;
}

- (PKPassDetailsPrecursorPassUpgradeSectionController)initWithPass:(id)a3 webService:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPassDetailsPrecursorPassUpgradeSectionController *v12;
  PKPassDetailsPrecursorPassUpgradeSectionController *v13;
  uint64_t v14;
  PKPrecursorPassUpgradeController *precursorController;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPassDetailsPrecursorPassUpgradeSectionController;
  v12 = -[PKPaymentPassDetailSectionController init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pass, a3);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D674E8]), "initWithPass:webService:", v9, v10);
    precursorController = v13->_precursorController;
    v13->_precursorController = (PKPrecursorPassUpgradeController *)v14;

    -[PKPrecursorPassUpgradeController setDelegate:](v13->_precursorController, "setDelegate:", v13);
    objc_storeWeak((id *)&v13->_delegate, v11);
  }

  return v13;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  return 1;
}

- (void)_updateSectionIdentifiersNotify:(BOOL)a3 animated:(BOOL)a4
{
  int mapped;
  int v5;
  _BOOL4 v6;
  void *v8;
  id WeakRetained;

  mapped = self->_mapped;
  v5 = self->_description != 0;
  self->_mapped = v5;
  if (a3 && mapped != v5)
  {
    v6 = a4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (v6)
    {
      -[PKPassDetailsPrecursorPassUpgradeSectionController sectionIdentifiers](self, "sectionIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "reloadSections:", v8);

    }
    else
    {
      objc_msgSend(WeakRetained, "reloadData:", 0);
    }

  }
}

- (void)loadDescriptionWithAnimated:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  PKPrecursorPassUpgradeController *precursorController;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  v6 = a4;
  -[PKPrecursorPassUpgradeController devicePrimaryPrecursorRequest](self->_precursorController, "devicePrimaryPrecursorRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  precursorController = self->_precursorController;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__PKPassDetailsPrecursorPassUpgradeSectionController_loadDescriptionWithAnimated_completion___block_invoke;
  v10[3] = &unk_1E3E6B7D8;
  v12 = a3;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[PKPrecursorPassUpgradeController requestDescriptionFor:completion:](precursorController, "requestDescriptionFor:completion:", v7, v10);

}

void __93__PKPassDetailsPrecursorPassUpgradeSectionController_loadDescriptionWithAnimated_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), a2);
  objc_msgSend(*(id *)(a1 + 32), "_updateSectionIdentifiersNotify:animated:", 1, *(unsigned __int8 *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

- (void)preflight:(id)a3
{
  -[PKPassDetailsPrecursorPassUpgradeSectionController loadDescriptionWithAnimated:completion:](self, "loadDescriptionWithAnimated:completion:", 0, a3);
}

- (id)allSectionIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PrecursorPassSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sectionIdentifiers
{
  void *v3;

  if ((unint64_t)(-[PKPaymentPassDetailSectionController detailViewStyle](self, "detailViewStyle") - 1) > 1
    || -[PKPaymentPassDetailSectionController currentSegment](self, "currentSegment")
    || !self->_mapped)
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PKPassDetailsPrecursorPassUpgradeSectionController allSectionIdentifiers](self, "allSectionIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  PKPrecursorPassUpgradeRequestDescription *description;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (PKEqualObjects())
  {
    v9 = objc_msgSend(v8, "row");
    description = self->_description;
    if (v9)
    {
      -[PKPrecursorPassUpgradeRequestDescription localizedActionText](description, "localizedActionText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailSectionController linkCellWithText:forTableView:](self, "linkCellWithText:forTableView:", v11, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PKPrecursorPassUpgradeRequestDescription localizedTitle](description, "localizedTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPrecursorPassUpgradeRequestDescription localizedDescription](self->_description, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailSectionController stackedInfoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "stackedInfoCellWithPrimaryText:detailText:cellStyle:forTableView:", v11, v13, 1, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  PKPrecursorPassUpgradeRequestDescription *description;
  void *v6;
  int64_t v7;

  if (!PKEqualObjects())
    return 0;
  description = self->_description;
  if (!description)
    return 0;
  -[PKPrecursorPassUpgradeRequestDescription localizedActionText](description, "localizedActionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = 2;
  else
    v7 = 1;

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  id WeakRetained;
  PKPrecursorPassUpgradeRequestDescription *description;
  PKPrecursorPassUpgradeController *precursorController;
  id v16;
  _QWORD v17[5];
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v9, 1);
  v11 = PKEqualObjects();

  if (v11 && objc_msgSend(v9, "row") == 1)
  {
    objc_msgSend(v8, "cellForRowAtIndexPath:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailSectionController showSpinner:inCell:overrideTextColor:](self, "showSpinner:inCell:overrideTextColor:", 1, v12, 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    description = self->_description;
    precursorController = self->_precursorController;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __106__PKPassDetailsPrecursorPassUpgradeSectionController_tableView_didSelectRowAtIndexPath_sectionIdentifier___block_invoke;
    v17[3] = &unk_1E3E61388;
    v17[4] = self;
    v18 = v12;
    v16 = v12;
    objc_msgSend(WeakRetained, "didSelectPrecursorPassRequestForDescription:controller:completion:", description, precursorController, v17);

  }
}

void __106__PKPassDetailsPrecursorPassUpgradeSectionController_tableView_didSelectRowAtIndexPath_sectionIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v1, "linkTextColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "showSpinner:inCell:overrideTextColor:", 0, v2, v3);

}

- (void)precursorPassUpgradeRequestDidChange
{
  -[PKPassDetailsPrecursorPassUpgradeSectionController loadDescriptionWithAnimated:completion:](self, "loadDescriptionWithAnimated:completion:", 1, 0);
}

- (PKPassDetailsPrecursorPassUpgradeSectionControllerDelegate)delegate
{
  return (PKPassDetailsPrecursorPassUpgradeSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_precursorController, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
