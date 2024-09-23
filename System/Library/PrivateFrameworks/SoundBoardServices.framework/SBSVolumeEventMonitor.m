@implementation SBSVolumeEventMonitor

- (SBSVolumeEventMonitor)init
{
  return -[SBSVolumeEventMonitor initWithTarget:](self, "initWithTarget:", CFSTR("localhost"));
}

- (SBSVolumeEventMonitor)initWithTarget:(id)a3
{
  id v4;
  SBSVolumeEventMonitor *v5;
  uint64_t v6;
  SBSVolumeEventMonitorImplementer *sbProxy;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSVolumeEventMonitor;
  v5 = -[SBSVolumeEventMonitor init](&v9, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("localhost")))
      +[SBSUtils createProxyConnectionForXPCWithExportedObject:connection:](SBSUtils, "createProxyConnectionForXPCWithExportedObject:connection:", 0, &v5->_sbConnection);
    else
      +[SBSUtils createProxyConnectionForRapportTarget:](SBSUtils, "createProxyConnectionForRapportTarget:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    sbProxy = v5->_sbProxy;
    v5->_sbProxy = (SBSVolumeEventMonitorImplementer *)v6;

  }
  return v5;
}

- (void)fetchLatestEvents:(int64_t)a3 completionHandler:(id)a4
{
  -[SBSVolumeEventMonitorImplementer fetchLatestEvents:completionHandler:](self->_sbProxy, "fetchLatestEvents:completionHandler:", a3, a4);
}

- (NSXPCConnection)sbConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSbConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (SBSVolumeEventMonitorImplementer)sbProxy
{
  return (SBSVolumeEventMonitorImplementer *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

@end
