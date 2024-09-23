@implementation SFSuggestedUser

- (SFSuggestedUser)init
{

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)suggestedUserWithValue:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:type:", v6, a4);

  return v7;
}

- (SFSuggestedUser)initWithValue:(id)a3 type:(int64_t)a4
{
  id v6;
  SFSuggestedUser *v7;
  uint64_t v8;
  NSString *value;
  SFSuggestedUser *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFSuggestedUser;
  v7 = -[SFSuggestedUser init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    value = v7->_value;
    v7->_value = (NSString *)v8;

    v7->_type = a4;
    v10 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *value;
  id v5;

  value = self->_value;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", value, CFSTR("suggestedUserValue"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_type, CFSTR("suggestedUserType"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_usageFrequency, CFSTR("suggestedUserUsageFrequency"));

}

- (SFSuggestedUser)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  SFSuggestedUser *v9;
  SFSuggestedUser *v10;
  SFSuggestedUser *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestedUserValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("suggestedUserType"));
  if (v6 >= 3)
    v7 = 0;
  else
    v7 = v6;
  v8 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("suggestedUserUsageFrequency"));

  v9 = -[SFSuggestedUser initWithValue:type:](self, "initWithValue:type:", v5, v7);
  v10 = v9;
  if (v9)
  {
    v9->_usageFrequency = v8;
    v11 = v9;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[SFSuggestedUser initWithValue:type:]([SFSuggestedUser alloc], "initWithValue:type:", self->_value, self->_type);
  *((_QWORD *)result + 3) = self->_usageFrequency;
  return result;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_value, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *v5;
  NSString *value;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "value");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    value = self->_value;
    if (value == v5)
      v7 = 1;
    else
      v7 = -[NSString isEqualToString:](value, "isEqualToString:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t usageFrequency;
  NSUInteger v7;
  void *v8;
  unint64_t v9;
  int64_t v10;
  NSString *value;
  void *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "usageFrequency");
  usageFrequency = self->_usageFrequency;
  if (usageFrequency > v5)
    goto LABEL_4;
  if (usageFrequency < v5)
  {
LABEL_7:
    v10 = 1;
    goto LABEL_8;
  }
  v7 = -[NSString length](self->_value, "length");
  objc_msgSend(v4, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v7 >= v9)
  {
    if (v7 <= v9)
    {
      value = self->_value;
      objc_msgSend(v4, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSString compare:](value, "compare:", v13);

      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_4:
  v10 = -1;
LABEL_8:

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *value;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  value = self->_value;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_usageFrequency);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: value=%@; type=%@; usageFrequency=%@>"), v4, self, value, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)value
{
  return self->_value;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)usageFrequency
{
  return self->_usageFrequency;
}

- (void)setUsageFrequency:(int64_t)a3
{
  self->_usageFrequency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
