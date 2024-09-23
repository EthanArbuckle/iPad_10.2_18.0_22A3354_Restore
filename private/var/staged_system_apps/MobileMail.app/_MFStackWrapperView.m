@implementation _MFStackWrapperView

- (_MFStackWrapperView)initWithFrame:(CGRect)a3
{
  _MFStackWrapperView *v3;
  _MFStackWrapperView *v4;
  _MFStackLoadingView *v5;
  _MFStackLoadingView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_MFStackWrapperView;
  v3 = -[_MFStackWrapperView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_MFStackWrapperView setStackWrapperViewState:](v3, "setStackWrapperViewState:", 0);
    -[_MFStackWrapperView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[_MFStackWrapperView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    v5 = [_MFStackLoadingView alloc];
    -[_MFStackWrapperView bounds](v4, "bounds");
    v6 = -[_MFStackLoadingView initWithFrame:](v5, "initWithFrame:");
    -[_MFStackWrapperView setLoadingView:](v4, "setLoadingView:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_MFStackWrapperView loadingView](v4, "loadingView"));
    objc_msgSend(v7, "setAutoresizingMask:", 18);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_MFStackWrapperView loadingView](v4, "loadingView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityIndicatorView"));
    objc_msgSend(v9, "startAnimating");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_MFStackWrapperView loadingView](v4, "loadingView"));
    -[_MFStackWrapperView addSubview:](v4, "addSubview:", v10);

  }
  return v4;
}

- (void)addWrappedView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFStackWrapperView bounds](self, "bounds");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  if (-[_MFStackWrapperView stackWrapperViewState](self, "stackWrapperViewState"))
  {
    -[_MFStackWrapperView addSubview:](self, "addSubview:", v5);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_MFStackWrapperView loadingView](self, "loadingView"));
    -[_MFStackWrapperView insertSubview:below:](self, "insertSubview:below:", v5, v4);

  }
  -[_MFStackWrapperView setMessageContentView:](self, "setMessageContentView:", v5);

}

- (void)setStackWrapperViewState:(unint64_t)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_stackWrapperViewState != a3)
  {
    self->_stackWrapperViewState = a3;
    v3 = a3 == 1;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[_MFStackWrapperView loadingView](self, "loadingView"));
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (unint64_t)stackWrapperViewState
{
  return self->_stackWrapperViewState;
}

- (MFMessageContentView)messageContentView
{
  return self->_messageContentView;
}

- (void)setMessageContentView:(id)a3
{
  objc_storeStrong((id *)&self->_messageContentView, a3);
}

- (_MFStackLoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_messageContentView, 0);
}

@end
