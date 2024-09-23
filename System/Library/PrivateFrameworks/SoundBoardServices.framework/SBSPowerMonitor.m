@implementation SBSPowerMonitor

- (SBSPowerMonitor)init
{
  return -[SBSPowerMonitor initWithTarget:](self, "initWithTarget:", CFSTR("localhost"));
}

- (SBSPowerMonitor)initWithTarget:(id)a3
{
  id v4;
  SBSPowerMonitor *v5;
  uint64_t v6;
  SBSPowerMonitorImplementer *sbProxy;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSPowerMonitor;
  v5 = -[SBSPowerMonitor init](&v9, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("localhost")))
      +[SBSUtils createProxyConnectionForXPCWithExportedObject:connection:](SBSUtils, "createProxyConnectionForXPCWithExportedObject:connection:", 0, &v5->_sbConnection);
    else
      +[SBSUtils createProxyConnectionForRapportTarget:](SBSUtils, "createProxyConnectionForRapportTarget:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    sbProxy = v5->_sbProxy;
    v5->_sbProxy = (SBSPowerMonitorImplementer *)v6;

  }
  return v5;
}

- (void)getPowerEstimateForInterval:(float)a3 reply:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  if (a4)
  {
    -[SBSPowerMonitorImplementer getPowerEstimateForInterval:reply:](self->_sbProxy, "getPowerEstimateForInterval:reply:");
  }
  else
  {
    _SBSLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_222D7A000, v4, OS_LOG_TYPE_ERROR, "Reply completion handler is nil", v5, 2u);
    }

  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_sbConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSPowerMonitor;
  -[SBSPowerMonitor dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

@end
