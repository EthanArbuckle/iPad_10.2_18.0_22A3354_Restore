@implementation TSDgPTPUnicastUDPv4EtEPort

- (TSDgPTPUnicastUDPv4EtEPort)initWithService:(id)a3 pid:(int)a4
{
  TSDgPTPUnicastUDPv4EtEPort *v4;
  TSDgPTPUnicastUDPv4EtEPort *v5;
  uint64_t v6;
  NSNumber *destinationIPv4Address;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDgPTPUnicastUDPv4EtEPort;
  v4 = -[TSDgPTPFDEtEPort initWithService:pid:](&v9, "initWithService:pid:", a3, *(_QWORD *)&a4);
  v5 = v4;
  if (v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[TSDgPTPUnicastUDPv4EtEPort _destinationIPv4Address](v4, "_destinationIPv4Address"));
    destinationIPv4Address = v5->_destinationIPv4Address;
    v5->_destinationIPv4Address = (NSNumber *)v6;

  }
  return v5;
}

- (id)_sourceAddressString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSDgPTPUnicastUDPv4EtEPort;
  v3 = -[TSDgPTPNetworkPort _sourceAddressString](&v10, "_sourceAddressString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iodPropertyForKey:", CFSTR("SourceIPAddress")));

  if (v6)
  {
    v7 = objc_msgSend(v6, "unsignedIntValue");
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u.%u.%u.%u"), HIBYTE(v7), BYTE2(v7), BYTE1(v7), v7));

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
  unsigned int v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSDgPTPUnicastUDPv4EtEPort;
  v3 = -[TSDgPTPNetworkPort _destinationAddressString](&v10, "_destinationAddressString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iodPropertyForKey:", CFSTR("DestinationIPAddress")));

  if (v6)
  {
    v7 = objc_msgSend(v6, "unsignedIntValue");
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u.%u.%u.%u"), HIBYTE(v7), BYTE2(v7), BYTE1(v7), v7));

    v4 = (void *)v8;
  }

  return v4;
}

- (id)_destinationIPv4Address
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("DestinationIPAddress")));

  return v3;
}

- (int)portType
{
  return 6;
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
  v10.super_class = (Class)TSDgPTPUnicastUDPv4EtEPort;
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
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___TSDgPTPUnicastUDPv4EtEPort;
  v5 = objc_msgSendSuper2(&v16, "diagnosticInfoForService:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("PortType"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iodPropertyForKey:", CFSTR("SourceIPAddress")));
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "unsignedIntValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u.%u.%u.%u"), HIBYTE(v10), BYTE2(v10), BYTE1(v10), v10));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("SourceAddress"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iodPropertyForKey:", CFSTR("DestinationIPAddress")));

  if (v12)
  {
    v13 = objc_msgSend(v12, "unsignedIntValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u.%u.%u.%u"), HIBYTE(v13), BYTE2(v13), BYTE1(v13), v13));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("DestinationAddress"));

  }
  return v6;
}

- (NSNumber)destinationIPv4Address
{
  return self->_destinationIPv4Address;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationIPv4Address, 0);
}

@end
