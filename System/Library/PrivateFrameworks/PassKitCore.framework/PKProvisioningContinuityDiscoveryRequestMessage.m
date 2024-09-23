@implementation PKProvisioningContinuityDiscoveryRequestMessage

- (PKProvisioningContinuityDiscoveryRequestMessage)initWithContinuityType:(unint64_t)a3 verifyProximity:(BOOL)a4
{
  _BOOL8 v4;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  PKProvisioningContinuityDiscoveryRequestMessage *v11;
  objc_super v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v4 = a4;
  v15[2] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("carKey");
  if (a3 != 1)
    v6 = 0;
  v14[0] = CFSTR("continuityType");
  v14[1] = CFSTR("verifyProximity");
  v15[0] = v6;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = v6;
  objc_msgSend(v7, "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)PKProvisioningContinuityDiscoveryRequestMessage;
  v11 = -[PKSharingGenericMessage initWithFormat:type:genericSharingDict:appleSharingDict:](&v13, sel_initWithFormat_type_genericSharingDict_appleSharingDict_, 3, 2001, MEMORY[0x1E0C9AA70], v10);

  return v11;
}

- (BOOL)configureWithContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t continuityType;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKProvisioningContinuityDiscoveryRequestMessage;
  if (-[PKSharingGenericMessage configureWithContent:](&v10, sel_configureWithContent_, v4))
  {
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("apple"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "PKStringForKey:", CFSTR("continuityType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_continuityType = PKProvisioningContinuityDiscoveryRequestTypeFromString(v6);

    continuityType = self->_continuityType;
    v8 = continuityType != 0;
    if (continuityType)
      self->_verifyProximity = objc_msgSend(v5, "PKBoolForKey:", CFSTR("verifyProximity"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessage identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), v4);

  PKSharingMessageTypeToString(-[PKSharingMessage type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);

  if (self->_continuityType == 1)
    v6 = CFSTR("carKey");
  else
    v6 = 0;
  objc_msgSend(v3, "appendFormat:", CFSTR("continuityType: '%@'; "), v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_verifyProximity);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("verifyProximity: '%@'; "), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PKProvisioningContinuityDiscoveryRequestMessage *v4;
  PKProvisioningContinuityDiscoveryRequestMessage *v5;
  PKProvisioningContinuityDiscoveryRequestMessage *v6;
  objc_super v8;

  v4 = (PKProvisioningContinuityDiscoveryRequestMessage *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self)
    {
      v8.receiver = self;
      v8.super_class = (Class)PKProvisioningContinuityDiscoveryRequestMessage;
      LOBYTE(self) = -[PKSharingGenericMessage isEqual:](&v8, sel_isEqual_, v6)
                  && self->_continuityType == v6->_continuityType
                  && self->_verifyProximity == v6->_verifyProximity;
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

- (unint64_t)continuityType
{
  return self->_continuityType;
}

- (BOOL)verifyProximity
{
  return self->_verifyProximity;
}

@end
