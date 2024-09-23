@implementation CARSessionRequestHost

- (id)initWithDisplayName:(id)a3 authenticationCertificateSerial:(id)a4 pairedVehicleIdentifier:(id)a5 wiFiUUID:(id)a6 bleStartSessionMessage:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  CARSessionRequestHost *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;

  v11 = a7;
  v25 = a6;
  v12 = a5;
  v24 = a4;
  v13 = a3;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "wiredIPs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "wirelessIPs"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "port"));
  v15 = objc_msgSend(v26, "integerValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "publicKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sourceVersion"));

  LOBYTE(v22) = 0;
  LOBYTE(v21) = 1;
  v19 = -[CARSessionRequestHost initWithDisplayName:wiredIPv6Addresses:wirelessIPv6Addresses:port:carplayWiFiUUID:deviceIdentifier:publicKey:sourceVersion:supportsMutualAuthentication:authenticationCertificateSerial:pairedVehicleIdentifier:wiredCarPlaySimulator:](self, "initWithDisplayName:wiredIPv6Addresses:wirelessIPv6Addresses:port:carplayWiFiUUID:deviceIdentifier:publicKey:sourceVersion:supportsMutualAuthentication:authenticationCertificateSerial:pairedVehicleIdentifier:wiredCarPlaySimulator:", v13, v23, v14, v15, v25, v16, v17, v18, v21, v24, v12, v22);

  return v19;
}

@end
