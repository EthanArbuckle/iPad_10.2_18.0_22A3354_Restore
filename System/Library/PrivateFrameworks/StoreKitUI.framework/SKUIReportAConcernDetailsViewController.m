@implementation SKUIReportAConcernDetailsViewController

- (SKUIReportAConcernDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIReportAConcernConfiguration *v13;
  SKUIReportAConcernDetailsViewController *v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIReportAConcernDetailsViewController initWithNibName:bundle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_alloc_init(SKUIReportAConcernConfiguration);
  v14 = -[SKUIReportAConcernDetailsViewController initWithConfiguration:](self, "initWithConfiguration:", v13);

  return v14;
}

- (SKUIReportAConcernDetailsViewController)initWithCoder:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SKUIReportAConcernConfiguration *v12;
  SKUIReportAConcernDetailsViewController *v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIReportAConcernDetailsViewController initWithCoder:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = objc_alloc_init(SKUIReportAConcernConfiguration);
  v13 = -[SKUIReportAConcernDetailsViewController initWithConfiguration:](self, "initWithConfiguration:", v12);

  return v13;
}

- (SKUIReportAConcernDetailsViewController)initWithConfiguration:(id)a3
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUIReportAConcernDetailsViewController *v14;
  SKUIReportAConcernDetailsViewController *v15;
  void *v16;
  objc_super v18;

  v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIReportAConcernDetailsViewController initWithConfiguration:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIReportAConcernDetailsViewController;
  v14 = -[SKUIReportAConcernDetailsViewController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, 0, 0);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_configuration, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v15, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
    objc_msgSend(v16, "addObserver:selector:name:object:", v15, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

  }
  return v15;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE0], 0);

  v4.receiver = self;
  v4.super_class = (Class)SKUIReportAConcernDetailsViewController;
  -[SKUIReportAConcernDetailsViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  SKUIReportAConcernDetailsDataSource *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SKUIReportAConcernDetailsViewController;
  -[SKUIReportAConcernDetailsViewController viewDidLoad](&v21, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("REPORT_A_CONCERN"), &stru_1E73A9FB0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReportAConcernDetailsViewController setTitle:](self, "setTitle:", v4);

  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SUBMIT"), &stru_1E73A9FB0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 2, self, sel_submitPressed_);
  -[SKUIReportAConcernDetailsViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

  v10 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v11 = (void *)objc_msgSend(v10, "initWithFrame:style:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v11, "setAllowsSelection:", 0);
  objc_msgSend(v11, "setDelegate:", self);
  v12 = -[SKUIReportAConcernDetailsDataSource initWithTableView:]([SKUIReportAConcernDetailsDataSource alloc], "initWithTableView:", v11);
  -[SKUIReportAConcernDetailsViewController configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reportConcernExplanation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReportAConcernDetailsDataSource setPlaceholder:](v12, "setPlaceholder:", v14);

  -[SKUIReportAConcernDetailsViewController metadata](self, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "selectedReason");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uppercaseName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReportAConcernDetailsDataSource setSelectedReason:](v12, "setSelectedReason:", v17);

  -[SKUIReportAConcernDetailsViewController configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "privacyNote");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReportAConcernDetailsDataSource setPrivacyNote:](v12, "setPrivacyNote:", v19);

  objc_msgSend(v11, "setDataSource:", v12);
  -[SKUIReportAConcernDetailsViewController setDataSource:](self, "setDataSource:", v12);
  -[SKUIReportAConcernDetailsViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v11);

  -[SKUIReportAConcernDetailsViewController setTableView:](self, "setTableView:", v11);
}

- (void)viewWillLayoutSubviews
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

  v13.receiver = self;
  v13.super_class = (Class)SKUIReportAConcernDetailsViewController;
  -[SKUIReportAConcernDetailsViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[SKUIReportAConcernDetailsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SKUIReportAConcernDetailsViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)submitPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  SKUIReportAConcernOperation *v16;
  void *v17;
  SKUIReportAConcernOperation *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29[2];
  id from;
  id location;
  _QWORD v32[5];

  v4 = a3;
  objc_msgSend(v4, "setEnabled:", 0);
  -[SKUIReportAConcernDetailsViewController _detailsText](self, "_detailsText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReportAConcernDetailsViewController metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDetails:", v5);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendAction:to:from:forEvent:", sel_resignFirstResponder, 0, 0, 0);

  v8 = *MEMORY[0x1E0DC4878];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __57__SKUIReportAConcernDetailsViewController_submitPressed___block_invoke;
  v32[3] = &__block_descriptor_40_e5_v8__0l;
  v32[4] = v8;
  v13 = (void *)objc_msgSend(v9, "beginBackgroundTaskWithName:expirationHandler:", v11, v32);

  -[SKUIReportAConcernDetailsViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [SKUIReportAConcernOperation alloc];
  -[SKUIReportAConcernDetailsViewController metadata](self, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SKUIReportAConcernOperation initWithMetadata:](v16, "initWithMetadata:", v17);

  objc_initWeak(&location, v18);
  objc_initWeak(&from, self);
  v22 = v12;
  v23 = 3221225472;
  v24 = __57__SKUIReportAConcernDetailsViewController_submitPressed___block_invoke_2;
  v25 = &unk_1E73A8DA8;
  objc_copyWeak(&v28, &location);
  v19 = v15;
  v26 = v19;
  objc_copyWeak(v29, &from);
  v20 = v4;
  v27 = v20;
  v29[1] = v13;
  -[SKUIReportAConcernOperation setCompletionBlock:](v18, "setCompletionBlock:", &v22);
  objc_msgSend(MEMORY[0x1E0DDC190], "mainQueue", v22, v23, v24, v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addOperation:", v18);

  objc_destroyWeak(v29);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __57__SKUIReportAConcernDetailsViewController_submitPressed___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endBackgroundTask:", *(_QWORD *)(a1 + 32));

}

void __57__SKUIReportAConcernDetailsViewController_submitPressed___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  void *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SKUIReportAConcernDetailsViewController_submitPressed___block_invoke_3;
  block[3] = &unk_1E73A8D80;
  v7 = WeakRetained;
  v8 = *(id *)(a1 + 32);
  v3 = WeakRetained;
  objc_copyWeak(v10, (id *)(a1 + 56));
  v4 = *(id *)(a1 + 40);
  v5 = *(void **)(a1 + 64);
  v9 = v4;
  v10[1] = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v10);
}

void __57__SKUIReportAConcernDetailsViewController_submitPressed___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "success") & 1) == 0 && v2)
  {
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF4A8]), "initWithResponseDictionary:", v2);
    objc_msgSend(v28, "actions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v34;
      v7 = *MEMORY[0x1E0DAFCC0];
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v34 != v6)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v9, "actionType");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v7);

          if (v11)
          {
            objc_msgSend(v9, "dialog");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC3458], "_alertViewForWindow:", *(_QWORD *)(a1 + 40));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "message");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setMessage:", v18);

            objc_msgSend(v16, "title");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setTitle:", v19);

            WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
            objc_msgSend(v17, "setDelegate:", WeakRetained);

            objc_msgSend(v16, "buttons");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 0u;
            v30 = 0u;
            v31 = 0u;
            v32 = 0u;
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v30;
              do
              {
                for (j = 0; j != v23; ++j)
                {
                  if (*(_QWORD *)v30 != v24)
                    objc_enumerationMutation(v21);
                  objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "buttonTitle");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "addButtonWithTitle:", v26);

                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              }
              while (v23);
            }
            objc_msgSend(v17, "show");

            goto LABEL_22;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v5)
          continue;
        break;
      }
    }

  }
  v12 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v12, "completion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v14, "completion");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v15[2](v15, 1);

  }
  else
  {
LABEL_22:
    objc_msgSend(*(id *)(a1 + 48), "setEnabled:", 1);
  }
  if (*(_QWORD *)(a1 + 64) != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "endBackgroundTask:", *(_QWORD *)(a1 + 64));

  }
}

- (id)_detailsText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SKUIReportAConcernDetailsViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellForRowAtIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)_detailsCellHeight
{
  void *v3;
  double Height;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect v11;

  -[SKUIReportAConcernDetailsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v11);
  -[SKUIReportAConcernDetailsViewController topLayoutGuide](self, "topLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "length");
  v7 = Height - v6;
  -[SKUIReportAConcernDetailsViewController keyboardHeight](self, "keyboardHeight");
  v9 = v7 - v8;

  return fmin(v9, 250.0);
}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[9];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  -[SKUIReportAConcernDetailsViewController setKeyboardHeight:](self, "setKeyboardHeight:", v6);
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E48]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E40]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  -[SKUIReportAConcernDetailsViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentInset");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__SKUIReportAConcernDetailsViewController__keyboardWillShow___block_invoke;
  v21[3] = &unk_1E73A2F30;
  v21[4] = self;
  v21[5] = v14;
  v21[6] = v16;
  v21[7] = v18;
  v21[8] = v20;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", v11, v21, &__block_literal_global_58, v9, 0.0);

}

void __61__SKUIReportAConcernDetailsViewController__keyboardWillShow___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double MinY;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  CGRect v18;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginUpdates");

  v3 = *(double *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "keyboardHeight");
  v6 = v5;
  v7 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentInset:", v3, v4, v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForRowAtIndexPath:", v10);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  MinY = CGRectGetMinY(v18);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentInset");
  objc_msgSend(v11, "setContentOffset:", 0.0, MinY - v14);

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endUpdates");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutIfNeeded");

}

- (void)_keyboardWillHide:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[9];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E48]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E40]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  -[SKUIReportAConcernDetailsViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentInset");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[SKUIReportAConcernDetailsViewController setKeyboardHeight:](self, "setKeyboardHeight:", 0.0);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__SKUIReportAConcernDetailsViewController__keyboardWillHide___block_invoke;
  v19[3] = &unk_1E73A2F30;
  v19[4] = self;
  v19[5] = v12;
  v19[6] = v14;
  v19[7] = v16;
  v19[8] = v18;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", v9, v19, 0, v7, 0.0);

}

void __61__SKUIReportAConcernDetailsViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "keyboardHeight");
  v5 = v4;
  v6 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentInset:", v2, v3, v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginUpdates");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endUpdates");

}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (SKUIReportAConcernMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (SKUIReportAConcernConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (SKUIReportAConcernDetailsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong(&self->_completion, 0);
}

- (void)initWithNibName:(uint64_t)a3 bundle:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithConfiguration:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
