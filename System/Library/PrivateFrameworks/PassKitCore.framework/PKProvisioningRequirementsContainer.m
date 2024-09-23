@implementation PKProvisioningRequirementsContainer

- (PKProvisioningRequirementsContainer)init
{

  return 0;
}

- (PKProvisioningRequirementsContainer)initWithContainer:(id)a3
{
  id v5;
  PKProvisioningRequirementsContainer *v6;
  PKProvisioningRequirementsContainer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKProvisioningRequirementsContainer;
  v6 = -[PKProvisioningRequirementsContainer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_container, a3);

  return v7;
}

- (id)requirementsByRemovingRequirements:(id)a3
{
  void *v3;
  PKProvisioningRequirementsContainer *v4;

  objc_msgSend(self->_container, "containerMinus:", *((_QWORD *)a3 + 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKProvisioningRequirementsContainer initWithContainer:]([PKProvisioningRequirementsContainer alloc], "initWithContainer:", v3);

  return v4;
}

- (BOOL)containsNotManagedAccount
{
  return objc_msgSend(self->_container, "containsNotManagedAccount");
}

- (id)displayableError
{
  return (id)objc_msgSend(self->_container, "displayableError");
}

- (NSString)provisioningSID
{
  return (NSString *)objc_msgSend(self->_container, "provisioningSID");
}

- (void)setProvisioningSID:(id)a3
{
  objc_msgSend(self->_container, "setProvisioningSID:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKProvisioningRequirementsContainer)initWithCoder:(id)a3
{
  id v4;
  PKProvisioningRequirementsContainer *v5;
  uint64_t v6;
  id container;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKProvisioningRequirementsContainer;
  v5 = -[PKProvisioningRequirementsContainer init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("container"));
    v6 = objc_claimAutoreleasedReturnValue();
    container = v5->_container;
    v5->_container = (id)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_container, CFSTR("container"));
}

- (id)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong(&self->_container, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_container, 0);
}

@end
