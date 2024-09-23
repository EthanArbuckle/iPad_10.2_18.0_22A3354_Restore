@implementation PKBundleResourceDescriptor

- (PKBundleResourceDescriptor)initWithName:(id)a3 extension:(id)a4
{
  id v6;
  id v7;
  PKBundleResourceDescriptor *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *extension;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKBundleResourceDescriptor;
  v8 = -[PKBundleResourceDescriptor init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    extension = v8->_extension;
    v8->_extension = (NSString *)v11;

  }
  return v8;
}

- (PKBundleResourceDescriptor)initWithCoder:(id)a3
{
  id v4;
  PKBundleResourceDescriptor *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *extension;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKBundleResourceDescriptor;
  v5 = -[PKBundleResourceDescriptor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extension"));
    v8 = objc_claimAutoreleasedReturnValue();
    extension = v5->_extension;
    v5->_extension = (NSString *)v8;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; %@.%@>"),
               objc_opt_class(),
               self,
               self->_name,
               self->_extension);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extension, CFSTR("extension"));

}

+ (id)withName:(id)a3 extension:(id)a4
{
  id v5;
  id v6;
  PKBundleResourceDescriptor *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PKBundleResourceDescriptor initWithName:extension:]([PKBundleResourceDescriptor alloc], "initWithName:extension:", v6, v5);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[PKBundleResourceDescriptor isEqualToBundleResourceDescriptor:](self, "isEqualToBundleResourceDescriptor:", v4);

  return v5;
}

- (BOOL)isEqualToBundleResourceDescriptor:(id)a3
{
  NSString *name;
  id v5;
  void *v6;
  NSString *extension;
  void *v8;
  unsigned int v9;

  if (self == a3)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    name = self->_name;
    v5 = a3;
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(name) = -[NSString isEqualToString:](name, "isEqualToString:", v6);

    extension = self->_extension;
    objc_msgSend(v5, "extension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = name & -[NSString isEqualToString:](extension, "isEqualToString:", v8);
  }
  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_name, "hash");
  return -[NSString hash](self->_extension, "hash") ^ v3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
