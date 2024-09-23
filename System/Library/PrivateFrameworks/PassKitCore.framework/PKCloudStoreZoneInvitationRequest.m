@implementation PKCloudStoreZoneInvitationRequest

+ (id)cloudStoreZoneInvitationRequestWithProtobuf:(id)a3
{
  id v4;
  PKCloudStoreZoneInvitationRequest *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(PKCloudStoreZoneInvitationRequest);
  objc_msgSend(v4, "invitation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKCloudStoreZoneInvitation cloudStoreZoneInvitationWithProtobuf:](PKCloudStoreZoneInvitation, "cloudStoreZoneInvitationWithProtobuf:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCloudStoreZoneInvitationRequest setInvitation:](v5, "setInvitation:", v7);

  objc_msgSend(a1, "invitationErrorWithProtobuf:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKCloudStoreZoneInvitationRequest setInvitationError:](v5, "setInvitationError:", v8);
  return v5;
}

- (id)protobuf
{
  PKProtobufCloudStoreZoneInvitationRequest *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(PKProtobufCloudStoreZoneInvitationRequest);
  -[PKCloudStoreZoneInvitationRequest invitation](self, "invitation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "protobuf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufCloudStoreZoneInvitationRequest setInvitation:](v3, "setInvitation:", v5);

  -[PKCloudStoreZoneInvitationRequest invitationError](self, "invitationError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PKCloudStoreZoneInvitationRequest invitationError](self, "invitationError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufCloudStoreZoneInvitationRequest setErrorCode:](v3, "setErrorCode:", objc_msgSend(v7, "code"));

    -[PKCloudStoreZoneInvitationRequest invitationError](self, "invitationError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufCloudStoreZoneInvitationRequest setErrorDomain:](v3, "setErrorDomain:", v9);

    -[PKCloudStoreZoneInvitationRequest invitationError](self, "invitationError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufCloudStoreZoneInvitationRequest setErrorDescription:](v3, "setErrorDescription:", v11);

  }
  return v3;
}

+ (id)invitationErrorWithProtobuf:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "errorDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "errorDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v3, "errorDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "errorCode");
    v9 = *MEMORY[0x1E0CB2D68];
    v13[0] = *MEMORY[0x1E0CB2D50];
    v13[1] = v9;
    v14[0] = v5;
    v14[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreZoneInvitationRequest)initWithCoder:(id)a3
{
  id v4;
  PKCloudStoreZoneInvitationRequest *v5;
  uint64_t v6;
  PKSharingDestination *destination;
  uint64_t v8;
  PKCloudStoreZoneInvitation *invitation;
  uint64_t v10;
  NSError *invitationError;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKCloudStoreZoneInvitationRequest;
  v5 = -[PKCloudStoreZoneInvitationRequest init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destination"));
    v6 = objc_claimAutoreleasedReturnValue();
    destination = v5->_destination;
    v5->_destination = (PKSharingDestination *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invitation"));
    v8 = objc_claimAutoreleasedReturnValue();
    invitation = v5->_invitation;
    v5->_invitation = (PKCloudStoreZoneInvitation *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invitationError"));
    v10 = objc_claimAutoreleasedReturnValue();
    invitationError = v5->_invitationError;
    v5->_invitationError = (NSError *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKSharingDestination *destination;
  id v5;

  destination = self->_destination;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", destination, CFSTR("destination"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_invitation, CFSTR("invitation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_invitationError, CFSTR("invitationError"));

}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_destination);
  objc_msgSend(v3, "safelyAddObject:", self->_invitation);
  objc_msgSend(v3, "safelyAddObject:", self->_invitationError);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  PKSharingDestination *destination;
  PKSharingDestination *v8;
  PKCloudStoreZoneInvitation *invitation;
  PKCloudStoreZoneInvitation *v10;
  NSError *invitationError;
  NSError *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_17;
  destination = self->_destination;
  v8 = (PKSharingDestination *)v6[2];
  if (destination && v8)
  {
    if (!-[PKSharingDestination isEqual:](destination, "isEqual:"))
      goto LABEL_17;
  }
  else if (destination != v8)
  {
    goto LABEL_17;
  }
  invitation = self->_invitation;
  v10 = (PKCloudStoreZoneInvitation *)v6[1];
  if (!invitation || !v10)
  {
    if (invitation == v10)
      goto LABEL_13;
LABEL_17:
    v13 = 0;
    goto LABEL_18;
  }
  if (!-[PKCloudStoreZoneInvitation isEqual:](invitation, "isEqual:"))
    goto LABEL_17;
LABEL_13:
  invitationError = self->_invitationError;
  v12 = (NSError *)v6[3];
  if (invitationError && v12)
    v13 = -[NSError isEqual:](invitationError, "isEqual:");
  else
    v13 = invitationError == v12;
LABEL_18:

  return v13;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("destination: '%@'; "), self->_destination);
  objc_msgSend(v3, "appendFormat:", CFSTR("invitation: '%@'; "), self->_invitation);
  if (self->_invitationError)
    objc_msgSend(v3, "appendFormat:", CFSTR("invitationError: '%@'; "), self->_invitationError);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (PKCloudStoreZoneInvitation)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_invitation, a3);
}

- (PKSharingDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (NSError)invitationError
{
  return self->_invitationError;
}

- (void)setInvitationError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationError, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
}

@end
