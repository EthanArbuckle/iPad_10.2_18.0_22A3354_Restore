@implementation STUsageDetailItem

- (STUsageDetailItem)initWithType:(int64_t)a3 identifier:(id)a4 usageTrusted:(BOOL)a5
{
  id v7;
  STUsageDetailItem *v8;
  uint64_t v9;
  NSString *identifier;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STUsageDetailItem;
  v7 = a4;
  v8 = -[STUsageDetailItem init](&v12, sel_init);
  v8->_type = a3;
  v9 = objc_msgSend(v7, "copy", v12.receiver, v12.super_class);

  identifier = v8->_identifier;
  v8->_identifier = (NSString *)v9;

  v8->_quantity = 0.0;
  v8->_usageTrusted = a5;
  return v8;
}

- (STUsageDetailItem)initWithType:(int64_t)a3 identifier:(id)a4
{
  return -[STUsageDetailItem initWithType:identifier:usageTrusted:](self, "initWithType:identifier:usageTrusted:", a3, a4, 1);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[STUsageDetailItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  int v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[STUsageDetailItem identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      v8 = -[STUsageDetailItem usageTrusted](self, "usageTrusted");
      v9 = v8 ^ objc_msgSend(v5, "usageTrusted") ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (id)keyPathsForValuesAffectingIsAllAppsOrCategories
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("identifier"));
}

- (BOOL)isAllAppsOrCategories
{
  void *v2;
  char v3;

  -[STUsageDetailItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("__AllAppsAndCategories__")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("__AllApps__")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("__AllCategories__"));
  }

  return v3;
}

+ (id)keyPathsForValuesAffectingSortQuantity
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("isAllAppsOrCategories"), CFSTR("quantity"), 0);
}

- (float)sortQuantity
{
  float result;

  if (-[STUsageDetailItem isAllAppsOrCategories](self, "isAllAppsOrCategories"))
    return 3.4028e38;
  -[STUsageDetailItem quantity](self, "quantity");
  return result;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (float)quantity
{
  return self->_quantity;
}

- (void)setQuantity:(float)a3
{
  self->_quantity = a3;
}

- (BOOL)usageTrusted
{
  return self->_usageTrusted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
