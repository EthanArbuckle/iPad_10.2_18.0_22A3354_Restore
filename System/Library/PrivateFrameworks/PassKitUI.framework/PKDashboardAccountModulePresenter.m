@implementation PKDashboardAccountModulePresenter

- (PKDashboardAccountModulePresenter)init
{
  PKDashboardAccountModulePresenter *v2;
  PKAccountModuleCollectionViewCell *v3;
  uint64_t v4;
  PKAccountModuleCollectionViewCell *sampleCell;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDashboardAccountModulePresenter;
  v2 = -[PKDashboardAccountModulePresenter init](&v7, sel_init);
  if (v2)
  {
    v3 = [PKAccountModuleCollectionViewCell alloc];
    v4 = -[PKAccountModuleCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKAccountModuleCollectionViewCell *)v4;

  }
  return v2;
}

- (id)collectionViewCellClasses
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("kAccountModuleCellIdentifier");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kAccountModuleCellIdentifier"), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardAccountModulePresenter _configureCell:item:collectionView:](self, "_configureCell:item:collectionView:", v10, v9, v8);

  return v10;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (!v15 || (*((unsigned int (**)(id))v15 + 2))(v15))
  {
    v17 = v20;
    objc_msgSend(v17, "account");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentingPass");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKDashboardAccountModulePresenter pushAccountViewControllerForAccount:presentingPass:presentationContext:onNavigationController:](self, "pushAccountViewControllerForAccount:presentingPass:presentationContext:onNavigationController:", v18, v19, 0, v14);
  }

}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  objc_msgSend(a4, "bounds", a3);
  v7 = v6;
  +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
  -[PKAccountModuleCollectionViewCell sizeThatFits:](self->_sampleCell, "sizeThatFits:", v7 + v8 * -2.0, 3.40282347e38);
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  PKAccountModuleCollectionViewCell *v11;
  PKAccountModuleCollectionViewCell *v12;
  PKAccountModuleCollectionViewCell *sampleCell;

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
      v11 = [PKAccountModuleCollectionViewCell alloc];
      v12 = -[PKAccountModuleCollectionViewCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      sampleCell = self->_sampleCell;
      self->_sampleCell = v12;

    }
  }
}

- (void)pushAccountViewControllerForAccount:(id)a3 presentingPass:(id)a4 presentationContext:(id)a5 onNavigationController:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PKAccountViewInterfaceConfiguration *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v15 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
  -[PKAccountViewInterfaceConfiguration setAccount:](v15, "setAccount:", v13);

  -[PKAccountViewInterfaceConfiguration setDestination:](v15, "setDestination:", 0);
  -[PKAccountViewInterfaceConfiguration setViewStyle:](v15, "setViewStyle:", 0);
  -[PKAccountViewInterfaceConfiguration setCashbackPass:](v15, "setCashbackPass:", v12);

  -[PKDashboardAccountModulePresenter accountViewControllerWithConfiguration:presentationContext:](self, "accountViewControllerWithConfiguration:presentationContext:", v15, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "pushViewController:animated:", v14, 1);
}

- (id)accountViewControllerWithConfiguration:(id)a3 presentationContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  PKSavingsAccountViewController *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "presentationSource");

  if (v8)
  {
    if (v8 == 2)
    {
      objc_msgSend(v7, "accountIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (PKAccountServiceIsNewAccountWithAccountIdentifier())
      {
        v10 = objc_msgSend(v5, "destination");
        objc_msgSend(v5, "setIsNewAccount:", v10 == 0);
        if (!v10)
          PKSetAccountServiceIsNewAccountWithAccountIdentifier();
      }
      else
      {
        objc_msgSend(v5, "setIsNewAccount:", 0);
      }

    }
  }
  else if (!objc_msgSend(v5, "destination"))
  {
    objc_msgSend(v7, "savingsDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fccStepUpDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "thresholdExceeded");

    if (v13)
      objc_msgSend(v5, "setDestination:", 11);
  }
  if (objc_msgSend(v7, "type") == 4)
    v14 = -[PKSavingsAccountViewController initWithConfiguration:]([PKSavingsAccountViewController alloc], "initWithConfiguration:", v5);
  else
    v14 = 0;

  return v14;
}

- (void)_configureCell:(id)a3 item:(id)a4 collectionView:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  objc_msgSend(v8, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureWithAccount:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end
