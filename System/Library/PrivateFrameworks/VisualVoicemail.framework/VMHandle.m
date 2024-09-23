@implementation VMHandle

- (VMHandle)init
{
  -[VMHandle doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (VMHandle)initWithHandle:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  VMHandle *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[VMHandle initWithType:value:](self, "initWithType:value:", v5, v6);
  return v7;
}

- (VMHandle)initWithType:(int64_t)a3 value:(id)a4
{
  id v6;
  VMHandle *v7;
  uint64_t v8;
  NSString *value;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VMHandle;
  v7 = -[VMHandle init](&v11, sel_init);
  if (v7)
  {
    if (a3)
    {
      if (v6)
      {
LABEL_4:
        v7->_type = a3;
        v8 = objc_msgSend(v6, "copy");
        value = v7->_value;
        v7->_value = (NSString *)v8;

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%s: parameter '%@' cannot be nil"), "-[VMHandle initWithType:value:]", CFSTR("type"));
      if (v6)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%s: parameter '%@' cannot be nil"), "-[VMHandle initWithType:value:]", CFSTR("value"));
    goto LABEL_4;
  }
LABEL_5:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[VMHandle initWithHandle:](+[VMHandle allocWithZone:](VMHandle, "allocWithZone:", a3), "initWithHandle:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;
  void *v6;
  NSString *value;
  id v8;

  type = self->_type;
  v5 = a3;
  NSStringFromSelector(sel_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", type, v6);

  value = self->_value;
  NSStringFromSelector(sel_value);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", value, v8);

}

- (VMHandle)initWithCoder:(id)a3
{
  id v4;
  VMHandle *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString *value;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VMHandle;
  v5 = -[VMHandle init](&v12, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_type);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", v6);

    v7 = objc_opt_class();
    NSStringFromSelector(sel_value);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v9;

  }
  return v5;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%ld"), v4, -[VMHandle type](self, "type"));

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_value);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMHandle value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v5, v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[VMHandle type](self, "type");
  -[VMHandle value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VMHandle *v4;
  BOOL v5;

  v4 = (VMHandle *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[VMHandle isEqualToHandle:](self, "isEqualToHandle:", v4);
  }

  return v5;
}

- (BOOL)isEqualToHandle:(id)a3
{
  VMHandle *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v4 = (VMHandle *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v5 = -[VMHandle type](self, "type");
    if (v5 == -[VMHandle type](v4, "type"))
    {
      -[VMHandle value](self, "value");
      v6 = objc_claimAutoreleasedReturnValue();
      -[VMHandle value](v4, "value");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (v6 | v7) == 0;
      if (v7)
        v8 = objc_msgSend((id)v6, "isEqualToString:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)unarchivedObjectClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD1620];
  v7 = a3;
  objc_msgSend(a1, "unarchivedObjectClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
