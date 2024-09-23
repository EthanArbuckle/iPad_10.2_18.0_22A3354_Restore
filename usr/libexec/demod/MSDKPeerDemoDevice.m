@implementation MSDKPeerDemoDevice

- (id)initWithMSDRapportDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  MSDKPeerDemoDevice *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, kMSDKPeerDemoDevicePropertyDevice);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, kMSDKPeerDemoDevicePropertyIdentifier);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceName"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, kMSDKPeerDemoDevicePropertyDeviceName);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "pairingMode")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, kMSDKPeerDemoDevicePropertyPairingMode);

  v9 = objc_msgSend(v4, "authenticated");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, kMSDKPeerDemoDevicePropertyAuthenticated);

  v11 = -[MSDKPeerDemoDevice initWithDeviceProperties:](self, "initWithDeviceProperties:", v5);
  return v11;
}

@end
