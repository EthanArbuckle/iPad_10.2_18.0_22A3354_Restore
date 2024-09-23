@implementation MailStatusBarView

- (void)showUpdateStatusWithStatusInfo:(id)a3
{
  id v4;
  MailStatusUpdateView *updateView;
  MailStatusUpdateView *v6;
  MailStatusUpdateView *v7;
  MailStatusUpdateView *v8;
  id v9;

  v4 = a3;
  updateView = self->_updateView;
  v9 = v4;
  if (!updateView)
  {
    v6 = [MailStatusUpdateView alloc];
    -[MailStatusBarView bounds](self, "bounds");
    v7 = -[MailStatusUpdateView initWithFrame:](v6, "initWithFrame:");
    v8 = self->_updateView;
    self->_updateView = v7;

    -[MailStatusLabelView setDelegate:](self->_updateView, "setDelegate:", self->_delegate);
    updateView = self->_updateView;
    v4 = v9;
  }
  -[MailStatusUpdateView updateWithStatusInfo:](updateView, "updateWithStatusInfo:", v4);
  -[MailStatusBarView switchSubviewToView:showProgress:](self, "switchSubviewToView:showProgress:", self->_updateView, 0);

}

- (void)setDelegate:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_delegate, a3);
  -[MailStatusLabelView setDelegate:](self->_updateView, "setDelegate:", self->_delegate);
  -[MailStatusLabelView setDelegate:](self->_progressStatusView, "setDelegate:", self->_delegate);

}

- (MailStatusBarView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MailStatusBarView *v9;
  MailStatusBarView *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v17;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (pthread_main_np() != 1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailStatusBarView.m"), 53, CFSTR("Current thread must be main"));

  }
  v18.receiver = self;
  v18.super_class = (Class)MailStatusBarView;
  v9 = -[MailStatusBarView initWithFrame:](&v18, "initWithFrame:", x, y, width, height);
  v10 = v9;
  if (v9)
  {
    -[MailStatusBarView setOpaque:](v9, "setOpaque:", 0);
    -[MailStatusBarView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusBarView widthAnchor](v10, "widthAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", 230.0));

    LODWORD(v13) = 1144750080;
    objc_msgSend(v12, "setPriority:", v13);
    objc_msgSend(v12, "setActive:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusBarView heightAnchor](v10, "heightAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToConstant:", 23.0));
    objc_msgSend(v15, "setActive:", 1);

  }
  return v10;
}

- (void)showIndeterminateStatusWithStatusInfo:(id)a3
{
  id v4;
  void *v5;
  MailStatusIndeterminateView *indeterminateView;
  MailStatusIndeterminateView *v7;
  MailStatusIndeterminateView *v8;
  MailStatusIndeterminateView *v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[24];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "status"));

  if (v5)
  {
    indeterminateView = self->_indeterminateView;
    if (!indeterminateView)
    {
      v7 = [MailStatusIndeterminateView alloc];
      -[MailStatusBarView bounds](self, "bounds");
      v8 = -[MailStatusLabelView initWithFrame:](v7, "initWithFrame:");
      v9 = self->_indeterminateView;
      self->_indeterminateView = v8;

      -[MailStatusLabelView setDelegate:](self->_indeterminateView, "setDelegate:", self->_delegate);
      indeterminateView = self->_indeterminateView;
    }
    -[MailStatusIndeterminateView updateWithStatusInfo:](indeterminateView, "updateWithStatusInfo:", v4);
    -[MailStatusBarView switchSubviewToView:showProgress:](self, "switchSubviewToView:showProgress:", self->_indeterminateView, 0);
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[MailStatusBarView log](MailStatusBarView, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "debugDescription"));
      sub_100392E30(v11, v12, v10);
    }

  }
}

- (void)switchSubviewToView:(id)a3 showProgress:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = a4;
  v6 = a3;
  -[MailStatusBarView bounds](self, "bounds");
  objc_msgSend(v6, "setFrame:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusBarView subviews](self, "subviews"));
  if (objc_msgSend(v7, "count") == (id)1
    && (v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", 0)), v8, v8 == v6))
  {
    objc_msgSend(v6, "setNeedsDisplay");
  }
  else
  {
    v9 = objc_alloc_init((Class)NSMutableArray);
    v10 = objc_alloc_init((Class)NSMutableArray);
    objc_msgSend(v9, "addObjectsFromArray:", v7);
    if (v6)
    {
      objc_msgSend(v10, "addObject:", v6);
      if (objc_msgSend(v9, "containsObject:", v6))
      {
        objc_msgSend(v9, "removeObject:", v6);
      }
      else
      {
        objc_msgSend(v6, "setAlpha:", 0.0);
        -[MailStatusBarView addSubview:](self, "addSubview:", v6);
      }
      objc_msgSend(v6, "setNeedsDisplay");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusBarView toolbarView](self, "toolbarView"));
    objc_msgSend(v11, "showProgress:", v4);

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002350C;
    v16[3] = &unk_10051A910;
    v17 = v9;
    v12 = v10;
    v18 = v12;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000DC1C;
    v14[3] = &unk_10051A848;
    v13 = v17;
    v15 = v13;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v16, v14, 0.25, 0.0);

  }
}

- (MFProgressToolbar)toolbarView
{
  return self->_toolbarView;
}

- (void)setNeedsDisplayWithStatusInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  MailStatusBarView *v8;

  v4 = a3;
  v7 = v4;
  v8 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_100013520, &unk_10051A910));
  objc_msgSend(v5, "performBlock:", &v6);

}

- (void)setToolbarView:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarView, a3);
}

- (void)setTarget:(id)a3 withAction:(SEL)a4
{
  id v6;
  id v7;

  v7 = a3;
  if (v7 && a4)
  {
    v6 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v7, a4);
    -[MailStatusBarView addGestureRecognizer:](self, "addGestureRecognizer:", v6);

  }
  else
  {
    -[MailStatusBarView removeAllGestureRecognizers](self, "removeAllGestureRecognizers");
  }

}

- (void)setNeedsDisplay
{
  MailStatusBarViewDelegate *v3;
  _QWORD v4[5];

  v3 = self->_delegate;
  if ((objc_opt_respondsToSelector(v3, "currentStatusInfoWithCompletion:") & 1) != 0)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000FA498;
    v4[3] = &unk_10051EA80;
    v4[4] = self;
    -[MailStatusBarViewDelegate currentStatusInfoWithCompletion:](v3, "currentStatusInfoWithCompletion:", v4);
  }

}

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FA294;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9E20 != -1)
    dispatch_once(&qword_1005A9E20, block);
  return (id)qword_1005A9E18;
}

- (void)showProgressBarWithStatusInfo:(id)a3
{
  id v4;
  MailStatusProgressBarView *progressStatusView;
  MailStatusProgressBarView *v6;
  MailStatusProgressBarView *v7;
  MailStatusProgressBarView *v8;
  void *v9;
  id v10;

  v4 = a3;
  progressStatusView = self->_progressStatusView;
  v10 = v4;
  if (!progressStatusView)
  {
    v6 = [MailStatusProgressBarView alloc];
    -[MailStatusBarView bounds](self, "bounds");
    v7 = -[MailStatusLabelView initWithFrame:](v6, "initWithFrame:");
    v8 = self->_progressStatusView;
    self->_progressStatusView = v7;

    -[MailStatusLabelView setDelegate:](self->_progressStatusView, "setDelegate:", self->_delegate);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusBarView toolbarView](self, "toolbarView"));
    -[MailStatusProgressBarView setToolbarView:](self->_progressStatusView, "setToolbarView:", v9);

    progressStatusView = self->_progressStatusView;
    v4 = v10;
  }
  -[MailStatusProgressBarView updateWithStatusInfo:](progressStatusView, "updateWithStatusInfo:", v4);
  -[MailStatusBarView switchSubviewToView:showProgress:](self, "switchSubviewToView:showProgress:", self->_progressStatusView, 1);

}

- (void)showUndoButtonWithStatusInfo:(id)a3
{
  MailStatusUndoView *undoView;
  MailStatusUndoView *v5;
  MailStatusUndoView *v6;
  MailStatusUndoView *v7;
  id v8;

  v8 = a3;
  undoView = self->_undoView;
  if (!undoView)
  {
    v5 = [MailStatusUndoView alloc];
    -[MailStatusBarView bounds](self, "bounds");
    v6 = -[MailStatusUndoView initWithFrame:](v5, "initWithFrame:");
    v7 = self->_undoView;
    self->_undoView = v6;

    -[MailStatusUndoView setDelegate:](self->_undoView, "setDelegate:", self);
    undoView = self->_undoView;
  }
  -[MailStatusBarView switchSubviewToView:showProgress:](self, "switchSubviewToView:showProgress:", undoView, 0);

}

- (void)mailStatusUndoViewUndoButtonTapped:(id)a3
{
  -[MailStatusBarViewDelegate mailStatusBarViewUndoButtonTapped:](self->_delegate, "mailStatusBarViewUndoButtonTapped:", self);
}

- (void)dealloc
{
  objc_super v3;

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  -[MailStatusLabelView setDelegate:](self->_progressStatusView, "setDelegate:", 0);
  -[MailStatusLabelView setDelegate:](self->_updateView, "setDelegate:", 0);
  -[MailStatusLabelView setDelegate:](self->_indeterminateView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MailStatusBarView;
  -[MailStatusBarView dealloc](&v3, "dealloc");
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbarView, 0);
  objc_storeStrong((id *)&self->_undoView, 0);
  objc_storeStrong((id *)&self->_indeterminateView, 0);
  objc_storeStrong((id *)&self->_updateView, 0);
  objc_storeStrong((id *)&self->_progressStatusView, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
