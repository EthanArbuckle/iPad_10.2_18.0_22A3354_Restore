@implementation _TSF_TSDgPTPEthernetPort

- (_TSF_TSDgPTPEthernetPort)initWithService:(id)a3 pid:(int)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TSF_TSDgPTPEthernetPort;
  return -[_TSF_TSDgPTPFDPtPPort initWithService:pid:](&v5, sel_initWithService_pid_, a3, *(_QWORD *)&a4);
}

- (id)_sourceAddressString
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPEthernetPort;
  -[_TSF_TSDgPTPNetworkPort _sourceAddressString](&v9, sel__sourceAddressString);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TSF_TSDgPTPPort service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("SourceMACAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx"), *v6, v6[1], v6[2], v6[3], v6[4], v6[5]);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }

  return v3;
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
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TSF_TSDgPTPEthernetPort;
  -[_TSF_TSDgPTPNetworkPort propertiesForXPC](&v7, sel_propertiesForXPC);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TSF_TSDgPTPPort service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("SourceMACAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("SourceMACAddress"));

  return v3;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 *v7;
  void *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS____TSF_TSDgPTPEthernetPort;
  v3 = a3;
  objc_msgSendSuper2(&v10, sel_diagnosticInfoForService_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("PortType"));

  objc_msgSend(v3, "iodPropertyForKey:", CFSTR("SourceMACAddress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx"), *v7, v7[1], v7[2], v7[3], v7[4], v7[5], v10.receiver, v10.super_class);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("SourceAddress"));

  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("01:80:c2:00:00:0e"), CFSTR("DestinationAddress"));

  return v4;
}

@end
