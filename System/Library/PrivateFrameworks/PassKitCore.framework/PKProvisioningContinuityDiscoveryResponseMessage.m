@implementation PKProvisioningContinuityDiscoveryResponseMessage

- (PKProvisioningContinuityDiscoveryResponseMessage)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKProvisioningContinuityDiscoveryResponseMessage;
  return -[PKSharingGenericMessage initWithFormat:type:genericSharingDict:appleSharingDict:](&v3, sel_initWithFormat_type_genericSharingDict_appleSharingDict_, 3, 2002, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70]);
}

- (BOOL)configureWithContent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKProvisioningContinuityDiscoveryResponseMessage;
  return -[PKSharingGenericMessage configureWithContent:](&v4, sel_configureWithContent_, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessage identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), v4);

  PKSharingMessageTypeToString(-[PKSharingMessage type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKProvisioningContinuityDiscoveryResponseMessage *v4;
  PKProvisioningContinuityDiscoveryResponseMessage *v5;
  objc_super v7;

  v4 = (PKProvisioningContinuityDiscoveryResponseMessage *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self)
    {
      v7.receiver = self;
      v7.super_class = (Class)PKProvisioningContinuityDiscoveryResponseMessage;
      LOBYTE(self) = -[PKSharingGenericMessage isEqual:](&v7, sel_isEqual_, v5);
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
