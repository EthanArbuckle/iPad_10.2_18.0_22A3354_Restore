@implementation PCHomeKitIdentifier

- (id)description
{
  void *v3;
  NSUUID *accessoryID;
  NSUUID *homeID;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  accessoryID = self->_accessoryID;
  homeID = self->_homeID;
  v6 = -[PCDeviceIdentifier assetType](self, "assetType");
  if ((unint64_t)(v6 - 1) >= 8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = *(&off_24CCF6898 + v6 - 1);
  }
  -[PCDeviceIdentifier deviceName](self, "deviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<acsID=%@, homeID=%@, type=%@ name=%@>"), accessoryID, homeID, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSUUID hash](self->_accessoryID, "hash");
  return -[NSUUID hash](self->_homeID, "hash") ^ v3;
}

- (PCHomeKitIdentifier)initWithAccessoryID:(id)a3 homeID:(id)a4
{
  id v7;
  id v8;
  PCHomeKitIdentifier *v9;
  PCHomeKitIdentifier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PCHomeKitIdentifier;
  v9 = -[PCDeviceIdentifier initWithDeviceName:](&v12, sel_initWithDeviceName_, CFSTR("HomePod"));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryID, a3);
    objc_storeStrong((id *)&v10->_homeID, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSUUID *accessoryID;
  NSUUID *v8;
  NSUUID *v9;
  NSUUID *v10;
  int v11;
  BOOL v12;
  void *v13;
  NSUUID *homeID;
  NSUUID *v15;
  int v16;
  uint64_t v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "accessoryID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    accessoryID = self->_accessoryID;
    v8 = v6;
    v9 = accessoryID;
    if (v8 == v9)
    {

    }
    else
    {
      v10 = v9;
      if ((v8 == 0) == (v9 != 0))
        goto LABEL_12;
      v11 = -[NSUUID isEqual:](v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_13;
    }
    objc_msgSend(v5, "homeID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    homeID = self->_homeID;
    v8 = v13;
    v15 = homeID;
    if (v8 == v15)
    {

LABEL_15:
      v17 = objc_msgSend(v5, "assetType");
      v12 = v17 == -[PCDeviceIdentifier assetType](self, "assetType");
      goto LABEL_16;
    }
    v10 = v15;
    if ((v8 == 0) != (v15 != 0))
    {
      v16 = -[NSUUID isEqual:](v8, "isEqual:", v15);

      if (v16)
        goto LABEL_15;
LABEL_13:
      v12 = 0;
LABEL_16:

      goto LABEL_17;
    }
LABEL_12:

    goto LABEL_13;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSUUID *accessoryID;
  NSUUID *homeID;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PCHomeKitIdentifier;
  -[PCDeviceIdentifier encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  accessoryID = self->_accessoryID;
  if (accessoryID)
    objc_msgSend(v4, "encodeObject:forKey:", accessoryID, CFSTR("aid"));
  homeID = self->_homeID;
  if (homeID)
    objc_msgSend(v4, "encodeObject:forKey:", homeID, CFSTR("hid"));

}

- (PCHomeKitIdentifier)initWithCoder:(id)a3
{
  id v4;
  PCHomeKitIdentifier *v5;
  PCHomeKitIdentifier *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PCHomeKitIdentifier;
  v5 = -[PCDeviceIdentifier initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v6 = v5;
  }

  return v5;
}

- (NSUUID)accessoryID
{
  return self->_accessoryID;
}

- (NSUUID)homeID
{
  return self->_homeID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeID, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
}

@end
