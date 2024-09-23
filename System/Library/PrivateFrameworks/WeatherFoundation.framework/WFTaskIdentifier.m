@implementation WFTaskIdentifier

+ (id)defaultIdentifier
{
  return objc_alloc_init(WFTaskIdentifier);
}

- (WFTaskIdentifier)init
{
  WFTaskIdentifier *v2;
  uint64_t v3;
  NSUUID *UUID;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *processName;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFTaskIdentifier;
  v2 = -[WFTaskIdentifier init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    UUID = v2->_UUID;
    v2->_UUID = (NSUUID *)v3;

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", getprogname());
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    processName = v2->_processName;
    v2->_processName = v8;

    v2->_pid = getpid();
  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WFTaskIdentifier processName](self, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFTaskIdentifier pid](self, "pid");
  -[WFTaskIdentifier UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[%d]: %@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  WFTaskIdentifier *v4;
  WFTaskIdentifier *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  int v11;

  v4 = (WFTaskIdentifier *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WFTaskIdentifier UUID](self, "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTaskIdentifier UUID](v5, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        -[WFTaskIdentifier processName](self, "processName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFTaskIdentifier processName](v5, "processName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 == v10)
        {
          v11 = -[WFTaskIdentifier pid](self, "pid");
          v8 = v11 == -[WFTaskIdentifier pid](v5, "pid");
        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[WFTaskIdentifier UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFTaskIdentifier processName](self, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[WFTaskIdentifier pid](self, "pid");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFTaskIdentifier)initWithCoder:(id)a3
{
  id v4;
  WFTaskIdentifier *v5;
  uint64_t v6;
  NSUUID *UUID;
  uint64_t v8;
  NSString *processName;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFTaskIdentifier;
  v5 = -[WFTaskIdentifier init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFTaskIdentifierUUIDKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFTaskIdentifierProcessNameKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    processName = v5->_processName;
    v5->_processName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFTaskIdentifierPidKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pid = objc_msgSend(v10, "unsignedIntValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFTaskIdentifier UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WFTaskIdentifierUUIDKey"));

  -[WFTaskIdentifier processName](self, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WFTaskIdentifierProcessNameKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[WFTaskIdentifier pid](self, "pid"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("WFTaskIdentifierPidKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  WFTaskIdentifier *v4;
  uint64_t v5;
  NSUUID *UUID;
  uint64_t v7;
  NSString *processName;

  v4 = objc_alloc_init(WFTaskIdentifier);
  -[WFTaskIdentifier UUID](self, "UUID");
  v5 = objc_claimAutoreleasedReturnValue();
  UUID = v4->_UUID;
  v4->_UUID = (NSUUID *)v5;

  -[WFTaskIdentifier processName](self, "processName");
  v7 = objc_claimAutoreleasedReturnValue();
  processName = v4->_processName;
  v4->_processName = (NSString *)v7;

  v4->_pid = -[WFTaskIdentifier pid](self, "pid");
  return v4;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)processName
{
  return self->_processName;
}

- (int)pid
{
  return self->_pid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
