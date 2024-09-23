@implementation TRSetupConfigurationResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSSet *unauthenticatedAccountServices;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TRSetupConfigurationResponse;
  -[TRMessage encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  if (self->_needsNetwork)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("TRSetupConfigurationMessages_nN"));
  unauthenticatedAccountServices = self->_unauthenticatedAccountServices;
  if (unauthenticatedAccountServices)
    objc_msgSend(v4, "encodeObject:forKey:", unauthenticatedAccountServices, CFSTR("TRSetupConfigurationMessages_uAS"));
  if (self->_useAIDA)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("TRSetupConfigurationMessages_uAIDA"));

}

- (TRSetupConfigurationResponse)initWithCoder:(id)a3
{
  id v4;
  TRSetupConfigurationResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *unauthenticatedAccountServices;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TRSetupConfigurationResponse;
  v5 = -[TRMessage initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_needsNetwork = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TRSetupConfigurationMessages_nN"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("TRSetupConfigurationMessages_uAS"));
    v9 = objc_claimAutoreleasedReturnValue();
    unauthenticatedAccountServices = v5->_unauthenticatedAccountServices;
    v5->_unauthenticatedAccountServices = (NSSet *)v9;

    v5->_useAIDA = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TRSetupConfigurationMessages_uAIDA"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if (self->_needsNetwork)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  -[TRSetupConfigurationResponse _stringFromAccountServices:](self, "_stringFromAccountServices:", self->_unauthenticatedAccountServices);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("needsNetwork:%@ unauthenticatedAccountServices:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)TRSetupConfigurationResponse;
  -[TRMessage description](&v11, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %@"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_stringFromAccountServices:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        StringFromTRAccountService(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "unsignedIntegerValue", (_QWORD)v12));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)needsNetwork
{
  return self->_needsNetwork;
}

- (void)setNeedsNetwork:(BOOL)a3
{
  self->_needsNetwork = a3;
}

- (NSSet)unauthenticatedAccountServices
{
  return self->_unauthenticatedAccountServices;
}

- (void)setUnauthenticatedAccountServices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)useAIDA
{
  return self->_useAIDA;
}

- (void)setUseAIDA:(BOOL)a3
{
  self->_useAIDA = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unauthenticatedAccountServices, 0);
}

@end
