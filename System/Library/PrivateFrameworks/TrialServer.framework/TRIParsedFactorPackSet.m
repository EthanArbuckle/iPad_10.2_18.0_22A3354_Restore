@implementation TRIParsedFactorPackSet

- (TRIParsedFactorPackSet)initWithIdent:(id)a3 packs:(id)a4
{
  id v8;
  id v9;
  void *v10;
  TRIParsedFactorPackSet *v11;
  TRIParsedFactorPackSet *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1627, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ident != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1628, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("packs != nil"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIParsedFactorPackSet;
  v11 = -[TRIParsedFactorPackSet init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_ident, a3);
    objc_storeStrong((id *)&v12->_packs, a4);
  }

  return v12;
}

+ (id)setWithIdent:(id)a3 packs:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdent:packs:", v7, v6);

  return v8;
}

- (id)copyWithReplacementIdent:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdent:packs:", v4, self->_packs);

  return v5;
}

- (id)copyWithReplacementPacks:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdent:packs:", self->_ident, v4);

  return v5;
}

- (BOOL)isEqualToSet:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIFactorPackSetId *ident;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSArray *packs;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_ident != 0;
  objc_msgSend(v4, "ident");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  ident = self->_ident;
  if (ident)
  {
    objc_msgSend(v5, "ident");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIFactorPackSetId isEqual:](ident, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_packs != 0;
  objc_msgSend(v5, "packs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    packs = self->_packs;
    if (packs)
    {
      objc_msgSend(v5, "packs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSArray isEqual:](packs, "isEqual:", v16);

    }
    else
    {
      v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  TRIParsedFactorPackSet *v4;
  TRIParsedFactorPackSet *v5;
  BOOL v6;

  v4 = (TRIParsedFactorPackSet *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIParsedFactorPackSet isEqualToSet:](self, "isEqualToSet:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[TRIFactorPackSetId hash](self->_ident, "hash");
  return -[NSArray hash](self->_packs, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIParsedFactorPackSet | ident:%@ packs:%@>"), self->_ident, self->_packs);
}

- (TRIFactorPackSetId)ident
{
  return self->_ident;
}

- (NSArray)packs
{
  return self->_packs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packs, 0);
  objc_storeStrong((id *)&self->_ident, 0);
}

@end
