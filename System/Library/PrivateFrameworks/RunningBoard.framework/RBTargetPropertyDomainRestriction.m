@implementation RBTargetPropertyDomainRestriction

- (id)_initWithProperty:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)RBTargetPropertyDomainRestriction;
  v8 = -[RBDomainRestriction _init](&v19, sel__init);
  if (!v8)
    goto LABEL_7;
  v9 = objc_msgSend(v6, "copy");
  v10 = (void *)v8[1];
  v8[1] = v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = objc_msgSend(v7, "copy");
      v12 = (void *)v8[3];
      v8[3] = v14;
      v13 = &OBJC_IVAR___RBTargetPropertyDomainRestriction__numberValue;
      goto LABEL_6;
    }
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  v11 = objc_msgSend(v7, "copy");
  v12 = (void *)v8[2];
  v8[2] = v11;
  v13 = &OBJC_IVAR___RBTargetPropertyDomainRestriction__stringValue;
LABEL_6:

  v15 = *v13;
  v16 = *(void **)((char *)v8 + v15);
  *(_QWORD *)((char *)v8 + v15) = 0;

  v17 = v8;
LABEL_8:

  return v17;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void **v19;
  uint64_t *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("Property"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v7)
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("SupportsBackgroundContentFetching"))
        || objc_msgSend(v6, "isEqualToString:", CFSTR("UsesSocketMonitoring"))
        || objc_msgSend(v6, "isEqualToString:", CFSTR("SupportsBackgroundNetworkAuthentication"))
        || objc_msgSend(v6, "isEqualToString:", CFSTR("SupportsUnboundedTaskCompletion"))
        || objc_msgSend(v6, "isEqualToString:", CFSTR("SupportsBackgroundAudio"))
        || objc_msgSend(v6, "isEqualToString:", CFSTR("IsExtension"))
        || objc_msgSend(v6, "isEqualToString:", CFSTR("Platform"))
        || objc_msgSend(v6, "isEqualToString:", CFSTR("NotPlatform")))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v8 = (void *)MEMORY[0x24BDD17C8];
LABEL_14:
          objc_msgSend(v8, "stringWithFormat:", CFSTR("Malformed domain plist - value for %@ is not of class %@"), v6, objc_opt_class());
          goto LABEL_15;
        }
      }
      else
      {
        if (!objc_msgSend(v6, "isEqualToString:", CFSTR("BundleID")))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unrecognized target property: %@"), v6, v24);
LABEL_15:
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = (id)v9;
          if (v9)
          {
            if (a4)
            {
              v11 = (void *)MEMORY[0x24BDD1540];
              v25 = *MEMORY[0x24BDD0FD8];
              v26 = v9;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 1, v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              v14 = objc_retainAutorelease(v13);
              *a4 = v14;

            }
            v15 = 0;
            goto LABEL_28;
          }
          goto LABEL_27;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v8 = (void *)MEMORY[0x24BDD17C8];
          goto LABEL_14;
        }
      }
LABEL_27:
      v15 = -[RBTargetPropertyDomainRestriction _initWithProperty:value:]([RBTargetPropertyDomainRestriction alloc], "_initWithProperty:value:", v6, v7);
      v10 = 0;
      goto LABEL_28;
    }
    if (a4)
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      v27 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RBTargetPropertyDomainRestriction doesn't specify value: %@"), v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v17;
      v18 = (void *)MEMORY[0x24BDBCE70];
      v19 = &v28;
      v20 = &v27;
      goto LABEL_21;
    }
  }
  else if (a4)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RBTargetPropertyDomainRestriction doesn't specify property: %@"), v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v17;
    v18 = (void *)MEMORY[0x24BDBCE70];
    v19 = (void **)v30;
    v20 = &v29;
LABEL_21:
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 1, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_retainAutorelease(v22);
    v15 = 0;
    *a4 = v10;
LABEL_28:

    goto LABEL_29;
  }
  v15 = 0;
LABEL_29:

  return v15;
}

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  void *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  NSNumber *numberValue;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSString *v17;
  NSString *v18;
  NSString *stringValue;
  char v20;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "targetProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](self->_property, "isEqualToString:", CFSTR("SupportsBackgroundContentFetching")))
  {
    v7 = objc_msgSend(v6, "supportsBackgroundContentFetching");
LABEL_13:
    v8 = v7;
    v9 = -[NSNumber BOOLValue](self->_numberValue, "BOOLValue");
    goto LABEL_14;
  }
  if (-[NSString isEqualToString:](self->_property, "isEqualToString:", CFSTR("UsesSocketMonitoring")))
  {
    v7 = objc_msgSend(v6, "usesSocketMonitoring");
    goto LABEL_13;
  }
  if (-[NSString isEqualToString:](self->_property, "isEqualToString:", CFSTR("SupportsBackgroundNetworkAuthentication")))
  {
    v7 = objc_msgSend(v6, "supportsBackgroundNetworkAuthentication");
    goto LABEL_13;
  }
  if (-[NSString isEqualToString:](self->_property, "isEqualToString:", CFSTR("SupportsUnboundedTaskCompletion")))
  {
    v7 = objc_msgSend(v6, "supportsUnboundedTaskCompletion");
    goto LABEL_13;
  }
  if (-[NSString isEqualToString:](self->_property, "isEqualToString:", CFSTR("SupportsBackgroundAudio")))
  {
    v7 = objc_msgSend(v6, "supportsBackgroundAudio");
    goto LABEL_13;
  }
  if (-[NSString isEqualToString:](self->_property, "isEqualToString:", CFSTR("IsExtension")))
  {
    v7 = objc_msgSend(v6, "isExtension");
    goto LABEL_13;
  }
  if (-[NSString isEqualToString:](self->_property, "isEqualToString:", CFSTR("Platform")))
  {
    v8 = objc_msgSend(v6, "platform");
    v9 = -[NSNumber intValue](self->_numberValue, "intValue");
LABEL_14:
    if (v8 != v9)
      goto LABEL_15;
LABEL_31:
    LOBYTE(a4) = 1;
    goto LABEL_32;
  }
  if (-[NSString isEqualToString:](self->_property, "isEqualToString:", CFSTR("NotPlatform")))
  {
    v16 = objc_msgSend(v6, "platform");
    if (v16 != -[NSNumber intValue](self->_numberValue, "intValue"))
      goto LABEL_31;
  }
  else if (-[NSString isEqualToString:](self->_property, "isEqualToString:", CFSTR("BundleID")))
  {
    objc_msgSend(v6, "bundleIdentifier");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    stringValue = self->_stringValue;
    if (v17 == stringValue)
    {

      goto LABEL_31;
    }
    if (v17 && stringValue)
    {
      v20 = -[NSString isEqual:](v17, "isEqual:");

      if ((v20 & 1) != 0)
        goto LABEL_31;
    }
    else
    {

    }
  }
LABEL_15:
  if (a4)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BE80D88];
    v22[0] = *MEMORY[0x24BDD0FD8];
    numberValue = self->_numberValue;
    if (!numberValue)
      numberValue = (NSNumber *)self->_stringValue;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Target doesn't have %@='%@'"), self->_property, numberValue);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v13;
    v22[1] = *MEMORY[0x24BE80D80];
    -[RBTargetPropertyDomainRestriction description](self, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 3, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }
LABEL_32:

  return (char)a4;
}

- (id)allEntitlements
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (BOOL)isEqual:(id)a3
{
  RBTargetPropertyDomainRestriction *v4;
  uint64_t v5;
  char v6;
  NSString *property;
  NSString *v8;
  BOOL v9;
  NSNumber *numberValue;
  NSNumber *v11;
  BOOL v12;
  NSString *stringValue;
  NSString *v14;
  BOOL v15;

  v4 = (RBTargetPropertyDomainRestriction *)a3;
  if (self == v4)
    goto LABEL_22;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_3;
  property = self->_property;
  v8 = v4->_property;
  if (property != v8)
  {
    v9 = !property || v8 == 0;
    if (v9 || !-[NSString isEqual:](property, "isEqual:"))
      goto LABEL_3;
  }
  numberValue = self->_numberValue;
  v11 = v4->_numberValue;
  if (numberValue != v11)
  {
    v12 = !numberValue || v11 == 0;
    if (v12 || !-[NSNumber isEqual:](numberValue, "isEqual:"))
      goto LABEL_3;
  }
  stringValue = self->_stringValue;
  v14 = v4->_stringValue;
  if (stringValue == v14)
  {
LABEL_22:
    v6 = 1;
    goto LABEL_23;
  }
  if (stringValue)
    v15 = v14 == 0;
  else
    v15 = 1;
  if (!v15)
  {
    v6 = -[NSString isEqual:](stringValue, "isEqual:");
    goto LABEL_23;
  }
LABEL_3:
  v6 = 0;
LABEL_23:

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_property, "hash");
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  NSNumber *numberValue;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  numberValue = self->_numberValue;
  if (!numberValue)
    numberValue = (NSNumber *)self->_stringValue;
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| %@='%@'>"), v4, self->_property, numberValue);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

@end
