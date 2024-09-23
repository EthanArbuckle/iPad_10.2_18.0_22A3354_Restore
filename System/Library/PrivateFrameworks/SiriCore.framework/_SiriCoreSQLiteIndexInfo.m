@implementation _SiriCoreSQLiteIndexInfo

- (_SiriCoreSQLiteIndexInfo)initWithName:(id)a3 columns:(id)a4
{
  id v6;
  id v7;
  _SiriCoreSQLiteIndexInfo *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSArray *columns;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SiriCoreSQLiteIndexInfo;
  v8 = -[_SiriCoreSQLiteIndexInfo init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    columns = v8->_columns;
    v8->_columns = (NSArray *)v11;

  }
  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)columns
{
  return self->_columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
