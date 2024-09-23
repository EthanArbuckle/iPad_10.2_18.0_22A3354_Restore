@implementation TSDgPTPEthernetPort

- (TSDgPTPEthernetPort)initWithService:(id)a3 pid:(int)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDgPTPEthernetPort;
  return -[TSDgPTPFDPtPPort initWithService:pid:](&v5, "initWithService:pid:", a3, *(_QWORD *)&a4);
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
  v10.super_class = (Class)TSDgPTPEthernetPort;
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
  return CFSTR("01:80:c2:00:00:0e");
}

- (int)portType
{
  return 1;
}

- (id)propertiesForXPC
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDgPTPEthernetPort;
  v3 = -[TSDgPTPNetworkPort propertiesForXPC](&v8, "propertiesForXPC");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iodPropertyForKey:", CFSTR("SourceMACAddress")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("SourceMACAddress"));

  return v4;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 *v8;
  void *v9;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___TSDgPTPEthernetPort;
  v3 = a3;
  v4 = objc_msgSendSuper2(&v11, "diagnosticInfoForService:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("PortType"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iodPropertyForKey:", CFSTR("SourceMACAddress")));
  if (v7)
  {
    v8 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx"), *v8, v8[1], v8[2], v8[3], v8[4], v8[5], v11.receiver, v11.super_class));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("SourceAddress"));

  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("01:80:c2:00:00:0e"), CFSTR("DestinationAddress"));

  return v5;
}

@end
