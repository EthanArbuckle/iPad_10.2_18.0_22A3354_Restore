@implementation ShortcutEditSessionControllerImpl

- (BOOL)shortcutsContainItem:(id)a3
{
  return -[ShortcutEditSession shortcutsContainItem:](self->_shortcutEditSession, "shortcutsContainItem:", a3);
}

- (void)capturePresenter
{
  ContaineeProtocol *v3;
  ContaineeProtocol *presentingViewController;
  id WeakRetained;

  if (!self->_presentingViewController)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v3 = (ContaineeProtocol *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentViewController"));
    presentingViewController = self->_presentingViewController;
    self->_presentingViewController = v3;

  }
}

- (void)refinementCoordinatorRequestsChangeAddress:(id)a3 withShortcut:(id)a4
{
  ContainerViewController **p_containerViewController;
  id v6;
  id WeakRetained;
  uint64_t v8;
  char *v9;
  uint64_t v10;

  p_containerViewController = &self->_containerViewController;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  v8 = sub_1002A8AA0(WeakRetained);

  if (v8 == 5)
    -[ShortcutEditSessionControllerImpl showMeCard](self, "showMeCard");
  else
    -[ShortcutEditSessionControllerImpl showAddShortcut:](self, "showAddShortcut:", self->_shortcutEditSession);
  v9 = (char *)objc_msgSend(v6, "type");

  if ((unint64_t)(v9 - 2) > 3)
    v10 = 0;
  else
    v10 = dword_100E3A510[(_QWORD)(v9 - 2)];
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v10, 253, 0);
}

- (void)refinementCoordinator:(id)a3 finishedRefiningCoordinate:(CLLocationCoordinate2D)a4 withShortcut:(id)a5
{
  double longitude;
  double latitude;
  id v8;
  ShortcutEditSession *shortcutEditSession;
  void *v10;
  _QWORD v11[4];
  id v12;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v8 = a5;
  -[ShortcutEditSession setAdjustedCoordinate:](self->_shortcutEditSession, "setAdjustedCoordinate:", latitude, longitude);
  if (-[ShortcutEditSession editOnlyLocation](self->_shortcutEditSession, "editOnlyLocation"))
  {
    shortcutEditSession = self->_shortcutEditSession;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1007941A4;
    v11[3] = &unk_1011AE8F8;
    v12 = v8;
    -[ShortcutEditSession saveWithCompletion:](shortcutEditSession, "saveWithCompletion:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSessionControllerImpl delegate](self, "delegate"));
    objc_msgSend(v10, "shortcutEditSessionControllerFinished:", self);

  }
}

- (void)refinementCoordinator:(id)a3 presentViewController:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  ContainerViewController **p_containerViewController;
  id WeakRetained;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1007943B4;
  v14[3] = &unk_1011AD1E8;
  objc_copyWeak(&v16, &location);
  v8 = v7;
  v15 = v8;
  v9 = objc_retainBlock(v14);
  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  v12 = sub_1002A8AA0(WeakRetained);

  if (v12 == 5)
  {
    v13 = objc_loadWeakRetained((id *)p_containerViewController);
    objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, v9);

  }
  else
  {
    ((void (*)(_QWORD *))v9[2])(v9);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)refinementCoordinatorDidComplete:(id)a3
{
  -[ShortcutEditSessionControllerImpl closeViewController:](self, "closeViewController:", self->_editShortcutViewController);
}

- (void)showRefineLocation:(id)a3
{
  void *v4;
  RAPPersonalPlaceRefinementCoordinator *v5;
  id WeakRetained;
  void *v7;
  RAPPersonalPlaceRefinementCoordinator *v8;
  RAPPersonalPlaceRefinementCoordinator *homeWorkCoordinator;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "shortcut"));

  if (v4)
  {
    v5 = [RAPPersonalPlaceRefinementCoordinator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "shortcut"));
    v8 = -[RAPPersonalPlaceRefinementCoordinator initWithPresentingViewController:delegate:shortcut:](v5, "initWithPresentingViewController:delegate:shortcut:", WeakRetained, self, v7);
    homeWorkCoordinator = self->_homeWorkCoordinator;
    self->_homeWorkCoordinator = v8;

    objc_msgSend(v10, "setEditingModeType:", 3);
    -[RAPPersonalPlaceRefinementCoordinator beginShortcutRefinement](self->_homeWorkCoordinator, "beginShortcutRefinement");
  }

}

- (void)_closeLocationRefinement
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController presentingViewController](self->_refineCoordinateViewController, "presentingViewController"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100794590;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_doneLocationRefinement
{
  ShortcutEditSession *shortcutEditSession;
  _QWORD v4[4];
  id v5;
  id location;

  -[EditLocationViewController selectedCoordinate](self->_refineCoordinateViewController, "selectedCoordinate");
  -[ShortcutEditSession setAdjustedCoordinate:](self->_shortcutEditSession, "setAdjustedCoordinate:");
  objc_initWeak(&location, self);
  if (-[ShortcutEditSession editOnlyLocation](self->_shortcutEditSession, "editOnlyLocation"))
  {
    shortcutEditSession = self->_shortcutEditSession;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1007946BC;
    v4[3] = &unk_1011AD4F0;
    objc_copyWeak(&v5, &location);
    -[ShortcutEditSession saveWithCompletion:](shortcutEditSession, "saveWithCompletion:", v4);
    objc_destroyWeak(&v5);
  }
  else
  {
    -[ShortcutEditSessionControllerImpl _closeLocationRefinement](self, "_closeLocationRefinement");
  }
  objc_destroyWeak(&location);
}

- (void)showAddShortcut:(id)a3
{
  -[ShortcutEditSessionControllerImpl showAddShortcut:sourceView:sourceRect:](self, "showAddShortcut:sourceView:sourceRect:", a3, 0, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
}

- (void)showAddShortcut:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  AddShortcutViewController *v15;
  AddShortcutViewController *addShortcutViewController;
  AddShortcutViewController *v17;
  id WeakRetained;
  void *v19;
  unsigned __int8 v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24[5];
  id location;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  -[ShortcutEditSessionControllerImpl capturePresenter](self, "capturePresenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shortcut"));
  v14 = (unint64_t)objc_msgSend(v13, "type");

  if (v14 <= 6)
  {
    if (((1 << v14) & 0x2C) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shortcut"));
      v20 = objc_msgSend(v19, "isSetupPlaceholder");

      if ((v20 & 1) != 0)
      {
        if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
        {
          -[ShortcutEditSessionControllerImpl _showAddShortcut:sourceView:sourceRect:](self, "_showAddShortcut:sourceView:sourceRect:", v11, v12, x, y, width, height);
        }
        else
        {
          objc_initWeak(&location, self);
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_100794960;
          v21[3] = &unk_1011C67E8;
          v22 = v11;
          objc_copyWeak(v24, &location);
          v23 = v12;
          v24[1] = *(id *)&x;
          v24[2] = *(id *)&y;
          v24[3] = *(id *)&width;
          v24[4] = *(id *)&height;
          +[CNContactStore promptForContactsAccessIfNeededBeforePerforming:](CNContactStore, "promptForContactsAccessIfNeededBeforePerforming:", v21);

          objc_destroyWeak(v24);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        -[ShortcutEditSessionControllerImpl _meCard_showAddShortcut:sourceView:sourceRect:](self, "_meCard_showAddShortcut:sourceView:sourceRect:", v11, v12, x, y, width, height);
      }
    }
    else if (((1 << v14) & 0x43) != 0)
    {
      if (!self->_addShortcutViewController)
      {
        v15 = -[AddShortcutViewController initWithShortcutEditSession:]([AddShortcutViewController alloc], "initWithShortcutEditSession:", v11);
        -[AddShortcutViewController setSessionController:](v15, "setSessionController:", self);
        addShortcutViewController = self->_addShortcutViewController;
        self->_addShortcutViewController = v15;
        v17 = v15;

        -[AddShortcutViewController setAccessibilityIdentifier:](v17, "setAccessibilityIdentifier:", CFSTR("AddShortcutView"));
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      objc_msgSend(WeakRetained, "presentController:animated:", self->_addShortcutViewController, 1);

    }
  }

}

- (void)_showAddShortcut:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  AddShortcutViewController *addShortcutSetupViewController;
  AddShortcutViewController *v13;
  AddShortcutViewController *v14;
  id WeakRetained;
  id v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v16 = a3;
  v11 = a4;
  addShortcutSetupViewController = self->_addShortcutSetupViewController;
  if (!addShortcutSetupViewController)
  {
    v13 = -[AddShortcutViewController initWithShortcutEditSession:]([AddShortcutViewController alloc], "initWithShortcutEditSession:", v16);
    -[AddShortcutViewController setSessionController:](v13, "setSessionController:", self);
    v14 = self->_addShortcutSetupViewController;
    self->_addShortcutSetupViewController = v13;

    addShortcutSetupViewController = self->_addShortcutSetupViewController;
  }
  if (sub_1002A8AA0(addShortcutSetupViewController) == 5)
  {
    -[ShortcutEditSessionControllerImpl _presentViewController:sourceView:sourceRect:](self, "_presentViewController:sourceView:sourceRect:", self->_addShortcutSetupViewController, v11, x, y, width, height);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "presentController:animated:", self->_addShortcutSetupViewController, 1);

  }
}

- (void)_meCard_showAddShortcut:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  MeCardShortcutViewController *meCardSetupViewController;
  MeCardShortcutViewController *v13;
  MeCardShortcutViewController *v14;
  id WeakRetained;
  id v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v16 = a3;
  v11 = a4;
  meCardSetupViewController = self->_meCardSetupViewController;
  if (!meCardSetupViewController)
  {
    v13 = -[MeCardShortcutViewController initWithShortcutEditSession:]([MeCardShortcutViewController alloc], "initWithShortcutEditSession:", v16);
    -[MeCardShortcutViewController setSessionController:](v13, "setSessionController:", self);
    v14 = self->_meCardSetupViewController;
    self->_meCardSetupViewController = v13;

    meCardSetupViewController = self->_meCardSetupViewController;
  }
  if (sub_1002A8AA0(meCardSetupViewController) == 5)
  {
    -[ShortcutEditSessionControllerImpl _presentViewController:sourceView:sourceRect:](self, "_presentViewController:sourceView:sourceRect:", self->_meCardSetupViewController, v11, x, y, width, height);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "presentController:animated:", self->_meCardSetupViewController, 1);

  }
}

- (void)showAddContact:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  ContactSearchViewController *v7;

  v4 = a3;
  -[ShortcutEditSessionControllerImpl capturePresenter](self, "capturePresenter");
  v7 = -[ContactSearchViewController initWithShortcutEditSession:]([ContactSearchViewController alloc], "initWithShortcutEditSession:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSessionControllerImpl delegate](self, "delegate"));
  -[ContaineeViewController setContaineeDelegate:](v7, "setContaineeDelegate:", v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:", v7, 1);

}

- (void)addFavoriteButtonShortcut:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "setEditingModeType:", 1);
  -[ShortcutEditSessionControllerImpl editShortcut:sourceView:sourceRect:](self, "editShortcut:sourceView:sourceRect:", v4, 0, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortcut"));

  if (objc_msgSend(v7, "type") == (id)6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("NearbyTransit"));

    if (v6)
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 211, 254, 0);
  }
  else
  {

  }
}

- (void)editShortcut:(id)a3
{
  -[ShortcutEditSessionControllerImpl editShortcut:sourceView:sourceRect:](self, "editShortcut:sourceView:sourceRect:", a3, 0, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
}

- (void)editShortcut:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  id WeakRetained;
  id v15;
  uint64_t v16;
  ShortcutEditSession *shortcutEditSession;
  void *v18;
  void *v19;
  EditShortcutViewController *v20;
  EditShortcutViewController *editShortcutViewController;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3;
  v13 = a4;
  objc_storeStrong((id *)&self->_shortcutEditSession, a3);
  -[ShortcutEditSessionControllerImpl capturePresenter](self, "capturePresenter");
  if (objc_msgSend(v12, "editOnlyLocation"))
  {
    -[ShortcutEditSessionControllerImpl showRefineLocation:](self, "showRefineLocation:", v12);
    goto LABEL_9;
  }
  if ((objc_msgSend(v12, "editOnlyAddress") & 1) != 0 || objc_msgSend(v12, "editingModeType") == (id)1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentViewController"));

    v16 = objc_opt_class(AddShortcutViewController);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    {
      objc_initWeak(&location, self);
      shortcutEditSession = self->_shortcutEditSession;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100795254;
      v22[3] = &unk_1011AC888;
      objc_copyWeak(&v24, &location);
      v23 = v15;
      -[ShortcutEditSession saveWithCompletion:](shortcutEditSession, "saveWithCompletion:", v22);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    else
    {
      -[ShortcutEditSessionControllerImpl showAddShortcut:](self, "showAddShortcut:", v12);
    }
    goto LABEL_8;
  }
  if (objc_msgSend(v12, "isSetupPlaceholder")
    && !+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled")
    || +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled")
    && (v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "shortcut")),
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "geoMapItem")),
        v19,
        v18,
        !v19))
  {
    -[ShortcutEditSessionControllerImpl showAddShortcut:sourceView:sourceRect:](self, "showAddShortcut:sourceView:sourceRect:", v12, v13, x, y, width, height);
    goto LABEL_9;
  }
  if (!self->_editShortcutViewController)
  {
    v20 = -[EditShortcutViewController initWithShortcutEditSession:]([EditShortcutViewController alloc], "initWithShortcutEditSession:", v12);
    -[EditShortcutViewController setSessionController:](v20, "setSessionController:", self);
    editShortcutViewController = self->_editShortcutViewController;
    self->_editShortcutViewController = v20;

  }
  if (!v13)
  {
    v15 = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(v15, "presentController:animated:", self->_editShortcutViewController, 1);
LABEL_8:

    goto LABEL_9;
  }
  if (!self->_popoverPresentationController)
    -[ShortcutEditSessionControllerImpl _presentViewController:sourceView:sourceRect:](self, "_presentViewController:sourceView:sourceRect:", self->_editShortcutViewController, v13, x, y, width, height);
LABEL_9:

}

- (void)_presentViewController:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  UIPopoverPresentationController *v13;
  UIPopoverPresentationController *popoverPresentationController;
  id WeakRetained;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  objc_msgSend(v11, "setModalPresentationStyle:", 7);
  v13 = (UIPopoverPresentationController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "popoverPresentationController"));
  popoverPresentationController = self->_popoverPresentationController;
  self->_popoverPresentationController = v13;

  -[UIPopoverPresentationController setDelegate:](self->_popoverPresentationController, "setDelegate:", self);
  -[UIPopoverPresentationController setSourceView:](self->_popoverPresentationController, "setSourceView:", v12);
  -[UIPopoverPresentationController setSourceRect:](self->_popoverPresentationController, "setSourceRect:", x, y, width, height);
  -[UIPopoverPresentationController setPermittedArrowDirections:](self->_popoverPresentationController, "setPermittedArrowDirections:", 4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v16 = sub_1002A8AA0(WeakRetained);

  if (v16 == 5)
  {
    objc_initWeak(&location, self);
    v17 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100795450;
    v19[3] = &unk_1011AD1E8;
    objc_copyWeak(&v21, &location);
    v20 = v11;
    objc_msgSend(v17, "dismissViewControllerAnimated:completion:", 1, v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    v18 = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(v18, "_maps_topMostPresentViewController:animated:completion:", v11, 1, 0);

  }
}

- (void)removeShortcut:(id)a3
{
  id WeakRetained;
  EditShortcutViewController *v5;
  EditShortcutViewController *editShortcutViewController;
  id v7;

  objc_msgSend(a3, "removeFromShortcutsWithCompletion:", &stru_1011C6808);
  if (self->_popoverPresentationController)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v5 = (EditShortcutViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "presentedViewController"));
    editShortcutViewController = self->_editShortcutViewController;

    if (v5 == editShortcutViewController)
    {
      v7 = objc_loadWeakRetained((id *)&self->_containerViewController);
      objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

    }
  }
  if (self->_editShortcutViewController)
    -[ShortcutEditSessionControllerImpl closeViewController:](self, "closeViewController:");
}

- (void)endSession
{
  void *v3;
  void *v4;
  void (**v5)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSessionControllerImpl delegate](self, "delegate"));
  objc_msgSend(v3, "shortcutEditSessionControllerFinished:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession completionHandler](self->_shortcutEditSession, "completionHandler"));
  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[ShortcutEditSession completionHandler](self->_shortcutEditSession, "completionHandler"));
    v5[2]();

  }
}

- (void)closeViewController:(id)a3
{
  UIPopoverPresentationController *popoverPresentationController;
  id v5;
  id WeakRetained;
  void *v7;
  void *editShortcutViewController;
  ContaineeProtocol *presentingViewController;
  uint64_t v10;
  uint64_t v11;
  ContaineeProtocol *v12;
  MeCardShortcutViewController *v13;

  v13 = (MeCardShortcutViewController *)a3;
  if (self->_meCardSetupViewController == v13 && self->_editShortcutViewController)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v7 = WeakRetained;
    editShortcutViewController = self->_editShortcutViewController;
LABEL_18:
    objc_msgSend(WeakRetained, "presentController:animated:", editShortcutViewController, 1);

    goto LABEL_19;
  }
  -[ShortcutEditSessionControllerImpl endSession](self, "endSession");
  popoverPresentationController = self->_popoverPresentationController;
  if (popoverPresentationController)
  {
    self->_popoverPresentationController = 0;

LABEL_4:
    v5 = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

    goto LABEL_19;
  }
  presentingViewController = self->_presentingViewController;
  if (presentingViewController)
  {
    v10 = objc_opt_class(AddShortcutViewController);
    if ((objc_opt_isKindOfClass(presentingViewController, v10) & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      v7 = WeakRetained;
      editShortcutViewController = self->_presentingViewController;
      goto LABEL_18;
    }
    v11 = sub_1002A8AA0(v13);
    v12 = self->_presentingViewController;
    if (v11 == 5 && v12 == (ContaineeProtocol *)v13)
    {
      if (-[MeCardShortcutViewController modalPresentationStyle](v13, "modalPresentationStyle") == (id)2)
        goto LABEL_4;
      v12 = self->_presentingViewController;
    }
    -[ContaineeProtocol handleDismissAction:](v12, "handleDismissAction:", self);
    goto LABEL_19;
  }
  if (sub_1002A8AA0(v13) == 5
    && -[MeCardShortcutViewController modalPresentationStyle](v13, "modalPresentationStyle") == (id)2)
  {
    goto LABEL_4;
  }
LABEL_19:

}

- (CNContact)meCardContact
{
  CNContact *meCardContact;
  void *v4;
  CNContact *v5;
  CNContact *v6;

  meCardContact = self->_meCardContact;
  if (!meCardContact)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
    v5 = (CNContact *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "meCard"));
    v6 = self->_meCardContact;
    self->_meCardContact = v5;

    meCardContact = self->_meCardContact;
  }
  return meCardContact;
}

- (void)showMeCard
{
  void *v3;
  id v4;
  _QWORD *v5;
  ContainerViewController **p_containerViewController;
  id WeakRetained;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSessionControllerImpl meCardContact](self, "meCardContact"));
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1007958DC;
  v12[3] = &unk_1011AD1E8;
  objc_copyWeak(&v14, &location);
  v4 = v3;
  v13 = v4;
  v5 = objc_retainBlock(v12);
  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  v8 = sub_1002A8AA0(WeakRetained);

  if (v8 == 5)
  {
    v9 = objc_loadWeakRetained((id *)p_containerViewController);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100795958;
    v10[3] = &unk_1011ADA00;
    v11 = v5;
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, v10);

  }
  else
  {
    ((void (*)(_QWORD *))v5[2])(v5);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)showMeCardWithAddress:(id)a3 from:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSessionControllerImpl meCardContact](self, "meCardContact"));

  if (v9)
  {
    if (v7)
    {
      v10 = objc_alloc_init((Class)CNMutableContact);
      v15 = v7;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
      objc_msgSend(v10, "setPostalAddresses:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSessionControllerImpl meCardContact](self, "meCardContact"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController viewControllerForUpdatingContact:withPropertiesFromContact:](CNContactViewController, "viewControllerForUpdatingContact:withPropertiesFromContact:", v12, v10));

      objc_storeStrong((id *)&self->_addressToAdd, a3);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSessionControllerImpl meCardContact](self, "meCardContact"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController viewControllerForContact:](CNContactViewController, "viewControllerForContact:", v14));

      objc_msgSend(v13, "setActions:", (unint64_t)objc_msgSend(v13, "actions") | 0x100);
    }
    objc_msgSend(v13, "setEditMode:", 2);
    -[ShortcutEditSessionControllerImpl _showContactCard:](self, "_showContactCard:", v13);

  }
  else if (v8)
  {
    objc_storeStrong((id *)&self->_addressToAdd, a3);
    -[ShortcutEditSessionControllerImpl presentChoicePickerFrom:](self, "presentChoicePickerFrom:", v8);
  }

}

- (void)createOrUpdateMeCardWithFavorite:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void (**v26)(_QWORD);
  id contactsSaveHandler;
  void *v28;
  _QWORD v29[4];
  void (**v30)(_QWORD);
  _QWORD v31[4];
  void (**v32)(_QWORD);
  void *v33;
  void *v34;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cnLabledAddress"));
  if (v8 && (objc_msgSend(v6, "isMeCardWritebackEnabled") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "meCard"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "value"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "postalAddresses"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CNLabeledValue firstLabeledValueWithValue:inArray:](CNLabeledValue, "firstLabeledValueWithValue:inArray:", v11, v12));

      if (v13)
      {
        v7[2](v7);
LABEL_14:

        goto LABEL_15;
      }
      v15 = objc_msgSend(v10, "mutableCopy");
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "postalAddresses"));
      v17 = objc_msgSend(v24, "mutableCopy");

      objc_msgSend(v17, "addObject:", v8);
      objc_msgSend(v15, "setPostalAddresses:", v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100795EB8;
      v31[3] = &unk_1011BA670;
      v32 = v7;
      objc_msgSend(v25, "updateContact:completion:", v15, v31);

    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEOUserAccountInfo primaryICloudAccount](GEOUserAccountInfo, "primaryICloudAccount"));
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "aa_firstName"));

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[GEOUserAccountInfo primaryICloudAccount](GEOUserAccountInfo, "primaryICloudAccount"));
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "aa_lastName"));

      if (v15 && v17)
      {
        v18 = objc_alloc_init((Class)CNMutableContact);
        v34 = v8;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
        objc_msgSend(v18, "setPostalAddresses:", v19);

        objc_msgSend(v18, "setGivenName:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[GEOUserAccountInfo primaryICloudAccount](GEOUserAccountInfo, "primaryICloudAccount"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "aa_middleName"));
        objc_msgSend(v18, "setMiddleName:", v21);

        objc_msgSend(v18, "setFamilyName:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_100795EC4;
        v29[3] = &unk_1011BA670;
        v30 = v7;
        objc_msgSend(v22, "createMeCardWithContact:completion:", v18, v29);

        v23 = v30;
      }
      else
      {
        v26 = objc_retainBlock(v7);
        contactsSaveHandler = self->contactsSaveHandler;
        self->contactsSaveHandler = v26;

        v18 = objc_alloc_init((Class)CNMutableContact);
        v33 = v8;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
        objc_msgSend(v18, "setPostalAddresses:", v28);

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController viewControllerForNewContact:](CNContactViewController, "viewControllerForNewContact:", v18));
        -[ShortcutEditSessionControllerImpl _showContactCard:](self, "_showContactCard:", v23);
      }

    }
    goto LABEL_14;
  }
  v7[2](v7);
LABEL_15:

}

- (void)_createNewContactCard
{
  id v3;
  void *v4;
  void *v5;
  CNLabeledValue *addressToAdd;

  if (self->_addressToAdd)
  {
    v3 = objc_alloc_init((Class)CNMutableContact);
    addressToAdd = self->_addressToAdd;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &addressToAdd, 1));
    objc_msgSend(v3, "setPostalAddresses:", v4);

  }
  else
  {
    v3 = 0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController viewControllerForNewContact:](CNContactViewController, "viewControllerForNewContact:", v3));
  -[ShortcutEditSessionControllerImpl _showContactCard:](self, "_showContactCard:", v5);

}

- (void)_showContactCard:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setDisplayMode:", 1);
  v6 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v4);

  if (sub_1002A8AA0(v6) == 5)
    v5 = 2;
  else
    v5 = -2;
  objc_msgSend(v6, "setModalPresentationStyle:", v5);
  -[ShortcutEditSessionControllerImpl _presentContactVC:](self, "_presentContactVC:", v6);

}

- (void)_showContactPicker
{
  uint64_t v3;
  id v4;

  v4 = objc_alloc_init((Class)CNContactPickerViewController);
  objc_msgSend(v4, "setDelegate:", self);
  if (sub_1002A8AA0(v4) == 5)
    v3 = 2;
  else
    v3 = -2;
  objc_msgSend(v4, "setModalPresentationStyle:", v3);
  -[ShortcutEditSessionControllerImpl _presentContactVC:](self, "_presentContactVC:", v4);

}

- (void)_presentContactVC:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (sub_1002A8AA0(v4) == 5)
  {
    -[EditShortcutViewController setOpeningContactController:](self->_editShortcutViewController, "setOpeningContactController:", 1);
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSessionControllerImpl containerViewController](self, "containerViewController"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1007961C4;
    v7[3] = &unk_1011AD1E8;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSessionControllerImpl containerViewController](self, "containerViewController"));
    objc_msgSend(v6, "_maps_topMostPresentViewController:animated:completion:", v4, 1, 0);

  }
}

- (void)presentChoicePickerFrom:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Shortcut] No Existing Contact Card"), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, 0, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverPresentationController"));
  objc_msgSend(v8, "setSourceView:", v4);

  objc_initWeak(location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Create a new one"), CFSTR("localized string not found"), 0));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10079654C;
  v22[3] = &unk_1011AFA88;
  objc_copyWeak(&v23, location);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, v22));
  objc_msgSend(v7, "addAction:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Choose an existing one"), CFSTR("localized string not found"), 0));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100796578;
  v20[3] = &unk_1011AFA88;
  objc_copyWeak(&v21, location);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, v20));
  objc_msgSend(v7, "addAction:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("[Collection] Alert's cancel button title"), CFSTR("localized string not found"), 0));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1007965A4;
  v19[3] = &unk_1011AD938;
  v19[4] = self;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 1, v19));
  objc_msgSend(v7, "addAction:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSessionControllerImpl containerViewController](self, "containerViewController"));
  objc_msgSend(v18, "_maps_topMostPresentViewController:animated:completion:", v7, 1, 0);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(location);

}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6;
  id v7;
  MeCardShortcutViewController *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  CNLabeledValue *addressToAdd;
  void *v22;
  id v23;
  MeCardShortcutViewController *v24;
  id v25;
  id v26;
  MeCardShortcutViewController *v27;
  _QWORD v28[4];
  id v29;
  MeCardShortcutViewController *v30;
  ShortcutEditSessionControllerImpl *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v6 = a3;
  v7 = a4;
  v8 = self->_meCardSetupViewController;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
    v10 = objc_msgSend(v9, "meCardExists");

    if ((v10 & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contactStore"));
      objc_msgSend(v12, "setMeContact:error:", v7, 0);

    }
    if (self->_addressToAdd)
    {
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "postalAddresses"));
      v14 = (uint64_t)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v14)
      {
        v26 = a4;
        v27 = v8;
        v15 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v34 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[CNLabeledValue identifier](self->_addressToAdd, "identifier", v26, v27));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
            v20 = objc_msgSend(v18, "isEqualToString:", v19);

            if ((v20 & 1) != 0)
            {
              v14 = 1;
              goto LABEL_17;
            }
          }
          v14 = (uint64_t)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          if (v14)
            continue;
          break;
        }
LABEL_17:
        a4 = v26;
        v8 = v27;
      }

      -[EditShortcutViewController didEditContactWithAddressAdded:](self->_editShortcutViewController, "didEditContactWithAddressAdded:", v14);
      addressToAdd = self->_addressToAdd;
      self->_addressToAdd = 0;

    }
    objc_storeStrong((id *)&self->_meCardContact, a4);
    -[MeCardShortcutViewController updateContact](v8, "updateContact");
  }
  else if (self->_addressToAdd)
  {
    -[EditShortcutViewController resetToMapItemType](self->_editShortcutViewController, "resetToMapItemType");
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentingViewController"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100796860;
  v28[3] = &unk_1011AF1B0;
  v29 = v7;
  v30 = v8;
  v31 = self;
  v32 = v6;
  v23 = v6;
  v24 = v8;
  v25 = v7;
  objc_msgSend(v22, "dismissViewControllerAnimated:completion:", 1, v28);

}

- (void)contactPickerDidCancel:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "presentingViewController"));
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  if (self->_addressToAdd)
    -[EditShortcutViewController resetToMapItemType](self->_editShortcutViewController, "resetToMapItemType");
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v7;
  MeCardShortcutViewController *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  MeCardShortcutViewController *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  MeCardShortcutViewController *v17;
  ShortcutEditSessionControllerImpl *v18;

  v7 = a4;
  v8 = self->_meCardSetupViewController;
  objc_storeStrong((id *)&self->_meCardContact, a4);
  v9 = a3;
  -[MeCardShortcutViewController updateContact](self->_meCardSetupViewController, "updateContact");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contactStore"));
  objc_msgSend(v11, "setMeContact:error:", v7, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentingViewController"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100796A54;
  v15[3] = &unk_1011AD238;
  v16 = v7;
  v17 = v8;
  v18 = self;
  v13 = v8;
  v14 = v7;
  objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, v15);

}

- (void)presentationControllerWillDismiss:(id)a3
{
  if (self->_popoverPresentationController == a3)
    -[ShortcutEditSessionControllerImpl closeViewController:](self, "closeViewController:", self->_editShortcutViewController);
}

- (ShortcutEditSessionControllerDelegate)delegate
{
  return (ShortcutEditSessionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ContainerViewController)containerViewController
{
  return (ContainerViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void)setContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containerViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->contactsSaveHandler, 0);
  objc_storeStrong((id *)&self->_popoverPresentationController, 0);
  objc_storeStrong((id *)&self->_addressToAdd, 0);
  objc_storeStrong((id *)&self->_meCardContact, 0);
  objc_storeStrong((id *)&self->_homeWorkCoordinator, 0);
  objc_storeStrong((id *)&self->_shortcutEditSession, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_addShortcutSetupViewController, 0);
  objc_storeStrong((id *)&self->_meCardSetupViewController, 0);
  objc_storeStrong((id *)&self->_refineCoordinateViewController, 0);
  objc_storeStrong((id *)&self->_editShortcutViewController, 0);
  objc_storeStrong((id *)&self->_addShortcutViewController, 0);
}

@end
