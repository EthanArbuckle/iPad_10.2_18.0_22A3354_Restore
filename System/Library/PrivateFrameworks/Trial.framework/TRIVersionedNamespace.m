@implementation TRIVersionedNamespace

- (TRIVersionedNamespace)initWithName:(id)a3 compatibilityVersion:(unsigned int)a4
{
  id v8;
  TRIVersionedNamespace *v9;
  TRIVersionedNamespace *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIVersionedNamespace.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)TRIVersionedNamespace;
  v9 = -[TRIVersionedNamespace init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v10->_compatibilityVersion = a4;
  }

  return v10;
}

+ (id)versionedNamespaceWithName:(id)a3 compatibilityVersion:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:compatibilityVersion:", v6, v4);

  return v7;
}

- (id)copyWithReplacementName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:compatibilityVersion:", v4, self->_compatibilityVersion);

  return v5;
}

- (id)copyWithReplacementCompatibilityVersion:(unsigned int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:compatibilityVersion:", self->_name, *(_QWORD *)&a3);
}

- (BOOL)isEqualToVersionedNamespace:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *name;
  void *v10;
  int v11;
  unsigned int compatibilityVersion;
  BOOL v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  v6 = self->_name != 0;
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8
    || (name = self->_name) != 0
    && (objc_msgSend(v5, "name"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = -[NSString isEqual:](name, "isEqual:", v10),
        v10,
        !v11))
  {
LABEL_6:
    v13 = 0;
  }
  else
  {
    compatibilityVersion = self->_compatibilityVersion;
    v13 = compatibilityVersion == objc_msgSend(v5, "compatibilityVersion");
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  TRIVersionedNamespace *v4;
  TRIVersionedNamespace *v5;
  BOOL v6;

  v4 = (TRIVersionedNamespace *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIVersionedNamespace isEqualToVersionedNamespace:](self, "isEqualToVersionedNamespace:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_name, "hash");
  return self->_compatibilityVersion - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIVersionedNamespace)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  TRIVersionedNamespace *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v17 = *MEMORY[0x1E0CB2D50];
      v18[0] = CFSTR("Retrieved nil serialized value for nonnull TRIVersionedNamespace.name");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v11 = 2;
LABEL_9:
      v13 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("TRIVersionedNamespaceOCNTErrorDomain"), v11, v9);
      objc_msgSend(v4, "failWithError:", v13);

    }
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("compatibilityVersion"));
  if (!(_DWORD)v6)
  {
    objc_msgSend(v4, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("compatibilityVersion")) & 1) != 0)
        goto LABEL_3;
      v15 = *MEMORY[0x1E0CB2D50];
      v16 = CFSTR("Missing serialized value for TRIVersionedNamespace.compatibilityVersion");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v11 = 1;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_3:
  self = -[TRIVersionedNamespace initWithName:compatibilityVersion:](self, "initWithName:compatibilityVersion:", v5, v6);
  v7 = self;
LABEL_11:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *name;
  id v6;

  v4 = a3;
  name = self->_name;
  v6 = v4;
  if (name)
  {
    objc_msgSend(v4, "encodeObject:forKey:", name, CFSTR("name"));
    v4 = v6;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_compatibilityVersion, CFSTR("compatibilityVersion"));

}

- (id)description
{
  id v3;
  NSString *name;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  name = self->_name;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_compatibilityVersion);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIVersionedNamespace | name:%@ compatibilityVersion:%@>"), name, v5);

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
