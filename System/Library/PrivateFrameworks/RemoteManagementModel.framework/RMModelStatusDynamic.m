@implementation RMModelStatusDynamic

+ (id)buildWithStatusItemType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  RMModelStatusDynamic *v6;

  v3 = a3;
  +[RMModelStatusSchema schemas](RMModelStatusSchema, "schemas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = -[RMModelStatusDynamic initWithSchema:]([RMModelStatusDynamic alloc], "initWithSchema:", v5);
  else
    v6 = 0;

  return v6;
}

- (RMModelStatusDynamic)initWithSchema:(id)a3
{
  id v5;
  RMModelStatusDynamic *v6;
  RMModelStatusDynamic *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMModelStatusDynamic;
  v6 = -[RMModelStatusDynamic init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_schema, a3);

  return v7;
}

- (id)statusItemType
{
  void *v2;
  void *v3;

  -[RMModelStatusDynamic schema](self, "schema");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isArrayValue
{
  void *v2;
  char v3;

  -[RMModelStatusDynamic schema](self, "schema");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isArrayValue");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RMModelStatusDynamic;
  v4 = -[RMModelPayloadBase copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 2, self->_schema);
  return v4;
}

- (RMModelStatusSchema)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
  objc_storeStrong((id *)&self->_schema, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schema, 0);
}

@end
