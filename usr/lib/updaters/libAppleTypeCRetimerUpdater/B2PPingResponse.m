@implementation B2PPingResponse

- (BOOL)parseResponse:(id)a3
{
  id v4;
  unint64_t v5;
  unsigned __int8 *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5 >= 2)
  {
    v6 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v4), "bytes");
    self->_protocolVersion = *v6;
    self->_protocolMode = v6[1];
  }

  return v5 > 1;
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
  v8.super_class = (Class)B2PPingResponse;
  -[B2PResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[B2PResponse status](self, "status"))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\tProtocol Version: %s\n"), stringForB2PProtocolVersion(self->_protocolVersion));
    objc_msgSend(v5, "appendFormat:", CFSTR("\tProtocol Mode: %s"), stringForB2PProtocolMode(self->_protocolMode));
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)protocolVersion
{
  return self->_protocolVersion;
}

- (int)protocolMode
{
  return self->_protocolMode;
}

@end
