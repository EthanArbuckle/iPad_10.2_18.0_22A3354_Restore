@implementation B2PIdentificationCommand

- (B2PIdentificationCommand)init
{
  B2PIdentificationCommand *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)B2PIdentificationCommand;
  result = -[B2PCommand initWithOpCode:](&v3, sel_initWithOpCode_, 2);
  if (result)
    *(_DWORD *)(&result->super._route + 2) = 0;
  return result;
}

- (B2PIdentificationCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5
{
  -[B2PIdentificationCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);

  return 0;
}

- (id)data
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendByte:", *(&self->super._route + 2));
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  v8.super_class = (Class)B2PIdentificationCommand;
  -[B2PCommand description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("\tInfo ID: %s"), stringForB2PInfoID(*(_DWORD *)(&self->super._route + 2)));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)infoID
{
  return *(_DWORD *)(&self->super._route + 2);
}

@end
