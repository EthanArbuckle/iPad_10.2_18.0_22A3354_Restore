@implementation SBHSetDiff

+ (id)diffFromSet:(id)a3 toSet:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0C99E20];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "setWithSet:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v7);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v6);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v8);
  objc_msgSend(v10, "minusSet:", v9);
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithFromSet:toSet:additions:deletions:updates:", v7, v6, v8, v9, v10);

  return v11;
}

- (id)_initWithFromSet:(id)a3 toSet:(id)a4 additions:(id)a5 deletions:(id)a6 updates:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SBHSetDiff *v17;
  id *p_isa;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SBHSetDiff;
  v17 = -[SBHSetDiff init](&v21, sel_init);
  p_isa = (id *)&v17->super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fromSet, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
  }

  return p_isa;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SBHSetDiff fromSet](self, "fromSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SBHSetDiff *v4;
  SBHSetDiff *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (SBHSetDiff *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SBHSetDiff fromSet](v5, "fromSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHSetDiff fromSet](self, "fromSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[SBHSetDiff fromSet](v5, "fromSet");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHSetDiff fromSet](self, "fromSet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      -[SBHSetDiff toSet](v5, "toSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHSetDiff toSet](self, "toSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == v13)
      {
        v11 = v10 != 0;
      }
      else
      {
        -[SBHSetDiff toSet](v5, "toSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHSetDiff toSet](self, "toSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);
        if (v10)
          v11 = v16;
        else
          v11 = 0;

      }
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHSetDiff fromSet](self, "fromSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("fromSet"));

  -[SBHSetDiff toSet](self, "toSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("toSet"));

  -[SBHSetDiff additions](self, "additions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("additions"));

  -[SBHSetDiff deletions](self, "deletions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("deletions"));

  -[SBHSetDiff updates](self, "updates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:", v12, CFSTR("updates"));

  objc_msgSend(v3, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSSet)additions
{
  return self->_additions;
}

- (NSSet)deletions
{
  return self->_deletions;
}

- (NSSet)updates
{
  return self->_updates;
}

- (NSSet)fromSet
{
  return self->_fromSet;
}

- (NSSet)toSet
{
  return self->_toSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_deletions, 0);
  objc_storeStrong((id *)&self->_additions, 0);
  objc_storeStrong((id *)&self->_toSet, 0);
  objc_storeStrong((id *)&self->_fromSet, 0);
}

@end
