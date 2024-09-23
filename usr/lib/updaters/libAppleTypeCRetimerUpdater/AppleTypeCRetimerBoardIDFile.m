@implementation AppleTypeCRetimerBoardIDFile

- (AppleTypeCRetimerBoardIDFile)initWithBoardID:(unint64_t)a3 chipID:(unsigned __int16)a4 portNumber:(unsigned __int8)a5 securityDomain:(unsigned __int8)a6
{
  AppleTypeCRetimerBoardIDFile *v10;
  AppleTypeCRetimerBoardIDFile *v11;
  uint64_t v12;
  NSData *data;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AppleTypeCRetimerBoardIDFile;
  v10 = -[AppleTypeCRetimerBoardIDFile init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_magic = -1161889074;
    v10->_version = 2;
    v10->_boardID = a3;
    v10->_chipID = a4;
    v10->_portNumber = a5;
    v10->_securityDomain = a6;
    -[AppleTypeCRetimerBoardIDFile generateSubfileData](v10, "generateSubfileData");
    v12 = objc_claimAutoreleasedReturnValue();
    data = v11->_data;
    v11->_data = (NSData *)v12;

  }
  return v11;
}

- (id)generateSubfileData
{
  void *v3;
  void *v4;
  unsigned __int16 chipID;
  unint64_t boardID;
  unsigned __int16 version;
  unsigned int magic;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  magic = self->_magic;
  objc_msgSend(v3, "appendBytes:length:", &magic, 4);
  version = self->_version;
  objc_msgSend(v3, "appendBytes:length:", &version, 2);
  boardID = self->_boardID;
  objc_msgSend(v3, "appendBytes:length:", &boardID, 8);
  chipID = self->_chipID;
  objc_msgSend(v3, "appendBytes:length:", &chipID, 2);
  objc_msgSend(v3, "appendBytes:length:", &self->_portNumber, 1);
  objc_msgSend(v3, "appendBytes:length:", &self->_boardRevision, 1);
  objc_msgSend(v3, "appendBytes:length:", &self->_securityDomain, 1);
  *(_QWORD *)((char *)v10 + 5) = 0;
  v10[0] = 0;
  objc_msgSend(v3, "appendBytes:length:", v10, 13);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)tag
{
  return (NSString *)CFSTR("_brd");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("\tMagic: 0x%08x\n"), self->_magic);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tVersion: %u\n"), self->_version);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tBoard ID: 0x%016llx\n"), self->_boardID);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tChip ID: 0x%04x\n"), self->_chipID);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tPort Number: %u\n"), self->_portNumber);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tBoard Revision: %u\n"), self->_boardRevision);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tSecurity Domain: %u"), self->_securityDomain);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unsigned)magic
{
  return self->_magic;
}

- (unsigned)version
{
  return self->_version;
}

- (unint64_t)boardID
{
  return self->_boardID;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (unsigned)portNumber
{
  return self->_portNumber;
}

- (unsigned)boardRevision
{
  return self->_boardRevision;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
