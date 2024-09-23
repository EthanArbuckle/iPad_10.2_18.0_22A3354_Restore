@implementation SiriCoreSQLiteIndexDescription

- (SiriCoreSQLiteIndexDescription)initWithName:(id)a3 tableName:(id)a4 columnNames:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  SiriCoreSQLiteIndexDescription *v13;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSString *tableName;
  uint64_t v18;
  NSArray *columnNames;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SiriCoreSQLiteIndexDescription;
  v13 = -[SiriCoreSQLiteIndexDescription init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    name = v13->_name;
    v13->_name = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    tableName = v13->_tableName;
    v13->_tableName = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    columnNames = v13->_columnNames;
    v13->_columnNames = (NSArray *)v18;

    v13->_options = a6;
  }

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
