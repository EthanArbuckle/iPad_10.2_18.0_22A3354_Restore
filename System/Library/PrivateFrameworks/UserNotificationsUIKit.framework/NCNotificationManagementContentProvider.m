@implementation NCNotificationManagementContentProvider

- (NCNotificationManagementContentProvider)initWithNotificationRequest:(id)a3 managementDelegate:(id)a4
{
  id v7;
  id v8;
  NCNotificationManagementContentProvider *v9;
  NCNotificationManagementContentProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationManagementContentProvider;
  v9 = -[NCNotificationManagementContentProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationRequest, a3);
    objc_storeWeak((id *)&v10->_managementDelegate, v8);
  }

  return v10;
}

- (void)handleManageAction:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NCNotificationManagementContentProvider managementDelegate](self, "managementDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationManagementContentProvider:requestsPresentingNotificationManagementViewType:forNotificationRequest:withPresentingView:", self, 0, v5, v4);

}

- (NCNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (void)setNotificationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_notificationRequest, a3);
}

- (NCNotificationManagementContentProviderDelegate)managementDelegate
{
  return (NCNotificationManagementContentProviderDelegate *)objc_loadWeakRetained((id *)&self->_managementDelegate);
}

- (void)setManagementDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_managementDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_managementDelegate);
  objc_storeStrong((id *)&self->_notificationRequest, 0);
}

@end
