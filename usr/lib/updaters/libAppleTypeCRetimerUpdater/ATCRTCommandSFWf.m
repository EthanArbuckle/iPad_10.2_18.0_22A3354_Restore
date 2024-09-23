@implementation ATCRTCommandSFWf

- (ATCRTCommandSFWf)initWithBlockCount:(unsigned __int8)a3 value:(unsigned __int8)a4
{
  ATCRTCommandSFWf *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATCRTCommandSFWf;
  result = -[ATCRTCommand initWithFourCharacterCode:](&v7, sel_initWithFourCharacterCode_, 1397118822);
  if (result)
  {
    *((_BYTE *)&result->super._code + 4) = a3;
    *((_BYTE *)&result->super._code + 5) = a4;
  }
  return result;
}

- (id)inputData
{
  _BYTE v3[2];

  v3[0] = *((_BYTE *)&self->super._code + 4);
  v3[1] = *((_BYTE *)&self->super._code + 5);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
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
  v8.super_class = (Class)ATCRTCommandSFWf;
  -[ATCRTCommand description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("\tBlock Count: %u\n"), *((unsigned __int8 *)&self->super._code + 4));
  objc_msgSend(v5, "appendFormat:", CFSTR("\tValue: 0x%02x"), *((unsigned __int8 *)&self->super._code + 5));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithDescString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)blockCount
{
  return *((_BYTE *)&self->super._code + 4);
}

- (unsigned)value
{
  return *((_BYTE *)&self->super._code + 5);
}

@end
