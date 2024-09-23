@implementation AppleTypeCRetimerHardwareID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AppleTypeCRetimerHardwareID)initWithChipID:(unsigned __int16)a3 boardID:(unsigned __int16)a4 securityEpoch:(unsigned __int8)a5 productionStatus:(unsigned __int8)a6 securityMode:(unsigned __int8)a7 securityDomain:(unsigned __int8)a8 ecid:(unint64_t)a9 nonce:(id)a10 chipRev:(unsigned __int8)a11
{
  id v18;
  AppleTypeCRetimerHardwareID *v19;
  AppleTypeCRetimerHardwareID *v20;
  uint64_t v21;
  NSData *nonce;
  objc_super v24;

  v18 = a10;
  v24.receiver = self;
  v24.super_class = (Class)AppleTypeCRetimerHardwareID;
  v19 = -[AppleTypeCRetimerHardwareID init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_chipID = a3;
    v19->_boardID = a4;
    v19->_securityEpoch = a5;
    v19->_productionStatus = a6;
    v19->_securityMode = a7;
    v19->_securityDomain = a8;
    v19->_ecid = a9;
    v21 = objc_msgSend(v18, "copy");
    nonce = v20->_nonce;
    v20->_nonce = (NSData *)v21;

    v20->_chipRev = a11;
  }

  return v20;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("\tChip ID: 0x%04x\n"), self->_chipID);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tBoard ID: 0x%04x\n"), self->_boardID);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tSecurity Epoch: %u\n"), self->_securityEpoch);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tProduction Status: %u\n"), self->_productionStatus);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tSecurity Mode: %u\n"), self->_securityMode);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tSecurity Domain: %u\n"), self->_securityDomain);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tECID: 0x%016llx\n"), self->_ecid);
  -[AppleTypeCRetimerHardwareID nonceString](self, "nonceString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\tNonce: %@\n"), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR("\tChip Rev: %u"), self->_chipRev);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)nonceString
{
  void *v3;
  unsigned __int8 *v4;
  NSUInteger v5;
  NSUInteger v6;
  unsigned int v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSData bytes](self->_nonce, "bytes");
  v5 = -[NSData length](self->_nonce, "length");
  if (v5)
  {
    v6 = v5;
    do
    {
      v7 = *v4++;
      objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), v7);
      --v6;
    }
    while (v6);
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  AppleTypeCRetimerHardwareID *v4;
  AppleTypeCRetimerHardwareID *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;

  v4 = (AppleTypeCRetimerHardwareID *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[AppleTypeCRetimerHardwareID chipID](self, "chipID");
      if (v6 == -[AppleTypeCRetimerHardwareID chipID](v5, "chipID")
        && (v7 = -[AppleTypeCRetimerHardwareID boardID](self, "boardID"),
            v7 == -[AppleTypeCRetimerHardwareID boardID](v5, "boardID"))
        && (v8 = -[AppleTypeCRetimerHardwareID securityEpoch](self, "securityEpoch"),
            v8 == -[AppleTypeCRetimerHardwareID securityEpoch](v5, "securityEpoch"))
        && (v9 = -[AppleTypeCRetimerHardwareID productionStatus](self, "productionStatus"),
            v9 == -[AppleTypeCRetimerHardwareID productionStatus](v5, "productionStatus"))
        && (v10 = -[AppleTypeCRetimerHardwareID securityMode](self, "securityMode"),
            v10 == -[AppleTypeCRetimerHardwareID securityMode](v5, "securityMode"))
        && (v11 = -[AppleTypeCRetimerHardwareID securityDomain](self, "securityDomain"),
            v11 == -[AppleTypeCRetimerHardwareID securityDomain](v5, "securityDomain")))
      {
        -[AppleTypeCRetimerHardwareID nonce](self, "nonce");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[AppleTypeCRetimerHardwareID nonce](v5, "nonce");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqual:", v13))
        {
          v14 = -[AppleTypeCRetimerHardwareID chipRev](self, "chipRev");
          v15 = v14 == -[AppleTypeCRetimerHardwareID chipRev](v5, "chipRev");
        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (NSDictionary)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSData *nonce;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[10];
  _QWORD v16[12];

  v16[10] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_chipID, CFSTR("ChipID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = CFSTR("BoardID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_boardID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  v15[2] = CFSTR("SecurityEpoch");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_securityEpoch);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  v15[3] = CFSTR("ProductionStatus");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_productionStatus);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v6;
  v15[4] = CFSTR("SecurityMode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_securityMode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v7;
  v15[5] = CFSTR("SecurityDomain");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_securityDomain);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v8;
  v15[6] = CFSTR("ECID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ecid);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  nonce = self->_nonce;
  v16[6] = v9;
  v16[7] = nonce;
  v15[7] = CFSTR("Nonce");
  v15[8] = CFSTR("ChipRev");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_chipRev);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v11;
  v15[9] = CFSTR("Demote");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_demote);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v13;
}

- (BOOL)requiresPersonalization
{
  return self->_securityMode != 0;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (unsigned)boardID
{
  return self->_boardID;
}

- (unsigned)securityEpoch
{
  return self->_securityEpoch;
}

- (unsigned)productionStatus
{
  return self->_productionStatus;
}

- (unsigned)securityMode
{
  return self->_securityMode;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

- (unint64_t)ecid
{
  return self->_ecid;
}

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (unsigned)chipRev
{
  return self->_chipRev;
}

- (BOOL)demote
{
  return self->_demote;
}

- (void)setDemote:(BOOL)a3
{
  self->_demote = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
}

@end
