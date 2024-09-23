@implementation _SWCServiceSpecifier

+ (id)serviceSpecifiersWithEntitlementValue:(id)a3 error:(id *)a4
{
  objc_msgSend(a1, "_serviceSpecifiersWithEntitlementValue:serviceType:error:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)serviceSpecifiersWithEntitlementValue:(id)a3 serviceType:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v13;

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SWCServiceSpecifier.mm"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceType != nil"));

  }
  objc_msgSend(a1, "_serviceSpecifiersWithEntitlementValue:serviceType:error:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (_SWCServiceSpecifier)initWithServiceType:(id)a3 applicationIdentifier:(id)a4 domain:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _SWCApplicationIdentifier *v12;
  _SWCDomain *v13;
  _SWCServiceSpecifier *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    v12 = 0;
    if (v10)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = -[_SWCApplicationIdentifier initWithString:]([_SWCApplicationIdentifier alloc], "initWithString:", v9);
  if (!v11)
    goto LABEL_5;
LABEL_3:
  v13 = -[_SWCDomain initWithString:]([_SWCDomain alloc], "initWithString:", v11);
LABEL_6:
  v14 = -[_SWCServiceSpecifier _initWithServiceType:applicationIdentifier:domain:](self, "_initWithServiceType:applicationIdentifier:domain:", v8, v12, v13);

  return v14;
}

- (_SWCServiceSpecifier)init
{
  return (_SWCServiceSpecifier *)-[_SWCServiceSpecifier _initWithServiceType:applicationIdentifier:domain:](self, "_initWithServiceType:applicationIdentifier:domain:", 0, 0, 0);
}

- (NSString)applicationIdentifier
{
  return -[_SWCApplicationIdentifier rawValue](self->_applicationIdentifier, "rawValue");
}

- (NSString)domain
{
  return -[_SWCDomain rawValue](self->_domain, "rawValue");
}

- (id)_initWithServiceType:(id)a3 applicationIdentifier:(id)a4 domain:(id)a5
{
  id v8;
  id v9;
  id v10;
  _SWCServiceSpecifier *v11;
  uint64_t v12;
  NSString *serviceType;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_SWCServiceSpecifier;
  v11 = -[_SWCServiceSpecifier init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    serviceType = v11->_serviceType;
    v11->_serviceType = (NSString *)v12;

    objc_storeStrong((id *)&v11->_applicationIdentifier, a4);
    objc_storeStrong((id *)&v11->_domain, a5);
  }

  return v11;
}

- (BOOL)isFullySpecified
{
  return self->_serviceType && self->_applicationIdentifier && self->_domain != 0;
}

- (BOOL)isEqual:(id)a3
{
  _SWCServiceSpecifier *v4;
  _SWCServiceSpecifier *v5;
  NSString *serviceType;
  _SWCApplicationIdentifier *applicationIdentifier;
  _SWCDomain *domain;
  BOOL v9;

  v4 = (_SWCServiceSpecifier *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      serviceType = self->_serviceType;
      v9 = 0;
      if (!((unint64_t)serviceType | (unint64_t)v5->_serviceType)
        || -[NSString isEqual:](serviceType, "isEqual:"))
      {
        applicationIdentifier = self->_applicationIdentifier;
        if (!((unint64_t)applicationIdentifier | (unint64_t)v5->_applicationIdentifier)
          || -[_SWCApplicationIdentifier isEqual:](applicationIdentifier, "isEqual:"))
        {
          domain = self->_domain;
          if (!((unint64_t)domain | (unint64_t)v5->_domain) || -[_SWCDomain isEqual:](domain, "isEqual:"))
            v9 = 1;
        }
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_serviceType, "hash");
  v4 = -[_SWCApplicationIdentifier hash](self->_applicationIdentifier, "hash") ^ v3;
  return v4 ^ -[_SWCDomain hash](self->_domain, "hash");
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{ s = %@, a = %@, d = %@ }"), self->_serviceType, self->_applicationIdentifier, self->_domain);
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[_SWCServiceSpecifier description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> %@"), v4, self, v5);

  return v6;
}

- (id)redactedDescription
{
  id v3;
  NSString *serviceType;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  serviceType = self->_serviceType;
  -[_SWCApplicationIdentifier redactedDescription](self->_applicationIdentifier, "redactedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SWCDomain redactedDescription](self->_domain, "redactedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("{ s = %@, a = %@, d = %@ }"), serviceType, v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_serviceType, CFSTR("serviceType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, CFSTR("applicationIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_domain, CFSTR("domain"));

}

- (_SWCServiceSpecifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _SWCServiceSpecifier *v8;

  v4 = a3;
  objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domain"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_SWCServiceSpecifier _initWithServiceType:applicationIdentifier:domain:](self, "_initWithServiceType:applicationIdentifier:domain:", v5, v6, v7);

  return v8;
}

- (_SWCApplicationIdentifier)SWCApplicationIdentifier
{
  return (_SWCApplicationIdentifier *)objc_getProperty(self, a2, 8, 1);
}

- (_SWCDomain)SWCDomain
{
  return (_SWCDomain *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)serviceType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

- (NSString)bundleIdentifier
{
  return -[_SWCApplicationIdentifier bundleIdentifier](self->_applicationIdentifier, "bundleIdentifier");
}

- (NSString)applicationIdentifierPrefix
{
  return -[_SWCApplicationIdentifier prefix](self->_applicationIdentifier, "prefix");
}

- (NSString)domainHost
{
  return -[_SWCDomain host](self->_domain, "host");
}

- (BOOL)isDomainWildcard
{
  return -[_SWCDomain isWildcard](self->_domain, "isWildcard");
}

- (NSNumber)domainPort
{
  return -[_SWCDomain port](self->_domain, "port");
}

- (char)domainModeOfOperation
{
  return -[_SWCDomain modeOfOperation](self->_domain, "modeOfOperation");
}

- (BOOL)domainEncompassesDomain:(id)a3
{
  id v4;
  void *v5;
  _SWCDomain *v6;
  char v7;

  v4 = a3;
  -[_SWCServiceSpecifier SWCDomain](self, "SWCDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[_SWCDomain initWithString:]([_SWCDomain alloc], "initWithString:", v4);
    if (v6)
      v7 = objc_msgSend(v5, "encompassesDomain:", v6);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)domainEncompassesDomainOfServiceSpecifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;

  v4 = a3;
  -[_SWCServiceSpecifier SWCDomain](self, "SWCDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "SWCDomain");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
    v8 = objc_msgSend(v5, "encompassesDomain:", v6);

  return v8;
}

- (BOOL)isValid
{
  _SWCApplicationIdentifier *applicationIdentifier;
  int v4;
  _SWCDomain *domain;
  NSString *serviceType;

  applicationIdentifier = self->_applicationIdentifier;
  if (!applicationIdentifier || (v4 = -[_SWCApplicationIdentifier isValid](applicationIdentifier, "isValid")) != 0)
  {
    domain = self->_domain;
    if (!domain || (v4 = -[_SWCDomain isValid](domain, "isValid")) != 0)
    {
      serviceType = self->_serviceType;
      if (serviceType)
        LOBYTE(v4) = _SWCServiceTypeIsWhitelisted(serviceType);
      else
        LOBYTE(v4) = 1;
    }
  }
  return v4;
}

+ (id)_serviceSpecifiersWithEntitlementValue:(id)a3 serviceType:(id)a4 error:(id *)a5
{
  void *v5;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v32;
  void *v33;
  objc_class *v34;
  uint64_t v35;
  void *context;
  id v38;
  id v39;
  id obj;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _BYTE v50[128];
  _QWORD v51[3];
  _QWORD v52[5];

  v52[3] = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v8 = a4;
  context = (void *)MEMORY[0x1A85D4B3C]();
  v41 = v8;
  if (v8 && (_SWCServiceTypeIsWhitelisted(v8) & 1) == 0)
  {
    v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v52[0] = &unk_1E5480E40;
    v51[0] = CFSTR("Line");
    v51[1] = CFSTR("Function");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_SWCServiceSpecifier(Private) _serviceSpecifiersWithEntitlementValue:serviceType:error:]");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v52[1] = obj;
    v51[2] = *MEMORY[0x1E0CB2938];
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Service %@ is not supported."), v8);
    v52[2] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v30, "initWithDomain:code:userInfo:", CFSTR("SWCErrorDomain"), 2, v28);
    goto LABEL_28;
  }
  if (!v39 || (v9 = 0, !_NSIsNSArray()))
  {
    v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v47[0] = &unk_1E5480E70;
    v46[0] = CFSTR("Line");
    v46[1] = CFSTR("Function");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_SWCServiceSpecifier(Private) _serviceSpecifiersWithEntitlementValue:serviceType:error:]");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v47[1] = obj;
    v46[2] = *MEMORY[0x1E0CB2938];
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid entitlement value of class %@"), objc_opt_class());
    v47[2] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "initWithDomain:code:userInfo:", CFSTR("SWCErrorDomain"), 2, v28);
LABEL_28:
    v26 = (void *)v29;
LABEL_29:

    v25 = 0;
    v38 = obj;
LABEL_30:

    goto LABEL_31;
  }
  v10 = objc_msgSend(v8, "length");
  v38 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v34 = (objc_class *)a1;
  v35 = v10;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v39;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (!v11)
    goto LABEL_24;
  v12 = *(_QWORD *)v43;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v43 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      if (!_NSIsNSString())
      {

        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v49[0] = &unk_1E5480E58;
        v48[0] = CFSTR("Line");
        v48[1] = CFSTR("Function");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_SWCServiceSpecifier(Private) _serviceSpecifiersWithEntitlementValue:serviceType:error:]");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v49[1] = v24;
        v48[2] = *MEMORY[0x1E0CB2938];
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid entitlement value (in array) of class %@"), objc_opt_class());
        v49[2] = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v32, "initWithDomain:code:userInfo:", CFSTR("SWCErrorDomain"), 2, v33);

        goto LABEL_29;
      }
      v15 = objc_msgSend(v14, "rangeOfString:", CFSTR(":"));
      v17 = v15;
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v18 = v16;
        if (v41)
        {
          if (v35 != v15)
            continue;
          v19 = objc_msgSend(v14, "compare:options:range:", v41, 1, 0);
          v20 = v41;
          if (v19)
            continue;
        }
        else
        {
          objc_msgSend(v14, "substringToIndex:", v15);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "lowercaseString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v20;
        }
        _SWCServiceTypeCanonicalize(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v41)
        {

        }
        objc_msgSend(v14, "substringFromIndex:", v17 + v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (_SWCServiceTypeIsWhitelisted(v21))
        {
          v23 = (void *)objc_msgSend([v34 alloc], "initWithServiceType:applicationIdentifier:domain:", v21, 0, v22);
          objc_msgSend(v38, "addObject:", v23);

        }
      }
    }
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v11)
      continue;
    break;
  }
LABEL_24:

  if (v38)
  {
    objc_msgSend(v38, "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    v26 = 0;
    goto LABEL_30;
  }
  v26 = 0;
  v25 = 0;
LABEL_31:
  objc_autoreleasePoolPop(context);
  if (a5 && !v25)
    *a5 = objc_retainAutorelease(v26);

  return v25;
}

@end
