@implementation AddShortcutViewController

- (AddShortcutViewController)initWithShortcutEditSession:(id)a3
{
  id v5;
  AddShortcutViewController *v6;
  AddShortcutViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AddShortcutViewController;
  v6 = -[AddFromACViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_shortcutEditSession, a3);

  return v7;
}

- (id)headerTitle
{
  return -[ShortcutEditSession titleForAddressPicker](self->_shortcutEditSession, "titleForAddressPicker");
}

- (int)requestSource
{
  return 21;
}

- (BOOL)showsRecents
{
  return 0;
}

- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)AddShortcutViewController;
  if (-[AddFromACViewController searchDataSource:shouldFilterItem:](&v9, "searchDataSource:shouldFilterItem:", a3, v6))
    v7 = 1;
  else
    v7 = -[ShortcutEditSession shortcutsContainItem:](self->_shortcutEditSession, "shortcutsContainItem:", v6);

  return v7;
}

- (void)saveMapItem:(id)a3
{
  id v4;

  -[ShortcutEditSession setMapItem:](self->_shortcutEditSession, "setMapItem:", a3);
  if (sub_1002A8AA0(self) == 5)
  {
    -[ShortcutEditSession saveWithCompletion:](self->_shortcutEditSession, "saveWithCompletion:", &stru_1011E1F58);
    v4 = (id)objc_claimAutoreleasedReturnValue(-[AddShortcutViewController sessionController](self, "sessionController"));
    objc_msgSend(v4, "closeViewController:", self);
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[AddShortcutViewController sessionController](self, "sessionController"));
    objc_msgSend(v4, "editShortcut:", self->_shortcutEditSession);
  }

}

- (void)saveShortcut:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "type") == (id)6)
  {
    objc_msgSend(v9, "setIsHidden:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSessionWithShortcut:](ShortcutEditSession, "addSessionWithShortcut:", v9));
    objc_msgSend(v4, "setMoveToPreferredIndexInFavorites:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AddShortcutViewController sessionController](self, "sessionController"));
    objc_msgSend(v5, "addFavoriteButtonShortcut:", v4);

  }
  else if (sub_1002A8AA0(self) == 5 || -[ShortcutEditSession alreadySaved](self->_shortcutEditSession, "alreadySaved"))
  {
    v6 = objc_alloc((Class)MKMapItem);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoMapItem"));
    v4 = objc_msgSend(v6, "initWithGeoMapItem:isPlaceHolderPlace:", v7, 0);

    -[AddShortcutViewController saveMapItem:](self, "saveMapItem:", v4);
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSessionWithShortcut:](ShortcutEditSession, "addSessionWithShortcut:", v9));
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v8, "viewController:editShortcut:", self, v4);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AddShortcutViewController sessionController](self, "sessionController"));
      objc_msgSend(v8, "editShortcut:", v4);
    }

  }
}

- (void)handleDismissAction:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v6.receiver = self;
    v6.super_class = (Class)AddShortcutViewController;
    -[ContaineeViewController handleDismissAction:](&v6, "handleDismissAction:", v4);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AddShortcutViewController sessionController](self, "sessionController"));
    objc_msgSend(v5, "closeViewController:", self);

  }
}

- (void)didDismissByGesture
{
  id v3;
  objc_super v4;

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v4.receiver = self;
    v4.super_class = (Class)AddShortcutViewController;
    -[ContaineeViewController didDismissByGesture](&v4, "didDismissByGesture");
  }
  else
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[AddShortcutViewController sessionController](self, "sessionController"));
    objc_msgSend(v3, "closeViewController:", self);

  }
}

- (int64_t)shortcutType
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession shortcut](self->_shortcutEditSession, "shortcut"));
  if (objc_msgSend(v3, "type") == (id)1)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession shortcut](self->_shortcutEditSession, "shortcut"));
    v4 = objc_msgSend(v5, "type");

  }
  return (int64_t)v4;
}

- (int64_t)accessoryTypeToShow
{
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    return 4;
  else
    return 1;
}

- (ShortcutEditSessionController)sessionController
{
  return (ShortcutEditSessionController *)objc_loadWeakRetained((id *)&self->_sessionController);
}

- (void)setSessionController:(id)a3
{
  objc_storeWeak((id *)&self->_sessionController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionController);
  objc_storeStrong((id *)&self->_shortcutEditSession, 0);
}

@end
