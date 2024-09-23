@implementation SURollbackDescriptor

- (SURollbackDescriptor)init
{
  SURollbackDescriptor *v2;
  SURollbackDescriptor *v3;
  NSString *restoreVersion;
  NSString *productVersion;
  NSString *productBuildVersion;
  NSString *releaseType;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SURollbackDescriptor;
  v2 = -[SURollbackDescriptor init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    restoreVersion = v2->_restoreVersion;
    v2->_restoreVersion = 0;

    productVersion = v3->_productVersion;
    v3->_productVersion = 0;

    productBuildVersion = v3->_productBuildVersion;
    v3->_productBuildVersion = 0;

    releaseType = v3->_releaseType;
    v3->_releaseType = 0;

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SURollbackDescriptor)initWithCoder:(id)a3
{
  id v4;
  SURollbackDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SURollbackDescriptor;
  v5 = -[SURollbackDescriptor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restoreVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURollbackDescriptor setRestoreVersion:](v5, "setRestoreVersion:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURollbackDescriptor setProductVersion:](v5, "setProductVersion:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productBuildVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURollbackDescriptor setProductBuildVersion:](v5, "setProductBuildVersion:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURollbackDescriptor setReleaseType:](v5, "setReleaseType:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SURollbackDescriptor restoreVersion](self, "restoreVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("restoreVersion"));

  -[SURollbackDescriptor productVersion](self, "productVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("productVersion"));

  -[SURollbackDescriptor productBuildVersion](self, "productBuildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("productBuildVersion"));

  -[SURollbackDescriptor releaseType](self, "releaseType");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("releaseType"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SURollbackDescriptor restoreVersion](self, "restoreVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRestoreVersion:", v5);

  -[SURollbackDescriptor productVersion](self, "productVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProductVersion:", v6);

  -[SURollbackDescriptor productBuildVersion](self, "productBuildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProductBuildVersion:", v7);

  -[SURollbackDescriptor releaseType](self, "releaseType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReleaseType:", v8);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SURollbackDescriptor restoreVersion](self, "restoreVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SURollbackDescriptor productVersion](self, "productVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SURollbackDescriptor productBuildVersion](self, "productBuildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SURollbackDescriptor releaseType](self, "releaseType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SURollbackDescriptor:\n              RestoreVersion: %@\n              ProductVersion: %@\n              ProductBuildVersion: %@\n              ReleaseType: %@\n"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "restoreVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      || (-[SURollbackDescriptor restoreVersion](self, "restoreVersion"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v6, "restoreVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SURollbackDescriptor restoreVersion](self, "restoreVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if (v7)
      {

        if (!v10)
          goto LABEL_24;
      }
      else
      {

        if ((v10 & 1) == 0)
          goto LABEL_24;
      }
    }
    objc_msgSend(v6, "productVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      || (-[SURollbackDescriptor productVersion](self, "productVersion"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v6, "productVersion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SURollbackDescriptor productVersion](self, "productVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if (v12)
      {

        if (!v15)
          goto LABEL_24;
      }
      else
      {

        if ((v15 & 1) == 0)
          goto LABEL_24;
      }
    }
    objc_msgSend(v6, "productBuildVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      -[SURollbackDescriptor productBuildVersion](self, "productBuildVersion");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
LABEL_19:
        objc_msgSend(v6, "releaseType");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20
          || (-[SURollbackDescriptor releaseType](self, "releaseType"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(v6, "releaseType");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[SURollbackDescriptor releaseType](self, "releaseType");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqualToString:", v22) ^ 1;

          if (v20)
          {
LABEL_29:

            v11 = v23 ^ 1;
            goto LABEL_25;
          }
        }
        else
        {
          LOBYTE(v23) = 0;
        }

        goto LABEL_29;
      }
    }
    objc_msgSend(v6, "productBuildVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURollbackDescriptor productBuildVersion](self, "productBuildVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", v18);

    if (v16)
    {

      if (v19)
        goto LABEL_19;
    }
    else
    {

      if ((v19 & 1) != 0)
        goto LABEL_19;
    }
LABEL_24:
    v11 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v11 = 0;
LABEL_26:

  return v11;
}

- (NSString)restoreVersion
{
  return self->_restoreVersion;
}

- (void)setRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_restoreVersion, a3);
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productVersion, a3);
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (void)setProductBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productBuildVersion, a3);
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_releaseType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releaseType, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_restoreVersion, 0);
}

@end
