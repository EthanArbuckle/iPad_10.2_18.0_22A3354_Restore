@implementation PKDeviceSharingCapabilities

+ (id)deviceSharingCapbilitesRequestWithProtobuf:(id)a3
{
  id v3;
  PKDeviceSharingCapabilities *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = objc_alloc_init(PKDeviceSharingCapabilities);
  objc_msgSend(v3, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDeviceSharingCapabilities setHandle:](v4, "setHandle:", v5);

  objc_msgSend(v3, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDeviceSharingCapabilities setAltDSID:](v4, "setAltDSID:", v6);

  objc_msgSend(v3, "deviceRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDeviceSharingCapabilities setDeviceRegion:](v4, "setDeviceRegion:", v7);

  -[PKDeviceSharingCapabilities setSupportsManatee:](v4, "setSupportsManatee:", objc_msgSend(v3, "supportsManatee"));
  objc_msgSend(v3, "fromDeviceVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3710];
    v10 = objc_opt_class();
    objc_msgSend(v3, "fromDeviceVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unarchivedObjectOfClass:fromData:error:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDeviceSharingCapabilities setFromDeviceVersion:](v4, "setFromDeviceVersion:", v12);

  }
  return v4;
}

- (id)protobuf
{
  PKProtobufDeviceSharingCapabilities *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(PKProtobufDeviceSharingCapabilities);
  -[PKDeviceSharingCapabilities handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufDeviceSharingCapabilities setHandle:](v3, "setHandle:", v4);

  -[PKDeviceSharingCapabilities altDSID](self, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufDeviceSharingCapabilities setAltDSID:](v3, "setAltDSID:", v5);

  -[PKDeviceSharingCapabilities deviceRegion](self, "deviceRegion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufDeviceSharingCapabilities setDeviceRegion:](v3, "setDeviceRegion:", v6);

  -[PKProtobufDeviceSharingCapabilities setSupportsManatee:](v3, "setSupportsManatee:", -[PKDeviceSharingCapabilities supportsManatee](self, "supportsManatee"));
  -[PKDeviceSharingCapabilities fromDeviceVersion](self, "fromDeviceVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB36F8];
    -[PKDeviceSharingCapabilities fromDeviceVersion](self, "fromDeviceVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufDeviceSharingCapabilities setFromDeviceVersion:](v3, "setFromDeviceVersion:", v10);

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDeviceSharingCapabilities)initWithCoder:(id)a3
{
  id v4;
  PKDeviceSharingCapabilities *v5;
  uint64_t v6;
  NSString *handle;
  uint64_t v8;
  NSString *altDSID;
  uint64_t v10;
  NSString *deviceRegion;
  uint64_t v12;
  PKOSVersionRequirement *fromDeviceVersion;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKDeviceSharingCapabilities;
  v5 = -[PKDeviceSharingCapabilities init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
    v6 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;

    v5->_supportsManatee = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsManatee"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceRegion"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceRegion = v5->_deviceRegion;
    v5->_deviceRegion = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fromDeviceVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    fromDeviceVersion = v5->_fromDeviceVersion;
    v5->_fromDeviceVersion = (PKOSVersionRequirement *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *handle;
  id v5;

  handle = self->_handle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", handle, CFSTR("handle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("altDSID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsManatee, CFSTR("supportsManatee"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceRegion, CFSTR("deviceRegion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fromDeviceVersion, CFSTR("fromDeviceVersion"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_handle);
  objc_msgSend(v3, "safelyAddObject:", self->_altDSID);
  objc_msgSend(v3, "safelyAddObject:", self->_deviceRegion);
  objc_msgSend(v3, "safelyAddObject:", self->_fromDeviceVersion);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_supportsManatee - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  unsigned __int8 *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  _BOOL4 v12;
  void *v13;
  NSString *v14;
  _BOOL4 v15;
  void *v16;
  NSString *v17;
  _BOOL4 v18;
  BOOL v19;
  PKOSVersionRequirement *fromDeviceVersion;
  PKOSVersionRequirement *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = (unsigned __int8 *)v6;
  if (!v6)
    goto LABEL_23;
  v8 = (void *)v6[2];
  v9 = self->_handle;
  v10 = v8;
  if (v9 == v10)
  {

  }
  else
  {
    v11 = v10;
    if (!v9 || !v10)
      goto LABEL_22;
    v12 = -[NSString isEqualToString:](v9, "isEqualToString:", v10);

    if (!v12)
      goto LABEL_23;
  }
  v13 = (void *)*((_QWORD *)v7 + 3);
  v9 = self->_altDSID;
  v14 = v13;
  if (v9 == v14)
  {

  }
  else
  {
    v11 = v14;
    if (!v9 || !v14)
      goto LABEL_22;
    v15 = -[NSString isEqualToString:](v9, "isEqualToString:", v14);

    if (!v15)
      goto LABEL_23;
  }
  v16 = (void *)*((_QWORD *)v7 + 4);
  v9 = self->_deviceRegion;
  v17 = v16;
  if (v9 != v17)
  {
    v11 = v17;
    if (v9 && v17)
    {
      v18 = -[NSString isEqualToString:](v9, "isEqualToString:", v17);

      if (!v18)
        goto LABEL_23;
      goto LABEL_26;
    }
LABEL_22:

    goto LABEL_23;
  }

LABEL_26:
  fromDeviceVersion = self->_fromDeviceVersion;
  v22 = (PKOSVersionRequirement *)*((_QWORD *)v7 + 5);
  if (fromDeviceVersion && v22)
  {
    if (-[PKOSVersionRequirement isEqual:](fromDeviceVersion, "isEqual:"))
      goto LABEL_31;
  }
  else if (fromDeviceVersion == v22)
  {
LABEL_31:
    v19 = self->_supportsManatee == v7[8];
    goto LABEL_24;
  }
LABEL_23:
  v19 = 0;
LABEL_24:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_handle, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_deviceRegion, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[PKOSVersionRequirement copyWithZone:](self->_fromDeviceVersion, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  *(_BYTE *)(v5 + 8) = self->_supportsManatee;
  return (id)v5;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("handle: '%@'; "), self->_handle);
  objc_msgSend(v3, "appendFormat:", CFSTR("altDSID: '%@'; "), self->_altDSID);
  objc_msgSend(v3, "appendFormat:", CFSTR("deviceRegion: '%@'; "), self->_deviceRegion);
  if (self->_supportsManatee)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("supportsManatee: '%@'; "), v4);
  -[PKOSVersionRequirement asDictionary](self->_fromDeviceVersion, "asDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("fromDeviceVersion: '%@'; "), v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)deviceRegion
{
  return self->_deviceRegion;
}

- (void)setDeviceRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)supportsManatee
{
  return self->_supportsManatee;
}

- (void)setSupportsManatee:(BOOL)a3
{
  self->_supportsManatee = a3;
}

- (PKOSVersionRequirement)fromDeviceVersion
{
  return self->_fromDeviceVersion;
}

- (void)setFromDeviceVersion:(id)a3
{
  objc_storeStrong((id *)&self->_fromDeviceVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromDeviceVersion, 0);
  objc_storeStrong((id *)&self->_deviceRegion, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
