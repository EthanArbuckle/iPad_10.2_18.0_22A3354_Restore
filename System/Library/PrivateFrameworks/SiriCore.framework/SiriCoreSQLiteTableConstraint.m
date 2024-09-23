@implementation SiriCoreSQLiteTableConstraint

- (SiriCoreSQLiteTableConstraint)initWithName:(id)a3 type:(int64_t)a4 columnNames:(id)a5
{
  id v8;
  id v9;
  SiriCoreSQLiteTableConstraint *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSArray *columnNames;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SiriCoreSQLiteTableConstraint;
  v10 = -[SiriCoreSQLiteTableConstraint init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v10->_type = a4;
    v13 = objc_msgSend(v9, "copy");
    columnNames = v10->_columnNames;
    v10->_columnNames = (NSArray *)v13;

  }
  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)primaryKeyTableConstraintWithName:(id)a3 columnNames:(id)a4
{
  id v5;
  id v6;
  SiriCoreSQLiteTableConstraint *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SiriCoreSQLiteTableConstraint initWithName:type:columnNames:]([SiriCoreSQLiteTableConstraint alloc], "initWithName:type:columnNames:", v6, 1, v5);

  return v7;
}

+ (id)uniqueTableConstraintWithName:(id)a3 columnNames:(id)a4
{
  id v5;
  id v6;
  SiriCoreSQLiteTableConstraint *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SiriCoreSQLiteTableConstraint initWithName:type:columnNames:]([SiriCoreSQLiteTableConstraint alloc], "initWithName:type:columnNames:", v6, 2, v5);

  return v7;
}

@end
