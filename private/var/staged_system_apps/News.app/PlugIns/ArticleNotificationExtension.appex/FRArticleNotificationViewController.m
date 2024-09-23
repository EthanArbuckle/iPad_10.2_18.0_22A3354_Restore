@implementation FRArticleNotificationViewController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double Width;
  void *v8;
  double Height;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  v17.receiver = self;
  v17.super_class = (Class)FRArticleNotificationViewController;
  -[FRArticleNotificationViewController viewDidLoad](&v17, "viewDidLoad");
  v3 = objc_msgSend(objc_alloc((Class)NSSArticleViewControllerInternal), "initWithNibName:bundle:", 0, 0);
  -[FRArticleNotificationViewController setArticleViewController:](self, "setArticleViewController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationViewController articleViewController](self, "articleViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "setAutoresizingMask:", 18);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  Width = CGRectGetWidth(v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationViewController view](self, "view"));
  objc_msgSend(v8, "bounds");
  Height = CGRectGetHeight(v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationViewController articleViewController](self, "articleViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
  objc_msgSend(v11, "setFrame:", 0.0, 0.0, Width, Height);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationViewController articleViewController](self, "articleViewController"));
  -[FRArticleNotificationViewController addChildViewController:](self, "addChildViewController:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationViewController articleViewController](self, "articleViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
  objc_msgSend(v13, "addSubview:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationViewController articleViewController](self, "articleViewController"));
  objc_msgSend(v16, "didMoveToParentViewController:", self);

}

- (FRArticleNotificationArticleSource)articleSource
{
  FRArticleNotificationArticleSource *articleSource;
  uint64_t v4;
  void *v5;
  FRArticleNotificationArticleSource *v6;
  FRArticleNotificationArticleSource *v7;

  articleSource = self->_articleSource;
  if (!articleSource)
  {
    v4 = FCURLForContainerizedUserAccountCachesDirectory(1, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = -[FRArticleNotificationArticleSource initWithCachesDirectory:]([FRArticleNotificationArticleSource alloc], "initWithCachesDirectory:", v5);
    v7 = self->_articleSource;
    self->_articleSource = v6;

    articleSource = self->_articleSource;
  }
  return articleSource;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FRArticleNotificationViewController;
  -[FRArticleNotificationViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[FRArticleNotificationViewController articlePreferredSize](self, "articlePreferredSize");
  -[FRArticleNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewDidDisappear:(BOOL)a3
{
  FRArticleNotificationArticleSource *articleSource;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FRArticleNotificationViewController;
  -[FRArticleNotificationViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  articleSource = self->_articleSource;
  self->_articleSource = 0;

}

- (void)didReceiveNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "content"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attachments"));
  v11 = objc_msgSend(v10, "count");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", FCNotificationPayloadNewsKey));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", FCNotificationPayloadArticleIDKey));
  -[FRArticleNotificationViewController setArticleID:](self, "setArticleID:", v13);
  objc_initWeak(&location, self);
  if (v11)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100004F08;
    v19[3] = &unk_100008350;
    objc_copyWeak(&v20, &location);
    +[NSSArticleInternal articleFromNotification:completion:](NSSArticleInternal, "articleFromNotification:completion:", v4, v19);
    v14 = &v20;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationViewController articleSource](self, "articleSource"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100004FDC;
    v16[3] = &unk_100008378;
    objc_copyWeak(&v18, &location);
    v17 = v4;
    objc_msgSend(v15, "fetchArticleWithID:completion:", v13, v16);

    v14 = &v18;
  }
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

- (NSSArticleViewControllerInternal)articleViewController
{
  return self->_articleViewController;
}

- (void)setArticleViewController:(id)a3
{
  objc_storeStrong((id *)&self->_articleViewController, a3);
}

- (void)setArticleSource:(id)a3
{
  objc_storeStrong((id *)&self->_articleSource, a3);
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
  objc_storeStrong((id *)&self->_articleID, a3);
}

- (CGSize)articlePreferredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_articlePreferredSize.width;
  height = self->_articlePreferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setArticlePreferredSize:(CGSize)a3
{
  self->_articlePreferredSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_articleSource, 0);
  objc_storeStrong((id *)&self->_articleViewController, 0);
}

@end
