@implementation NCNotificationRequestCustomContentProvider

- (id)customContentViewControllerForNotificationRequest:(id)a3
{
  id v4;
  NCNotificationContentContainerViewController *customContentViewController;
  void *v6;
  char v7;
  NCNotificationContentContainerViewController *v8;
  NCNotificationContentContainerViewController *v9;
  NCNotificationContentContainerViewController *v10;

  v4 = a3;
  customContentViewController = self->_customContentViewController;
  if (!customContentViewController
    || (-[NCNotificationContentContainerViewController notificationRequest](customContentViewController, "notificationRequest"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "isEqual:", v4), v6, (v7 & 1) == 0))
  {
    v8 = -[NCNotificationContentContainerViewController initWithNotificationRequest:]([NCNotificationContentContainerViewController alloc], "initWithNotificationRequest:", v4);
    v9 = self->_customContentViewController;
    self->_customContentViewController = v8;

  }
  v10 = self->_customContentViewController;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customContentViewController, 0);
}

@end
