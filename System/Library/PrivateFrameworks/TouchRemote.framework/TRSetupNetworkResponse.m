@implementation TRSetupNetworkResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TRSetupNetworkResponse;
  -[TRMessage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  if (self->_hasNetwork)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("TRSetupNetworkMessages_hN"));

}

- (TRSetupNetworkResponse)initWithCoder:(id)a3
{
  id v4;
  TRSetupNetworkResponse *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TRSetupNetworkResponse;
  v5 = -[TRMessage initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_hasNetwork = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TRSetupNetworkMessages_hN"));

  return v5;
}

- (id)description
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  if (self->_hasNetwork)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("hasNetwork:%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)TRSetupNetworkResponse;
  -[TRMessage description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasNetwork
{
  return self->_hasNetwork;
}

- (void)setHasNetwork:(BOOL)a3
{
  self->_hasNetwork = a3;
}

@end
