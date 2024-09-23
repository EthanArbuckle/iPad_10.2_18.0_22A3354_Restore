@implementation RTISupplementalItemIcon

- (RTISupplementalItemIcon)initWithDataType:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  RTISupplementalItemIcon *v8;
  uint64_t v9;
  NSString *dataType;
  uint64_t v11;
  NSData *data;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RTISupplementalItemIcon;
  v8 = -[RTISupplementalItemIcon init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    dataType = v8->_dataType;
    v8->_dataType = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    data = v8->_data;
    v8->_data = (NSData *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dataType, CFSTR("iconDataType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_data, CFSTR("iconData"));

}

- (RTISupplementalItemIcon)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  if (self)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconDataType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[RTISupplementalItemIcon initWithDataType:data:](self, "initWithDataType:data:", v5, v6);

  }
  return self;
}

- (unint64_t)hash
{
  return -[NSData hash](self->_data, "hash");
}

- (BOOL)isEqual:(id)a3
{
  RTISupplementalItemIcon *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (RTISupplementalItemIcon *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[RTISupplementalItemIcon dataType](self, "dataType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTISupplementalItemIcon dataType](v4, "dataType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", v6))
      {
        -[RTISupplementalItemIcon data](self, "data");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTISupplementalItemIcon data](v4, "data");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToData:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p;"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTISupplementalItemIcon dataType](self, "dataType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", dataType=%@"), v4);

  -[RTISupplementalItemIcon data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", data=%@>"), v5);

  return v3;
}

- (NSString)dataType
{
  return self->_dataType;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_dataType, 0);
}

@end
