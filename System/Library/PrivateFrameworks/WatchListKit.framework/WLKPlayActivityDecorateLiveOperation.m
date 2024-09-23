@implementation WLKPlayActivityDecorateLiveOperation

- (WLKPlayActivityDecorateLiveOperation)initWithChannelID:(id)a3 serviceID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  WLKPlayActivityDecorateLiveOperation *v11;
  uint64_t v12;
  NSString *channelID;
  uint64_t v14;
  NSString *serviceID;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    -[WLKPlayActivityDecorateLiveOperation initWithChannelID:serviceID:].cold.1();
  v8 = v7;
  if (!v7)
    -[WLKPlayActivityDecorateLiveOperation initWithChannelID:serviceID:].cold.2();
  v18[0] = CFSTR("brandId");
  v18[1] = CFSTR("externalServiceId");
  v19[0] = v6;
  v19[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:apiVersion:options:", CFSTR("contents/play-metadata/live"), v9, 0, 0, 0, 0, &unk_1E68C98A8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17.receiver = self;
  v17.super_class = (Class)WLKPlayActivityDecorateLiveOperation;
  v11 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v17, sel_initWithRequestProperties_, v10);
  if (v11)
  {
    v12 = objc_msgSend(v6, "copy");
    channelID = v11->_channelID;
    v11->_channelID = (NSString *)v12;

    v14 = objc_msgSend(v8, "copy");
    serviceID = v11->_serviceID;
    v11->_serviceID = (NSString *)v14;

  }
  return v11;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
}

- (void)initWithChannelID:serviceID:.cold.1()
{
  __assert_rtn("-[WLKPlayActivityDecorateLiveOperation initWithChannelID:serviceID:]", "WLKPlayActivityDecorateLiveOperation.m", 27, "channelID != nil");
}

- (void)initWithChannelID:serviceID:.cold.2()
{
  __assert_rtn("-[WLKPlayActivityDecorateLiveOperation initWithChannelID:serviceID:]", "WLKPlayActivityDecorateLiveOperation.m", 28, "serviceID != nil");
}

@end
