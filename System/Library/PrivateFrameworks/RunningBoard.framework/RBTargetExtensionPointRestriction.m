@implementation RBTargetExtensionPointRestriction

- (id)_initWithExtensionPoint:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBTargetExtensionPointRestriction;
  v5 = -[RBDomainRestriction _init](&v10, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = v5;
  }

  return v5;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("ExtensionPoint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v6, "length"))
  {
    a4 = -[RBTargetExtensionPointRestriction _initWithExtensionPoint:]([RBTargetExtensionPointRestriction alloc], "_initWithExtensionPoint:", v6);
  }
  else if (a4)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RBTargetExtensionPointRestriction doesn't specify extensionPoint or doesn't have right class for extensionPoint: %@"), v5, *MEMORY[0x24BDD0FD8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_retainAutorelease(v10);
    *a4 = v11;

    a4 = 0;
  }

  return a4;
}

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  void *v6;
  void *v7;
  char v8;
  NSString *extensionPoint;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "targetProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isExtension");

  if ((v8 & 1) == 0)
  {
    if (!a4)
      goto LABEL_9;
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BE80E58];
    v22 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("target isn't extension"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    v15 = (void *)MEMORY[0x24BDBCE70];
    v16 = (void **)v23;
    v17 = &v22;
LABEL_8:
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 1, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
    goto LABEL_9;
  }
  extensionPoint = self->_extensionPoint;
  objc_msgSend(v6, "bundleProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extensionPointIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(extensionPoint) = -[NSString isEqualToString:](extensionPoint, "isEqualToString:", v11);

  if ((extensionPoint & 1) == 0)
  {
    if (!a4)
      goto LABEL_9;
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BE80E58];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("target doesn't have extensionPoint %@"), self->_extensionPoint, *MEMORY[0x24BDD0FD8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v14;
    v15 = (void *)MEMORY[0x24BDBCE70];
    v16 = &v21;
    v17 = &v20;
    goto LABEL_8;
  }
  LOBYTE(a4) = 1;
LABEL_9:

  return (char)a4;
}

- (id)allEntitlements
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (BOOL)isEqual:(id)a3
{
  RBTargetExtensionPointRestriction *v4;
  uint64_t v5;
  char v6;
  NSString *extensionPoint;
  NSString *v8;
  BOOL v9;

  v4 = (RBTargetExtensionPointRestriction *)a3;
  if (self == v4)
    goto LABEL_10;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_3;
  extensionPoint = self->_extensionPoint;
  v8 = v4->_extensionPoint;
  if (extensionPoint == v8)
  {
LABEL_10:
    v6 = 1;
    goto LABEL_11;
  }
  if (extensionPoint)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v6 = -[NSString isEqual:](extensionPoint, "isEqual:");
    goto LABEL_11;
  }
LABEL_3:
  v6 = 0;
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_extensionPoint, "hash");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| %@>"), v4, self->_extensionPoint);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPoint, 0);
}

@end
