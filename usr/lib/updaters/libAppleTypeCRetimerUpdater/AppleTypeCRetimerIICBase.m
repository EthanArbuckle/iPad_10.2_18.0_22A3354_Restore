@implementation AppleTypeCRetimerIICBase

- (AppleTypeCRetimerIICBase)initWithDeviceHandle:(id)a3
{
  id v5;
  AppleTypeCRetimerIICBase *v6;
  AppleTypeCRetimerIICBase *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AppleTypeCRetimerIICBase;
  v6 = -[AppleTypeCRetimerIICBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_handle, a3);

  return v7;
}

- (int)readRegister:(unsigned __int8)a3 buffer:(void *)a4 length:(unsigned int)a5
{
  return -[AppleTypeCRetimerDeviceHandle readRegister:buffer:length:](self->_handle, "readRegister:buffer:length:", a3, a4, *(_QWORD *)&a5);
}

- (int)writeRegister:(unsigned __int8)a3 buffer:(const void *)a4 length:(unsigned int)a5
{
  return -[AppleTypeCRetimerDeviceHandle writeRegister:buffer:length:](self->_handle, "writeRegister:buffer:length:", a3, a4, *(_QWORD *)&a5);
}

- (NSString)bverString
{
  void *v3;
  _OWORD v5[4];
  _OWORD v6[4];
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  memset(v6, 0, sizeof(v6));
  memset(v5, 0, sizeof(v5));
  if (-[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 15, v5, 64)
    || -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 16, v6, 64))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)internalFirmwareVersion
{
  void *v3;
  _OWORD v5[4];
  _OWORD v6[4];
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  memset(v6, 0, sizeof(v6));
  memset(v5, 0, sizeof(v5));
  if (-[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 10, v5, 64)
    || -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 11, v6, 64))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (id)queryChipInfo:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v11;
  void *v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  _OWORD v16[4];
  _OWORD v17[4];
  char v18;
  __int128 v19;
  _BYTE v20[32];
  unsigned __int8 v21;
  _BYTE v22[64];
  _BYTE v23[72];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD16A8];
  -[AppleTypeCRetimerDeviceHandle name](self->_handle, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:\n"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v8 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 0, &v15, 4);
  if (!v8)
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("\tVendor ID: 0x%04x\n"), v15);
    v14 = 0;
    v8 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 1, &v14, 4);
    if (!v8)
    {
      objc_msgSend(v7, "appendFormat:", CFSTR("\tDevice ID: 0x%04x\n"), v14);
      memset(v23, 0, 65);
      memset(v22, 0, sizeof(v22));
      v8 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 10, v22, 64);
      if (!v8)
      {
        v8 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 11, v23, 64);
        if (!v8)
        {
          objc_msgSend(v7, "appendFormat:", CFSTR("\tInternal FW Version: %s\n"), v22);
          v21 = 0;
          memset(v20, 0, sizeof(v20));
          v19 = 0u;
          v8 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 14, &v19, 49);
          if (!v8)
          {
            objc_msgSend(v7, "appendString:", CFSTR("\tHardware ID:\n"));
            objc_msgSend(v7, "appendFormat:", CFSTR("\t\tChip ID: 0x%02x\n"), (unsigned __int16)v19);
            objc_msgSend(v7, "appendFormat:", CFSTR("\t\tBoard ID: 0x%04x\n"), WORD1(v19));
            objc_msgSend(v7, "appendFormat:", CFSTR("\t\tSecurity Epoch: %u\n"), BYTE4(v19));
            objc_msgSend(v7, "appendFormat:", CFSTR("\t\tProduction Status: %u\n"), BYTE5(v19));
            objc_msgSend(v7, "appendFormat:", CFSTR("\t\tSecurity Mode: %u\n"), BYTE6(v19));
            objc_msgSend(v7, "appendFormat:", CFSTR("\t\tSecurity Domain: %u\n"), BYTE7(v19));
            objc_msgSend(v7, "appendFormat:", CFSTR("\t\tECID: 0x%016llx\n"), *((_QWORD *)&v19 + 1));
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v20, 32);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "byteString");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("\t\tNonce: %@\n"), v12);

            objc_msgSend(v7, "appendFormat:", CFSTR("\t\tChip Revision: %u\n"), v21);
            v18 = 0;
            memset(v17, 0, sizeof(v17));
            memset(v16, 0, sizeof(v16));
            v13 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 15, v16, 64);
            if (v13)
            {
              if (a3)
              {
LABEL_12:
                objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1010], v13, 0);
                v9 = 0;
                *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

                goto LABEL_9;
              }
            }
            else
            {
              v13 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 16, v17, 64);
              if (!v13)
              {
                objc_msgSend(v7, "appendFormat:", CFSTR("\tVersion: %s\n"), v16);
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithDescString:", v7);
                v9 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_17;
              }
              if (a3)
                goto LABEL_12;
            }
            v9 = 0;
            goto LABEL_17;
          }
        }
      }
    }
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1010], v8, 0);
    v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_9:

  return v9;
}

- (id)queryHardwareID:(id *)a3
{
  AppleTypeCRetimerHardwareID *hardwareID;
  int v7;
  void *v8;
  AppleTypeCRetimerHardwareID *v9;
  AppleTypeCRetimerHardwareID *v10;
  AppleTypeCRetimerHardwareID *v11;
  AppleTypeCRetimerHardwareID *v12;
  uint64_t v13;
  __int128 v14;
  _OWORD v15[2];
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  hardwareID = self->_hardwareID;
  if (hardwareID)
    return hardwareID;
  v16 = 0;
  memset(v15, 0, sizeof(v15));
  v14 = 0u;
  v7 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 14, &v14, 49);
  if (v7)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1010], v7, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v15, 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [AppleTypeCRetimerHardwareID alloc];
    LOBYTE(v13) = v16;
    v10 = -[AppleTypeCRetimerHardwareID initWithChipID:boardID:securityEpoch:productionStatus:securityMode:securityDomain:ecid:nonce:chipRev:](v9, "initWithChipID:boardID:securityEpoch:productionStatus:securityMode:securityDomain:ecid:nonce:chipRev:", (unsigned __int16)v14, WORD1(v14), BYTE4(v14), BYTE5(v14), BYTE6(v14), BYTE7(v14), *((_QWORD *)&v14 + 1), v8, v13);
    v11 = self->_hardwareID;
    self->_hardwareID = v10;

    v12 = self->_hardwareID;
    return v12;
  }
}

- (id)queryRetimerPanicStatus:(id *)a3
{
  int v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v4 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 17, &v9, 8);
  if (!v4)
    return -[AppleTypeCRetimerPanicStatus initWithPanicState:assertID:]([AppleTypeCRetimerPanicStatus alloc], "initWithPanicState:assertID:", v9 & 1, HIDWORD(v9));
  if (a3)
  {
    v5 = v4;
    v10 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: Error reading from register %s(%x)"), "-[AppleTypeCRetimerIICBase queryRetimerPanicStatus:]", "ATCRT_REG_PANIC_STATUS", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1010], v5, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (OS_os_log)log
{
  return (OS_os_log *)-[AppleTypeCRetimerDeviceHandle log](self->_handle, "log");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_hardwareID, 0);
}

@end
