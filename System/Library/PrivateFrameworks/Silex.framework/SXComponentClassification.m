@implementation SXComponentClassification

+ (id)classificationForComponentWithType:(id)a3
{
  return +[SXComponentClassification classificationForClass:]((uint64_t)a1, (objc_class *)(id)objc_msgSend((id)__defaultClassificationsByType, "objectForKey:", a3));
}

+ (id)classificationForComponentWithType:(id)a3 role:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6
    || !v7
    || (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v6, v7),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = (objc_class *)(id)objc_msgSend((id)__classificationClasses, "objectForKey:", v9), v9, !v10))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v6, SXComponentClassificationUnknownRoleString);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)(id)objc_msgSend((id)__classificationClasses, "objectForKey:", v11);

  }
  +[SXComponentClassification classificationForClass:]((uint64_t)a1, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)classificationForClass:(uint64_t)a1
{
  void *v3;
  id v4;

  objc_opt_self();
  if (!a2)
    a2 = (objc_class *)objc_opt_class();
  NSStringFromClass(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  objc_msgSend((id)__classifications, "objectForKey:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&__unfairLock);
  if (!v4)
  {
    v4 = objc_alloc_init(a2);
    os_unfair_lock_lock_with_options();
    objc_msgSend((id)__classifications, "setObject:forKey:", v4, v3);
    os_unfair_lock_unlock((os_unfair_lock_t)&__unfairLock);
  }

  return v4;
}

- (void)setupStyleIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *defaultStyleIdentifiers;
  __CFString *v13;

  objc_msgSend((id)objc_opt_class(), "roleString");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "typeString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithObject:", CFSTR("default"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && v3 != (void *)SXComponentClassificationUnknownTypeString)
  {
    SXDefaultComponentStyleIdentifierForRole((uint64_t)v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SXDefaultComponentStyleIdentifierForRole((uint64_t)v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  if (v13 && v13 != SXComponentClassificationUnknownRoleString)
  {
    SXDefaultComponentStyleIdentifierForRole((uint64_t)v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    -[__CFString stringByReplacingOccurrencesOfString:withString:](v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SXDefaultComponentStyleIdentifierForRole((uint64_t)v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

  }
  objc_msgSend(v4, "array");
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  defaultStyleIdentifiers = self->_defaultStyleIdentifiers;
  self->_defaultStyleIdentifiers = v11;

}

+ (void)registerClassification
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a1, "typeString");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "roleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "role");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v8, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__classificationClasses, "setObject:forKey:", a1, v5);
  if ((_DWORD)v4)
  {
    v6 = (void *)__classificationClassesByRole;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", a1, v7);

  }
  else
  {
    objc_msgSend((id)__defaultClassificationsByType, "setObject:forKey:", a1, v8);
  }

}

- (SXComponentClassification)init
{
  SXComponentClassification *v2;
  SXComponentClassification *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXComponentClassification;
  v2 = -[SXComponentClassification init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SXComponentClassification setupStyleIdentifiers](v2, "setupStyleIdentifiers");
  return v3;
}

+ (int)role
{
  return 0;
}

+ (id)roleString
{
  return SXComponentClassificationUnknownRoleString;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)__classificationClasses;
    __classificationClasses = v2;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)__classificationClassesByRole;
    __classificationClassesByRole = v4;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)__defaultClassificationsByType;
    __defaultClassificationsByType = v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)__classifications;
    __classifications = v8;

    __unfairLock = 0;
    +[SXComponentClassificationRegister registerClasses](SXComponentClassificationRegister, "registerClasses");
  }
}

+ (id)classificationForComponentWithRole:(int)a3
{
  void *v4;
  void *v5;
  objc_class *v6;

  if (!a3)
    return 0;
  v4 = (void *)__classificationClassesByRole;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)(id)objc_msgSend(v4, "objectForKey:", v5);

  +[SXComponentClassification classificationForClass:]((uint64_t)a1, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)shouldRegister
{
  return 1;
}

+ (id)typeString
{
  return (id)SXComponentClassificationUnknownTypeString;
}

- (id)accessibilityContextualLabel
{
  return 0;
}

- (id)accessibilityCustomRotorMembership
{
  return 0;
}

- (BOOL)accessibilitySkippedDuringReadAll
{
  return 1;
}

- (SXComponentLayoutRules)layoutRules
{
  return (SXComponentLayoutRules *)+[SXComponentLayoutRules defaultLayoutRules](SXComponentLayoutRules, "defaultLayoutRules");
}

- (SXComponentTextRules)textRules
{
  return (SXComponentTextRules *)+[SXComponentTextRules defaultTextRules](SXComponentTextRules, "defaultTextRules");
}

- (NSArray)defaultTextStyleIdentifiers
{
  return self->_defaultStyleIdentifiers;
}

- (NSArray)defaultComponentStyleIdentifiers
{
  return self->_defaultStyleIdentifiers;
}

- (unint64_t)contentRelevance
{
  void *v2;
  _BOOL4 v3;

  -[SXComponentClassification textRules](self, "textRules");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "textFlow") == 1;

  return 2 * v3;
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4
{
  return 0;
}

- (BOOL)isCollapsible
{
  return 0;
}

- (NSArray)defaultStyleIdentifiers
{
  return self->_defaultStyleIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultStyleIdentifiers, 0);
  objc_storeStrong((id *)&self->_textRules, 0);
  objc_storeStrong((id *)&self->_layoutRules, 0);
}

@end
