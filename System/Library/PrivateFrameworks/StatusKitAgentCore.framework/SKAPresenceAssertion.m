@implementation SKAPresenceAssertion

- (SKAPresenceAssertion)initWithPresenceIdentifier:(id)a3 options:(id)a4 payload:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKAPresenceAssertion *v11;
  NSObject *v12;
  uint64_t v13;
  NSString *presenceIdentifier;
  os_activity_t v15;
  OS_os_activity *osActivity;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SKAPresenceAssertion;
  v11 = -[SKAPresenceAssertion init](&v18, sel_init);
  if (v11)
  {
    +[SKAPresenceAssertion logger](SKAPresenceAssertion, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Creating PresenceAssertion for identifier \"%@\", buf, 0xCu);
    }

    v13 = objc_msgSend(v8, "copy");
    presenceIdentifier = v11->_presenceIdentifier;
    v11->_presenceIdentifier = (NSString *)v13;

    objc_storeStrong((id *)&v11->_payload, a5);
    objc_storeStrong((id *)&v11->_options, a4);
    v15 = _os_activity_create(&dword_2188DF000, "PresenceAssertion", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    osActivity = v11->_osActivity;
    v11->_osActivity = (OS_os_activity *)v15;

  }
  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SKAPresenceAssertion presenceIdentifier](self, "presenceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPresenceAssertion options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; presenceIdentifier = %@ options = %@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[SKAPresenceAssertion isEqualToPresenceAssertion:](self, "isEqualToPresenceAssertion:", v4);

  return v5;
}

- (BOOL)isEqualToPresenceAssertion:(id)a3
{
  SKAPresenceAssertion *v4;
  SKAPresenceAssertion *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (SKAPresenceAssertion *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    -[SKAPresenceAssertion presenceIdentifier](v4, "presenceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 || self->_presenceIdentifier)
    {
      -[SKAPresenceAssertion presenceIdentifier](v5, "presenceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", self->_presenceIdentifier);

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

  -[SKAPresenceAssertion presenceIdentifier](self, "presenceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *presenceIdentifier;
  objc_super v5;
  uint8_t buf[4];
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  +[SKAPresenceAssertion logger](SKAPresenceAssertion, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    presenceIdentifier = self->_presenceIdentifier;
    *(_DWORD *)buf = 138412290;
    v7 = presenceIdentifier;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Deallocing PresenceAssertion for channel \"%@\", releasing os_activity", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)SKAPresenceAssertion;
  -[SKAPresenceAssertion dealloc](&v5, sel_dealloc);
}

+ (id)logger
{
  if (logger_onceToken_1 != -1)
    dispatch_once(&logger_onceToken_1, &__block_literal_global_1);
  return (id)logger__logger_1;
}

void __30__SKAPresenceAssertion_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAPresenceAssertion");
  v1 = (void *)logger__logger_1;
  logger__logger_1 = (uint64_t)v0;

}

- (NSString)presenceIdentifier
{
  return self->_presenceIdentifier;
}

- (SKPresenceOptions)options
{
  return self->_options;
}

- (SKPresencePayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_os_activity)osActivity
{
  return self->_osActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osActivity, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_presenceIdentifier, 0);
}

@end
