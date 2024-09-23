@implementation NRLinkNAN

- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5 wifiInterfaceName:(id)a6 localOuterEndpoint:(id)a7 remoteOuterEndpoint:(id)a8 listenerPortString:(id)a9
{
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NRLinkNAN;
  v9 = -[NRLinkWiFi initLinkWithQueue:linkDelegate:nrUUID:wifiInterfaceName:localOuterEndpoint:remoteOuterEndpoint:listenerPortString:](&v11, "initLinkWithQueue:linkDelegate:nrUUID:wifiInterfaceName:localOuterEndpoint:remoteOuterEndpoint:listenerPortString:", a3, a4, a5, a6, a7, a8, a9);
  objc_msgSend(v9, "setSubtype:", 103);
  return v9;
}

- (unsigned)metric
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NRLinkNAN;
  return -[NRLinkWiFi metric](&v3, "metric") + 19;
}

@end
