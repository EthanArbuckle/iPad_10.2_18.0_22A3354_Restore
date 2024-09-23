@implementation _REInterfaceKey

- (_REInterfaceKey)initWithClass:(Class)a3
{
  _REInterfaceKey *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_REInterfaceKey;
  result = -[_REInterfaceKey init](&v5, sel_init);
  if (result)
  {
    result->_c = a3;
    result->_isClass = 1;
  }
  return result;
}

- (_REInterfaceKey)initWithProtocol:(id)a3
{
  id v5;
  _REInterfaceKey *v6;
  _REInterfaceKey *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_REInterfaceKey;
  v6 = -[_REInterfaceKey init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_p, a3);
    v7->_isClass = 0;
  }

  return v7;
}

- (Class)cls
{
  return self->_c;
}

- (Protocol)protocol
{
  return self->_p;
}

- (BOOL)isProtocol
{
  return !self->_isClass;
}

- (_REInterfaceKey)superclassKey
{
  Class c;
  _REInterfaceKey *v4;

  if (!self->_isClass || (c = self->_c, c == (Class)objc_opt_class()))
    v4 = 0;
  else
    v4 = -[_REInterfaceKey initWithClass:]([_REInterfaceKey alloc], "initWithClass:", -[objc_class superclass](self->_c, "superclass"));
  return v4;
}

- (BOOL)conforms:(id)a3
{
  if (self->_isClass)
    return class_conformsToProtocol(self->_c, (Protocol *)a3);
  else
    return protocol_conformsToProtocol(self->_p, (Protocol *)a3);
}

- (void)enumerateAutomaticProperties:(id)a3
{
  void (**v4)(id, void *);
  objc_property_t *v5;
  objc_property_t *v6;
  unint64_t i;
  const char *Name;
  void *v9;
  unsigned int outCount;

  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (self->_isClass)
    {
      outCount = 0;
      v5 = class_copyPropertyList(self->_c, &outCount);
      if (v5)
      {
        v6 = v5;
        if (outCount)
        {
          for (i = 0; i < outCount; ++i)
          {
            Name = property_getName(v6[i]);
            if (Name)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Name);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v4[2](v4, v9);

            }
          }
        }
        free(v6);
      }
    }
  }

}

- (void)enumerateConformedProperties:(id)a3
{
  void (**v4)(id, _QWORD);
  Protocol **v5;
  Protocol **v6;
  unint64_t i;
  unsigned int outCount;

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    outCount = 0;
    v5 = self->_isClass ? class_copyProtocolList(self->_c, &outCount) : protocol_copyProtocolList(self->_p, &outCount);
    v6 = v5;
    if (v5)
    {
      if (outCount)
      {
        for (i = 0; i < outCount; ((void (**)(id, Protocol *))v4)[2](v4, v6[i++]))
          ;
      }
      free(v6);
    }
  }

}

- (void)enumerateExposedProperties:(id)a3
{
  void (**v4)(id, void *);
  objc_property_t *v5;
  objc_property_t *v6;
  unint64_t i;
  const char *Name;
  void *v9;
  unsigned int outCount;

  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (!self->_isClass)
    {
      outCount = 0;
      v5 = protocol_copyPropertyList(self->_p, &outCount);
      if (v5)
      {
        v6 = v5;
        if (outCount)
        {
          for (i = 0; i < outCount; ++i)
          {
            Name = property_getName(v6[i]);
            if (Name)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Name);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v4[2](v4, v9);

            }
          }
        }
        free(v6);
      }
    }
  }

}

- (void)enumerateExposedMethods:(id)a3
{
  void (**v4)(id, SEL);
  void *v5;
  id v6;
  objc_method_description *v7;
  objc_method_description *v8;
  unint64_t v9;
  SEL *p_name;
  SEL v11;
  void *v12;
  char v13;
  unsigned int outCount;
  _QWORD v15[4];
  id v16;

  v4 = (void (**)(id, SEL))a3;
  if (v4 && !self->_isClass)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __43___REInterfaceKey_enumerateExposedMethods___block_invoke;
    v15[3] = &unk_24CF8F0F8;
    v6 = v5;
    v16 = v6;
    -[_REInterfaceKey enumerateExposedProperties:](self, "enumerateExposedProperties:", v15);
    outCount = 0;
    v7 = protocol_copyMethodDescriptionList(self->_p, 1, 1, &outCount);
    if (v7)
    {
      v8 = v7;
      if (outCount)
      {
        v9 = 0;
        p_name = &v7->name;
        do
        {
          v11 = *p_name;
          if (*p_name)
          {
            NSStringFromSelector(*p_name);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v6, "containsObject:", v12);

            if ((v13 & 1) == 0)
              v4[2](v4, v11);
          }
          ++v9;
          p_name += 2;
        }
        while (v9 < outCount);
      }
      free(v8);
    }

  }
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  if (self->_isClass)
    return -[objc_class hash](self->_c, "hash");
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", self->_p);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _REInterfaceKey *v4;
  _REInterfaceKey *v5;
  _REInterfaceKey *v6;
  BOOL isEqual;

  v4 = (_REInterfaceKey *)a3;
  if (self == v4)
  {
    isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_isClass == v5->_isClass)
      {
        if (self->_isClass)
          isEqual = self->_c == v5->_c;
        else
          isEqual = protocol_isEqual(self->_p, v5->_p);
      }
      else
      {
        isEqual = 0;
      }

    }
    else
    {
      isEqual = 0;
    }
  }

  return isEqual;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL4 isClass;
  void *v5;

  isClass = self->_isClass;
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (isClass)
    return (id)objc_msgSend(v5, "initWithClass:", self->_c);
  else
    return (id)objc_msgSend(v5, "initWithProtocol:", self->_p);
}

- (void)setCls:(Class)a3
{
  objc_storeStrong((id *)&self->_cls, a3);
}

- (void)setProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_protocol, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_cls, 0);
  objc_storeStrong((id *)&self->_p, 0);
}

@end
