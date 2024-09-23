@implementation _TSF_TSDgPTPUnicastUDPv6PtPPort

+ (id)iokitMatchingDictionaryForInterfaceName:(id)a3 andIPv6Address:(char *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("IOTimeSyncUnicastUDPv6PtPPort");
  v19[0] = CFSTR("IOProviderClass");
  v19[1] = CFSTR("IOParentMatch");
  v16 = a3;
  v17[0] = CFSTR("IOProviderClass");
  v17[1] = CFSTR("IOPropertyMatch");
  v18[0] = CFSTR("IOTimeSyncInterfaceAdapter");
  v15 = CFSTR("InterfaceName");
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  v19[2] = CFSTR("IOPropertyMatch");
  v13 = CFSTR("DestinationIPAddress");
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a4, 16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (_TSF_TSDgPTPUnicastUDPv6PtPPort)initWithService:(id)a3 pid:(int)a4
{
  _TSF_TSDgPTPUnicastUDPv6PtPPort *v4;
  _TSF_TSDgPTPUnicastUDPv6PtPPort *v5;
  uint64_t v6;
  NSData *destinationIPv6Address;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPUnicastUDPv6PtPPort;
  v4 = -[_TSF_TSDgPTPFDPtPPort initWithService:pid:](&v9, sel_initWithService_pid_, a3, *(_QWORD *)&a4);
  v5 = v4;
  if (v4)
  {
    -[_TSF_TSDgPTPUnicastUDPv6PtPPort _destinationIPv6Address](v4, "_destinationIPv6Address");
    v6 = objc_claimAutoreleasedReturnValue();
    destinationIPv6Address = v5->_destinationIPv6Address;
    v5->_destinationIPv6Address = (NSData *)v6;

  }
  return v5;
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
  v9.super_class = (Class)_TSF_TSDgPTPUnicastUDPv6PtPPort;
  -[_TSF_TSDgPTPNetworkPort _sourceAddressString](&v9, sel__sourceAddressString);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TSF_TSDgPTPPort service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("SourceIPAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x"), *v6, v6[1], v6[2], v6[3], v6[4], v6[5], v6[6], v6[7], v6[8], v6[9], v6[10], v6[11], v6[12], v6[13], v6[14], v6[15]);
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
  unsigned __int8 *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPUnicastUDPv6PtPPort;
  -[_TSF_TSDgPTPNetworkPort _destinationAddressString](&v9, sel__destinationAddressString);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TSF_TSDgPTPPort service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("DestinationIPAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x"), *v6, v6[1], v6[2], v6[3], v6[4], v6[5], v6[6], v6[7], v6[8], v6[9], v6[10], v6[11], v6[12], v6[13], v6[14], v6[15]);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }

  return v3;
}

- (id)_destinationIPv6Address
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
  return 4;
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
  v9.super_class = (Class)_TSF_TSDgPTPUnicastUDPv6PtPPort;
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
  unsigned __int8 *v9;
  void *v10;
  void *v11;
  unsigned __int8 *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS____TSF_TSDgPTPUnicastUDPv6PtPPort;
  objc_msgSendSuper2(&v15, sel_diagnosticInfoForService_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("PortType"));

  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("SourceIPAddress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x"), *v9, v9[1], v9[2], v9[3], v9[4], v9[5], v9[6], v9[7], v9[8], v9[9], v9[10], v9[11], v9[12], v9[13], v9[14], v9[15]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("SourceAddress"));

  }
  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("DestinationIPAddress"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v11), "bytes");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x"), *v12, v12[1], v12[2], v12[3], v12[4], v12[5], v12[6], v12[7], v12[8], v12[9], v12[10], v12[11], v12[12], v12[13], v12[14], v12[15]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("DestinationAddress"));

  }
  return v5;
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
