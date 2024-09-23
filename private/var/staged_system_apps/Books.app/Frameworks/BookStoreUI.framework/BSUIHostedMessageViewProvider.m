@implementation BSUIHostedMessageViewProvider

- (BSUIHostedMessageViewProvider)initWithRequest:(id)a3 identifier:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  BSUIHostedMessageViewProvider *v12;
  BSUIHostedMessageViewProvider *v13;
  id v14;
  AMSDialogRequest *request;
  void *v16;
  BCMessageViewControllerProvider *v17;
  BCMessageViewControllerProvider *messageViewControllerProvider;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)BSUIHostedMessageViewProvider;
  v12 = -[BSUIHostedMessageViewProvider init](&v20, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_identifier, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14 = objc_alloc((Class)BCMessageViewControllerProvider);
    request = v13->_request;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingIdentifier identifier](v13->_identifier, "identifier"));
    v17 = (BCMessageViewControllerProvider *)objc_msgSend(v14, "initWithRequest:placement:", request, v16);
    messageViewControllerProvider = v13->_messageViewControllerProvider;
    v13->_messageViewControllerProvider = v17;

    -[BCMessageViewControllerProvider setDelegate:](v13->_messageViewControllerProvider, "setDelegate:", v13);
  }

  return v13;
}

- (id)hostedViewProviderCreateViewController
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCMessageViewControllerProvider viewController](self->_messageViewControllerProvider, "viewController"));
  v4 = objc_opt_class(UIViewController);
  v5 = BUClassAndProtocolCast(v3, v4, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    objc_msgSend(v6, "setIsOnScreen:", 0);
    objc_msgSend(v6, "setShouldAutomaticallyReportMetrics:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCMessageViewControllerProvider viewController](self->_messageViewControllerProvider, "viewController"));

  return v7;
}

- (void)_dismiss
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "removeProviderForIdentifier:", self->_identifier);

}

- (void)messageViewController:(id)a3 didSelectActionWithURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewController"));
  v9 = (char *)objc_msgSend(v8, "modalPresentationStyle");

  if (v9 == (_BYTE *)&dword_4 + 3)
  {
    objc_initWeak(&location, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewController"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_20D10;
    v13[3] = &unk_2E4170;
    objc_copyWeak(&v15, &location);
    v14 = v7;
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));
    objc_msgSend(WeakRetained, "hostedMessageViewDidTriggerAction:", v12);

  }
}

- (void)messageViewControllerDidSelectCancel:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewController"));
  v6 = (char *)objc_msgSend(v5, "modalPresentationStyle");

  if (v6 == (_BYTE *)&dword_4 + 3)
  {
    objc_initWeak(&location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewController"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_20E84;
    v8[3] = &unk_2E48C8;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    -[BSUIHostedMessageViewProvider _dismiss](self, "_dismiss");
  }

}

- (unint64_t)hostedViewProviderFlags
{
  return 2;
}

- (void)hostedViewProviderDidChangeVisibility:(BOOL)a3 viewController:(id)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCMessageViewControllerProvider viewController](self->_messageViewControllerProvider, "viewController", a3, a4));
  v7 = objc_opt_class(UIViewController);
  v8 = BUClassAndProtocolCast(v6, v7, 2);
  v11 = (id)objc_claimAutoreleasedReturnValue(v8);

  objc_msgSend(v11, "setIsOnScreen:", v4, &OBJC_PROTOCOL___BCAMSUITrackable, &OBJC_PROTOCOL___AMSUIMessageViewController);
  if (v4)
  {
    objc_msgSend(v11, "enqueueImpressionMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIHostedMessageViewProvider delegate](self, "delegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingIdentifier identifier](self->_identifier, "identifier"));
    objc_msgSend(v9, "hostedMessageViewDidBecomeVisible:", v10);

  }
}

- (TUIVisibilityOptions)hostedViewProviderVisibilityOptions
{
  return (TUIVisibilityOptions *)+[TUIVisibilityOptions defaultOptions](TUIVisibilityOptions, "defaultOptions");
}

- (void)hostedViewProviderCustomizeViewController:(id)a3 withAnchorPoint:(CGPoint)a4
{
  double y;
  double x;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;

  y = a4.y;
  x = a4.x;
  v6 = a3;
  v7 = objc_opt_class(AMSUIBubbleTipViewController);
  v8 = BUDynamicCast(v7, v6);
  v16 = (id)objc_claimAutoreleasedReturnValue(v8);

  v9 = v16;
  if (v16)
  {
    if (y == 0.0)
    {
      v10 = 0;
      v11 = 0;
    }
    else if (y == 1.0)
    {
      v10 = 1;
      v11 = 1;
    }
    else if (x == 0.0)
    {
      v10 = 0;
      v11 = 2;
    }
    else
    {
      if (x != 1.0)
        goto LABEL_16;
      v10 = 0;
      v11 = 3;
    }
    if (y == 0.0)
      v10 = 1;
    v12 = fabs(x);
    v13 = fabs(y);
    if (v10)
      v14 = v12;
    else
      v14 = v13;
    v15 = objc_msgSend(objc_alloc((Class)AMSUIBubbleTipInlineAnchorInfo), "initWithArrowDirection:relativeArrowOffset:", v11, v14);
    objc_msgSend(v16, "setInlineAnchorInfo:", v15);

    v9 = v16;
  }
LABEL_16:

}

- (BSUIHostedMessageViewProviderDelegate)delegate
{
  return (BSUIHostedMessageViewProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BCMessageViewControllerProvider)messageViewControllerProvider
{
  return self->_messageViewControllerProvider;
}

- (void)setMessageViewControllerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_messageViewControllerProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageViewControllerProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
