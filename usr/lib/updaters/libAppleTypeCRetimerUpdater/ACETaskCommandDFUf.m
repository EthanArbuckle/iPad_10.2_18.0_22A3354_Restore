@implementation ACETaskCommandDFUf

- (ACETaskCommandDFUf)initWithForceDFUMode:(BOOL)a3 allowOnlyIfConnected:(BOOL)a4
{
  ACETaskCommandDFUf *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACETaskCommandDFUf;
  result = -[ACETaskCommand initWithFourCharacterCode:](&v7, sel_initWithFourCharacterCode_, 1145460070);
  if (result)
  {
    *((_BYTE *)&result->super._code + 4) = a3;
    *((_BYTE *)&result->super._code + 5) = a4;
  }
  return result;
}

- (id)inputData
{
  char v2;
  char v4;

  v2 = *((_BYTE *)&self->super._code + 4);
  v4 = v2;
  if (*((_BYTE *)&self->super._code + 5))
    v4 = v2 | 0x80;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v4, 1);
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
  v8.super_class = (Class)ACETaskCommandDFUf;
  -[ACETaskCommand description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendBool:descStr:", *((unsigned __int8 *)&self->super._code + 4), "Force DFU Mode");
  objc_msgSend(v5, "appendBool:descStr:", *((unsigned __int8 *)&self->super._code + 5), "Allow Only if Connected");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithDescString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)forceDFUMode
{
  return *(_BYTE *)(&self->super._code + 1) & 1;
}

- (BOOL)allowOnlyIfConnected
{
  return *((_BYTE *)&self->super._code + 5) & 1;
}

@end
