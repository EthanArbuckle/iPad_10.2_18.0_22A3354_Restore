@implementation TSDgPTPUnicastLinkLayerPtPPort

- (TSDgPTPUnicastLinkLayerPtPPort)initWithService:(id)a3 pid:(int)a4
{
  TSDgPTPUnicastLinkLayerPtPPort *v4;
  TSDgPTPUnicastLinkLayerPtPPort *v5;
  uint64_t v6;
  NSData *destinationMACAddress;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDgPTPUnicastLinkLayerPtPPort;
  v4 = -[TSDgPTPFDPtPPort initWithService:pid:](&v9, "initWithService:pid:", a3, *(_QWORD *)&a4);
  v5 = v4;
  if (v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[TSDgPTPUnicastLinkLayerPtPPort _destinationMACAddress](v4, "_destinationMACAddress"));
    destinationMACAddress = v5->_destinationMACAddress;
    v5->_destinationMACAddress = (NSData *)v6;

  }
  return v5;
}

- (id)_sourceAddressString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSDgPTPUnicastLinkLayerPtPPort;
  v3 = -[TSDgPTPNetworkPort _sourceAddressString](&v10, "_sourceAddressString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iodPropertyForKey:", CFSTR("SourceMACAddress")));

  if (v6)
  {
    v7 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx"), *v7, v7[1], v7[2], v7[3], v7[4], v7[5]));

    v4 = (void *)v8;
  }

  return v4;
}

- (id)_destinationAddressString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSDgPTPUnicastLinkLayerPtPPort;
  v3 = -[TSDgPTPNetworkPort _destinationAddressString](&v10, "_destinationAddressString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iodPropertyForKey:", CFSTR("DestinationMACAddress")));

  if (v6)
  {
    v7 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx"), *v7, v7[1], v7[2], v7[3], v7[4], v7[5]));

    v4 = (void *)v8;
  }

  return v4;
}

- (id)_destinationMACAddress
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("DestinationMACAddress")));

  return v3;
}

- (int)portType
{
  return 2;
}

- (id)propertiesForXPC
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSDgPTPUnicastLinkLayerPtPPort;
  v3 = -[TSDgPTPNetworkPort propertiesForXPC](&v10, "propertiesForXPC");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iodPropertyForKey:", CFSTR("SourceMACAddress")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("SourceMACAddress"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "iodPropertyForKey:", CFSTR("DestinationMACAddress")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("DestinationMACAddress"));

  return v4;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 *v10;
  void *v11;
  void *v12;
  unsigned __int8 *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___TSDgPTPUnicastLinkLayerPtPPort;
  v5 = objc_msgSendSuper2(&v16, "diagnosticInfoForService:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("PortType"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iodPropertyForKey:", CFSTR("SourceMACAddress")));
  v9 = v8;
  if (v8)
  {
    v10 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx"), *v10, v10[1], v10[2], v10[3], v10[4], v10[5]));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("SourceAddress"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iodPropertyForKey:", CFSTR("DestinationMACAddress")));

  if (v12)
  {
    v13 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx"), *v13, v13[1], v13[2], v13[3], v13[4], v13[5]));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("DestinationAddress"));

  }
  return v6;
}

- (NSData)destinationMACAddress
{
  return self->_destinationMACAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationMACAddress, 0);
}

@end
