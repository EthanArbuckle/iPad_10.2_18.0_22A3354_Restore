@implementation RBSDomainAttribute

- (RBSDomainAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSDomainAttribute *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBSDomainAttribute;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v10, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSDomainAttribute setDomain:](v5, "setDomain:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSDomainAttribute setName:](v5, "setName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceEnvironment"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSDomainAttribute setSourceEnvironment:](v5, "setSourceEnvironment:", v8);

  }
  return v5;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setSourceEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| domain:\"%@\" name:\"%@\" sourceEnvironment:\"%@\">"), v4, self->_domain, self->_name, self->_sourceEnvironment);

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_domain, "hash");
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_sourceEnvironment, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *domain;
  NSString *name;
  NSString *sourceEnvironment;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBSDomainAttribute;
  v8 = 0;
  if (-[RBSAttribute isEqual:](&v10, sel_isEqual_, v4))
  {
    domain = self->_domain;
    if (domain == (NSString *)v4[1] || -[NSString isEqualToString:](domain, "isEqualToString:"))
    {
      name = self->_name;
      if (name == (NSString *)v4[2] || -[NSString isEqualToString:](name, "isEqualToString:"))
      {
        sourceEnvironment = self->_sourceEnvironment;
        if (sourceEnvironment == (NSString *)v4[3]
          || -[NSString isEqualToString:](sourceEnvironment, "isEqualToString:"))
        {
          v8 = 1;
        }
      }
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEnvironment, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RBSDomainAttribute;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v8, sel_encodeWithRBSXPCCoder_, v4);
  -[RBSDomainAttribute domain](self, "domain", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("domain"));

  -[RBSDomainAttribute name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

  -[RBSDomainAttribute sourceEnvironment](self, "sourceEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sourceEnvironment"));

}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)sourceEnvironment
{
  return self->_sourceEnvironment;
}

+ (id)attributeWithDomain:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[RBSDomainAttribute _initWithDomain:name:sourceEnvironment:](objc_alloc((Class)a1), v7, v6, 0);

  return v8;
}

- (_QWORD)_initWithDomain:(void *)a3 name:(void *)a4 sourceEnvironment:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)RBSDomainAttribute;
    a1 = objc_msgSendSuper2(&v17, sel__init);
    if (a1)
    {
      v10 = objc_msgSend(v7, "copy");
      v11 = (void *)a1[1];
      a1[1] = v10;

      v12 = objc_msgSend(v8, "copy");
      v13 = (void *)a1[2];
      a1[2] = v12;

      v14 = objc_msgSend(v9, "copy");
      v15 = (void *)a1[3];
      a1[3] = v14;

    }
  }

  return a1;
}

+ (id)attributeWithDomain:(id)a3 name:(id)a4 sourceEnvironment:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[RBSDomainAttribute _initWithDomain:name:sourceEnvironment:](objc_alloc((Class)a1), v10, v9, v8);

  return v11;
}

- (NSString)fullyQualifiedName
{
  return -[NSString stringByAppendingPathExtension:](self->_domain, "stringByAppendingPathExtension:", self->_name);
}

@end
