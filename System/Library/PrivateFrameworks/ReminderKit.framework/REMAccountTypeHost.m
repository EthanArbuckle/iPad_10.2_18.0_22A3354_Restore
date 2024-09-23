@implementation REMAccountTypeHost

- (BOOL)isLocal
{
  return -[REMAccountTypeHost type](self, "type") == 1;
}

- (BOOL)isCloudKit
{
  return -[REMAccountTypeHost isPrimaryCloudKit](self, "isPrimaryCloudKit")
      || -[REMAccountTypeHost isNonPrimaryCloudKit](self, "isNonPrimaryCloudKit");
}

- (BOOL)isPrimaryCloudKit
{
  return -[REMAccountTypeHost type](self, "type") == 2;
}

- (int64_t)type
{
  return self->_type;
}

- (REMAccountTypeHost)initWithType:(int64_t)a3
{
  REMAccountTypeHost *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMAccountTypeHost;
  result = -[REMAccountTypeHost init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountObjectID, 0);
}

- (BOOL)isNonPrimaryCloudKit
{
  return -[REMAccountTypeHost type](self, "type") == 6;
}

- (BOOL)isCloudBased
{
  return +[REMAccount isCloudBasedAccountType:](REMAccount, "isCloudBasedAccountType:", -[REMAccountTypeHost type](self, "type"));
}

- (BOOL)isCalDav
{
  return -[REMAccountTypeHost type](self, "type") == 3;
}

- (BOOL)isExchange
{
  return -[REMAccountTypeHost type](self, "type") == 4;
}

- (BOOL)isLocalInternal
{
  return -[REMAccountTypeHost type](self, "type") == 5;
}

- (BOOL)isValid
{
  return -[REMAccountTypeHost type](self, "type") >= 1 && -[REMAccountTypeHost type](self, "type") < 7;
}

- (id)description
{
  return (id)NSStringFromREMAccountType(-[REMAccountTypeHost type](self, "type"));
}

- (id)internalDescription
{
  return (id)REMInternalDescriptionFromREMAccountType(-[REMAccountTypeHost type](self, "type"));
}

- (BOOL)isEqual:(id)a3
{
  REMAccountTypeHost *v4;
  int64_t v5;
  BOOL v6;

  v4 = (REMAccountTypeHost *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[REMAccountTypeHost type](self, "type");
      v6 = v5 == -[REMAccountTypeHost type](v4, "type");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (REMObjectID)accountObjectID
{
  return self->_accountObjectID;
}

@end
