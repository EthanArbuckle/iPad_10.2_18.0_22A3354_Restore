@implementation TRHandshakeResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TRHandshakeResponse;
  v4 = a3;
  -[TRMessage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_protocolVersion, CFSTR("TRHandshakeMessages_pV"), v5.receiver, v5.super_class);

}

- (TRHandshakeResponse)initWithCoder:(id)a3
{
  id v4;
  TRHandshakeResponse *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TRHandshakeResponse;
  v5 = -[TRMessage initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_protocolVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("TRHandshakeMessages_pV"));

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("protocolVersion:%ld"), self->_protocolVersion);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)TRHandshakeResponse;
  -[TRMessage description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

@end
