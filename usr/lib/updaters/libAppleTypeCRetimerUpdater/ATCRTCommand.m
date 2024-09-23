@implementation ATCRTCommand

- (ATCRTCommand)init
{
  -[ATCRTCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ATCRTCommand)initWithFourCharacterCode:(unsigned int)a3
{
  ATCRTCommand *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATCRTCommand;
  result = -[ATCRTCommand init](&v5, sel_init);
  if (result)
    result->_code = a3;
  return result;
}

- (NSData)inputData
{
  return 0;
}

- (NSString)codeString
{
  return (NSString *)stringForFourCharCode(self->_code);
}

- (BOOL)hasResponse
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD16A8];
  stringForFourCharCode(self->_code);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ATCRT Command: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATCRTCommand inputData](self, "inputData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
    objc_msgSend(v5, "appendString:", CFSTR("\n"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)code
{
  return self->_code;
}

@end
