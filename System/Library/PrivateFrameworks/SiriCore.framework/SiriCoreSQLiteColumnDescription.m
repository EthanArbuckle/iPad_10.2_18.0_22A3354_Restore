@implementation SiriCoreSQLiteColumnDescription

- (SiriCoreSQLiteColumnDescription)initWithName:(id)a3 type:(id)a4 constraints:(id)a5
{
  id v8;
  id v9;
  id v10;
  SiriCoreSQLiteColumnDescription *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSString *type;
  uint64_t v16;
  NSArray *constraints;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SiriCoreSQLiteColumnDescription;
  v11 = -[SiriCoreSQLiteColumnDescription init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    type = v11->_type;
    v11->_type = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    constraints = v11->_constraints;
    v11->_constraints = (NSArray *)v16;

  }
  return v11;
}

- (SiriCoreSQLiteColumnDescription)initWithName:(id)a3 type:(id)a4 constraintsProvider:(id)a5
{
  id v8;
  id v9;
  SiriCoreSQLiteColumnDescription *v10;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    (*((void (**)(id))a5 + 2))(a5);
    a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = -[SiriCoreSQLiteColumnDescription initWithName:type:constraints:](self, "initWithName:type:constraints:", v8, v9, a5);

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)type
{
  return self->_type;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)integerPrimaryKeyColumnWithName:(id)a3
{
  id v3;
  SiriCoreSQLiteColumnDescription *v4;
  SiriCoreSQLiteColumnConstraint *v5;
  void *v6;
  SiriCoreSQLiteColumnDescription *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = [SiriCoreSQLiteColumnDescription alloc];
  v5 = -[SiriCoreSQLiteColumnConstraint initWithName:type:value:options:]([SiriCoreSQLiteColumnConstraint alloc], "initWithName:type:value:options:", 0, 1, 0, 0);
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SiriCoreSQLiteColumnDescription initWithName:type:constraints:](v4, "initWithName:type:constraints:", v3, CFSTR("INTEGER"), v6);

  return v7;
}

+ (id)uniqueTextColumnWithName:(id)a3
{
  id v3;
  SiriCoreSQLiteColumnDescription *v4;
  SiriCoreSQLiteColumnConstraint *v5;
  void *v6;
  SiriCoreSQLiteColumnDescription *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = [SiriCoreSQLiteColumnDescription alloc];
  v5 = -[SiriCoreSQLiteColumnConstraint initWithName:type:value:options:]([SiriCoreSQLiteColumnConstraint alloc], "initWithName:type:value:options:", 0, 3, 0, 0);
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SiriCoreSQLiteColumnDescription initWithName:type:constraints:](v4, "initWithName:type:constraints:", v3, CFSTR("TEXT"), v6);

  return v7;
}

@end
