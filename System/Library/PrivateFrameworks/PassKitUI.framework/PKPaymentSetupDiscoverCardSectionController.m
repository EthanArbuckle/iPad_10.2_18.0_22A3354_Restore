@implementation PKPaymentSetupDiscoverCardSectionController

- (PKPaymentSetupDiscoverCardSectionController)init
{
  PKPaymentSetupDiscoverCardSectionController *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSArray *identifiers;
  uint64_t v7;
  UICollectionViewCellRegistration *cellRegistration;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupDiscoverCardSectionController;
  v2 = -[PKPaymentSetupDiscoverCardSectionController init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    identifiers = v2->_identifiers;
    v2->_identifiers = (NSArray *)v5;

    objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), &__block_literal_global_160);
    v7 = objc_claimAutoreleasedReturnValue();
    cellRegistration = v2->_cellRegistration;
    v2->_cellRegistration = (UICollectionViewCellRegistration *)v7;

  }
  return v2;
}

void __51__PKPaymentSetupDiscoverCardSectionController_init__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0DC3658];
  v3 = a2;
  objc_msgSend(v2, "darkGrayColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  objc_msgSend(v4, "appendItems:", &unk_1E3FAE878);
  return v4;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  void *v4;
  double v5;
  double v6;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSize");
  v6 = v5 + -32.0;

  v7 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeWithWidthDimension:heightDimension:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", 125.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeWithWidthDimension:heightDimension:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v14, v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentInsets:", 10.0, 16.0, 10.0, 16.0);
  objc_msgSend(v17, "setOrthogonalScrollingBehavior:", 4);
  objc_msgSend(v17, "setInterGroupSpacing:", 10.0);
  v18 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", 44.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sizeWithWidthDimension:heightDimension:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v21, *MEMORY[0x1E0DC48A8], 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBoundarySupplementaryItems:", v23);

  return v17;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v5;
  id v6;

  v5 = a3;
  PKLocalizedPaymentString(CFSTR("LEARN_ABOUT_WALLET"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->_cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_cellRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellRegistration, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
