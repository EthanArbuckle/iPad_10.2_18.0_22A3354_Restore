@implementation EditShortcutViewController

- (EditShortcutViewController)initWithShortcutEditSession:(id)a3
{
  id v5;
  EditShortcutViewController *v6;
  EditShortcutViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *originalShortcutName;
  uint64_t v13;
  AddressBookManager *sharedManager;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EditShortcutViewController;
  v6 = -[EditShortcutViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v8, "setPresentedModally:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v7, "cardPresentationController"));
    objc_msgSend(v9, "setTakesAvailableHeight:", 1);

    objc_storeStrong((id *)&v7->_shortcutEditSession, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession shortcut](v7->_shortcutEditSession, "shortcut"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "customName"));
    originalShortcutName = v7->_originalShortcutName;
    v7->_originalShortcutName = (NSString *)v11;

    -[EditShortcutViewController _buildContent](v7, "_buildContent");
    v13 = objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
    sharedManager = v7->_sharedManager;
    v7->_sharedManager = (AddressBookManager *)v13;

  }
  return v7;
}

- (BOOL)allowsOpenContactAction
{
  return !-[EditShortcutViewController _isMapUserShortcut](self, "_isMapUserShortcut");
}

- (BOOL)allowsRefineAction
{
  return !-[EditShortcutViewController _isMapUserShortcut](self, "_isMapUserShortcut");
}

- (BOOL)allowsRemoveAction
{
  return -[ShortcutEditSession alreadySaved](self->_shortcutEditSession, "alreadySaved");
}

- (BOOL)shouldAutoSaveEdit
{
  if (sub_1002A8AA0(self) == 5
    && -[EditShortcutViewController modalPresentationStyle](self, "modalPresentationStyle") != (id)2)
  {
    return !-[EditShortcutViewController openingContactController](self, "openingContactController");
  }
  else
  {
    return 0;
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v6 = a4;
  if ("_doneAction:" == a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutTitleCell titleText](self->_editTitleCell, "titleText"));
    v9 = objc_msgSend(v8, "length") != 0;

  }
  else
  {
    if ("_addPersonAction" == a3)
    {
      v7 = -[EditShortcutViewController allowsAddPersonAction](self, "allowsAddPersonAction");
    }
    else if ("_refineAction" == a3)
    {
      v7 = -[EditShortcutViewController allowsRefineAction](self, "allowsRefineAction");
    }
    else if ("_removeAction" == a3)
    {
      v7 = -[EditShortcutViewController allowsRemoveAction](self, "allowsRemoveAction");
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)EditShortcutViewController;
      v7 = -[EditShortcutViewController canPerformAction:withSender:](&v11, "canPerformAction:withSender:", a3, v6);
    }
    v9 = v7;
  }

  return v9;
}

- (id)keyCommands
{
  unsigned int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[4];

  v3 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("[Shortcut KeyCmd] Unpin");
  else
    v6 = CFSTR("[Shortcut KeyCmd] Remove Favorite");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

  v23.receiver = self;
  v23.super_class = (Class)EditShortcutViewController;
  v8 = -[ContaineeViewController keyCommands](&v23, "keyCommands");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("[Shortcut KeyCmd] Done"), CFSTR("localized string not found"), 0));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v21, 0, "_doneAction:", CFSTR("\r"), 0x100000, 0));
  v24[0] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("[Shortcut KeyCmd] Add Person"), CFSTR("localized string not found"), 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v10, 0, "_addPersonAction", CFSTR("a"), 0x100000, 0));
  v24[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Shortcut KeyCmd] Refine Location"), CFSTR("localized string not found"), 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v13, 0, "_refineAction", CFSTR("r"), 1572864, 0));
  v24[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v7, 0, "_removeAction", CFSTR("\b"), 0x100000, 0));
  v24[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v16));

  return v17;
}

- (id)preferredFocusEnvironments
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EditShortcutViewController;
  -[SimpleContaineeViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("EditShortcutView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)setupSubviews
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ModalCardHeaderView *v19;
  void *v20;
  void *v21;
  void *v22;
  ModalCardHeaderView *v23;
  void *v24;
  ModalCardHeaderView *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  ModalCardHeaderView *modalHeaderView;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_super v57;
  _QWORD v58[4];
  _QWORD v59[4];

  v57.receiver = self;
  v57.super_class = (Class)EditShortcutViewController;
  -[SimpleContaineeViewController setupSubviews](&v57, "setupSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  if (sub_1002A8AA0(self) == 5)
  {
    if (-[EditShortcutViewController modalPresentationStyle](self, "modalPresentationStyle") != (id)2)
      goto LABEL_6;
    v4 = objc_alloc((Class)UINavigationItem);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Details"), CFSTR("localized string not found"), 0));
    v7 = objc_msgSend(v4, "initWithTitle:", v6);

    v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_cancelAction:");
    objc_msgSend(v7, "setLeftBarButtonItem:", v8);

    v9 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_doneAction:");
    v50 = v7;
    objc_msgSend(v7, "setRightBarButtonItem:", v9);

    v10 = objc_alloc_init((Class)UINavigationBar);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "pushNavigationItem:animated:", v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    objc_msgSend(v11, "addSubview:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
    v56 = v12;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v55));
    v58[0] = v54;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
    v53 = v13;
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v52));
    v58[1] = v51;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
    v58[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
    v19 = (ModalCardHeaderView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
    v58[3] = v19;
    v20 = v3;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

    v3 = v20;
    v22 = v50;
  }
  else
  {
    v23 = [ModalCardHeaderView alloc];
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration](ModalCardHeaderConfiguration, "defaultModalCardHeaderConfiguration"));
    v25 = -[ModalCardHeaderView initWithConfiguration:](v23, "initWithConfiguration:", v24);

    -[ModalCardHeaderView setUseAdaptiveFont:](v25, "setUseAdaptiveFont:", 1);
    -[ModalCardHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Details"), CFSTR("localized string not found"), 0));
    -[ModalCardHeaderView setTitle:](v25, "setTitle:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingButton](v25, "leadingButton"));
    v29 = sub_1009A98D8();
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    objc_msgSend(v28, "setTitle:forState:", v30, 0);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingButton](v25, "leadingButton"));
    objc_msgSend(v31, "addTarget:action:forControlEvents:", self, "_cancelAction:", 64);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v25, "trailingButton"));
    v33 = sub_1009A992C();
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    objc_msgSend(v32, "setTitle:forState:", v34, 0);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v25, "trailingButton"));
    objc_msgSend(v35, "addTarget:action:forControlEvents:", self, "_doneAction:", 64);

    objc_msgSend(v3, "addSubview:", v25);
    modalHeaderView = self->_modalHeaderView;
    self->_modalHeaderView = v25;
    v19 = v25;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView topAnchor](v19, "topAnchor"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v10));
    v59[0] = v56;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingAnchor](v19, "leadingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
    v55 = v37;
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v54));
    v59[1] = v53;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingAnchor](v19, "trailingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
    v52 = v38;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v51));
    v59[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView bottomAnchor](v19, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
    v59[3] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);
  }

LABEL_6:
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
  objc_msgSend(v39, "setAccessibilityIdentifier:", CFSTR("EditShortcutActionsTable"));

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
  objc_msgSend(v40, "_setHeaderAndFooterViewsFloat:", 0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
  objc_msgSend(v41, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("EditShortcutActionCell"));

  if (sub_1002A8AA0(self) == 5)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
    objc_msgSend(v42, "setSeparatorStyle:", 0);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController view](self, "view"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "widthAnchor"));
    LODWORD(v45) = 1144733696;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToConstant:priority:", 290.0, v45));
    objc_msgSend(v46, "setActive:", 1);
  }
  else
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController theme](self, "theme"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "groupTableViewHairlineColor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
    objc_msgSend(v46, "setSeparatorColor:", v44);
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
  objc_msgSend(v47, "_maps_registerGroupedHeaderView");

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
  objc_msgSend(v48, "_maps_registerSelectableFooterView");

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
  objc_msgSend(v49, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(MacEditShortcutHeaderFooterView), CFSTR("kMacEditShortcutHeaderFooterIdentifier"));

}

- (void)shoulDismissForVerticalSwipe_nonUIKitCardsOnly
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EditShortcutViewController;
  -[ContaineeViewController shoulDismissForVerticalSwipe_nonUIKitCardsOnly](&v3, "shoulDismissForVerticalSwipe_nonUIKitCardsOnly");
  if (!self->_dismissed)
    -[EditShortcutViewController _close](self, "_close");
}

- (void)handleDismissAction:(id)a3
{
  -[EditShortcutViewController _cancelAction:](self, "_cancelAction:", a3);
}

- (void)didBecomeCurrent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EditShortcutViewController;
  -[ContaineeViewController didBecomeCurrent](&v3, "didBecomeCurrent");
  -[EditShortcutViewController _buildContent](self, "_buildContent");
  if (!-[ShortcutEditSession didResignTitleFocus](self->_shortcutEditSession, "didResignTitleFocus")
    && !-[ShortcutEditSession alreadySaved](self->_shortcutEditSession, "alreadySaved"))
  {
    -[EditShortcutTitleCell makeFirstResponder](self->_editTitleCell, "makeFirstResponder");
  }
}

- (void)resetToMapItemType
{
  -[EditShortcutViewController _updateWithType:](self, "_updateWithType:", 1);
}

- (void)didEditContactWithAddressAdded:(BOOL)a3
{
  double y;
  id v5;

  if (!a3)
    -[EditShortcutViewController resetToMapItemType](self, "resetToMapItemType");
  -[EditShortcutViewController _buildContent](self, "_buildContent");
  y = CGPointZero.y;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
  objc_msgSend(v5, "setContentOffset:", CGPointZero.x, y);

}

- (void)_updateWithType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[ShortcutEditSession setType:](self->_shortcutEditSession, "setType:");
  if ((unint64_t)a3 > 5
    || ((1 << a3) & 0x2C) == 0
    || +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    self->_needsMeCardUpdate = 1;
    -[EditShortcutViewController _buildContent](self, "_buildContent");
    return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController shortcut](self, "shortcut"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geoMapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addressObject"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cnPostalAddress"));

  v8 = v14;
  if (v14)
  {
    switch(a3)
    {
      case 2:
        v9 = (id *)&CNLabelHome;
        break;
      case 5:
        v9 = (id *)&CNLabelSchool;
        break;
      case 3:
        v9 = (id *)&CNLabelWork;
        break;
      default:
        v10 = 0;
        goto LABEL_14;
    }
    v10 = *v9;
LABEL_14:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CNLabeledValue labeledValueWithLabel:value:](CNLabeledValue, "labeledValueWithLabel:value:", v10, v14));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController sessionController](self, "sessionController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
    objc_msgSend(v12, "showMeCardWithAddress:from:", v11, v13);

    v8 = v14;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EditShortcutViewController;
  -[SimpleContaineeViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[ModalCardHeaderView setScrollViewOffset:](self->_modalHeaderView, "setScrollViewOffset:", 0.0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EditShortcutViewController;
  -[SimpleContaineeViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  if (-[EditShortcutViewController shouldAutoSaveEdit](self, "shouldAutoSaveEdit"))
    -[EditShortcutViewController _save](self, "_save");
}

- (void)_save
{
  ShortcutEditSession *shortcutEditSession;
  _QWORD v4[5];

  if (-[ShortcutEditSession canBeSaved](self->_shortcutEditSession, "canBeSaved"))
  {
    shortcutEditSession = self->_shortcutEditSession;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1005494F0;
    v4[3] = &unk_1011AE8F8;
    v4[4] = self;
    -[ShortcutEditSession saveWithCompletion:](shortcutEditSession, "saveWithCompletion:", v4);
  }
}

- (double)preferredWidth
{
  double result;
  objc_super v4;

  if (sub_1002A8AA0(self) == 5)
    return 290.0;
  v4.receiver = self;
  v4.super_class = (Class)EditShortcutViewController;
  -[SimpleContaineeViewController preferredWidth](&v4, "preferredWidth");
  return result;
}

- (BOOL)headerNeeded
{
  return 0;
}

- (int64_t)tableViewStyle
{
  return 2 * (sub_1002A8AA0(self) != 5);
}

- (id)shortcut
{
  return -[ShortcutEditSession shortcut](self->_shortcutEditSession, "shortcut");
}

- (id)_shortcutTypes
{
  unsigned __int8 v2;
  uint64_t Integer;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  uint64_t v12;

  v2 = +[AddressBookManager addressBookAllowed](AddressBookManager, "addressBookAllowed");
  Integer = GEOConfigGetInteger(GEOConfigMapsSuggestionsShortcutManagerBehaviorSetupPlaceholderWhenNoContactsConsent[0], GEOConfigMapsSuggestionsShortcutManagerBehaviorSetupPlaceholderWhenNoContactsConsent[1]);
  v4 = objc_claimAutoreleasedReturnValue(+[EditShortcutType shortcutWithType:](EditShortcutType, "shortcutWithType:", 1));
  v5 = (void *)v4;
  if ((v2 & 1) != 0 || Integer != 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[EditShortcutType shortcutWithType:](EditShortcutType, "shortcutWithType:", 2, v4));
    v11[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[EditShortcutType shortcutWithType:](EditShortcutType, "shortcutWithType:", 3));
    v11[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[EditShortcutType shortcutWithType:](EditShortcutType, "shortcutWithType:", 5));
    v11[3] = v9;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 4));

  }
  else
  {
    v12 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  }

  return v6;
}

- (id)_editShortcutTypeForIndex:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController _shortcutTypes](self, "_shortcutTypes"));
  if ((unint64_t)objc_msgSend(v4, "count") <= a3)
    v5 = objc_claimAutoreleasedReturnValue(+[EditShortcutType shortcutWithType:](EditShortcutType, "shortcutWithType:", 0));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", a3));
  v6 = (void *)v5;

  return v6;
}

- (BOOL)_isMapUserShortcut
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController shortcut](self, "shortcut"));
  v3 = objc_msgSend(v2, "type") == (id)1;

  return v3;
}

- (void)_buildContent
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  SimpleContaineeAction *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char isKindOfClass;
  void *v21;
  unsigned __int8 v22;
  SimpleContaineeAction *v23;
  void *v24;
  void *v25;
  SimpleContaineeAction *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  NSArray *v33;
  NSArray *sections;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id location;

  v3 = sub_1002A8AA0(self);
  v4 = objc_alloc((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EditShortcutSection sectionWithType:](EditShortcutSection, "sectionWithType:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EditShortcutSection sectionWithType:](EditShortcutSection, "sectionWithType:", 2));
  v7 = objc_msgSend(v4, "initWithObjects:", v5, v6, 0);

  v8 = objc_alloc_init((Class)NSMutableArray);
  if (v3 == 5
    && -[EditShortcutViewController allowsOpenContactAction](self, "allowsOpenContactAction")
    && !+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[EditShortcutSection sectionWithType:](EditShortcutSection, "sectionWithType:", 5));
    objc_msgSend(v7, "addObject:", v9);

  }
  if (!+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    if (!-[EditShortcutViewController _isMapUserShortcut](self, "_isMapUserShortcut"))
      goto LABEL_10;
    goto LABEL_9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController shortcutEditSession](self, "shortcutEditSession"));
  v11 = objc_msgSend(v10, "canChangeType");

  if ((v11 & 1) != 0)
  {
LABEL_9:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[EditShortcutSection sectionWithType:](EditShortcutSection, "sectionWithType:", 3));
    objc_msgSend(v7, "addObject:", v12);

  }
LABEL_10:
  if (-[EditShortcutViewController _shouldAllowMeCardWriteback](self, "_shouldAllowMeCardWriteback"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[EditShortcutSection sectionWithType:](EditShortcutSection, "sectionWithType:", 7));
    objc_msgSend(v7, "addObject:", v13);

  }
  if (-[EditShortcutViewController allowsAddPersonAction](self, "allowsAddPersonAction"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[EditShortcutSection sectionWithType:](EditShortcutSection, "sectionWithType:", 4));
    objc_msgSend(v7, "addObject:", v14);

  }
  if (v3 == 5
    && -[EditShortcutViewController allowsOpenContactAction](self, "allowsOpenContactAction")
    && !+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v15 = objc_alloc_init(SimpleContaineeAction);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Open My Card"), CFSTR("localized string not found"), 0));
    -[SimpleContaineeAction setTitle:](v15, "setTitle:", v17);

    -[SimpleContaineeAction setGlyph:](v15, "setGlyph:", CFSTR("person.circle"));
    -[SimpleContaineeAction setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", CFSTR("EditShortcutMeCardActionCell"));
    -[SimpleContaineeAction setLabelAccessibilityIdentifier:](v15, "setLabelAccessibilityIdentifier:", CFSTR("EditShortcutMeCardActionLabel"));
    objc_initWeak(&location, self);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100549E70;
    v40[3] = &unk_1011AD260;
    objc_copyWeak(&v41, &location);
    -[SimpleContaineeAction setAction:](v15, "setAction:", v40);
    objc_msgSend(v8, "addObject:", v15);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);

  }
  if (!+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    if (-[EditShortcutViewController _isMapUserShortcut](self, "_isMapUserShortcut"))
      goto LABEL_25;
    goto LABEL_24;
  }
  if (-[ShortcutEditSession alreadySaved](self->_shortcutEditSession, "alreadySaved"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession shortcut](self->_shortcutEditSession, "shortcut"));
    v19 = objc_opt_class(_TtC4Maps16MapsFavoriteItem);
    isKindOfClass = objc_opt_isKindOfClass(v18, v19);

    if ((isKindOfClass & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession shortcut](self->_shortcutEditSession, "shortcut"));
      v22 = objc_msgSend(v21, "isHomeWorkOrSchool");

      if ((v22 & 1) != 0)
      {
LABEL_24:
        v23 = objc_alloc_init(SimpleContaineeAction);
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Refine Location"), CFSTR("localized string not found"), 0));
        -[SimpleContaineeAction setTitle:](v23, "setTitle:", v25);

        -[SimpleContaineeAction setGlyph:](v23, "setGlyph:", CFSTR("mappin.and.ellipse"));
        -[SimpleContaineeAction setGlyphStyle:](v23, "setGlyphStyle:", 2);
        -[SimpleContaineeAction setAccessibilityIdentifier:](v23, "setAccessibilityIdentifier:", CFSTR("EditShortcutRefineLocationActionCell"));
        -[SimpleContaineeAction setLabelAccessibilityIdentifier:](v23, "setLabelAccessibilityIdentifier:", CFSTR("EditShortcutRefineLocationActionLabel"));
        objc_initWeak(&location, self);
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100549EA0;
        v38[3] = &unk_1011AD260;
        objc_copyWeak(&v39, &location);
        -[SimpleContaineeAction setAction:](v23, "setAction:", v38);
        objc_msgSend(v8, "addObject:", v23);
        objc_destroyWeak(&v39);
        objc_destroyWeak(&location);

      }
    }
  }
LABEL_25:
  if (-[EditShortcutViewController allowsRemoveAction](self, "allowsRemoveAction"))
  {
    v26 = objc_alloc_init(SimpleContaineeAction);
    v27 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = v28;
    if (v27)
      v30 = CFSTR("[Shortcut] Unpin");
    else
      v30 = CFSTR("[Shortcut] Remove Favorite");
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", v30, CFSTR("localized string not found"), 0));
    -[SimpleContaineeAction setTitle:](v26, "setTitle:", v31);

    -[SimpleContaineeAction setGlyph:](v26, "setGlyph:", CFSTR("trash.circle.fill"));
    -[SimpleContaineeAction setGlyphStyle:](v26, "setGlyphStyle:", 3);
    -[SimpleContaineeAction setStyle:](v26, "setStyle:", 1);
    -[SimpleContaineeAction setAccessibilityIdentifier:](v26, "setAccessibilityIdentifier:", CFSTR("EditShortcutRemoveActionCell"));
    -[SimpleContaineeAction setLabelAccessibilityIdentifier:](v26, "setLabelAccessibilityIdentifier:", CFSTR("EditShortcutRemoveActionLabel"));
    objc_initWeak(&location, self);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100549ED0;
    v36[3] = &unk_1011AD260;
    objc_copyWeak(&v37, &location);
    -[SimpleContaineeAction setAction:](v26, "setAction:", v36);
    objc_msgSend(v8, "addObject:", v26);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);

  }
  -[SimpleContaineeViewController setActions:](self, "setActions:", v8);
  if (objc_msgSend(v8, "count"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[EditShortcutSection sectionWithType:](EditShortcutSection, "sectionWithType:", 6));
    objc_msgSend(v7, "addObject:", v32);

  }
  v33 = (NSArray *)objc_msgSend(v7, "copy");
  sections = self->_sections;
  self->_sections = v33;

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
  objc_msgSend(v35, "reloadData");

}

- (BOOL)_shouldAllowMeCardWriteback
{
  char v2;
  void *v4;
  unint64_t v5;
  uint64_t BOOL;

  if (!+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v2 = 0;
    return v2 & 1;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController shortcut](self, "shortcut"));
  if (objc_msgSend(v4, "isPersisted") && !self->_needsMeCardUpdate
    || !+[AddressBookManager addressBookAllowed](AddressBookManager, "addressBookAllowed"))
  {
    goto LABEL_8;
  }
  v5 = (unint64_t)objc_msgSend(v4, "type");
  if (v5 <= 6)
  {
    if (((1 << v5) & 0x2C) != 0)
    {
      if (!self->_needsMeCardUpdate)
      {
        v2 = 1;
        goto LABEL_10;
      }
      BOOL = GEOConfigGetBOOL(MapsConfig_MapsHomeMeCardWritebackDefault, off_1014B5538);
      v2 = 1;
      goto LABEL_9;
    }
    if (((1 << v5) & 0x43) != 0)
    {
LABEL_8:
      BOOL = 0;
      v2 = 0;
LABEL_9:
      objc_msgSend(v4, "setIsMeCardWritebackEnabled:", BOOL);
    }
  }
LABEL_10:

  return v2 & 1;
}

- (id)_sectionForIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSArray count](self->_sections, "count") <= a3)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a3));
  return v5;
}

- (unint64_t)_typeForIndex:(unint64_t)a3
{
  void *v5;
  id v6;

  if (-[NSArray count](self->_sections, "count") <= a3)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a3));
  v6 = objc_msgSend(v5, "type");

  return (unint64_t)v6;
}

- (void)_removeContact:(id)a3 fromSection:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession contacts](self->_shortcutEditSession, "contacts"));
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v8, a4));
    -[ShortcutEditSession removeSharing:](self->_shortcutEditSession, "removeSharing:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
    v12 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    objc_msgSend(v10, "deleteRowsAtIndexPaths:withRowAnimation:", v11, 100);

    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2079, 253, 0);
  }

}

- (id)_meCardTextForType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 5:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[Shortcut] School Address Footer");
      break;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[Shortcut] Work Address Footer");
      break;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[Shortcut] Home Address Footer");
      break;
    default:
      v6 = 0;
      return v6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return v6;
}

- (void)_close
{
  id v3;

  self->_dismissed = 1;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController sessionController](self, "sessionController"));
  objc_msgSend(v3, "closeViewController:", self);

}

- (void)_cancelAction:(id)a3
{
  if (-[NSString length](self->_originalShortcutName, "length", a3))
    -[ShortcutEditSession setName:](self->_shortcutEditSession, "setName:", self->_originalShortcutName);
  -[EditShortcutViewController _close](self, "_close");
}

- (void)_doneAction:(id)a3
{
  id v4;
  ShortcutEditSession *shortcutEditSession;
  void *v6;
  ShortcutEditSession *v7;
  id *v8;
  ShortcutEditSession *v9;
  void *v10;
  ShortcutEditSession *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = a3;
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    objc_initWeak(&location, self);
    shortcutEditSession = self->_shortcutEditSession;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutTitleCell titleText](self->_editTitleCell, "titleText"));
    -[ShortcutEditSession setName:](shortcutEditSession, "setName:", v6);

    v7 = self->_shortcutEditSession;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10054A4FC;
    v14[3] = &unk_1011AD4F0;
    v8 = &v15;
    objc_copyWeak(&v15, &location);
    -[ShortcutEditSession saveWithCompletion:](v7, "saveWithCompletion:", v14);
  }
  else
  {
    objc_initWeak(&location, self);
    v9 = self->_shortcutEditSession;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutTitleCell titleText](self->_editTitleCell, "titleText"));
    -[ShortcutEditSession setName:](v9, "setName:", v10);

    v11 = self->_shortcutEditSession;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10054A690;
    v12[3] = &unk_1011AD4F0;
    v8 = &v13;
    objc_copyWeak(&v13, &location);
    -[ShortcutEditSession saveWithCompletion:](v11, "saveWithCompletion:", v12);
  }
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2053, 0, 0);

}

- (void)_removeAction
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController sessionController](self, "sessionController"));
  objc_msgSend(v3, "removeShortcut:", self->_shortcutEditSession);

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2060, 253, 0);
}

- (void)_refineAction
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController sessionController](self, "sessionController"));
  objc_msgSend(v3, "showRefineLocation:", self->_shortcutEditSession);

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2063, 253, 0);
}

- (void)_addPersonAction
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController sessionController](self, "sessionController"));
  objc_msgSend(v3, "showAddContact:", self->_shortcutEditSession);

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2078, 253, 0);
}

- (void)_openContact
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[AddressBookManager meCardPunchOutURL](self->_sharedManager, "meCardPunchOutURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v3, "_maps_openURL:options:completionHandler:", v4, 0, 0);

  -[EditShortcutViewController _close](self, "_close");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sections, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  int64_t v9;
  objc_super v11;

  v6 = a3;
  v7 = -[EditShortcutViewController _typeForIndex:](self, "_typeForIndex:", a4);
  if (v7 == 6)
  {
    v11.receiver = self;
    v11.super_class = (Class)EditShortcutViewController;
    v9 = -[SimpleContaineeViewController tableView:numberOfRowsInSection:](&v11, "tableView:numberOfRowsInSection:", v6, a4);
  }
  else
  {
    if (v7 == 4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession contacts](self->_shortcutEditSession, "contacts"));
      v9 = (int64_t)objc_msgSend(v8, "count") + 1;
    }
    else
    {
      if (v7 != 3)
      {
        v9 = 1;
        goto LABEL_9;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController _shortcutTypes](self, "_shortcutTypes"));
      v9 = (int64_t)objc_msgSend(v8, "count");
    }

  }
LABEL_9:

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  MacEditShortcutHeaderFooterView *v9;
  void *v10;
  unint64_t v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  MacEditShortcutHeaderFooterView *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v6 = a3;
  v7 = -[EditShortcutViewController _typeForIndex:](self, "_typeForIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController _titleForSection:](self, "_titleForSection:", a4));
  if (sub_1002A8AA0(self) == 5)
  {
    if (objc_msgSend(v8, "isEqualToString:", &stru_1011EB268))
      v9 = (MacEditShortcutHeaderFooterView *)objc_alloc_init((Class)UIView);
    else
      v9 = -[MacEditShortcutHeaderFooterView initWithTitle:reuseIdentifier:]([MacEditShortcutHeaderFooterView alloc], "initWithTitle:reuseIdentifier:", v8, CFSTR("kMacEditShortcutHeaderFooterIdentifier"));
    v18 = v9;
    goto LABEL_21;
  }
  if (v7 == 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController shortcut](self, "shortcut"));
    v11 = (unint64_t)objc_msgSend(v10, "type");
    if (v11 <= 5 && ((1 << v11) & 0x2C) != 0)
    {
      v12 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");

      if ((v12 & 1) == 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Contact Card"), CFSTR("localized string not found"), 0));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_groupedHeaderViewWithTitle:buttonTitle:target:selector:", v8, v14, self, "_openContact"));
        v16 = objc_opt_class(ButtonTableViewHeaderFooterView);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
          v17 = v15;
        else
          v17 = 0;
        v18 = v17;

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("EditShortcutSectionType"), "stringByAppendingString:", CFSTR("Address")));
        -[MacEditShortcutHeaderFooterView updateAXIdentifiersWithPrefix:](v18, "updateAXIdentifiersWithPrefix:", v19);

        goto LABEL_21;
      }
    }
    else
    {

    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_groupedHeaderViewWithTitle:", v8));
  v21 = objc_opt_class(MapsGroupedTableHeaderView);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
    v22 = v20;
  else
    v22 = 0;
  v18 = v22;

  if (v7 <= 7)
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("EditShortcutSectionType"), "stringByAppendingString:", *(&off_1011BAC80 + v7)));
  -[MacEditShortcutHeaderFooterView updateAXIdentifiersWithPrefix:](v18, "updateAXIdentifiersWithPrefix:", v20);

LABEL_21:
  return v18;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v4;
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v7 = a3;
  if (sub_1002A8AA0(self) == 5)
    goto LABEL_2;
  v9 = -[EditShortcutViewController _typeForIndex:](self, "_typeForIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "footerViewForSection:", a4));
  if (v9 <= 7)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("EditShortcutSectionType"), "stringByAppendingString:", *(&off_1011BAC80 + v9)));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("Footer")));
  objc_msgSend(v10, "setAccessibilityIdentifier:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController tableView:titleForFooterInSection:](self, "tableView:titleForFooterInSection:", v7, a4));
  if (v12)
  {
    v8 = objc_alloc_init((Class)UITableViewHeaderFooterView);
    v13 = (id)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration groupedFooterConfiguration](UIListContentConfiguration, "groupedFooterConfiguration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController tableView:titleForFooterInSection:](self, "tableView:titleForFooterInSection:", v7, a4));
    objc_msgSend(v13, "setText:", v14);

    objc_msgSend(v8, "setContentConfiguration:", v13);
LABEL_7:

    goto LABEL_8;
  }
  if (v9 == 7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "meCard"));

    if (v17)
    {
      v18 = objc_alloc((Class)NSString);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Contact Card link"), CFSTR("localized string not found"), 0));
      v13 = objc_msgSend(v18, "initWithString:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController shortcut](self, "shortcut"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController _footerStringForShortcutType:](self, "_footerStringForShortcutType:", objc_msgSend(v21, "type")));

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maps_footerViewWithTitle:linkText:target:selector:", v22, v13, self, "_openContact"));
        v24 = objc_opt_class(UIView);
        if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
          v25 = v23;
        else
          v25 = 0;
        v8 = v25;

      }
      else
      {
        v8 = 0;
      }

      goto LABEL_7;
    }
  }
LABEL_2:
  v8 = 0;
LABEL_8:

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v6;
  double v7;

  if (sub_1002A8AA0(self) != 5)
    return UITableViewAutomaticDimension;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController _titleForSection:](self, "_titleForSection:", a4));
  if ((objc_msgSend(v6, "isEqualToString:", &stru_1011EB268) & 1) != 0)
  {
    if ((id)-[EditShortcutViewController _typeForIndex:](self, "_typeForIndex:", a4) == (id)1)
      v7 = 0.0;
    else
      v7 = 14.0;
  }
  else
  {
    v7 = UITableViewAutomaticDimension;
  }

  return v7;
}

- (id)_titleForSection:(int64_t)a3
{
  id result;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;

  switch(-[EditShortcutViewController _typeForIndex:](self, "_typeForIndex:", a3))
  {
    case 1uLL:
      if (sub_1002A8AA0(self) == 5)
        goto LABEL_3;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v11;
      v12 = CFSTR("[Shortcut] Label");
      goto LABEL_12;
    case 2uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Address"), CFSTR("localized string not found"), 0));

      if (sub_1002A8AA0(self) == 5)
        goto LABEL_14;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController shortcut](self, "shortcut"));
      v8 = (unint64_t)objc_msgSend(v7, "type");

      if (v8 > 5
        || ((1 << v8) & 0x2C) == 0
        || +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
      {
        goto LABEL_14;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Contact Card"), CFSTR("localized string not found"), 0));

      goto LABEL_13;
    case 3uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v11;
      v12 = CFSTR("[Shortcut] Type");
      goto LABEL_12;
    case 4uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v11;
      v12 = CFSTR("[Shortcut] Share ETA");
LABEL_12:
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v12, CFSTR("localized string not found"), 0));
LABEL_13:

      v6 = (void *)v10;
LABEL_14:
      result = v6;
      break;
    default:
LABEL_3:
      result = &stru_1011EB268;
      break;
  }
  return result;
}

- (id)_footerStringForShortcutType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 5:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[Shortcut] Add school to Contact Card footer");
      break;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[Shortcut] Add work to Contact Card footer");
      break;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[Shortcut] Add home to Contact Card footer");
      break;
    default:
      v6 = 0;
      return v6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v7 = a3;
  if (sub_1002A8AA0(self) == 5)
    goto LABEL_2;
  v9 = -[EditShortcutViewController _typeForIndex:](self, "_typeForIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "footerViewForSection:", a4));
  if (v9 <= 7)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("EditShortcutSectionType"), "stringByAppendingString:", *(&off_1011BAC80 + v9)));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("Footer")));
  objc_msgSend(v10, "setAccessibilityIdentifier:", v11);

  switch(v9)
  {
    case 2uLL:
      if (!+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
      {
        v14 = (id)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController shortcut](self, "shortcut"));
        v16 = objc_claimAutoreleasedReturnValue(-[EditShortcutViewController _meCardTextForType:](self, "_meCardTextForType:", objc_msgSend(v14, "type")));
LABEL_16:
        v8 = (void *)v16;
        goto LABEL_17;
      }
      break;
    case 7uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "meCard"));

      if (!v18)
      {
        v19 = objc_alloc((Class)NSString);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Contact Card privacy footer"), CFSTR("localized string not found"), 0));
        v14 = objc_msgSend(v19, "initWithString:", v21);

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController shortcut](self, "shortcut"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController _footerStringForShortcutType:](self, "_footerStringForShortcutType:", objc_msgSend(v22, "type")));
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v14));

LABEL_17:
        goto LABEL_18;
      }
      break;
    case 4uLL:
      v12 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = v13;
      if (v12)
        v15 = CFSTR("[Pin] Share ETA Footer");
      else
        v15 = CFSTR("[Shortcut] Share ETA Footer");
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", v15, CFSTR("localized string not found"), 0));
      goto LABEL_16;
  }
LABEL_2:
  v8 = 0;
LABEL_18:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  switch(-[EditShortcutViewController _typeForIndex:](self, "_typeForIndex:", objc_msgSend(v7, "section")))
  {
    case 1uLL:
      v8 = (id)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController _cellForLabel](self, "_cellForLabel"));
      goto LABEL_11;
    case 2uLL:
      v8 = (id)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController _cellForAddress](self, "_cellForAddress"));
      goto LABEL_11;
    case 3uLL:
      v8 = (id)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController _cellForTypeAtIndexPath:](self, "_cellForTypeAtIndexPath:", v7));
      goto LABEL_11;
    case 4uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession contacts](self->_shortcutEditSession, "contacts"));
      v10 = objc_msgSend(v9, "count");
      v11 = objc_msgSend(v7, "row");

      if (v10 <= v11)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("EditShortcutActionCell"), v7));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController _configureCellForAddSharingContactAction:](self, "_configureCellForAddSharingContactAction:", v15));

      }
      else
      {
        v8 = (id)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController _cellForContactsAtIndexPath:](self, "_cellForContactsAtIndexPath:", v7));
LABEL_11:
        v13 = v8;
      }

      return v13;
    case 5uLL:
      v8 = (id)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController _cellForOpenMeCard](self, "_cellForOpenMeCard"));
      goto LABEL_11;
    case 6uLL:
      v16.receiver = self;
      v16.super_class = (Class)EditShortcutViewController;
      v12 = -[SimpleContaineeViewController tableView:cellForRowAtIndexPath:](&v16, "tableView:cellForRowAtIndexPath:", v6, v7);
      v8 = (id)objc_claimAutoreleasedReturnValue(v12);
      goto LABEL_11;
    case 7uLL:
      v8 = (id)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController _cellForWriteToMeCard](self, "_cellForWriteToMeCard"));
      goto LABEL_11;
    default:
      v8 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
      goto LABEL_11;
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  id v10;
  BOOL v11;

  v5 = a4;
  v6 = -[EditShortcutViewController _typeForIndex:](self, "_typeForIndex:", objc_msgSend(v5, "section"));
  v11 = v6 == 3
     || (v7 = v6, v6 == 4)
     && (v8 = objc_msgSend(v5, "row"),
         v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession contacts](self->_shortcutEditSession, "contacts")),
         v10 = objc_msgSend(v9, "count"),
         v9,
         v8 == v10)
     || v7 == 6;

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[EditShortcutViewController _typeForIndex:](self, "_typeForIndex:", objc_msgSend(v7, "section"));
  if (!-[EditShortcutViewController _isMapUserShortcut](self, "_isMapUserShortcut") && v8 == 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController sessionController](self, "sessionController"));
    objc_msgSend(v9, "showAddShortcut:", self->_shortcutEditSession);

    goto LABEL_4;
  }
  if (v8 == 6)
  {
    v12.receiver = self;
    v12.super_class = (Class)EditShortcutViewController;
    -[SimpleContaineeViewController tableView:didSelectRowAtIndexPath:](&v12, "tableView:didSelectRowAtIndexPath:", v6, v7);
    goto LABEL_4;
  }
  if (v8 == 4)
  {
    -[EditShortcutViewController _addPersonAction](self, "_addPersonAction");
    goto LABEL_4;
  }
  if (v8 != 3)
  {
LABEL_4:
    v10 = (id)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView"));
    objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v7, 1);
    goto LABEL_5;
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController _editShortcutTypeForIndex:](self, "_editShortcutTypeForIndex:", objc_msgSend(v7, "row")));
  v11 = (unint64_t)objc_msgSend(v10, "type");
  if (v11 <= 5
    && ((1 << v11) & 0x2C) != 0
    && !+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10054B7A4;
    v13[3] = &unk_1011B0E90;
    objc_copyWeak(&v16, &location);
    v10 = v10;
    v14 = v10;
    v15 = v7;
    +[CNContactStore promptForContactsAccessIfNeededBeforePerforming:](CNContactStore, "promptForContactsAccessIfNeededBeforePerforming:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    -[EditShortcutViewController _updateWithType:](self, "_updateWithType:", objc_msgSend(v10, "type"));
  }
LABEL_5:

}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  -[EditShortcutViewController _typeForIndex:](self, "_typeForIndex:", objc_msgSend(a4, "section", a3));
}

- (id)_cellForLabel
{
  EditShortcutTitleCell **p_editTitleCell;
  EditShortcutTitleCell *editTitleCell;
  EditShortcutTitleCell *v5;
  EditShortcutTitleCell *v6;
  void *v7;

  p_editTitleCell = &self->_editTitleCell;
  editTitleCell = self->_editTitleCell;
  if (editTitleCell)
  {
    -[EditShortcutTitleCell updateContent](editTitleCell, "updateContent");
    v5 = *p_editTitleCell;
  }
  else
  {
    v6 = [EditShortcutTitleCell alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController shortcut](self, "shortcut"));
    v5 = -[EditShortcutTitleCell initWithShortcut:delegate:](v6, "initWithShortcut:delegate:", v7, self);

    objc_storeStrong((id *)p_editTitleCell, v5);
  }
  return v5;
}

- (id)_cellForTypeAtIndexPath:(id)a3
{
  void *v4;
  EditShortcutTypeCell *v5;
  void *v6;
  EditShortcutTypeCell *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController _editShortcutTypeForIndex:](self, "_editShortcutTypeForIndex:", objc_msgSend(a3, "row")));
  v5 = [EditShortcutTypeCell alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController shortcut](self, "shortcut"));
  v7 = -[EditShortcutTypeCell initWithShortcut:shortcutType:](v5, "initWithShortcut:shortcutType:", v6, v4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController shortcut](self, "shortcut"));
  -[EditShortcutTypeCell setChecked:](v7, "setChecked:", objc_msgSend(v8, "type") == objc_msgSend(v4, "type"));

  return v7;
}

- (id)_cellForContactsAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  EditShortcutContactCell *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession contacts](self->_shortcutEditSession, "contacts"));
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v4, "row");

  if (v6 <= v7)
  {
    v10 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession contacts](self->_shortcutEditSession, "contacts"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

    v10 = -[EditShortcutContactCell initWithStyle:reuseIdentifier:]([EditShortcutContactCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    -[EditShortcutContactCell setContactValue:](v10, "setContactValue:", v9);
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10054BBB8;
    v13[3] = &unk_1011AFF10;
    objc_copyWeak(&v16, &location);
    v11 = v9;
    v14 = v11;
    v15 = v4;
    -[EditShortcutContactCell setAction:](v10, "setAction:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  return v10;
}

- (id)_configureCellForAddSharingContactAction:(id)a3
{
  id v4;
  SimpleContaineeAction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init(SimpleContaineeAction);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Add Person"), CFSTR("localized string not found"), 0));
  -[SimpleContaineeAction setTitle:](v5, "setTitle:", v7);

  -[SimpleContaineeAction setGlyph:](v5, "setGlyph:", CFSTR("person.circle.fill"));
  -[SimpleContaineeAction setGlyphStyle:](v5, "setGlyphStyle:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController configurationForAction:](self, "configurationForAction:", v5));
  objc_msgSend(v4, "setContentConfiguration:", v8);

  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("EditShortcutAddPersonCell"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textLabel"));
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("EditShortCutAddPersonCellLabel"));

  return v4;
}

- (id)_cellForAddress
{
  MacEditShortcutAddressCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  if (sub_1002A8AA0(self) == 5)
  {
    v3 = -[MacEditShortcutAddressCell initWithStyle:reuseIdentifier:]([MacEditShortcutAddressCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController shortcut](self, "shortcut"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geoMapItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addressObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fullAddressWithMultiline:", 1));
    -[MacEditShortcutAddressCell setAddress:](v3, "setAddress:", v7);

  }
  else
  {
    v8 = objc_alloc((Class)UITableViewCell);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10126DCA8, "stringValue"));
    v3 = (MacEditShortcutAddressCell *)objc_msgSend(v8, "initWithStyle:reuseIdentifier:", 0, v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacEditShortcutAddressCell textLabel](v3, "textLabel"));
    objc_msgSend(v10, "setNumberOfLines:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController shortcut](self, "shortcut"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geoMapItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addressObject"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fullAddressWithMultiline:", 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MacEditShortcutAddressCell textLabel](v3, "textLabel"));
    objc_msgSend(v15, "setText:", v14);

    if (sub_1002A8AA0(self) == 5)
      v16 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    else
      v16 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v17 = (void *)v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MacEditShortcutAddressCell textLabel](v3, "textLabel"));
    objc_msgSend(v18, "setTextColor:", v17);

    -[MacEditShortcutAddressCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("EditShortcutAddressCell"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacEditShortcutAddressCell textLabel](v3, "textLabel"));
    objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("EditShortCutAddressCellLabel"));
  }

  return v3;
}

- (id)_cellForOpenMeCard
{
  EditShortcutMeCardCell *v3;
  void *v4;
  EditShortcutMeCardCell *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = [EditShortcutMeCardCell alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10126DCC0, "stringValue"));
  v5 = -[EditShortcutMeCardCell initWithStyle:reuseIdentifier:](v3, "initWithStyle:reuseIdentifier:", 0, v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController shortcut](self, "shortcut"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController _meCardTextForType:](self, "_meCardTextForType:", objc_msgSend(v6, "type")));
  -[EditShortcutMeCardCell setMeCardString:](v5, "setMeCardString:", v7);

  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10054C028;
  v9[3] = &unk_1011AD260;
  objc_copyWeak(&v10, &location);
  -[EditShortcutMeCardCell setOpenMeCardHandler:](v5, "setOpenMeCardHandler:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v5;
}

- (id)_cellForWriteToMeCard
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v3 = objc_alloc((Class)UITableViewCell);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10126DCD8, "stringValue"));
  v5 = objc_msgSend(v3, "initWithStyle:reuseIdentifier:", 0, v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "meCard"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = v8;
  if (v7)
    v10 = CFSTR("[Shortcut] Add to Contact Card");
  else
    v10 = CFSTR("[Shortcut] Create a Contact Card");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));
  objc_msgSend(v12, "setText:", v11);

  v13 = objc_msgSend(objc_alloc((Class)UISwitch), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController shortcut](self, "shortcut"));
  objc_msgSend(v13, "setOn:", objc_msgSend(v14, "isMeCardWritebackEnabled"));
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, "meCardWritebackToggled:", 4096);
  objc_msgSend(v5, "setAccessoryView:", v13);
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("EditShortcutSaveToMeCardCell"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("EditShortcutSaveToMeCardCellLabel"));

  return v5;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t UInteger;
  id v14;
  uint64_t v15;
  BOOL v16;
  _BOOL8 v17;
  void *v18;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v10));

  UInteger = GEOConfigGetUInteger(MapsConfig_FavoriteNameMaximumLength, off_1014B4A08);
  v14 = objc_msgSend(v12, "length");
  if ((unint64_t)v14 > UInteger)
  {
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringWithRange:", 0, UInteger));

    objc_msgSend(v9, "setText:", v15);
    v12 = (void *)v15;
  }
  v16 = (unint64_t)v14 <= UInteger;
  -[ShortcutEditSession setName:](self->_shortcutEditSession, "setName:", v12);
  v17 = objc_msgSend(v12, "length") != 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](self->_modalHeaderView, "trailingButton"));
  objc_msgSend(v18, "setEnabled:", v17);

  return v16;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  ShortcutEditSession *shortcutEditSession;
  _QWORD v6[5];

  -[EditShortcutTitleCell resignResponder](self->_editTitleCell, "resignResponder", a3);
  if (-[EditShortcutViewController shouldAutoSaveEdit](self, "shouldAutoSaveEdit"))
  {
    shortcutEditSession = self->_shortcutEditSession;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10054C3AC;
    v6[3] = &unk_1011AE8F8;
    v6[4] = self;
    -[ShortcutEditSession saveWithCompletion:](shortcutEditSession, "saveWithCompletion:", v6);
  }
  return 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EditShortcutViewController;
  v4 = a3;
  -[SimpleContaineeViewController scrollViewDidScroll:](&v7, "scrollViewDidScroll:", v4);
  -[ShortcutEditSession setDidResignTitleFocus:](self->_shortcutEditSession, "setDidResignTitleFocus:", 1, v7.receiver, v7.super_class);
  objc_msgSend(v4, "contentOffset");
  v6 = v5;

  -[ModalCardHeaderView setScrollViewOffset:](self->_modalHeaderView, "setScrollViewOffset:", v6);
  -[EditShortcutTitleCell resignResponder](self->_editTitleCell, "resignResponder");
}

- (void)didDismissByGesture
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController sessionController](self, "sessionController"));
  objc_msgSend(v2, "endSession");

}

- (void)meCardWritebackToggled:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[EditShortcutViewController shortcut](self, "shortcut"));
  v5 = objc_msgSend(v4, "isOn");

  objc_msgSend(v6, "setIsMeCardWritebackEnabled:", v5);
}

- (ShortcutEditSession)shortcutEditSession
{
  return self->_shortcutEditSession;
}

- (ShortcutEditSessionController)sessionController
{
  return (ShortcutEditSessionController *)objc_loadWeakRetained((id *)&self->_sessionController);
}

- (void)setSessionController:(id)a3
{
  objc_storeWeak((id *)&self->_sessionController, a3);
}

- (BOOL)openingContactController
{
  return self->_openingContactController;
}

- (void)setOpeningContactController:(BOOL)a3
{
  self->_openingContactController = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionController);
  objc_storeStrong((id *)&self->_shortcutEditSession, 0);
  objc_storeStrong((id *)&self->_originalShortcutName, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_sharedManager, 0);
  objc_storeStrong((id *)&self->_refineCoordinateViewController, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_editTitleCell, 0);
  objc_storeStrong((id *)&self->_modalHeaderView, 0);
}

@end
