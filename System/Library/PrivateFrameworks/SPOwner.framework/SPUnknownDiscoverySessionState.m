@implementation SPUnknownDiscoverySessionState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPUnknownDiscoverySessionState)initWithUnknownAccessories:(id)a3
{
  id v5;
  SPUnknownDiscoverySessionState *v6;
  SPUnknownDiscoverySessionState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPUnknownDiscoverySessionState;
  v6 = -[SPUnknownDiscoverySessionState init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_unknownAccessories, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPUnknownDiscoverySessionState *v4;
  void *v5;
  SPUnknownDiscoverySessionState *v6;

  v4 = [SPUnknownDiscoverySessionState alloc];
  -[SPUnknownDiscoverySessionState unknownAccessories](self, "unknownAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SPUnknownDiscoverySessionState initWithUnknownAccessories:](v4, "initWithUnknownAccessories:", v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_unknownAccessories, CFSTR("unknownAccessories"));
}

- (SPUnknownDiscoverySessionState)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *unknownAccessories;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("unknownAccessories"));
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue();

  unknownAccessories = self->_unknownAccessories;
  self->_unknownAccessories = v8;

  return self;
}

- (NSSet)unknownAccessories
{
  return self->_unknownAccessories;
}

- (void)setUnknownAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_unknownAccessories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownAccessories, 0);
}

@end
