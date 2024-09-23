@implementation ICOverlayWindowPresenter

- (ICOverlayWindowPresenter)initWithRootViewController:(id)a3 presentingWindow:(id)a4
{
  id v6;
  id v7;
  ICOverlayWindowPresenter *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  ICWindow *window;
  id v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ICOverlayWindowPresenter;
  v8 = -[ICOverlayWindowPresenter init](&v19, "init");
  if (v8)
  {
    v9 = objc_opt_class(ICWindow);
    v10 = ICDynamicCast(v9, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_alloc((Class)ICWindow);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
    v14 = objc_msgSend(v12, "initWithWindowScene:behavior:", v13, objc_msgSend(v7, "ic_behavior"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewControllerManager"));
    objc_msgSend(v14, "setViewControllerManager:", v15);

    objc_msgSend(v14, "setRootViewController:", v6);
    objc_msgSend(v14, "setWindowLevel:", UIWindowLevelStatusBar + -1.0);
    window = v8->_window;
    v8->_window = (ICWindow *)v14;
    v17 = v14;

    objc_storeStrong((id *)&v8->_presentingWindow, a4);
  }

  return v8;
}

- (void)animateWindowFrameReverse:(BOOL)a3 duration:(double)a4 completionBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double MaxY;
  double v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[9];
  CGRect v30;

  v6 = a3;
  v8 = a5;
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICOverlayWindowPresenter window](self, "window"));
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = 0x20000;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICOverlayWindowPresenter presentingWindow](self, "presentingWindow"));
    objc_msgSend(v9, "frame");
    v11 = v19;
    v13 = v20;
    v15 = v21;
    v17 = v22;
    v18 = 0x10000;
  }

  v30.origin.x = v11;
  v30.origin.y = v13;
  v30.size.width = v15;
  v30.size.height = v17;
  MaxY = CGRectGetMaxY(v30);
  if (v6)
    v24 = v13;
  else
    v24 = MaxY;
  if (v6)
    v13 = MaxY;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICOverlayWindowPresenter window](self, "window"));
  objc_msgSend(v25, "setFrame:", v11, v24, v15, v17);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10009F5EC;
  v29[3] = &unk_100553308;
  v29[4] = self;
  *(double *)&v29[5] = v11;
  *(CGFloat *)&v29[6] = v13;
  *(double *)&v29[7] = v15;
  *(double *)&v29[8] = v17;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10009F644;
  v27[3] = &unk_100550890;
  v28 = v8;
  v26 = v8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v18, v29, v27, a4, 0.0);

}

- (void)presentWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICOverlayWindowPresenter window](self, "window"));
  objc_msgSend(v5, "makeKeyAndVisible");

  v6 = -[ICOverlayWindowPresenter presentAnimationType](self, "presentAnimationType");
  if (v6)
  {
    if (v6 == 2)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICOverlayWindowPresenter windowBackgroundColor](self, "windowBackgroundColor"));
      v8 = v7;
      if (!v7)
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ic_dynamicWhiteBlackColor](UIColor, "ic_dynamicWhiteBlackColor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICOverlayWindowPresenter window](self, "window"));
      objc_msgSend(v9, "setBackgroundColor:", v8);

      if (!v7)
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICOverlayWindowPresenter window](self, "window"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
      objc_msgSend(v12, "setAlpha:", 0.0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICOverlayWindowPresenter window](self, "window"));
      objc_msgSend(v13, "makeKeyAndVisible");

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10009F838;
      v16[3] = &unk_100550110;
      v16[4] = self;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10009F894;
      v14[3] = &unk_100550890;
      v15 = v4;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v16, v14, 0.25);

    }
    else if (v6 == 1)
    {
      -[ICOverlayWindowPresenter animateWindowFrameReverse:duration:completionBlock:](self, "animateWindowFrameReverse:duration:completionBlock:", 0, v4, 0.3);
    }
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICOverlayWindowPresenter presentWithCompletionBlock:]", 1, 0, CFSTR("Undefined presentation type for present overlay window"));
  }

}

- (void)dismissWithCompletionBlock:(id)a3
{
  id v4;
  unint64_t v5;
  double v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = -[ICOverlayWindowPresenter presentAnimationType](self, "presentAnimationType");
  v6 = 0.3;
  if (v5)
  {
    if (v5 == 2)
      v6 = 0.0;
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICOverlayWindowPresenter dismissWithCompletionBlock:]", 1, 0, CFSTR("Undefined presentation type for dismiss overlay window"));
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009F984;
  v8[3] = &unk_100550160;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[ICOverlayWindowPresenter animateWindowFrameReverse:duration:completionBlock:](self, "animateWindowFrameReverse:duration:completionBlock:", 1, v8, v6);

}

- (unint64_t)presentAnimationType
{
  return self->_presentAnimationType;
}

- (void)setPresentAnimationType:(unint64_t)a3
{
  self->_presentAnimationType = a3;
}

- (UIColor)windowBackgroundColor
{
  return self->_windowBackgroundColor;
}

- (void)setWindowBackgroundColor:(id)a3
{
  self->_windowBackgroundColor = (UIColor *)a3;
}

- (ICWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (UIWindow)presentingWindow
{
  return self->_presentingWindow;
}

- (void)setPresentingWindow:(id)a3
{
  objc_storeStrong((id *)&self->_presentingWindow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingWindow, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
