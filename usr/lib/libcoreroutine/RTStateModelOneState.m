@implementation RTStateModelOneState

- (RTStateModelOneState)init
{
  RTStateModelOneState *v2;
  uint64_t v3;
  NSUUID *uniqueId;
  uint64_t v5;
  RTStateDepiction *stateDepiction;
  uint64_t v7;
  NSMutableDictionary *stateTransitions;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RTStateModelOneState;
  v2 = -[RTStateModelOneState init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    uniqueId = v2->_uniqueId;
    v2->_uniqueId = (NSUUID *)v3;

    v5 = objc_opt_new();
    stateDepiction = v2->_stateDepiction;
    v2->_stateDepiction = (RTStateDepiction *)v5;

    v7 = objc_opt_new();
    stateTransitions = v2->_stateTransitions;
    v2->_stateTransitions = (NSMutableDictionary *)v7;

  }
  return v2;
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
  -[RTStateModelOneState uniqueId](self, "uniqueId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uniqueId"));

  -[RTStateModelOneState stateDepiction](self, "stateDepiction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("stateDepiction"));

  -[RTStateModelOneState stateTransitions](self, "stateTransitions");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("stateTransitions"));

}

- (RTStateModelOneState)initWithCoder:(id)a3
{
  id v4;
  RTStateModelOneState *v5;
  uint64_t v6;
  NSUUID *uniqueId;
  uint64_t v8;
  RTStateDepiction *stateDepiction;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *stateTransitions;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RTStateModelOneState;
  v5 = -[RTStateModelOneState init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueId"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueId = v5->_uniqueId;
    v5->_uniqueId = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stateDepiction"));
    v8 = objc_claimAutoreleasedReturnValue();
    stateDepiction = v5->_stateDepiction;
    v5->_stateDepiction = (RTStateDepiction *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("stateTransitions"));
    v14 = objc_claimAutoreleasedReturnValue();
    stateTransitions = v5->_stateTransitions;
    v5->_stateTransitions = (NSMutableDictionary *)v14;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTStateModelOneState uniqueId](self, "uniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTStateModelOneState stateDepiction](self, "stateDepiction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier, %@, stateDepiction, %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueId, a3);
}

- (RTStateDepiction)stateDepiction
{
  return self->_stateDepiction;
}

- (void)setStateDepiction:(id)a3
{
  objc_storeStrong((id *)&self->_stateDepiction, a3);
}

- (NSMutableDictionary)stateTransitions
{
  return self->_stateTransitions;
}

- (void)setStateTransitions:(id)a3
{
  objc_storeStrong((id *)&self->_stateTransitions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateTransitions, 0);
  objc_storeStrong((id *)&self->_stateDepiction, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
}

@end
