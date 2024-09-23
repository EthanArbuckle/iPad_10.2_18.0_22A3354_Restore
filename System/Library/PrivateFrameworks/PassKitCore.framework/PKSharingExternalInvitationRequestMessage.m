@implementation PKSharingExternalInvitationRequestMessage

- (PKSharingExternalInvitationRequestMessage)initWithSharingSessionIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PKSharingExternalInvitationRequestMessage *v7;
  PKSharingExternalInvitationRequestMessage *v8;
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v11 = CFSTR("sharingSessionIdentifier");
    v12[0] = a3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10.receiver = self;
    v10.super_class = (Class)PKSharingExternalInvitationRequestMessage;
    v7 = -[PKSharingGenericMessage initWithFormat:type:genericSharingDict:appleSharingDict:](&v10, sel_initWithFormat_type_genericSharingDict_appleSharingDict_, 3, 1002, MEMORY[0x1E0C9AA70], v6);

    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)configureWithContent:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *sharingSessionIdentifier;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKSharingExternalInvitationRequestMessage;
  if (-[PKSharingGenericMessage configureWithContent:](&v10, sel_configureWithContent_, v4))
  {
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("apple"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "PKStringForKey:", CFSTR("sharingSessionIdentifier"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    sharingSessionIdentifier = self->_sharingSessionIdentifier;
    self->_sharingSessionIdentifier = v6;

    v8 = self->_sharingSessionIdentifier != 0;
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
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessage identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), v4);

  PKSharingMessageTypeToString(-[PKSharingMessage type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("sharingSessionIdentifier: '%@'; "), self->_sharingSessionIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKSharingExternalInvitationRequestMessage *v4;
  PKSharingExternalInvitationRequestMessage *v5;
  PKSharingExternalInvitationRequestMessage *v6;
  NSString *sharingSessionIdentifier;
  NSString *v8;
  BOOL v9;
  objc_super v11;

  v4 = (PKSharingExternalInvitationRequestMessage *)a3;
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
      v11.receiver = self;
      v11.super_class = (Class)PKSharingExternalInvitationRequestMessage;
      if (-[PKSharingGenericMessage isEqual:](&v11, sel_isEqual_, v6))
      {
        sharingSessionIdentifier = self->_sharingSessionIdentifier;
        v8 = v6->_sharingSessionIdentifier;
        if (sharingSessionIdentifier)
          v9 = v8 == 0;
        else
          v9 = 1;
        if (v9)
          LOBYTE(self) = sharingSessionIdentifier == v8;
        else
          LOBYTE(self) = -[NSString isEqual:](sharingSessionIdentifier, "isEqual:");
      }
      else
      {
        LOBYTE(self) = 0;
      }
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

- (NSString)sharingSessionIdentifier
{
  return self->_sharingSessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingSessionIdentifier, 0);
}

@end
