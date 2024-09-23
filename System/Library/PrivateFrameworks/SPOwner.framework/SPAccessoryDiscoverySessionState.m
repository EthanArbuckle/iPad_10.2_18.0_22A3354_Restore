@implementation SPAccessoryDiscoverySessionState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPAccessoryDiscoverySessionState)initWithAccessories:(id)a3
{
  id v5;
  SPAccessoryDiscoverySessionState *v6;
  SPAccessoryDiscoverySessionState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPAccessoryDiscoverySessionState;
  v6 = -[SPAccessoryDiscoverySessionState init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accessories, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPAccessoryDiscoverySessionState *v4;
  void *v5;
  SPAccessoryDiscoverySessionState *v6;

  v4 = [SPAccessoryDiscoverySessionState alloc];
  -[SPAccessoryDiscoverySessionState accessories](self, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SPAccessoryDiscoverySessionState initWithAccessories:](v4, "initWithAccessories:", v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_accessories, CFSTR("accessories"));
}

- (SPAccessoryDiscoverySessionState)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *accessories;
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
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("accessories"));
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue();

  accessories = self->_accessories;
  self->_accessories = v8;

  return self;
}

- (NSSet)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_accessories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
}

@end
