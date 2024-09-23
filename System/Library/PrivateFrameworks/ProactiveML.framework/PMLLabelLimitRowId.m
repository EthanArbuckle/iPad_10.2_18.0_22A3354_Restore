@implementation PMLLabelLimitRowId

- (PMLLabelLimitRowId)initWithLabel:(id)a3 limit:(int64_t)a4 rowId:(int64_t)a5
{
  id v10;
  PMLLabelLimitRowId *v11;
  PMLLabelLimitRowId *v12;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v10 = a3;
  if (v10)
  {
    if ((a4 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLLabelLimitRowId.m"), 11, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("limit >= 0"));

    if ((a5 & 0x8000000000000000) == 0)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLLabelLimitRowId.m"), 10, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("label"));

  if (a4 < 0)
    goto LABEL_8;
LABEL_3:
  if ((a5 & 0x8000000000000000) == 0)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLLabelLimitRowId.m"), 12, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rowId >= 0"));

LABEL_4:
  v17.receiver = self;
  v17.super_class = (Class)PMLLabelLimitRowId;
  v11 = -[PMLLabelLimitRowId init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_label, a3);
    v12->_limit = a4;
    v12->_rowId = a5;
  }

  return v12;
}

- (BOOL)isEqualToLabelLimitRowId:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *label;
  void *v10;
  int v11;
  int64_t limit;
  int64_t rowId;
  BOOL v14;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  v6 = self->_label != 0;
  objc_msgSend(v4, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_7;
  label = self->_label;
  if (label)
  {
    objc_msgSend(v5, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](label, "isEqual:", v10);

    if (!v11)
      goto LABEL_7;
  }
  limit = self->_limit;
  if (limit == objc_msgSend(v5, "limit"))
  {
    rowId = self->_rowId;
    v14 = rowId == objc_msgSend(v5, "rowId");
  }
  else
  {
LABEL_7:
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  PMLLabelLimitRowId *v4;
  PMLLabelLimitRowId *v5;
  BOOL v6;

  v4 = (PMLLabelLimitRowId *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PMLLabelLimitRowId isEqualToLabelLimitRowId:](self, "isEqualToLabelLimitRowId:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_label, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_limit);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") - v3 + 32 * v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_rowId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") - v5 + 32 * v5;

  return v7;
}

- (NSString)label
{
  return self->_label;
}

- (int64_t)limit
{
  return self->_limit;
}

- (int64_t)rowId
{
  return self->_rowId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

+ (id)labelLimitRowIdWithLabel:(id)a3 limit:(int64_t)a4 rowId:(int64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLabel:limit:rowId:", v8, a4, a5);

  return v9;
}

@end
