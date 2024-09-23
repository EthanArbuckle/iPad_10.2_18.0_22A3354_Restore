@implementation PRRangingDevice

- (PRRangingDevice)init
{
  PRRangingDevice *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *clientInfo;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)PRRangingDevice;
  v2 = -[PRRangingDevice init](&v11, sel_init);
  if (v2)
  {
    v12[0] = CFSTR("ProcessName");
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = CFSTR("ProcessIdentifier");
    v13[0] = v4;
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "processIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v8 = objc_claimAutoreleasedReturnValue();
    clientInfo = v2->_clientInfo;
    v2->_clientInfo = (NSDictionary *)v8;

  }
  return v2;
}

- (NSDictionary)clientInfo
{
  return self->_clientInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

@end
