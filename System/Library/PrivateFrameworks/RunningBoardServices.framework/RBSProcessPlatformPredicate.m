@implementation RBSProcessPlatformPredicate

- (RBSProcessPlatformPredicate)initWithPlatform:(int)a3
{
  RBSProcessPlatformPredicate *v4;
  RBSProcessPlatformPredicate *v5;
  objc_super v7;

  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)RBSProcessPlatformPredicate;
    v4 = -[RBSProcessPlatformPredicate init](&v7, sel_init);
    if (v4)
      v4->_platform = a3;
    self = v4;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)matchesProcess:(id)a3
{
  return objc_msgSend(a3, "platform") == self->_platform;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", self);
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBSProcessPlatformPredicate;
  return -[RBSProcessPredicateImpl hash](&v3, sel_hash) ^ self->_platform;
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessPlatformPredicate *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (RBSProcessPlatformPredicate *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class() && self->_platform == v4->_platform;
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
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| %d>"), v4, self->_platform);

  return v5;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_platform, CFSTR("_platform"));
}

- (RBSProcessPlatformPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessPlatformPredicate *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSProcessPlatformPredicate;
  v5 = -[RBSProcessPlatformPredicate init](&v7, sel_init);
  if (v5)
    v5->_platform = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_platform"));

  return v5;
}

- (int)platform
{
  return self->_platform;
}

@end
