@implementation _UIImageCacheKey

+ (id)keyWithName:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  v7 = objc_opt_new();
  v8 = objc_msgSend(v6, "copy");

  v9 = *(void **)(v7 + 8);
  *(_QWORD *)(v7 + 8) = v8;

  v10 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v5;
  v11 = v5;

  v12 = *(void **)(v7 + 24);
  *(_QWORD *)(v7 + 24) = 0;

  *(_BYTE *)(v7 + 32) &= 0xFCu;
  return (id)v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;

  v3 = *(_BYTE *)&self->_flags & 3;
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  v5 = -[UIImageConfiguration hash](self->_configuration, "hash");
  return v4 ^ v5 ^ -[NSBundle hash](self->_bundle, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)isEqual:(id)a3
{
  _UIImageCacheKey *v4;
  _UIImageCacheKey *v5;
  _UIImageCacheKey *v6;
  _UIImageCacheKey *v7;
  _BOOL4 v8;
  NSString *name;
  UIImageConfiguration *v10;
  UIImageConfiguration *v11;
  UIImageConfiguration *v12;
  UIImageConfiguration *configuration;
  UIImageConfiguration *v14;
  NSBundle *bundle;
  NSBundle *v16;
  UIImageConfiguration *v17;

  v4 = (_UIImageCacheKey *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v7 = v6;
        if (((*(_BYTE *)&v6->_flags ^ *(_BYTE *)&self->_flags) & 3) != 0)
        {
          LOBYTE(v8) = 0;
LABEL_26:

          goto LABEL_27;
        }
        name = v6->_name;
        v10 = self->_name;
        v11 = name;
        if (v10 == v11)
        {

        }
        else
        {
          v12 = v11;
          LOBYTE(v8) = 0;
          if (!v10 || !v11)
            goto LABEL_25;
          v8 = -[UIImageConfiguration isEqual:](v10, "isEqual:", v11);

          if (!v8)
            goto LABEL_26;
        }
        configuration = v7->_configuration;
        v10 = self->_configuration;
        v14 = configuration;
        if (v10 == v14)
        {

LABEL_20:
          bundle = self->_bundle;
          v16 = v7->_bundle;
          v10 = bundle;
          v17 = v16;
          v12 = v17;
          if (v10 == v17)
          {
            LOBYTE(v8) = 1;
          }
          else
          {
            LOBYTE(v8) = 0;
            if (v10 && v17)
              LOBYTE(v8) = -[UIImageConfiguration isEqual:](v10, "isEqual:", v17);
          }
          goto LABEL_25;
        }
        v12 = v14;
        LOBYTE(v8) = 0;
        if (v10 && v14)
        {
          v8 = -[UIImageConfiguration isEqual:](v10, "isEqual:", v14);

          if (!v8)
            goto LABEL_26;
          goto LABEL_20;
        }
LABEL_25:

        goto LABEL_26;
      }
    }
    LOBYTE(v8) = 0;
  }
LABEL_27:

  return v8;
}

+ (id)keyWithSystemName:(id)a3 private:(BOOL)a4 configuration:(id)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  v9 = objc_opt_new();
  v10 = objc_msgSend(v8, "copy");

  v11 = *(void **)(v9 + 8);
  *(_QWORD *)(v9 + 8) = v10;

  v12 = *(void **)(v9 + 16);
  *(_QWORD *)(v9 + 16) = v7;
  v13 = v7;

  v14 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = 0;

  if (v5)
    v15 = 3;
  else
    v15 = 1;
  *(_BYTE *)(v9 + 32) = *(_BYTE *)(v9 + 32) & 0xFC | v15;
  return (id)v9;
}

+ (id)keyWithName:(id)a3 configuration:(id)a4 bundle:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_opt_new();
  v11 = objc_msgSend(v9, "copy");

  v12 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v11;

  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v7;
  v14 = v7;

  v15 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v8;

  *(_BYTE *)(v10 + 32) &= 0xFCu;
  return (id)v10;
}

- (id)description
{
  UIImageConfiguration *configuration;
  NSBundle *bundle;
  uint64_t v5;

  configuration = self->_configuration;
  if (!configuration)
    configuration = (UIImageConfiguration *)CFSTR("nil");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("systemImage(\"%@\", %@)"), self->_name, configuration, v5);
  }
  else
  {
    bundle = self->_bundle;
    if (!bundle)
      bundle = (NSBundle *)CFSTR("nil");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("image(\"%@\", %@, %@)"), self->_name, configuration, bundle);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
