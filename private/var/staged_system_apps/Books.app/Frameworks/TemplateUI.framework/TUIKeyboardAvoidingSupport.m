@implementation TUIKeyboardAvoidingSupport

- (TUIKeyboardAvoidingSupport)initWithViewController:(id)a3
{
  id v4;
  TUIKeyboardAvoidingSupport *v5;
  TUIKeyboardAvoidingSupport *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIKeyboardAvoidingSupport;
  v5 = -[TUIKeyboardAvoidingSupport init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_viewController, v4);

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TUIKeyboardAvoidingSupport;
  -[TUIKeyboardAvoidingSupport dealloc](&v4, "dealloc");
}

- (void)registerForNotifications
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!self->_registeredForNotifications)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tui_keyboardAvoidingScrollView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "screen"));

    objc_msgSend(v7, "addObserver:selector:name:object:", self, "_keyboardWillShow:", UIKeyboardWillShowNotification, v6);
    objc_msgSend(v7, "addObserver:selector:name:object:", self, "_keyboardWillHide:", UIKeyboardWillHideNotification, v6);
    objc_msgSend(v7, "addObserver:selector:name:object:", self, "_keyboardWillChangeFrame:", UIKeyboardWillChangeFrameNotification, v6);
    self->_registeredForNotifications = 1;

  }
}

- (void)unregisterForNotifications
{
  void *v3;

  if (self->_registeredForNotifications)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:", self);

    self->_registeredForNotifications = 0;
  }
}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  -[TUIKeyboardAvoidingSupport _adjustScrollViewForKeyboardInfo:](self, "_adjustScrollViewForKeyboardInfo:", v4);

  v5 = (void *)objc_opt_class(self);
  _objc_msgSend(v5, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_adjustScrollViewForKeyboardInfo:", 0);
}

- (void)_keyboardWillHide:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", NSRunLoopCommonModes));
  -[TUIKeyboardAvoidingSupport performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", "_adjustScrollViewForKeyboardInfo:", 0, v4, 0.0);

}

- (void)_keyboardWillChangeFrame:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  -[TUIKeyboardAvoidingSupport _adjustScrollViewForKeyboardInfo:](self, "_adjustScrollViewForKeyboardInfo:", v4);

  v5 = (void *)objc_opt_class(self);
  _objc_msgSend(v5, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_adjustScrollViewForKeyboardInfo:", 0);
}

- (void)_adjustScrollViewForKeyboardInfo:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  double adjustmentForKeyboard;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  uint64_t v43;

  v4 = a3;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tui_keyboardAvoidingScrollView"));

    if (!self->_viewIsDisappearing)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));

      if (v7)
      {
        adjustmentForKeyboard = self->_adjustmentForKeyboard;
        -[TUIKeyboardAvoidingSupport _keyboardOverlapInView:usingKeyboardInfo:](self, "_keyboardOverlapInView:usingKeyboardInfo:", v6, v4);
        if (adjustmentForKeyboard != v9)
        {
          v10 = v9;
          objc_msgSend(v6, "contentInset");
          v32 = v12;
          v33 = v11;
          v14 = v13;
          v16 = v15;
          objc_msgSend(v6, "verticalScrollIndicatorInsets");
          v18 = v17;
          v20 = v19;
          v22 = v21;
          v23 = v10 - adjustmentForKeyboard;
          v24 = v10 - adjustmentForKeyboard + v14;
          v26 = v23 + v25;
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIKeyboardAnimationDurationUserInfoKey));
          objc_msgSend(v27, "doubleValue");
          v29 = v28;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIKeyboardAnimationCurveUserInfoKey));
          v31 = (unint64_t)objc_msgSend(v30, "integerValue") | 4;
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_11B1B4;
          v34[3] = &unk_240238;
          v35 = v6;
          v36 = v33;
          v37 = v32;
          v38 = v24;
          v39 = v16;
          v40 = v18;
          v41 = v20;
          v42 = v26;
          v43 = v22;
          +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v31, v34, 0, v29, 0.0);

          adjustmentForKeyboard = v10;
        }
        self->_adjustmentForKeyboard = adjustmentForKeyboard;
      }
    }

  }
}

- (double)_keyboardOverlapInView:(id)a3 usingKeyboardInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double MaxY;
  double v17;
  double v18;
  double v19;
  CGRect v21;
  CGRect v22;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    objc_msgSend(v6, "CGRectValue");
    objc_msgSend(v7, "convertRect:fromWindow:", 0);
    objc_msgSend(v5, "convertRect:fromView:", 0);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    objc_msgSend(v5, "bounds");
    MaxY = CGRectGetMaxY(v21);
    v22.origin.x = v9;
    v22.origin.y = v11;
    v22.size.width = v13;
    v22.size.height = v15;
    v17 = MaxY - CGRectGetMinY(v22);
    objc_msgSend(v5, "safeAreaInsets");
    v19 = fmax(v17 - v18, 0.0);
  }
  else
  {
    v19 = 0.0;
  }

  return v19;
}

- (BOOL)registeredForNotifications
{
  return self->_registeredForNotifications;
}

- (void)setRegisteredForNotifications:(BOOL)a3
{
  self->_registeredForNotifications = a3;
}

- (BOOL)viewIsDisappearing
{
  return self->_viewIsDisappearing;
}

- (void)setViewIsDisappearing:(BOOL)a3
{
  self->_viewIsDisappearing = a3;
}

- (TUIKeyboardAvoidingSupportViewController)viewController
{
  return (TUIKeyboardAvoidingSupportViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (double)adjustmentForKeyboard
{
  return self->_adjustmentForKeyboard;
}

- (void)setAdjustmentForKeyboard:(double)a3
{
  self->_adjustmentForKeyboard = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
}

@end
