@implementation SBWalletNotificationSource

- (SBWalletNotificationSource)initWithDispatcher:(id)a3
{
  id v5;
  SBWalletNotificationSource *v6;
  SBWalletNotificationSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBWalletNotificationSource;
  v6 = -[SBWalletNotificationSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dispatcher, a3);

  return v7;
}

- (void)postNotificationRequestForCardItem:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC6008], "notificationRequestWithCardItem:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBWalletNotificationSource dispatcher](self, "dispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationWithRequest:", v5);

}

- (void)modifyNotificationRequestForCardItem:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC6008], "notificationRequestWithCardItem:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBWalletNotificationSource dispatcher](self, "dispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifyNotificationWithRequest:", v5);

}

- (void)withdrawNotificationRequestForCardItem:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC6008], "notificationRequestWithCardItem:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBWalletNotificationSource dispatcher](self, "dispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "withdrawNotificationWithRequest:", v5);

}

- (NCNotificationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatcher, 0);
}

@end
