@implementation RBSProcessStringPredicate

- (NSString)identifier
{
  return self->_identifier;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"));
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessStringPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessStringPredicate *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBSProcessStringPredicate;
  v5 = -[RBSProcessStringPredicate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessStringPredicate *v4;
  uint64_t v5;
  char v6;
  NSString *identifier;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v4 = (RBSProcessStringPredicate *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      identifier = self->_identifier;
      -[RBSProcessStringPredicate identifier](v4, "identifier");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (identifier == (NSString *)v8)
      {
        v6 = 1;
      }
      else
      {
        if (identifier)
          v10 = v8 == 0;
        else
          v10 = 1;
        if (v10)
          v6 = 0;
        else
          v6 = -[NSString isEqual:](identifier, "isEqual:", v8);
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSProcessStringPredicate;
  v3 = -[RBSProcessPredicateImpl hash](&v5, sel_hash);
  return -[NSString hash](self->_identifier, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (RBSProcessStringPredicate)initWithIdentifier:(id)a3
{
  id v5;
  RBSProcessStringPredicate *v6;
  uint64_t v7;
  NSString *identifier;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessPredicate.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v11.receiver = self;
  v11.super_class = (Class)RBSProcessStringPredicate;
  v6 = -[RBSProcessStringPredicate init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

  }
  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ \"%@\">"), v4, self->_identifier);

  return v5;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", self);
}

- (BOOL)matchesProcess:(id)a3
{
  BOOL result;

  objc_opt_class();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3();
  return result;
}

@end
