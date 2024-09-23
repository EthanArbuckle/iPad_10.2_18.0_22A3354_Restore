@implementation B2PCommand

- (B2PCommand)init
{
  -[B2PCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (B2PCommand)initWithOpCode:(unsigned __int16)a3
{
  B2PCommand *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)B2PCommand;
  result = -[B2PCommand init](&v5, sel_init);
  if (result)
    result->_opCode = a3;
  return result;
}

- (B2PCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5
{
  uint64_t v6;
  id v8;
  B2PCommand *v9;
  B2PCommand *v10;

  v6 = a3;
  v8 = a5;
  v9 = -[B2PCommand initWithOpCode:](self, "initWithOpCode:", v6);
  v10 = v9;
  if (v9)
  {
    v9->_route = a4;
    if (!-[B2PCommand parseCommand:](v9, "parseCommand:", v8))
    {

      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)parseCommand:(id)a3
{
  return a3 == 0;
}

- (NSData)data
{
  return (NSData *)objc_msgSend(MEMORY[0x24BDBCE50], "data");
}

- (unsigned)opCode
{
  return ((self->_route & 0xF) << 12) | self->_opCode;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:\n\tOp Code: 0x%04x\n\tRoute: %s"), v5, self->_opCode, stringForB2PRoute(self->_route));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)route
{
  return self->_route;
}

- (void)setRoute:(unsigned __int8)a3
{
  self->_route = a3;
}

@end
