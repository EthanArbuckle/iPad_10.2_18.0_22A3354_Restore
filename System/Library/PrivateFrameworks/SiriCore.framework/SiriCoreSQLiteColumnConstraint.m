@implementation SiriCoreSQLiteColumnConstraint

- (SiriCoreSQLiteColumnConstraint)initWithName:(id)a3 type:(int64_t)a4 value:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  SiriCoreSQLiteColumnConstraint *v12;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  SiriCoreSQLiteValue *value;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SiriCoreSQLiteColumnConstraint;
  v12 = -[SiriCoreSQLiteColumnConstraint init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v12->_type = a4;
    v15 = objc_msgSend(v11, "copy");
    value = v12->_value;
    v12->_value = (SiriCoreSQLiteValue *)v15;

    v12->_options = a6;
  }

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)type
{
  return self->_type;
}

- (SiriCoreSQLiteValue)value
{
  return self->_value;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)primaryKeyColumnConstraintWithName:(id)a3 usesAutoIncrement:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  SiriCoreSQLiteColumnConstraint *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[SiriCoreSQLiteColumnConstraint initWithName:type:value:options:]([SiriCoreSQLiteColumnConstraint alloc], "initWithName:type:value:options:", v5, 1, 0, v4);

  return v6;
}

+ (id)notNullColumnConstraintWithName:(id)a3
{
  id v3;
  SiriCoreSQLiteColumnConstraint *v4;

  v3 = a3;
  v4 = -[SiriCoreSQLiteColumnConstraint initWithName:type:value:options:]([SiriCoreSQLiteColumnConstraint alloc], "initWithName:type:value:options:", v3, 2, 0, 0);

  return v4;
}

+ (id)uniqueColumnConstraintWithName:(id)a3
{
  id v3;
  SiriCoreSQLiteColumnConstraint *v4;

  v3 = a3;
  v4 = -[SiriCoreSQLiteColumnConstraint initWithName:type:value:options:]([SiriCoreSQLiteColumnConstraint alloc], "initWithName:type:value:options:", v3, 3, 0, 0);

  return v4;
}

+ (id)defaultColumnConstraintWithName:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  SiriCoreSQLiteColumnConstraint *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SiriCoreSQLiteColumnConstraint initWithName:type:value:options:]([SiriCoreSQLiteColumnConstraint alloc], "initWithName:type:value:options:", v6, 4, v5, 0);

  return v7;
}

@end
