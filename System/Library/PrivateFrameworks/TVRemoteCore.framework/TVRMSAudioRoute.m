@implementation TVRMSAudioRoute

- (TVRMSAudioRoute)initWithProtobuf:(id)a3
{
  id v4;
  TVRMSAudioRoute *v5;
  uint64_t v6;
  NSString *displayName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRMSAudioRoute;
  v5 = -[TVRMSAudioRoute init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "displayName");
    v6 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    v5->_macAddress = objc_msgSend(v4, "macAddress");
    v5->_supportsVideo = objc_msgSend(v4, "supportsVideo");
    v5->_selected = objc_msgSend(v4, "selected");
  }

  return v5;
}

- (id)protobuf
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDisplayName:", self->_displayName);
  objc_msgSend(v3, "setMacAddress:", self->_macAddress);
  objc_msgSend(v3, "setSupportsVideo:", self->_supportsVideo);
  objc_msgSend(v3, "setSelected:", self->_selected);
  return v3;
}

- (BOOL)isEqualToAudioRoute:(id)a3
{
  id v4;
  void *v5;
  unint64_t macAddress;
  int selected;
  NSString *displayName;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = v4;
  if (v4
    && (macAddress = self->_macAddress, macAddress == objc_msgSend(v4, "macAddress"))
    && (selected = self->_selected, selected == objc_msgSend(v5, "isSelected")))
  {
    displayName = self->_displayName;
    objc_msgSend(v5, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSString isEqualToString:](displayName, "isEqualToString:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)audioRoutesFromProtobufs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  TVRMSAudioRoute *v11;
  TVRMSAudioRoute *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [TVRMSAudioRoute alloc];
        v12 = -[TVRMSAudioRoute initWithProtobuf:](v11, "initWithProtobuf:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)protobufsFromAudioRoutes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "protobuf", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (unint64_t)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(unint64_t)a3
{
  self->_macAddress = a3;
}

- (BOOL)supportsVideo
{
  return self->_supportsVideo;
}

- (void)setSupportsVideo:(BOOL)a3
{
  self->_supportsVideo = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
