@implementation TRINamespaceRecord

- (TRINamespaceRecord)initWithName:(id)a3 compatibilityVersion:(unsigned int)a4 treatmentURL:(id)a5
{
  id v10;
  id v11;
  TRINamespaceRecord *v12;
  TRINamespaceRecord *v13;
  void *v15;
  objc_super v16;

  v10 = a3;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 505, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name != nil"));

  }
  v16.receiver = self;
  v16.super_class = (Class)TRINamespaceRecord;
  v12 = -[TRINamespaceRecord init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    v13->_compatibilityVersion = a4;
    objc_storeStrong((id *)&v13->_treatmentURL, a5);
  }

  return v13;
}

+ (id)recordWithName:(id)a3 compatibilityVersion:(unsigned int)a4 treatmentURL:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:compatibilityVersion:treatmentURL:", v9, v5, v8);

  return v10;
}

- (id)copyWithReplacementName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:compatibilityVersion:treatmentURL:", v4, self->_compatibilityVersion, self->_treatmentURL);

  return v5;
}

- (id)copyWithReplacementCompatibilityVersion:(unsigned int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:compatibilityVersion:treatmentURL:", self->_name, *(_QWORD *)&a3, self->_treatmentURL);
}

- (id)copyWithReplacementTreatmentURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:compatibilityVersion:treatmentURL:", self->_name, self->_compatibilityVersion, v4);

  return v5;
}

- (BOOL)isEqualToRecord:(id)a3
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
  int v13;
  void *v14;
  int v15;
  NSURL *treatmentURL;
  void *v17;
  char v18;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  v6 = self->_name != 0;
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_9;
  name = self->_name;
  if (name)
  {
    objc_msgSend(v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](name, "isEqual:", v10);

    if (!v11)
      goto LABEL_9;
  }
  compatibilityVersion = self->_compatibilityVersion;
  if (compatibilityVersion != objc_msgSend(v5, "compatibilityVersion")
    || (v13 = self->_treatmentURL != 0,
        objc_msgSend(v5, "treatmentURL"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = v14 == 0,
        v14,
        v13 == v15))
  {
LABEL_9:
    v18 = 0;
  }
  else
  {
    treatmentURL = self->_treatmentURL;
    if (treatmentURL)
    {
      objc_msgSend(v5, "treatmentURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[NSURL isEqual:](treatmentURL, "isEqual:", v17);

    }
    else
    {
      v18 = 1;
    }
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  TRINamespaceRecord *v4;
  TRINamespaceRecord *v5;
  BOOL v6;

  v4 = (TRINamespaceRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRINamespaceRecord isEqualToRecord:](self, "isEqualToRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = self->_compatibilityVersion - v3 + 32 * v3;
  return -[NSURL hash](self->_treatmentURL, "hash") - v4 + 32 * v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRINamespaceRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  TRINamespaceRecord *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v19 = *MEMORY[0x1E0CB2D50];
      v20[0] = CFSTR("Retrieved nil serialized value for nonnull TRINamespaceRecord.name");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = 2;
LABEL_10:
      v14 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", CFSTR("TRINamespaceRecordOCNTErrorDomain"), v12, v10);
      objc_msgSend(v4, "failWithError:", v14);

    }
LABEL_11:
    v8 = 0;
    goto LABEL_15;
  }
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("compatibilityVersion"));
  if ((_DWORD)v6)
    goto LABEL_3;
  objc_msgSend(v4, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    goto LABEL_11;
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("compatibilityVersion")) & 1) == 0)
  {
    v17 = *MEMORY[0x1E0CB2D50];
    v18 = CFSTR("Missing serialized value for TRINamespaceRecord.compatibilityVersion");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v12 = 1;
    goto LABEL_10;
  }
LABEL_3:
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("treatmentURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_msgSend(v4, "error"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v15))
  {
    self = -[TRINamespaceRecord initWithName:compatibilityVersion:treatmentURL:](self, "initWithName:compatibilityVersion:treatmentURL:", v5, v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

LABEL_15:
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  NSURL *treatmentURL;
  id v6;

  v6 = a3;
  name = self->_name;
  if (name)
    objc_msgSend(v6, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_compatibilityVersion, CFSTR("compatibilityVersion"));
  treatmentURL = self->_treatmentURL;
  if (treatmentURL)
    objc_msgSend(v6, "encodeObject:forKey:", treatmentURL, CFSTR("treatmentURL"));

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
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRINamespaceRecord | name:%@ compatibilityVersion:%@ treatmentURL:%@>"), name, v5, self->_treatmentURL);

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

- (NSURL)treatmentURL
{
  return self->_treatmentURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
