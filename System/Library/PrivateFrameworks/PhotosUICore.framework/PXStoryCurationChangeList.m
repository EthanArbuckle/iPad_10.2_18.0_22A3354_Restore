@implementation PXStoryCurationChangeList

- (PXStoryCurationChangeList)init
{
  return -[PXStoryCurationChangeList initWithPromotedIdentifiers:demotedIdentifiers:](self, "initWithPromotedIdentifiers:demotedIdentifiers:", 0, 0);
}

- (PXStoryCurationChangeList)initWithPromotedIdentifiers:(id)a3 demotedIdentifiers:(id)a4
{
  id v6;
  id v7;
  PXStoryCurationChangeList *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *promotedIdentifiers;
  void *v13;
  void *v14;
  NSSet *v15;
  NSSet *demotedIdentifiers;
  BOOL v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryCurationChangeList;
  v8 = -[PXStoryCurationChangeList init](&v19, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    promotedIdentifiers = v8->_promotedIdentifiers;
    v8->_promotedIdentifiers = v11;

    v13 = (void *)objc_msgSend(v7, "copy");
    v14 = v13;
    if (v13)
      v15 = v13;
    else
      v15 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    demotedIdentifiers = v8->_demotedIdentifiers;
    v8->_demotedIdentifiers = v15;

    if (-[NSSet count](v8->_promotedIdentifiers, "count"))
      v17 = 1;
    else
      v17 = -[NSSet count](v8->_demotedIdentifiers, "count") != 0;
    v8->_hasAnyChange = v17;
  }

  return v8;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryCurationChangeList promotedIdentifiers](self, "promotedIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryCurationChangeList demotedIdentifiers](self, "demotedIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p, promoted: %@, demoted: %@>"), v5, self, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PXStoryCurationChangeList *v4;
  PXStoryCurationChangeList *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (PXStoryCurationChangeList *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXStoryCurationChangeList promotedIdentifiers](self, "promotedIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryCurationChangeList promotedIdentifiers](v5, "promotedIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToSet:", v7))
      {
        -[PXStoryCurationChangeList demotedIdentifiers](self, "demotedIdentifiers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryCurationChangeList demotedIdentifiers](v5, "demotedIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToSet:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PXStoryCurationChangeList promotedIdentifiers](self, "promotedIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[PXStoryCurationChangeList demotedIdentifiers](self, "demotedIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ (2 * objc_msgSend(v5, "hash"));

  return v6;
}

- (id)changeListByPromotingIdentifiers:(id)a3
{
  id v4;
  PXStoryCurationChangeList *v5;
  void *v6;
  PXStoryCurationChangeList *v7;
  void *v8;

  v4 = a3;
  v5 = [PXStoryCurationChangeList alloc];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);

  v7 = -[PXStoryCurationChangeList initWithPromotedIdentifiers:demotedIdentifiers:](v5, "initWithPromotedIdentifiers:demotedIdentifiers:", v6, 0);
  -[PXStoryCurationChangeList changeListByApplyingChangeList:](self, "changeListByApplyingChangeList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)changeListByDemotingIdentifiers:(id)a3
{
  id v4;
  PXStoryCurationChangeList *v5;
  void *v6;
  PXStoryCurationChangeList *v7;
  void *v8;

  v4 = a3;
  v5 = [PXStoryCurationChangeList alloc];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);

  v7 = -[PXStoryCurationChangeList initWithPromotedIdentifiers:demotedIdentifiers:](v5, "initWithPromotedIdentifiers:demotedIdentifiers:", 0, v6);
  -[PXStoryCurationChangeList changeListByApplyingChangeList:](self, "changeListByApplyingChangeList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)changeListByApplyingChangeList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[PXStoryCurationChangeList promotedIdentifiers](self, "promotedIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[PXStoryCurationChangeList demotedIdentifiers](self, "demotedIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v4, "promotedIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v9);

  objc_msgSend(v4, "demotedIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minusSet:", v10);

  objc_msgSend(v4, "promotedIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v11);

  objc_msgSend(v4, "demotedIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "unionSet:", v12);
  v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPromotedIdentifiers:demotedIdentifiers:", v6, v8);

  return v13;
}

- (BOOL)hasAnyChange
{
  return self->_hasAnyChange;
}

- (NSSet)promotedIdentifiers
{
  return self->_promotedIdentifiers;
}

- (NSSet)demotedIdentifiers
{
  return self->_demotedIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demotedIdentifiers, 0);
  objc_storeStrong((id *)&self->_promotedIdentifiers, 0);
}

+ (id)changeListByCombiningChangeList:(id)a3 withChangeList:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v5, "changeListByApplyingChangeList:", v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v5;
    }
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;

  return v9;
}

@end
