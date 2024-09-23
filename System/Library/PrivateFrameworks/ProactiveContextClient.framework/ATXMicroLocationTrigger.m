@implementation ATXMicroLocationTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 11;
}

- (ATXMicroLocationTrigger)initWithLocationUUID:(id)a3
{
  id v5;
  ATXMicroLocationTrigger *v6;
  ATXMicroLocationTrigger *v7;
  ATXMicroLocationTrigger *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXMicroLocationTrigger;
  v6 = -[ATXMicroLocationTrigger init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uuid, a3);
    v8 = v7;
  }

  return v7;
}

- (ATXMicroLocationTrigger)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXMicroLocationTrigger *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("microLocationUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXMicroLocationTrigger initWithLocationUUID:](self, "initWithLocationUUID:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_uuid, CFSTR("microLocationUUID"));
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
