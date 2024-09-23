@implementation TSAuthFlow

- (TSAuthFlow)initWithExternalizedContext:(id)a3 descriptor:(id)a4 isLocalConvertFlow:(BOOL)a5
{
  id v9;
  id v10;
  TSAuthFlow *v11;
  TSAuthFlow *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TSAuthFlow;
  v11 = -[TSSIMSetupFlow init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_externalizedContext, a3);
    objc_storeStrong((id *)&v12->_descriptor, a4);
    v12->_isLocalConvertFlow = a5;
  }

  return v12;
}

- (id)firstViewController
{
  TSSecureIntentGestureViewController *v3;
  NSObject *v5;
  void *v6;
  id v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (+[TSUtilities isSecureIntentUIRequired:](TSUtilities, "isSecureIntentUIRequired:", self->_externalizedContext))
  {
    v3 = -[TSSecureIntentGestureViewController initWithExternalizedContext:descriptor:isLocalConvertFlow:]([TSSecureIntentGestureViewController alloc], "initWithExternalizedContext:descriptor:isLocalConvertFlow:", self->_externalizedContext, self->_descriptor, self->_isLocalConvertFlow);
    -[TSSecureIntentGestureViewController setDelegate:](v3, "setDelegate:", self);
    -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v3);
    return v3;
  }
  else
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[TSAuthFlow firstViewController]";
      _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "skip secure intent ui @%s", (uint8_t *)&v8, 0xCu);
    }

    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "updateSecureIntentData:", self->_externalizedContext);

    return 0;
  }
}

- (void)firstViewController:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[TSAuthFlow firstViewController](self, "firstViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (id)nextViewControllerFrom:(id)a3
{
  return 0;
}

- (NSData)externalizedContext
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setExternalizedContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)descriptor
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDescriptor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)isLocalConvertFlow
{
  return self->_isLocalConvertFlow;
}

- (void)setIsLocalConvertFlow:(BOOL)a3
{
  self->_isLocalConvertFlow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_externalizedContext, 0);
}

@end
