@implementation PKPassPersonalizationViewController

- (PKPassPersonalizationViewController)initWithPass:(id)a3 personalizationToken:(id)a4 personalizationSource:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  PKPassPersonalizationViewController *v12;
  PKPassPersonalizationViewController *v13;
  uint64_t v14;
  NSString *personalizationToken;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  PKContact *v21;
  PKContact *v22;
  PKContact *contact;
  char v24;
  id v25;
  double v26;
  PKPassPersonalizationCellContext *v27;
  void *v28;
  double v29;
  double v30;
  PKPassPersonalizationCellContext *v31;
  void *v32;
  double v33;
  double v34;
  PKPassPersonalizationCellContext *v35;
  void *v36;
  double v37;
  double v38;
  PKPassPersonalizationCellContext *v39;
  void *v40;
  double v41;
  double v42;
  NSArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  NSArray *cellContexts;
  void *v49;
  uint64_t v50;
  OBPrivacyLinkController *privacyController;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  objc_super v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[18];

  v62[16] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "personalization");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {

    v13 = 0;
    goto LABEL_32;
  }
  v57.receiver = self;
  v57.super_class = (Class)PKPassPersonalizationViewController;
  v12 = -[PKPassPersonalizationViewController initWithStyle:](&v57, sel_initWithStyle_, 1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pass, a3);
    v14 = objc_msgSend(v10, "copy");
    personalizationToken = v13->_personalizationToken;
    v13->_personalizationToken = (NSString *)v14;

    v13->_personalizationSource = a5;
    v16 = objc_alloc_init(MEMORY[0x1E0C97298]);
    v17 = *MEMORY[0x1E0C966A8];
    v62[0] = *MEMORY[0x1E0C967F0];
    v62[1] = v17;
    v18 = *MEMORY[0x1E0C966D0];
    v62[2] = *MEMORY[0x1E0C967C0];
    v62[3] = v18;
    v62[4] = *MEMORY[0x1E0C966C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_ios_meContactWithKeysToFetch:error:", v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      v21 = (PKContact *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C48]), "initWithCNContact:", v20);
    else
      v21 = (PKContact *)objc_alloc_init(MEMORY[0x1E0D66C48]);
    v22 = v21;

    contact = v13->_contact;
    v13->_contact = v22;

    v24 = objc_msgSend(v11, "requiredPersonalizationFields");
    v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26 = 0.0;
    if ((v24 & 1) != 0)
    {
      v27 = objc_alloc_init(PKPassPersonalizationCellContext);
      PKLocalizedString(CFSTR("PERSONALIZATION_CELL_NAME_TITLE"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPassPersonalizationCell textLabelWidthForText:](PKPassPersonalizationCell, "textLabelWidthForText:", v28);
      if (v29 >= 0.0)
      {
        +[PKPassPersonalizationCell textLabelWidthForText:](PKPassPersonalizationCell, "textLabelWidthForText:", v28);
        v26 = v30;
      }
      -[PKPassPersonalizationCellContext setTitle:](v27, "setTitle:", v28);
      -[PKPassPersonalizationCellContext setKeyboardType:](v27, "setKeyboardType:", 0);
      -[PKPassPersonalizationCellContext setAutocapitalizationType:](v27, "setAutocapitalizationType:", 1);
      -[PKPassPersonalizationCellContext setStringRepresentationBlock:](v27, "setStringRepresentationBlock:", &__block_literal_global_178);
      -[PKPassPersonalizationCellContext setContactUpdateBlock:](v27, "setContactUpdateBlock:", &__block_literal_global_181);
      objc_msgSend(v25, "addObject:", v27);

      if ((v24 & 2) == 0)
      {
LABEL_9:
        if ((v24 & 4) == 0)
          goto LABEL_10;
        goto LABEL_18;
      }
    }
    else if ((v24 & 2) == 0)
    {
      goto LABEL_9;
    }
    v31 = objc_alloc_init(PKPassPersonalizationCellContext);
    PKLocalizedString(CFSTR("PERSONALIZATION_CELL_POSTAL_CODE_TITLE"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPassPersonalizationCell textLabelWidthForText:](PKPassPersonalizationCell, "textLabelWidthForText:", v32);
    if (v26 <= v33)
    {
      +[PKPassPersonalizationCell textLabelWidthForText:](PKPassPersonalizationCell, "textLabelWidthForText:", v32);
      v26 = v34;
    }
    -[PKPassPersonalizationCellContext setTitle:](v31, "setTitle:", v32);
    -[PKPassPersonalizationCellContext setKeyboardType:](v31, "setKeyboardType:", 0);
    -[PKPassPersonalizationCellContext setAutocapitalizationType:](v31, "setAutocapitalizationType:", 3);
    -[PKPassPersonalizationCellContext setStringRepresentationBlock:](v31, "setStringRepresentationBlock:", &__block_literal_global_188);
    -[PKPassPersonalizationCellContext setContactUpdateBlock:](v31, "setContactUpdateBlock:", &__block_literal_global_189);
    objc_msgSend(v25, "addObject:", v31);

    if ((v24 & 4) == 0)
    {
LABEL_10:
      if ((v24 & 8) == 0)
      {
LABEL_24:
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v43 = (NSArray *)v25;
        v44 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
        if (v44)
        {
          v45 = v44;
          v46 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v45; ++i)
            {
              if (*(_QWORD *)v59 != v46)
                objc_enumerationMutation(v43);
              objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "setMinimumTextLabelWidth:", v26);
            }
            v45 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
          }
          while (v45);
        }

        cellContexts = v13->_cellContexts;
        v13->_cellContexts = v43;

        -[PKPassPersonalizationViewController navigationItem](v13, "navigationItem");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "pkui_setupScrollEdgeChromelessAppearance");
        objc_msgSend(v49, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
        objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 1);
        v50 = objc_claimAutoreleasedReturnValue();
        privacyController = v13->_privacyController;
        v13->_privacyController = (OBPrivacyLinkController *)v50;

        -[PKPassPersonalizationViewController addChildViewController:](v13, "addChildViewController:", v13->_privacyController);
        v52 = objc_alloc(MEMORY[0x1E0DC3F10]);
        v53 = (void *)objc_msgSend(v52, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        -[OBPrivacyLinkController view](v13->_privacyController, "view");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "addSubview:", v54);

        -[PKPassPersonalizationViewController tableView](v13, "tableView");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setTableFooterView:", v53);

        -[OBPrivacyLinkController didMoveToParentViewController:](v13->_privacyController, "didMoveToParentViewController:", v13);
        goto LABEL_32;
      }
LABEL_21:
      v39 = objc_alloc_init(PKPassPersonalizationCellContext);
      PKLocalizedString(CFSTR("PERSONALIZATION_CELL_PHONE_NUMBER_TITLE"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPassPersonalizationCell textLabelWidthForText:](PKPassPersonalizationCell, "textLabelWidthForText:", v40);
      if (v26 <= v41)
      {
        +[PKPassPersonalizationCell textLabelWidthForText:](PKPassPersonalizationCell, "textLabelWidthForText:", v40);
        v26 = v42;
      }
      -[PKPassPersonalizationCellContext setTitle:](v39, "setTitle:", v40);
      -[PKPassPersonalizationCellContext setKeyboardType:](v39, "setKeyboardType:", 5);
      -[PKPassPersonalizationCellContext setBindTextToStringRepresentation:](v39, "setBindTextToStringRepresentation:", 1);
      -[PKPassPersonalizationCellContext setStringRepresentationBlock:](v39, "setStringRepresentationBlock:", &__block_literal_global_197);
      -[PKPassPersonalizationCellContext setContactUpdateBlock:](v39, "setContactUpdateBlock:", &__block_literal_global_198);
      objc_msgSend(v25, "addObject:", v39);

      goto LABEL_24;
    }
LABEL_18:
    v35 = objc_alloc_init(PKPassPersonalizationCellContext);
    PKLocalizedString(CFSTR("PERSONALIZATION_CELL_EMAIL_ADDRESS_TITLE"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPassPersonalizationCell textLabelWidthForText:](PKPassPersonalizationCell, "textLabelWidthForText:", v36);
    if (v26 <= v37)
    {
      +[PKPassPersonalizationCell textLabelWidthForText:](PKPassPersonalizationCell, "textLabelWidthForText:", v36);
      v26 = v38;
    }
    -[PKPassPersonalizationCellContext setTitle:](v35, "setTitle:", v36);
    -[PKPassPersonalizationCellContext setKeyboardType:](v35, "setKeyboardType:", 7);
    -[PKPassPersonalizationCellContext setTextContentType:](v35, "setTextContentType:", *MEMORY[0x1E0DC5418]);
    -[PKPassPersonalizationCellContext setStringRepresentationBlock:](v35, "setStringRepresentationBlock:", &__block_literal_global_193);
    -[PKPassPersonalizationCellContext setContactUpdateBlock:](v35, "setContactUpdateBlock:", &__block_literal_global_194);
    objc_msgSend(v25, "addObject:", v35);

    if ((v24 & 8) == 0)
      goto LABEL_24;
    goto LABEL_21;
  }
LABEL_32:

  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PKPassPersonalizationHeaderView *v8;
  PKPassPersonalizationHeaderView *headerView;
  void *v10;
  UIBarButtonItem *v11;
  UIBarButtonItem *personalizeNowButton;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIButton *v20;
  UIButton *personalizeLaterButton;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)PKPassPersonalizationViewController;
  -[PKPassPersonalizationViewController viewDidLoad](&v29, sel_viewDidLoad);
  v3 = (void *)MEMORY[0x1E0DC3870];
  -[PKPass personalizationLogoImage](self->_pass, "personalizationLogoImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithPKImage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPass personalization](self->_pass, "personalization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PKPassPersonalizationHeaderView initWithLogoImage:description:]([PKPassPersonalizationHeaderView alloc], "initWithLogoImage:description:", v5, v7);
  headerView = self->_headerView;
  self->_headerView = v8;

  PKLocalizedString(CFSTR("PERSONALIZATION_ADD_BUTTON"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v10, 2, self, sel__personalizeNowButtonPressed_);
  personalizeNowButton = self->_personalizeNowButton;
  self->_personalizeNowButton = v11;

  v13 = (void *)MEMORY[0x1E0DC3520];
  PKLocalizedString(CFSTR("PERSONALIZATION_LATER_BUTTON"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pkui_plainConfigurationWithTitle:font:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setContentInsets:", 23.0, 0.0, 5.0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBaseForegroundColor:", v17);

  objc_initWeak(&location, self);
  v18 = (void *)MEMORY[0x1E0DC3428];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __50__PKPassPersonalizationViewController_viewDidLoad__block_invoke;
  v26[3] = &unk_1E3E659D0;
  objc_copyWeak(&v27, &location);
  v26[4] = self;
  objc_msgSend(v18, "actionWithHandler:", v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v16, v19);
  v20 = (UIButton *)objc_claimAutoreleasedReturnValue();
  personalizeLaterButton = self->_personalizeLaterButton;
  self->_personalizeLaterButton = v20;

  -[UIButton setConfigurationUpdateHandler:](self->_personalizeLaterButton, "setConfigurationUpdateHandler:", &__block_literal_global_42);
  -[PKPassPersonalizationViewController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTableHeaderView:", self->_headerView);

  -[PKPassPersonalizationViewController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPassPersonalizationCellReuseIdentifier"));

  -[UIBarButtonItem setEnabled:](self->_personalizeNowButton, "setEnabled:", -[PKPassPersonalizationViewController _contactReadyForPersonalization](self, "_contactReadyForPersonalization"));
  -[PKPassPersonalizationViewController navigationItem](self, "navigationItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setRightBarButtonItem:", self->_personalizeNowButton);

  -[PKPassPersonalizationViewController navigationItem](self, "navigationItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHidesBackButton:", 1);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __50__PKPassPersonalizationViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained(WeakRetained + 137);
  objc_msgSend(v2, "passPersonalizationViewController:didFinishPersonalizingPass:success:", *(_QWORD *)(a1 + 32), WeakRetained[130], 0);

}

void __50__PKPassPersonalizationViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "setExclusiveTouch:", 1);
  objc_msgSend(v2, "titleLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setTextAlignment:", 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassPersonalizationViewController;
  -[PKPassPersonalizationViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKPassPersonalizationViewController _configureHeaderViewForState:](self, "_configureHeaderViewForState:", -[PKPassPersonalizationHeaderView state](self->_headerView, "state"));
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassPersonalizationViewController;
  -[PKPassPersonalizationViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKPassPersonalizationViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");
  -[PKPassPersonalizationViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

  -[PKPassPersonalizationViewController _positionFooterView](self, "_positionFooterView");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_cellContexts, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSArray *cellContexts;
  id v7;
  id v8;
  void *v9;
  void *v10;

  cellContexts = self->_cellContexts;
  v7 = a4;
  v8 = a3;
  -[NSArray objectAtIndexedSubscript:](cellContexts, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKPassPersonalizationCellReuseIdentifier"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setContext:andContact:", v9, self->_contact);
  objc_msgSend(v10, "setDelegate:", self);

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  +[PKPassPersonalizationCell minimumCellHeight](PKPassPersonalizationCell, "minimumCellHeight", a3, a4);
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result;
  double v6;
  double v7;
  double v8;

  result = 0.0;
  if (!a4)
  {
    objc_msgSend(a3, "bounds", 0.0);
    -[UIButton sizeThatFits:](self->_personalizeLaterButton, "sizeThatFits:", v6, v7);
    return v8;
  }
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  UIButton *v4;

  if (a4)
    v4 = 0;
  else
    v4 = self->_personalizeLaterButton;
  return v4;
}

- (BOOL)personalizationCellShouldBeginEditing:(id)a3
{
  -[PKPassPersonalizationViewController _scrollToCellsIfNeeded](self, "_scrollToCellsIfNeeded", a3);
  return 1;
}

- (void)personalizationCellDidChangeValue:(id)a3
{
  -[UIBarButtonItem setEnabled:](self->_personalizeNowButton, "setEnabled:", -[PKPassPersonalizationViewController _contactReadyForPersonalization](self, "_contactReadyForPersonalization", a3));
}

- (BOOL)personalizationCellShouldReturn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  -[PKPassPersonalizationViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassPersonalizationViewController _nextCellForIndexPath:](self, "_nextCellForIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "becomeFirstResponder");
  }
  else
  {
    if (!-[PKPassPersonalizationViewController _contactReadyForPersonalization](self, "_contactReadyForPersonalization"))
    {
      v9 = 1;
      goto LABEL_7;
    }
    -[PKPassPersonalizationViewController _personalizeNowButtonPressed:](self, "_personalizeNowButtonPressed:", self);
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[PKPassPersonalizationViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)passPersonalizationTermsViewControllerDidAcceptTerms:(id)a3
{
  _QWORD v3[5];

  self->_termsAndConditionsAccepted = 1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __92__PKPassPersonalizationViewController_passPersonalizationTermsViewControllerDidAcceptTerms___block_invoke;
  v3[3] = &unk_1E3E612E8;
  v3[4] = self;
  -[PKPassPersonalizationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

uint64_t __92__PKPassPersonalizationViewController_passPersonalizationTermsViewControllerDidAcceptTerms___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_personalizePass");
}

- (void)passPersonalizationTermsViewControllerDidDeclineTerms:(id)a3
{
  -[PKPassPersonalizationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_personalizeNowButtonPressed:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  PKPassPersonalizationTermsViewController *v7;
  void *v8;
  id v9;

  -[PKPass personalization](self->_pass, "personalization", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_termsAndConditionsAccepted
    || (objc_msgSend(v9, "termsAndConditions"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v4,
        !v5))
  {
    -[PKPassPersonalizationViewController _personalizePass](self, "_personalizePass");
  }
  else
  {
    objc_msgSend(v9, "termsAndConditions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKPassPersonalizationTermsViewController initWithTermsAndConditions:]([PKPassPersonalizationTermsViewController alloc], "initWithTermsAndConditions:", v6);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
    -[PKPassPersonalizationTermsViewController setDelegate:](v7, "setDelegate:", self);
    -[PKPassPersonalizationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

- (void)_personalizePass
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t personalizationSource;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  PKPassPersonalizationViewController *v25;
  BOOL v26;
  _QWORD v27[4];
  id v28;
  id v29;
  PKPassPersonalizationViewController *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  PKPassPersonalizationViewController *v34;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass uniqueID](self->_pass, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setEnabled:](self->_personalizeNowButton, "setEnabled:", 0);
  -[UIButton setEnabled:](self->_personalizeLaterButton, "setEnabled:", 0);
  -[PKPassPersonalizationViewController _configureHeaderViewForState:](self, "_configureHeaderViewForState:", 1);
  -[PKPassPersonalizationViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  v7 = -v6;

  -[PKPassPersonalizationViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentOffset:animated:", 1, 0.0, v7);

  -[PKPassPersonalizationViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", 0);

  v10 = dispatch_time(0, 300000000);
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PKPassPersonalizationViewController__personalizePass__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_after(v10, MEMORY[0x1E0C80D38], block);
  -[PKPass personalization](self->_pass, "personalization");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "requiredPersonalizationFields");

  personalizationSource = self->_personalizationSource;
  v15 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  if (personalizationSource <= 1)
  {
    v32[0] = v11;
    v32[1] = 3221225472;
    v32[2] = __55__PKPassPersonalizationViewController__personalizePass__block_invoke_2;
    v32[3] = &unk_1E3E65A40;
    v33 = v3;
    v34 = self;
    objc_msgSend(v15, "addOperation:", v32);

  }
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __55__PKPassPersonalizationViewController__personalizePass__block_invoke_4;
  v27[3] = &unk_1E3E65A68;
  v16 = v3;
  v28 = v16;
  v17 = v4;
  v29 = v17;
  v30 = self;
  v31 = v13;
  objc_msgSend(v15, "addOperation:", v27);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __55__PKPassPersonalizationViewController__personalizePass__block_invoke_6;
  v22[3] = &unk_1E3E65A90;
  v26 = personalizationSource < 2;
  v23 = v16;
  v24 = v17;
  v25 = self;
  v19 = v17;
  v20 = v16;
  v21 = (id)objc_msgSend(v15, "evaluateWithInput:completion:", v18, v22);

}

void __55__PKPassPersonalizationViewController__personalizePass__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstResponder");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "resignFirstResponder");
}

void __55__PKPassPersonalizationViewController__personalizePass__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v15[0] = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1040);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__PKPassPersonalizationViewController__personalizePass__block_invoke_3;
  v12[3] = &unk_1E3E65A18;
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v8, "addPasses:withCompletionHandler:", v9, v12);

}

uint64_t __55__PKPassPersonalizationViewController__personalizePass__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2 != 0);
}

void __55__PKPassPersonalizationViewController__personalizePass__block_invoke_4(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)a1[4];
  v9 = a1[5];
  v10 = (_QWORD *)a1[6];
  v11 = a1[7];
  v12 = v10[132];
  v13 = v10[131];
  v14 = v10[134];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__PKPassPersonalizationViewController__personalizePass__block_invoke_5;
  v17[3] = &unk_1E3E61338;
  v18 = v6;
  v19 = v7;
  v15 = v6;
  v16 = v7;
  objc_msgSend(v8, "requestPersonalizationOfPassWithUniqueIdentifier:contact:personalizationToken:requiredPersonalizationFields:personalizationSource:handler:", v9, v12, v13, v11, v14, v17);

}

uint64_t __55__PKPassPersonalizationViewController__personalizePass__block_invoke_5(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2 ^ 1u);
}

void __55__PKPassPersonalizationViewController__personalizePass__block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = v6;
  if (*(_BYTE *)(a1 + 56) && objc_msgSend(v6, "isCanceled"))
    objc_msgSend(*(id *)(a1 + 32), "removePassWithUniqueID:diagnosticReason:", *(_QWORD *)(a1 + 40), CFSTR("personalization failed"));
  objc_msgSend(*(id *)(a1 + 48), "finishPersonalizationOfPassWithUniqueID:result:", *(_QWORD *)(a1 + 40), objc_msgSend(v7, "isCanceled") ^ 1);

}

- (void)finishPersonalizationOfPassWithUniqueID:(id)a3 result:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  PKPassPersonalizationViewController *v10;
  BOOL v11;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__PKPassPersonalizationViewController_finishPersonalizationOfPassWithUniqueID_result___block_invoke;
  block[3] = &unk_1E3E64908;
  v11 = a4;
  v9 = v6;
  v10 = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __86__PKPassPersonalizationViewController_finishPersonalizationOfPassWithUniqueID_result___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  id v5;
  void *v6;
  _QWORD block[5];
  id v8;
  char v9;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "passWithUniqueID:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_configureHeaderViewForState:", 2);
    v4 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__PKPassPersonalizationViewController_finishPersonalizationOfPassWithUniqueID_result___block_invoke_2;
    block[3] = &unk_1E3E64908;
    block[4] = *(_QWORD *)(a1 + 40);
    v8 = v3;
    v9 = *(_BYTE *)(a1 + 48);
    v5 = v3;
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_configureHeaderViewForState:", 0);
    objc_msgSend(*(id *)(a1 + 40), "_presentPersonalizationErrorAlert");
    objc_msgSend(*(id *)(a1 + 40), "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", 1);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "setEnabled:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "setEnabled:", 1);
  }
}

void __86__PKPassPersonalizationViewController_finishPersonalizationOfPassWithUniqueID_result___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1096));
  objc_msgSend(WeakRetained, "passPersonalizationViewController:didFinishPersonalizingPass:success:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

- (BOOL)_contactReadyForPersonalization
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  -[PKPass personalization](self->_pass, "personalization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requiredPersonalizationFields");

  -[PKContact name](self->_contact, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "givenName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKContact postalAddress](self->_contact, "postalAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postalCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKContact phoneNumber](self->_contact, "phoneNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKContact emailAddress](self->_contact, "emailAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = ((v4 & 1) == 0 || objc_msgSend(v6, "length"))
     && ((v4 & 2) == 0 || objc_msgSend(v8, "length"))
     && ((v4 & 8) == 0 || objc_msgSend(v10, "length"))
     && ((v4 & 4) == 0 || objc_msgSend(v11, "length") != 0);

  return v12;
}

- (void)_scrollToCellsIfNeeded
{
  _QWORD block[5];

  if (!self->_hasScrolledToCells)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PKPassPersonalizationViewController__scrollToCellsIfNeeded__block_invoke;
    block[3] = &unk_1E3E612E8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    self->_hasScrolledToCells = 1;
  }
}

void __61__PKPassPersonalizationViewController__scrollToCellsIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollToRowAtIndexPath:atScrollPosition:animated:", v3, 1, 1);

}

- (void)_configureHeaderViewForState:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[PKPassPersonalizationHeaderView setState:](self->_headerView, "setState:", a3);
  -[PKPassPersonalizationViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  -[PKPassPersonalizationHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v6, v8);
  v10 = v9;
  -[PKPassPersonalizationHeaderView frame](self->_headerView, "frame");
  -[PKPassPersonalizationHeaderView setFrame:](self->_headerView, "setFrame:");
  -[PKPassPersonalizationViewController tableView](self, "tableView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_tableHeaderHeightDidChangeToHeight:", v10);

}

- (void)_positionFooterView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  -[PKPassPersonalizationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;

  -[PKPassPersonalizationViewController tableView](self, "tableView");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "tableFooterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  if (v6)
  {
    v8 = v7;
    if (PKUIGetMinScreenWidthType())
      v9 = 24.0;
    else
      v9 = 5.0;
    objc_msgSend(v24, "pkui_readableContentBoundsWithMargins:", 0.0, v9, 11.0, v9);
    v11 = v10;
    -[OBPrivacyLinkController view](self->_privacyController, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 1148846080;
    LODWORD(v14) = 1112014848;
    objc_msgSend(v12, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v11, 0.0, v13, v14);
    v16 = v15;
    v18 = v17;
    objc_msgSend(v12, "frame");
    v28.origin.y = 0.0;
    v28.origin.x = v9;
    v28.size.width = v16;
    v28.size.height = v18;
    if (!CGRectEqualToRect(v25, v28))
      objc_msgSend(v12, "setFrame:", v9, 0.0, v16, v18);
    v26.origin.y = 0.0;
    v26.origin.x = v9;
    v26.size.width = v16;
    v26.size.height = v18;
    v19 = CGRectGetMaxY(v26) + 11.0;
    objc_msgSend(v24, "layoutIfNeeded");
    objc_msgSend(v24, "_rectForTableFooterView");
    v21 = v20;
    v23 = v22;
    objc_msgSend(v24, "pkui_naturalRestingBounds");
    objc_msgSend(v6, "setFrame:", v21, fmax(v23, CGRectGetMaxY(v27) - v19 - v5), v8, v19);

  }
}

- (id)_nextCellForIndexPath:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_msgSend(a3, "row") + 1;
  if (v4 >= -[NSArray count](self->_cellContexts, "count"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassPersonalizationViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellForRowAtIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)_presentPersonalizationErrorAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedString(CFSTR("PERSONALIZATION_ERROR_ALERT_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedString(CFSTR("PERSONALIZATION_ERROR_ALERT_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v8);

  -[PKPassPersonalizationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

- (PKPassPersonalizationViewControllerDelegate)delegate
{
  return (PKPassPersonalizationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_cellContexts, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_personalizationToken, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_personalizeLaterButton, 0);
  objc_storeStrong((id *)&self->_personalizeNowButton, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
