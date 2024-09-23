@implementation ComposeNavigationController

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CC60;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9A88 != -1)
    dispatch_once(&qword_1005A9A88, block);
  return (OS_os_log *)(id)qword_1005A9A80;
}

+ (Class)placeholderFactoryClass
{
  return (Class)objc_opt_class(ComposePlaceholderViewFactory);
}

- (ComposeNavigationController)initWithComposition:(id)a3
{
  return -[ComposeNavigationController initWithComposition:mailComposeControllerOptions:](self, "initWithComposition:mailComposeControllerOptions:", a3, 0);
}

- (ComposeNavigationController)initWithComposition:(id)a3 mailComposeControllerOptions:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  ComposeNavigationController *v8;
  id v9;
  void *v10;
  MFMailComposeController *composeViewController;
  objc_super v13;

  v6 = a3;
  if (MFIsMobileMail())
    v7 = objc_opt_class(MFComposeNavigationBar);
  else
    v7 = 0;
  v13.receiver = self;
  v13.super_class = (Class)ComposeNavigationController;
  v8 = -[ComposeNavigationController initWithNavigationBarClass:toolbarClass:](&v13, "initWithNavigationBarClass:toolbarClass:", v7, 0);
  if (v8)
  {
    if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
      -[ComposeNavigationController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 1);
    v9 = objc_msgSend(objc_alloc((Class)MFMailComposeController), "initWithCompositionContext:options:", v6, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originatingBundleID"));
    objc_msgSend(v9, "setOriginatingBundleID:", v10);

    objc_msgSend(v9, "setSourceAccountManagement:", objc_msgSend(v6, "sourceAccountManagement"));
    -[ComposeNavigationController pushViewController:animated:](v8, "pushViewController:animated:", v9, 0);
    composeViewController = v8->_composeViewController;
    v8->_composeViewController = (MFMailComposeController *)v9;

  }
  return v8;
}

- (ComposeNavigationController)initWithUserActivity:(id)a3 scene:(id)a4
{
  id v5;
  void *v6;
  ComposeNavigationController *v7;

  v5 = sub_10004CEBC((uint64_t)ComposeNavigationController, a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[ComposeNavigationController initWithComposition:](self, "initWithComposition:", v6);

  return v7;
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)ComposeNavigationController;
  -[ComposeNavigationController viewDidLayoutSubviews](&v23, "viewDidLayoutSubviews");
  -[ComposeNavigationController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController view](self, "view"));
  objc_msgSend(v11, "setDirectionalLayoutMargins:", v4, v6, v8, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController view](self, "view"));
  objc_msgSend(v12, "directionalLayoutMargins");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController topViewController](self, "topViewController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
  objc_msgSend(v22, "setDirectionalLayoutMargins:", v14, v16, v18, v20);

}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ComposeNavigationController;
  -[ComposeNavigationController viewDidAppear:](&v7, "viewDidAppear:", a3);
  v4 = MSAccessibilityIdentifierComposeContainerView;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController view](self, "view"));
  objc_msgSend(v5, "setAccessibilityIdentifier:", v4);

  if ((objc_opt_respondsToSelector(self->_composeViewController, "mf_updateAlertSuppressionContextsForReason:") & 1) != 0)
    -[MFMailComposeController mf_updateAlertSuppressionContextsForReason:](self->_composeViewController, "mf_updateAlertSuppressionContextsForReason:", CFSTR("compose did appear"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeView](self, "_mailComposeView"));
  objc_msgSend(v6, "didAppear");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ComposeNavigationController;
  -[ComposeNavigationController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeView](self, "_mailComposeView"));
  objc_msgSend(v4, "willDisappear");

  if (-[ComposeNavigationController isQuickReply](self, "isQuickReply"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self, "_mailComposeController"));
    objc_msgSend(v5, "backUpDraft");

  }
}

- (MFMailComposeViewControllerDelegate)mailComposeDelegate
{
  return (MFMailComposeViewControllerDelegate *)-[MFMailComposeController delegate](self->_composeViewController, "delegate");
}

- (void)setMailComposeDelegate:(id)a3
{
  -[MFMailComposeController setDelegate:](self->_composeViewController, "setDelegate:", a3);
}

- (void)setContentVisible:(BOOL)a3
{
  -[MFMailComposeController setContentVisible:](self->_composeViewController, "setContentVisible:", a3);
}

- (void)setInitialTitle:(id)a3
{
  -[MFMailComposeController setInitialTitle:](self->_composeViewController, "setInitialTitle:", a3);
}

- (void)_setCompositionContext:(id)a3
{
  -[MFMailComposeController setCompositionContext:](self->_composeViewController, "setCompositionContext:", a3);
}

- (CGRect)frameForAttachmentWithIdentifier:(id)a3
{
  id v4;
  MFMailComposeController *v5;
  MFMailComposeController *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat x;
  double v19;
  CGFloat y;
  double v21;
  CGFloat width;
  double v23;
  CGFloat height;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  v4 = a3;
  v5 = self->_composeViewController;
  v6 = v5;
  if (v5)
  {
    -[MFMailComposeController frameForAttachmentWithIdentifier:](v5, "frameForAttachmentWithIdentifier:", v4);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController view](self, "view"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailComposeController view](v6, "view"));
    objc_msgSend(v15, "convertRect:fromView:", v16, v8, v10, v12, v14);
    x = v17;
    y = v19;
    width = v21;
    height = v23;

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (id)_mailComposeController
{
  return self->_composeViewController;
}

- (id)_mailComposeView
{
  return -[MFMailComposeController mailComposeView](self->_composeViewController, "mailComposeView");
}

- (BOOL)isDirty
{
  return -[MFMailComposeController isDirty](self->_composeViewController, "isDirty");
}

- (int64_t)resolution
{
  return (int64_t)-[MFMailComposeController resolution](self->_composeViewController, "resolution");
}

- (void)autosaveWithHandler:(id)a3
{
  -[MFMailComposeController autosaveWithHandler:](self->_composeViewController, "autosaveWithHandler:", a3);
}

- (id)userActivityForRestoration
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];

  v3 = objc_alloc((Class)NSUserActivity);
  v4 = objc_msgSend(v3, "initWithActivityType:", MSMailActivityHandoffTypeComposeWithStreams);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self, "_mailComposeController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "autosaveIdentifier"));

  v7 = MSMailComposeWindowTargetContentIdentifierWithIdentifier(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v4, "setTargetContentIdentifier:", v8);

  v18[0] = MSMailActivityHandoffTypeKey;
  v18[1] = MSMailActivityHandoffComposeKeyAutosaveID;
  v19[0] = MSMailActivityHandoffTypeComposeSansStreams;
  v19[1] = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v9));

  if (sub_10004D8D0(self))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController composeTitle](self, "composeTitle"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, MSMailActivityHandoffComposeKeySubject);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailComposeController compositionContext](self->_composeViewController, "compositionContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "preferredSendingEmailAddress"));
  if (v13)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, MSMailActivityHandoffComposeKeyPreferredSendingEmailAddress);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "originalMessage"));
  if ((*(unsigned int (**)(_QWORD, void *))(EFIsNotNull + 16))(EFIsNotNull, v14))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "serializedRepresentation"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, MSMailActivityHandoffComposeKeyOriginalMessageObjectID);

  }
  objc_msgSend(v4, "setUserInfo:", v10);

  return v4;
}

- (BOOL)canBeDocked
{
  return +[UIDevice mf_isPad](UIDevice, "mf_isPad") ^ 1;
}

- (id)dockIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self, "_mailComposeController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "autosaveIdentifier"));

  return v3;
}

+ (id)_dockedViewWithTitle:(id)a3 andFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  DockedPlaceholderView *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  v9 = -[DockedPlaceholderView initWithFrame:]([DockedPlaceholderView alloc], "initWithFrame:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailDockedPlaceholderViewBackgroundColor](UIColor, "mailDockedPlaceholderViewBackgroundColor"));
  -[DockedPlaceholderView setBackgroundColor:](v9, "setBackgroundColor:", v10);

  v11 = sub_10004DAB4(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView headerView](v9, "headerView"));
  objc_msgSend(v13, "setTitle:", v12);

  return v9;
}

+ (id)dockedViewForUserActivity:(id)a3 withFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", MSMailActivityHandoffComposeKeySubject));

  v11 = sub_10004DAB4(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_dockedViewWithTitle:andFrame:", v12, x, y, width, height));

  return v13;
}

- (id)dockedViewWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_opt_class(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController composeTitle](self, "composeTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_dockedViewWithTitle:andFrame:", v9, x, y, width, height));

  return v10;
}

- (void)willBeginDocking
{
  id v3;
  id v4;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self, "_mailComposeController"));
  objc_msgSend(v3, "saveFirstResponder");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self, "_mailComposeController"));
  objc_msgSend(v4, "autosaveIfNecessaryWithHandler:", 0);

}

- (void)didCompleteDocking
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self, "_mailComposeController"));
  objc_msgSend(v3, "backUpDraft");

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004DDB8;
  v4[3] = &unk_10051A848;
  v4[4] = self;
  sub_10004DEAC(self, v4);
}

- (id)composeTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self, "_mailComposeController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "navigationBarTitle"));

  return v3;
}

- (id)documentID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self, "_mailComposeController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "documentID"));

  return v3;
}

- (BOOL)shouldAutorotate
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  objc_super v7;

  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController parentViewController](self, "parentViewController"));
    v4 = v3;
    if (v3)
      v5 = objc_msgSend(v3, "shouldAutorotate");
    else
      v5 = 1;

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ComposeNavigationController;
    return -[ComposeNavigationController shouldAutorotate](&v7, "shouldAutorotate");
  }
  return v5;
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MFMailComposeController mailComposeView](self->_composeViewController, "mailComposeView"));
  objc_msgSend(v4, "scrollToTopAnimated:", v3);

}

- (void)serializedPlaceholderForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6 withHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self, "_mailComposeController"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10004E258;
  v18[3] = &unk_10051A898;
  v17 = v15;
  v19 = v17;
  objc_msgSend(v16, "serializedPlaceholderForFileName:fileSize:mimeType:contentID:withHandler:", v12, a4, v13, v14, v18);

}

- (void)securityScopeForURL:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self, "_mailComposeController"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004E338;
  v10[3] = &unk_10051A898;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "securityScopeForURL:withHandler:", v6, v10);

}

- (NSString)autosaveIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self, "_mailComposeController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "autosaveIdentifier"));

  return (NSString *)v3;
}

- (BOOL)isQuickReply
{
  return self->_quickReply;
}

- (void)setQuickReply:(BOOL)a3
{
  self->_quickReply = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeViewController, 0);
}

@end
