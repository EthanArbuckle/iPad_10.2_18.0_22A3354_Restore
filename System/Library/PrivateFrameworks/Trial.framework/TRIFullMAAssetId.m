@implementation TRIFullMAAssetId

- (TRIFullMAAssetId)initWithType:(id)a3 specifier:(id)a4 version:(id)a5
{
  id v10;
  id v11;
  id v12;
  TRIFullMAAssetId *v13;
  TRIFullMAAssetId *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 3265, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("specifier != nil"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 3264, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != nil"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 3266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("version != nil"));

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)TRIFullMAAssetId;
  v13 = -[TRIFullMAAssetId init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_type, a3);
    objc_storeStrong((id *)&v14->_specifier, a4);
    objc_storeStrong((id *)&v14->_version, a5);
  }

  return v14;
}

+ (id)identWithType:(id)a3 specifier:(id)a4 version:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:specifier:version:", v10, v9, v8);

  return v11;
}

- (id)copyWithReplacementType:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:specifier:version:", v4, self->_specifier, self->_version);

  return v5;
}

- (id)copyWithReplacementSpecifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:specifier:version:", self->_type, v4, self->_version);

  return v5;
}

- (id)copyWithReplacementVersion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:specifier:version:", self->_type, self->_specifier, v4);

  return v5;
}

- (BOOL)isEqualToIdent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *type;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *specifier;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSString *version;
  void *v22;
  char v23;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_11;
  v6 = self->_type != 0;
  objc_msgSend(v4, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_11;
  type = self->_type;
  if (type)
  {
    objc_msgSend(v5, "type");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](type, "isEqual:", v10);

    if (!v11)
      goto LABEL_11;
  }
  v12 = self->_specifier != 0;
  objc_msgSend(v5, "specifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_11;
  specifier = self->_specifier;
  if (specifier)
  {
    objc_msgSend(v5, "specifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqual:](specifier, "isEqual:", v16);

    if (!v17)
      goto LABEL_11;
  }
  v18 = self->_version != 0;
  objc_msgSend(v5, "version");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    v23 = 0;
  }
  else
  {
    version = self->_version;
    if (version)
    {
      objc_msgSend(v5, "version");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[NSString isEqual:](version, "isEqual:", v22);

    }
    else
    {
      v23 = 1;
    }
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  TRIFullMAAssetId *v4;
  TRIFullMAAssetId *v5;
  BOOL v6;

  v4 = (TRIFullMAAssetId *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIFullMAAssetId isEqualToIdent:](self, "isEqualToIdent:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_type, "hash");
  v4 = -[NSString hash](self->_specifier, "hash") - v3 + 32 * v3;
  return -[NSString hash](self->_version, "hash") - v4 + 32 * v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFullMAAssetId)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  char v10;
  objc_class *v11;
  uint64_t v12;
  void *v13;
  TRIFullMAAssetId *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  objc_class *v28;
  void *v29;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = (objc_class *)objc_opt_class();
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("specifier"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(v4, "error");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v9 = 0;
          v14 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v37 = *MEMORY[0x1E0CB2D50];
        v38 = CFSTR("Retrieved nil serialized value for nonnull TRIFullMAAssetId.specifier");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIFullMAAssetIdOCNTErrorDomain"), 2, v13);
        objc_msgSend(v4, "failWithError:", v23);

        v9 = 0;
        goto LABEL_22;
      }
      v9 = (void *)v8;
      objc_opt_class();
      v10 = objc_opt_isKindOfClass();
      v11 = (objc_class *)objc_opt_class();
      if ((v10 & 1) != 0)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, CFSTR("version"));
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          objc_msgSend(v4, "error");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
          {
            v33 = *MEMORY[0x1E0CB2D50];
            v34 = CFSTR("Retrieved nil serialized value for nonnull TRIFullMAAssetId.version");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIFullMAAssetIdOCNTErrorDomain"), 2, v25);
            objc_msgSend(v4, "failWithError:", v26);

          }
          v13 = 0;
          goto LABEL_22;
        }
        v13 = (void *)v12;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          self = -[TRIFullMAAssetId initWithType:specifier:version:](self, "initWithType:specifier:version:", v5, v9, v13);
          v14 = self;
LABEL_23:

          goto LABEL_24;
        }
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIFullMAAssetId key \"version\" (expected %@, decoded %@)"), v17, v18, 0);
        v31 = *MEMORY[0x1E0CB2D50];
        v32 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIFullMAAssetIdOCNTErrorDomain"), 3, v22);
        objc_msgSend(v4, "failWithError:", v29);

      }
      else
      {
        NSStringFromClass(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIFullMAAssetId key \"specifier\" (expected %@, decoded %@)"), v13, v17, 0);
        v35 = *MEMORY[0x1E0CB2D50];
        v36 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIFullMAAssetIdOCNTErrorDomain"), 3, v19);
        objc_msgSend(v4, "failWithError:", v22);
      }

    }
    else
    {
      NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIFullMAAssetId key \"type\" (expected %@, decoded %@)"), v9, v13, 0);
      v39 = *MEMORY[0x1E0CB2D50];
      v40 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIFullMAAssetIdOCNTErrorDomain"), 3, v18);
      objc_msgSend(v4, "failWithError:", v19);
    }

LABEL_22:
    v14 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v4, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v41 = *MEMORY[0x1E0CB2D50];
    v42[0] = CFSTR("Retrieved nil serialized value for nonnull TRIFullMAAssetId.type");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIFullMAAssetIdOCNTErrorDomain"), 2, v9);
    objc_msgSend(v4, "failWithError:", v13);
    goto LABEL_22;
  }
  v14 = 0;
LABEL_25:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *type;
  NSString *specifier;
  NSString *version;
  id v8;

  v4 = a3;
  type = self->_type;
  v8 = v4;
  if (type)
  {
    objc_msgSend(v4, "encodeObject:forKey:", type, CFSTR("type"));
    v4 = v8;
  }
  specifier = self->_specifier;
  if (specifier)
  {
    objc_msgSend(v8, "encodeObject:forKey:", specifier, CFSTR("specifier"));
    v4 = v8;
  }
  version = self->_version;
  if (version)
  {
    objc_msgSend(v8, "encodeObject:forKey:", version, CFSTR("version"));
    v4 = v8;
  }

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIFullMAAssetId | type:%@ specifier:%@ version:%@>"), self->_type, self->_specifier, self->_version);
}

- (NSString)type
{
  return self->_type;
}

- (NSString)specifier
{
  return self->_specifier;
}

- (NSString)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
