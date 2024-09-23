@implementation BKActionController

- (BKActionController)init
{
  BKActionController *v2;
  NSMutableArray *v3;
  NSMutableArray *includedActivityTypes;
  NSMutableArray *v5;
  NSMutableArray *excludedActivityTypes;
  NSMutableArray *v7;
  NSMutableArray *applicationActivities;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKActionController;
  v2 = -[BKActionController init](&v10, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableArray);
    includedActivityTypes = v2->_includedActivityTypes;
    v2->_includedActivityTypes = v3;

    v5 = objc_opt_new(NSMutableArray);
    excludedActivityTypes = v2->_excludedActivityTypes;
    v2->_excludedActivityTypes = v5;

    v7 = objc_opt_new(NSMutableArray);
    applicationActivities = v2->_applicationActivities;
    v2->_applicationActivities = v7;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BKActionController;
  -[BKActionController dealloc](&v4, "dealloc");
}

- (void)cancelActions
{
  Class v2;
  id v3;

  if (self->_showsPrint && -[BKActionController canPrintBook](self, "canPrintBook"))
  {
    v2 = NSClassFromString(CFSTR("UIPrintInteractionController"));
    if (v2)
    {
      v3 = (id)objc_claimAutoreleasedReturnValue(-[objc_class sharedPrintController](v2, "sharedPrintController"));
      objc_msgSend(v3, "dismissAnimated:", 1);

    }
  }
}

- (id)barButtonItem
{
  UIBarButtonItem *v3;
  UIBarButtonItem *actionButton;

  if (-[BKActionController _hasValidActions](self, "_hasValidActions") && !self->_actionButton)
  {
    v3 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem bc_readingExperienceBarItem:target:action:](UIBarButtonItem, "bc_readingExperienceBarItem:target:action:", CFSTR("square.and.arrow.up"), self, "showActionControls:"));
    actionButton = self->_actionButton;
    self->_actionButton = v3;

  }
  return self->_actionButton;
}

- (void)_setActivities
{
  if (self->_showsEmail && -[BKActionController canEmailBook](self, "canEmailBook"))
  {
    -[NSMutableArray addObject:](self->_includedActivityTypes, "addObject:", UIActivityTypeMail);
    -[NSMutableArray addObject:](self->_includedActivityTypes, "addObject:", UIActivityTypeMessage);
  }
  if (self->_showsPrint)
  {
    if (-[BKActionController canPrintBook](self, "canPrintBook"))
      -[NSMutableArray addObject:](self->_includedActivityTypes, "addObject:", UIActivityTypePrint);
  }
}

- (id)activityItems
{
  BKActivityURLItemSource *v3;
  void *v4;
  void *v5;
  BKActivityURLItemSource *v6;
  void *v7;

  v3 = [BKActivityURLItemSource alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKActionController bookInfo](self, "bookInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookBundlePath"));
  v6 = -[BKActivityURLItemSource initWithPath:](v3, "initWithPath:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v6));
  return v7;
}

- (void)showActionControls:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  -[NSMutableArray removeAllObjects](self->_includedActivityTypes, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_excludedActivityTypes, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_applicationActivities, "removeAllObjects");
  -[BKActionController _setActivities](self, "_setActivities");
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_3E558;
  v11[3] = &unk_1BF990;
  objc_copyWeak(&v13, &location);
  v5 = v4;
  v12 = v5;
  v6 = objc_retainBlock(v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BCProgressKitController sharedController](BCProgressKitController, "sharedController"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_3E8C8;
  v9[3] = &unk_1BF9B8;
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "activeContextWithCompletion:", v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (BOOL)canEmailBook
{
  return 1;
}

- (BOOL)_hasValidActions
{
  if (-[BKActionController canEmailBook](self, "canEmailBook"))
    return 1;
  else
    return -[BKActionController canPrintBook](self, "canPrintBook");
}

- (BOOL)showsEmail
{
  return self->_showsEmail;
}

- (void)setShowsEmail:(BOOL)a3
{
  self->_showsEmail = a3;
}

- (BOOL)showsPrint
{
  return self->_showsPrint;
}

- (void)setShowsPrint:(BOOL)a3
{
  self->_showsPrint = a3;
}

- (AEBookInfo)bookInfo
{
  return self->_bookInfo;
}

- (void)setBookInfo:(id)a3
{
  objc_storeStrong((id *)&self->_bookInfo, a3);
}

- (BKViewController)ancestorViewController
{
  return (BKViewController *)objc_loadWeakRetained((id *)&self->_ancestorViewController);
}

- (void)setAncestorViewController:(id)a3
{
  objc_storeWeak((id *)&self->_ancestorViewController, a3);
}

- (BKActionControllerDelegate)delegate
{
  return (BKActionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)includedActivityTypes
{
  return self->_includedActivityTypes;
}

- (void)setIncludedActivityTypes:(id)a3
{
  objc_storeStrong((id *)&self->_includedActivityTypes, a3);
}

- (NSMutableArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
  objc_storeStrong((id *)&self->_excludedActivityTypes, a3);
}

- (NSMutableArray)applicationActivities
{
  return self->_applicationActivities;
}

- (void)setApplicationActivities:(id)a3
{
  objc_storeStrong((id *)&self->_applicationActivities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationActivities, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_includedActivityTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_ancestorViewController);
  objc_storeStrong((id *)&self->_bookInfo, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end
