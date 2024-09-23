@implementation SBDisplayModePredicate

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBDisplayModePredicate;
  return -[SBDisplayModePredicate init](&v3, sel_init);
}

+ (id)allDisplays
{
  return +[_SBAllDisplaysPredicate sharedInstance](_SBAllDisplaysPredicate, "sharedInstance");
}

+ (id)forDisplaysSimilarToDisplay:(id)a3 useNativeSize:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  _SBDisplaysWithSizePredicate *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[_SBDisplaysWithSizePredicate initWithDisplay:useNativeSize:]([_SBDisplaysWithSizePredicate alloc], "initWithDisplay:useNativeSize:", v5, v4);

  return v6;
}

+ (id)forDisplay:(id)a3
{
  id v3;
  _SBDisplayPredicate *v4;

  v3 = a3;
  v4 = -[_SBDisplayPredicate initWithDisplay:]([_SBDisplayPredicate alloc], "initWithDisplay:", v3);

  return v4;
}

- (BOOL)matchesDisplay:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayModePredicate.m"), 56, CFSTR("must be overridden"));

  return 0;
}

+ (id)fromDefaultsKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[_SBAllDisplaysPredicate fromDefaultsKey:](_SBAllDisplaysPredicate, "fromDefaultsKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[_SBDisplayPredicate fromDefaultsKey:](_SBDisplayPredicate, "fromDefaultsKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[_SBDisplaysWithSizePredicate fromDefaultsKey:](_SBDisplaysWithSizePredicate, "fromDefaultsKey:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v4;
}

- (id)defaultsKeyRepresentation
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayModePredicate.m"), 74, CFSTR("must be overridden"));

  return &stru_1E2010FC0;
}

- (id)description
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayModePredicate.m"), 79, CFSTR("invalid predicate"));

  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> [invalid]"), objc_opt_class(), self);
}

@end
