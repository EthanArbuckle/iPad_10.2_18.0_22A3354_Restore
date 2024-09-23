@implementation _POJWTBodyBase

- (_POJWTBodyBase)init
{
  _POJWTBodyBase *v2;
  uint64_t v3;
  NSMutableDictionary *data;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_POJWTBodyBase;
  v2 = -[_POJWTBodyBase init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    data = v2->_data;
    v2->_data = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (_POJWTBodyBase)initWithJWTData:(id)a3
{
  id v4;
  _POJWTBodyBase *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSMutableDictionary *data;
  _POJWTBodyBase *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_POJWTBodyBase;
  v5 = -[_POJWTBodyBase init](&v17, sel_init);
  if (v5)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 17, &v16);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v16;
    v8 = v7;
    if (!v6)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __34___POJWTBodyBase_initWithJWTData___block_invoke;
      v14[3] = &unk_2514FF9D0;
      v15 = v7;
      v11 = v7;
      v12 = __34___POJWTBodyBase_initWithJWTData___block_invoke((uint64_t)v14);

      v10 = 0;
      goto LABEL_6;
    }
    data = v5->_data;
    v5->_data = (NSMutableDictionary *)v6;

  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (_POJWTBodyBase)initWithDictionary:(id)a3
{
  id v4;
  _POJWTBodyBase *v5;
  uint64_t v6;
  NSMutableDictionary *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_POJWTBodyBase;
  v5 = -[_POJWTBodyBase init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    data = v5->_data;
    v5->_data = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (id)dataRepresentation
{
  void *v2;
  void *v3;
  uint64_t v5;

  v2 = (void *)-[NSMutableDictionary mutableCopy](self->_data, "mutableCopy");
  v5 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 9, &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)allData
{
  return (NSDictionary *)self->_data;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)-[NSMutableDictionary mutableCopy](self->_data, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 9, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);

  return (NSString *)v4;
}

- (NSMutableDictionary)data
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
