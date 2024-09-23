@implementation _SBAllDisplaysPredicate

- (_SBAllDisplaysPredicate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SBAllDisplaysPredicate;
  return (_SBAllDisplaysPredicate *)-[SBDisplayModePredicate _init](&v3, sel__init);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  return (id)sharedInstance___singleton;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a3;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = (uint64_t)v5;
    else
      v4 = 0;
  }

  return v4 != 0;
}

- (unint64_t)hash
{
  return objc_msgSend(CFSTR("(.allDisplays)"), "hash");
}

- (BOOL)matchesDisplay:(id)a3
{
  id v5;
  void *v6;
  BOOL v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayModePredicate.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayConfiguration != nil"));

  }
  objc_msgSend(v5, "hardwareIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

+ (id)fromDefaultsKey:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("(.allDisplays)")))
  {
    objc_msgSend(a1, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)defaultsKeyRepresentation
{
  return CFSTR("(.allDisplays)");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> [all displays]"), objc_opt_class(), self);
}

@end
