@implementation PSUICellularPlanUniversalReference

+ (id)referenceFromPlanItem:(id)a3
{
  id v3;
  PSUICellularPlanUniversalReference *v4;
  void *v5;
  PSUICellularPlanUniversalReference *v6;

  v3 = a3;
  v4 = [PSUICellularPlanUniversalReference alloc];
  objc_msgSend(v3, "iccid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PSUICellularPlanUniversalReference initWithIccid:](v4, "initWithIccid:", v5);
  return v6;
}

+ (id)referenceFromDanglingPlanItem:(id)a3
{
  id v3;
  PSUICellularPlanUniversalReference *v4;
  void *v5;
  PSUICellularPlanUniversalReference *v6;

  v3 = a3;
  v4 = [PSUICellularPlanUniversalReference alloc];
  objc_msgSend(v3, "iccid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PSUICellularPlanUniversalReference initWithIccid:](v4, "initWithIccid:", v5);
  return v6;
}

+ (id)referenceFromCellularPlanPendingTransfer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  PSUICellularPlanUniversalReference *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "sourceIccid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("TRANSFER:%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PSUICellularPlanUniversalReference initWithIccid:]([PSUICellularPlanUniversalReference alloc], "initWithIccid:", v5);
  return v6;
}

- (PSUICellularPlanUniversalReference)initWithCoder:(id)a3
{
  void *v4;
  PSUICellularPlanUniversalReference *v5;

  objc_msgSend(a3, "decodeObjectForKey:", CFSTR("ICCID_KEY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PSUICellularPlanUniversalReference initWithIccid:](self, "initWithIccid:", v4);

  return v5;
}

- (PSUICellularPlanUniversalReference)initWithIccid:(id)a3
{
  id v5;
  PSUICellularPlanUniversalReference *v6;
  PSUICellularPlanUniversalReference *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSUICellularPlanUniversalReference;
  v6 = -[PSUICellularPlanUniversalReference init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_iccid, a3);

  return v7;
}

- (PSUICellularPlanUniversalReference)init
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanUniversalReference getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[PSUICellularPlanUniversalReference init]";
    _os_log_error_impl(&dword_2161C6000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer"), CFSTR("Unsupported initializer called"), 0));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PSUICellularPlanUniversalReference initWithIccid:]([PSUICellularPlanUniversalReference alloc], "initWithIccid:", self->_iccid);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_iccid, CFSTR("ICCID_KEY"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *iccid;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    iccid = self->_iccid;
    objc_msgSend(v4, "iccid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqualToString:](iccid, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_iccid, "hash") ^ 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ iccid:%@>"), objc_opt_class(), self->_iccid);
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CellularPlanUniversalReference"));
}

- (NSString)iccid
{
  return self->_iccid;
}

- (void)setIccid:(id)a3
{
  objc_storeStrong((id *)&self->_iccid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iccid, 0);
}

@end
