@implementation PKPassCredentialShare

- (PKPassCredentialShare)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassCredentialShare;
  return -[PKPassCredentialShare init](&v3, sel_init);
}

- (PKPassCredentialShare)initWithSubcredentialDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PKPassCredentialShare *v8;
  uint64_t v9;
  PKPassCredentialShare *v10;
  PKPassCredentialShare *v11;
  void *v12;
  objc_super v14;
  char v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v15 = 0;
    v6 = PKShareStatusFromCarKeyStatus(objc_msgSend(v4, "PKIntegerForKey:", CFSTR("status")), &v15);
    if (!v15
      && ((v9 = v6,
           objc_msgSend(v5, "PKStringForKey:", CFSTR("sharedKeyID")),
           (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
       || (objc_msgSend(v5, "PKStringForKey:", CFSTR("keyId")), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
    {
      v14.receiver = self;
      v14.super_class = (Class)PKPassCredentialShare;
      v10 = -[PKPassCredentialShare init](&v14, sel_init);
      v11 = v10;
      if (v10)
      {
        objc_storeStrong((id *)&v10->_identifier, v7);
        v11->_status = v9;
        objc_msgSend(v5, "PKStringForKey:", CFSTR("deviceType"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_targetDevice = PKPassCredentialShareTargetDeviceFromString(v12);

      }
      self = v11;
    }
    else
    {
      v7 = self;
      self = 0;
    }

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKPassCredentialShare)initWithInvitationData:(id)a3
{
  id v4;
  PKPassCredentialShare *v5;
  PKPassCredentialShare *v6;

  v4 = a3;
  v5 = -[PKPassCredentialShare init](self, "init");
  v6 = v5;
  if (v5)
    -[PKPassCredentialShare updateWithInvitationData:](v5, "updateWithInvitationData:", v4);

  return v6;
}

- (BOOL)isForWatch
{
  int64_t targetDevice;

  targetDevice = self->_targetDevice;
  return targetDevice == 4 || targetDevice == 1;
}

- (void)updateWithInvitationData:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "invitationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassCredentialShare setIdentifier:](self, "setIdentifier:", v4);

  -[PKPassCredentialShare setTargetDevice:](self, "setTargetDevice:", objc_msgSend(v7, "sharingTargetType") == 2);
  v5 = objc_msgSend(v7, "invitationState") - 1;
  if (v5 > 7)
    v6 = 0;
  else
    v6 = qword_1904554F8[v5];
  -[PKPassCredentialShare setStatus:](self, "setStatus:", v6);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassCredentialShare)initWithCoder:(id)a3
{
  id v4;
  PKPassCredentialShare *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *channelTransportIdentifier;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPassCredentialShare;
  v5 = -[PKPassCredentialShare init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("channelTransportIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    channelTransportIdentifier = v5->_channelTransportIdentifier;
    v5->_channelTransportIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetDevice"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_targetDevice = PKPassCredentialShareTargetDeviceFromString(v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = PKShareStatusFromString(v11);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t targetDevice;
  const __CFString *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_channelTransportIdentifier, CFSTR("channelTransportIdentifier"));
  targetDevice = self->_targetDevice;
  if (targetDevice > 5)
    v5 = CFSTR("universal");
  else
    v5 = off_1E2AD2EA0[targetDevice];
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("targetDevice"));
  PKShareStatusToString(self->_status);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("status"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t targetDevice;
  const __CFString *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: "), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  PKSharingLoggableMailboxAddress(self->_channelTransportIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("channelTransportIdentifier: '%@'; "), v7);

  targetDevice = self->_targetDevice;
  if (targetDevice > 5)
    v9 = CFSTR("universal");
  else
    v9 = off_1E2AD2EA0[targetDevice];
  objc_msgSend(v6, "appendFormat:", CFSTR("targetDevice: '%@'; "), v9);
  PKShareStatusToString(self->_status);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("status: '%@'; "), v10);

  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_identifier)
    objc_msgSend(v3, "addObject:");
  if (self->_channelTransportIdentifier)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);
  v6 = self->_targetDevice - v5 + 32 * v5;
  v7 = self->_status - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PKPassCredentialShare *v4;
  PKPassCredentialShare *v5;
  PKPassCredentialShare *v6;
  NSString *identifier;
  NSString *v8;
  NSString *channelTransportIdentifier;
  NSString *v10;

  v4 = (PKPassCredentialShare *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        if (!self)
        {
LABEL_20:

          goto LABEL_21;
        }
        identifier = self->_identifier;
        v8 = v6->_identifier;
        if (identifier && v8)
        {
          if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
            goto LABEL_19;
        }
        else if (identifier != v8)
        {
          goto LABEL_19;
        }
        channelTransportIdentifier = self->_channelTransportIdentifier;
        v10 = v6->_channelTransportIdentifier;
        if (channelTransportIdentifier && v10)
        {
          if ((-[NSString isEqual:](channelTransportIdentifier, "isEqual:") & 1) == 0)
            goto LABEL_19;
        }
        else if (channelTransportIdentifier != v10)
        {
          goto LABEL_19;
        }
        if (self->_targetDevice == v6->_targetDevice)
        {
          LOBYTE(self) = self->_status == v6->_status;
          goto LABEL_20;
        }
LABEL_19:
        LOBYTE(self) = 0;
        goto LABEL_20;
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_21:

  return (char)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_identifier, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_channelTransportIdentifier, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v4[3] = self->_targetDevice;
  v4[4] = self->_status;
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)channelTransportIdentifier
{
  return self->_channelTransportIdentifier;
}

- (void)setChannelTransportIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_channelTransportIdentifier, a3);
}

- (int64_t)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(int64_t)a3
{
  self->_targetDevice = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelTransportIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
