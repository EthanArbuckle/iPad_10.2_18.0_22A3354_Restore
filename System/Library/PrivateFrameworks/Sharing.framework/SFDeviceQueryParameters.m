@implementation SFDeviceQueryParameters

- (SFDeviceQueryParameters)initWithDeviceAssetQuery:(id)a3 installedOnly:(BOOL)a4 imperfectMatch:(BOOL)a5 fallback:(BOOL)a6
{
  _BOOL4 v8;
  id v10;
  SFDeviceQueryParameters *v11;
  SFDeviceQueryParameters *v12;
  Class (__cdecl *v13)();
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  MAAssetQuery *maQuery;
  objc_super v22;

  v8 = a4;
  v10 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFDeviceQueryParameters;
  v11 = -[SFDeviceQueryParameters init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_installedOnly = v8;
    v11->_imperfectMatch = a5;
    v11->_fallback = a6;
    v13 = (Class (__cdecl *)())getMAAssetQueryClass[0];
    v14 = v10;
    v15 = objc_alloc(v13());
    objc_msgSend(v14, "assetType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithType:", v16);

    if (v8)
      v18 = 1;
    else
      v18 = 2;
    objc_msgSend(v17, "returnTypes:", v18);
    objc_msgSend(v14, "effectiveProductType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    SFDeviceAssetAddKeyValuePair(CFSTR("ProductType"), v19, v17);
    maQuery = v12->_maQuery;
    v12->_maQuery = (MAAssetQuery *)v17;

  }
  return v12;
}

- (id)maAssetQueryDescription
{
  void *v2;
  id v3;
  uint64_t v4;
  id *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  -[SFDeviceQueryParameters maQuery](self, "maQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v10 = objc_opt_class();
  NSAppendPrintF();
  v16 = 0;
  NSAppendPrintF();
  v3 = v16;

  v4 = objc_msgSend(v2, "returnTypes", v10, v2);
  if (v4 == 2)
  {
    v13 = v3;
    v5 = &v13;
  }
  else if (v4 == 1)
  {
    v14 = v3;
    v5 = &v14;
  }
  else if (v4)
  {
    v12 = v3;
    v5 = &v12;
  }
  else
  {
    v15 = v3;
    v5 = &v15;
  }
  NSAppendPrintF();
  v6 = *v5;

  objc_msgSend(v2, "queryParams");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v7 = v6;

  NSAppendPrintF();
  v8 = v7;

  return v8;
}

- (id)description
{
  id v3;
  const char *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v9;
  const char *v10;

  v9 = objc_opt_class();
  NSAppendPrintF();
  v3 = 0;
  if (-[SFDeviceQueryParameters installedOnly](self, "installedOnly", v9, self))
    v4 = "yes";
  else
    v4 = "no";
  v10 = v4;
  NSAppendPrintF();
  v5 = v3;

  -[SFDeviceQueryParameters fallback](self, "fallback", v10);
  NSAppendPrintF();
  v6 = v5;

  NSAppendPrintF();
  v7 = v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SFDeviceQueryParameters *v4;
  SFDeviceQueryParameters *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;

  v4 = (SFDeviceQueryParameters *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SFDeviceQueryParameters maQuery](self, "maQuery");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDeviceQueryParameters maQuery](v5, "maQuery");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {

          goto LABEL_13;
        }
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if (!v11)
          goto LABEL_13;
      }
      v13 = -[SFDeviceQueryParameters installedOnly](self, "installedOnly");
      if (v13 == -[SFDeviceQueryParameters installedOnly](v5, "installedOnly"))
      {
        v14 = -[SFDeviceQueryParameters fallback](self, "fallback");
        v12 = v14 ^ -[SFDeviceQueryParameters fallback](v5, "fallback") ^ 1;
LABEL_14:

        goto LABEL_15;
      }
LABEL_13:
      LOBYTE(v12) = 0;
      goto LABEL_14;
    }
    LOBYTE(v12) = 0;
  }
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SFDeviceQueryParameters maQuery](self, "maQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)queryType
{
  const __CFString *v3;
  const __CFString *v4;

  if (self->_fallback)
    return (NSString *)CFSTR("fallback asset");
  if (self->_imperfectMatch)
    v3 = CFSTR(" (imperfect)");
  else
    v3 = &stru_1E483B8E8;
  if (self->_installedOnly)
    v4 = CFSTR("installed asset%@");
  else
    v4 = CFSTR("catalog asset%@");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (MAAssetQuery)maQuery
{
  return self->_maQuery;
}

- (BOOL)installedOnly
{
  return self->_installedOnly;
}

- (BOOL)imperfectMatch
{
  return self->_imperfectMatch;
}

- (BOOL)fallback
{
  return self->_fallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maQuery, 0);
}

@end
