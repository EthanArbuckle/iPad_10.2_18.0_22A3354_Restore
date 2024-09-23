@implementation UIStickerPresentationController

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  -[UIPresentationController _setContainerIgnoresDirectTouchEvents:](self, "_setContainerIgnoresDirectTouchEvents:", 1);
}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[UIPresentationController containerView](self, "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_shouldRestoreFirstResponder
{
  UIStickerPresentationController *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[16];

  v2 = self;
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UIPresentationController presentedViewController](v2, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v2) = objc_msgSend(v5, "keyWindowChangedDuringInsert") ^ 1;

  }
  else
  {
    _stickersLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Unexpected presented controller", buf, 2u);
    }

    v8.receiver = v2;
    v8.super_class = (Class)UIStickerPresentationController;
    LOBYTE(v2) = -[UIPresentationController _shouldRestoreFirstResponder](&v8, sel__shouldRestoreFirstResponder);
  }
  return (char)v2;
}

@end
