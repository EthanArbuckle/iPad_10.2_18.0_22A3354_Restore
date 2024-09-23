@implementation TSDgPTPUnicastUDPv6PtPPort

+ (id)iokitMatchingDictionaryForInterfaceName:(id)a3 andIPv6Address:(char *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];
  _QWORD v19[3];

  v19[0] = CFSTR("IOTimeSyncUnicastUDPv6PtPPort");
  v18[0] = CFSTR("IOProviderClass");
  v18[1] = CFSTR("IOParentMatch");
  v15 = a3;
  v16[0] = CFSTR("IOProviderClass");
  v16[1] = CFSTR("IOPropertyMatch");
  v17[0] = CFSTR("IOTimeSyncInterfaceAdapter");
  v14 = CFSTR("InterfaceName");
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  v17[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
  v19[1] = v7;
  v18[2] = CFSTR("IOPropertyMatch");
  v12 = CFSTR("DestinationIPAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a4, 16));
  v13 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  v19[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 3));

  return v10;
}

- (TSDgPTPUnicastUDPv6PtPPort)initWithService:(id)a3 pid:(int)a4
{
  TSDgPTPUnicastUDPv6PtPPort *v4;
  TSDgPTPUnicastUDPv6PtPPort *v5;
  uint64_t v6;
  NSData *destinationIPv6Address;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDgPTPUnicastUDPv6PtPPort;
  v4 = -[TSDgPTPFDPtPPort initWithService:pid:](&v9, "initWithService:pid:", a3, *(_QWORD *)&a4);
  v5 = v4;
  if (v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[TSDgPTPUnicastUDPv6PtPPort _destinationIPv6Address](v4, "_destinationIPv6Address"));
    destinationIPv6Address = v5->_destinationIPv6Address;
    v5->_destinationIPv6Address = (NSData *)v6;

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
  v10.super_class = (Class)TSDgPTPUnicastUDPv6PtPPort;
  v3 = -[TSDgPTPNetworkPort _sourceAddressString](&v10, "_sourceAddressString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iodPropertyForKey:", CFSTR("SourceIPAddress")));

  if (v6)
  {
    v7 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x"), *v7, v7[1], v7[2], v7[3], v7[4], v7[5], v7[6], v7[7], v7[8], v7[9], v7[10], v7[11], v7[12], v7[13], v7[14],
             v7[15]));

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
  v10.super_class = (Class)TSDgPTPUnicastUDPv6PtPPort;
  v3 = -[TSDgPTPNetworkPort _destinationAddressString](&v10, "_destinationAddressString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iodPropertyForKey:", CFSTR("DestinationIPAddress")));

  if (v6)
  {
    v7 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x"), *v7, v7[1], v7[2], v7[3], v7[4], v7[5], v7[6], v7[7], v7[8], v7[9], v7[10], v7[11], v7[12], v7[13], v7[14],
             v7[15]));

    v4 = (void *)v8;
  }

  return v4;
}

- (id)_destinationIPv6Address
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("DestinationIPAddress")));

  return v3;
}

- (int)portType
{
  return 4;
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
  v10.super_class = (Class)TSDgPTPUnicastUDPv6PtPPort;
  v3 = -[TSDgPTPNetworkPort propertiesForXPC](&v10, "propertiesForXPC");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iodPropertyForKey:", CFSTR("SourceIPAddress")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("SourceIPAddress"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "iodPropertyForKey:", CFSTR("DestinationIPAddress")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("DestinationIPAddress"));

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
  v16.super_class = (Class)&OBJC_METACLASS___TSDgPTPUnicastUDPv6PtPPort;
  v5 = objc_msgSendSuper2(&v16, "diagnosticInfoForService:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("PortType"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iodPropertyForKey:", CFSTR("SourceIPAddress")));
  v9 = v8;
  if (v8)
  {
    v10 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x"), *v10, v10[1], v10[2], v10[3], v10[4], v10[5], v10[6], v10[7], v10[8], v10[9], v10[10], v10[11], v10[12], v10[13], v10[14],
                      v10[15]));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("SourceAddress"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iodPropertyForKey:", CFSTR("DestinationIPAddress")));

  if (v12)
  {
    v13 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x"), *v13, v13[1], v13[2], v13[3], v13[4], v13[5], v13[6], v13[7], v13[8], v13[9], v13[10], v13[11], v13[12], v13[13], v13[14],
                      v13[15]));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("DestinationAddress"));

  }
  return v6;
}

- (NSData)destinationIPv6Address
{
  return self->_destinationIPv6Address;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationIPv6Address, 0);
}

@end
