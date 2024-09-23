@implementation B2PIdentificationResponse

- (AppleTypeCRetimerHardwareID)hardwareID
{
  AppleTypeCRetimerHardwareID *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  AppleTypeCRetimerHardwareID *v12;
  uint64_t v14;

  v3 = [AppleTypeCRetimerHardwareID alloc];
  v4 = -[B2PIdentificationResponse chipID](self, "chipID");
  v5 = -[B2PIdentificationResponse boardID](self, "boardID");
  v6 = -[B2PIdentificationResponse securityEpoch](self, "securityEpoch");
  v7 = -[B2PIdentificationResponse productionStatus](self, "productionStatus");
  v8 = -[B2PIdentificationResponse securityMode](self, "securityMode");
  v9 = -[B2PIdentificationResponse securityDomain](self, "securityDomain");
  v10 = -[B2PIdentificationResponse ecid](self, "ecid");
  -[B2PIdentificationResponse nonce](self, "nonce");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = -[B2PIdentificationResponse apChipRev](self, "apChipRev");
  v12 = -[AppleTypeCRetimerHardwareID initWithChipID:boardID:securityEpoch:productionStatus:securityMode:securityDomain:ecid:nonce:chipRev:](v3, "initWithChipID:boardID:securityEpoch:productionStatus:securityMode:securityDomain:ecid:nonce:chipRev:", v4, v5, v6, v7, v8, v9, v10, v11, v14);

  return v12;
}

- (BOOL)parseResponse:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  NSData *v8;
  NSData *nonce;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") < 0x32
    || (v5 = objc_msgSend(objc_retainAutorelease(v4), "bytes"), *(_BYTE *)v5))
  {
    v6 = 0;
  }
  else
  {
    v7 = v5;
    self->_chipID = *(_WORD *)(v5 + 1);
    self->_boardID = *(_WORD *)(v5 + 3);
    self->_securityEpoch = *(_BYTE *)(v5 + 5);
    self->_productionStatus = *(_BYTE *)(v5 + 6);
    self->_securityMode = *(_BYTE *)(v5 + 7);
    self->_securityDomain = *(_BYTE *)(v5 + 8);
    self->_ecid = *(_QWORD *)(v5 + 9);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5 + 17, 32);
    v8 = (NSData *)objc_claimAutoreleasedReturnValue();
    nonce = self->_nonce;
    self->_nonce = v8;

    self->_apChipRev = *(_BYTE *)(v7 + 49);
    v6 = 1;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v9.receiver = self;
  v9.super_class = (Class)B2PIdentificationResponse;
  -[B2PResponse description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[B2PResponse status](self, "status"))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\tChip ID: 0x%04x\n"), self->_chipID);
    objc_msgSend(v5, "appendFormat:", CFSTR("\tBoard ID: 0x%04x\n"), self->_boardID);
    objc_msgSend(v5, "appendFormat:", CFSTR("\tSecurity Epoch: %u\n"), self->_securityEpoch);
    objc_msgSend(v5, "appendFormat:", CFSTR("\tProduction Status: %u\n"), self->_productionStatus);
    objc_msgSend(v5, "appendFormat:", CFSTR("\tSecurity Mode: %u\n"), self->_securityMode);
    objc_msgSend(v5, "appendFormat:", CFSTR("\tSecurity Domain: %u\n"), self->_securityDomain);
    objc_msgSend(v5, "appendFormat:", CFSTR("\tECID: 0x%016llx\n"), self->_ecid);
    -[NSData byteString](self->_nonce, "byteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\tNonce: %@\n"), v6);

    objc_msgSend(v5, "appendFormat:", CFSTR("\tAP Chip Rev: %u"), self->_apChipRev);
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (unsigned)apChipRev
{
  return self->_apChipRev;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
}

@end
