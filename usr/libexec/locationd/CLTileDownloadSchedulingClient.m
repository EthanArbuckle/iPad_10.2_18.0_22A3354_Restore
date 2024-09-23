@implementation CLTileDownloadSchedulingClient

- (CLTileDownloadSchedulingClient)initWithUniverse:(id)a3 andDelegate:(CLITileDownloadSchedulingClientDelegate *)a4
{
  CLTileDownloadSchedulingClient *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLTileDownloadSchedulingClient;
  v6 = -[CLTileDownloadSchedulingClient init](&v8, "init");
  if (v6)
  {
    v6->_universe = (CLIntersiloUniverse *)a3;
    v6->_delegate = a4;
    -[CLTileDownloadSchedulingClient setValid:](v6, "setValid:", 1);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[CLTileDownloadSchedulingClient setProxy:](self, "setProxy:", 0);
  -[CLTileDownloadSchedulingClient setUniverse:](self, "setUniverse:", 0);
  -[CLTileDownloadSchedulingClient setValid:](self, "setValid:", 0);
  -[CLTileDownloadSchedulingClient setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CLTileDownloadSchedulingClient;
  -[CLTileDownloadSchedulingClient dealloc](&v3, "dealloc");
}

- (BOOL)scheduleTileDownloadIfNecessary
{
  _BOOL4 v3;

  if (!-[CLTileDownloadSchedulingClient proxy](self, "proxy"))
  {
    -[CLTileDownloadSchedulingClient setProxy:](self, "setProxy:", objc_msgSend(-[CLIntersiloUniverse vendor](-[CLTileDownloadSchedulingClient universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLTileDownloadSchedulingService")));
    -[CLTileDownloadSchedulingServiceProtocol registerDelegate:inSilo:](-[CLTileDownloadSchedulingClient proxy](self, "proxy"), "registerDelegate:inSilo:", self, -[CLIntersiloUniverse silo](-[CLTileDownloadSchedulingClient universe](self, "universe"), "silo"));
LABEL_6:
    -[CLTileDownloadSchedulingServiceProtocol requestForSchedulingTileDownload:](-[CLTileDownloadSchedulingClient proxy](self, "proxy"), "requestForSchedulingTileDownload:", self);
    -[CLTileDownloadSchedulingClient setHasExecutedScheduleFromCellularConnectivity:](self, "setHasExecutedScheduleFromCellularConnectivity:", 0);
    -[CLTileDownloadSchedulingClient setHasExecutedScheduleFromWifiConnectivity:](self, "setHasExecutedScheduleFromWifiConnectivity:", 0);
    LOBYTE(v3) = 1;
    return v3;
  }
  if (-[CLTileDownloadSchedulingClient hasExecutedScheduleFromCellularConnectivity](self, "hasExecutedScheduleFromCellularConnectivity"))
  {
    goto LABEL_6;
  }
  v3 = -[CLTileDownloadSchedulingClient hasExecutedScheduleFromWifiConnectivity](self, "hasExecutedScheduleFromWifiConnectivity");
  if (v3)
    goto LABEL_6;
  return v3;
}

- (void)onScheduledTileDownloadWithReachabilityRequirement:(int64_t)a3
{
  CLITileDownloadSchedulingClientDelegate *v5;

  if (a3 == 2)
  {
    -[CLTileDownloadSchedulingClient setHasExecutedScheduleFromWifiConnectivity:](self, "setHasExecutedScheduleFromWifiConnectivity:", 1);
  }
  else if (a3 == 1)
  {
    -[CLTileDownloadSchedulingClient setHasExecutedScheduleFromCellularConnectivity:](self, "setHasExecutedScheduleFromCellularConnectivity:", 1);
  }
  if (-[CLTileDownloadSchedulingClient hasExecutedScheduleFromCellularConnectivity](self, "hasExecutedScheduleFromCellularConnectivity")&& -[CLTileDownloadSchedulingClient hasExecutedScheduleFromWifiConnectivity](self, "hasExecutedScheduleFromWifiConnectivity"))
  {
    -[CLTileDownloadSchedulingServiceProtocol stopListeningForForScheduledTileDownload:](-[CLTileDownloadSchedulingClient proxy](self, "proxy"), "stopListeningForForScheduledTileDownload:", self);
    -[CLTileDownloadSchedulingClient setProxy:](self, "setProxy:", 0);
  }
  v5 = -[CLTileDownloadSchedulingClient delegate](self, "delegate");
  (*((void (**)(CLITileDownloadSchedulingClientDelegate *, int64_t))v5->var0 + 2))(v5, a3);
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (CLTileDownloadSchedulingServiceProtocol)proxy
{
  return self->_proxy;
}

- (void)setProxy:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (CLIntersiloUniverse)universe
{
  return self->_universe;
}

- (void)setUniverse:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)hasExecutedScheduleFromCellularConnectivity
{
  return self->_hasExecutedScheduleFromCellularConnectivity;
}

- (void)setHasExecutedScheduleFromCellularConnectivity:(BOOL)a3
{
  self->_hasExecutedScheduleFromCellularConnectivity = a3;
}

- (BOOL)hasExecutedScheduleFromWifiConnectivity
{
  return self->_hasExecutedScheduleFromWifiConnectivity;
}

- (void)setHasExecutedScheduleFromWifiConnectivity:(BOOL)a3
{
  self->_hasExecutedScheduleFromWifiConnectivity = a3;
}

- (CLITileDownloadSchedulingClientDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(CLITileDownloadSchedulingClientDelegate *)a3
{
  self->_delegate = a3;
}

@end
