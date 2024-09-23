@implementation SKUIGiftComposeViewController

- (SKUIGiftComposeViewController)initWithGift:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  SKUIGiftComposeViewController *v8;
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
  objc_super v20;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftComposeViewController initWithGift:configuration:].cold.1();
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIGiftComposeViewController;
  v8 = -[SKUIGiftStepViewController initWithGift:configuration:](&v20, sel_initWithGift_configuration_, v6, v7);
  if (v8)
  {
    objc_msgSend(v7, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "localizedStringForKey:inTable:", CFSTR("GIFTING_FLOW_TITLE"), CFSTR("Gifting"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_FLOW_TITLE"), 0, CFSTR("Gifting"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftComposeViewController setTitle:](v8, "setTitle:", v12);

    -[SKUIGiftStepViewController gift](v8, "gift");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "senderName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(v7, "senderName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSenderName:", v14);

    }
    objc_msgSend(v11, "senderEmailAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(v7, "senderEmailAddress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSenderEmailAddress:", v16);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v8, sel__keyboardChangeNotification_, *MEMORY[0x1E0DC4E68], 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v8, sel__keyboardChangeNotification_, *MEMORY[0x1E0DC4E70], 0);
    getCNComposeRecipientViewDidChangeNotification();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v8, sel__recipientsDidChangeNotification_, v18, 0);

    objc_msgSend(v17, "addObserver:selector:name:object:", v8, sel__textFieldChangeNotification_, *MEMORY[0x1E0DC54D0], 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v8, sel__textFieldChangeNotification_, *MEMORY[0x1E0DC54D8], 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v8, sel__textViewChangeNotification_, *MEMORY[0x1E0DC55A0], 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v8, sel__textViewDidEndEditingNotification_, *MEMORY[0x1E0DC55A8], 0);

  }
  else
  {
    v11 = v6;
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSObject *validationTimer;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getCNComposeRecipientViewDidChangeNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, 0);

  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E68], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E70], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC54D0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC54D8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC55A0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC55A8], 0);
  validationTimer = self->_validationTimer;
  if (validationTimer)
    dispatch_source_cancel(validationTimer);
  -[SKUIGiftAddressingSection setTextFieldDelegate:](self->_addressingSection, "setTextFieldDelegate:", 0);
  -[SKUIGiftAmountSection amountControl](self->_amountSection, "amountControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[UIPopoverController setDelegate:](self->_peoplePickerPopover, "setDelegate:", 0);
  -[UIPopoverController setDelegate:](self->_searchResultsPopover, "setDelegate:", 0);

  v7.receiver = self;
  v7.super_class = (Class)SKUIGiftComposeViewController;
  -[SKUIGiftComposeViewController dealloc](&v7, sel_dealloc);
}

- (void)loadView
{
  UITableView *tableView;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  UITableView *v10;
  UITableView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  UIBarButtonItem *v19;
  UIBarButtonItem *nextButton;
  UIBarButtonItem *v21;
  void *v22;
  id v23;

  v23 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[SKUIGiftComposeViewController setView:](self, "setView:");
  if (!self->_sections)
    -[SKUIGiftComposeViewController _reloadSections](self, "_reloadSections");
  tableView = self->_tableView;
  if (!tableView)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "_systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftStepViewController gift](self, "gift");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 30.0;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "userInterfaceIdiom");

      if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v7 = 30.0;
      else
        v7 = 35.0;
    }

    v10 = (UITableView *)objc_alloc_init(MEMORY[0x1E0DC3D48]);
    v11 = self->_tableView;
    self->_tableView = v10;

    -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
    -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v4);
    -[UITableView setContentInset:](self->_tableView, "setContentInset:", v7, 0.0, 20.0, 0.0);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    -[UITableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", 0);
    -[SKUIGiftComposeViewController _headerView](self, "_headerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v4);
    -[UITableView setTableHeaderView:](self->_tableView, "setTableHeaderView:", v12);

    tableView = self->_tableView;
  }
  objc_msgSend(v23, "addSubview:", tableView);
  -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIGiftComposeViewController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v14, "localizedStringForKey:inTable:", CFSTR("GIFTING_BACK_BUTTON"), CFSTR("Gifting"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_BACK_BUTTON"), 0, CFSTR("Gifting"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackButtonTitle:", v16);

  objc_msgSend(v15, "setHidesBackButton:", 1);
  v17 = objc_alloc_init(MEMORY[0x1E0DC34F0]);
  objc_msgSend(v17, "setAction:", sel__cancelAction_);
  objc_msgSend(v17, "setTarget:", self);
  if (v14)
    objc_msgSend(v14, "localizedStringForKey:inTable:", CFSTR("GIFTING_CANCEL_BUTTON"), CFSTR("Gifting"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_CANCEL_BUTTON"), 0, CFSTR("Gifting"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTitle:", v18);

  objc_msgSend(v15, "setLeftBarButtonItem:", v17);
  v19 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x1E0DC34F0]);
  nextButton = self->_nextButton;
  self->_nextButton = v19;

  -[UIBarButtonItem setAction:](self->_nextButton, "setAction:", sel__nextAction_);
  -[UIBarButtonItem setEnabled:](self->_nextButton, "setEnabled:", 0);
  -[UIBarButtonItem setTarget:](self->_nextButton, "setTarget:", self);
  v21 = self->_nextButton;
  if (v14)
    objc_msgSend(v14, "localizedStringForKey:inTable:", CFSTR("GIFTING_NEXT_BUTTON"), CFSTR("Gifting"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_NEXT_BUTTON"), 0, CFSTR("Gifting"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTitle:](v21, "setTitle:", v22);

  objc_msgSend(v15, "setRightBarButtonItem:", self->_nextButton);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = a3;
  -[SKUIGiftComposeViewController _itemView](self, "_itemView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "artworkContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_itemImage)
    v7 = 1;
  else
    v7 = v6 == 0;
  if (!v7)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__SKUIGiftComposeViewController_viewWillAppear___block_invoke;
    v9[3] = &unk_1E73A1EE0;
    objc_copyWeak(&v10, &location);
    -[SKUIGiftStepViewController loadItemArtworkWithArtworkContext:completionBlock:](self, "loadItemArtworkWithArtworkContext:completionBlock:", v6, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIGiftComposeViewController;
  -[SKUIGiftComposeViewController viewWillAppear:](&v8, sel_viewWillAppear_, v3);

}

void __48__SKUIGiftComposeViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_setItemImage:error:", v6, v5);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  unint64_t v7;
  void *v8;
  id v9;
  unint64_t v10;
  UITableView *tableView;
  void *v12;
  void *v13;
  id v14;
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v14 = a4;
  if (-[NSMutableArray count](self->_sections, "count"))
  {
    v7 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
        if (-[UITableView numberOfRowsInSection:](self->_tableView, "numberOfRowsInSection:", v7))
        {
          v10 = 0;
          do
          {
            tableView = self->_tableView;
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v10, v7);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[UITableView cellForRowAtIndexPath:](tableView, "cellForRowAtIndexPath:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v9, "updateCell:forTransitionToSize:", v13, width, height);
            ++v10;
          }
          while (v10 < -[UITableView numberOfRowsInSection:](self->_tableView, "numberOfRowsInSection:", v7));
        }

      }
      ++v7;
    }
    while (v7 < -[NSMutableArray count](self->_sections, "count"));
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIGiftComposeViewController;
  -[SKUIGiftComposeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_, v14, width, height);

}

- (void)tableView:(id)a3 giftRecipientCellDidChangeRecipients:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SKUIGiftStepViewController gift](self, "gift");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipientAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setRecipientAddresses:", v7);
  -[SKUIGiftComposeViewController _validateGiftThrottled:](self, "_validateGiftThrottled:", 0);
}

- (void)tableView:(id)a3 giftRecipientCellDidChangeSize:(id)a4
{
  void *v4;
  id v5;
  uint64_t v6;

  v4 = (void *)MEMORY[0x1E0DC3F10];
  v5 = a3;
  v6 = objc_msgSend(v4, "areAnimationsEnabled");
  objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", 0);
  objc_msgSend(v5, "beginUpdates");
  objc_msgSend(v5, "endUpdates");

  objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", v6);
}

- (void)tableView:(id)a3 giftRecipientCell:(id)a4 didUpdateSearchController:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  UIPopoverController *v12;
  UIPopoverController *searchResultsPopover;
  UIView *v14;
  UIPopoverController *v15;
  void *v16;
  UIView *v17;
  UIView *searchResultsView;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  CGFloat v48;
  id v49;
  CGRect v50;

  v49 = a4;
  v7 = a5;
  if (objc_msgSend(v7, "numberOfResults"))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 == 1)
    {
      if (!self->_searchResultsPopover)
      {
        v10 = objc_alloc(MEMORY[0x1E0DC3B48]);
        objc_msgSend(v7, "searchResultsViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (UIPopoverController *)objc_msgSend(v10, "initWithContentViewController:", v11);
        searchResultsPopover = self->_searchResultsPopover;
        self->_searchResultsPopover = v12;

        -[UIPopoverController setDelegate:](self->_searchResultsPopover, "setDelegate:", self);
        objc_msgSend(v49, "presentSearchResultsPopover:animated:", self->_searchResultsPopover, 1);
      }
    }
    else if (!self->_searchResultsView)
    {
      -[UITableView indexPathForCell:](self->_tableView, "indexPathForCell:", v49);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](self->_tableView, "scrollToRowAtIndexPath:atScrollPosition:animated:", v16, 1, 0);
      objc_msgSend(v7, "searchResultsView");
      v17 = (UIView *)objc_claimAutoreleasedReturnValue();
      searchResultsView = self->_searchResultsView;
      self->_searchResultsView = v17;

      -[UIView setAutoresizingMask:](self->_searchResultsView, "setAutoresizingMask:", 18);
      -[SKUIGiftComposeViewController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "frame");
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      objc_msgSend(v49, "superview");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "convertRect:fromView:", v28, v21, v23, v25, v27);
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;

      objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "frame");
      v39 = v38;
      v41 = v40;
      v43 = v42;
      v45 = v44;
      objc_msgSend(v37, "superview");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "convertRect:fromView:", v46, v39, v41, v43, v45);

      v47 = *MEMORY[0x1E0C9D648];
      v50.origin.x = v30;
      v50.origin.y = v32;
      v50.size.width = v34;
      v50.size.height = v36;
      v48 = CGRectGetMaxY(v50) + -1.0;
      objc_msgSend(v19, "bounds");
      -[UIView setFrame:](self->_searchResultsView, "setFrame:", v47, v48);
      objc_msgSend(v19, "addSubview:", self->_searchResultsView);
      -[UITableView setScrollEnabled:](self->_tableView, "setScrollEnabled:", 0);

    }
  }
  else
  {
    if (self->_searchResultsView)
    {
      -[UITableView setScrollEnabled:](self->_tableView, "setScrollEnabled:", 1);
      -[UIView removeFromSuperview](self->_searchResultsView, "removeFromSuperview");
      v14 = self->_searchResultsView;
      self->_searchResultsView = 0;

    }
    -[UIPopoverController dismissPopoverAnimated:](self->_searchResultsPopover, "dismissPopoverAnimated:", 1);
    -[UIPopoverController setDelegate:](self->_searchResultsPopover, "setDelegate:", 0);
    v15 = self->_searchResultsPopover;
    self->_searchResultsPopover = 0;

  }
}

- (void)tableView:(id)a3 giftRecipientCell:(id)a4 dismissContactPicker:(id)a5
{
  UIPopoverController *peoplePickerPopover;
  UIPopoverController *v7;

  peoplePickerPopover = self->_peoplePickerPopover;
  if (peoplePickerPopover)
  {
    -[UIPopoverController dismissPopoverAnimated:](peoplePickerPopover, "dismissPopoverAnimated:", 1, a4, a5);
    -[UIPopoverController setDelegate:](self->_peoplePickerPopover, "setDelegate:", 0);
    v7 = self->_peoplePickerPopover;
    self->_peoplePickerPopover = 0;

  }
  else
  {
    objc_msgSend(a5, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)tableView:(id)a3 giftRecipientCell:(id)a4 presentContactPicker:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  UIPopoverController *v10;
  UIPopoverController *peoplePickerPopover;
  id v12;

  v12 = a4;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9)
  {
    if (!self->_peoplePickerPopover)
    {
      v10 = (UIPopoverController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B48]), "initWithContentViewController:", v7);
      peoplePickerPopover = self->_peoplePickerPopover;
      self->_peoplePickerPopover = v10;

      -[UIPopoverController setDelegate:](self->_peoplePickerPopover, "setDelegate:", self);
      objc_msgSend(v12, "presentPeoplePickerPopover:animated:", self->_peoplePickerPopover, 1);
    }
  }
  else
  {
    -[SKUIGiftComposeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }

}

- (void)giftSendDateSection:(id)a3 didChangeDate:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[SKUIGiftStepViewController gift](self, "gift");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDeliveryDate:", v5);

  -[SKUIGiftComposeViewController _validateGiftThrottled:](self, "_validateGiftThrottled:", 1);
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  UIPopoverController *v4;
  UIPopoverController **p_peoplePickerPopover;
  UIPopoverController *v6;
  UIPopoverController *v7;

  v4 = (UIPopoverController *)a3;
  p_peoplePickerPopover = &self->_peoplePickerPopover;
  if (self->_peoplePickerPopover == v4
    || (p_peoplePickerPopover = &self->_searchResultsPopover, self->_searchResultsPopover == v4))
  {
    v7 = v4;
    -[UIPopoverController setDelegate:](v4, "setDelegate:", 0);
    v6 = *p_peoplePickerPopover;
    *p_peoplePickerPopover = 0;

    v4 = v7;
  }

}

- (BOOL)popoverControllerShouldDismissPopover:(id)a3
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSMutableArray count](self->_sections, "count", a3);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSMutableArray *sections;
  id v6;
  id v7;
  void *v8;
  void *v9;

  sections = self->_sections;
  v6 = a4;
  v7 = a3;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableViewCellForTableView:indexPath:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRowsInSection");

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  id v6;

  v6 = a4;
  v5 = objc_msgSend(v6, "section");
  if (v5 == -[SKUITableViewSection sectionIndex](self->_addressingSection, "sectionIndex")
    && objc_msgSend(v6, "row") == 2)
  {
    -[SKUIGiftAddressingSection beginEditingMessageForTableView:indexPath:](self->_addressingSection, "beginEditingMessageForTableView:indexPath:", self->_tableView, v6);
  }

}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  NSMutableArray *sections;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  sections = self->_sections;
  v6 = a3;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "headerViewForTableView:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "frame");
    v10 = v9;
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  NSMutableArray *sections;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  sections = self->_sections;
  v6 = a4;
  v7 = a3;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "heightForCellInTableView:indexPath:", v7, v6);
  v10 = v9;

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  NSMutableArray *sections;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  sections = self->_sections;
  v6 = a3;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "headerViewForTableView:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setBackgroundColor:", v9);
  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  NSMutableArray *sections;
  id v8;
  id v9;
  id v10;
  id v11;

  sections = self->_sections;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v8, "section"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tableView:willDisplayCell:forIndexPath:", v10, v9, v8);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  UITableView *tableView;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  double v23;
  id v24;
  UITableView *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  id v37;
  void *v38;

  v4 = a3;
  tableView = self->_tableView;
  objc_msgSend(v4, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView convertRect:fromView:](tableView, "convertRect:fromView:", v14, v7, v9, v11, v13);
  v16 = v15;

  -[UITableView subviews](self->_tableView, "subviews");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  v19 = objc_msgSend(v18, "count");
  if (v19 < 1)
  {
    v21 = 0;
  }
  else
  {
    v20 = v19;
    v21 = 0;
    v22 = 0;
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    do
    {
      objc_msgSend(v18, "objectAtIndex:", v22);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (v24 != v4)
        {
          if (objc_msgSend(v24, "canBecomeFirstResponder"))
          {
            v25 = self->_tableView;
            objc_msgSend(v24, "frame");
            v27 = v26;
            v29 = v28;
            v31 = v30;
            v33 = v32;
            objc_msgSend(v24, "superview");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[UITableView convertRect:fromView:](v25, "convertRect:fromView:", v34, v27, v29, v31, v33);
            v36 = v35;

            if (v36 > v16)
            {
              if (v21)
              {
                if (v36 - v16 < v23 - v16)
                {
                  v37 = v24;

                  v23 = v36;
                  v21 = v37;
                }
              }
              else
              {
                v21 = v24;
                v23 = v36;
              }
            }
          }
        }
      }
      else
      {
        objc_msgSend(v24, "subviews");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          objc_msgSend(v18, "addObjectsFromArray:", v38);
          v20 = objc_msgSend(v18, "count");
        }

      }
      ++v22;
    }
    while (v22 < v20);
    if (v21)
      objc_msgSend(v21, "becomeFirstResponder");
  }

  return 1;
}

- (void)_amountControlAction:(id)a3
{
  void *v4;
  id v5;

  -[SKUIGiftStepViewController gift](self, "gift", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGiftAmount:", -[SKUIGiftAmountSection selectedAmount](self->_amountSection, "selectedAmount"));
  -[SKUIGiftAmountSection selectedAmountString](self->_amountSection, "selectedAmountString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGiftAmountString:", v4);

  -[SKUIGiftComposeViewController _validateGiftThrottled:](self, "_validateGiftThrottled:", 0);
}

- (void)_cancelAction:(id)a3
{
  -[SKUIGiftStepViewController finishGiftingWithResult:](self, "finishGiftingWithResult:", 0);
}

- (void)_nextAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SKUIGiftComposeViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

  UIKeyboardOrderOutAutomatic();
  if (self->_validationTimer || -[SKUIGiftValidator isValidating](self->_validator, "isValidating"))
  {
    self->_tappedNextWhileValidating = 1;
    objc_msgSend(v6, "setEnabled:", 0);
    -[UITableView setEnabled:](self->_tableView, "setEnabled:", 0);
    if (self->_validationTimer)
      -[SKUIGiftComposeViewController _validateGift](self, "_validateGift");
  }
  else
  {
    -[SKUIGiftComposeViewController _pushThemePickerOrShowInvalidAlert](self, "_pushThemePickerOrShowInvalidAlert");
  }

}

- (void)_keyboardChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UITableView *tableView;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v35 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v35;
  if (v35)
  {
    -[UITableView superview](self->_tableView, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "CGRectValue");
    objc_msgSend(v6, "convertRect:fromView:", 0);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[UITableView frame](self->_tableView, "frame");
    v38.origin.x = v8;
    v38.origin.y = v10;
    v38.size.width = v12;
    v38.size.height = v14;
    v37 = CGRectIntersection(v36, v38);
    -[UITableView contentInset](self->_tableView, "contentInset", v37.origin.x, v37.origin.y, v37.size.width);
    -[UITableView setContentInset:](self->_tableView, "setContentInset:");
    -[UITableView scrollIndicatorInsets](self->_tableView, "scrollIndicatorInsets");
    -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:");
    -[SKUIGiftComposeViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstResponder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "_SKUIView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18 && objc_msgSend(v18, "isDescendantOfView:", self->_tableView))
    {
      tableView = self->_tableView;
      objc_msgSend(v19, "frame");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      objc_msgSend(v19, "superview");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView convertRect:fromView:](tableView, "convertRect:fromView:", v29, v22, v24, v26, v28);
      v31 = v30;
      v33 = v32;

      -[UITableView indexPathForRowAtPoint:](self->_tableView, "indexPathForRowAtPoint:", v31, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
        -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](self->_tableView, "scrollToRowAtIndexPath:atScrollPosition:animated:", v34, 1, 1);

    }
    v5 = v35;
  }

}

- (void)_recipientsDidChangeNotification:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  UITableView *tableView;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  objc_msgSend(a3, "object");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftComposeViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v27, "isDescendantOfView:", v4);

  v6 = v27;
  if (v5)
  {
    tableView = self->_tableView;
    objc_msgSend(v27, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v27, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView convertRect:fromView:](tableView, "convertRect:fromView:", v16, v9, v11, v13, v15);
    v18 = v17;
    v20 = v19;

    -[UITableView indexPathForRowAtPoint:](self->_tableView, "indexPathForRowAtPoint:", v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = objc_msgSend(v21, "section");
      if (v23 == -[SKUITableViewSection sectionIndex](self->_addressingSection, "sectionIndex"))
      {
        -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIGiftStepViewController gift](self, "gift");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "recipientAddresses");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setRecipientAddresses:", v26);

        -[SKUIGiftComposeViewController _validateGiftThrottled:](self, "_validateGiftThrottled:", 0);
      }
    }

    v6 = v27;
  }

}

- (void)_textFieldChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  UITableView *tableView;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  objc_msgSend(v27, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftComposeViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isDescendantOfView:", v5);

  if (v6)
  {
    tableView = self->_tableView;
    objc_msgSend(v4, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v4, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView convertRect:fromView:](tableView, "convertRect:fromView:", v16, v9, v11, v13, v15);
    v18 = v17;
    v20 = v19;

    -[UITableView indexPathForRowAtPoint:](self->_tableView, "indexPathForRowAtPoint:", v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = objc_msgSend(v21, "section");
      if (v23 == -[SKUITableViewSection sectionIndex](self->_addressingSection, "sectionIndex"))
      {
        objc_msgSend(v4, "text");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v24, "length"))
        {

          v24 = 0;
        }
        if (objc_msgSend(v22, "row") == 1)
        {
          -[SKUIGiftStepViewController gift](self, "gift");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setSenderName:", v24);

        }
        objc_msgSend(v27, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIGiftComposeViewController _validateGiftThrottled:](self, "_validateGiftThrottled:", objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0DC54D0]));

      }
    }

  }
}

- (void)_textViewChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftAddressingSection messagingTextView](self->_addressingSection, "messagingTextView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v9;
  if (v9 == v4)
  {
    objc_msgSend(v9, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftStepViewController gift](self, "gift");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
      v8 = v6;
    else
      v8 = 0;
    objc_msgSend(v7, "setMessage:", v8);

    v5 = v9;
  }

}

- (void)_textViewDidEndEditingNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UITableView *tableView;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  objc_msgSend(a3, "object");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftAddressingSection messagingTextView](self->_addressingSection, "messagingTextView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v20;
  if (v20 == v4)
  {
    objc_msgSend(v20, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftStepViewController gift](self, "gift");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
      v8 = v6;
    else
      v8 = 0;
    objc_msgSend(v7, "setMessage:", v8);

    tableView = self->_tableView;
    objc_msgSend(v20, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v20, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView convertRect:fromView:](tableView, "convertRect:fromView:", v18, v11, v13, v15, v17);
    -[UITableView indexPathForRowAtPoint:](tableView, "indexPathForRowAtPoint:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIGiftAddressingSection endEditingMessageForTableView:indexPath:](self->_addressingSection, "endEditingMessageForTableView:indexPath:", self->_tableView, v19);
    v5 = v20;
  }

}

- (void)_finishValidationWithResponse:(id)a3 error:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_lastValidationResponse, a3);
  -[SKUIGiftStepViewController gift](self, "gift");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftValidationResponse totalGiftAmountString](self->_lastValidationResponse, "totalGiftAmountString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTotalGiftAmountString:", v7);

  if (self->_tappedNextWhileValidating)
  {
    self->_tappedNextWhileValidating = 0;
    -[SKUIGiftComposeViewController _pushThemePickerOrShowInvalidAlert](self, "_pushThemePickerOrShowInvalidAlert");
  }
  -[UITableView setEnabled:](self->_tableView, "setEnabled:", 1);

}

- (id)_headerView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[SKUIGiftStepViewController gift](self, "gift");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SKUIGiftComposeViewController _itemView](self, "_itemView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("GiftCardGraphic"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v7, "initWithImage:", v8);

    objc_msgSend(v5, "setContentMode:", 4);
  }

  return v5;
}

- (id)_itemImage
{
  UIImage *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = self->_itemImage;
  if (!v3)
  {
    -[SKUIGiftItemView artworkContext](self->_itemView, "artworkContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftStepViewController gift](self, "gift");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "placeholderImageForItem:", v6);
    v3 = (UIImage *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_itemView
{
  void *v3;
  void *v4;
  SKUIGiftItemView *itemView;
  BOOL v6;
  SKUIGiftItemView *v7;
  void *v8;
  void *v9;
  SKUIGiftItemView *v10;
  SKUIGiftItemView *v11;
  SKUIGiftItemView *v12;
  void *v13;
  SKUIGiftItemView *v14;
  void *v15;
  SKUIGiftItemView *v16;
  void *v17;
  SKUIGiftItemView *v18;
  void *v19;
  void *v20;
  SKUIGiftItemView *v21;
  void *v22;
  SKUIGiftItemView *v23;
  float v24;
  double v25;
  SKUIGiftItemView *v26;

  -[SKUIGiftStepViewController gift](self, "gift");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  itemView = self->_itemView;
  if (itemView)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (!v6)
  {
    v7 = [SKUIGiftItemView alloc];
    -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SKUIGiftItemView initWithStyle:item:clientContext:](v7, "initWithStyle:item:clientContext:", 0, v4, v9);
    v11 = self->_itemView;
    self->_itemView = v10;

    -[SKUIGiftItemView setAutoresizingMask:](self->_itemView, "setAutoresizingMask:", 2);
    v12 = self->_itemView;
    objc_msgSend(v4, "artistName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftItemView setArtistName:](v12, "setArtistName:", v13);

    v14 = self->_itemView;
    objc_msgSend(v4, "categoryName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftItemView setCategoryName:](v14, "setCategoryName:", v15);

    v16 = self->_itemView;
    -[SKUIGiftComposeViewController _itemImage](self, "_itemImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftItemView setItemImage:](v16, "setItemImage:", v17);

    -[SKUIGiftItemView setNumberOfUserRatings:](self->_itemView, "setNumberOfUserRatings:", objc_msgSend(v4, "numberOfUserRatings"));
    v18 = self->_itemView;
    objc_msgSend(v4, "primaryItemOffer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "buttonText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftItemView setPrice:](v18, "setPrice:", v20);

    v21 = self->_itemView;
    objc_msgSend(v4, "title");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftItemView setTitle:](v21, "setTitle:", v22);

    v23 = self->_itemView;
    objc_msgSend(v4, "userRating");
    *(float *)&v25 = v24 / 5.0;
    -[SKUIGiftItemView setUserRating:](v23, "setUserRating:", v25);
    -[SKUIGiftItemView sizeToFit](self->_itemView, "sizeToFit");
    itemView = self->_itemView;
  }
  v26 = itemView;

  return v26;
}

- (void)_pushThemePickerOrShowInvalidAlert
{
  SKUIGiftThemePickerViewController *v3;
  void *v4;
  SKUIGiftThemePickerViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (-[SKUIGiftValidationResponse isValid](self->_lastValidationResponse, "isValid"))
  {
    -[SKUIGiftStepViewController gift](self, "gift");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v3 = [SKUIGiftThemePickerViewController alloc];
    -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SKUIGiftThemePickerViewController initWithGift:configuration:](v3, "initWithGift:configuration:", v15, v4);

    -[SKUIGiftStepViewController operationQueue](self, "operationQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftStepViewController setOperationQueue:](v5, "setOperationQueue:", v6);

    -[SKUIGiftComposeViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v5, 1);

  }
  else
  {
    -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientContext");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC3450];
    if (v15)
      objc_msgSend(v15, "localizedStringForKey:inTable:", CFSTR("GIFTING_INVALID_GIFT"), CFSTR("Gifting"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_INVALID_GIFT"), 0, CFSTR("Gifting"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftValidationResponse errorString](self->_lastValidationResponse, "errorString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, v11, 1);
    v5 = (SKUIGiftThemePickerViewController *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0DC3448];
    if (v15)
      objc_msgSend(v15, "localizedStringForKey:inTable:", CFSTR("GIFTING_OK_BUTTON"), CFSTR("Gifting"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_OK_BUTTON"), 0, CFSTR("Gifting"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftThemePickerViewController addAction:](v5, "addAction:", v14);

    -[SKUIGiftComposeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  }

}

- (void)_reloadSections
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *sections;
  SKUIGiftAddressingSection *addressingSection;
  SKUIGiftAddressingSection *v7;
  SKUIGiftAddressingSection *v8;
  void *v9;
  SKUIGiftAmountSection *amountSection;
  SKUIGiftAmountSection *v11;
  SKUIGiftAmountSection *v12;
  void *v13;
  SKUIGiftSendDateSection *sendDateSection;
  SKUIGiftSendDateSection *v15;
  SKUIGiftSendDateSection *v16;
  SKUIGiftSendDateSection *v17;
  void *v18;
  SKUIGiftSendDateSection *v19;
  void *v20;
  SKUIGiftTermsAndConditionsSection *termsSection;
  SKUIGiftTermsAndConditionsSection *v22;
  SKUIGiftTermsAndConditionsSection *v23;
  id v24;

  -[SKUIGiftStepViewController gift](self, "gift");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  sections = self->_sections;
  self->_sections = v4;

  addressingSection = self->_addressingSection;
  if (!addressingSection)
  {
    v7 = -[SKUIGiftAddressingSection initWithGiftConfiguration:]([SKUIGiftAddressingSection alloc], "initWithGiftConfiguration:", v3);
    v8 = self->_addressingSection;
    self->_addressingSection = v7;

    -[SKUIGiftAddressingSection setGift:](self->_addressingSection, "setGift:", v24);
    -[SKUIGiftAddressingSection setTextFieldDelegate:](self->_addressingSection, "setTextFieldDelegate:", self);
    addressingSection = self->_addressingSection;
  }
  -[SKUITableViewSection setSectionIndex:](addressingSection, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
  -[NSMutableArray addObject:](self->_sections, "addObject:", self->_addressingSection);
  objc_msgSend(v24, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    amountSection = self->_amountSection;
    if (!amountSection)
    {
      v11 = -[SKUIGiftTableViewSection initWithGiftConfiguration:]([SKUIGiftAmountSection alloc], "initWithGiftConfiguration:", v3);
      v12 = self->_amountSection;
      self->_amountSection = v11;

      -[SKUIGiftAmountSection amountControl](self->_amountSection, "amountControl");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__amountControlAction_, 4096);

      amountSection = self->_amountSection;
    }
    -[SKUITableViewSection setSectionIndex:](amountSection, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
    -[NSMutableArray addObject:](self->_sections, "addObject:", self->_amountSection);
  }
  sendDateSection = self->_sendDateSection;
  if (!sendDateSection)
  {
    v15 = -[SKUIGiftTableViewSection initWithGiftConfiguration:]([SKUIGiftSendDateSection alloc], "initWithGiftConfiguration:", v3);
    v16 = self->_sendDateSection;
    self->_sendDateSection = v15;

    v17 = self->_sendDateSection;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftSendDateSection setSendDate:](v17, "setSendDate:", v18);

    v19 = self->_sendDateSection;
    objc_msgSend(v24, "item");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftSendDateSection setGiftItem:](v19, "setGiftItem:", v20);

    -[SKUIGiftSendDateSection setDelegate:](self->_sendDateSection, "setDelegate:", self);
    sendDateSection = self->_sendDateSection;
  }
  -[SKUITableViewSection setSectionIndex:](sendDateSection, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
  -[NSMutableArray addObject:](self->_sections, "addObject:", self->_sendDateSection);
  termsSection = self->_termsSection;
  if (!termsSection)
  {
    v22 = -[SKUIGiftTableViewSection initWithGiftConfiguration:]([SKUIGiftTermsAndConditionsSection alloc], "initWithGiftConfiguration:", v3);
    v23 = self->_termsSection;
    self->_termsSection = v22;

    termsSection = self->_termsSection;
  }
  -[NSMutableArray addObject:](self->_sections, "addObject:", termsSection);

}

- (void)_setItemImage:(id)a3 error:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)&self->_itemImage, a3);
    -[SKUIGiftItemView setItemImage:](self->_itemView, "setItemImage:", self->_itemImage);
    v6 = v7;
  }

}

- (void)_validateGift
{
  NSObject *validationTimer;
  OS_dispatch_source *v4;
  void *v5;
  SKUIGiftValidator *v6;
  void *v7;
  void *v8;
  SKUIGiftValidator *v9;
  SKUIGiftValidator *validator;
  SKUIGiftValidator *v11;
  void *v12;
  SKUIGiftValidator *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;

  validationTimer = self->_validationTimer;
  if (validationTimer)
  {
    dispatch_source_cancel(validationTimer);
    v4 = self->_validationTimer;
    self->_validationTimer = 0;

  }
  if (!self->_validator)
  {
    -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [SKUIGiftValidator alloc];
    objc_msgSend(v5, "giftValidationURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SKUIGiftValidator initWithValidationURL:clientContext:](v6, "initWithValidationURL:clientContext:", v7, v8);
    validator = self->_validator;
    self->_validator = v9;

    v11 = self->_validator;
    -[SKUIGiftStepViewController operationQueue](self, "operationQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftValidator setOperationQueue:](v11, "setOperationQueue:", v12);

  }
  objc_initWeak(&location, self);
  v13 = self->_validator;
  -[SKUIGiftStepViewController gift](self, "gift");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __46__SKUIGiftComposeViewController__validateGift__block_invoke;
  v15[3] = &unk_1E73A20A0;
  objc_copyWeak(&v16, &location);
  -[SKUIGiftValidator validateGift:withCompletionBlock:](v13, "validateGift:withCompletionBlock:", v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __46__SKUIGiftComposeViewController__validateGift__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SKUIGiftComposeViewController__validateGift__block_invoke_2;
  block[3] = &unk_1E73A1D50;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __46__SKUIGiftComposeViewController__validateGift__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishValidationWithResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_validateGiftThrottled:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  NSObject *validationTimer;
  OS_dispatch_source *v13;
  NSObject *v14;
  dispatch_time_t v15;
  OS_dispatch_source *v16;
  OS_dispatch_source *v17;
  NSObject *v18;
  dispatch_time_t v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id location;

  -[SKUIGiftStepViewController gift](self, "gift");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((!self->_amountSection || objc_msgSend(v5, "giftAmount"))
    && (objc_msgSend(v6, "recipientAddresses"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8))
  {
    objc_msgSend(v6, "senderName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length") != 0;

  }
  else
  {
    v10 = 0;
  }
  -[SKUIGiftComposeViewController nextButton](self, "nextButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v10);

  -[SKUIGiftValidator cancelValidation](self->_validator, "cancelValidation");
  if (!v10 || !a3)
  {
    validationTimer = self->_validationTimer;
    if (validationTimer)
    {
      dispatch_source_cancel(validationTimer);
      v13 = self->_validationTimer;
      self->_validationTimer = 0;

    }
  }
  if (v10)
  {
    if (a3)
    {
      v14 = self->_validationTimer;
      if (v14)
      {
        v15 = dispatch_time(0, 1000000000);
        dispatch_source_set_timer(v14, v15, 0, 0);
      }
      else
      {
        v16 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
        v17 = self->_validationTimer;
        self->_validationTimer = v16;

        v18 = self->_validationTimer;
        v19 = dispatch_time(0, 1000000000);
        dispatch_source_set_timer(v18, v19, 0, 0);
        objc_initWeak(&location, self);
        v20 = self->_validationTimer;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __56__SKUIGiftComposeViewController__validateGiftThrottled___block_invoke;
        v21[3] = &unk_1E739FF68;
        objc_copyWeak(&v22, &location);
        dispatch_source_set_event_handler(v20, v21);
        dispatch_resume((dispatch_object_t)self->_validationTimer);
        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      -[SKUIGiftComposeViewController _validateGift](self, "_validateGift");
    }
  }

}

void __56__SKUIGiftComposeViewController__validateGiftThrottled___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_validateGift");

}

- (UIBarButtonItem)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
  objc_storeStrong((id *)&self->_nextButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_searchResultsPopover, 0);
  objc_storeStrong((id *)&self->_peoplePickerPopover, 0);
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_validationTimer, 0);
  objc_storeStrong((id *)&self->_termsSection, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_showDatePickerIndexPathAfterKeyboardDismiss, 0);
  objc_storeStrong((id *)&self->_sendDateSection, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_searchResultsView, 0);
  objc_storeStrong((id *)&self->_lastValidationResponse, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_itemImage, 0);
  objc_storeStrong((id *)&self->_amountSection, 0);
  objc_storeStrong((id *)&self->_addressingSection, 0);
}

- (void)initWithGift:configuration:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftComposeViewController initWithGift:configuration:]";
}

@end
