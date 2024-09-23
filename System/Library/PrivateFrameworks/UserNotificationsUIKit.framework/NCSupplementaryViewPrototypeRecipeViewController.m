@implementation NCSupplementaryViewPrototypeRecipeViewController

- (NCSupplementaryViewPrototypeRecipeViewController)init
{
  NCSupplementaryViewPrototypeRecipeViewController *v2;
  uint64_t v3;
  NSDate *dateModified;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCSupplementaryViewPrototypeRecipeViewController;
  v2 = -[NCSupplementaryViewPrototypeRecipeViewController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = objc_claimAutoreleasedReturnValue();
    dateModified = v2->_dateModified;
    v2->_dateModified = (NSDate *)v3;

  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCSupplementaryViewPrototypeRecipeViewController;
  -[NCSupplementaryViewPrototypeRecipeViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[NCSupplementaryViewPrototypeRecipeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateConfiguration:(id)a3
{
  void (**v4)(id, uint64_t);
  uint64_t v5;
  NCNotificationListSupplementaryViewConfiguration *v6;
  NCNotificationListSupplementaryViewConfiguration *configuration;
  void *v8;
  NCNotificationListMutableSupplementaryViewConfiguration *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  v5 = -[NCNotificationListSupplementaryViewConfiguration mutableCopy](self->_configuration, "mutableCopy");
  if (v5)
  {
    v6 = (NCNotificationListSupplementaryViewConfiguration *)v5;
    v4[2](v4, v5);
    configuration = self->_configuration;
    self->_configuration = v6;

    -[NCSupplementaryViewPrototypeRecipeViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestsUpdateForPrototypeRecipeViewController:", self);
  }
  else
  {
    v9 = objc_alloc_init(NCNotificationListMutableSupplementaryViewConfiguration);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListMutableSupplementaryViewConfiguration setTextColor:](v9, "setTextColor:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "colorWithAlphaComponent:", 0.2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListMutableSupplementaryViewConfiguration setTintColor:](v9, "setTintColor:", v12);

    -[NCNotificationListMutableSupplementaryViewConfiguration setMaterialRecipe:](v9, "setMaterialRecipe:", 22);
    objc_msgSend((id)objc_opt_class(), "title");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (const __CFString *)v13;
    else
      v15 = CFSTR("Supplementary View");
    -[NCNotificationListMutableSupplementaryViewConfiguration setGroupName:](v9, "setGroupName:", v15);

    -[NCNotificationListMutableSupplementaryViewConfiguration setGroupingIdentifier:](v9, "setGroupingIdentifier:", CFSTR("identifier"));
    objc_initWeak(&location, self);
    v16 = (void *)MEMORY[0x1E0DC3428];
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __72__NCSupplementaryViewPrototypeRecipeViewController_updateConfiguration___block_invoke;
    v22 = &unk_1E8D1B1C8;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", CFSTR("Action"), 0, 0, &v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1, v19, v20, v21, v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListMutableSupplementaryViewConfiguration setSupplementaryActions:](v9, "setSupplementaryActions:", v18);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    v4[2](v4, (uint64_t)v9);
    v8 = self->_configuration;
    self->_configuration = &v9->super;
  }

}

void __72__NCSupplementaryViewPrototypeRecipeViewController_updateConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "requestsRemovalForPrototypeRecipeViewController:", v3);

    WeakRetained = v3;
  }

}

- (unint64_t)count
{
  return 1;
}

+ (NSSet)presentableTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (BOOL)adjustForContentSizeCategoryChange
{
  return 1;
}

+ (NSString)title
{
  return 0;
}

- (id)_testActionNotImplementedBlock
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __82__NCSupplementaryViewPrototypeRecipeViewController__testActionNotImplementedBlock__block_invoke;
  v4[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __82__NCSupplementaryViewPrototypeRecipeViewController__testActionNotImplementedBlock__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(v8, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, CFSTR("Action not implemented."), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Dismiss"), 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v7);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v6, 1, 0);

  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NCNotificationListSupplementaryViewConfiguration)configuration
{
  return self->_configuration;
}

- (NCSupplementaryViewPrototypeRecipeViewControllerDelegate)delegate
{
  return (NCSupplementaryViewPrototypeRecipeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)dateModified
{
  return self->_dateModified;
}

- (void)setDateModified:(id)a3
{
  objc_storeStrong((id *)&self->_dateModified, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateModified, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
