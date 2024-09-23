@implementation VUICollectionChangeSet

- (NSArray)updateChanges
{
  return self->_updateChanges;
}

- (void)setUpdateChanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setMoveChanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setInsertChange:(id)a3
{
  objc_storeStrong((id *)&self->_insertChange, a3);
}

- (void)setDeleteChange:(id)a3
{
  objc_storeStrong((id *)&self->_deleteChange, a3);
}

- (NSArray)moveChanges
{
  return self->_moveChanges;
}

- (VUICollectionChange)insertChange
{
  return self->_insertChange;
}

- (BOOL)hasChanges
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[VUICollectionChangeSet deleteChange](self, "deleteChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[VUICollectionChangeSet insertChange](self, "insertChange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[VUICollectionChangeSet moveChanges](self, "moveChanges");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        v4 = 1;
      }
      else
      {
        -[VUICollectionChangeSet updateChanges](self, "updateChanges");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "count") != 0;

      }
    }

  }
  return v4;
}

- (VUICollectionChange)deleteChange
{
  return self->_deleteChange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateChanges, 0);
  objc_storeStrong((id *)&self->_moveChanges, 0);
  objc_storeStrong((id *)&self->_insertChange, 0);
  objc_storeStrong((id *)&self->_deleteChange, 0);
}

- (BOOL)containsOnlyChangeKind:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[VUICollectionChangeSet _changesKinds](self, "_changesKinds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24.receiver = self;
  v24.super_class = (Class)VUICollectionChangeSet;
  -[VUICollectionChangeSet description](&v24, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  VUIBoolLogString(-[VUICollectionChangeSet hasChanges](self, "hasChanges"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("hasChanges"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUICollectionChangeSet deleteChange](self, "deleteChange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("deleteChange"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[VUICollectionChangeSet insertChange](self, "insertChange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("insertChange"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[VUICollectionChangeSet moveChanges](self, "moveChanges");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("moveChanges"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v17 = (void *)MEMORY[0x1E0CB3940];
  -[VUICollectionChangeSet updateChanges](self, "updateChanges");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("updateChanges"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  v20 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@>"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)_changesKinds
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VUICollectionChangeSet deleteChange](self, "deleteChange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v3, "addObject:", &unk_1E9F3E008);
  -[VUICollectionChangeSet insertChange](self, "insertChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "addObject:", &unk_1E9F3E020);
  -[VUICollectionChangeSet moveChanges](self, "moveChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    objc_msgSend(v3, "addObject:", &unk_1E9F3E038);
  -[VUICollectionChangeSet updateChanges](self, "updateChanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
    objc_msgSend(v3, "addObject:", &unk_1E9F3E050);
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

@end
