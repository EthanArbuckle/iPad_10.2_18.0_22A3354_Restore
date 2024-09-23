@implementation SKUIRedeemIdViewController

- (SKUIRedeemIdViewController)initWithClientContext:(id)a3
{
  id v4;
  SKUIRedeemIdViewController *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemIdViewController initWithClientContext:].cold.1();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIRedeemIdViewController;
  v5 = -[SKUIRedeemIdViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    -[SKUIRedeemIdViewController setFields:](v5, "setFields:", v6);

    -[SKUIRedeemIdViewController setClientContext:](v5, "setClientContext:", v4);
    -[SKUIRedeemIdViewController _initializeManager](v5, "_initializeManager");
    -[SKUIRedeemIdViewController _initializeTableView](v5, "_initializeTableView");
    -[SKUIRedeemIdViewController _initializeNavigationItem](v5, "_initializeNavigationItem");
    -[SKUIRedeemIdViewController _subscribeToKeyboardEvents](v5, "_subscribeToKeyboardEvents");
  }

  return v5;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  -[SKUIRedeemIdViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SKUIRedeemIdViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13.receiver = self;
  v13.super_class = (Class)SKUIRedeemIdViewController;
  -[SKUIRedeemIdViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)SKUIRedeemIdViewController;
  v7 = a4;
  -[SKUIRedeemIdViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SKUIRedeemIdViewController manager](self, "manager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFooterHidden:", 1);

  -[SKUIRedeemIdViewController _reloadFooter](self, "_reloadFooter");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__SKUIRedeemIdViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E739FF90;
  v9[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v9);

}

void __81__SKUIRedeemIdViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFooterHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "_reloadFooter");
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissActiveCell");

}

- (void)redeemIdManager:(id)a3 didReturnText:(id)a4 forCellAtIndexPath:(id)a5
{
  -[SKUIRedeemIdViewController _updateFieldAtIndexPath:withText:](self, "_updateFieldAtIndexPath:withText:", a5, a4);
}

- (void)redeemIdManager:(id)a3 didChangeToText:(id)a4 forCellAtIndexPath:(id)a5
{
  -[SKUIRedeemIdViewController _updateFieldAtIndexPath:withText:](self, "_updateFieldAtIndexPath:withText:", a5, a4);
}

- (void)_updateFieldAtIndexPath:(id)a3 withText:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[SKUIRedeemIdViewController _fieldForIndexPath:](self, "_fieldForIndexPath:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemIdViewController fields](self, "fields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v8);

  -[SKUIRedeemIdViewController _refreshNavigationItem](self, "_refreshNavigationItem");
}

- (id)_fieldForIndexPath:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "section");
  if (v4 == 2)
  {
    v7 = CFSTR("national_redeem_national_id");
  }
  else if (v4 == 1)
  {
    v7 = CFSTR("national_redeem_phone");
  }
  else if (v4)
  {
    v7 = 0;
  }
  else
  {
    v5 = objc_msgSend(v3, "row");
    v6 = CFSTR("national_redeem_last_name");
    if (v5 == 1)
      v6 = CFSTR("national_redeem_first_name");
    v7 = v6;
  }

  return v7;
}

- (void)_refreshNavigationItem
{
  _BOOL8 v3;
  id v4;

  v3 = -[SKUIRedeemIdViewController _validateForm](self, "_validateForm");
  -[SKUIRedeemIdViewController nextButton](self, "nextButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (BOOL)_validateForm
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL result;
  BOOL v16;

  -[SKUIRedeemIdViewController fields](self, "fields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("national_redeem_first_name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  -[SKUIRedeemIdViewController fields](self, "fields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("national_redeem_last_name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  -[SKUIRedeemIdViewController fields](self, "fields");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("national_redeem_phone"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  -[SKUIRedeemIdViewController fields](self, "fields");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("national_redeem_national_id"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  result = 0;
  if (v5 && v8)
  {
    if (v11)
      v16 = v14 == 0;
    else
      v16 = 1;
    return !v16;
  }
  return result;
}

- (void)_reloadFooter
{
  void *v2;
  id v3;

  -[SKUIRedeemIdViewController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSections:withRowAnimation:", v2, 5);

}

- (UIEdgeInsets)_edgeInsetsFromInsets:(UIEdgeInsets)result usingNewTopInset:(double)a4
{
  result.top = a4;
  return result;
}

- (id)_finalOutputFields
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SKUIRedeemIdViewController fields](self, "fields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("national_redeem_last_name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemIdViewController fields](self, "fields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("national_redeem_first_name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v8;
  v15[0] = CFSTR("name");
  v15[1] = CFSTR("phone");
  -[SKUIRedeemIdViewController fields](self, "fields");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("national_redeem_phone"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  v15[2] = CFSTR("nationalId");
  -[SKUIRedeemIdViewController fields](self, "fields");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("national_redeem_national_id"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_initializeManager
{
  SKUIRedeemIdManager *v3;
  void *v4;
  SKUIRedeemIdManager *v5;
  id v6;

  v3 = [SKUIRedeemIdManager alloc];
  -[SKUIRedeemIdViewController clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SKUIRedeemIdManager initWithClientContext:](v3, "initWithClientContext:", v4);
  -[SKUIRedeemIdViewController setManager:](self, "setManager:", v5);

  -[SKUIRedeemIdViewController manager](self, "manager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

}

- (void)_initializeTableView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SKUIRedeemIdViewController setTableView:](self, "setTableView:", v4);

  -[SKUIRedeemIdViewController manager](self, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemIdViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDataSource:", v5);

  -[SKUIRedeemIdViewController manager](self, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemIdViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", v7);

  -[SKUIRedeemIdViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemIdViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  -[SKUIRedeemIdViewController tableView](self, "tableView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemIdViewController manager](self, "manager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTableView:", v12);

}

- (void)_initializeNavigationItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelPressed);
  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  -[SKUIRedeemIdViewController clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("REDEEM_NATIONAL_ID_NEXT_BUTTON"), CFSTR("Redeem"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_NATIONAL_ID_NEXT_BUTTON"), 0, CFSTR("Redeem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v6, 2, self, sel__nextPressed);
  -[SKUIRedeemIdViewController setNextButton:](self, "setNextButton:", v7);

  -[SKUIRedeemIdViewController nextButton](self, "nextButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 0);

  -[SKUIRedeemIdViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemIdViewController clientContext](self, "clientContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "localizedStringForKey:inTable:", CFSTR("REDEEM_NATIONAL_ID_VIEW_TITLE"), CFSTR("Redeem"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_NATIONAL_ID_VIEW_TITLE"), 0, CFSTR("Redeem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v12);

  -[SKUIRedeemIdViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLeftBarButtonItem:", v16);

  -[SKUIRedeemIdViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemIdViewController nextButton](self, "nextButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRightBarButtonItem:", v15);

}

- (void)_cancelPressed
{
  id v3;

  -[SKUIRedeemIdViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "redeemIdViewControllerDidCancel:", self);

}

- (void)_nextPressed
{
  void *v3;
  void *v4;
  id v5;

  -[SKUIRedeemIdViewController manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleNextPressed");

  -[SKUIRedeemIdViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemIdViewController _finalOutputFields](self, "_finalOutputFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "redeemIdViewController:submittedWithFields:", self, v4);

}

- (void)_subscribeToKeyboardEvents
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__keyboardDidHide_, *MEMORY[0x1E0DC4E68], 0);

}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", *MEMORY[0x1E0DC4E90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemIdViewController _adjustInsetsForKeyboardFrameValue:](self, "_adjustInsetsForKeyboardFrameValue:", v4);

}

- (void)_keyboardDidHide:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  -[SKUIRedeemIdViewController manager](self, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissActiveCell");

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", *MEMORY[0x1E0DC4E90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E48]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3F10];
  objc_msgSend(v9, "floatValue");
  v12 = v11;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__SKUIRedeemIdViewController__keyboardDidHide___block_invoke;
  v14[3] = &unk_1E739FD10;
  v14[4] = self;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v10, "animateWithDuration:animations:", v14, v12);

}

uint64_t __47__SKUIRedeemIdViewController__keyboardDidHide___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustInsetsForKeyboardFrameValue:", *(_QWORD *)(a1 + 40));
}

- (void)_adjustInsetsForKeyboardFrameValue:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  double height;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  objc_msgSend(a3, "CGRectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SKUIRedeemIdViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:fromView:", 0, v5, v7, v9, v11);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[SKUIRedeemIdViewController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  v42.origin.x = v15;
  v42.origin.y = v17;
  v42.size.width = v19;
  v42.size.height = v21;
  v41 = CGRectIntersection(v40, v42);
  height = v41.size.height;

  -[SKUIRedeemIdViewController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "contentInset");
  v26 = v25;
  v28 = v27;
  v30 = v29;

  -[SKUIRedeemIdViewController tableView](self, "tableView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setContentInset:", v26, v28, height, v30);

  -[SKUIRedeemIdViewController tableView](self, "tableView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "scrollIndicatorInsets");
  v34 = v33;
  v36 = v35;
  v38 = v37;

  -[SKUIRedeemIdViewController tableView](self, "tableView");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setScrollIndicatorInsets:", v34, v36, height, v38);

}

- (SKUIRedeemIdDelegate)delegate
{
  return (SKUIRedeemIdDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKUIRedeemIdManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UIBarButtonItem)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
  objc_storeStrong((id *)&self->_nextButton, a3);
}

- (NSMutableDictionary)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
  objc_storeStrong((id *)&self->_fields, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithClientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRedeemIdViewController initWithClientContext:]";
}

@end
