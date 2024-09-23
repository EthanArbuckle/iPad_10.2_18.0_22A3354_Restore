@implementation DOCItemInfoDownloadButton

- (DOCItemInfoDownloadButton)initWithFrame:(CGRect)a3
{
  DOCItemInfoDownloadButton *v3;
  DOCItemInfoDownloadButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCItemInfoDownloadButton;
  v3 = -[DOCItemInfoDownloadButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[DOCItemInfoDownloadButton commonInit](v3, "commonInit");
  return v4;
}

- (DOCItemInfoDownloadButton)initWithCoder:(id)a3
{
  DOCItemInfoDownloadButton *v3;
  DOCItemInfoDownloadButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCItemInfoDownloadButton;
  v3 = -[DOCItemInfoDownloadButton initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[DOCItemInfoDownloadButton commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "background"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1000B6290;
  v17 = &unk_1005BE4E0;
  objc_copyWeak(&v18, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &v14));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v3, v6, v14, v15, v16, v17));
  -[DOCItemInfoDownloadButton setUnderlyingButton:](self, "setUnderlyingButton:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton underlyingButton](self, "underlyingButton"));
  -[DOCItemInfoDownloadButton addSubview:](self, "addSubview:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton underlyingButton](self, "underlyingButton"));
  v10 = DOCConstraintsToResizeWithSuperview(v9, NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);

  -[DOCItemInfoDownloadButton updateForState](self, "updateForState");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIHoverStyle doc_circleWithInset:](UIHoverStyle, "doc_circleWithInset:", -8.0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton underlyingButton](self, "underlyingButton"));
  objc_msgSend(v13, "setHoverStyle:", v12);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)setProgressView:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_progressView);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_progressView, obj);
    objc_msgSend(obj, "setCanShowStopButton:", 1);

    -[DOCItemInfoDownloadButton applyTintColorToViews](self, "applyTintColorToViews");
  }

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DOCItemInfoDownloadButton;
  -[DOCItemInfoDownloadButton tintColorDidChange](&v3, "tintColorDidChange");
  -[DOCItemInfoDownloadButton applyTintColorToViews](self, "applyTintColorToViews");
}

- (void)applyTintColorToViews
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton tintColor](self, "tintColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton progressView](self, "progressView"));
  objc_msgSend(v3, "setActiveStrokeColor:", v4);

}

- (void)setDownloadState:(unint64_t)a3
{
  if (self->_downloadState != a3)
  {
    self->_downloadState = a3;
    -[DOCItemInfoDownloadButton updateForState](self, "updateForState");
  }
}

- (void)updateDownloadState
{
  DOCNode *node;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  node = self->_node;
  if (!node)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton progressView](self, "progressView"));
    objc_msgSend(v7, "setObservedProgress:", 0);

    goto LABEL_8;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCNode downloadingProgress](node, "downloadingProgress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton progressView](self, "progressView"));
  objc_msgSend(v5, "setObservedProgress:", v4);

  if ((-[DOCNode isDownloading](self->_node, "isDownloading") & 1) == 0)
  {
    if (!-[DOCNode isCloudItem](self->_node, "isCloudItem")
      || -[DOCNode isDownloaded](self->_node, "isDownloaded"))
    {
      v6 = 2;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  v6 = 1;
LABEL_9:
  -[DOCItemInfoDownloadButton setDownloadState:](self, "setDownloadState:", v6);
}

- (void)setNode:(id)a3
{
  DOCNode *v5;
  DOCNode *v6;

  v5 = (DOCNode *)a3;
  if (self->_node != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_node, a3);
    -[DOCItemInfoDownloadButton updateDownloadState](self, "updateDownloadState");
    v5 = v6;
  }

}

- (void)userDidTapDownloadButton
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  DOCItemInfoDownloadButton *v29;
  void *v30;
  void *v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton node](self, "node"));
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isCloudItem"))
    {
      v5 = objc_msgSend(v4, "isDownloaded");
      if ((v5 & 1) == 0 && (DOCIsNetworkReachable(v5) & 1) == 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton delegate](self, "delegate"));
        v19 = objc_opt_respondsToSelector(v18, "nodeDownloadButton:downloadingNode:encounteredError:");

        if ((v19 & 1) == 0)
          goto LABEL_10;
        v10 = (id)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton delegate](self, "delegate"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton node](self, "node"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1009, 0));
        objc_msgSend(v10, "nodeDownloadButton:downloadingNode:encounteredError:", self, v20, v21);

        goto LABEL_8;
      }
    }
    v6 = -[DOCItemInfoDownloadButton downloadState](self, "downloadState");
    if (v6 == 1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "downloadingProgress"));
      objc_msgSend(v12, "cancel");

      v13 = objc_alloc((Class)FPEvictOperation);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fpfs_fpItem"));
      v30 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
      v16 = objc_msgSend(v13, "initWithItems:", v15);

      v22 = _NSConcreteStackBlock;
      v23 = 3221225472;
      v24 = sub_1000B6A90;
      v25 = &unk_1005BE558;
      v26 = v4;
      objc_msgSend(v16, "setCompletionBlock:", &v22);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[FPItemManager defaultManager](FPItemManager, "defaultManager", v22, v23, v24, v25));
      objc_msgSend(v17, "scheduleAction:", v16);

      goto LABEL_10;
    }
    if (!v6)
    {
      v7 = objc_alloc((Class)FPDownloadOperation);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fpfs_fpItem"));
      v31 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
      v10 = objc_msgSend(v7, "initWithItems:", v9);

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1000B6800;
      v27[3] = &unk_1005BE530;
      v28 = v4;
      v29 = self;
      objc_msgSend(v10, "setDownloadCompletionBlock:", v27);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[FPItemManager defaultManager](FPItemManager, "defaultManager"));
      objc_msgSend(v11, "scheduleAction:", v10);

LABEL_8:
    }
  }
LABEL_10:

}

- (DOCNode)node
{
  return self->_node;
}

- (BOOL)nodeCanBeOpened
{
  return self->_nodeCanBeOpened;
}

- (void)setNodeCanBeOpened:(BOOL)a3
{
  self->_nodeCanBeOpened = a3;
}

- (DOCItemInfoDownloadButtonDelegate)delegate
{
  return (DOCItemInfoDownloadButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DOCDownloadProgressView)progressView
{
  return (DOCDownloadProgressView *)objc_loadWeakRetained((id *)&self->_progressView);
}

- (UIButton)underlyingButton
{
  return self->_underlyingButton;
}

- (void)setUnderlyingButton:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingButton, a3);
}

- (unint64_t)downloadState
{
  return self->_downloadState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingButton, 0);
  objc_destroyWeak((id *)&self->_progressView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_node, 0);
}

@end
