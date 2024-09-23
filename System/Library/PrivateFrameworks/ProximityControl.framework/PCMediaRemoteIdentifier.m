@implementation PCMediaRemoteIdentifier

- (id)description
{
  void *v2;
  NSString *mediaRemoteID;
  int64_t v4;
  __CFString *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  mediaRemoteID = self->_mediaRemoteID;
  v4 = -[PCDeviceIdentifier assetType](self, "assetType");
  if ((unint64_t)(v4 - 1) >= 8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_24CCF65F0[v4 - 1];
  }
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<mrID=%@, type=%@>"), mediaRemoteID, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_mediaRemoteID, "hash");
}

- (PCMediaRemoteIdentifier)initWithIdentifier:(id)a3
{
  id v5;
  PCMediaRemoteIdentifier *v6;
  PCMediaRemoteIdentifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PCMediaRemoteIdentifier;
  v6 = -[PCDeviceIdentifier initWithDeviceName:](&v9, sel_initWithDeviceName_, CFSTR("HomePod"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaRemoteID, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSString *mediaRemoteID;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  int v11;
  BOOL v12;
  uint64_t v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "mediaRemoteID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    mediaRemoteID = self->_mediaRemoteID;
    v8 = v6;
    v9 = mediaRemoteID;
    if (v8 == v9)
    {

    }
    else
    {
      v10 = v9;
      if ((v8 == 0) == (v9 != 0))
      {

LABEL_10:
        v12 = 0;
        goto LABEL_11;
      }
      v11 = -[NSString isEqual:](v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_10;
    }
    v13 = objc_msgSend(v5, "assetType");
    v12 = v13 == -[PCDeviceIdentifier assetType](self, "assetType");
LABEL_11:

    goto LABEL_12;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *mediaRemoteID;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PCMediaRemoteIdentifier;
  -[PCDeviceIdentifier encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  mediaRemoteID = self->_mediaRemoteID;
  if (mediaRemoteID)
    objc_msgSend(v4, "encodeObject:forKey:", mediaRemoteID, CFSTR("mrid"));

}

- (PCMediaRemoteIdentifier)initWithCoder:(id)a3
{
  id v4;
  PCMediaRemoteIdentifier *v5;
  PCMediaRemoteIdentifier *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PCMediaRemoteIdentifier;
  v5 = -[PCDeviceIdentifier initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v6 = v5;
  }

  return v5;
}

- (NSString)mediaRemoteID
{
  return self->_mediaRemoteID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteID, 0);
}

@end
