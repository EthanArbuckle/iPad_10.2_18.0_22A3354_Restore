@implementation RBSProcessIntPredicate

- (void)encodeWithRBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeUInt64:forKey:", self->_identifier, CFSTR("_identifier"));
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessIntPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessIntPredicate *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSProcessIntPredicate;
  v5 = -[RBSProcessIntPredicate init](&v7, sel_init);
  if (v5)
    v5->_identifier = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_identifier"));

  return v5;
}

- (RBSProcessIntPredicate)initWithIdentifier:(unint64_t)a3
{
  RBSProcessIntPredicate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSProcessIntPredicate;
  result = -[RBSProcessIntPredicate init](&v5, sel_init);
  if (result)
    result->_identifier = a3;
  return result;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RBSProcessIntPredicate;
  v3 = -[RBSProcessPredicateImpl hash](&v6, sel_hash);
  v4 = 0xBF58476D1CE4E5B9 * (self->_identifier ^ (self->_identifier >> 30));
  return v3 ^ ((0x94D049BB133111EBLL * (v4 ^ (v4 >> 27))) >> 31) ^ (0x94D049BB133111EBLL * (v4 ^ (v4 >> 27)));
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %llu>"), v4, self->_identifier);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessIntPredicate *v4;
  uint64_t v5;
  BOOL v6;
  unint64_t identifier;

  v4 = (RBSProcessIntPredicate *)a3;
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
      v6 = identifier == -[RBSProcessIntPredicate identifier](v4, "identifier");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", self);
}

- (unint64_t)identifier
{
  return self->_identifier;
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
