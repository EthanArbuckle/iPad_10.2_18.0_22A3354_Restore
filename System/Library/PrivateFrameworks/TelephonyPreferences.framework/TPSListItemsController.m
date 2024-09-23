@implementation TPSListItemsController

- (void)setSpecifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSListItemsController;
  -[TPSListItemsController specifier](&v8, sel_specifier);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)TPSListItemsController;
    -[TPSListItemsController setSpecifier:](&v7, sel_setSpecifier_, v4);
    objc_msgSend(v4, "tps_subscriptionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSListItemsController setSubscriptionContext:](self, "setSubscriptionContext:", v6);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end
