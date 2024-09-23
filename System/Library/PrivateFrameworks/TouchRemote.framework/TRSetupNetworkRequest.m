@implementation TRSetupNetworkRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *networkSSID;
  NSString *networkPassword;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TRSetupNetworkRequest;
  -[TRMessage encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  networkSSID = self->_networkSSID;
  if (networkSSID)
    objc_msgSend(v4, "encodeObject:forKey:", networkSSID, CFSTR("TRSetupNetworkMessages_nS"));
  networkPassword = self->_networkPassword;
  if (networkPassword)
    objc_msgSend(v4, "encodeObject:forKey:", networkPassword, CFSTR("TRSetupNetworkMessages_nP"));

}

- (TRSetupNetworkRequest)initWithCoder:(id)a3
{
  id v4;
  TRSetupNetworkRequest *v5;
  uint64_t v6;
  NSString *networkSSID;
  uint64_t v8;
  NSString *networkPassword;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRSetupNetworkRequest;
  v5 = -[TRMessage initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TRSetupNetworkMessages_nS"));
    v6 = objc_claimAutoreleasedReturnValue();
    networkSSID = v5->_networkSSID;
    v5->_networkSSID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TRSetupNetworkMessages_nP"));
    v8 = objc_claimAutoreleasedReturnValue();
    networkPassword = v5->_networkPassword;
    v5->_networkPassword = (NSString *)v8;

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

  if (self->_networkPassword)
    v3 = CFSTR("*********");
  else
    v3 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("networkSSID:[-%@-] networkPassword:[-%@-]"), self->_networkSSID, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)TRSetupNetworkRequest;
  -[TRMessage description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)networkSSID
{
  return self->_networkSSID;
}

- (void)setNetworkSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)networkPassword
{
  return self->_networkPassword;
}

- (void)setNetworkPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkPassword, 0);
  objc_storeStrong((id *)&self->_networkSSID, 0);
}

@end
