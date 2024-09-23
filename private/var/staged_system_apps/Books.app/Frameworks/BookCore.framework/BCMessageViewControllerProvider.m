@implementation BCMessageViewControllerProvider

- (BCMessageViewControllerProvider)initWithRequest:(id)a3 placement:(id)a4
{
  return -[BCMessageViewControllerProvider initWithRequest:placement:style:messageType:](self, "initWithRequest:placement:style:messageType:", a3, a4, 0, 6);
}

- (BCMessageViewControllerProvider)initWithRequest:(id)a3 placement:(id)a4 style:(int64_t)a5 messageType:(int64_t)a6
{
  id v11;
  id v12;
  BCMessageViewControllerProvider *v13;
  BCMessageViewControllerProvider *v14;
  NSString *v15;
  NSString *placement;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BCMessageViewControllerProvider;
  v13 = -[BCMessageViewControllerProvider init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_request, a3);
    v15 = (NSString *)objc_msgSend(v12, "copy");
    placement = v14->_placement;
    v14->_placement = v15;

    v14->_userInterfaceStyle = a5;
    v14->_messageType = a6;
  }

  return v14;
}

- (UIViewController)viewController
{
  int *v3;
  BCAMSUIBubbleTipViewController *v4;
  UIViewController *viewController;

  if (!self->_viewController)
  {
    v3 = (int *)-[AMSDialogRequest style](self->_request, "style");
    if (v3 == &dword_4)
    {
      v4 = -[BCAMSUIBubbleTipViewController initWithRequest:placement:messageType:]([BCAMSUIBubbleTipViewController alloc], "initWithRequest:placement:messageType:", self->_request, self->_placement, self->_messageType);
      -[BCAMSUIBubbleTipViewController setDelegate:](v4, "setDelegate:", self);
      if (-[BCMessageViewControllerProvider userInterfaceStyle](self, "userInterfaceStyle"))
        -[BCAMSUIBubbleTipViewController setOverrideUserInterfaceStyle:](v4, "setOverrideUserInterfaceStyle:", -[BCMessageViewControllerProvider userInterfaceStyle](self, "userInterfaceStyle"));
      goto LABEL_7;
    }
    if (v3 == (int *)((char *)&dword_0 + 3))
    {
      v4 = -[BCAMSUIBannerMessageViewController initWithRequest:placement:]([BCAMSUIBannerMessageViewController alloc], "initWithRequest:placement:", self->_request, self->_placement);
      -[BCAMSUIBubbleTipViewController setDelegate:](v4, "setDelegate:", self);
LABEL_7:
      viewController = self->_viewController;
      self->_viewController = (UIViewController *)v4;

    }
  }
  return self->_viewController;
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "originalRequest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "selectedActionIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "locateActionWithIdentifier:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deepLink"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCMessageViewControllerProvider delegate](self, "delegate"));
  v12 = v11;
  if (v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deepLink"));
    objc_msgSend(v12, "messageViewController:didSelectActionWithURL:", self, v13);

  }
  else
  {
    objc_msgSend(v11, "messageViewControllerDidSelectCancel:", self);
  }

  v14 = objc_msgSend(v6, "shouldAutomaticallyReportMetrics");
  if ((v14 & 1) == 0)
  {
    v15 = objc_alloc((Class)AMSEngagement);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
    v17 = objc_msgSend(v15, "initWithBag:", v16);
    objc_msgSend(v17, "handleDialogResult:", v21);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCMessageViewControllerProvider viewController](self, "viewController"));
  v19 = BUProtocolCast(&OBJC_PROTOCOL___BCAMSUITrackable, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  objc_msgSend(v20, "reportActionTriggered:", v9);
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v4;
  _QWORD *v5;
  _QWORD block[4];
  _QWORD *v7;
  _QWORD v8[5];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_156D7C;
  v8[3] = &unk_28B808;
  v8[4] = self;
  v4 = a4;
  v9 = v4;
  v5 = objc_retainBlock(v8);
  if (v5)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v5[2])(v5);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_156DBC;
      block[3] = &unk_28BF90;
      v7 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

- (AMSDialogRequest)request
{
  return self->_request;
}

- (NSString)placement
{
  return self->_placement;
}

- (void)setPlacement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BCMessageViewControllerProviderDelegate)delegate
{
  return (BCMessageViewControllerProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BAMessageData)messageData
{
  return self->_messageData;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int64_t)a3
{
  self->_messageType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
