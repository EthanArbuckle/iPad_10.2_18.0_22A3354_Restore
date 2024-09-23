@implementation TRILockedFactorPackSet

- (NSString)path
{
  return self->_path;
}

- (TRILockedFactorPackSet)initWithFactorPackSetId:(id)a3 path:(id)a4 lock:(id)a5
{
  id v10;
  id v11;
  id v12;
  TRILockedFactorPackSet *v13;
  TRILockedFactorPackSet *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 1678, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path != nil"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 1677, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId != nil"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 1679, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lock != nil"));

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)TRILockedFactorPackSet;
  v13 = -[TRILockedFactorPackSet init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_factorPackSetId, a3);
    objc_storeStrong((id *)&v14->_path, a4);
    objc_storeStrong((id *)&v14->_lock, a5);
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
}

+ (id)lockedSetWithFactorPackSetId:(id)a3 path:(id)a4 lock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFactorPackSetId:path:lock:", v10, v9, v8);

  return v11;
}

- (id)copyWithReplacementFactorPackSetId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorPackSetId:path:lock:", v4, self->_path, self->_lock);

  return v5;
}

- (id)copyWithReplacementPath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorPackSetId:path:lock:", self->_factorPackSetId, v4, self->_lock);

  return v5;
}

- (id)copyWithReplacementLock:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorPackSetId:path:lock:", self->_factorPackSetId, self->_path, v4);

  return v5;
}

- (BOOL)isEqualToLockedSet:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIFactorPackSetId *factorPackSetId;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *path;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  TRIReferenceManagedDirReaderLock *lock;
  void *v22;
  char v23;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_11;
  v6 = self->_factorPackSetId != 0;
  objc_msgSend(v4, "factorPackSetId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_11;
  factorPackSetId = self->_factorPackSetId;
  if (factorPackSetId)
  {
    objc_msgSend(v5, "factorPackSetId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIFactorPackSetId isEqual:](factorPackSetId, "isEqual:", v10);

    if (!v11)
      goto LABEL_11;
  }
  v12 = self->_path != 0;
  objc_msgSend(v5, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_11;
  path = self->_path;
  if (path)
  {
    objc_msgSend(v5, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqual:](path, "isEqual:", v16);

    if (!v17)
      goto LABEL_11;
  }
  v18 = self->_lock != 0;
  objc_msgSend(v5, "lock");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    v23 = 0;
  }
  else
  {
    lock = self->_lock;
    if (lock)
    {
      objc_msgSend(v5, "lock");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[TRIReferenceManagedDirReaderLock isEqual:](lock, "isEqual:", v22);

    }
    else
    {
      v23 = 1;
    }
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  TRILockedFactorPackSet *v4;
  TRILockedFactorPackSet *v5;
  BOOL v6;

  v4 = (TRILockedFactorPackSet *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRILockedFactorPackSet isEqualToLockedSet:](self, "isEqualToLockedSet:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = -[TRIFactorPackSetId hash](self->_factorPackSetId, "hash");
  v4 = -[NSString hash](self->_path, "hash") - v3 + 32 * v3;
  return -[TRIReferenceManagedDirReaderLock hash](self->_lock, "hash") - v4 + 32 * v4;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRILockedFactorPackSet | factorPackSetId:%@ path:%@ lock:%@>"), self->_factorPackSetId, self->_path, self->_lock);
}

- (TRIFactorPackSetId)factorPackSetId
{
  return self->_factorPackSetId;
}

- (TRIReferenceManagedDirReaderLock)lock
{
  return self->_lock;
}

@end
