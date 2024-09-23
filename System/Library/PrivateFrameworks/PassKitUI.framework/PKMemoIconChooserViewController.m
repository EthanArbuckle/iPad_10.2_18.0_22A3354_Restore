@implementation PKMemoIconChooserViewController

- (PKMemoIconChooserViewController)initWithDelegate:(id)a3 memo:(id)a4 context:(int64_t)a5
{
  return -[PKMemoIconChooserViewController initWithDelegate:memo:context:mode:](self, "initWithDelegate:memo:context:mode:", a3, a4, a5, 0);
}

- (PKMemoIconChooserViewController)initWithDelegate:(id)a3 memo:(id)a4 context:(int64_t)a5 mode:(unint64_t)a6
{
  id v10;
  id v11;
  PKMemoIconChooserViewController *v12;
  PKMemoIconChooserViewController *v13;
  PKMemoIconChooserSectionController *v14;
  PKMemoIconChooserSectionController *section;
  void *v16;
  uint64_t v17;
  UIBarButtonItem *doneButton;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKMemoIconChooserViewController;
  v12 = -[PKDynamicCollectionViewController init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v10);
    v13->_context = a5;
    v13->_mode = a6;
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v13, "setUseItemIdentityWhenUpdating:", 1);
    v14 = -[PKMemoIconChooserSectionController initWithDelegate:mode:memo:]([PKMemoIconChooserSectionController alloc], "initWithDelegate:mode:memo:", v13, a6, v11);
    section = v13->_section;
    v13->_section = v14;

    v24[0] = v13->_section;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicCollectionViewController setSections:animated:](v13, "setSections:animated:", v16, 1);

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v13, sel__doneTapped);
    doneButton = v13->_doneButton;
    v13->_doneButton = (UIBarButtonItem *)v17;

    -[UIBarButtonItem setEnabled:](v13->_doneButton, "setEnabled:", 0);
    -[PKMemoIconChooserViewController navigationItem](v13, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRightBarButtonItem:", v13->_doneButton);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v13, sel__cancelTapped);
    objc_msgSend(v19, "setLeftBarButtonItem:", v20);

    PKLocalizedPeerPaymentRecurringString(CFSTR("MEMO_PICKER_CHOOSE_ICON"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTitle:", v21);

  }
  return v13;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKMemoIconChooserViewController;
  -[PKDynamicCollectionViewController loadView](&v6, sel_loadView);
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyboardDismissMode:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  PKMemoItem *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKMemoIconChooserViewController;
  -[PKDynamicCollectionViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (self->_mode == 1)
  {
    v4 = -[PKMemoItem initWithMemo:type:]([PKMemoItem alloc], "initWithMemo:type:", 0, 2);
    -[PKDynamicCollectionViewController cellForItem:](self, "cellForItem:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showEmojiKeyboardIfNeeded");

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  unint64_t v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)PKMemoIconChooserViewController;
  -[PKMemoIconChooserViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[PKMemoIconChooserViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v4 = +[PKMemoIconChooserSectionController suggestedStyleForAvailableWidth:](PKMemoIconChooserSectionController, "suggestedStyleForAvailableWidth:", CGRectGetWidth(v6));

  if (-[PKMemoIconChooserSectionController style](self->_section, "style") != v4)
    -[PKMemoIconChooserSectionController setStyle:](self->_section, "setStyle:", v4);
}

- (void)_doneTapped
{
  void *v3;
  _QWORD v4[5];

  -[PKMemoIconChooserViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__PKMemoIconChooserViewController__doneTapped__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

}

void __46__PKMemoIconChooserViewController__doneTapped__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1048));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "selectedMemo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "memoIconChooserDidChooseMemo:", v2);

}

- (void)_cancelTapped
{
  id v2;

  -[PKMemoIconChooserViewController presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)invalidateLayout
{
  void *v2;
  id v3;

  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateLayout");

}

- (void)didSelectItem:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  PKMemoIconChooserViewController *v8;
  PKNavigationController *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  v11 = v4;
  if (!self->_mode)
  {
    -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", 1);
    v4 = v11;
  }
  v5 = objc_msgSend(v4, "type") == 1;
  v6 = v11;
  if (v5)
  {
    v7 = -[PKMemoIconChooserViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle");
    v8 = -[PKMemoIconChooserViewController initWithDelegate:memo:context:mode:]([PKMemoIconChooserViewController alloc], "initWithDelegate:memo:context:mode:", self, 0, self->_context, 1);
    -[PKMemoIconChooserViewController setOverrideUserInterfaceStyle:](v8, "setOverrideUserInterfaceStyle:", v7);
    v9 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v8);
    -[PKNavigationController setOverrideUserInterfaceStyle:](v9, "setOverrideUserInterfaceStyle:", v7);
    if (self->_context == 9 && (PKIsPad() & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      if (!-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
      {
LABEL_11:
        -[PKMemoIconChooserViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

        v6 = v11;
        goto LABEL_12;
      }
      v10 = 16;
    }
    -[PKNavigationController setModalPresentationStyle:](v9, "setModalPresentationStyle:", v10);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)selectCellForItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKDynamicCollectionViewController cellForItem:](self, "cellForItem:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", 1);
  -[PKDynamicCollectionViewController reloadItem:animated:](self, "reloadItem:animated:", v4, 0);

}

- (void)cell:(id)a3 didUpdateText:(id)a4
{
  -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", objc_msgSend(a4, "length", a3) != 0);
}

- (void)memoIconChooserDidChooseMemo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  PKPeerPaymentAddRecurringPaymentRecentMemoIcon();
  -[PKMemoIconChooserSectionController reloadItems](self->_section, "reloadItems");
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 1, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectItemAtIndexPath:animated:scrollPosition:", v6, 1, 0);

  -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", 1);
  -[PKMemoIconChooserSectionController setMemoSelection:](self->_section, "setMemoSelection:", v4);

}

- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor
{
  _BOOL8 v2;
  int64_t v3;
  $85E40A55691FE2F31975A98F57E3065D result;

  v2 = -[PKMemoIconChooserViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle") == 2;
  v3 = v2;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
