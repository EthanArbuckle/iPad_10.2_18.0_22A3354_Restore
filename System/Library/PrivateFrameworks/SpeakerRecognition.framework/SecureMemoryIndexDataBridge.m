@implementation SecureMemoryIndexDataBridge

- (SecureMemoryIndexDataBridge)initWithIndexName:(id)a3 data:(id)a4 dataLength:(unint64_t)a5
{
  id v8;
  id v9;
  SecureMemoryIndexDataBridge *v10;
  uint64_t v11;
  NSMutableString *name;
  uint64_t v13;
  NSMutableData *data;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SecureMemoryIndexDataBridge;
  v10 = -[SecureMemoryIndexDataBridge init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v8);
    name = v10->_name;
    v10->_name = (NSMutableString *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithData:", v9);
    data = v10->_data;
    v10->_data = (NSMutableData *)v13;

    v10->_indexDataLength = a5;
  }

  return v10;
}

- (const)nameString
{
  id v2;
  const char *v3;

  -[SecureMemoryIndexDataBridge name](self, "name");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v2, "cStringUsingEncoding:", 4);

  return v3;
}

- (unint64_t)dataLength
{
  void *v2;
  unint64_t v3;

  -[SecureMemoryIndexDataBridge data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (const)dataInBytes
{
  id v2;
  const void *v3;

  -[SecureMemoryIndexDataBridge data](self, "data");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const void *)objc_msgSend(v2, "bytes");

  return v3;
}

- (NSMutableString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (unint64_t)indexDataLength
{
  return self->_indexDataLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
