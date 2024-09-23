@implementation ATCRTCommandSFWd

- (ATCRTCommandSFWd)initWithWriteData:(id)a3
{
  id v4;
  ATCRTCommandSFWd *v5;
  uint64_t v6;
  NSData *writeData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATCRTCommandSFWd;
  v5 = -[ATCRTCommand initWithFourCharacterCode:](&v9, sel_initWithFourCharacterCode_, 1397118820);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    writeData = v5->_writeData;
    v5->_writeData = (NSData *)v6;

  }
  return v5;
}

- (id)inputData
{
  return self->_writeData;
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
  v8.super_class = (Class)ATCRTCommandSFWd;
  -[ATCRTCommand description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendData:descStr:", self->_writeData, "Write Data");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithDescString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSData)writeData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeData, 0);
}

@end
