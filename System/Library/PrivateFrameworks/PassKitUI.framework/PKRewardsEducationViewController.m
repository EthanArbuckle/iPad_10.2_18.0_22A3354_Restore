@implementation PKRewardsEducationViewController

- (PKRewardsEducationViewController)initWithAccount:(id)a3 accountService:(id)a4 enhancedMerchantsFetcher:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKRewardsEducationViewController *v12;
  PKRewardsEducationViewController *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKRewardsEducationViewController;
  v12 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v17, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1), 2);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    objc_storeStrong((id *)&v13->_accountService, a4);
    objc_storeStrong((id *)&v13->_enhancedMerchantsFetcher, a5);
    -[PKRewardsEducationViewController navigationItem](v13, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, v13, sel__close_);
    objc_msgSend(v14, "setRightBarButtonItem:", v15);

  }
  return v13;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *tiers;
  void *v21;
  objc_super v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)PKRewardsEducationViewController;
  -[PKSectionTableViewController viewDidLoad](&v22, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0D675C0]);
  PKLocalizedFeatureString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTier:localizedTitle:localizedSubtitle:", 3, v4, v5);

  v7 = objc_alloc(MEMORY[0x1E0D675C0]);
  PKLocalizedFeatureString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithTier:localizedTitle:localizedSubtitle:", 2, v8, v9);

  v11 = objc_alloc(MEMORY[0x1E0D675C0]);
  PKLocalizedFeatureString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithTier:localizedTitle:localizedSubtitle:", 1, v12, v13);

  v15 = objc_alloc(MEMORY[0x1E0D675C0]);
  PKLocalizedFeatureString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithTier:localizedTitle:localizedSubtitle:", 4, v16, v17);

  v23[0] = v6;
  v23[1] = v10;
  v23[2] = v14;
  v23[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  tiers = self->_tiers;
  self->_tiers = v19;

  -[PKRewardsEducationViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("RewardsTierEducationCellIdentifier"));
  objc_msgSend(v21, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("LinkEducationCellIdentifier"));
  objc_msgSend(v21, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("HeaderIdentifier"));
  objc_msgSend(v21, "setDataSource:", self);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSComparisonResult v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKRewardsEducationViewController;
  -[PKRewardsEducationViewController traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[PKRewardsEducationViewController traitCollection](self, "traitCollection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      objc_msgSend(v4, "preferredContentSizeCategory");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
      {
        -[PKRewardsEducationViewController tableView](self, "tableView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "reloadData");

      }
    }
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (-[PKRewardsEducationViewController _shouldShowLinkSection](self, "_shouldShowLinkSection", a3))
    return 2;
  else
    return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = -[PKRewardsEducationViewController _shouldShowLinkSection](self, "_shouldShowLinkSection");
  }
  else if (a4)
  {
    v7 = 0;
  }
  else
  {
    v7 = -[NSArray count](self->_tiers, "count");
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  if (v6 == 1)
  {
    -[PKRewardsEducationViewController _linkTableViewCellForIndexPath:](self, "_linkTableViewCellForIndexPath:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[PKRewardsEducationViewController _tierTableViewCellForIndexPath:](self, "_tierTableViewCellForIndexPath:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_7:

  return v8;
}

- (id)_tierTableViewCellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *tiers;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[PKRewardsEducationViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("RewardsTierEducationCellIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  tiers = self->_tiers;
  v8 = objc_msgSend(v4, "row");

  -[NSArray objectAtIndex:](tiers, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v10);

  objc_msgSend(v9, "localizedSubtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSubtitle:", v11);

  v12 = objc_msgSend(v9, "tier") - 1;
  if (v12 > 3)
  {
    v13 = 0;
  }
  else
  {
    PKUIImageNamed(off_1E3E62238[v12]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tierIcon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:", v13);

  objc_msgSend(v6, "setLink:", 0);
  objc_msgSend(v6, "setSelectionStyle:", 0);

  return v6;
}

- (id)_linkTableViewCellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[PKRewardsEducationViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("LinkEducationCellIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  objc_msgSend(v6, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v10);

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = objc_msgSend(v6, "section");

  if (v7 == 1)
    -[PKRewardsEducationViewController _presentMerchantBenefitsView](self, "_presentMerchantBenefitsView");
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  if (a4 == 1)
  {
    v4 = 0;
  }
  else
  {
    -[PKRewardsEducationViewController tableView](self, "tableView", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("HeaderIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;

  if (objc_msgSend(a3, "numberOfSections") - 1 == a4)
  {
    PKLocalizedFeatureString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_presentMerchantBenefitsView
{
  PKEnhancedMerchantsViewController *v3;
  uint64_t v4;
  PKEnhancedMerchantsViewController *v5;
  void (**v6)(_QWORD);
  _QWORD v7[4];
  void (**v8)(_QWORD);
  _QWORD aBlock[4];
  PKEnhancedMerchantsViewController *v10;
  id v11;
  id location;

  v3 = -[PKEnhancedMerchantsViewController initWithAccount:accountService:enhancedMerchantsFetcher:]([PKEnhancedMerchantsViewController alloc], "initWithAccount:accountService:enhancedMerchantsFetcher:", self->_account, self->_accountService, self->_enhancedMerchantsFetcher);
  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PKRewardsEducationViewController__presentMerchantBenefitsView__block_invoke;
  aBlock[3] = &unk_1E3E61B68;
  objc_copyWeak(&v11, &location);
  v5 = v3;
  v10 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __64__PKRewardsEducationViewController__presentMerchantBenefitsView__block_invoke_3;
    v7[3] = &unk_1E3E614F0;
    v8 = v6;
    -[PKEnhancedMerchantsViewController preflightWithCompletion:](v5, "preflightWithCompletion:", v7);

  }
  else
  {
    v6[2](v6);
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __64__PKRewardsEducationViewController__presentMerchantBenefitsView__block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__PKRewardsEducationViewController__presentMerchantBenefitsView__block_invoke_2;
  v2[3] = &unk_1E3E61B68;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

void __64__PKRewardsEducationViewController__presentMerchantBenefitsView__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v2, 1, 0);

}

uint64_t __64__PKRewardsEducationViewController__presentMerchantBenefitsView__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_close:(id)a3
{
  id v3;

  -[PKRewardsEducationViewController navigationController](self, "navigationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (BOOL)_shouldShowLinkSection
{
  return -[PKAccount showEnhancedMerchants](self->_account, "showEnhancedMerchants");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiers, 0);
  objc_storeStrong((id *)&self->_enhancedMerchantsFetcher, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
