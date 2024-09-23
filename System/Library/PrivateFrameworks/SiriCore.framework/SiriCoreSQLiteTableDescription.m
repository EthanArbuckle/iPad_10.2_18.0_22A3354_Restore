@implementation SiriCoreSQLiteTableDescription

- (SiriCoreSQLiteTableDescription)initWithName:(id)a3 columns:(id)a4 constraints:(id)a5
{
  id v8;
  id v9;
  id v10;
  SiriCoreSQLiteTableDescription *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSArray *columns;
  uint64_t v16;
  NSArray *constraints;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SiriCoreSQLiteTableDescription;
  v11 = -[SiriCoreSQLiteTableDescription init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    columns = v11->_columns;
    v11->_columns = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    constraints = v11->_constraints;
    v11->_constraints = (NSArray *)v16;

  }
  return v11;
}

- (SiriCoreSQLiteTableDescription)initWithName:(id)a3 columnsProvider:(id)a4 constraintsProvider:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  SiriCoreSQLiteTableDescription *v14;

  v8 = a3;
  v9 = (void (**)(_QWORD))a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = v10;
  if (!v9)
  {
    v12 = 0;
    if (v10)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v9[2](v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_5;
LABEL_3:
  v11[2](v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v14 = -[SiriCoreSQLiteTableDescription initWithName:columns:constraints:](self, "initWithName:columns:constraints:", v8, v12, v13);

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)columns
{
  return self->_columns;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
