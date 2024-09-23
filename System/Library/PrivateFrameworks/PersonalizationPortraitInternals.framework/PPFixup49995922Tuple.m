@implementation PPFixup49995922Tuple

- (PPFixup49995922Tuple)initWithRowid:(int64_t)a3 record:(id)a4 dkUUID:(id)a5
{
  id v10;
  id v11;
  PPFixup49995922Tuple *v12;
  PPFixup49995922Tuple *v13;
  void *v15;
  objc_super v16;

  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPFixup49995922Tuple.m"), 11, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record"));

  }
  v16.receiver = self;
  v16.super_class = (Class)PPFixup49995922Tuple;
  v12 = -[PPFixup49995922Tuple init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_rowid = a3;
    objc_storeStrong((id *)&v12->_record, a4);
    objc_storeStrong((id *)&v13->_dkUUID, a5);
  }

  return v13;
}

- (BOOL)isEqualToTuple:(id)a3
{
  id v4;
  void *v5;
  int64_t rowid;
  int v7;
  void *v8;
  int v9;
  NSObject *record;
  void *v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  NSUUID *dkUUID;
  void *v17;
  char v18;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  rowid = self->_rowid;
  if (rowid != objc_msgSend(v4, "rowid"))
    goto LABEL_9;
  v7 = self->_record != 0;
  objc_msgSend(v5, "record");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v7 == v9)
    goto LABEL_9;
  record = self->_record;
  if (record)
  {
    objc_msgSend(v5, "record");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSObject isEqual:](record, "isEqual:", v11);

    if (!v12)
      goto LABEL_9;
  }
  v13 = self->_dkUUID != 0;
  objc_msgSend(v5, "dkUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v13 == v15)
  {
LABEL_9:
    v18 = 0;
  }
  else
  {
    dkUUID = self->_dkUUID;
    if (dkUUID)
    {
      objc_msgSend(v5, "dkUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[NSUUID isEqual:](dkUUID, "isEqual:", v17);

    }
    else
    {
      v18 = 1;
    }
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  PPFixup49995922Tuple *v4;
  PPFixup49995922Tuple *v5;
  BOOL v6;

  v4 = (PPFixup49995922Tuple *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPFixup49995922Tuple isEqualToTuple:](self, "isEqualToTuple:", v5);

  return v6;
}

- (unint64_t)hash
{
  int64_t rowid;
  uint64_t v4;

  rowid = self->_rowid;
  v4 = -[NSObject hash](self->_record, "hash") - rowid + 32 * rowid;
  return -[NSUUID hash](self->_dkUUID, "hash") - v4 + 32 * v4;
}

- (int64_t)rowid
{
  return self->_rowid;
}

- (NSObject)record
{
  return self->_record;
}

- (NSUUID)dkUUID
{
  return self->_dkUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dkUUID, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

+ (id)tupleWithRowid:(int64_t)a3 record:(id)a4 dkUUID:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRowid:record:dkUUID:", a3, v9, v8);

  return v10;
}

@end
