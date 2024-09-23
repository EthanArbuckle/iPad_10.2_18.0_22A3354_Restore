@implementation RBSInheritanceChangeSet

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSInheritanceChangeSet)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSInheritanceChangeSet *v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *gainedInheritances;
  uint64_t v9;
  uint64_t v10;
  NSSet *lostInheritances;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RBSInheritanceChangeSet;
  v5 = -[RBSInheritanceChangeSet init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_opt_class(), CFSTR("gainedInheritances"));
    v7 = objc_claimAutoreleasedReturnValue();
    gainedInheritances = v5->_gainedInheritances;
    v5->_gainedInheritances = (NSSet *)v7;

    v9 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v9, objc_opt_class(), CFSTR("lostInheritances"));
    v10 = objc_claimAutoreleasedReturnValue();
    lostInheritances = v5->_lostInheritances;
    v5->_lostInheritances = (NSSet *)v10;

  }
  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSSet count](self->_gainedInheritances, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_gainedInheritances, CFSTR("gainedInheritances"));
  if (-[NSSet count](self->_lostInheritances, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_lostInheritances, CFSTR("lostInheritances"));

}

- (NSSet)gainedInheritances
{
  return self->_gainedInheritances;
}

- (NSSet)lostInheritances
{
  return self->_lostInheritances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lostInheritances, 0);
  objc_storeStrong((id *)&self->_gainedInheritances, 0);
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| gained:%@ lost:%@>"), v4, self->_gainedInheritances, self->_lostInheritances);

  return (NSString *)v5;
}

- (RBSInheritanceChangeSet)initWithGainedInheritances:(id)a3 lostInheritances:(id)a4
{
  id v6;
  id v7;
  RBSInheritanceChangeSet *v8;
  uint64_t v9;
  NSSet *gainedInheritances;
  uint64_t v11;
  NSSet *lostInheritances;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RBSInheritanceChangeSet;
  v8 = -[RBSInheritanceChangeSet init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    gainedInheritances = v8->_gainedInheritances;
    v8->_gainedInheritances = (NSSet *)v9;

    v11 = objc_msgSend(v7, "copy");
    lostInheritances = v8->_lostInheritances;
    v8->_lostInheritances = (NSSet *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  RBSInheritanceChangeSet *v4;
  uint64_t v5;
  char v6;
  NSSet *gainedInheritances;
  const __CFSet *v8;
  CFIndex Count;
  NSSet *lostInheritances;
  const __CFSet *v11;
  CFIndex v12;

  v4 = (RBSInheritanceChangeSet *)a3;
  if (self == v4)
    goto LABEL_14;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
LABEL_3:
    v6 = 0;
    goto LABEL_15;
  }
  gainedInheritances = self->_gainedInheritances;
  v8 = (const __CFSet *)v4->_gainedInheritances;
  if (gainedInheritances != (NSSet *)v8)
  {
    v6 = 0;
    if (!gainedInheritances || !v8)
      goto LABEL_15;
    Count = CFSetGetCount((CFSetRef)self->_gainedInheritances);
    if (Count != CFSetGetCount(v8) || !-[NSSet isEqualToSet:](gainedInheritances, "isEqualToSet:", v8))
      goto LABEL_3;
  }
  lostInheritances = self->_lostInheritances;
  v11 = (const __CFSet *)v4->_lostInheritances;
  if (lostInheritances == (NSSet *)v11)
  {
LABEL_14:
    v6 = 1;
    goto LABEL_15;
  }
  v6 = 0;
  if (lostInheritances && v11)
  {
    v12 = CFSetGetCount((CFSetRef)lostInheritances);
    if (v12 == CFSetGetCount(v11))
    {
      v6 = -[NSSet isEqualToSet:](lostInheritances, "isEqualToSet:", v11);
      goto LABEL_15;
    }
    goto LABEL_3;
  }
LABEL_15:

  return v6;
}

@end
