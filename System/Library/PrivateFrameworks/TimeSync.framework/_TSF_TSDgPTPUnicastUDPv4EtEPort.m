@implementation _TSF_TSDgPTPUnicastUDPv4EtEPort

- (_TSF_TSDgPTPUnicastUDPv4EtEPort)initWithService:(id)a3 pid:(int)a4
{
  _TSF_TSDgPTPUnicastUDPv4EtEPort *v4;
  _TSF_TSDgPTPUnicastUDPv4EtEPort *v5;
  uint64_t v6;
  NSNumber *destinationIPv4Address;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPUnicastUDPv4EtEPort;
  v4 = -[_TSF_TSDgPTPFDEtEPort initWithService:pid:](&v9, sel_initWithService_pid_, a3, *(_QWORD *)&a4);
  v5 = v4;
  if (v4)
  {
    -[_TSF_TSDgPTPUnicastUDPv4EtEPort _destinationIPv4Address](v4, "_destinationIPv4Address");
    v6 = objc_claimAutoreleasedReturnValue();
    destinationIPv4Address = v5->_destinationIPv4Address;
    v5->_destinationIPv4Address = (NSNumber *)v6;

  }
  return v5;
}

- (id)_sourceAddressString
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPUnicastUDPv4EtEPort;
  -[_TSF_TSDgPTPNetworkPort _sourceAddressString](&v9, sel__sourceAddressString);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TSF_TSDgPTPPort service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("SourceIPAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "unsignedIntValue");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u.%u.%u.%u"), HIBYTE(v6), BYTE2(v6), BYTE1(v6), v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }

  return v3;
}

- (id)_destinationAddressString
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPUnicastUDPv4EtEPort;
  -[_TSF_TSDgPTPNetworkPort _destinationAddressString](&v9, sel__destinationAddressString);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TSF_TSDgPTPPort service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("DestinationIPAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "unsignedIntValue");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u.%u.%u.%u"), HIBYTE(v6), BYTE2(v6), BYTE1(v6), v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }

  return v3;
}

- (id)_destinationIPv4Address
{
  void *v2;
  void *v3;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("DestinationIPAddress"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)portType
{
  return 6;
}

- (id)propertiesForXPC
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPUnicastUDPv4EtEPort;
  -[_TSF_TSDgPTPNetworkPort propertiesForXPC](&v9, sel_propertiesForXPC);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TSF_TSDgPTPPort service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("SourceIPAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("SourceIPAddress"));

  -[_TSF_TSDgPTPPort service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iodPropertyForKey:", CFSTR("DestinationIPAddress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("DestinationIPAddress"));

  return v3;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS____TSF_TSDgPTPUnicastUDPv4EtEPort;
  objc_msgSendSuper2(&v15, sel_diagnosticInfoForService_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("PortType"));

  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("SourceIPAddress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "unsignedIntValue");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u.%u.%u.%u"), HIBYTE(v9), BYTE2(v9), BYTE1(v9), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("SourceAddress"));

  }
  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("DestinationIPAddress"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_msgSend(v11, "unsignedIntValue");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u.%u.%u.%u"), HIBYTE(v12), BYTE2(v12), BYTE1(v12), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("DestinationAddress"));

  }
  return v5;
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
