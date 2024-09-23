@implementation RBSProcessInstancePredicate

- (RBSProcessInstancePredicate)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessInstancePredicate *v5;
  uint64_t v6;
  RBSProcessIdentifier *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBSProcessInstancePredicate;
  v5 = -[RBSProcessInstancePredicate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->super._identifier;
    v5->super._identifier = (RBSProcessIdentifier *)v6;

  }
  return v5;
}

@end
