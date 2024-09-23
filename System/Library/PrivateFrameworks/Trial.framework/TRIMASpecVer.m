@implementation TRIMASpecVer

- (TRIMASpecVer)initWithSpecifier:(id)a3 version:(id)a4
{
  id v8;
  id v9;
  void *v10;
  TRIMASpecVer *v11;
  TRIMASpecVer *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 3190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("specifier != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 3191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("version != nil"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIMASpecVer;
  v11 = -[TRIMASpecVer init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_specifier, a3);
    objc_storeStrong((id *)&v12->_version, a4);
  }

  return v12;
}

+ (id)specVerWithSpecifier:(id)a3 version:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSpecifier:version:", v7, v6);

  return v8;
}

- (id)copyWithReplacementSpecifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSpecifier:version:", v4, self->_version);

  return v5;
}

- (id)copyWithReplacementVersion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSpecifier:version:", self->_specifier, v4);

  return v5;
}

- (BOOL)isEqualToSpecVer:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *specifier;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *version;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_specifier != 0;
  objc_msgSend(v4, "specifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  specifier = self->_specifier;
  if (specifier)
  {
    objc_msgSend(v5, "specifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](specifier, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_version != 0;
  objc_msgSend(v5, "version");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    version = self->_version;
    if (version)
    {
      objc_msgSend(v5, "version");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSString isEqual:](version, "isEqual:", v16);

    }
    else
    {
      v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  TRIMASpecVer *v4;
  TRIMASpecVer *v5;
  BOOL v6;

  v4 = (TRIMASpecVer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIMASpecVer isEqualToSpecVer:](self, "isEqualToSpecVer:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_specifier, "hash");
  return -[NSString hash](self->_version, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIMASpecVer | specifier:%@ version:%@>"), self->_specifier, self->_version);
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
}

@end
