@implementation RAPReportTableViewController

- (RAPReportTableViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  RAPReportTableViewController *v11;
  RAPReportViewControllerDelegate *v12;
  RAPReportViewControllerDelegate *rapDelegate;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)RAPReportTableViewController;
  v11 = -[RAPTableViewController init](&v20, "init");
  if (v11)
  {
    v12 = -[RAPReportViewControllerDelegate initWithReport:completion:delegate:]([RAPReportViewControllerDelegate alloc], "initWithReport:completion:delegate:", v8, v10, v11);
    rapDelegate = v11->_rapDelegate;
    v11->_rapDelegate = v12;

    if (v9)
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedTitle"));
    else
      v14 = objc_claimAutoreleasedReturnValue(+[RAPQuestion RAPTitle](RAPQuestion, "RAPTitle"));
    v15 = (void *)v14;
    -[RAPReportTableViewController setTitle:](v11, "setTitle:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Back"), CFSTR("localized string not found"), 0));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController navigationItem](v11, "navigationItem"));
    objc_msgSend(v18, "setBackButtonTitle:", v17);

  }
  return v11;
}

- (UIBarButtonItem)sendButtonItem
{
  return -[RAPReportViewControllerDelegate sendButtonItem](self->_rapDelegate, "sendButtonItem");
}

- (RAPReport)report
{
  return -[RAPReportViewControllerDelegate report](self->_rapDelegate, "report");
}

- (id)completion
{
  return -[RAPReportViewControllerDelegate completion](self->_rapDelegate, "completion");
}

- (void)invokeCompletionWithOutcome:(int64_t)a3
{
  -[RAPReportViewControllerDelegate invokeCompletionWithOutcome:](self->_rapDelegate, "invokeCompletionWithOutcome:", a3);
}

- (void)_send
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController view](self, "view"));
  objc_msgSend(v3, "endEditing:", 1);

  if (MapsFeature_IsEnabled_RAPCommunityID(v4, v5) && !self->_userInfoPart)
  {
    -[RAPReportTableViewController invokeCompletionWithOutcome:](self, "invokeCompletionWithOutcome:", 1);
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1009F6B1C;
    v6[3] = &unk_1011BD0B8;
    v6[4] = self;
    +[RAPPrivacy performPrivacyCheckWithAppearance:completion:](RAPPrivacy, "performPrivacyCheckWithAppearance:completion:", 1, v6);
  }
}

- (BOOL)usesNavigationControllerPushForSegue
{
  return 1;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPReportTableViewController;
  -[RAPTableViewController viewDidLoad](&v3, "viewDidLoad");
  -[RAPReportTableViewController _maps_setNeedsUpdate:withSelector:](self, "_maps_setNeedsUpdate:withSelector:", 0, "_updateTableParts");
  -[RAPReportTableViewController _updateTablePartsScrolling:](self, "_updateTablePartsScrolling:", 0);
}

- (NSArray)tableParts
{
  return 0;
}

- (RAPUserInfoPart)userInfoPart
{
  RAPUserInfoPart *userInfoPart;
  RAPUserInfoPart *v4;
  RAPUserInfoPart *v5;

  userInfoPart = self->_userInfoPart;
  if (!userInfoPart)
  {
    v4 = objc_alloc_init(RAPUserInfoPart);
    v5 = self->_userInfoPart;
    self->_userInfoPart = v4;

    userInfoPart = self->_userInfoPart;
  }
  return userInfoPart;
}

- (void)_updateTablePartsScrolling:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  char isKindOfClass;
  id v13;
  uint64_t v14;
  char v15;
  id v16;
  id v17;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController tableParts](self, "tableParts"));
  if (v5)
  {
    v17 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tableParts"));
    v8 = objc_msgSend(v7, "isEqual:", v17);

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource"));
      objc_msgSend(v9, "setTableParts:withRowAnimation:", v17, 0);

    }
    if (!v3)
      goto LABEL_11;
    WeakRetained = objc_loadWeakRetained(&self->_lastTablePartsUpdateSender);
    v11 = objc_opt_class(RAPTablePart);
    isKindOfClass = objc_opt_isKindOfClass(WeakRetained, v11);

    v13 = objc_loadWeakRetained(&self->_lastTablePartsUpdateSender);
    if ((isKindOfClass & 1) == 0)
    {
      v14 = objc_opt_class(RAPTablePartSection);
      v15 = objc_opt_isKindOfClass(v13, v14);

      if ((v15 & 1) == 0)
        goto LABEL_10;
      v16 = objc_loadWeakRetained(&self->_lastTablePartsUpdateSender);
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "partController"));

    }
    if (v13)
    {
      -[RAPTableViewController scrollToPartAfterPartAnimated:](self, "scrollToPartAfterPartAnimated:", v13);

LABEL_11:
      objc_storeWeak(&self->_lastTablePartsUpdateSender, 0);
      self->_scrollingSuppressed = 0;
      v5 = v17;
      goto LABEL_12;
    }
LABEL_10:
    -[RAPTableViewController scrollToBottomAnimated](self, "scrollToBottomAnimated");
    goto LABEL_11;
  }
LABEL_12:

}

- (void)_updateTableParts
{
  -[RAPReportTableViewController _updateTablePartsScrolling:](self, "_updateTablePartsScrolling:", !self->_scrollingSuppressed);
}

- (void)setNeedsTablePartsUpdateWithSender:(id)a3
{
  -[RAPReportTableViewController setNeedsTablePartsUpdateWithSender:scroll:](self, "setNeedsTablePartsUpdateWithSender:scroll:", a3, 1);
}

- (void)setNeedsTablePartsUpdateWithSender:(id)a3 scroll:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  id obj;

  obj = a3;
  v6 = objc_opt_class(RAPTablePart);
  if ((objc_opt_isKindOfClass(obj, v6) & 1) != 0
    || (v7 = objc_opt_class(RAPTablePartSection), (objc_opt_isKindOfClass(obj, v7) & 1) != 0))
  {
    objc_storeWeak(&self->_lastTablePartsUpdateSender, obj);
  }
  if (!a4)
    self->_scrollingSuppressed = 1;
  -[RAPReportTableViewController _maps_setNeedsUpdateWithSelector:](self, "_maps_setNeedsUpdateWithSelector:", "_updateTableParts");

}

- (void)updateTablePartsIfNeeded
{
  if (-[RAPReportTableViewController _maps_needsUpdateWithSelector:](self, "_maps_needsUpdateWithSelector:", "_updateTableParts"))
  {
    -[RAPReportTableViewController _maps_setNeedsUpdate:withSelector:](self, "_maps_setNeedsUpdate:withSelector:", 0, "_updateTableParts");
    -[RAPReportTableViewController _updateTableParts](self, "_updateTableParts");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoPart, 0);
  objc_storeStrong((id *)&self->_rapDelegate, 0);
  objc_destroyWeak(&self->_lastTablePartsUpdateSender);
}

@end
