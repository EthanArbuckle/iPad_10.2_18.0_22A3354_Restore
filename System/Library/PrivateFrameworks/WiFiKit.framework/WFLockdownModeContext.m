@implementation WFLockdownModeContext

- (WFLockdownModeContext)initWithNetwork:(id)a3 securityType:(unint64_t)a4
{
  id v7;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)&self->_network, a3);
    self->_securityType = a4;
    self->_needsDismissal = 1;
  }
  else
  {
    WFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      v11 = 136315138;
      v12 = "-[WFLockdownModeContext initWithNetwork:securityType:]";
      _os_log_impl(&dword_219FC8000, v9, v10, "%s: nil network", (uint8_t *)&v11, 0xCu);
    }

    self = 0;
  }

  return self;
}

- (int64_t)requestedFields
{
  return 0;
}

- (void)cancel
{
  void (**v2)(id, _QWORD);

  self->_needsDismissal = 0;
  -[WFLockdownModeContext completionHandler](self, "completionHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, 0);

}

- (void)join
{
  void (**v2)(id, uint64_t);

  self->_needsDismissal = 0;
  -[WFLockdownModeContext completionHandler](self, "completionHandler");
  v2 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  v2[2](v2, 1);

}

- (WFNetworkView)provider
{
  return (WFNetworkView *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (BOOL)needsDismissal
{
  return self->_needsDismissal;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (WFNetworkListRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_network, a3);
}

- (unint64_t)securityType
{
  return self->_securityType;
}

- (void)setSecurityType:(unint64_t)a3
{
  self->_securityType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end
