@implementation TPSListController

- (void)setSpecifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSListController;
  -[TPSListController specifier](&v9, sel_specifier);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)TPSListController;
    -[TPSListController setSpecifier:](&v8, sel_setSpecifier_, v4);
    objc_msgSend(v4, "tps_subscriptionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSListController setSubscriptionContext:](self, "setSubscriptionContext:", v6);

    objc_msgSend(v4, "tps_subscriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSListController setSubscriptions:](self, "setSubscriptions:", v7);

  }
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void)setSubscriptionContext:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionContext, a3);
}

- (NSOrderedSet)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1384);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end
