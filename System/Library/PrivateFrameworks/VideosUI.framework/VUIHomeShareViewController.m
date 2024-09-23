@implementation VUIHomeShareViewController

- (VUIHomeShareViewController)init
{
  VUIHomeShareViewController *v2;
  void *v3;
  void *v4;
  VUIViewControllerContentPresenter *v5;
  VUIViewControllerContentPresenter *contentPresenter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIHomeShareViewController;
  v2 = -[VUILibraryStackViewController init](&v8, sel_init);
  if (v2)
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "homeShareMediaLibraries");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIHomeShareViewController setHomeShares:](v2, "setHomeShares:", v4);

    v5 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v2->_contentPresenter;
    v2->_contentPresenter = v5;

    -[VUIViewControllerContentPresenter setLogName:](v2->_contentPresenter, "setLogName:", CFSTR("VUIHomeShareViewController"));
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIHomeShareViewController;
  -[VUIHomeShareViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  VUILibraryMenuItemViewCell *v5;
  VUILibraryMenuItemViewCell *menuItemSizingCell;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIHomeShareViewController;
  -[VUIHomeShareViewController loadView](&v8, sel_loadView);
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:", CFSTR("LIBRARY_HOMESHARES"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIHomeShareViewController setTitle:](self, "setTitle:", v4);

  v5 = objc_alloc_init(VUILibraryMenuItemViewCell);
  menuItemSizingCell = self->_menuItemSizingCell;
  self->_menuItemSizingCell = v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__homeShareMediaLibrariesDidChange_, CFSTR("VUIMediaLibraryManagerHomeSharesDidChangeNotification"), 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VUIHomeShareViewController;
  -[VUIHomeShareViewController viewWillAppear:](&v17, sel_viewWillAppear_);
  -[VUILibraryStackViewController stackCollectionView](self, "stackCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[VUIHomeShareViewController transitionCoordinator](self, "transitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __45__VUIHomeShareViewController_viewWillAppear___block_invoke;
      v13[3] = &unk_1E9F98F00;
      v14 = v5;
      v15 = v7;
      v16 = a3;
      v10[0] = v9;
      v10[1] = 3221225472;
      v10[2] = __45__VUIHomeShareViewController_viewWillAppear___block_invoke_2;
      v10[3] = &unk_1E9F98F28;
      v11 = v14;
      v12 = v15;
      objc_msgSend(v8, "animateAlongsideTransition:completion:", v13, v10);

    }
    else
    {
      objc_msgSend(v5, "deselectItemAtIndexPath:animated:", v7, 1);
    }

  }
  +[VUILibraryMetrics recordPageEventWithPageType:](VUILibraryMetrics, "recordPageEventWithPageType:", CFSTR("LibraryHomeSharing"));

}

uint64_t __45__VUIHomeShareViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectItemAtIndexPath:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __45__VUIHomeShareViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 40), 0, 0);
  return result;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIHomeShareViewController;
  -[VUIHomeShareViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[VUIHomeShareViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIHomeShareViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "configureCurrentViewFrameForBounds:");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VUIHomeShareViewController;
  -[VUILibraryStackViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[VUILibraryStackViewController stackCollectionView](self, "stackCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[VUIHomeShareViewController contentPresenter](self, "contentPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRootViewForViewController:", self);

  -[VUIHomeShareViewController contentPresenter](self, "contentPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryStackViewController stackCollectionView](self, "stackCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentView:", v6);

  -[VUIHomeShareViewController contentPresenter](self, "contentPresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentContentViewType:", 3);

  -[VUIHomeShareViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC6960], "makeAccessibilityIdentifierString:additionalString:", *MEMORY[0x1E0DC6AA0], CFSTR("Library.id=\"HomeSharing\"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", v9);

}

- (void)configureWithCollectionView:(id)a3
{
  void *v4;
  id v5;
  CGRect v6;

  v5 = a3;
  objc_msgSend(v5, "setDataSource:", self);
  v4 = (void *)MEMORY[0x1E0DC3F98];
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "vui_paddingForWindowWidth:", CGRectGetWidth(v6));
  objc_msgSend(v5, "setContentInset:");

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("VUILibraryMenuCellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIHomeShareViewController homeShares](self, "homeShares");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v11, v13, v14);

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[VUIHomeShareViewController homeShares](self, "homeShares", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  double Width;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;
  CGRect v22;

  v6 = a5;
  -[VUIHomeShareViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  Width = CGRectGetWidth(v22);

  -[VUIHomeShareViewController homeShares](self, "homeShares");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "row");

  objc_msgSend(v9, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryMenuItemViewCell titleLabel](self->_menuItemSizingCell, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryMenuItemViewCell titleLabel](self->_menuItemSizingCell, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v12, v14, v15);

  -[VUILibraryMenuItemViewCell sizeThatFits:](self->_menuItemSizingCell, "sizeThatFits:", Width, 1.79769313e308);
  v18 = v17;

  v19 = Width;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  -[VUIHomeShareViewController homeShares](self, "homeShares");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[VUIHomeShareViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "homeShareViewController:didSelectHomeShare:", self, v9);

}

- (void)_homeShareMediaLibrariesDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeShareMediaLibraries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIHomeShareViewController setHomeShares:](self, "setHomeShares:", v5);

  -[VUIHomeShareViewController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[VUIHomeShareViewController homeShares](self, "homeShares");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeShareViewController:didUpdateWith:", self, v6);

  }
  -[VUILibraryStackViewController stackCollectionView](self, "stackCollectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (VUIHomeShareViewControllerDelegate)delegate
{
  return (VUIHomeShareViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)homeShares
{
  return self->_homeShares;
}

- (void)setHomeShares:(id)a3
{
  objc_storeStrong((id *)&self->_homeShares, a3);
}

- (VUILibraryMenuItemViewCell)menuItemSizingCell
{
  return self->_menuItemSizingCell;
}

- (void)setMenuItemSizingCell:(id)a3
{
  objc_storeStrong((id *)&self->_menuItemSizingCell, a3);
}

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)setContentPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_contentPresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_menuItemSizingCell, 0);
  objc_storeStrong((id *)&self->_homeShares, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
