@implementation PKSpendingSummaryAccountUserPresenter

- (PKSpendingSummaryAccountUserPresenter)initWithTransactionSourceCollection:(id)a3 familyCollection:(id)a4 avatarManager:(id)a5 interimSpacing:(double)a6
{
  id v11;
  id v12;
  id v13;
  PKSpendingSummaryAccountUserPresenter *v14;
  PKSpendingSummaryAccountUserPresenter *v15;
  void *v16;
  PKSpendingSummaryAccountUserCell *v17;
  uint64_t v18;
  PKSpendingSummaryAccountUserCell *sampleCell;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKSpendingSummaryAccountUserPresenter;
  v14 = -[PKSpendingSummaryAccountUserPresenter init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_transactionSourceCollection, a3);
    objc_storeStrong((id *)&v15->_familyCollection, a4);
    objc_storeStrong((id *)&v15->_avatarManager, a5);
    v15->_interimSpacing = a6;
    objc_msgSend(v11, "transactionSourcesForType:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_numUsers = objc_msgSend(v16, "count");

    v17 = [PKSpendingSummaryAccountUserCell alloc];
    v18 = -[PKSpendingSummaryAccountUserCell initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleCell = v15->_sampleCell;
    v15->_sampleCell = (PKSpendingSummaryAccountUserCell *)v18;

  }
  return v15;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("spendingAccountUserPresenter");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("spendingAccountUserPresenter"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummaryAccountUserPresenter updateCell:forItem:inCollectionView:atIndexPath:](self, "updateCell:forItem:inCollectionView:atIndexPath:", v11, v10, v9, v8);

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v7;
  uint64_t v8;
  int64_t numUsers;
  unint64_t v10;
  int64_t v11;
  double v12;
  double v13;
  double interimSpacing;
  double v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  v7 = a4;
  v8 = objc_msgSend(a5, "row");
  numUsers = self->_numUsers;
  v10 = v8 + 2;
  if ((unint64_t)(v8 + 2) > 4)
  {
    if (v8 == numUsers / 3)
      v11 = -3 * v8 + numUsers;
    else
      v11 = 3;
  }
  else if (numUsers >= 3)
  {
    v11 = 3;
  }
  else
  {
    v11 = self->_numUsers;
  }
  objc_msgSend(v7, "frame");
  v13 = v12;

  interimSpacing = self->_interimSpacing;
  +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
  v16 = v11 >= 3 || v10 >= 5;
  v17 = (double)v11;
  if (v16)
    v17 = 3.0;
  -[PKSpendingSummaryAccountUserCell sizeThatFits:](self->_sampleCell, "sizeThatFits:", (v13 - (v15 + v15 + interimSpacing * (double)(v11 - 1))) / v17, 1.79769313e308);
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  PKSpendingSummaryAccountUserCell *v11;
  PKSpendingSummaryAccountUserCell *v12;
  PKSpendingSummaryAccountUserCell *sampleCell;

  if (a3 && a4)
  {
    v7 = a4;
    objc_msgSend(a3, "preferredContentSizeCategory");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSizeCategory");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    v10 = UIContentSizeCategoryCompareToCategory(v8, v9);
    if (v10)
    {
      v11 = [PKSpendingSummaryAccountUserCell alloc];
      v12 = -[PKSpendingSummaryAccountUserCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      sampleCell = self->_sampleCell;
      self->_sampleCell = v12;

    }
  }
}

- (void)_configureCell:(id)a3 item:(id)a4
{
  id v6;
  id v7;
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
  PKContactAvatarManager *avatarManager;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PKContactAvatarManager *v26;
  PKContactAvatarManager *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    objc_msgSend(v7, "accountUser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "familyMember");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "altDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "spendingSummary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "spendingsPerAltDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isCurrentUser"))
    {
      PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_NAME_YOU"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setName:", v15);
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0D66C60];
      objc_msgSend(v9, "nameComponents");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contactForFamilyMember:nameComponents:imageData:", v10, v17, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "givenName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setName:", v18);

    }
    objc_msgSend(v14, "totalSpending");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "formattedStringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAmount:", v20);

    objc_msgSend(v6, "setMaskType:", 3);
    objc_msgSend(v6, "setWantsCustomAppearance:", 0);
    objc_msgSend(v6, "setWantsDefaultHighlightBehavior:", 1);
    avatarManager = self->_avatarManager;
    objc_msgSend(v9, "altDSID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContactAvatarManager cachedAvatarForAltDSID:](avatarManager, "cachedAvatarForAltDSID:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setAvatar:", v23);
    objc_msgSend(v6, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v28 = v11;
      objc_initWeak(&location, self);
      v25 = v10;
      v26 = self->_avatarManager;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __61__PKSpendingSummaryAccountUserPresenter__configureCell_item___block_invoke;
      v29[3] = &unk_1E3E6F3C0;
      objc_copyWeak(&v32, &location);
      v30 = v6;
      v31 = v24;
      v27 = v26;
      v10 = v25;
      -[PKContactAvatarManager avatarForFamilyMember:accountUser:invitation:completion:](v27, "avatarForFamilyMember:accountUser:invitation:completion:", v25, v9, 0, v29);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
      v11 = v28;
    }

  }
}

void __61__PKSpendingSummaryAccountUserPresenter__configureCell_item___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__PKSpendingSummaryAccountUserPresenter__configureCell_item___block_invoke_2;
  v5[3] = &unk_1E3E65CC0;
  objc_copyWeak(&v9, a1 + 6);
  v6 = a1[4];
  v7 = a1[5];
  v8 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

void __61__PKSpendingSummaryAccountUserPresenter__configureCell_item___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  int v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    v5 = v3;
    v6 = v4;
    if (v5 == v6)
    {

      goto LABEL_11;
    }
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8)
    {

LABEL_12:
      WeakRetained = v10;
      goto LABEL_13;
    }
    v9 = objc_msgSend(v5, "isEqualToString:", v6);

    WeakRetained = v10;
    if (v9)
    {
LABEL_11:
      objc_msgSend(*(id *)(a1 + 32), "setAvatar:", *(_QWORD *)(a1 + 48));
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCell, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end
