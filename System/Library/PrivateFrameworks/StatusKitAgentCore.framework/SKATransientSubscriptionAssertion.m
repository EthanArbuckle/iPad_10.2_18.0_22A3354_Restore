@implementation SKATransientSubscriptionAssertion

- (SKATransientSubscriptionAssertion)initWithSubscriptionIdentifier:(id)a3
{
  id v4;
  SKATransientSubscriptionAssertion *v5;
  NSObject *v6;
  uint64_t v7;
  NSString *subscriptionIdentifier;
  os_activity_t v9;
  OS_os_activity *osActivity;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SKATransientSubscriptionAssertion;
  v5 = -[SKATransientSubscriptionAssertion init](&v12, sel_init);
  if (v5)
  {
    +[SKATransientSubscriptionAssertion logger](SKATransientSubscriptionAssertion, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Creating TransientSubscriptionAssertion for channel \"%@\", buf, 0xCu);
    }

    v7 = objc_msgSend(v4, "copy");
    subscriptionIdentifier = v5->_subscriptionIdentifier;
    v5->_subscriptionIdentifier = (NSString *)v7;

    v9 = _os_activity_create(&dword_2188DF000, "TransientSubscriptionAssertion", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    osActivity = v5->_osActivity;
    v5->_osActivity = (OS_os_activity *)v9;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SKATransientSubscriptionAssertion subscriptionIdentifier](self, "subscriptionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; subscriptionIdentifier = %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[SKATransientSubscriptionAssertion isEqualToTransientSubscription:](self, "isEqualToTransientSubscription:", v4);

  return v5;
}

- (BOOL)isEqualToTransientSubscription:(id)a3
{
  SKATransientSubscriptionAssertion *v4;
  SKATransientSubscriptionAssertion *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (SKATransientSubscriptionAssertion *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    -[SKATransientSubscriptionAssertion subscriptionIdentifier](v4, "subscriptionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 || self->_subscriptionIdentifier)
    {
      -[SKATransientSubscriptionAssertion subscriptionIdentifier](v5, "subscriptionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", self->_subscriptionIdentifier);

    }
    else
    {
      v8 = 1;
    }

  }
  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SKATransientSubscriptionAssertion subscriptionIdentifier](self, "subscriptionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *subscriptionIdentifier;
  objc_super v5;
  uint8_t buf[4];
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  +[SKATransientSubscriptionAssertion logger](SKATransientSubscriptionAssertion, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    subscriptionIdentifier = self->_subscriptionIdentifier;
    *(_DWORD *)buf = 138412290;
    v7 = subscriptionIdentifier;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Deallocing TransientSubscriptionAssertion for channel \"%@\", releasing os_activity", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)SKATransientSubscriptionAssertion;
  -[SKATransientSubscriptionAssertion dealloc](&v5, sel_dealloc);
}

+ (id)logger
{
  if (logger_onceToken_20 != -1)
    dispatch_once(&logger_onceToken_20, &__block_literal_global_20);
  return (id)logger__logger_20;
}

void __43__SKATransientSubscriptionAssertion_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKATransientSubscriptionAssertion");
  v1 = (void *)logger__logger_20;
  logger__logger_20 = (uint64_t)v0;

}

- (NSString)subscriptionIdentifier
{
  return self->_subscriptionIdentifier;
}

- (OS_os_activity)osActivity
{
  return self->_osActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osActivity, 0);
  objc_storeStrong((id *)&self->_subscriptionIdentifier, 0);
}

@end
