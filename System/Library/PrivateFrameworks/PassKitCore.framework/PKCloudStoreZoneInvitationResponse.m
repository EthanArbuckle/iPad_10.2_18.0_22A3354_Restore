@implementation PKCloudStoreZoneInvitationResponse

+ (id)cloudStoreZoneInvitationResponseWithProtobuf:(id)a3
{
  id v3;
  PKCloudStoreZoneInvitationResponse *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(PKCloudStoreZoneInvitationResponse);
  objc_msgSend(v3, "invitation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKCloudStoreZoneInvitation cloudStoreZoneInvitationWithProtobuf:](PKCloudStoreZoneInvitation, "cloudStoreZoneInvitationWithProtobuf:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCloudStoreZoneInvitationResponse setInvitation:](v4, "setInvitation:", v6);

  LODWORD(v6) = objc_msgSend(v3, "status");
  -[PKCloudStoreZoneInvitationResponse setStatus:](v4, "setStatus:", v6);
  return v4;
}

- (id)protobuf
{
  PKProtobufCloudStoreZoneInvitationResponse *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(PKProtobufCloudStoreZoneInvitationResponse);
  -[PKCloudStoreZoneInvitationResponse invitation](self, "invitation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "protobuf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufCloudStoreZoneInvitationResponse setInvitation:](v3, "setInvitation:", v5);

  -[PKProtobufCloudStoreZoneInvitationResponse setStatus:](v3, "setStatus:", -[PKCloudStoreZoneInvitationResponse status](self, "status"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreZoneInvitationResponse)initWithCoder:(id)a3
{
  id v4;
  PKCloudStoreZoneInvitationResponse *v5;
  uint64_t v6;
  PKCloudStoreZoneInvitation *invitation;
  uint64_t v8;
  PKSharingDestination *destination;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKCloudStoreZoneInvitationResponse;
  v5 = -[PKCloudStoreZoneInvitationResponse init](&v11, sel_init);
  if (v5)
  {
    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invitation"));
    v6 = objc_claimAutoreleasedReturnValue();
    invitation = v5->_invitation;
    v5->_invitation = (PKCloudStoreZoneInvitation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destination"));
    v8 = objc_claimAutoreleasedReturnValue();
    destination = v5->_destination;
    v5->_destination = (PKSharingDestination *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t status;
  id v5;

  status = self->_status;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", status, CFSTR("status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_invitation, CFSTR("invitation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destination, CFSTR("destination"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_invitation);
  objc_msgSend(v3, "safelyAddObject:", self->_destination);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_status - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  PKCloudStoreZoneInvitation *invitation;
  PKCloudStoreZoneInvitation *v9;
  PKSharingDestination *destination;
  PKSharingDestination *v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (!v6 || self->_status != v6[3])
    goto LABEL_13;
  invitation = self->_invitation;
  v9 = (PKCloudStoreZoneInvitation *)v7[1];
  if (!invitation || !v9)
  {
    if (invitation == v9)
      goto LABEL_9;
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  if (!-[PKCloudStoreZoneInvitation isEqual:](invitation, "isEqual:"))
    goto LABEL_13;
LABEL_9:
  destination = self->_destination;
  v11 = (PKSharingDestination *)v7[2];
  if (destination && v11)
    v12 = -[PKSharingDestination isEqual:](destination, "isEqual:");
  else
    v12 = destination == v11;
LABEL_14:

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t status;
  const __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  status = self->_status;
  if (status > 3)
    v6 = CFSTR("accepted");
  else
    v6 = off_1E2AD3EC8[status];
  objc_msgSend(v3, "appendFormat:", CFSTR("status: '%@'; "), v6);
  objc_msgSend(v4, "appendFormat:", CFSTR("invitation: '%@'; "), self->_invitation);
  objc_msgSend(v4, "appendFormat:", CFSTR("destination: '%@'; "), self->_destination);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
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

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
}

@end
