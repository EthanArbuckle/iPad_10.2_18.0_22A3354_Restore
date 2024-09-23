@implementation KmlVersions

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VehicleSupportedFrameworkVersions   : %@\n"), self->_vehicleSupportedFrameworkVersionsTlvAsData));
  objc_msgSend(v3, "appendString:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VehicleSupportedAppletVersions      : %@\n"), self->_vehicleSupportedAppletVersionsTlvAsData));
  objc_msgSend(v3, "appendString:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VehicleSupportedBTVersions          : %@\n"), self->_vehicleSupportedBluetoothVersionsTlvAsData));
  objc_msgSend(v3, "appendString:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PreferredFrameworkVersion           : 0x%02X\n"), self->_ourPreferredKmlVersion));
  objc_msgSend(v3, "appendString:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AgreedFrameworkVersion              : 0x%02X\n"), self->_agreedKmlVehicleVersion));
  objc_msgSend(v3, "appendString:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AgreedAppletVersion                 : 0x%02X\n"), self->_agreedAppletVehicleVersion));
  objc_msgSend(v3, "appendString:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AgreedSharingFrameworkVersion       : 0x%02X\n"), self->_agreedKmlSharingVersion));
  objc_msgSend(v3, "appendString:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AgreedVehicleServerVersion          : 0x%02X\n"), self->_agreedKmlVehicleServerVersion));
  objc_msgSend(v3, "appendString:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AgreedBluetoothVersion              : 0x%02X\n"), self->_agreedKmlBluetoothVersion));
  objc_msgSend(v3, "appendString:", v12);

  return v3;
}

- (KmlTlv)kmlSupportedVersionsTlvForPairing
{
  return self->_kmlSupportedVersionsTlvForPairing;
}

- (KmlTlv)kmlSupportedVersionsTlvForShareInitiator
{
  return self->_kmlSupportedVersionsTlvForShareInitiator;
}

- (KmlTlv)appletSupportedVersionsTlvForPairing
{
  return self->_appletSupportedVersionsTlvForPairing;
}

- (NSData)vehicleSupportedFrameworkVersionsTlvAsData
{
  return self->_vehicleSupportedFrameworkVersionsTlvAsData;
}

- (NSString)vehicleSupportedFrameworkVersionsForCA
{
  return self->_vehicleSupportedFrameworkVersionsForCA;
}

- (NSData)vehicleSupportedAppletVersionsTlvAsData
{
  return self->_vehicleSupportedAppletVersionsTlvAsData;
}

- (NSData)vehicleSupportedBluetoothtVersionsTlvAsData
{
  return self->_vehicleSupportedBluetoothtVersionsTlvAsData;
}

- (unsigned)ourPreferredKmlVersion
{
  return self->_ourPreferredKmlVersion;
}

- (unsigned)agreedKmlVehicleVersion
{
  return self->_agreedKmlVehicleVersion;
}

- (unsigned)agreedKmlSharingVersion
{
  return self->_agreedKmlSharingVersion;
}

- (unsigned)agreedAppletVehicleVersion
{
  return self->_agreedAppletVehicleVersion;
}

- (unsigned)ourPreferredVehicleServerVersion
{
  return self->_ourPreferredVehicleServerVersion;
}

- (unsigned)agreedKmlVehicleServerVersion
{
  return self->_agreedKmlVehicleServerVersion;
}

- (unsigned)agreedKmlBluetoothVersion
{
  return self->_agreedKmlBluetoothVersion;
}

- (unsigned)keyRoleToShare
{
  return self->_keyRoleToShare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleSupportedBluetoothVersionsTlvAsData, 0);
  objc_storeStrong((id *)&self->_vehicleServerVersionsUpgradeReadyList, 0);
  objc_storeStrong((id *)&self->_kmlSupportedVehicleServerVersionsList, 0);
  objc_storeStrong((id *)&self->_appletSupportedVersionsList, 0);
  objc_storeStrong((id *)&self->_kmlUpgradeReadyVersionsList, 0);
  objc_storeStrong((id *)&self->_kmlSupportedVersionsList, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedBluetoothtVersionsTlvAsData, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedAppletVersionsTlvAsData, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedFrameworkVersionsForCA, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedFrameworkVersionsTlvAsData, 0);
  objc_storeStrong((id *)&self->_appletSupportedVersionsTlvForPairing, 0);
  objc_storeStrong((id *)&self->_kmlSupportedVersionsTlvForShareInitiator, 0);
  objc_storeStrong((id *)&self->_kmlSupportedVersionsTlvForPairing, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
