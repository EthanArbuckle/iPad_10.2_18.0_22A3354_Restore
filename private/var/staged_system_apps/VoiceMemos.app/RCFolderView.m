@implementation RCFolderView

- (RCFolderView)initWithFrame:(CGRect)a3
{
  RCFolderView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCFolderView;
  v3 = -[RCFolderView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[RCFolderView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (void)setRecordingsCollectionViewControllerWrapperView:(id)a3
{
  UIView *v4;
  UIView *recordingsCollectionViewControllerWrapperView;
  UIView *v6;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_recordingsCollectionViewControllerWrapperView, "removeFromSuperview");
  recordingsCollectionViewControllerWrapperView = self->_recordingsCollectionViewControllerWrapperView;
  self->_recordingsCollectionViewControllerWrapperView = v4;
  v6 = v4;

  -[RCFolderView addSubview:](self, "addSubview:", v6);
  -[RCFolderView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setRecordingView:(id)a3
{
  RCRecordingView *v4;
  RCRecordingView *recordingView;
  RCRecordingView *v6;

  v4 = (RCRecordingView *)a3;
  -[RCRecordingView removeFromSuperview](self->_recordingView, "removeFromSuperview");
  recordingView = self->_recordingView;
  self->_recordingView = v4;
  v6 = v4;

  -[RCFolderView addSubview:](self, "addSubview:", v6);
  -[RCFolderView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[RCFolderView layoutSubviews](self, "layoutSubviews");
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[3];

  v24.receiver = self;
  v24.super_class = (Class)RCFolderView;
  -[RCFolderView updateConstraints](&v24, "updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderView recordingsCollectionViewControllerWrapperView](self, "recordingsCollectionViewControllerWrapperView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderView recordingView](self, "recordingView"));
  v5 = v4;
  if (v4
    && v3
    && objc_msgSend(v4, "isDescendantOfView:", self)
    && objc_msgSend(v3, "isDescendantOfView:", self))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderView wrapperViewBottomConstraint](self, "wrapperViewBottomConstraint"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderView wrapperViewBottomConstraint](self, "wrapperViewBottomConstraint"));
      -[RCFolderView removeConstraint:](self, "removeConstraint:", v7);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderView recordingViewBottomConstraint](self, "recordingViewBottomConstraint"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderView recordingViewBottomConstraint](self, "recordingViewBottomConstraint"));
      -[RCFolderView removeConstraint:](self, "removeConstraint:", v9);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 4, 0, self, 4, 1.0, 0.0));
    -[RCFolderView setRecordingViewBottomConstraint:](self, "setRecordingViewBottomConstraint:", v10);

    objc_msgSend(v5, "addLeadingToLeadingConstraintWithView:padding:", self, 0.0);
    objc_msgSend(v5, "addTrailingToTrailingConstraintWithView:padding:", self, 0.0);
    objc_msgSend(v3, "alignCenterTopToCenterTopOfView:padding:", self, 0.0);
    objc_msgSend(v3, "constrainWidthWithView:padding:", self, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v11, "recordingControlSectionHeight");
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "window"));
    objc_msgSend(v16, "safeAreaInsets");
    v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 9, 0, self, 9, 1.0, 0.0));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 4, 0, self, 4, 1.0, -v13 - v18));
    LODWORD(v21) = 1132068864;
    objc_msgSend(v20, "setPriority:", v21);
    -[RCFolderView setWrapperViewBottomConstraint:](self, "setWrapperViewBottomConstraint:", v20);
    v25[0] = v19;
    v25[1] = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderView recordingViewBottomConstraint](self, "recordingViewBottomConstraint"));
    v25[2] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 3));
    -[RCFolderView addConstraints:](self, "addConstraints:", v23);

    -[RCFolderView _updateLibraryCollectionViewBottomConstraint](self, "_updateLibraryCollectionViewBottomConstraint");
  }

}

- (NSLayoutConstraint)recordingViewBottomConstraint
{
  return self->_recordingViewBottomConstraint;
}

- (NSLayoutConstraint)wrapperViewBottomConstraint
{
  return self->_wrapperViewBottomConstraint;
}

- (RCRecordingView)recordingView
{
  return self->_recordingView;
}

- (void)setWrapperViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_wrapperViewBottomConstraint, a3);
}

- (void)setRecordingViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_recordingViewBottomConstraint, a3);
}

- (UIView)recordingsCollectionViewControllerWrapperView
{
  return self->_recordingsCollectionViewControllerWrapperView;
}

- (void)_updateLibraryCollectionViewBottomConstraint
{
  unsigned __int8 v3;
  void *v4;
  id v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;

  v3 = -[RCFolderView isCollectionViewInEditMode](self, "isCollectionViewInEditMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderView recordingView](self, "recordingView"));
  v5 = objc_msgSend(v4, "displayStyle");

  v6 = 0.0;
  if ((v3 & 1) == 0 && v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v7, "recordingControlSectionHeight");
    v6 = v8;

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
  objc_msgSend(v11, "safeAreaInsets");
  v13 = v12;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderView wrapperViewBottomConstraint](self, "wrapperViewBottomConstraint"));
  objc_msgSend(v14, "setConstant:", -v6 - v13);

}

- (BOOL)isCollectionViewInEditMode
{
  return self->_isCollectionViewInEditMode;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setIsRecordingViewHidden:(BOOL)a3
{
  if (self->_isRecordingViewHidden != a3)
    self->_isRecordingViewHidden = a3;
}

- (void)_updateBottomLayoutForCollectionViewEditMode:(BOOL)a3 delegate:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  unsigned int v8;
  double v9;
  double v10;
  id v11;
  dispatch_time_t v12;
  void *v13;
  _QWORD block[4];
  id v15;
  RCFolderView *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderView recordingView](self, "recordingView"));
  v8 = objc_msgSend(v7, "isHidden");
  if (v4)
  {
    if ((v8 & 1) == 0)
    {
      objc_msgSend(v6, "willUpdateBottomLayoutForEditing");
      -[RCFolderView setIsRecordingViewHidden:](self, "setIsRecordingViewHidden:", 1);
      +[CATransaction animationDuration](CATransaction, "animationDuration");
      v10 = v9;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10003A0C4;
      v21[3] = &unk_1001AB6E8;
      v21[4] = self;
      v22 = v7;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10003A118;
      v18[3] = &unk_1001ABD08;
      v19 = v22;
      v20 = v6;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v21, v18, v10);

      v11 = v22;
LABEL_6:

    }
  }
  else if (v8)
  {
    objc_msgSend(v6, "willUpdateBottomLayoutForEditing");
    -[RCFolderView setIsRecordingViewHidden:](self, "setIsRecordingViewHidden:", 0);
    v12 = dispatch_time(0, (uint64_t)(UINavigationControllerHideShowBarDuration * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003A144;
    block[3] = &unk_1001ABD30;
    v15 = v7;
    v16 = self;
    v17 = v6;
    dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, block);

    v11 = v15;
    goto LABEL_6;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderView delegate](self, "delegate"));
  objc_msgSend(v13, "finishedTransitionToEditing:", v4);

}

- (void)updateBottomLayoutForEditing:(BOOL)a3 delegate:(id)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  v6 = a4;
  -[RCFolderView setIsCollectionViewInEditMode:](self, "setIsCollectionViewInEditMode:", v4);
  -[RCFolderView _updateLibraryCollectionViewBottomConstraint](self, "_updateLibraryCollectionViewBottomConstraint");
  -[RCFolderView _updateBottomLayoutForCollectionViewEditMode:delegate:](self, "_updateBottomLayoutForCollectionViewEditMode:delegate:", v4, v6);

}

- (RCFolderViewDelegate)delegate
{
  return (RCFolderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isRecordingViewHidden
{
  return self->_isRecordingViewHidden;
}

- (void)setIsCollectionViewInEditMode:(BOOL)a3
{
  self->_isCollectionViewInEditMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_wrapperViewBottomConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recordingsCollectionViewControllerWrapperView, 0);
  objc_storeStrong((id *)&self->_recordingView, 0);
}

@end
