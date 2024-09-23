@implementation TMLJSONSchema

- (TMLJSONSchema)init
{
  return (TMLJSONSchema *)((uint64_t (*)(TMLJSONSchema *, char *))MEMORY[0x24BEDD108])(self, sel_initWithJSON_);
}

- (TMLJSONSchema)initWithJSON:(id)a3
{
  id v4;
  const char *v5;
  TMLJSONSchema *v6;
  double v7;
  uint64_t v8;
  NSDictionary *schema;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TMLJSONSchema;
  v6 = -[TMLJSONSchema init](&v11, sel_init);
  if (v6)
  {
    v8 = objc_msgSend_copy(v4, v5, v7);
    schema = v6->_schema;
    v6->_schema = (NSDictionary *)v8;

  }
  return v6;
}

- (TMLJSONSchema)initWithString:(id)a3
{

  return 0;
}

- (id)propertyForKeyPath:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schema, 0);
}

@end
