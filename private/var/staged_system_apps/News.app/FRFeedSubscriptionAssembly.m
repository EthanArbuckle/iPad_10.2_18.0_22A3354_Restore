@implementation FRFeedSubscriptionAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "publicContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "registerProtocol:factory:", &OBJC_PROTOCOL___FREnableNotificationsAlertPresenter, &stru_1000DC250));
  v6 = objc_msgSend(v5, "inScope:", 2);

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "privateContainer"));
  v8 = objc_msgSend(v9, "registerClass:factory:", objc_opt_class(FREnableNotificationsAlertPresenter, v7), &stru_1000DC290);

}

- (FRFeedSubscriptionAssembly)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FRFeedSubscriptionAssembly;
  return -[FRFeedSubscriptionAssembly init](&v3, "init");
}

- (FRFeedSubscriptionAssembly)initWithWindow:(id)a3
{
  id v5;
  FRFeedSubscriptionAssembly *v6;
  FRFeedSubscriptionAssembly *v7;
  objc_super v9;

  v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007EBCC();
  v9.receiver = self;
  v9.super_class = (Class)FRFeedSubscriptionAssembly;
  v6 = -[FRFeedSubscriptionAssembly init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_window, a3);

  return v7;
}

- (UIWindow)window
{
  return self->_window;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
}

@end
