@implementation SPInternalSimpleBeacon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SPInternalSimpleBeacon *v4;
  SPInternalSimpleBeacon *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  _BOOL4 v13;
  _BOOL4 v14;
  char v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v68;
  double v69;
  double v70;
  double v71;
  int64_t v72;
  int64_t v73;
  int64_t v74;
  int64_t v75;
  void *v76;
  _BOOL4 v77;
  _BOOL4 v78;
  _BOOL4 v79;
  _BOOL4 v80;
  int64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;

  v4 = (SPInternalSimpleBeacon *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SPInternalSimpleBeacon identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPInternalSimpleBeacon identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[SPInternalSimpleBeacon name](self, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPInternalSimpleBeacon name](v5, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", v9))
        {
          -[SPInternalSimpleBeacon type](self, "type");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SPInternalSimpleBeacon type](v5, "type");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToString:", v11)
            && (v12 = -[SPInternalSimpleBeacon partIdentifier](self, "partIdentifier"),
                v12 == -[SPInternalSimpleBeacon partIdentifier](v5, "partIdentifier"))
            && (v13 = -[SPInternalSimpleBeacon connectionAllowed](self, "connectionAllowed"),
                v13 == -[SPInternalSimpleBeacon connectionAllowed](v5, "connectionAllowed")))
          {
            -[SPInternalSimpleBeacon systemVersion](self, "systemVersion");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            -[SPInternalSimpleBeacon systemVersion](v5, "systemVersion");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = v68;
            if (objc_msgSend(v68, "isEqualToString:")
              && (-[SPInternalSimpleBeacon txPower](self, "txPower"),
                  v70 = v69,
                  -[SPInternalSimpleBeacon txPower](v5, "txPower"),
                  v70 == v71)
              && (v72 = -[SPInternalSimpleBeacon vendorId](self, "vendorId"),
                  v72 == -[SPInternalSimpleBeacon vendorId](v5, "vendorId"))
              && (v73 = -[SPInternalSimpleBeacon productId](self, "productId"),
                  v73 == -[SPInternalSimpleBeacon productId](v5, "productId"))
              && (v74 = -[SPInternalSimpleBeacon batteryLevel](self, "batteryLevel"),
                  v74 == -[SPInternalSimpleBeacon batteryLevel](v5, "batteryLevel"))
              && (v75 = -[SPInternalSimpleBeacon connectableDeviceCount](self, "connectableDeviceCount"),
                  v75 == -[SPInternalSimpleBeacon connectableDeviceCount](v5, "connectableDeviceCount")))
            {
              -[SPInternalSimpleBeacon productUUID](self, "productUUID");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              -[SPInternalSimpleBeacon productUUID](v5, "productUUID");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = v76;
              if (objc_msgSend(v76, "isEqual:")
                && (v77 = -[SPInternalSimpleBeacon isAppleAudioAccessory](self, "isAppleAudioAccessory"),
                    v77 == -[SPInternalSimpleBeacon isAppleAudioAccessory](v5, "isAppleAudioAccessory"))
                && (v78 = -[SPInternalSimpleBeacon isZeus](self, "isZeus"),
                    v78 == -[SPInternalSimpleBeacon isZeus](v5, "isZeus"))
                && (v79 = -[SPInternalSimpleBeacon canBeLeashedByHost](self, "canBeLeashedByHost"),
                    v79 == -[SPInternalSimpleBeacon canBeLeashedByHost](v5, "canBeLeashedByHost"))
                && (v80 = -[SPInternalSimpleBeacon connected](self, "connected"),
                    v80 == -[SPInternalSimpleBeacon connected](v5, "connected")))
              {
                v81 = -[SPInternalSimpleBeacon internalShareType](self, "internalShareType");
                v14 = v81 == -[SPInternalSimpleBeacon internalShareType](v5, "internalShareType");
              }
              else
              {
                v14 = 0;
              }

            }
            else
            {
              v14 = 0;
            }

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

      -[SPInternalSimpleBeacon groupIdentifier](self, "groupIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        v17 = 0;
      else
        v17 = v14;
      if (v16 && v14)
      {
        -[SPInternalSimpleBeacon groupIdentifier](self, "groupIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPInternalSimpleBeacon groupIdentifier](v5, "groupIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v18, "isEqual:", v19);

      }
      -[SPInternalSimpleBeacon ownerBeaconIdentifier](self, "ownerBeaconIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        v21 = 0;
      else
        v21 = v17;
      if (v20 && v17)
      {
        -[SPInternalSimpleBeacon ownerBeaconIdentifier](self, "ownerBeaconIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPInternalSimpleBeacon ownerBeaconIdentifier](v5, "ownerBeaconIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v22, "isEqual:", v23);

      }
      -[SPInternalSimpleBeacon modelName](self, "modelName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        v25 = 0;
      else
        v25 = v21;
      if (v24 && v21)
      {
        -[SPInternalSimpleBeacon modelName](self, "modelName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPInternalSimpleBeacon modelName](v5, "modelName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v26, "isEqualToString:", v27);

      }
      -[SPInternalSimpleBeacon manufacturerName](self, "manufacturerName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
        v29 = 0;
      else
        v29 = v25;
      if (v28 && v25)
      {
        -[SPInternalSimpleBeacon manufacturerName](self, "manufacturerName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPInternalSimpleBeacon manufacturerName](v5, "manufacturerName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v30, "isEqualToString:", v31);

      }
      -[SPInternalSimpleBeacon serialNumber](self, "serialNumber");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
        v33 = 0;
      else
        v33 = v29;
      if (v32 && v29)
      {
        -[SPInternalSimpleBeacon serialNumber](self, "serialNumber");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPInternalSimpleBeacon serialNumber](v5, "serialNumber");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v34, "isEqualToString:", v35);

      }
      -[SPInternalSimpleBeacon keySyncRecord](self, "keySyncRecord");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
        v37 = 0;
      else
        v37 = v33;
      if (v36 && v33)
      {
        -[SPInternalSimpleBeacon keySyncRecord](self, "keySyncRecord");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPInternalSimpleBeacon keySyncRecord](v5, "keySyncRecord");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v38, "isEqual:", v39);

      }
      -[SPInternalSimpleBeacon lostModeInfo](self, "lostModeInfo");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
        v41 = 0;
      else
        v41 = v37;
      if (v40 && v37)
      {
        -[SPInternalSimpleBeacon lostModeInfo](self, "lostModeInfo");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPInternalSimpleBeacon lostModeInfo](v5, "lostModeInfo");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v42, "isEqual:", v43);

      }
      -[SPInternalSimpleBeacon taskInformation](self, "taskInformation");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
        v45 = 0;
      else
        v45 = v41;
      if (v44 && v41)
      {
        -[SPInternalSimpleBeacon taskInformation](self, "taskInformation");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPInternalSimpleBeacon taskInformation](v5, "taskInformation");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v46, "isEqual:", v47);

      }
      -[SPInternalSimpleBeacon owner](self, "owner");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v48)
        v49 = 0;
      else
        v49 = v45;
      if (v48 && v45)
      {
        -[SPInternalSimpleBeacon owner](self, "owner");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPInternalSimpleBeacon owner](v5, "owner");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v50, "isEqual:", v51);

      }
      -[SPInternalSimpleBeacon role](self, "role");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
        v53 = 0;
      else
        v53 = v49;
      if (v52 && v49)
      {
        -[SPInternalSimpleBeacon role](self, "role");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPInternalSimpleBeacon role](v5, "role");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v54, "isEqual:", v55);

      }
      -[SPInternalSimpleBeacon safeLocations](self, "safeLocations");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (v56)
        v57 = 0;
      else
        v57 = v53;
      if (v56 && v53)
      {
        -[SPInternalSimpleBeacon safeLocations](self, "safeLocations");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPInternalSimpleBeacon safeLocations](v5, "safeLocations");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v58, "isEqual:", v59);

      }
      -[SPInternalSimpleBeacon accessoryProductInfo](self, "accessoryProductInfo");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (v60)
        v61 = 0;
      else
        v61 = v57;
      if (v60 && v57)
      {
        -[SPInternalSimpleBeacon accessoryProductInfo](self, "accessoryProductInfo");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPInternalSimpleBeacon accessoryProductInfo](v5, "accessoryProductInfo");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v62, "isEqual:", v63);

      }
      -[SPInternalSimpleBeacon discoveryId](self, "discoveryId");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
        v15 = 0;
      else
        v15 = v61;
      if (v64 && v61)
      {
        -[SPInternalSimpleBeacon discoveryId](self, "discoveryId");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPInternalSimpleBeacon discoveryId](v5, "discoveryId");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v65, "isEqual:", v66);

      }
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _BOOL8 connectionAllowed;
  NSUInteger v7;
  unint64_t v8;
  int64_t vendorId;
  int64_t productId;
  int64_t batteryLevel;
  int64_t connectableDeviceCount;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v3 = -[NSUUID hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  v5 = v4 ^ -[NSString hash](self->_type, "hash") ^ self->_partIdentifier;
  connectionAllowed = self->_connectionAllowed;
  v7 = -[NSString hash](self->_systemVersion, "hash");
  v8 = (unint64_t)(self->_txPower * 100.0);
  vendorId = self->_vendorId;
  productId = self->_productId;
  batteryLevel = self->_batteryLevel;
  connectableDeviceCount = self->_connectableDeviceCount;
  v13 = v5 ^ connectionAllowed ^ v7 ^ vendorId ^ productId ^ batteryLevel ^ connectableDeviceCount ^ -[NSUUID hash](self->_productUUID, "hash") ^ self->_isAppleAudioAccessory ^ self->_isZeus ^ self->_canBeLeashedByHost ^ self->_connected ^ v8 ^ self->_internalShareType;
  -[SPInternalSimpleBeacon groupIdentifier](self, "groupIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SPInternalSimpleBeacon groupIdentifier](self, "groupIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 ^= objc_msgSend(v15, "hash");

  }
  -[SPInternalSimpleBeacon ownerBeaconIdentifier](self, "ownerBeaconIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SPInternalSimpleBeacon ownerBeaconIdentifier](self, "ownerBeaconIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 ^= objc_msgSend(v17, "hash");

  }
  -[SPInternalSimpleBeacon modelName](self, "modelName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[SPInternalSimpleBeacon modelName](self, "modelName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13 ^= objc_msgSend(v19, "hash");

  }
  -[SPInternalSimpleBeacon manufacturerName](self, "manufacturerName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[SPInternalSimpleBeacon manufacturerName](self, "manufacturerName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v13 ^= objc_msgSend(v21, "hash");

  }
  -[SPInternalSimpleBeacon serialNumber](self, "serialNumber");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[SPInternalSimpleBeacon serialNumber](self, "serialNumber");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v13 ^= objc_msgSend(v23, "hash");

  }
  -[SPInternalSimpleBeacon keySyncRecord](self, "keySyncRecord");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[SPInternalSimpleBeacon keySyncRecord](self, "keySyncRecord");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v13 ^= objc_msgSend(v25, "hash");

  }
  -[SPInternalSimpleBeacon lostModeInfo](self, "lostModeInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[SPInternalSimpleBeacon lostModeInfo](self, "lostModeInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v13 ^= objc_msgSend(v27, "hash");

  }
  -[SPInternalSimpleBeacon taskInformation](self, "taskInformation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[SPInternalSimpleBeacon taskInformation](self, "taskInformation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v13 ^= objc_msgSend(v29, "hash");

  }
  -[SPInternalSimpleBeacon owner](self, "owner");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[SPInternalSimpleBeacon owner](self, "owner");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v13 ^= objc_msgSend(v31, "hash");

  }
  -[SPInternalSimpleBeacon role](self, "role");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[SPInternalSimpleBeacon role](self, "role");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v13 ^= objc_msgSend(v33, "hash");

  }
  -[SPInternalSimpleBeacon safeLocations](self, "safeLocations");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[SPInternalSimpleBeacon safeLocations](self, "safeLocations");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v13 ^= objc_msgSend(v35, "hash");

  }
  -[SPInternalSimpleBeacon accessoryProductInfo](self, "accessoryProductInfo");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[SPInternalSimpleBeacon accessoryProductInfo](self, "accessoryProductInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v13 ^= objc_msgSend(v37, "hash");

  }
  -[SPInternalSimpleBeacon discoveryId](self, "discoveryId");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[SPInternalSimpleBeacon discoveryId](self, "discoveryId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v13 ^= objc_msgSend(v39, "hash");

  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v4 = (void *)objc_opt_new();
  -[SPInternalSimpleBeacon identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIdentifier:", v6);

  -[SPInternalSimpleBeacon name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setName:", v8);

  -[SPInternalSimpleBeacon type](self, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setType:", v10);

  objc_msgSend(v4, "setPartIdentifier:", -[SPInternalSimpleBeacon partIdentifier](self, "partIdentifier"));
  objc_msgSend(v4, "setConnectionAllowed:", -[SPInternalSimpleBeacon connectionAllowed](self, "connectionAllowed"));
  -[SPInternalSimpleBeacon systemVersion](self, "systemVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setSystemVersion:", v12);

  -[SPInternalSimpleBeacon txPower](self, "txPower");
  objc_msgSend(v4, "setTxPower:");
  objc_msgSend(v4, "setVendorId:", -[SPInternalSimpleBeacon vendorId](self, "vendorId"));
  objc_msgSend(v4, "setProductId:", -[SPInternalSimpleBeacon productId](self, "productId"));
  -[SPInternalSimpleBeacon productUUID](self, "productUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProductUUID:", v13);

  objc_msgSend(v4, "setBatteryLevel:", -[SPInternalSimpleBeacon batteryLevel](self, "batteryLevel"));
  objc_msgSend(v4, "setConnectableDeviceCount:", -[SPInternalSimpleBeacon connectableDeviceCount](self, "connectableDeviceCount"));
  -[SPInternalSimpleBeacon groupIdentifier](self, "groupIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v4, "setGroupIdentifier:", v15);

  -[SPInternalSimpleBeacon ownerBeaconIdentifier](self, "ownerBeaconIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v4, "setOwnerBeaconIdentifier:", v17);

  -[SPInternalSimpleBeacon modelName](self, "modelName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(v4, "setModelName:", v19);

  -[SPInternalSimpleBeacon manufacturerName](self, "manufacturerName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend(v4, "setManufacturerName:", v21);

  -[SPInternalSimpleBeacon serialNumber](self, "serialNumber");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");
  objc_msgSend(v4, "setSerialNumber:", v23);

  -[SPInternalSimpleBeacon keySyncRecord](self, "keySyncRecord");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");
  objc_msgSend(v4, "setKeySyncRecord:", v25);

  -[SPInternalSimpleBeacon lostModeInfo](self, "lostModeInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copy");
  objc_msgSend(v4, "setLostModeInfo:", v27);

  -[SPInternalSimpleBeacon taskInformation](self, "taskInformation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "copy");
  objc_msgSend(v4, "setTaskInformation:", v29);

  -[SPInternalSimpleBeacon owner](self, "owner");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "copy");
  objc_msgSend(v4, "setOwner:", v31);

  -[SPInternalSimpleBeacon role](self, "role");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v32, "copy");
  objc_msgSend(v4, "setRole:", v33);

  -[SPInternalSimpleBeacon safeLocations](self, "safeLocations");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v34, "copy");
  objc_msgSend(v4, "setSafeLocations:", v35);

  -[SPInternalSimpleBeacon accessoryProductInfo](self, "accessoryProductInfo");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "copy");
  objc_msgSend(v4, "setAccessoryProductInfo:", v37);

  objc_msgSend(v4, "setIsAppleAudioAccessory:", -[SPInternalSimpleBeacon isAppleAudioAccessory](self, "isAppleAudioAccessory"));
  objc_msgSend(v4, "setIsZeus:", -[SPInternalSimpleBeacon isZeus](self, "isZeus"));
  objc_msgSend(v4, "setCanBeLeashedByHost:", -[SPInternalSimpleBeacon canBeLeashedByHost](self, "canBeLeashedByHost"));
  objc_msgSend(v4, "setConnected:", -[SPInternalSimpleBeacon connected](self, "connected"));
  -[SPInternalSimpleBeacon discoveryId](self, "discoveryId");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v38, "copy");
  objc_msgSend(v4, "setDiscoveryId:", v39);

  objc_msgSend(v4, "setInternalShareType:", -[SPInternalSimpleBeacon internalShareType](self, "internalShareType"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_partIdentifier, CFSTR("partIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_connectionAllowed, CFSTR("connectionAllowed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemVersion, CFSTR("systemVersion"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("txPower"), self->_txPower);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("vendorId"), (double)self->_vendorId);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("productId"), (double)self->_productId);
  objc_msgSend(v5, "encodeObject:forKey:", self->_productUUID, CFSTR("productUUID"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("batteryLevel"), (double)self->_batteryLevel);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("connectableDeviceCount"), (double)self->_connectableDeviceCount);
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupIdentifier, CFSTR("groupIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerBeaconIdentifier, CFSTR("ownerBeaconIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelName, CFSTR("modelName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manufacturerName, CFSTR("manufacturerName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serialNumber, CFSTR("serialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keySyncRecord, CFSTR("keySyncRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lostModeInfo, CFSTR("lostModeInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_taskInformation, CFSTR("taskInformation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_owner, CFSTR("owner"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_role, CFSTR("role"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_safeLocations, CFSTR("safeLocations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryProductInfo, CFSTR("accessoryProductInfo"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAppleAudioAccessory, CFSTR("isAppleAudioAccessory"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isZeus, CFSTR("isZeus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canBeLeashedByHost, CFSTR("canBeLeashedByHost"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_connected, CFSTR("connected"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_discoveryId, CFSTR("discoveryId"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_internalShareType, CFSTR("internalShareType"));

}

- (SPInternalSimpleBeacon)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *identifier;
  NSString *v7;
  NSString *name;
  NSString *v9;
  NSString *type;
  NSString *v11;
  NSString *systemVersion;
  double v13;
  double v14;
  double v15;
  NSUUID *v16;
  NSUUID *productUUID;
  double v18;
  double v19;
  NSUUID *v20;
  NSUUID *groupIdentifier;
  NSUUID *v22;
  NSUUID *ownerBeaconIdentifier;
  NSString *v24;
  NSString *modelName;
  NSString *v26;
  NSString *manufacturerName;
  NSString *v28;
  NSString *serialNumber;
  SPKeySyncRecord *v30;
  SPKeySyncRecord *keySyncRecord;
  SPLostModeInfo *v32;
  SPLostModeInfo *lostModeInfo;
  uint64_t v34;
  NSDictionary *v35;
  NSDictionary *taskInformation;
  SPHandle *v37;
  SPHandle *owner;
  SPBeaconRole *v39;
  SPBeaconRole *role;
  void *v41;
  void *v42;
  void *v43;
  NSSet *v44;
  NSSet *safeLocations;
  SPDiscoveredAccessoryProductInformation *v46;
  SPDiscoveredAccessoryProductInformation *accessoryProductInfo;
  NSString *v48;
  NSString *discoveryId;
  int64_t v50;
  _QWORD v52[3];

  v52[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  self->_type = v9;

  self->_partIdentifier = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("partIdentifier"));
  self->_connectionAllowed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("connectionAllowed"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemVersion"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  systemVersion = self->_systemVersion;
  self->_systemVersion = v11;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("txPower"));
  self->_txPower = v13;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("vendorId"));
  self->_vendorId = (uint64_t)v14;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("productId"));
  self->_productId = (uint64_t)v15;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productUUID"));
  v16 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  productUUID = self->_productUUID;
  self->_productUUID = v16;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("batteryLevel"));
  self->_batteryLevel = (uint64_t)v18;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("connectableDeviceCount"));
  self->_connectableDeviceCount = (uint64_t)v19;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupIdentifier"));
  v20 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  groupIdentifier = self->_groupIdentifier;
  self->_groupIdentifier = v20;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerBeaconIdentifier"));
  v22 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  ownerBeaconIdentifier = self->_ownerBeaconIdentifier;
  self->_ownerBeaconIdentifier = v22;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelName"));
  v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  modelName = self->_modelName;
  self->_modelName = v24;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manufacturerName"));
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  manufacturerName = self->_manufacturerName;
  self->_manufacturerName = v26;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
  v28 = (NSString *)objc_claimAutoreleasedReturnValue();
  serialNumber = self->_serialNumber;
  self->_serialNumber = v28;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keySyncRecord"));
  v30 = (SPKeySyncRecord *)objc_claimAutoreleasedReturnValue();
  keySyncRecord = self->_keySyncRecord;
  self->_keySyncRecord = v30;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lostModeInfo"));
  v32 = (SPLostModeInfo *)objc_claimAutoreleasedReturnValue();
  lostModeInfo = self->_lostModeInfo;
  self->_lostModeInfo = v32;

  v34 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v34, objc_opt_class(), CFSTR("taskInformation"));
  v35 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  taskInformation = self->_taskInformation;
  self->_taskInformation = v35;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("owner"));
  v37 = (SPHandle *)objc_claimAutoreleasedReturnValue();
  owner = self->_owner;
  self->_owner = v37;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("role"));
  v39 = (SPBeaconRole *)objc_claimAutoreleasedReturnValue();
  role = self->_role;
  self->_role = v39;

  v41 = (void *)MEMORY[0x1E0C99E60];
  v52[0] = objc_opt_class();
  v52[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setWithArray:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v43, CFSTR("safeLocations"));
  v44 = (NSSet *)objc_claimAutoreleasedReturnValue();
  safeLocations = self->_safeLocations;
  self->_safeLocations = v44;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryProductInfo"));
  v46 = (SPDiscoveredAccessoryProductInformation *)objc_claimAutoreleasedReturnValue();
  accessoryProductInfo = self->_accessoryProductInfo;
  self->_accessoryProductInfo = v46;

  self->_isAppleAudioAccessory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAppleAudioAccessory"));
  self->_isZeus = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isZeus"));
  self->_canBeLeashedByHost = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canBeLeashedByHost"));
  self->_connected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("connected"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("discoveryId"));
  v48 = (NSString *)objc_claimAutoreleasedReturnValue();
  discoveryId = self->_discoveryId;
  self->_discoveryId = v48;

  v50 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("internalShareType"));
  self->_internalShareType = v50;
  return self;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[SPInternalSimpleBeacon groupIdentifier](self, "groupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  if (v3)
  {
    -[SPInternalSimpleBeacon groupIdentifier](self, "groupIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPInternalSimpleBeacon identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p (%@) %@>"), v5, self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SPInternalSimpleBeacon identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p %@>"), v5, self, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSUUID)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSUUID)ownerBeaconIdentifier
{
  return self->_ownerBeaconIdentifier;
}

- (void)setOwnerBeaconIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)partIdentifier
{
  return self->_partIdentifier;
}

- (void)setPartIdentifier:(int64_t)a3
{
  self->_partIdentifier = a3;
}

- (BOOL)connectionAllowed
{
  return self->_connectionAllowed;
}

- (void)setConnectionAllowed:(BOOL)a3
{
  self->_connectionAllowed = a3;
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)txPower
{
  return self->_txPower;
}

- (void)setTxPower:(double)a3
{
  self->_txPower = a3;
}

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (void)setProductUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)internalShareType
{
  return self->_internalShareType;
}

- (void)setInternalShareType:(int64_t)a3
{
  self->_internalShareType = a3;
}

- (int64_t)connectableDeviceCount
{
  return self->_connectableDeviceCount;
}

- (void)setConnectableDeviceCount:(int64_t)a3
{
  self->_connectableDeviceCount = a3;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (SPKeySyncRecord)keySyncRecord
{
  return self->_keySyncRecord;
}

- (void)setKeySyncRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int64_t)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(int64_t)a3
{
  self->_batteryLevel = a3;
}

- (SPLostModeInfo)lostModeInfo
{
  return self->_lostModeInfo;
}

- (void)setLostModeInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSDictionary)taskInformation
{
  return self->_taskInformation;
}

- (void)setTaskInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (SPHandle)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (SPBeaconRole)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSSet)safeLocations
{
  return self->_safeLocations;
}

- (void)setSafeLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (SPDiscoveredAccessoryProductInformation)accessoryProductInfo
{
  return self->_accessoryProductInfo;
}

- (void)setAccessoryProductInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (int64_t)vendorId
{
  return self->_vendorId;
}

- (void)setVendorId:(int64_t)a3
{
  self->_vendorId = a3;
}

- (int64_t)productId
{
  return self->_productId;
}

- (void)setProductId:(int64_t)a3
{
  self->_productId = a3;
}

- (BOOL)isAppleAudioAccessory
{
  return self->_isAppleAudioAccessory;
}

- (void)setIsAppleAudioAccessory:(BOOL)a3
{
  self->_isAppleAudioAccessory = a3;
}

- (BOOL)isZeus
{
  return self->_isZeus;
}

- (void)setIsZeus:(BOOL)a3
{
  self->_isZeus = a3;
}

- (BOOL)canBeLeashedByHost
{
  return self->_canBeLeashedByHost;
}

- (void)setCanBeLeashedByHost:(BOOL)a3
{
  self->_canBeLeashedByHost = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (NSString)discoveryId
{
  return self->_discoveryId;
}

- (void)setDiscoveryId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryId, 0);
  objc_storeStrong((id *)&self->_accessoryProductInfo, 0);
  objc_storeStrong((id *)&self->_safeLocations, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_taskInformation, 0);
  objc_storeStrong((id *)&self->_lostModeInfo, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_keySyncRecord, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_ownerBeaconIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
