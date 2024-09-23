@implementation CRLiOSDeterminateProgressViewController

- (id)nibName
{
  return CFSTR("CRLiOSDeterminateProgressView");
}

- (CRLiOSDeterminateProgressViewController)init
{
  void *v3;
  CRLiOSDeterminateProgressViewController *v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDeterminateProgressViewController nibName](self, "nibName"));
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSDeterminateProgressViewController;
  v4 = -[CRLiOSDeterminateProgressViewController initWithNibName:bundle:](&v6, "initWithNibName:bundle:", v3, 0);

  if (v4)
  {
    -[CRLiOSDeterminateProgressViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 4);
    -[CRLiOSDeterminateProgressViewController setTransitioningDelegate:](v4, "setTransitioningDelegate:", v4);
    v4->_shouldTouchesOutsideCancel = 1;
  }
  return v4;
}

+ (id)progressViewControllerWithTitle:(id)a3 progress:(id)a4 cancelHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "loadViewIfNeeded");
  objc_msgSend(v11, "setTitle:", v10);

  objc_msgSend(v11, "setMessage:", &stru_1012A72B0);
  objc_msgSend(v11, "setProgress:", v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Cancel"), 0, 0));
  objc_msgSend(v11, "setCancelButtonTitle:", v13);

  objc_msgSend(v11, "setCancelHandler:", v8);
  return v11;
}

+ (id)progressViewControllerWithTitle:(id)a3 crlProgress:(id)a4 cancelHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress crl_progressWithCRLProgress:totalUnitCount:](NSProgress, "crl_progressWithCRLProgress:totalUnitCount:", a4, 100));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "progressViewControllerWithTitle:progress:cancelHandler:", v9, v10, v8));

  return v11;
}

- (void)setOverridePreferredStatusBarStyle:(int64_t)a3
{
  self->_didOverrideOverridePreferredStatusBarStyle = 1;
  self->_overridePreferredStatusBarStyle = a3;
}

- (int64_t)preferredStatusBarStyle
{
  objc_super v3;

  if (self->_didOverrideOverridePreferredStatusBarStyle)
    return -[CRLiOSDeterminateProgressViewController overridePreferredStatusBarStyle](self, "overridePreferredStatusBarStyle");
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSDeterminateProgressViewController;
  return -[CRLiOSDeterminateProgressViewController preferredStatusBarStyle](&v3, "preferredStatusBarStyle");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  UIButton *cancelButton;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLiOSDeterminateProgressViewController;
  -[CRLiOSDeterminateProgressViewController viewDidLoad](&v8, "viewDidLoad");
  -[CRLiOSDeterminateProgressViewController setupControlColors](self, "setupControlColors");
  -[CRLiOSDeterminateProgressViewController updateViewSize](self, "updateViewSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDeterminateProgressViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v4, "setCornerRadius:", 8.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDeterminateProgressViewController title](self, "title"));
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

  -[UILabel setText:](self->_messageLabel, "setText:", &stru_1012A72B0);
  cancelButton = self->_cancelButton;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDeterminateProgressViewController cancelButtonTitleNonNil](self, "cancelButtonTitleNonNil"));
  -[UIButton setTitle:forState:](cancelButton, "setTitle:forState:", v7, 0);

  -[CRLiOSDeterminateProgressViewController updateProgressViewWithProgress:](self, "updateProgressViewWithProgress:", self->_progress);
  -[CRLiOSDeterminateProgressViewController updateMessageLabelWithProgress:](self, "updateMessageLabelWithProgress:", self->_progress);
}

- (void)dealloc
{
  objc_super v3;

  -[CRLiOSDeterminateProgressViewController stopObservingProgress:](self, "stopObservingProgress:", self->_progress);
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSDeterminateProgressViewController;
  -[CRLiOSDeterminateProgressViewController dealloc](&v3, "dealloc");
}

- (void)setupControlColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDeterminateProgressViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[CRLiOSDeterminateProgressViewController setValue:forKeyPath:](self, "setValue:forKeyPath:", v5, CFSTR("titleLabel.textColor"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[CRLiOSDeterminateProgressViewController setValue:forKeyPath:](self, "setValue:forKeyPath:", v6, CFSTR("messageLabel.textColor"));

  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
  -[CRLiOSDeterminateProgressViewController setValue:forKeyPath:](self, "setValue:forKeyPath:", v7, CFSTR("dividerLine.backgroundColor"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  objc_super v14;
  _QWORD block[2];
  id (*v16)(uint64_t);
  void *v17;
  CRLiOSDeterminateProgressViewController *v18;
  id v19;
  _QWORD v20[2];
  void (*v21)(uint64_t);
  void *v22;
  CRLiOSDeterminateProgressViewController *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_1013DC0E0 == a6)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v21 = sub_1003A9D10;
    v22 = &unk_10122D3D8;
    v23 = self;
    v24 = v11;
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      v21((uint64_t)v20);
      goto LABEL_12;
    }
    v13 = v20;
LABEL_11:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    goto LABEL_12;
  }
  if (off_1013DC0E8 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    v16 = sub_1003A9E00;
    v17 = &unk_10122D3D8;
    v18 = self;
    v19 = v11;
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      v16((uint64_t)block);
      goto LABEL_12;
    }
    v13 = block;
    goto LABEL_11;
  }
  v14.receiver = self;
  v14.super_class = (Class)CRLiOSDeterminateProgressViewController;
  -[CRLiOSDeterminateProgressViewController observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
LABEL_12:

}

- (void)setTitle:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSDeterminateProgressViewController;
  v4 = a3;
  -[CRLiOSDeterminateProgressViewController setTitle:](&v5, "setTitle:", v4);
  -[UILabel setText:](self->_titleLabel, "setText:", v4, v5.receiver, v5.super_class);

}

- (void)setMessage:(id)a3
{
  -[UILabel setText:](self->_messageLabel, "setText:", a3);
}

- (NSString)message
{
  return -[UILabel text](self->_messageLabel, "text");
}

- (UIFont)messageFont
{
  return -[UILabel font](self->_messageLabel, "font");
}

- (void)setMessageFont:(id)a3
{
  -[UILabel setFont:](self->_messageLabel, "setFont:", a3);
}

- (void)setProgress:(id)a3
{
  unint64_t v5;
  NSProgress *progress;
  unsigned __int8 v7;
  id v8;

  v5 = (unint64_t)a3;
  progress = self->_progress;
  if (v5 | (unint64_t)progress)
  {
    v8 = (id)v5;
    v7 = -[NSProgress isEqual:](progress, "isEqual:", v5);
    v5 = (unint64_t)v8;
    if ((v7 & 1) == 0)
    {
      -[CRLiOSDeterminateProgressViewController stopObservingProgress:](self, "stopObservingProgress:", self->_progress);
      objc_storeStrong((id *)&self->_progress, a3);
      -[CRLiOSDeterminateProgressViewController updateProgressViewWithProgress:](self, "updateProgressViewWithProgress:", v8);
      self->_cancelled = 0;
      -[CRLiOSDeterminateProgressViewController startObservingProgress:](self, "startObservingProgress:", v8);
      v5 = (unint64_t)v8;
    }
  }

}

- (void)startObservingProgress:(id)a3
{
  void *v4;
  id v5;

  v4 = off_1013DC0E0;
  v5 = a3;
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("cancelled"), 5, v4);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 5, off_1013DC0E0);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("isIndeterminate"), 4, off_1013DC0E8);

}

- (void)stopObservingProgress:(id)a3
{
  void *v4;
  id v5;

  v4 = off_1013DC0E0;
  v5 = a3;
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("cancelled"), v4);
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), off_1013DC0E0);
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("isIndeterminate"), off_1013DC0E8);

}

- (void)updateProgressViewWithProgress:(id)a3
{
  double v3;
  UIProgressView *progressView;

  progressView = self->_progressView;
  if (a3)
  {
    -[UIProgressView setObservedProgress:](progressView, "setObservedProgress:");
  }
  else
  {
    LODWORD(v3) = 0;
    -[UIProgressView setProgress:](progressView, "setProgress:", v3);
  }
}

- (void)updateProgressViewDisplayWithProgress:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;

  v4 = objc_msgSend(a3, "isIndeterminate");
  v5 = -[UIActivityIndicatorView isHidden](self->_spinnerView, "isHidden");
  v6 = v4 & v5;
  if ((_DWORD)v6 == 1)
  {
    -[UIActivityIndicatorView startAnimating](self->_spinnerView, "startAnimating");
  }
  else
  {
    if (((v4 | v5) & 1) != 0)
      return;
    -[UIActivityIndicatorView stopAnimating](self->_spinnerView, "stopAnimating");
  }
  -[UIProgressView setHidden:](self->_progressView, "setHidden:", v6);
}

- (void)updateMessageLabelWithProgress:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDeterminateProgressViewController delegate](self, "delegate"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "determinateProgressViewController:messageLabelTextForProgress:", self, v7));
    -[UILabel setText:](self->_messageLabel, "setText:", v6);

  }
}

- (void)updateViewSize
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v3 = dbl_100EEF940[!self->_cancelButtonVisible];
  -[CRLiOSDeterminateProgressViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, v3);
  if (-[CRLiOSDeterminateProgressViewController isViewLoaded](self, "isViewLoaded"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDeterminateProgressViewController view](self, "view"));
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;

    v9 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSDeterminateProgressViewController view](self, "view"));
    objc_msgSend(v9, "setFrame:", v6, v8, 270.0, v3);

  }
}

- (void)cancel:(id)a3
{
  -[CRLiOSDeterminateProgressViewController cancelAnimated:completionQueue:completionHandler:](self, "cancelAnimated:completionQueue:completionHandler:", 1, 0, 0);
}

- (BOOL)cancelled
{
  return -[NSProgress isCancelled](self->_progress, "isCancelled") || self->_cancelled;
}

- (void)setCancelButtonVisible:(BOOL)a3
{
  if (self->_cancelButtonVisible != a3)
  {
    self->_cancelButtonVisible = a3;
    -[CRLiOSDeterminateProgressViewController updateViewSize](self, "updateViewSize");
  }
}

- (void)setCancelButtonEnabled:(BOOL)a3
{
  -[UIButton setEnabled:](self->_cancelButton, "setEnabled:", a3);
}

- (BOOL)isCancelButtonEnabled
{
  return -[UIButton isEnabled](self->_cancelButton, "isEnabled");
}

- (void)setCancelButtonTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  unsigned __int8 v7;
  NSString *v8;
  NSString *cancelButtonTitle;
  NSString *v10;
  NSString *v11;

  v4 = a3;
  v5 = self->_cancelButtonTitle;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

    cancelButtonTitle = v11;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v11;
      if ((v7 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

      v8 = v11;
    }
    v10 = (NSString *)-[NSString copy](v8, "copy");
    cancelButtonTitle = self->_cancelButtonTitle;
    self->_cancelButtonTitle = v10;
  }

  v8 = v11;
LABEL_10:

}

- (id)cancelButtonTitleNonNil
{
  NSString *cancelButtonTitle;
  NSString *v3;
  void *v4;

  cancelButtonTitle = self->_cancelButtonTitle;
  if (cancelButtonTitle)
  {
    v3 = cancelButtonTitle;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Cancel"), 0, 0));

  }
  return v3;
}

- (void)runCancellationHandlers
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void (**v12)(void);
  void (**cancelHandler)(void);
  uint64_t v14;
  _QWORD block[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v14 = 8;
  v3 = self->_cancellationHandlers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "second", v14));

        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "first"));

          if (v10)
          {
            v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "first"));
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1003AA604;
            block[3] = &unk_10122D110;
            block[4] = v8;
            dispatch_async(v11, block);

          }
          else
          {
            v12 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "second"));
            v12[2]();

          }
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v14), "removeAllObjects");
  cancelHandler = (void (**)(void))self->_cancelHandler;
  if (cancelHandler)
    cancelHandler[2]();
}

- (void)cancelAnimated:(BOOL)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  CRLiOSDeterminateProgressViewController *v13;
  id v14;
  id v15;
  BOOL v16;

  v11 = sub_1003AA718;
  v12 = &unk_101257E98;
  v14 = a4;
  v15 = a5;
  v13 = self;
  v16 = a3;
  v8 = v14;
  v9 = v15;
  if (+[NSThread isMainThread](NSThread, "isMainThread", _NSConcreteStackBlock, 3221225472))
    v11((uint64_t)&v10);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v10);

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  TSDiOSModalPresentationController *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[TSDiOSModalPresentationController initWithPresentedViewController:presentingViewController:]([TSDiOSModalPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v7);

  -[TSDiOSModalPresentationController setDelegate:](v9, "setDelegate:", self);
  return v9;
}

- (void)animateTransition:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  CGAffineTransform v23;
  CGAffineTransform v24;

  v4 = a3;
  v5 = 0.0;
  if (objc_msgSend(v4, "isAnimated"))
  {
    -[CRLiOSDeterminateProgressViewController transitionDuration:](self, "transitionDuration:", v4);
    v5 = v6;
  }
  if (-[CRLiOSDeterminateProgressViewController isBeingPresented](self, "isBeingPresented"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    objc_msgSend(v4, "finalFrameForViewController:", v7);
    objc_msgSend(v8, "setFrame:");
    CGAffineTransformMakeScale(&v24, 1.2, 1.2);
    v23 = v24;
    objc_msgSend(v8, "setTransform:", &v23);
    objc_msgSend(v8, "setAlpha:", 0.0);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1003AADC8;
    v21[3] = &unk_10122D110;
    v22 = v8;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1003AAE1C;
    v19[3] = &unk_10122F780;
    v20 = v4;
    v9 = v8;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v21, v19, v5, 0.0);

LABEL_7:
    goto LABEL_17;
  }
  if (-[CRLiOSDeterminateProgressViewController isBeingDismissed](self, "isBeingDismissed"))
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1003AAE28;
    v17[3] = &unk_10122D110;
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", UITransitionContextFromViewKey));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1003AAE34;
    v15[3] = &unk_10122F780;
    v16 = v4;
    v7 = v18;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v17, v15, v5, 0.0);

    goto LABEL_7;
  }
  v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101257EB8);
  v11 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2AE84((uint64_t)v4, v10, v11);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101257ED8);
  v12 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE81F0(v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDeterminateProgressViewController animateTransition:]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDeterminateProgressViewController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 470, 0, "Unknown transition: %@", v4);

  objc_msgSend(v4, "completeTransition:", 1);
LABEL_17:

}

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

- (id)adaptiveViewController
{
  CRLiOSSheetViewController *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = -[CRLiOSSheetViewController initWithContentViewController:]([CRLiOSSheetViewController alloc], "initWithContentViewController:", self);
  -[CRLiOSSheetViewController setShouldStretchWidth:](v3, "setShouldStretchWidth:", 0);
  -[CRLiOSSheetViewController setShouldTouchesOutsideCancel:](v3, "setShouldTouchesOutsideCancel:", -[CRLiOSDeterminateProgressViewController shouldTouchesOutsideCancel](self, "shouldTouchesOutsideCancel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDeterminateProgressViewController cancelButtonTitleNonNil](self, "cancelButtonTitleNonNil"));
  -[CRLiOSSheetViewController addCancelButtonWithTitle:](v3, "addCancelButtonWithTitle:", v4);

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003AAFB0;
  v6[3] = &unk_10122D4C0;
  objc_copyWeak(&v7, &location);
  -[CRLiOSSheetViewController setCancelHandler:](v3, "setCancelHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v3;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return 5;
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(CRLiOSDeterminateProgressViewController, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController", v6));

  v10 = sub_100221D0C(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "adaptiveViewController"));
  return v12;
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v6;
  uint64_t v7;
  double v8;
  objc_class *v9;
  objc_class *v10;
  void *v11;
  id v12;
  id v13;

  v6 = a3;
  *(_QWORD *)&v8 = objc_opt_class(CRLiOSDeterminateProgressViewController, v7).n128_u64[0];
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController", v8));

  v12 = sub_1002223BC(v10, v11);
  v13 = (id)objc_claimAutoreleasedReturnValue(v12);

  objc_msgSend(v13, "setCancelButtonVisible:", a4 == -1);
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CRLiOSDeterminateProgressViewControllerDelegate)delegate
{
  return (CRLiOSDeterminateProgressViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  self->_progressView = (UIProgressView *)a3;
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
  self->_spinnerView = (UIActivityIndicatorView *)a3;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  self->_titleLabel = (UILabel *)a3;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  self->_messageLabel = (UILabel *)a3;
}

- (UIView)dividerLine
{
  return self->_dividerLine;
}

- (void)setDividerLine:(id)a3
{
  self->_dividerLine = (UIView *)a3;
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  self->_cancelButton = (UIButton *)a3;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (int64_t)overridePreferredStatusBarStyle
{
  return self->_overridePreferredStatusBarStyle;
}

- (BOOL)cancelButtonVisible
{
  return self->_cancelButtonVisible;
}

- (BOOL)shouldTouchesOutsideCancel
{
  return self->_shouldTouchesOutsideCancel;
}

- (void)setShouldTouchesOutsideCancel:(BOOL)a3
{
  self->_shouldTouchesOutsideCancel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_cancellationHandlers, 0);
}

@end
