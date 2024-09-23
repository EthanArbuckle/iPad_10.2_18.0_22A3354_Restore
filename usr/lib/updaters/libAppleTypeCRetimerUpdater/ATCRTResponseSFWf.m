@implementation ATCRTResponseSFWf

- (ATCRTResponseSFWf)initWithOutput:(ATCRTTaskSFWfOutput *)a3
{
  uint64_t var0_low;
  ATCRTResponseSFWf *result;
  objc_super v6;

  var0_low = LOBYTE(a3->var0);
  v6.receiver = self;
  v6.super_class = (Class)ATCRTResponseSFWf;
  result = -[ATCRTResponse initWithFourCharacterCode:byte0:resultDescriptionFunction:](&v6, sel_initWithFourCharacterCode_byte0_resultDescriptionFunction_, 1397118822, var0_low, stringForATCRTTaskSFWfResult);
  if (result)
    result->_bytesWritten = a3->var0 >> 8;
  return result;
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
  v8.super_class = (Class)ATCRTResponseSFWf;
  -[ATCRTResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("Bytes Written: %u"), self->_bytesWritten);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithDescString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)bytesWritten
{
  return self->_bytesWritten;
}

@end
