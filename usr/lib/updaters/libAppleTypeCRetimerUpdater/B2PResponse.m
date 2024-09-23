@implementation B2PResponse

- (B2PResponse)init
{
  -[B2PResponse doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (B2PResponse)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 status:(int)a5 data:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  B2PResponse *v11;
  B2PResponse *v12;

  v6 = *(_QWORD *)&a5;
  v7 = a4;
  v8 = a3;
  v10 = a6;
  v11 = -[B2PResponse initWithOpCode:route:status:](self, "initWithOpCode:route:status:", v8, v7, v6);
  v12 = v11;
  if (!(_DWORD)v6 && v11 && !-[B2PResponse parseResponse:](v11, "parseResponse:", v10))
  {

    v12 = 0;
  }

  return v12;
}

- (B2PResponse)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 status:(int)a5
{
  B2PResponse *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)B2PResponse;
  result = -[B2PResponse init](&v9, sel_init);
  if (result)
  {
    result->_opCode = a3;
    result->_route = a4;
    result->_status = a5;
  }
  return result;
}

- (BOOL)parseResponse:(id)a3
{
  return a3 == 0;
}

- (unsigned)opCodeField
{
  return ((self->_route & 0xF) << 12) | self->_opCode;
}

- (NSData)data
{
  return (NSData *)objc_msgSend(MEMORY[0x24BDBCE50], "data");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t opCode;
  const char *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  opCode = self->_opCode;
  v7 = stringForB2PRoute(self->_route);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:\n\tOp Code: 0x%04x\n\tRoute: %s\n\tStatus: %s"), v5, opCode, v7, stringForB2PResponseStatus(self->_status));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)opCode
{
  return self->_opCode;
}

- (unsigned)route
{
  return self->_route;
}

- (int)status
{
  return self->_status;
}

@end
