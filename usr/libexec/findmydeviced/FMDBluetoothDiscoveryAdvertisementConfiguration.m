@implementation FMDBluetoothDiscoveryAdvertisementConfiguration

- (FMDBluetoothDiscoveryAdvertisementConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDBluetoothDiscoveryAdvertisementConfiguration *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSString *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSString *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSString *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSString *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  NSString *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  NSString *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  NSString *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  NSString *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  NSString *v73;
  void *v74;
  void *v75;
  objc_super v77;

  v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)FMDBluetoothDiscoveryAdvertisementConfiguration;
  v6 = -[FMDBluetoothDiscoveryAdvertisementConfiguration init](&v77, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSNumber, v5);
    v8 = NSStringFromSelector("primary");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v9));
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setPrimary:](v6, "setPrimary:", objc_msgSend(v10, "BOOLValue"));

    v12 = objc_opt_class(NSNumber, v11);
    v13 = NSStringFromSelector("utpConnected");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v14));
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setUtpConnected:](v6, "setUtpConnected:", objc_msgSend(v15, "BOOLValue"));

    v17 = objc_opt_class(NSString, v16);
    v18 = NSStringFromSelector("name");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v19));
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setName:](v6, "setName:", v20);

    v22 = objc_opt_class(NSNumber, v21);
    v23 = NSStringFromSelector("rssi");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v24));
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setRssi:](v6, "setRssi:", v25);

    v27 = objc_opt_class(NSString, v26);
    v28 = NSStringFromSelector("address");
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v29));
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setAddress:](v6, "setAddress:", v30);

    v32 = objc_opt_class(NSNumber, v31);
    v33 = NSStringFromSelector("colorCode");
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v32, v34));
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setColorCode:](v6, "setColorCode:", v35);

    v37 = objc_opt_class(FMDBLEBeaconIdentifier, v36);
    v38 = NSStringFromSelector("beaconIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v37, v39));
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setBeaconIdentifier:](v6, "setBeaconIdentifier:", v40);

    v42 = objc_opt_class(NSNumber, v41);
    v43 = NSStringFromSelector("inCaseStatus");
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v42, v44));
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setInCaseStatus:](v6, "setInCaseStatus:", objc_msgSend(v45, "unsignedIntegerValue"));

    v47 = objc_opt_class(NSNumber, v46);
    v48 = NSStringFromSelector("inEarStatus");
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v47, v49));
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setInEarStatus:](v6, "setInEarStatus:", objc_msgSend(v50, "unsignedIntegerValue"));

    v52 = objc_opt_class(NSNumber, v51);
    v53 = NSStringFromSelector("availability");
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v52, v54));
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setAvailability:](v6, "setAvailability:", objc_msgSend(v55, "unsignedIntegerValue"));

    v57 = objc_opt_class(NSNumber, v56);
    v58 = NSStringFromSelector("lidClosedStatus");
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v57, v59));
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setLidClosedStatus:](v6, "setLidClosedStatus:", objc_msgSend(v60, "unsignedIntegerValue"));

    v62 = objc_opt_class(NSNumber, v61);
    v63 = NSStringFromSelector("audioStateStatus");
    v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v62, v64));
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setAudioStateStatus:](v6, "setAudioStateStatus:", objc_msgSend(v65, "unsignedIntegerValue"));

    v67 = objc_opt_class(NSNumber, v66);
    v68 = NSStringFromSelector("onHeadStatus");
    v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v67, v69));
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setOnHeadStatus:](v6, "setOnHeadStatus:", objc_msgSend(v70, "unsignedIntegerValue"));

    v72 = objc_opt_class(FMDAccessoryStyleDescriptor, v71);
    v73 = NSStringFromSelector("styleDescriptor");
    v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v72, v74));
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setStyleDescriptor:](v6, "setStyleDescriptor:", v75);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  NSString *v24;
  void *v25;
  void *v26;
  NSString *v27;
  void *v28;
  void *v29;
  NSString *v30;
  void *v31;
  void *v32;
  NSString *v33;
  void *v34;
  void *v35;
  NSString *v36;
  void *v37;
  void *v38;
  NSString *v39;
  void *v40;
  void *v41;
  NSString *v42;
  void *v43;
  NSString *v44;
  void *v45;
  id v46;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDBluetoothDiscoveryAdvertisementConfiguration primary](self, "primary")));
  v6 = NSStringFromSelector("primary");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "encodeObject:forKey:", v5, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDBluetoothDiscoveryAdvertisementConfiguration utpConnected](self, "utpConnected")));
  v9 = NSStringFromSelector("utpConnected");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v4, "encodeObject:forKey:", v8, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryAdvertisementConfiguration name](self, "name"));
  v12 = NSStringFromSelector("name");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v4, "encodeObject:forKey:", v11, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryAdvertisementConfiguration rssi](self, "rssi"));
  v15 = NSStringFromSelector("rssi");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v4, "encodeObject:forKey:", v14, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryAdvertisementConfiguration address](self, "address"));
  v18 = NSStringFromSelector("address");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v4, "encodeObject:forKey:", v17, v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryAdvertisementConfiguration colorCode](self, "colorCode"));
  v21 = NSStringFromSelector("colorCode");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v4, "encodeObject:forKey:", v20, v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryAdvertisementConfiguration beaconIdentifier](self, "beaconIdentifier"));
  v24 = NSStringFromSelector("beaconIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  objc_msgSend(v4, "encodeObject:forKey:", v23, v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDBluetoothDiscoveryAdvertisementConfiguration inCaseStatus](self, "inCaseStatus")));
  v27 = NSStringFromSelector("inCaseStatus");
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  objc_msgSend(v4, "encodeObject:forKey:", v26, v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDBluetoothDiscoveryAdvertisementConfiguration inEarStatus](self, "inEarStatus")));
  v30 = NSStringFromSelector("inEarStatus");
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  objc_msgSend(v4, "encodeObject:forKey:", v29, v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDBluetoothDiscoveryAdvertisementConfiguration availability](self, "availability")));
  v33 = NSStringFromSelector("availability");
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  objc_msgSend(v4, "encodeObject:forKey:", v32, v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDBluetoothDiscoveryAdvertisementConfiguration lidClosedStatus](self, "lidClosedStatus")));
  v36 = NSStringFromSelector("lidClosedStatus");
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  objc_msgSend(v4, "encodeObject:forKey:", v35, v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDBluetoothDiscoveryAdvertisementConfiguration audioStateStatus](self, "audioStateStatus")));
  v39 = NSStringFromSelector("audioStateStatus");
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  objc_msgSend(v4, "encodeObject:forKey:", v38, v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDBluetoothDiscoveryAdvertisementConfiguration onHeadStatus](self, "onHeadStatus")));
  v42 = NSStringFromSelector("onHeadStatus");
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  objc_msgSend(v4, "encodeObject:forKey:", v41, v43);

  v46 = (id)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryAdvertisementConfiguration styleDescriptor](self, "styleDescriptor"));
  v44 = NSStringFromSelector("styleDescriptor");
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  objc_msgSend(v4, "encodeObject:forKey:", v46, v45);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)primary
{
  return self->_primary;
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (BOOL)utpConnected
{
  return self->_utpConnected;
}

- (void)setUtpConnected:(BOOL)a3
{
  self->_utpConnected = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setRssi:(id)a3
{
  objc_storeStrong((id *)&self->_rssi, a3);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (NSNumber)colorCode
{
  return self->_colorCode;
}

- (void)setColorCode:(id)a3
{
  objc_storeStrong((id *)&self->_colorCode, a3);
}

- (FMDBLEBeaconIdentifier)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (void)setBeaconIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_beaconIdentifier, a3);
}

- (unint64_t)inCaseStatus
{
  return self->_inCaseStatus;
}

- (void)setInCaseStatus:(unint64_t)a3
{
  self->_inCaseStatus = a3;
}

- (unint64_t)inEarStatus
{
  return self->_inEarStatus;
}

- (void)setInEarStatus:(unint64_t)a3
{
  self->_inEarStatus = a3;
}

- (unint64_t)availability
{
  return self->_availability;
}

- (void)setAvailability:(unint64_t)a3
{
  self->_availability = a3;
}

- (unint64_t)lidClosedStatus
{
  return self->_lidClosedStatus;
}

- (void)setLidClosedStatus:(unint64_t)a3
{
  self->_lidClosedStatus = a3;
}

- (unint64_t)audioStateStatus
{
  return self->_audioStateStatus;
}

- (void)setAudioStateStatus:(unint64_t)a3
{
  self->_audioStateStatus = a3;
}

- (unint64_t)onHeadStatus
{
  return self->_onHeadStatus;
}

- (void)setOnHeadStatus:(unint64_t)a3
{
  self->_onHeadStatus = a3;
}

- (FMDAccessoryStyleDescriptor)styleDescriptor
{
  return self->_styleDescriptor;
}

- (void)setStyleDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_styleDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleDescriptor, 0);
  objc_storeStrong((id *)&self->_beaconIdentifier, 0);
  objc_storeStrong((id *)&self->_colorCode, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
