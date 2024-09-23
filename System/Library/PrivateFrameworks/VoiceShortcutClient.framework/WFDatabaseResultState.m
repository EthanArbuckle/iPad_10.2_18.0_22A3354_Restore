@implementation WFDatabaseResultState

- (WFDatabaseResultState)initWithObjectType:(unint64_t)a3 state:(id)a4
{
  id v7;
  WFDatabaseResultState *v8;
  WFDatabaseResultState *v9;
  uint64_t v10;
  NSSet *state;
  WFDatabaseResultState *v12;
  void *v14;
  objc_super v15;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabaseResultState.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFDatabaseResultState;
  v8 = -[WFDatabaseResultState init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_objectType = a3;
    v10 = objc_msgSend(v7, "copy");
    state = v9->_state;
    v9->_state = (NSSet *)v10;

    v12 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
}

- (WFDatabaseResultState)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  WFDatabaseResultState *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("objectType"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[WFDatabaseResultState initWithObjectType:state:](self, "initWithObjectType:state:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFDatabaseResultState objectType](self, "objectType"), CFSTR("objectType"));
  -[WFDatabaseResultState state](self, "state");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("state"));

}

- (unint64_t)objectType
{
  return self->_objectType;
}

- (NSSet)state
{
  return self->_state;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
