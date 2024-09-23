@implementation PKBarcodePassDetailViewController

+ (BOOL)isWifiEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWiFiEnabled");

  return v3;
}

- (PKBarcodePassDetailViewController)initWithCoder:(id)a3
{

  return 0;
}

- (PKBarcodePassDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (PKBarcodePassDetailViewController)initWithStyle:(int64_t)a3 numberOfSections:(unint64_t)a4
{
  return -[PKBarcodePassDetailViewController initWithPass:](self, "initWithPass:", 0, a4);
}

- (PKBarcodePassDetailViewController)initWithPass:(id)a3
{
  id v5;
  PKBarcodePassDetailViewController *v6;
  PKBarcodePassDetailViewController *v7;
  uint64_t v8;
  PKPassDisplayProfile *displayProfile;
  uint64_t v10;
  PKPassColorProfile *colorProfile;
  NSMutableDictionary *v12;
  NSMutableDictionary *fieldCellsByRow;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  BluetoothManager *btManager;
  void *v19;
  void *v20;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKBarcodePassDetailViewController;
  v6 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v22, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1), 7);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pass, a3);
    -[PKPass displayProfile](v7->_pass, "displayProfile");
    v8 = objc_claimAutoreleasedReturnValue();
    displayProfile = v7->_displayProfile;
    v7->_displayProfile = (PKPassDisplayProfile *)v8;

    +[PKPassColorProfile profileForDisplayProfile:](PKPassColorProfile, "profileForDisplayProfile:", v7->_displayProfile);
    v10 = objc_claimAutoreleasedReturnValue();
    colorProfile = v7->_colorProfile;
    v7->_colorProfile = (PKPassColorProfile *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fieldCellsByRow = v7->_fieldCellsByRow;
    v7->_fieldCellsByRow = v12;

    v7->_isWifiEnabled = 1;
    v7->_isLocationEnabled = 1;
    v7->_isBluetoothEnabled = 1;
    -[PKBarcodePassDetailViewController navigationItem](v7, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v14, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    v7->_titleOpacity = 0.0;
    v15 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v15, "configureWithDefaultBackground");
    -[PKBarcodePassDetailViewController _updateStandardAppearance:](v7, "_updateStandardAppearance:", v15);
    objc_msgSend(v14, "setStandardAppearance:", v15);
    -[PKBarcodePassDetailViewController _updatePassProperties](v7, "_updatePassProperties");
    objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addWiFiObserver:selector:", v7, sel__wifiChanged_);

    objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
    v17 = objc_claimAutoreleasedReturnValue();
    btManager = v7->_btManager;
    v7->_btManager = (BluetoothManager *)v17;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v7, sel__bluetoothPowerChanged_, *MEMORY[0x1E0D03390], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v7, sel__bluetoothPowerChanged_, *MEMORY[0x1E0D03400], 0);

    PKObservePassSettingsChanged();
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSObject *refreshTimeout;
  OS_dispatch_source *v6;
  void *v7;
  objc_super v8;

  PKUnregisterPassSettingsChangedObserver();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeWiFiObserver:", self);

  refreshTimeout = self->_refreshTimeout;
  if (refreshTimeout)
  {
    dispatch_source_cancel(refreshTimeout);
    v6 = self->_refreshTimeout;
    self->_refreshTimeout = 0;

  }
  if (self->_didRampScreenBrightness)
  {
    +[PKBacklightController sharedInstance](PKBacklightController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endRequestingBacklightRamping:", self);

    self->_didRampScreenBrightness = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)PKBarcodePassDetailViewController;
  -[PKSectionTableViewController dealloc](&v8, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setShowDoneButton:(BOOL)a3
{
  if (((!self->_showDoneButton ^ a3) & 1) == 0)
  {
    self->_showDoneButton = a3;
    -[PKBarcodePassDetailViewController _updateNavigationItem](self, "_updateNavigationItem");
  }
}

- (void)loadView
{
  void *v3;
  UIRefreshControl *v4;
  UIRefreshControl *refreshControl;
  PKPassHeaderView *v6;
  PKPassHeaderView *passHeaderView;
  PKPassHeaderView *v8;
  uint64_t v9;
  id v10;
  UIView *v11;
  UIView *headerView;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKBarcodePassDetailViewController;
  -[PKBarcodePassDetailViewController loadView](&v14, sel_loadView);
  -[PKBarcodePassDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKBarcodePassDetailViewController shouldAllowRefresh](self, "shouldAllowRefresh"))
  {
    v4 = (UIRefreshControl *)objc_alloc_init(MEMORY[0x1E0DC3BA8]);
    refreshControl = self->_refreshControl;
    self->_refreshControl = v4;

    -[PKBarcodePassDetailViewController setRefreshControl:](self, "setRefreshControl:", self->_refreshControl);
    -[UIRefreshControl addTarget:action:forControlEvents:](self->_refreshControl, "addTarget:action:forControlEvents:", self, sel_refreshControlValueChanged_, 4096);
  }
  v6 = -[PKPassHeaderView initWithPass:]([PKPassHeaderView alloc], "initWithPass:", self->_pass);
  passHeaderView = self->_passHeaderView;
  self->_passHeaderView = v6;

  -[PKPassHeaderView setDelegate:](self->_passHeaderView, "setDelegate:", self);
  -[PKPassHeaderView setSuppressedContent:](self->_passHeaderView, "setSuppressedContent:", self->_suppressedContent);
  -[PKPassHeaderView setShowModificationDate:](self->_passHeaderView, "setShowModificationDate:", -[PKBarcodePassDetailViewController shouldAllowRefresh](self, "shouldAllowRefresh"));
  v8 = self->_passHeaderView;
  if ((-[PKPass isExpired](self->_pass, "isExpired") & 1) != 0)
    v9 = 1;
  else
    v9 = -[PKPass isVoided](self->_pass, "isVoided");
  -[PKPassHeaderView setExpiredPass:](v8, "setExpiredPass:", v9);
  -[PKPassHeaderView setSmall:](self->_passHeaderView, "setSmall:", 1);
  v10 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v11 = (UIView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 0.0, self->_headerHeight);
  headerView = self->_headerView;
  self->_headerView = v11;

  objc_msgSend(v3, "setTableHeaderView:", self->_headerView);
  -[UIView addSubview:](self->_headerView, "addSubview:", self->_passHeaderView);
  objc_msgSend(v3, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("FirstSectionHeaderReuseIdentifier"));
  -[PKBarcodePassDetailViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67DE8]);

  -[PKBarcodePassDetailViewController _updateHeaderHeight](self, "_updateHeaderHeight");
}

- (void)viewWillAppear:(BOOL)a3
{
  int v4;
  UIView *locationHelpView;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKBarcodePassDetailViewController;
  -[PKBarcodePassDetailViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  v4 = objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled");
  if (((v4 ^ !self->_isLocationEnabled) & 1) == 0)
  {
    self->_isLocationEnabled = v4;
    locationHelpView = self->_locationHelpView;
    self->_locationHelpView = 0;

    -[PKBarcodePassDetailViewController reloadData](self, "reloadData");
  }
  if (-[PKBarcodePassDetailViewController shouldMapSection:](self, "shouldMapSection:", 5))
  {
    self->_didRampScreenBrightness = 1;
    +[PKBacklightController sharedInstance](PKBacklightController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginRequestingBacklightRamping:", self);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKBarcodePassDetailViewController;
  -[PKBarcodePassDetailViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (self->_didRampScreenBrightness)
  {
    +[PKBacklightController sharedInstance](PKBacklightController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endRequestingBacklightRamping:", self);

    self->_didRampScreenBrightness = 0;
  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double headerHeight;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  CGRect v44;
  CGRect slice;
  objc_super v46;
  CGRect v47;

  v46.receiver = self;
  v46.super_class = (Class)PKBarcodePassDetailViewController;
  -[PKBarcodePassDetailViewController viewWillLayoutSubviews](&v46, sel_viewWillLayoutSubviews);
  -[PKBarcodePassDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBarcodePassDetailViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v3, "safeAreaInsets");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v3, "contentSize");
  v16 = v15;
  if (self->_previousLayoutTableViewBoundsSize.width != v8)
  {
    self->_previousLayoutTableViewBoundsSize.width = v8;
    self->_previousLayoutTableViewBoundsSize.height = v10;
    -[PKBarcodePassDetailViewController _updateHeaderHeight](self, "_updateHeaderHeight");
  }
  -[PKBarcodePassDetailViewController _offscreenHeaderHeight](self, "_offscreenHeaderHeight");
  v18 = v17;
  objc_msgSend(v3, "contentInset");
  v20 = v19;
  v21 = v10 - (v12 + v14);
  v22 = v16 - v21;
  v23 = v16 > v21 && v22 < v18;
  v24 = v20;
  if (v23)
    v24 = v18 - v22;
  if (v20 != v24)
    objc_msgSend(v3, "setContentInset:");
  objc_msgSend(v3, "adjustedContentInset");
  v26 = v25;
  v27 = v18 + v25 - v12;
  -[UIRefreshControl superview](self->_refreshControl, "superview");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 >= -v26 || v28 == 0)
    v30 = 0.0;
  else
    v30 = -v26 - v6;
  v31 = v27 + v30;
  memset(&slice, 0, sizeof(slice));
  objc_msgSend(v3, "_rectForTableHeaderView");
  v35 = v26 + v30;
  v36 = -v35;
  headerHeight = self->_headerHeight;
  v38 = v31 - v35;
  v39 = v6 - v38 + v33;
  if (v6 <= v38)
    v39 = v33;
  v40 = v33 - (v36 - v6);
  if (v6 >= v36)
    v40 = v39;
  self->_headerFrame.origin.x = v32;
  self->_headerFrame.origin.y = v40;
  self->_headerFrame.size.width = v34;
  self->_headerFrame.size.height = headerHeight;
  -[UIView setBounds:](self->_headerView, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[PKPassHeaderView updateShadow:](self->_passHeaderView, "updateShadow:", fmin(fmax((v6 - v38) / (v38 + -20.0 - v38), 0.0), 1.0));
  -[PKPassHeaderView setAlpha:](self->_passHeaderView, "setAlpha:", fmin(fmax((v6 - (v38 + 20.0)) / (v38 - (v38 + 20.0)), 0.0), 1.0));
  v41 = fmin(fmax((v6 - ((v35 + v38) * 0.25 - v35)) / ((v35 + v38) * 0.25 - v35 + 20.0 - ((v35 + v38) * 0.25 - v35)), 0.0), 1.0);
  -[UIView bounds](self->_headerView, "bounds");
  v44 = v47;
  CGRectDivide(v47, &slice, &v44, self->_headerHeight, CGRectMinYEdge);
  -[PKPassHeaderView setFrame:](self->_passHeaderView, "setFrame:", slice.origin.x + self->_headerContentInset.left, slice.origin.y + self->_headerContentInset.top, slice.size.width - (self->_headerContentInset.left + self->_headerContentInset.right), slice.size.height - (self->_headerContentInset.top + self->_headerContentInset.bottom));
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
  if (self->_titleOpacity != v41)
  {
    self->_titleOpacity = v41;
    objc_msgSend(v4, "standardAppearance");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "copy");

    -[PKBarcodePassDetailViewController _updateStandardAppearance:](self, "_updateStandardAppearance:", v43);
    objc_msgSend(v4, "setStandardAppearance:", v43);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKBarcodePassDetailViewController;
  -[PKBarcodePassDetailViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[PKBarcodePassDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");
  objc_msgSend(v3, "_moveContentSubview:toBack:", self->_headerView, 0);
  -[UIView setFrame:](self->_headerView, "setFrame:", self->_headerFrame.origin.x, self->_headerFrame.origin.y, self->_headerFrame.size.width, self->_headerFrame.size.height);

}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  BOOL v5;
  void *v6;
  void *v7;

  switch(a3)
  {
    case 0uLL:
      return -[PKBarcodePassDetailViewController _linkedAppAvailable](self, "_linkedAppAvailable");
    case 1uLL:
      return -[PKBarcodePassDetailViewController _settingsAvailable](self, "_settingsAvailable");
    case 2uLL:
      if (PKValueAddedServicesEnabledForPass())
        return 1;
      if (!PKIsPairedWithWatch()
        || !-[PKPass hasValidNFCPayload](self->_pass, "hasValidNFCPayload"))
      {
        return 0;
      }
      return -[PKPass isValid](self->_pass, "isValid");
    case 3uLL:
      return (self->_suppressedContent & 1) == 0;
    case 4uLL:
      if ((self->_suppressedContent & 0x100) != 0)
        return 0;
      return -[PKBarcodePassDetailViewController _personalizeAvailable](self, "_personalizeAvailable");
    case 5uLL:
      if ((self->_suppressedContent & 0x80) != 0 || !PKValueAddedServicesEnabledForPass())
        return 0;
      -[PKPass barcode](self->_pass, "barcode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6 != 0;

      return v5;
    case 6uLL:
      -[PKBarcodePassDetailViewController _relevantBuckets](self, "_relevantBuckets");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "count") != 0;

      return v5;
    default:
      return 0;
  }
}

- (void)reloadSection:(unint64_t)a3
{
  PKBarcodeTableViewCell *barcodeCell;
  PKSettingTableCell *automaticUpdatesCell;
  PKSettingTableCell *showNotificationsCell;
  PKSettingTableCell *showInLockScreenCell;
  objc_super v9;

  switch(a3)
  {
    case 1uLL:
      automaticUpdatesCell = self->_automaticUpdatesCell;
      self->_automaticUpdatesCell = 0;

      showNotificationsCell = self->_showNotificationsCell;
      self->_showNotificationsCell = 0;

      showInLockScreenCell = self->_showInLockScreenCell;
      self->_showInLockScreenCell = 0;

      self->_showsLinks = (self->_suppressedContent & 0x10) == 0;
      break;
    case 6uLL:
      -[NSMutableDictionary removeAllObjects](self->_fieldCellsByRow, "removeAllObjects");
      break;
    case 5uLL:
      barcodeCell = self->_barcodeCell;
      self->_barcodeCell = 0;

      break;
  }
  v9.receiver = self;
  v9.super_class = (Class)PKBarcodePassDetailViewController;
  -[PKSectionTableViewController reloadSection:](&v9, sel_reloadSection_, a3);
}

- (void)reloadSections:(id)a3
{
  id v4;
  PKBarcodeTableViewCell *barcodeCell;
  PKSettingTableCell *automaticUpdatesCell;
  PKSettingTableCell *showNotificationsCell;
  PKSettingTableCell *showInLockScreenCell;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "containsObject:", &unk_1E3FACE80))
  {
    barcodeCell = self->_barcodeCell;
    self->_barcodeCell = 0;

  }
  if (objc_msgSend(v4, "containsObject:", &unk_1E3FACE98))
    -[NSMutableDictionary removeAllObjects](self->_fieldCellsByRow, "removeAllObjects");
  if (objc_msgSend(v4, "containsObject:", &unk_1E3FACEB0))
  {
    automaticUpdatesCell = self->_automaticUpdatesCell;
    self->_automaticUpdatesCell = 0;

    showNotificationsCell = self->_showNotificationsCell;
    self->_showNotificationsCell = 0;

    showInLockScreenCell = self->_showInLockScreenCell;
    self->_showInLockScreenCell = 0;

    self->_showsLinks = (self->_suppressedContent & 0x10) == 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)PKBarcodePassDetailViewController;
  -[PKSectionTableViewController reloadSections:](&v9, sel_reloadSections_, v4);

}

- (BOOL)reloadData
{
  PKSettingTableCell *automaticUpdatesCell;
  PKSettingTableCell *showNotificationsCell;
  PKSettingTableCell *showInLockScreenCell;
  PKBarcodeTableViewCell *barcodeCell;
  objc_super v8;

  automaticUpdatesCell = self->_automaticUpdatesCell;
  self->_automaticUpdatesCell = 0;

  showNotificationsCell = self->_showNotificationsCell;
  self->_showNotificationsCell = 0;

  showInLockScreenCell = self->_showInLockScreenCell;
  self->_showInLockScreenCell = 0;

  barcodeCell = self->_barcodeCell;
  self->_barcodeCell = 0;

  self->_showsLinks = (self->_suppressedContent & 0x10) == 0;
  -[NSMutableDictionary removeAllObjects](self->_fieldCellsByRow, "removeAllObjects");
  v8.receiver = self;
  v8.super_class = (Class)PKBarcodePassDetailViewController;
  return -[PKSectionTableViewController reloadData](&v8, sel_reloadData);
}

- (int64_t)rowAnimationForReloadingSection:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 1)
    return 100;
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)PKBarcodePassDetailViewController;
  return -[PKSectionTableViewController rowAnimationForReloadingSection:](&v6, sel_rowAnimationForReloadingSection_);
}

- (BOOL)_updateHeaderHeight
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double headerHeight;
  double v12;
  UIEdgeInsets *p_headerContentInset;
  CGFloat *p_right;
  BOOL v17;
  double bottom;

  v3 = *MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  -[PKBarcodePassDetailViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "separatorInset");
  v7 = fmax(v6, 10.0);
  objc_msgSend(v5, "bounds");
  -[PKPassHeaderView sizeThatFits:](self->_passHeaderView, "sizeThatFits:", v8 - v7 - v7, 69.0);
  v10 = fmax(v9, 0.0);
  headerHeight = self->_headerHeight;
  v12 = v4 + v10;
  self->_headerHeight = v12;
  p_headerContentInset = &self->_headerContentInset;
  if (headerHeight != v12)
  {
    p_headerContentInset->top = v3;
    self->_headerContentInset.left = v7;
    p_right = &self->_headerContentInset.right;
LABEL_11:
    self->_headerContentInset.bottom = v4;
    *p_right = v7;
    goto LABEL_12;
  }
  p_right = &self->_headerContentInset.right;
  if (self->_headerContentInset.left != v7 || p_headerContentInset->top != v3 || self->_headerContentInset.right != v7)
  {
    p_headerContentInset->top = v3;
    self->_headerContentInset.left = v7;
    goto LABEL_11;
  }
  bottom = self->_headerContentInset.bottom;
  p_headerContentInset->top = v3;
  self->_headerContentInset.left = v7;
  self->_headerContentInset.bottom = v4;
  self->_headerContentInset.right = v7;
  if (bottom == v4)
  {
    v17 = 0;
    goto LABEL_13;
  }
LABEL_12:
  -[UIView bounds](self->_headerView, "bounds");
  -[UIView setBounds:](self->_headerView, "setBounds:");
  objc_msgSend(v5, "setTableHeaderView:", 0);
  objc_msgSend(v5, "setTableHeaderView:", self->_headerView);
  v17 = 1;
LABEL_13:

  return v17;
}

- (double)_offscreenHeaderHeight
{
  return self->_headerHeight;
}

- (id)linkedApp
{
  PKLinkedAppView *linkedApp;
  PKLinkedAppView *v4;
  void *v5;
  void *v6;
  void *v7;
  PKLinkedAppView *v8;
  PKLinkedAppView *v9;
  void *v10;
  PKLinkedAppView *v11;
  void *v12;

  linkedApp = self->_linkedApp;
  if (!linkedApp)
  {
    v4 = [PKLinkedAppView alloc];
    -[PKPass storeIdentifiers](self->_pass, "storeIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPass systemAppBundleIdentifiers](self->_pass, "systemAppBundleIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPass appLaunchURL](self->_pass, "appLaunchURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKLinkedAppView initWithStoreIDs:systemAppBundleIdentifiers:appLaunchURL:reuseIdentifier:](v4, "initWithStoreIDs:systemAppBundleIdentifiers:appLaunchURL:reuseIdentifier:", v5, v6, v7, 0);
    v9 = self->_linkedApp;
    self->_linkedApp = v8;

    -[PKLinkedAppView linkedAppView](self->_linkedApp, "linkedAppView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

    v11 = self->_linkedApp;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKLinkedAppView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    linkedApp = self->_linkedApp;
  }
  return linkedApp;
}

- (void)setShowsLinks:(BOOL)a3
{
  _BOOL8 v3;
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

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  self->_showsLinks = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_fieldCellsByRow, "allValues", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setShowLinks:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_wifiChanged:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  UIView *locationHelpView;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CFA310]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (self->_isWifiEnabled != v6)
  {
    self->_isWifiEnabled = v6;
    locationHelpView = self->_locationHelpView;
    self->_locationHelpView = 0;

    -[PKBarcodePassDetailViewController reloadData](self, "reloadData");
  }
}

- (BOOL)_isBluetoothEnabled
{
  if (-[BluetoothManager available](self->_btManager, "available"))
    return -[BluetoothManager enabled](self->_btManager, "enabled");
  else
    return self->_isBluetoothEnabled;
}

- (void)_bluetoothPowerChanged:(id)a3
{
  int v4;
  UIView *locationHelpView;

  v4 = -[BluetoothManager available](self->_btManager, "available", a3);
  if (v4)
    v4 = -[BluetoothManager enabled](self->_btManager, "enabled");
  if (self->_isBluetoothEnabled != v4)
  {
    self->_isBluetoothEnabled = v4;
    locationHelpView = self->_locationHelpView;
    self->_locationHelpView = 0;

    -[PKBarcodePassDetailViewController reloadData](self, "reloadData");
  }
}

- (id)_locationHelpTextWithLink:(id *)a3 linkRange:(_NSRange *)a4
{
  _BOOL4 showsLinks;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  char v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSUInteger v25;
  NSUInteger v26;

  showsLinks = self->_showsLinks;
  -[PKPass embeddedBeacons](self->_pass, "embeddedBeacons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = objc_msgSend(MEMORY[0x1E0C9E3C8], "isRangingAvailable");
  if (!showsLinks)
  {
    if (v9)
      v15 = v10;
    else
      v15 = 1;
    if ((v15 & 1) == 0)
    {
LABEL_35:
      v16 = CFSTR("SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_BTLE");
      goto LABEL_36;
    }
LABEL_14:
    v16 = CFSTR("SETTINGS_SHOW_ON_LOCKSCREEN_DESC");
LABEL_36:
    PKLocalizedString(&v16->isa);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v23 = v21;
    goto LABEL_37;
  }
  if (self->_isLocationEnabled)
  {
    if (self->_isWifiEnabled)
    {
      if (v9)
      {
        if (self->_isBluetoothEnabled)
          v11 = 0;
        else
          v11 = v10;
        if (v11 == 1)
        {
          PKLocalizedString(CFSTR("SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_BLUETOOTH"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = CFSTR("prefs:root=Bluetooth");
          v14 = CFSTR("SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_BLUETOOTH_LINK");
          goto LABEL_28;
        }
        if (!v10)
          goto LABEL_35;
      }
      goto LABEL_14;
    }
    if (PKUseWLAN())
      v17 = CFSTR("SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_WLAN");
    else
      v17 = CFSTR("SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_WIFI");
    PKLocalizedString(&v17->isa);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (PKUseWLAN())
      v14 = CFSTR("SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_WLAN_LINK");
    else
      v14 = CFSTR("SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_WIFI_LINK");
    v13 = CFSTR("prefs:root=WIFI");
  }
  else if (self->_isWifiEnabled)
  {
    PKLocalizedString(CFSTR("SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_LOCATION_SERVICES"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("prefs:root=Privacy&path=LOCATION");
    v14 = CFSTR("SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_LOCATION_SERVICES_LINK");
  }
  else
  {
    if (PKUseWLAN())
      v18 = CFSTR("SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_WLAN_RELEVANCY");
    else
      v18 = CFSTR("SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_RELEVANCY");
    PKLocalizedString(&v18->isa);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("prefs:root=ROOT");
    v14 = CFSTR("SETTINGS_SHOW_ON_LOCKSCREEN_DESC_NO_RELEVANCY_LINK");
  }
LABEL_28:
  PKLocalizedString(&v14->isa);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v12;
  v21 = v20;
  if (v19)
  {
    objc_msgSend(v20, "stringByAppendingString:", CFSTR(" "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingString:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
      *a3 = v13;
    if (a4)
    {
      v24 = objc_msgSend(v23, "length");
      v25 = v24 - objc_msgSend(v19, "length");
      v26 = objc_msgSend(v19, "length");
      a4->location = v25;
      a4->length = v26;
    }
  }
  else
  {
    v23 = v20;
  }
LABEL_37:

  return v23;
}

- (id)_locationHelpViewForTableView:(id)a3
{
  UIView *locationHelpView;
  void *v5;
  id v6;
  PKFooterHyperlinkView *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  UIView *v12;
  id v14;
  uint64_t v15;
  uint64_t v16;

  locationHelpView = self->_locationHelpView;
  if (!locationHelpView)
  {
    v15 = 0;
    v16 = 0;
    v14 = 0;
    -[PKBarcodePassDetailViewController _locationHelpTextWithLink:linkRange:](self, "_locationHelpTextWithLink:linkRange:", &v14, &v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14;
    v7 = objc_alloc_init(PKFooterHyperlinkView);
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PKAttributedStringByAddingLinkToRange(v5, v15, v16, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKFooterHyperlinkView setAttributedText:](v7, "setAttributedText:", v9);

      v10 = &__block_literal_global_46;
      v11 = &__block_literal_global_46;
      -[PKFooterHyperlinkView setAction:](v7, "setAction:", &__block_literal_global_46);
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v5);
      -[PKFooterHyperlinkView setAttributedText:](v7, "setAttributedText:", v10);
    }

    v12 = self->_locationHelpView;
    self->_locationHelpView = &v7->super.super;

    locationHelpView = self->_locationHelpView;
  }
  return locationHelpView;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0CA5878];
  v7 = a4;
  objc_msgSend(v6, "defaultWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "openSensitiveURL:withOptions:", v7, 0);

  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;
  void *v6;
  void *v7;
  int64_t v8;

  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4))
  {
    case 0uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      result = 1;
      break;
    case 1uLL:
      result = -[PKBarcodePassDetailViewController _numberOfAvailableSettings](self, "_numberOfAvailableSettings");
      break;
    case 6uLL:
      -[PKBarcodePassDetailViewController _relevantBuckets](self, "_relevantBuckets");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      result = v8;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v5, "section")))
  {
    case 0uLL:
      -[PKBarcodePassDetailViewController linkedApp](self, "linkedApp");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1uLL:
      -[PKBarcodePassDetailViewController _settingsCellForRow:](self, "_settingsCellForRow:", objc_msgSend(v5, "row"));
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2uLL:
      -[PKBarcodePassDetailViewController _automaticSelectionCell](self, "_automaticSelectionCell");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3uLL:
      -[PKBarcodePassDetailViewController _deleteCell](self, "_deleteCell");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4uLL:
      -[PKBarcodePassDetailViewController _personalizePassCell](self, "_personalizePassCell");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5uLL:
      -[PKBarcodePassDetailViewController _barcodeCell](self, "_barcodeCell");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 6uLL:
      -[PKBarcodePassDetailViewController _fieldCellForRow:](self, "_fieldCellForRow:", objc_msgSend(v5, "row"));
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v7 = (void *)v6;
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double y;

  v7 = a3;
  objc_msgSend(v7, "adjustedContentInset");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "contentSize");
  v13 = v12;
  objc_msgSend(v7, "bounds");
  v15 = v14;

  -[PKBarcodePassDetailViewController _offscreenHeaderHeight](self, "_offscreenHeaderHeight");
  if (v11 + v9 + v13 >= v16 + v15)
  {
    v17 = v16 - v9;
    y = a5->y;
    if (y > -v9 && y < v17)
    {
      if ((v9 + y) / (v9 + v17) <= 0.5)
        v17 = -v9;
      a5->y = v17;
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[PKBarcodePassDetailViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  PKPass *pass;
  id WeakRetained;
  PKPass *v11;
  void *v12;
  PKPass *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section"));
  if (v8 == 4)
  {
    v11 = self->_pass;
    -[PKPass passTypeIdentifier](v11, "passTypeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __71__PKBarcodePassDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v17 = &unk_1E3E672A8;
    v13 = v11;
    PKPassPersonalizationRequestToken();

  }
  else if (v8 == 3)
  {
    pass = self->_pass;
    WeakRetained = objc_loadWeakRetained((id *)&self->_deleteOverrider);
    +[PKPassDeleteHelper presentDeleteBarcodePassAlertForPass:withHandler:presentingViewController:](PKPassDeleteHelper, "presentDeleteBarcodePassAlertForPass:withHandler:presentingViewController:", pass, WeakRetained, self);

  }
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1, v14, v15, v16, v17);

}

void __71__PKBarcodePassDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKBarcodePassDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  block[3] = &unk_1E3E61400;
  v8 = v3;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __71__PKBarcodePassDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKPassPersonalizationViewController *v10;

  if (*(_QWORD *)(a1 + 32))
  {
    v10 = -[PKPassPersonalizationViewController initWithPass:personalizationToken:personalizationSource:]([PKPassPersonalizationViewController alloc], "initWithPass:personalizationToken:personalizationSource:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 3);
    objc_msgSend(*(id *)(a1 + 48), "presentingViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PKPassPersonalizationViewController setDelegate:](v10, "setDelegate:", v2);
      objc_msgSend(*(id *)(a1 + 48), "navigationController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pushViewController:animated:", v10, 1);

    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedString(CFSTR("PERSONALIZATION_UNSUPPORTED_ALERT_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedString(CFSTR("PERSONALIZATION_UNSUPPORTED_ALERT_MESSAGE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
    v10 = (PKPassPersonalizationViewController *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassPersonalizationViewController addAction:](v10, "addAction:", v9);

    objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v10, 1, 0);
  }

}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  if (v5 == 4)
  {
    -[PKPass personalization](self->_pass, "personalization");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedDescription");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5 != 2)
    {
      v8 = 0;
      return v8;
    }
    -[PKPass organizationName](self->_pass, "organizationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedString(CFSTR("SETTINGS_AUTOMATIC_PRESENTATION_DESC"), CFSTR("%@"), v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;

  v6 = a3;
  if (a4 > 0
    || (-[PKBarcodePassDetailViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v6, a4), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v7, "length"), v7, v8))
  {
    objc_msgSend(v6, "sectionHeaderHeight");
    v10 = v9;
  }
  else
  {
    v10 = 36.0;
  }

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  if (a4 > 0
    || (-[PKBarcodePassDetailViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v6, a4), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v7, "length"), v7, v8))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("FirstSectionHeaderReuseIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  double v7;
  double v8;

  v6 = a3;
  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4) == 1
    && -[PKPass hasTimeOrLocationRelevancyInfo](self->_pass, "hasTimeOrLocationRelevancyInfo"))
  {
    v7 = *MEMORY[0x1E0DC53D8];
  }
  else
  {
    objc_msgSend(v6, "sectionFooterHeight");
    v7 = v8;
  }

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4) == 1
    && -[PKPass hasTimeOrLocationRelevancyInfo](self->_pass, "hasTimeOrLocationRelevancyInfo"))
  {
    -[PKBarcodePassDetailViewController _locationHelpViewForTableView:](self, "_locationHelpViewForTableView:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  unint64_t v7;
  double v8;
  double v9;

  v6 = a3;
  v7 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(a4, "section"));
  if (v7 && v7 - 5 > 1)
  {
    objc_msgSend(v6, "rowHeight");
    v8 = v9;
  }
  else
  {
    v8 = *MEMORY[0x1E0DC53D8];
  }

  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6;
  unint64_t v7;
  double v8;
  double v9;

  v6 = a3;
  v7 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(a4, "section"));
  if (v7 && v7 - 5 > 1)
  {
    objc_msgSend(v6, "rowHeight");
    v8 = v9;
  }
  else
  {
    v8 = *MEMORY[0x1E0DC53D8];
  }

  return v8;
}

- (void)_reloadPassAndView
{
  PKPass *v3;
  PKPass *pass;

  -[PKPassHeaderView pass](self->_passHeaderView, "pass");
  v3 = (PKPass *)objc_claimAutoreleasedReturnValue();
  pass = self->_pass;
  self->_pass = v3;

  -[PKBarcodePassDetailViewController _updatePassProperties](self, "_updatePassProperties");
}

- (BOOL)handleDeletePassWithUniqueID:(id)a3
{
  PKPass *pass;
  id v5;
  void *v6;
  int v7;
  PKPass *v8;
  id WeakRetained;

  pass = self->_pass;
  v5 = a3;
  -[PKPass uniqueID](pass, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PKEqualObjects();

  if (v7)
  {
    v8 = self->_pass;
    WeakRetained = objc_loadWeakRetained((id *)&self->_deleteOverrider);
    +[PKPassDeleteHelper presentDeleteBarcodePassAlertForPass:withHandler:presentingViewController:](PKPassDeleteHelper, "presentDeleteBarcodePassAlertForPass:withHandler:presentingViewController:", v8, WeakRetained, self);

  }
  return v7;
}

- (void)setSuppressedContent:(unint64_t)a3
{
  if (self->_suppressedContent != a3)
  {
    self->_suppressedContent = a3;
    -[PKPassHeaderView setSuppressedContent:](self->_passHeaderView, "setSuppressedContent:");
    -[PKBarcodePassDetailViewController _updateNavigationItem](self, "_updateNavigationItem");
    -[PKBarcodePassDetailViewController reloadData](self, "reloadData");
  }
}

- (void)_done:(id)a3
{
  -[PKBarcodePassDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_sharePass
{
  void *v3;
  PKPass *pass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKPass *v9;
  PKPass *v10;
  _QWORD v11[4];
  PKPass *v12;

  -[PKBarcodePassDetailViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v3 = (void *)MEMORY[0x1E0D96D28];
  pass = self->_pass;
  -[PKPassHeaderView passView](self->_passHeaderView, "passView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKLinkedAppView linkedAppView](self->_linkedApp, "linkedAppView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "linkedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_activityControllerForPass:passView:passLinkedApplication:", pass, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = self->_pass;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __47__PKBarcodePassDetailViewController__sharePass__block_invoke;
    v11[3] = &unk_1E3E62C38;
    v12 = v9;
    v10 = v9;
    objc_msgSend(v8, "setCompletionWithItemsHandler:", v11);
    -[PKBarcodePassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

void __47__PKBarcodePassDetailViewController__sharePass__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "noteShared");
    v6 = *MEMORY[0x1E0D68348];
    v8 = CFSTR("activity");
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AE3A74](v6, v7);

  }
  else
  {
    MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68350], 0);
  }

}

- (unint64_t)_numberOfAvailableSettings
{
  uint64_t v3;

  if (-[PKPass isUpdatable](self->_pass, "isUpdatable"))
  {
    if ((-[PKPass settings](self->_pass, "settings") & 2) != 0)
      v3 = 2;
    else
      v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 + -[PKPass hasTimeOrLocationRelevancyInfo](self->_pass, "hasTimeOrLocationRelevancyInfo");
}

- (void)_updatePassProperties
{
  id v3;

  -[PKBarcodePassDetailViewController reloadData](self, "reloadData");
  -[PKBarcodePassDetailViewController _updateNavigationItem](self, "_updateNavigationItem");
  -[PKBarcodePassDetailViewController _updateHeaderHeight](self, "_updateHeaderHeight");
  -[PKBarcodePassDetailViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)_updateNavigationItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PKBarcodePassDetailViewController navigationItem](self, "navigationItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_showDoneButton)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedString(CFSTR("DONE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 2, self, sel__done_);

  }
  else
  {
    v5 = 0;
  }
  if ((self->_suppressedContent & 2) != 0
    || !-[PKPass supportsSharing](self->_pass, "supportsSharing")
    || -[PKPass sharingMethod](self->_pass, "sharingMethod") == -1)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, self, sel__sharePass);
    objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68048]);
  }
  -[PKPass localizedDescription](self->_pass, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v7);

  objc_msgSend(v8, "setRightBarButtonItem:", v6);
  objc_msgSend(v8, "setLeftBarButtonItem:", v5);

}

- (void)_updateStandardAppearance:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0DC1140];
  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", self->_titleOpacity);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleTextAttributes:", v8);

}

- (BOOL)_linkedAppAvailable
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PKPass storeIdentifiers](self->_pass, "storeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[PKPass systemAppBundleIdentifiers](self->_pass, "systemAppBundleIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (BOOL)_settingsAvailable
{
  if ((-[PKPass isUpdatable](self->_pass, "isUpdatable") & 1) != 0)
    return 1;
  else
    return -[PKPass hasTimeOrLocationRelevancyInfo](self->_pass, "hasTimeOrLocationRelevancyInfo");
}

- (BOOL)_personalizeAvailable
{
  return -[PKPass isPersonalizable](self->_pass, "isPersonalizable");
}

- (id)_automaticSelectionCell
{
  PKSettingTableCell *automaticSelectionCell;
  PKSettingTableCell *v4;
  void *v5;
  PKSettingTableCell *v6;
  PKSettingTableCell *v7;

  automaticSelectionCell = self->_automaticSelectionCell;
  if (!automaticSelectionCell)
  {
    v4 = [PKSettingTableCell alloc];
    PKLocalizedString(CFSTR("SETTINGS_AUTOMATIC_PRESENTATION_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKSettingTableCell initWithTitle:target:action:](v4, "initWithTitle:target:action:", v5, 0, 0);
    v7 = self->_automaticSelectionCell;
    self->_automaticSelectionCell = v6;

    -[PKSettingTableCell setOn:](self->_automaticSelectionCell, "setOn:", ((unint64_t)-[PKPass settings](self->_pass, "settings") >> 4) & 1);
    -[PKSettingTableCell setTarget:action:](self->_automaticSelectionCell, "setTarget:action:", self, sel_pushSettingsFromViewToModel);
    automaticSelectionCell = self->_automaticSelectionCell;
  }
  -[PKSettingTableCell setAccessibilityIdentifier:](automaticSelectionCell, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678F8]);
  return self->_automaticSelectionCell;
}

- (id)_deleteCell
{
  UITableViewCell *deleteCell;
  UITableViewCell *v4;
  UITableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;

  deleteCell = self->_deleteCell;
  if (!deleteCell)
  {
    v4 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_deleteCell;
    self->_deleteCell = v4;

    -[UITableViewCell textLabel](self->_deleteCell, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedString(CFSTR("REMOVE_PASS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v8);

    objc_msgSend(v6, "setTextAlignment:", 4);
    deleteCell = self->_deleteCell;
  }
  -[UITableViewCell setAccessibilityIdentifier:](deleteCell, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F60]);
  return self->_deleteCell;
}

- (id)_barcodeCell
{
  PKBarcodeTableViewCell *barcodeCell;
  PKBarcodeTableViewCell *v4;
  PKBarcodeTableViewCell *v5;

  barcodeCell = self->_barcodeCell;
  if (!barcodeCell)
  {
    v4 = -[PKBarcodeTableViewCell initWithStyle:reuseIdentifier:]([PKBarcodeTableViewCell alloc], "initWithStyle:reuseIdentifier:", -[PKPass style](self->_pass, "style") == 4, CFSTR("PKBarcodeTableViewCellReuseIdentifier"));
    v5 = self->_barcodeCell;
    self->_barcodeCell = v4;

    -[PKBarcodeTableViewCell setPass:](self->_barcodeCell, "setPass:", self->_pass);
    barcodeCell = self->_barcodeCell;
  }
  -[PKBarcodeTableViewCell setAccessibilityIdentifier:](barcodeCell, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67938]);
  return self->_barcodeCell;
}

- (id)_personalizePassCell
{
  UITableViewCell *personalizePassCell;
  UITableViewCell *v4;
  UITableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  personalizePassCell = self->_personalizePassCell;
  if (!personalizePassCell)
  {
    v4 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_personalizePassCell;
    self->_personalizePassCell = v4;

    -[UITableViewCell textLabel](self->_personalizePassCell, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedString(CFSTR("PERSONALIZATION_BACK_OF_PASS_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

    -[UITableViewCell textLabel](self->_personalizePassCell, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v9);

    -[UITableViewCell textLabel](self->_personalizePassCell, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextAlignment:", 4);

    personalizePassCell = self->_personalizePassCell;
  }
  -[UITableViewCell setAccessibilityIdentifier:](personalizePassCell, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67860]);
  return self->_personalizePassCell;
}

- (unint64_t)_settingForRow:(unint64_t)a3
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  if (-[PKPass isUpdatable](self->_pass, "isUpdatable"))
  {
    v5 = -[PKPass settings](self->_pass, "settings");
    v6 = 0;
    if ((v5 & 2) != 0)
      v7 = 1;
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    if ((v5 & 2) != 0)
      v8 = 2;
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v9 = -[PKPass hasTimeOrLocationRelevancyInfo](self->_pass, "hasTimeOrLocationRelevancyInfo");
  if (v9)
    v10 = v8;
  else
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 + (unint64_t)v9 <= a3)
    return 0;
  if (v6 == a3)
    return 2;
  if (v7 == a3)
    return 128;
  return v10 == a3;
}

- (id)_settingsCellForRow:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  id *p_showInLockScreenCell;
  PKSettingTableCell *showInLockScreenCell;
  PKSettingTableCell *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  PKSettingTableCell *v14;
  void *v15;
  uint64_t v16;
  id v17;
  PKSettingTableCell *v18;
  PKSettingTableCell *v19;
  void *v20;
  uint64_t v21;
  id v22;

  v4 = -[PKBarcodePassDetailViewController _settingForRow:](self, "_settingForRow:", a3);
  v5 = -[PKPass settings](self->_pass, "settings");
  switch(v4)
  {
    case 1uLL:
      p_showInLockScreenCell = (id *)&self->_showInLockScreenCell;
      showInLockScreenCell = self->_showInLockScreenCell;
      if (!showInLockScreenCell)
      {
        v14 = [PKSettingTableCell alloc];
        PKLocalizedString(CFSTR("SETTINGS_SHOW_ON_LOCKSCREEN_TITLE"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[PKSettingTableCell initWithTitle:target:action:](v14, "initWithTitle:target:action:", v15, 0, 0);
        v17 = *p_showInLockScreenCell;
        *p_showInLockScreenCell = (id)v16;

        objc_msgSend(*p_showInLockScreenCell, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680D0]);
        v12 = *p_showInLockScreenCell;
        v13 = v5 & 1;
        goto LABEL_12;
      }
      break;
    case 0x80uLL:
      p_showInLockScreenCell = (id *)&self->_showNotificationsCell;
      showInLockScreenCell = self->_showNotificationsCell;
      if (!showInLockScreenCell)
      {
        v19 = [PKSettingTableCell alloc];
        PKLocalizedString(CFSTR("SETTINGS_SHOW_NOTIFICATIONS_TITLE"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[PKSettingTableCell initWithTitle:target:action:](v19, "initWithTitle:target:action:", v20, 0, 0);
        v22 = *p_showInLockScreenCell;
        *p_showInLockScreenCell = (id)v21;

        objc_msgSend(*p_showInLockScreenCell, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67898]);
        v12 = *p_showInLockScreenCell;
        v13 = (v5 & 0x80) == 0;
        goto LABEL_12;
      }
      break;
    case 2uLL:
      p_showInLockScreenCell = (id *)&self->_automaticUpdatesCell;
      showInLockScreenCell = self->_automaticUpdatesCell;
      if (!showInLockScreenCell)
      {
        v8 = [PKSettingTableCell alloc];
        PKLocalizedString(CFSTR("SETTINGS_NOTIFY_ME_TITLE"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[PKSettingTableCell initWithTitle:target:action:](v8, "initWithTitle:target:action:", v9, 0, 0);
        v11 = *p_showInLockScreenCell;
        *p_showInLockScreenCell = (id)v10;

        objc_msgSend(*p_showInLockScreenCell, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67900]);
        v12 = *p_showInLockScreenCell;
        v13 = (v5 >> 1) & 1;
LABEL_12:
        objc_msgSend(v12, "setOn:", v13);
        v18 = (PKSettingTableCell *)*p_showInLockScreenCell;
        -[PKSettingTableCell setTarget:action:](v18, "setTarget:action:", self, sel_pushSettingsFromViewToModel);
        return v18;
      }
      break;
    default:
      v18 = 0;
      return v18;
  }
  v18 = showInLockScreenCell;
  return v18;
}

- (id)_fieldCellForRow:(unint64_t)a3
{
  NSMutableDictionary *fieldCellsByRow;
  void *v6;
  PKBackFieldTableCell *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;

  fieldCellsByRow = self->_fieldCellsByRow;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](fieldCellsByRow, "objectForKey:", v6);
  v7 = (PKBackFieldTableCell *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = -[PKBackFieldTableCell initWithBridgeStyle:reuseIdentifier:]([PKBackFieldTableCell alloc], "initWithBridgeStyle:reuseIdentifier:", 0, CFSTR("PKBackFieldTableCell"));
    -[PKBackFieldTableCell setShowLinks:](v7, "setShowLinks:", self->_showsLinks);
    -[PKBarcodePassDetailViewController _fieldForRow:](self, "_fieldForRow:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBackFieldTableCell setField:](v7, "setField:", v8);

    v9 = self->_fieldCellsByRow;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v7, v10);

  }
  return v7;
}

- (id)_fieldForRow:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PKBarcodePassDetailViewController _relevantBuckets](self, "_relevantBuckets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)refreshControlValueChanged:(id)a3
{
  id v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *refreshTimeout;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  uint64_t v10;
  PKPass *pass;
  _QWORD v12[5];
  id v13;
  _QWORD handler[5];
  id v15;
  _QWORD v16[3];
  char v17;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "isRefreshing"))
  {
    objc_initWeak(&location, self);
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v17 = 0;
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    refreshTimeout = self->_refreshTimeout;
    self->_refreshTimeout = v5;

    v7 = self->_refreshTimeout;
    v8 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v9 = self->_refreshTimeout;
    v10 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __64__PKBarcodePassDetailViewController_refreshControlValueChanged___block_invoke;
    handler[3] = &unk_1E3E672D0;
    handler[4] = v16;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v9, handler);
    pass = self->_pass;
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __64__PKBarcodePassDetailViewController_refreshControlValueChanged___block_invoke_2;
    v12[3] = &unk_1E3E67320;
    v12[4] = v16;
    objc_copyWeak(&v13, &location);
    -[PKPass requestUpdateWithCompletion:](pass, "requestUpdateWithCompletion:", v12);
    dispatch_resume((dispatch_object_t)self->_refreshTimeout);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    _Block_object_dispose(v16, 8);
    objc_destroyWeak(&location);
  }

}

void __64__PKBarcodePassDetailViewController_refreshControlValueChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_refreshFinished:", 1);

  }
}

void __64__PKBarcodePassDetailViewController_refreshControlValueChanged___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD block[5];
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKBarcodePassDetailViewController_refreshControlValueChanged___block_invoke_3;
  block[3] = &unk_1E3E672F8;
  block[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __64__PKBarcodePassDetailViewController_refreshControlValueChanged___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_refreshFinished:", *(_BYTE *)(a1 + 48) == 0);
    goto LABEL_5;
  }
  v3 = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    WeakRetained = v3;
    objc_msgSend(v3[164], "updateModifiedDate");
LABEL_5:
    v3 = (id *)WeakRetained;
  }

}

- (void)_refreshFinished:(BOOL)a3
{
  NSObject *refreshTimeout;
  OS_dispatch_source *v5;

  refreshTimeout = self->_refreshTimeout;
  if (refreshTimeout)
  {
    dispatch_source_cancel(refreshTimeout);
    v5 = self->_refreshTimeout;
    self->_refreshTimeout = 0;

  }
  -[UIRefreshControl endRefreshing](self->_refreshControl, "endRefreshing", a3);
  -[PKPassHeaderView updateModifiedDate](self->_passHeaderView, "updateModifiedDate");
}

- (BOOL)shouldAllowRefresh
{
  void *v3;
  void *v4;
  char isKindOfClass;

  -[PKPass webServiceURL](self->_pass, "webServiceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PKPass dataAccessor](self->_pass, "dataAccessor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)_relevantBuckets
{
  return (id)-[PKPass backFieldBuckets](self->_pass, "backFieldBuckets");
}

- (void)pushSettingsFromViewToModel
{
  uint64_t v3;
  PKSettingTableCell *automaticUpdatesCell;
  unint64_t v5;
  PKSettingTableCell *showNotificationsCell;
  PKSettingTableCell *showInLockScreenCell;
  PKSettingTableCell *automaticSelectionCell;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = -[PKPass settings](self->_pass, "settings");
  automaticUpdatesCell = self->_automaticUpdatesCell;
  if (automaticUpdatesCell)
  {
    if (-[PKSettingTableCell isOn](automaticUpdatesCell, "isOn"))
      v5 = v3 | 2;
    else
      v5 = v3 & 0xFFFFFFFFFFFFFFFDLL;
  }
  else
  {
    v5 = v3;
  }
  showNotificationsCell = self->_showNotificationsCell;
  if (showNotificationsCell)
  {
    if (-[PKSettingTableCell isOn](showNotificationsCell, "isOn"))
      v5 &= ~0x80uLL;
    else
      v5 |= 0x80uLL;
  }
  showInLockScreenCell = self->_showInLockScreenCell;
  if (showInLockScreenCell)
  {
    if (-[PKSettingTableCell isOn](showInLockScreenCell, "isOn"))
      v5 |= 1uLL;
    else
      v5 &= ~1uLL;
  }
  automaticSelectionCell = self->_automaticSelectionCell;
  if (automaticSelectionCell)
  {
    if (-[PKSettingTableCell isOn](automaticSelectionCell, "isOn"))
      v5 |= 0x10uLL;
    else
      v5 &= ~0x10uLL;
  }
  v9 = v5 ^ v3;
  if (((v5 ^ v3) & 2) != 0)
  {
    v10 = *MEMORY[0x1E0D68360];
    v18 = CFSTR("on");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v5 >> 1) & 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AE3A74](v10, v12);

  }
  if ((v9 & 1) != 0)
  {
    v13 = *MEMORY[0x1E0D68358];
    v16 = CFSTR("on");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5 & 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AE3A74](v13, v15);

  }
  -[PKPass setSettings:](self->_pass, "setSettings:", (2 * v9) & 0x20 | v5);
  if ((v9 & 2) != 0)
    -[PKBarcodePassDetailViewController reloadSection:](self, "reloadSection:", 1);
}

- (void)_passSettingsChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[6];

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D6A7F0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass uniqueID](self->_pass, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D6A7E8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_msgSend(v10, "unsignedIntegerValue");
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __58__PKBarcodePassDetailViewController__passSettingsChanged___block_invoke;
      v12[3] = &unk_1E3E62010;
      v12[4] = self;
      v12[5] = v11;
      dispatch_async(MEMORY[0x1E0C80D38], v12);
    }

  }
}

uint64_t __58__PKBarcodePassDetailViewController__passSettingsChanged___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1328), "setSettingsWithoutUpdatingDataAccessor:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1120);
  if (v2)
  {
    v3 = objc_msgSend(v2, "isOn");
    v4 = *(_QWORD *)(a1 + 40) & 2;
    v5 = v3 ^ (*(_QWORD *)(a1 + 40) >> 1) & 1;
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1120);
  }
  else
  {
    v5 = 0;
    v4 = *(_QWORD *)(a1 + 40) & 2;
  }
  objc_msgSend(v2, "setOn:notify:", v4 != 0, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "setOn:notify:", (*(_QWORD *)(a1 + 40) & 0x80) == 0, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setOn:notify:", *(_DWORD *)(a1 + 40) & 1, 0);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "setOn:notify:", (*(_QWORD *)(a1 + 40) >> 4) & 1, 0);
  if (v5)
    return objc_msgSend(*(id *)(a1 + 32), "reloadSection:", 1);
  return result;
}

- (void)appViewContentSizeChanged:(id)a3
{
  void *v4;
  id v5;

  -[PKBarcodePassDetailViewController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginUpdates");

  -[PKBarcodePassDetailViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endUpdates");

}

- (PKPass)pass
{
  return self->_pass;
}

- (unint64_t)suppressedContent
{
  return self->_suppressedContent;
}

- (PKPassDeleteHandler)deleteOverrider
{
  return (PKPassDeleteHandler *)objc_loadWeakRetained((id *)&self->_deleteOverrider);
}

- (void)setDeleteOverrider:(id)a3
{
  objc_storeWeak((id *)&self->_deleteOverrider, a3);
}

- (BOOL)showDoneButton
{
  return self->_showDoneButton;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deleteOverrider);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_passHeaderView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_btManager, 0);
  objc_storeStrong((id *)&self->_refreshTimeout, 0);
  objc_storeStrong((id *)&self->_fieldCellsByRow, 0);
  objc_storeStrong((id *)&self->_barcodeCell, 0);
  objc_storeStrong((id *)&self->_deleteCell, 0);
  objc_storeStrong((id *)&self->_personalizePassCell, 0);
  objc_storeStrong((id *)&self->_automaticSelectionCell, 0);
  objc_storeStrong((id *)&self->_showInLockScreenCell, 0);
  objc_storeStrong((id *)&self->_showNotificationsCell, 0);
  objc_storeStrong((id *)&self->_automaticUpdatesCell, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_storeStrong((id *)&self->_locationHelpView, 0);
  objc_storeStrong((id *)&self->_linkedApp, 0);
  objc_storeStrong((id *)&self->_colorProfile, 0);
  objc_storeStrong((id *)&self->_displayProfile, 0);
}

@end
