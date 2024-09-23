@implementation B2PSerialNumberGetResponse

- (BOOL)parseResponse:(id)a3
{
  id v4;
  NSString *v5;
  NSString *serialNumber;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
    serialNumber = self->_serialNumber;
    self->_serialNumber = v5;
  }
  else
  {
    serialNumber = self->_serialNumber;
    self->_serialNumber = (NSString *)&stru_251CEA248;
  }

  v7 = self->_serialNumber != 0;
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v8.receiver = self;
  v8.super_class = (Class)B2PSerialNumberGetResponse;
  -[B2PResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("\tSerial Number: %@\n"), self->_serialNumber);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end
