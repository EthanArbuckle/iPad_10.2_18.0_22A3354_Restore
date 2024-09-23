@implementation PPSSQLiteEntity

- (PPSSQLiteEntity)initWithTableNames:(id)a3
{
  id v4;
  PPSSQLiteEntity *v5;
  uint64_t v6;
  NSArray *tableNames;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPSSQLiteEntity;
  v5 = -[PPSSQLiteEntity init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    tableNames = v5->_tableNames;
    v5->_tableNames = (NSArray *)v6;

  }
  return v5;
}

- (id)disambiguatedSQLForProperty:(id)a3 shouldEscape:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  v7 = CFSTR("%@");
  if (v4 && !objc_msgSend(v5, "isEqualToString:", CFSTR("*")))
    v7 = CFSTR("\"%@\");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)joinClause
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PPSSQLiteEntity tableNames](self, "tableNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 2)
  {
    v9 = 0;
  }
  else
  {
    -[PPSSQLiteEntity tableNames](self, "tableNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PPSSQLiteEntity tableNames](self, "tableNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("INNER JOIN '%@' ON '%@'.%@ = '%@'.%@"), v8, v6, CFSTR("ID"), v8, CFSTR("FK_ID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPSSQLiteEntity;
  if (-[PPSSQLiteEntity isEqual:](&v9, sel_isEqual_, v4))
  {
    -[PPSSQLiteEntity tableNames](self, "tableNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToArray:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PPSSQLiteEntity;
  v3 = -[PPSSQLiteEntity hash](&v7, sel_hash);
  -[PPSSQLiteEntity tableNames](self, "tableNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)v3 + objc_msgSend(v4, "hash");

  return v5;
}

- (NSArray)tableNames
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableNames, 0);
}

@end
