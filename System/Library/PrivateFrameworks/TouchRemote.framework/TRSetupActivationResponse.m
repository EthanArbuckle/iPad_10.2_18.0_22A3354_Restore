@implementation TRSetupActivationResponse

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
  v5.super_class = (Class)TRSetupActivationResponse;
  -[TRMessage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  if (self->_activated)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("TRSetupNetworkMessages_hN"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_error, CFSTR("TRSetupActivationMessages_err"));

}

- (TRSetupActivationResponse)initWithCoder:(id)a3
{
  id v4;
  TRSetupActivationResponse *v5;
  uint64_t v6;
  NSError *error;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRSetupActivationResponse;
  v5 = -[TRMessage initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_activated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TRSetupNetworkMessages_hN"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TRSetupActivationMessages_err"));
    v6 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v6;

  }
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

  if (self->_activated)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("activated:%@ error:%@"), v3, self->_error);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)TRSetupActivationResponse;
  -[TRMessage description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
