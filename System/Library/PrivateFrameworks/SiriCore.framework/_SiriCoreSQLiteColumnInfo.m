@implementation _SiriCoreSQLiteColumnInfo

- (_SiriCoreSQLiteColumnInfo)initWithIdentifier:(int64_t)a3 name:(id)a4 type:(id)a5 isPrimaryKey:(BOOL)a6 isNotNull:(BOOL)a7 defaultValue:(id)a8
{
  id v14;
  id v15;
  id v16;
  _SiriCoreSQLiteColumnInfo *v17;
  _SiriCoreSQLiteColumnInfo *v18;
  uint64_t v19;
  NSString *name;
  uint64_t v21;
  NSString *type;
  uint64_t v23;
  SiriCoreSQLiteValue *defaultValue;
  objc_super v26;

  v14 = a4;
  v15 = a5;
  v16 = a8;
  v26.receiver = self;
  v26.super_class = (Class)_SiriCoreSQLiteColumnInfo;
  v17 = -[_SiriCoreSQLiteColumnInfo init](&v26, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_identifier = a3;
    v19 = objc_msgSend(v14, "copy");
    name = v18->_name;
    v18->_name = (NSString *)v19;

    v21 = objc_msgSend(v15, "copy");
    type = v18->_type;
    v18->_type = (NSString *)v21;

    v18->_isPrimaryKey = a6;
    v18->_isNotNull = a7;
    v23 = objc_msgSend(v16, "copy");
    defaultValue = v18->_defaultValue;
    v18->_defaultValue = (SiriCoreSQLiteValue *)v23;

  }
  return v18;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)type
{
  return self->_type;
}

- (BOOL)isPrimaryKey
{
  return self->_isPrimaryKey;
}

- (BOOL)isNotNull
{
  return self->_isNotNull;
}

- (SiriCoreSQLiteValue)defaultValue
{
  return self->_defaultValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
