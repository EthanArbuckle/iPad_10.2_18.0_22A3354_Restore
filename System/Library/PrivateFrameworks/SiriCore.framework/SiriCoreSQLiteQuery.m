@implementation SiriCoreSQLiteQuery

- (unint64_t)options
{
  return self->_options;
}

- (SiriCoreSQLiteQuery)initWithString:(id)a3 statement:(id)a4 parameters:(id)a5 recordBuilder:(id)a6 options:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SiriCoreSQLiteQuery *v16;
  uint64_t v17;
  NSString *string;
  uint64_t v19;
  NSArray *parameters;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SiriCoreSQLiteQuery;
  v16 = -[SiriCoreSQLiteQuery init](&v22, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    string = v16->_string;
    v16->_string = (NSString *)v17;

    objc_storeStrong((id *)&v16->_statement, a4);
    v19 = objc_msgSend(v14, "copy");
    parameters = v16->_parameters;
    v16->_parameters = (NSArray *)v19;

    objc_storeStrong((id *)&v16->_recordBuilder, a6);
    v16->_options = a7;
  }

  return v16;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordBuilder, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_statement, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

- (SiriCoreSQLiteStatement)statement
{
  return self->_statement;
}

- (SiriCoreSQLiteRecordBuilder)recordBuilder
{
  return self->_recordBuilder;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *string;
  NSArray *parameters;
  unint64_t options;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v15.receiver = self;
  v15.super_class = (Class)SiriCoreSQLiteQuery;
  -[SiriCoreSQLiteQuery description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  string = self->_string;
  parameters = self->_parameters;
  options = self->_options;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = v8;
  if ((options & 2) != 0)
  {
    objc_msgSend(v8, "addObject:", CFSTR("includesColumnNameTuple"));
    if ((options & 4) == 0)
    {
LABEL_3:
      if ((options & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((options & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v9, "addObject:", CFSTR("includesColumnValueTuples"));
  if ((options & 8) == 0)
  {
LABEL_4:
    if ((options & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v9, "addObject:", CFSTR("includesColumnValuesMap"));
  if ((options & 0x10) == 0)
  {
LABEL_5:
    if ((options & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v9, "addObject:", CFSTR("includesRowValueTuples"));
  if ((options & 0x20) == 0)
  {
LABEL_6:
    if ((options & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_14:
  objc_msgSend(v9, "addObject:", CFSTR("includesRowValueMaps"));
  if ((options & 0x40) != 0)
LABEL_7:
    objc_msgSend(v9, "addObject:", CFSTR("includesRecords"));
LABEL_8:
  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("|"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("(%@)"), v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = CFSTR("0");
  }

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {string = %@, parameters = %@, options = %@}"), v4, string, parameters, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)string
{
  return self->_string;
}

@end
