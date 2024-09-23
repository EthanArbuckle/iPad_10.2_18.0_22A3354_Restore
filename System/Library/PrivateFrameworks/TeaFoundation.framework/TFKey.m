@implementation TFKey

- (void).cxx_destruct
{
  objc_storeStrong(&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (TFKey)initWithAddressOfType:(id)a3 name:(id)a4
{
  return -[TFKey initWithAddress:type:name:](self, "initWithAddress:type:name:", a3, a3, a4);
}

- (TFKey)initWithAddress:(unint64_t)a3 type:(id)a4 name:(id)a5
{
  id v9;
  id v10;
  TFKey *v11;
  TFKey *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TFKey;
  v11 = -[TFKey init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_address = a3;
    objc_storeStrong(&v11->_type, a4);
    objc_storeStrong((id *)&v12->_name, a5);
  }

  return v12;
}

- (unint64_t)address
{
  return self->_address;
}

- (TFKey)initWithTypeName:(id)a3 name:(id)a4
{
  NSString *v6;
  id v7;
  objc_class *v8;
  TFKey *v9;
  Class v10;
  TFKey *v11;
  TFKey *v12;

  v6 = (NSString *)a3;
  v7 = a4;
  NSProtocolFromString(v6);
  v8 = (objc_class *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = self;
    v10 = v8;
  }
  else
  {
    v10 = NSClassFromString(v6);
    if (!v10)
    {
      v11 = -[TFKey initWithAddress:type:name:](self, "initWithAddress:type:name:", 0, 0, v7);
      goto LABEL_6;
    }
    v9 = self;
  }
  v11 = -[TFKey initWithAddressOfType:name:](v9, "initWithAddressOfType:name:", v10, v7);
LABEL_6:
  v12 = v11;

  return v12;
}

- (id)copyWithName:(id)a3
{
  id v4;
  TFKey *v5;

  v4 = a3;
  v5 = -[TFKey initWithAddress:type:name:]([TFKey alloc], "initWithAddress:type:name:", self->_address, self->_type, v4);

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ address=%ld, name=%@, type=%@>"), objc_opt_class(), self->_address, self->_name, self->_type);
}

- (unint64_t)hash
{
  NSString *name;
  unint64_t address;

  name = self->_name;
  address = self->_address;
  if (name)
    address ^= -[NSString hash](name, "hash");
  return address;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t address;
  void *v7;
  NSString *name;
  void *v9;
  char v10;
  void *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    address = self->_address;
    if (address == objc_msgSend(v5, "address"))
    {
      if (!self->_name)
        goto LABEL_8;
      objc_msgSend(v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      name = self->_name;
      if (v7)
      {
        objc_msgSend(v5, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NSString isEqualToString:](name, "isEqualToString:", v9);

LABEL_10:
        goto LABEL_11;
      }
      if (!name)
      {
LABEL_8:
        objc_msgSend(v5, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v10 = 1;
          goto LABEL_10;
        }
      }
    }
    v10 = 0;
    goto LABEL_10;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TFKey initWithAddress:type:name:]([TFKey alloc], "initWithAddress:type:name:", self->_address, self->_type, self->_name);
}

- (NSString)name
{
  return self->_name;
}

- (id)type
{
  return self->_type;
}

@end
