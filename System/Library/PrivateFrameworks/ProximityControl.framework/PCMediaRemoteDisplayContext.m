@implementation PCMediaRemoteDisplayContext

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *mediaRemoteID;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  int v11;
  char v12;
  MRNowPlayingPlayerResponse *proxDeviceState;
  void *v14;
  NSString *v15;
  int v16;
  MRNowPlayingPlayerResponse *selectedDeviceState;
  void *v18;
  NSString *v19;
  objc_super v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v21.receiver = self;
    v21.super_class = (Class)PCMediaRemoteDisplayContext;
    if (!-[PCDisplayContext isEqual:](&v21, sel_isEqual_, v5))
    {
LABEL_12:
      v12 = 0;
LABEL_19:

      goto LABEL_20;
    }
    mediaRemoteID = self->_mediaRemoteID;
    objc_msgSend(v5, "mediaRemoteID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = mediaRemoteID;
    v9 = v7;
    if (v8 == v9)
    {

    }
    else
    {
      v10 = v9;
      if ((v8 == 0) == (v9 != 0))
        goto LABEL_17;
      v11 = -[NSString isEqual:](v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_12;
    }
    proxDeviceState = self->_proxDeviceState;
    objc_msgSend(v5, "proxDeviceState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = proxDeviceState;
    v15 = v14;
    if (v8 == v15)
    {

    }
    else
    {
      v10 = v15;
      if ((v8 == 0) == (v15 != 0))
        goto LABEL_17;
      v16 = -[NSString isEqual:](v8, "isEqual:", v15);

      if (!v16)
        goto LABEL_12;
    }
    selectedDeviceState = self->_selectedDeviceState;
    objc_msgSend(v5, "selectedDeviceState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = selectedDeviceState;
    v19 = v18;
    v10 = v19;
    if (v8 == v19)
    {
      v12 = 1;
      goto LABEL_18;
    }
    if ((v8 == 0) != (v19 != 0))
    {
      v12 = -[NSString isEqual:](v8, "isEqual:", v19);
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  v12 = 0;
LABEL_20:

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
  v6.super_class = (Class)PCMediaRemoteDisplayContext;
  -[PCDisplayContext encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  mediaRemoteID = self->_mediaRemoteID;
  if (mediaRemoteID)
    objc_msgSend(v4, "encodeObject:forKey:", mediaRemoteID, CFSTR("mrID"));

}

- (PCMediaRemoteDisplayContext)initWithCoder:(id)a3
{
  id v4;
  PCMediaRemoteDisplayContext *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PCMediaRemoteDisplayContext;
  v5 = -[PCDisplayContext initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

  }
  return v5;
}

- (id)userActivityInfo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[PCMediaRemoteDisplayContext proxDeviceState](self, "proxDeviceState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "playbackQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "contentItemWithOffset:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = objc_msgSend(v5, "playbackState");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("playbackState"));

        objc_msgSend(v8, "artwork");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "imageData");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("artworkKey"));

        }
        objc_msgSend(v8, "metadata");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "userInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("metadataKey"));

        objc_msgSend(v5, "playerPath");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "client");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("bundleIdentifierKey"));

        v19 = (void *)objc_msgSend(v3, "copy");
      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSString)mediaRemoteID
{
  return self->_mediaRemoteID;
}

- (void)setMediaRemoteID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (MRNowPlayingPlayerResponse)proxDeviceState
{
  return self->_proxDeviceState;
}

- (void)setProxDeviceState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (MRNowPlayingPlayerResponse)selectedDeviceState
{
  return self->_selectedDeviceState;
}

- (void)setSelectedDeviceState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (MRNowPlayingPlayerResponse)localDeviceState
{
  return self->_localDeviceState;
}

- (void)setLocalDeviceState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceState, 0);
  objc_storeStrong((id *)&self->_selectedDeviceState, 0);
  objc_storeStrong((id *)&self->_proxDeviceState, 0);
  objc_storeStrong((id *)&self->_mediaRemoteID, 0);
}

@end
