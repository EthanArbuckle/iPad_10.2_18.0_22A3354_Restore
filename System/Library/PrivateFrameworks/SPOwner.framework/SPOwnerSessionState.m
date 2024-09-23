@implementation SPOwnerSessionState

- (SPOwnerSessionState)initWithServiceState:(id)a3 disabledReasons:(id)a4 ownerDataState:(id)a5
{
  id v8;
  id v9;
  id v10;
  SPOwnerSessionState *v11;
  SPOwnerSessionState *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SPOwnerSessionState;
  v11 = -[SPOwnerSessionState init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[SPOwnerSessionState setServiceState:](v11, "setServiceState:", v8);
    -[SPOwnerSessionState setDisabledReasons:](v12, "setDisabledReasons:", v9);
    -[SPOwnerSessionState setOwnerDataState:](v12, "setOwnerDataState:", v10);
  }

  return v12;
}

- (SPOwnerSessionState)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *serviceState;
  void *v7;
  void *v8;
  void *v9;
  NSSet *v10;
  NSSet *disabledReasons;
  NSString *v12;
  NSString *ownerDataState;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceState"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceState = self->_serviceState;
  self->_serviceState = v5;

  v7 = (void *)MEMORY[0x1E0C99E60];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("disabledReasons"));
  v10 = (NSSet *)objc_claimAutoreleasedReturnValue();
  disabledReasons = self->_disabledReasons;
  self->_disabledReasons = v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerDataState"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();

  ownerDataState = self->_ownerDataState;
  self->_ownerDataState = v12;

  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPOwnerSessionState *v4;
  NSString *serviceState;
  void *v6;
  SPOwnerSessionState *v7;

  v4 = [SPOwnerSessionState alloc];
  serviceState = self->_serviceState;
  v6 = (void *)-[NSSet copy](self->_disabledReasons, "copy");
  v7 = -[SPOwnerSessionState initWithServiceState:disabledReasons:ownerDataState:](v4, "initWithServiceState:disabledReasons:ownerDataState:", serviceState, v6, self->_ownerDataState);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SPOwnerSessionState serviceState](self, "serviceState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("serviceState"));

  -[SPOwnerSessionState disabledReasons](self, "disabledReasons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("disabledReasons"));

  -[SPOwnerSessionState ownerDataState](self, "ownerDataState");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ownerDataState"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPOwnerSessionState serviceState](self, "serviceState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPOwnerSessionState disabledReasons](self, "disabledReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPOwnerSessionState ownerDataState](self, "ownerDataState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p serviceState: %@ disabledReasons: %@ ownerDataState: %@>"), v4, self, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)serviceState
{
  return self->_serviceState;
}

- (void)setServiceState:(id)a3
{
  objc_storeStrong((id *)&self->_serviceState, a3);
}

- (NSSet)disabledReasons
{
  return self->_disabledReasons;
}

- (void)setDisabledReasons:(id)a3
{
  objc_storeStrong((id *)&self->_disabledReasons, a3);
}

- (NSString)ownerDataState
{
  return self->_ownerDataState;
}

- (void)setOwnerDataState:(id)a3
{
  objc_storeStrong((id *)&self->_ownerDataState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerDataState, 0);
  objc_storeStrong((id *)&self->_disabledReasons, 0);
  objc_storeStrong((id *)&self->_serviceState, 0);
}

@end
