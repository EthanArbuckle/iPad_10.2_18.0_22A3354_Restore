@implementation PKExpiredPassesViewController

- (PKExpiredPassesViewController)initWithExistingGroupsController:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  PKExpiredPassesViewController *v8;
  PKExpiredPassesViewController *v9;
  CLGeocoder *v10;
  CLGeocoder *geocoder;
  uint64_t v12;
  PKGroupsController *groupsController;
  void *v14;
  PKExpiredPassesViewController *v15;
  uint64_t v16;
  NSArray *expiredSectionPasses;
  uint64_t v18;
  NSMutableArray *geocodeRequests;
  uint64_t v20;
  NSMutableDictionary *locationStringsForPassUniqueIDs;
  PKPass *viewingPass;
  uint64_t v23;
  UIView *footerView;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  UIBarButtonItem *doneButton;
  id v31;
  void *v32;
  uint64_t v33;
  UIBarButtonItem *editButton;
  uint64_t v35;
  UIBarButtonItem *selectButton;
  id v37;
  void *v38;
  uint64_t v39;
  UIBarButtonItem *cancelButton;
  id v41;
  void *v42;
  uint64_t v43;
  UIBarButtonItem *deleteButton;
  UIBarButtonItem *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  UIBarButtonItem *unhideButton;
  _QWORD v52[4];
  PKExpiredPassesViewController *v53;
  objc_super v54;

  v6 = a3;
  v7 = a4;
  v54.receiver = self;
  v54.super_class = (Class)PKExpiredPassesViewController;
  v8 = -[PKExpiredTableViewController initWithStyle:](&v54, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1));
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = (CLGeocoder *)objc_alloc_init(MEMORY[0x1E0C9E390]);
    geocoder = v9->_geocoder;
    v9->_geocoder = v10;

    v9->_itemsLock._os_unfair_lock_opaque = 0;
    -[PKExpiredTableViewController setExistingGroupsController:](v9, "setExistingGroupsController:", v6);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66DB8]), "initWithPassTypeMask:passFilters:allowedPassUniqueIDs:", 0, 0, 0);
    groupsController = v9->_groupsController;
    v9->_groupsController = (PKGroupsController *)v12;

    -[PKGroupsController loadGroupsSynchronously](v9->_groupsController, "loadGroupsSynchronously");
    -[PKGroupsController expiredSectionPasses](v9->_groupsController, "expiredSectionPasses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __75__PKExpiredPassesViewController_initWithExistingGroupsController_delegate___block_invoke;
    v52[3] = &unk_1E3E6A288;
    v15 = v9;
    v53 = v15;
    objc_msgSend(v14, "sortedArrayUsingComparator:", v52);
    v16 = objc_claimAutoreleasedReturnValue();
    expiredSectionPasses = v15->_expiredSectionPasses;
    v15->_expiredSectionPasses = (NSArray *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](v15->_expiredSectionPasses, "count"));
    geocodeRequests = v15->_geocodeRequests;
    v15->_geocodeRequests = (NSMutableArray *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](v15->_expiredSectionPasses, "count"));
    locationStringsForPassUniqueIDs = v15->_locationStringsForPassUniqueIDs;
    v15->_locationStringsForPassUniqueIDs = (NSMutableDictionary *)v20;

    viewingPass = v15->_viewingPass;
    v15->_viewingPass = 0;

    -[PKExpiredPassesViewController _hyperlinkFooterView](v15, "_hyperlinkFooterView");
    v23 = objc_claimAutoreleasedReturnValue();
    footerView = v15->_footerView;
    v15->_footerView = (UIView *)v23;

    -[PKExpiredPassesViewController navigationItem](v15, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setLeftItemsSupplementBackButton:", 0);
    PKLocalizedString(CFSTR("EXPIRED_PASSES_TITLE"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBackButtonTitle:", v26);

    v27 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedString(CFSTR("EXPIRED_PASSES_DONE"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "initWithTitle:style:target:action:", v28, 2, v15, sel__done);
    doneButton = v15->_doneButton;
    v15->_doneButton = (UIBarButtonItem *)v29;

    -[UIBarButtonItem setAccessibilityIdentifier:](v15->_doneButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
    v31 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedString(CFSTR("EXPIRED_PASSES_EDIT"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "initWithTitle:style:target:action:", v32, 0, v15, sel__edit);
    editButton = v15->_editButton;
    v15->_editButton = (UIBarButtonItem *)v33;

    -[UIBarButtonItem setAccessibilityIdentifier:](v15->_editButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67B30]);
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", 0, 0, v15, sel__select);
    selectButton = v15->_selectButton;
    v15->_selectButton = (UIBarButtonItem *)v35;

    -[UIBarButtonItem setAccessibilityIdentifier:](v15->_selectButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FF8]);
    v37 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedString(CFSTR("EXPIRED_PASSES_CANCEL"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "initWithTitle:style:target:action:", v38, 0, v15, sel__cancel);
    cancelButton = v15->_cancelButton;
    v15->_cancelButton = (UIBarButtonItem *)v39;

    -[UIBarButtonItem setAccessibilityIdentifier:](v15->_cancelButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D679C0]);
    v41 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedString(CFSTR("EXPIRED_PASSES_DELETE"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "initWithTitle:style:target:action:", v42, 0, v15, sel__deletePassPressed);
    deleteButton = v15->_deleteButton;
    v15->_deleteButton = (UIBarButtonItem *)v43;

    v45 = v15->_deleteButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTintColor:](v45, "setTintColor:", v46);

    -[UIBarButtonItem setAccessibilityIdentifier:](v15->_deleteButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F60]);
    v47 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedString(CFSTR("EXPIRED_PASSES_UNHIDE"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v47, "initWithTitle:style:target:action:", v48, 0, v15, sel__recoverPassPressed);
    unhideButton = v15->_unhideButton;
    v15->_unhideButton = (UIBarButtonItem *)v49;

    -[UIBarButtonItem setAccessibilityIdentifier:](v15->_unhideButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67EE8]);
    -[PKExpiredPassesViewController _updateTitles](v15, "_updateTitles");

  }
  return v9;
}

BOOL __75__PKExpiredPassesViewController_initWithExistingGroupsController_delegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "passAnnotationsByUniqueId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "passAnnotationsByUniqueId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "archivedTimestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "archivedTimestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "compare:", v14);

  if (!v15)
  {
    objc_msgSend(v5, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "compare:", v17);

  }
  return v15 == -1;
}

- (void)viewDidLoad
{
  UITableView *v3;
  UITableView *tableView;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKExpiredPassesViewController;
  -[PKExpiredTableViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKExpiredPassesViewController setEditing:animated:](self, "setEditing:animated:", 0, 0);
  -[PKExpiredPassesViewController tableView](self, "tableView");
  v3 = (UITableView *)objc_claimAutoreleasedReturnValue();
  tableView = self->_tableView;
  self->_tableView = v3;

  -[PKExpiredTableViewController setCachingDelegate:](self, "setCachingDelegate:", self);
  -[UITableView reloadData](self->_tableView, "reloadData");
  -[PKExpiredPassesViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67B98]);

}

- (void)viewWillAppear:(BOOL)a3
{
  PKPass *viewingPass;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKExpiredPassesViewController;
  -[PKExpiredPassesViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  viewingPass = self->_viewingPass;
  self->_viewingPass = 0;

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *selectedPassesLabel;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  _QWORD v18[6];

  v4 = a3;
  v18[5] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)PKExpiredPassesViewController;
  -[PKExpiredPassesViewController setEditing:animated:](&v17, sel_setEditing_animated_, a3, a4);
  -[PKExpiredPassesViewController _updateTitles](self, "_updateTitles");
  -[PKExpiredPassesViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "setToolbarHidden:animated:", 0, 1);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    self->_selectedPassesCount = 0;
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    selectedPassesLabel = self->_selectedPassesLabel;
    self->_selectedPassesLabel = v9;

    v11 = self->_selectedPassesLabel;
    -[PKExpiredPassesViewController _selectedExpiredPassesString](self, "_selectedExpiredPassesString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v11, "setText:", v12);

    v13 = self->_selectedPassesLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTintColor:](v13, "setTintColor:", v14);

    -[UILabel setNumberOfLines:](self->_selectedPassesLabel, "setNumberOfLines:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_selectedPassesLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setLineBreakMode:](self->_selectedPassesLabel, "setLineBreakMode:", 4);
    -[UILabel setTextAlignment:](self->_selectedPassesLabel, "setTextAlignment:", 1);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_selectedPassesLabel);
    objc_msgSend(v15, "setTarget:", self);
    objc_msgSend(v15, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68000]);
    v18[0] = self->_deleteButton;
    v18[1] = v7;
    v18[2] = v15;
    v18[3] = v8;
    v18[4] = self->_unhideButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExpiredPassesViewController setToolbarItems:](self, "setToolbarItems:", v16);

  }
  else
  {
    objc_msgSend(v6, "setToolbarHidden:animated:", 1, 1);
  }

}

- (id)indexPathOfExpiredPassWithUniqueID:(id)a3
{
  id v4;
  NSArray *expiredSectionPasses;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  expiredSectionPasses = self->_expiredSectionPasses;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__PKExpiredPassesViewController_indexPathOfExpiredPassWithUniqueID___block_invoke;
  v10[3] = &unk_1E3E6A2B0;
  v6 = v4;
  v11 = v6;
  v7 = -[NSArray indexOfObjectPassingTest:](expiredSectionPasses, "indexOfObjectPassingTest:", v10);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

uint64_t __68__PKExpiredPassesViewController_indexPathOfExpiredPassWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_expiredSectionPasses, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[PKExpiredTableViewController tableView:cellWithReuseIdentifier:](self, "tableView:cellWithReuseIdentifier:", a3, CFSTR("cellPassExpiredIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_expiredSectionPasses, "objectAtIndex:", objc_msgSend(v6, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExpiredPassesViewController configureCell:atIndexPath:withPass:](self, "configureCell:atIndexPath:withPass:", v7, v6, v8);

  return v7;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withPass:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  PKExpiredPassesGeocodeRequestItem *v18;
  id v19;

  v19 = a3;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v19, "setPass:", v7);
    objc_msgSend(v7, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPrimaryText:", v8);

    PKDateStringForExpiredPass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSecondaryDetailText:", v9);
    objc_msgSend(v7, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_locationStringsForPassUniqueIDs, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v7, "embeddedLocationsArray");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[PKExpiredPassesViewController _buildDetailText:pass:](self, "_buildDetailText:pass:", v11, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDetailText:", v14);

    if (v12)
    {
      objc_msgSend(v12, "coordinate");
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v15, v16);
      v18 = -[PKExpiredPassesGeocodeRequestItem initWithCell:location:]([PKExpiredPassesGeocodeRequestItem alloc], "initWithCell:location:", v19, v17);
      os_unfair_lock_lock(&self->_itemsLock);
      -[NSMutableArray addObject:](self->_geocodeRequests, "addObject:", v18);
      os_unfair_lock_unlock(&self->_itemsLock);
      -[PKExpiredPassesViewController _processGeocodeRequestsIfNecessary](self, "_processGeocodeRequestsIfNecessary");

    }
  }

}

- (id)_buildDetailText:(id)a3 pass:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  +[PKExpiredPassesViewController detailTextStringForPass:](PKExpiredPassesViewController, "detailTextStringForPass:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@, %@"), v6, v5);
  else
    v8 = v6;
  v9 = v8;

  return v9;
}

- (void)_processGeocodeRequestsIfNecessary
{
  os_unfair_lock_s *p_itemsLock;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  CLGeocoder *geocoder;
  _QWORD v8[7];
  id v9;
  id location;
  _QWORD v11[5];
  id v12;
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  v4 = -[NSMutableArray count](self->_geocodeRequests, "count");
  os_unfair_lock_unlock(p_itemsLock);
  if (v4)
  {
    if (-[CLGeocoder isGeocoding](self->_geocoder, "isGeocoding"))
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Reverse geocode in progress - skipping", buf, 2u);
      }

    }
    else
    {
      os_unfair_lock_lock(p_itemsLock);
      *(_QWORD *)buf = 0;
      v14 = buf;
      v15 = 0x3032000000;
      v16 = __Block_byref_object_copy__18;
      v17 = __Block_byref_object_dispose__18;
      -[NSMutableArray firstObject](self->_geocodeRequests, "firstObject");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v11[0] = 0;
      v11[1] = v11;
      v11[2] = 0x3032000000;
      v11[3] = __Block_byref_object_copy__18;
      v11[4] = __Block_byref_object_dispose__18;
      objc_msgSend(*((id *)v14 + 5), "uniqueID");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v14 + 5), "location");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(p_itemsLock);
      objc_initWeak(&location, self);
      geocoder = self->_geocoder;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __67__PKExpiredPassesViewController__processGeocodeRequestsIfNecessary__block_invoke;
      v8[3] = &unk_1E3E6A328;
      objc_copyWeak(&v9, &location);
      v8[4] = self;
      v8[5] = v11;
      v8[6] = buf;
      -[CLGeocoder reverseGeocodeLocation:completionHandler:](geocoder, "reverseGeocodeLocation:completionHandler:", v6, v8);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);

      _Block_object_dispose(v11, 8);
      _Block_object_dispose(buf, 8);

    }
  }
}

void __67__PKExpiredPassesViewController__processGeocodeRequestsIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  BOOL v21;
  char v22;
  void *v23;
  void *v24;
  _QWORD aBlock[7];

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKExpiredPassesViewController__processGeocodeRequestsIfNecessary__block_invoke_2;
    aBlock[3] = &unk_1E3E6A300;
    v8 = *(_QWORD *)(a1 + 40);
    aBlock[4] = *(_QWORD *)(a1 + 32);
    aBlock[5] = WeakRetained;
    aBlock[6] = v8;
    v9 = (void (**)(_QWORD))_Block_copy(aBlock);
    v10 = v9;
    if (a3)
    {
      v9[2](v9);
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v5, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v10[2](v10);
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "cell");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locality");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "administrativeArea");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "length") || !objc_msgSend(v14, "length"))
    {
LABEL_20:
      v10[2](v10);

      goto LABEL_21;
    }
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@, %@"), v13, v14);
    objc_msgSend(v7[133], "setObject:forKeyedSubscript:");
    v23 = v12;
    objc_msgSend(v12, "pass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v18 = v16;
    v19 = v17;
    if (v18 == v19)
    {

      v12 = v23;
    }
    else
    {
      v20 = v19;
      if (v18)
        v21 = v19 == 0;
      else
        v21 = 1;
      if (v21)
      {

        v12 = v23;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v22 = objc_msgSend(v18, "isEqualToString:", v19);

      v12 = v23;
      if ((v22 & 1) == 0)
        goto LABEL_19;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "pass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_buildDetailText:pass:", v24, v15);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDetailText:", v18);
    goto LABEL_18;
  }
LABEL_23:

}

uint64_t __67__PKExpiredPassesViewController__processGeocodeRequestsIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 1096));
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 1088);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PKExpiredPassesViewController__processGeocodeRequestsIfNecessary__block_invoke_3;
  v5[3] = &unk_1E3E6A2D8;
  v5[4] = v2;
  objc_msgSend(v3, "pk_removeObjectsPassingTest:", v5);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 1096));
  return objc_msgSend(*(id *)(a1 + 40), "_processGeocodeRequestsIfNecessary");
}

BOOL __67__PKExpiredPassesViewController__processGeocodeRequestsIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);

  return v4;
}

+ (id)detailTextStringForPass:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v7;

  v3 = a3;
  switch(objc_msgSend(v3, "style"))
  {
    case 0:
      v4 = CFSTR("EXPIRED_PASSES_PASS_STYLE_COUPON");
      goto LABEL_6;
    case 2:
    case 9:
      v4 = CFSTR("EXPIRED_PASSES_PASS_STYLE_EVENT_TICKET");
      goto LABEL_6;
    case 4:
      v4 = CFSTR("EXPIRED_PASSES_PASS_STYLE_BOARDING_PASS");
      goto LABEL_6;
    case 7:
      objc_msgSend(v3, "secureElementPass");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accessType");
      PKSecureElementAccessPassTypeToAccessKeyString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    default:
      v4 = CFSTR("EXPIRED_PASSES_PASS_STYLE_PASS");
LABEL_6:
      PKLocalizedString(&v4->isa);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      return v5;
  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKExpiredPassesViewController;
  -[PKExpiredTableViewController tableView:willSelectRowAtIndexPath:](&v7, sel_tableView_willSelectRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && -[UITableView isEditing](self->_tableView, "isEditing"))
  {
    ++self->_selectedPassesCount;
    -[PKExpiredPassesViewController _updateSelectedPassesText](self, "_updateSelectedPassesText");
  }
  return v5;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKExpiredPassesViewController;
  -[PKExpiredTableViewController tableView:willDeselectRowAtIndexPath:](&v7, sel_tableView_willDeselectRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && -[UITableView isEditing](self->_tableView, "isEditing"))
  {
    --self->_selectedPassesCount;
    -[PKExpiredPassesViewController _updateSelectedPassesText](self, "_updateSelectedPassesText");
  }
  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  PKPass *v8;
  PKPass *viewingPass;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (!-[UITableView isEditing](self->_tableView, "isEditing"))
  {
    objc_msgSend(v11, "deselectRowAtIndexPath:animated:", v6, 1);
    if (!self->_viewingPass)
    {
      -[PKExpiredPassesViewController viewControllerForRowAtIndexPath:](self, "viewControllerForRowAtIndexPath:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pass");
      v8 = (PKPass *)objc_claimAutoreleasedReturnValue();
      viewingPass = self->_viewingPass;
      self->_viewingPass = v8;

      -[PKExpiredPassesViewController navigationController](self, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pushViewController:animated:", v7, 1);

    }
  }

}

- (void)recoverPass:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "uniqueID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recoverPassWithUniqueID:", v9);

  -[PKExpiredTableViewController existingGroupsController](self, "existingGroupsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleUserPassRecover:", v9);

  -[PKExpiredPassesViewController _finishedEditingExpiredPassAtIndexPath:](self, "_finishedEditingExpiredPassAtIndexPath:", v6);
}

- (void)deletePass:(id)a3 atIndexPath:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0D66F08];
  v11 = a4;
  v7 = a3;
  objc_msgSend(v6, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removePass:", v7);

  -[PKExpiredTableViewController existingGroupsController](self, "existingGroupsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "handleUserPassDelete:", v10);
  -[PKExpiredPassesViewController _finishedEditingExpiredPassAtIndexPath:](self, "_finishedEditingExpiredPassAtIndexPath:", v11);

}

- (void)_finishedEditingExpiredPassAtIndexPath:(id)a3
{
  UITableView *tableView;
  void *v5;
  id v6;
  void *v7;
  id WeakRetained;
  NSUInteger v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  tableView = self->_tableView;
  v10 = a3;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](tableView, "deleteRowsAtIndexPaths:withRowAnimation:", v7, 100, v10, v11);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "finishedEditingExpiredPass");

  v9 = -[NSArray count](self->_expiredSectionPasses, "count");
  if (!v9)
    -[PKExpiredPassesViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  NSArray *v8;
  NSArray *expiredSectionPasses;
  id v10;

  v7 = a5;
  -[NSArray objectAtIndex:](self->_expiredSectionPasses, "objectAtIndex:", objc_msgSend(v7, "row"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray pk_arrayByRemovingObject:](self->_expiredSectionPasses, "pk_arrayByRemovingObject:");
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  expiredSectionPasses = self->_expiredSectionPasses;
  self->_expiredSectionPasses = v8;

  if (a4 == 1)
    -[PKExpiredPassesViewController deletePass:atIndexPath:](self, "deletePass:atIndexPath:", v10, v7);
  else
    -[PKExpiredPassesViewController recoverPass:atIndexPath:](self, "recoverPass:atIndexPath:", v10, v7);

}

- (void)removeExpiredSectionPassWithUniqueID:(id)a3 isDeletion:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSArray *expiredSectionPasses;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a4;
  v6 = a3;
  expiredSectionPasses = self->_expiredSectionPasses;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__PKExpiredPassesViewController_removeExpiredSectionPassWithUniqueID_isDeletion___block_invoke;
  v15[3] = &unk_1E3E6A2B0;
  v14 = v6;
  v16 = v14;
  v8 = -[NSArray indexOfObjectPassingTest:](expiredSectionPasses, "indexOfObjectPassingTest:", v15);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v8;
    -[NSArray objectAtIndex:](self->_expiredSectionPasses, "objectAtIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray pk_arrayByRemovingObject:](self->_expiredSectionPasses, "pk_arrayByRemovingObject:", v10);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v12 = self->_expiredSectionPasses;
    self->_expiredSectionPasses = v11;

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v9, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      -[PKExpiredPassesViewController deletePass:atIndexPath:](self, "deletePass:atIndexPath:", v10, v13);
    else
      -[PKExpiredPassesViewController recoverPass:atIndexPath:](self, "recoverPass:atIndexPath:", v10, v13);

  }
}

uint64_t __81__PKExpiredPassesViewController_removeExpiredSectionPassWithUniqueID_isDeletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v7)
    *a4 = 1;
  return v7;
}

- (id)_hyperlinkFooterView
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  PKFooterHyperlinkView *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  PKLocalizedString(CFSTR("EXPIRED_PASSES_FOOTER"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedString(CFSTR("EXPIRED_PASSES_FOOTER_LINK"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKStringWithValidatedFormat();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfString:", v3, v3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v8 = v5;
    v9 = v6;
    v7 = objc_alloc_init(PKFooterHyperlinkView);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=PASSBOOK&path="));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKAttributedStringByAddingLinkToRange(v4, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFooterHyperlinkView setAttributedText:](v7, "setAttributedText:", v11);

    v12 = &__block_literal_global_46;
    -[PKFooterHyperlinkView setAction:](v7, "setAction:", &__block_literal_global_46);

  }
  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  UIView *footerView;

  footerView = self->_footerView;
  if (footerView)
    return footerView;
  -[PKExpiredPassesViewController _hyperlinkFooterView](self, "_hyperlinkFooterView", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (void)_updateTitles
{
  _BOOL8 v3;
  int64_t selectedPassesCount;
  NSUInteger v5;
  uint64_t v6;
  UIBarButtonItem *selectButton;
  __CFString *v8;
  void *v9;
  void *v10;
  int *v11;
  void *v12;
  id v13;

  -[PKExpiredPassesViewController navigationItem](self, "navigationItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = self->_selectedPassesCount > 0;
  -[UIBarButtonItem setEnabled:](self->_deleteButton, "setEnabled:", v3);
  -[UIBarButtonItem setEnabled:](self->_unhideButton, "setEnabled:", v3);
  selectedPassesCount = self->_selectedPassesCount;
  v5 = -[NSArray count](self->_expiredSectionPasses, "count");
  v6 = 1144;
  selectButton = self->_selectButton;
  if (selectedPassesCount == v5)
    v8 = CFSTR("EXPIRED_PASSES_DESELECT_ALL");
  else
    v8 = CFSTR("EXPIRED_PASSES_SELECT_ALL");
  PKLocalizedString(&v8->isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTitle:](selectButton, "setTitle:", v9);

  if (-[PKExpiredPassesViewController isEditing](self, "isEditing"))
  {
    PKLocalizedString(CFSTR("EXPIRED_PASSES_EDIT"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v10);

    v11 = &OBJC_IVAR___PKExpiredPassesViewController__cancelButton;
  }
  else
  {
    PKLocalizedString(CFSTR("EXPIRED_PASSES_TITLE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v12);

    v11 = &OBJC_IVAR___PKExpiredPassesViewController__editButton;
    v6 = 1128;
  }
  objc_msgSend(v13, "setLeftBarButtonItem:animated:", *(Class *)((char *)&self->super.super.super.super.super.isa + v6), 1);
  objc_msgSend(v13, "setRightBarButtonItem:animated:", *(Class *)((char *)&self->super.super.super.super.super.isa + *v11), 1);

}

- (void)_done
{
  id v2;

  -[PKExpiredPassesViewController presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_select
{
  int64_t selectedPassesCount;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  UITableView *tableView;

  selectedPassesCount = self->_selectedPassesCount;
  v4 = -[NSArray count](self->_expiredSectionPasses, "count");
  v5 = -[UITableView numberOfRowsInSection:](self->_tableView, "numberOfRowsInSection:", 0);
  if (v5 >= 1)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      tableView = self->_tableView;
      if (selectedPassesCount == v4)
        -[UITableView deselectRowAtIndexPath:animated:](tableView, "deselectRowAtIndexPath:animated:", v8, 1);
      else
        -[UITableView selectRowAtIndexPath:animated:scrollPosition:](tableView, "selectRowAtIndexPath:animated:scrollPosition:", v8, 1, 0);

    }
  }
  -[PKExpiredPassesViewController tableViewDidUpdateSelection:](self, "tableViewDidUpdateSelection:", self->_tableView);
}

- (void)_edit
{
  -[PKExpiredPassesViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
}

- (void)_cancel
{
  -[PKExpiredPassesViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

- (id)_selectedExpiredPassesString
{
  return (id)PKLocalizedString(CFSTR("EXPIRED_PASSES_SELECTED_COUNT"), CFSTR("%lu"), self->_selectedPassesCount);
}

- (void)_applyDeletionOrRecovery
{
  UITableView *tableView;
  _QWORD v3[5];
  _QWORD v4[5];

  tableView = self->_tableView;
  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__PKExpiredPassesViewController__applyDeletionOrRecovery__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__PKExpiredPassesViewController__applyDeletionOrRecovery__block_invoke_2;
  v3[3] = &unk_1E3E62288;
  -[UITableView performBatchUpdates:completion:](tableView, "performBatchUpdates:completion:", v4, v3);
}

void __57__PKExpiredPassesViewController__applyDeletionOrRecovery__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "indexPathsForSelectedRows");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(v3, "reverseObjectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "tableView:commitEditingStyle:forRowAtIndexPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1104), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1176), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

uint64_t __57__PKExpiredPassesViewController__applyDeletionOrRecovery__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEditing:animated:", 0, 1);
}

- (void)_presentConfirmationAlertWithTitle:(id)a3 confirmationMessage:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v6 = (void *)MEMORY[0x1E0DC3448];
  v7 = a4;
  v8 = a3;
  PKLocalizedString(CFSTR("EXPIRED_PASSES_CANCEL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessibilityIdentifier:", *MEMORY[0x1E0D679C0]);
  v11 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("EXPIRED_PASSES_CONTINUE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__PKExpiredPassesViewController__presentConfirmationAlertWithTitle_confirmationMessage___block_invoke;
  v15[3] = &unk_1E3E61D68;
  v15[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67EE8]);
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, v7, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addAction:", v10);
  objc_msgSend(v14, "addAction:", v13);
  -[PKExpiredPassesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

}

uint64_t __88__PKExpiredPassesViewController__presentConfirmationAlertWithTitle_confirmationMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyDeletionOrRecovery");
}

- (void)_deletePassPressed
{
  id v3;

  self->_currentEditingStyle = 1;
  PKLocalizedString(CFSTR("EXPIRED_PASSES_DELETE_CONFIRMATION"), CFSTR("%lu"), self->_selectedPassesCount);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKExpiredPassesViewController _presentConfirmationAlertWithTitle:confirmationMessage:](self, "_presentConfirmationAlertWithTitle:confirmationMessage:", 0, v3);

}

- (void)_recoverPassPressed
{
  id v3;

  self->_currentEditingStyle = 0;
  PKLocalizedString(CFSTR("EXPIRED_PASSES_UNHIDE_CONFIRMATION"), CFSTR("%lu"), self->_selectedPassesCount);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKExpiredPassesViewController _presentConfirmationAlertWithTitle:confirmationMessage:](self, "_presentConfirmationAlertWithTitle:confirmationMessage:", 0, v3);

}

- (void)tableViewDidUpdateSelection:(id)a3
{
  void *v4;

  -[UITableView indexPathsForSelectedRows](self->_tableView, "indexPathsForSelectedRows", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_selectedPassesCount = objc_msgSend(v4, "count");

  -[PKExpiredPassesViewController _updateSelectedPassesText](self, "_updateSelectedPassesText");
}

- (void)_updateSelectedPassesText
{
  UILabel *selectedPassesLabel;
  void *v4;
  void *v5;
  void *v6;

  selectedPassesLabel = self->_selectedPassesLabel;
  -[PKExpiredPassesViewController _selectedExpiredPassesString](self, "_selectedExpiredPassesString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](selectedPassesLabel, "setText:", v4);

  -[UILabel sizeToFit](self->_selectedPassesLabel, "sizeToFit");
  -[PKExpiredPassesViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toolbar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeToFit");

  -[PKExpiredPassesViewController _updateTitles](self, "_updateTitles");
}

- (id)viewControllerForRowAtIndexPath:(id)a3
{
  void *v3;
  PKExpiredSinglePassViewController *v4;

  if (a3)
  {
    -[NSArray objectAtIndex:](self->_expiredSectionPasses, "objectAtIndex:", objc_msgSend(a3, "row"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PKExpiredSinglePassViewController initWithPass:]([PKExpiredSinglePassViewController alloc], "initWithPass:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  -[PKExpiredPassesViewController viewControllerForRowAtIndexPath:](self, "viewControllerForRowAtIndexPath:", a4, a5.x, a5.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0DC36B8];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __91__PKExpiredPassesViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
    v10[3] = &unk_1E3E6A350;
    v11 = v5;
    objc_msgSend(v7, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v10, &__block_literal_global_70);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __91__PKExpiredPassesViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __91__PKExpiredPassesViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2()
{
  return 0;
}

- (id)passAtIndexPath:(id)a3
{
  id v4;
  NSArray *expiredSectionPasses;
  unint64_t v6;
  void *v7;

  v4 = a3;
  expiredSectionPasses = self->_expiredSectionPasses;
  if (expiredSectionPasses && (v6 = -[NSArray count](expiredSectionPasses, "count"), v6 > objc_msgSend(v4, "row")))
  {
    -[NSArray objectAtIndex:](self->_expiredSectionPasses, "objectAtIndex:", objc_msgSend(v4, "row"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)prefetchItemsAtIndexPaths:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "count");
  if (v4 - 1 >= 0)
  {
    v5 = v4;
    do
    {
      objc_msgSend(v9, "objectAtIndex:", --v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "row");
      if (-[NSArray count](self->_expiredSectionPasses, "count") > v7)
      {
        -[NSArray objectAtIndex:](self->_expiredSectionPasses, "objectAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "loadImageSetAsync:preheat:withCompletion:", 0, 0, 0);

      }
    }
    while (v5 > 0);
  }

}

- (BOOL)passExistsWithUniqueIdentifier:(id)a3
{
  id v4;
  NSArray *expiredSectionPasses;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  expiredSectionPasses = self->_expiredSectionPasses;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__PKExpiredPassesViewController_passExistsWithUniqueIdentifier___block_invoke;
  v8[3] = &unk_1E3E6A3B8;
  v9 = v4;
  v6 = v4;
  LOBYTE(expiredSectionPasses) = -[NSArray pk_containsObjectPassingTest:](expiredSectionPasses, "pk_containsObjectPassingTest:", v8);

  return (char)expiredSectionPasses;
}

uint64_t __64__PKExpiredPassesViewController_passExistsWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)pass
{
  return self->_viewingPass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPassesLabel, 0);
  objc_storeStrong((id *)&self->_unhideButton, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_selectButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_geocodeRequests, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
  objc_storeStrong((id *)&self->_viewingPass, 0);
  objc_storeStrong((id *)&self->_locationStringsForPassUniqueIDs, 0);
  objc_storeStrong((id *)&self->_expiredSectionPasses, 0);
  objc_storeStrong((id *)&self->_groupsController, 0);
}

@end
