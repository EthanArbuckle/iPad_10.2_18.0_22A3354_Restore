@implementation NAQPreviewViewController

+ (id)resolver
{
  if (qword_100008848 != -1)
    dispatch_once(&qword_100008848, &stru_100004140);
  return objc_msgSend((id)qword_100008840, "resolver");
}

- (NAQPreviewViewController)init
{
  NAQPreviewViewController *v2;
  NAQPreviewViewController *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NUArticleContainerViewController *articleContainerViewController;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NAQPreviewViewController;
  v2 = -[NAQPreviewViewController init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend((id)objc_opt_class(v2), "resolver");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = objc_msgSend(v5, "resolveClass:", objc_opt_class(NUArticleContainerViewController));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    articleContainerViewController = v3->_articleContainerViewController;
    v3->_articleContainerViewController = (NUArticleContainerViewController *)v7;

    -[NUArticleContainerViewController setLinkPreviewing:](v3->_articleContainerViewController, "setLinkPreviewing:", 1);
    -[NUArticleContainerViewController setDelegate:](v3->_articleContainerViewController, "setDelegate:", v3);

  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NAQPreviewViewController;
  -[NAQPreviewViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NAQPreviewViewController articleContainerViewController](self, "articleContainerViewController"));
  -[NAQPreviewViewController addChildViewController:](self, "addChildViewController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NAQPreviewViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NAQPreviewViewController articleContainerViewController](self, "articleContainerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v4, "addSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NAQPreviewViewController articleContainerViewController](self, "articleContainerViewController"));
  objc_msgSend(v7, "didMoveToParentViewController:", self);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NAQPreviewViewController;
  -[NAQPreviewViewController viewDidLayoutSubviews](&v14, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NAQPreviewViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NAQPreviewViewController articleContainerViewController](self, "articleContainerViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

}

- (void)preparePreviewOfSearchableItemWithIdentifier:(id)a3 queryString:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  id v12;

  v7 = a3;
  v8 = a5;
  if (-[NAQPreviewViewController validateSearchableItemIdentifier:](self, "validateSearchableItemIdentifier:", v7))
  {
    -[NAQPreviewViewController setPreviewItemIdentifier:](self, "setPreviewItemIdentifier:", v7);
    -[NAQPreviewViewController setPreviewItemCallback:](self, "setPreviewItemCallback:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NAQPreviewViewController articleContainerViewController](self, "articleContainerViewController"));
    v12 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    objc_msgSend(v9, "loadWithArticleIDs:", v10);

  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100002D88;
    v11[3] = &unk_100004168;
    v11[4] = v7;
    v11[5] = v8;
    sub_100002D88((uint64_t)v11);
  }

}

- (void)articleContainerViewController:(id)a3 didLoadFirstPageWithIdentifier:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  if (v8
    && (v10 = objc_claimAutoreleasedReturnValue(-[NAQPreviewViewController previewItemIdentifier](self, "previewItemIdentifier"))) != 0
    && (v11 = (void *)v10,
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NAQPreviewViewController previewItemIdentifier](self, "previewItemIdentifier")),
        v13 = objc_msgSend(v8, "isEqualToString:", v12),
        v12,
        v11,
        v13))
  {
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NAQPreviewViewController previewItemCallback](self, "previewItemCallback"));
    ((void (**)(_QWORD, id))v14)[2](v14, v9);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NAQPreviewViewController previewItemIdentifier](self, "previewItemIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue(+[NSError naq_errorFailedUnexpectedArticleLoadedWithIdentifier:expectedIdentifier:](NSError, "naq_errorFailedUnexpectedArticleLoadedWithIdentifier:expectedIdentifier:", v8, v15));

    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NAQPreviewViewController previewItemCallback](self, "previewItemCallback"));
    v14[2](v14, v16);
    v9 = (id)v16;
  }

  -[NAQPreviewViewController setPreviewItemCallback:](self, "setPreviewItemCallback:", 0);
}

- (BOOL)validateSearchableItemIdentifier:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uppercaseString"));
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("A"));

  return v5;
}

- (NUArticleContainerViewController)articleContainerViewController
{
  return self->_articleContainerViewController;
}

- (void)setArticleContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_articleContainerViewController, a3);
}

- (NSString)previewItemIdentifier
{
  return self->_previewItemIdentifier;
}

- (void)setPreviewItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)previewItemCallback
{
  return self->_previewItemCallback;
}

- (void)setPreviewItemCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previewItemCallback, 0);
  objc_storeStrong((id *)&self->_previewItemIdentifier, 0);
  objc_storeStrong((id *)&self->_articleContainerViewController, 0);
}

@end
