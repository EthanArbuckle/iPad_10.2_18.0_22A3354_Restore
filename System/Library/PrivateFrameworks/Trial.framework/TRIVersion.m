@implementation TRIVersion

+ (id)parseVersionFromString:(id)a3 withPrefix:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t (**v13)(_QWORD, _QWORD, _QWORD);
  TRIVersion *v14;
  void *v15;
  void *v16;
  void *v17;
  TRIVersion *v18;
  NSObject *v19;
  NSObject *v20;
  void *v22;
  void *v23;
  char v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIVersion+Factory.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

  }
  v9 = v7;
  v10 = v9;
  if (v8)
  {
    v10 = v9;
    if (objc_msgSend(v8, "length"))
    {
      if ((objc_msgSend(v9, "hasPrefix:", v8) & 1) == 0)
      {
        v18 = -[TRIVersion initWithMajorVersion:minorVersion:patchVersion:]([TRIVersion alloc], "initWithMajorVersion:minorVersion:patchVersion:", &unk_1E3C19598, &unk_1E3C19598, &unk_1E3C19598);
        v10 = v9;
        goto LABEL_18;
      }
      objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v8, "length"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIVersion+Factory.m"), 27, CFSTR("expected version string to be not nil"));

        v10 = 0;
      }
    }
  }
  objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("."));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __57__TRIVersion_Factory__parseVersionFromString_withPrefix___block_invoke;
    v25[3] = &unk_1E3BFFF30;
    v26 = v11;
    v13 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AC6D30](v25);
    v24 = 1;
    v14 = [TRIVersion alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", ((uint64_t (**)(_QWORD, _QWORD, char *))v13)[2](v13, 0, &v24));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", ((uint64_t (**)(_QWORD, uint64_t, char *))v13)[2](v13, 1, &v24));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", ((uint64_t (**)(_QWORD, uint64_t, char *))v13)[2](v13, 2, &v24));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[TRIVersion initWithMajorVersion:minorVersion:patchVersion:](v14, "initWithMajorVersion:minorVersion:patchVersion:", v15, v16, v17);

    if (!v24)
    {
      TRILogCategory_ClientFramework();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v9;
        _os_log_impl(&dword_19B89C000, v19, OS_LOG_TYPE_DEFAULT, "error in parsing version string %@", buf, 0xCu);
      }

    }
  }
  else
  {
    TRILogCategory_ClientFramework();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      _os_log_impl(&dword_19B89C000, v20, OS_LOG_TYPE_DEFAULT, "could not parse version string %@", buf, 0xCu);
    }

    v18 = -[TRIVersion initWithMajorVersion:minorVersion:patchVersion:]([TRIVersion alloc], "initWithMajorVersion:minorVersion:patchVersion:", &unk_1E3C19598, &unk_1E3C19598, &unk_1E3C19598);
  }

LABEL_18:
  return v18;
}

uint64_t __57__TRIVersion_Factory__parseVersionFromString_withPrefix___block_invoke(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v9;

  if (!*a3 || objc_msgSend(*(id *)(a1 + 32), "count") <= a2)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -1;
  if (!+[TRIMisc convertFromString:usingBase:toI64:](TRIMisc, "convertFromString:usingBase:toI64:", v6, 10, &v9)|| (v7 = v9, v9 < 0))
  {
    v7 = 0;
    *a3 = 0;
  }

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[TRIVersion majorVersion](self, "majorVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "majorVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (!v7)
  {
    -[TRIVersion minorVersion](self, "minorVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "minorVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "compare:", v9);

    if (!v7)
    {
      -[TRIVersion patchVersion](self, "patchVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "patchVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "compare:", v11);

    }
  }

  return v7;
}

- (TRIVersion)initWithMajorVersion:(id)a3 minorVersion:(id)a4 patchVersion:(id)a5
{
  id v10;
  id v11;
  id v12;
  TRIVersion *v13;
  TRIVersion *v14;
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
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 310, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("minorVersion != nil"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 309, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("majorVersion != nil"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 311, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("patchVersion != nil"));

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)TRIVersion;
  v13 = -[TRIVersion init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_majorVersion, a3);
    objc_storeStrong((id *)&v14->_minorVersion, a4);
    objc_storeStrong((id *)&v14->_patchVersion, a5);
  }

  return v14;
}

+ (id)versionWithMajorVersion:(id)a3 minorVersion:(id)a4 patchVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMajorVersion:minorVersion:patchVersion:", v10, v9, v8);

  return v11;
}

- (id)copyWithReplacementMajorVersion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMajorVersion:minorVersion:patchVersion:", v4, self->_minorVersion, self->_patchVersion);

  return v5;
}

- (id)copyWithReplacementMinorVersion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMajorVersion:minorVersion:patchVersion:", self->_majorVersion, v4, self->_patchVersion);

  return v5;
}

- (id)copyWithReplacementPatchVersion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMajorVersion:minorVersion:patchVersion:", self->_majorVersion, self->_minorVersion, v4);

  return v5;
}

- (BOOL)isEqualToVersion:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSNumber *majorVersion;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSNumber *minorVersion;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSNumber *patchVersion;
  void *v22;
  char v23;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_11;
  v6 = self->_majorVersion != 0;
  objc_msgSend(v4, "majorVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_11;
  majorVersion = self->_majorVersion;
  if (majorVersion)
  {
    objc_msgSend(v5, "majorVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSNumber isEqual:](majorVersion, "isEqual:", v10);

    if (!v11)
      goto LABEL_11;
  }
  v12 = self->_minorVersion != 0;
  objc_msgSend(v5, "minorVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_11;
  minorVersion = self->_minorVersion;
  if (minorVersion)
  {
    objc_msgSend(v5, "minorVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSNumber isEqual:](minorVersion, "isEqual:", v16);

    if (!v17)
      goto LABEL_11;
  }
  v18 = self->_patchVersion != 0;
  objc_msgSend(v5, "patchVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    v23 = 0;
  }
  else
  {
    patchVersion = self->_patchVersion;
    if (patchVersion)
    {
      objc_msgSend(v5, "patchVersion");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[NSNumber isEqual:](patchVersion, "isEqual:", v22);

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
  TRIVersion *v4;
  TRIVersion *v5;
  BOOL v6;

  v4 = (TRIVersion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIVersion isEqualToVersion:](self, "isEqualToVersion:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSNumber hash](self->_majorVersion, "hash");
  v4 = -[NSNumber hash](self->_minorVersion, "hash") - v3 + 32 * v3;
  return -[NSNumber hash](self->_patchVersion, "hash") - v4 + 32 * v4;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIVersion | majorVersion:%@ minorVersion:%@ patchVersion:%@>"), self->_majorVersion, self->_minorVersion, self->_patchVersion);
}

- (NSNumber)majorVersion
{
  return self->_majorVersion;
}

- (NSNumber)minorVersion
{
  return self->_minorVersion;
}

- (NSNumber)patchVersion
{
  return self->_patchVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patchVersion, 0);
  objc_storeStrong((id *)&self->_minorVersion, 0);
  objc_storeStrong((id *)&self->_majorVersion, 0);
}

@end
