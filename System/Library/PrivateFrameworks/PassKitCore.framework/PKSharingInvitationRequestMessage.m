@implementation PKSharingInvitationRequestMessage

- (PKSharingInvitationRequestMessage)initWithPassTypeIdentifier:(id)a3 passSerialNumber:(id)a4
{
  PKSharingInvitationRequestMessage *v5;
  void *v7;
  id v8;
  id v9;
  void *v10;
  PKSharingInvitationRequestMessage *v11;
  objc_super v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v5 = 0;
  v15[2] = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v14[0] = CFSTR("passTypeIdentifier");
    v14[1] = CFSTR("serialNumber");
    v15[0] = a3;
    v15[1] = a4;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = a4;
    v9 = a3;
    objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13.receiver = self;
    v13.super_class = (Class)PKSharingInvitationRequestMessage;
    v11 = -[PKSharingGenericMessage initWithFormat:type:genericSharingDict:appleSharingDict:](&v13, sel_initWithFormat_type_genericSharingDict_appleSharingDict_, 3, 1001, MEMORY[0x1E0C9AA70], v10);

    self = v11;
    v5 = self;
  }

  return v5;
}

- (BOOL)configureWithContent:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *passTypeIdentifier;
  NSString *v8;
  NSString *passSerialNumber;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKSharingInvitationRequestMessage;
  if (-[PKSharingGenericMessage configureWithContent:](&v12, sel_configureWithContent_, v4))
  {
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("apple"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "PKStringForKey:", CFSTR("passTypeIdentifier"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = self->_passTypeIdentifier;
    self->_passTypeIdentifier = v6;

    objc_msgSend(v5, "PKStringForKey:", CFSTR("serialNumber"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    passSerialNumber = self->_passSerialNumber;
    self->_passSerialNumber = v8;

    if (self->_passTypeIdentifier)
      v10 = self->_passSerialNumber != 0;
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
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

  objc_msgSend(v3, "appendFormat:", CFSTR("passTypeIdentifier: '%@'; "), self->_passTypeIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("passSerialNumber: '%@'; "), self->_passSerialNumber);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKSharingInvitationRequestMessage *v4;
  PKSharingInvitationRequestMessage *v5;
  PKSharingInvitationRequestMessage *v6;
  NSString *passTypeIdentifier;
  NSString *v8;
  BOOL v9;
  NSString *passSerialNumber;
  NSString *v12;
  objc_super v13;

  v4 = (PKSharingInvitationRequestMessage *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
    goto LABEL_16;
  }
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(self) = 0;
    goto LABEL_16;
  }
  v6 = v5;
  if (self)
  {
    v13.receiver = self;
    v13.super_class = (Class)PKSharingInvitationRequestMessage;
    if (-[PKSharingGenericMessage isEqual:](&v13, sel_isEqual_, v6))
    {
      passTypeIdentifier = self->_passTypeIdentifier;
      v8 = v6->_passTypeIdentifier;
      if (passTypeIdentifier)
        v9 = v8 == 0;
      else
        v9 = 1;
      if (v9)
      {
        if (passTypeIdentifier == v8)
        {
LABEL_18:
          passSerialNumber = self->_passSerialNumber;
          v12 = v6->_passSerialNumber;
          if (passSerialNumber && v12)
            LOBYTE(self) = -[NSString isEqual:](passSerialNumber, "isEqual:");
          else
            LOBYTE(self) = passSerialNumber == v12;
          goto LABEL_13;
        }
      }
      else if ((-[NSString isEqual:](passTypeIdentifier, "isEqual:") & 1) != 0)
      {
        goto LABEL_18;
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_13:

LABEL_16:
  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

@end
