@implementation PKCloudStoreZoneShareParticipant

- (PKCloudStoreZoneShareParticipant)initWithParticipant:(id)a3
{
  id v4;
  PKCloudStoreZoneShareParticipant *v5;
  void *v6;
  uint64_t v7;
  CKUserIdentityLookupInfo *lookupInfo;
  uint64_t v9;
  CKDeviceToDeviceShareInvitationToken *invitationToken;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *participantHandle;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKCloudStoreZoneShareParticipant;
  v5 = -[PKCloudStoreZoneShareParticipant init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "userIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lookupInfo");
    v7 = objc_claimAutoreleasedReturnValue();
    lookupInfo = v5->_lookupInfo;
    v5->_lookupInfo = (CKUserIdentityLookupInfo *)v7;

    objc_msgSend(v4, "invitationToken");
    v9 = objc_claimAutoreleasedReturnValue();
    invitationToken = v5->_invitationToken;
    v5->_invitationToken = (CKDeviceToDeviceShareInvitationToken *)v9;

    -[CKUserIdentityLookupInfo emailAddress](v5->_lookupInfo, "emailAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      -[CKUserIdentityLookupInfo phoneNumber](v5->_lookupInfo, "phoneNumber");
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    participantHandle = v5->_participantHandle;
    v5->_participantHandle = v13;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreZoneShareParticipant)initWithCoder:(id)a3
{
  id v4;
  PKCloudStoreZoneShareParticipant *v5;
  uint64_t v6;
  NSString *participantHandle;
  uint64_t v8;
  CKUserIdentityLookupInfo *lookupInfo;
  uint64_t v10;
  CKDeviceToDeviceShareInvitationToken *invitationToken;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKCloudStoreZoneShareParticipant;
  v5 = -[PKCloudStoreZoneShareParticipant init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("participantHandle"));
    v6 = objc_claimAutoreleasedReturnValue();
    participantHandle = v5->_participantHandle;
    v5->_participantHandle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lookupInfo"));
    v8 = objc_claimAutoreleasedReturnValue();
    lookupInfo = v5->_lookupInfo;
    v5->_lookupInfo = (CKUserIdentityLookupInfo *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invitationToken"));
    v10 = objc_claimAutoreleasedReturnValue();
    invitationToken = v5->_invitationToken;
    v5->_invitationToken = (CKDeviceToDeviceShareInvitationToken *)v10;

  }
  return v5;
}

- (id)invitationTokenData
{
  CKDeviceToDeviceShareInvitationToken *invitationToken;
  void *v3;

  invitationToken = self->_invitationToken;
  if (invitationToken)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", invitationToken, 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)lookupInfoData
{
  CKUserIdentityLookupInfo *lookupInfo;
  void *v3;

  lookupInfo = self->_lookupInfo;
  if (lookupInfo)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", lookupInfo, 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *participantHandle;
  id v5;

  participantHandle = self->_participantHandle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", participantHandle, CFSTR("participantHandle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lookupInfo, CFSTR("lookupInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_invitationToken, CFSTR("invitationToken"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKCloudStoreZoneShareParticipant *v5;
  uint64_t v6;
  NSString *participantHandle;
  uint64_t v8;
  CKUserIdentityLookupInfo *lookupInfo;
  uint64_t v10;
  CKDeviceToDeviceShareInvitationToken *invitationToken;

  v5 = -[PKCloudStoreZoneShareParticipant init](+[PKCloudStoreZoneShareParticipant allocWithZone:](PKCloudStoreZoneShareParticipant, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_participantHandle, "copyWithZone:", a3);
  participantHandle = v5->_participantHandle;
  v5->_participantHandle = (NSString *)v6;

  v8 = -[CKUserIdentityLookupInfo copyWithZone:](self->_lookupInfo, "copyWithZone:", a3);
  lookupInfo = v5->_lookupInfo;
  v5->_lookupInfo = (CKUserIdentityLookupInfo *)v8;

  v10 = -[CKDeviceToDeviceShareInvitationToken copyWithZone:](self->_invitationToken, "copyWithZone:", a3);
  invitationToken = v5->_invitationToken;
  v5->_invitationToken = (CKDeviceToDeviceShareInvitationToken *)v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  NSString *participantHandle;
  NSString *v8;
  CKUserIdentityLookupInfo *lookupInfo;
  CKUserIdentityLookupInfo *v10;
  CKDeviceToDeviceShareInvitationToken *invitationToken;
  CKDeviceToDeviceShareInvitationToken *v12;
  char v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_17;
  participantHandle = self->_participantHandle;
  v8 = (NSString *)v6[1];
  if (participantHandle && v8)
  {
    if ((-[NSString isEqual:](participantHandle, "isEqual:") & 1) == 0)
      goto LABEL_17;
  }
  else if (participantHandle != v8)
  {
    goto LABEL_17;
  }
  lookupInfo = self->_lookupInfo;
  v10 = (CKUserIdentityLookupInfo *)v6[2];
  if (!lookupInfo || !v10)
  {
    if (lookupInfo == v10)
      goto LABEL_13;
LABEL_17:
    v13 = 0;
    goto LABEL_18;
  }
  if ((-[CKUserIdentityLookupInfo isEqual:](lookupInfo, "isEqual:") & 1) == 0)
    goto LABEL_17;
LABEL_13:
  invitationToken = self->_invitationToken;
  v12 = (CKDeviceToDeviceShareInvitationToken *)v6[3];
  if (invitationToken && v12)
    v13 = -[CKDeviceToDeviceShareInvitationToken isEqual:](invitationToken, "isEqual:");
  else
    v13 = invitationToken == v12;
LABEL_18:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_participantHandle);
  objc_msgSend(v3, "safelyAddObject:", self->_lookupInfo);
  objc_msgSend(v3, "safelyAddObject:", self->_invitationToken);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("participantHandle: '%@'; "), self->_participantHandle);
  objc_msgSend(v3, "appendFormat:", CFSTR("invitationToken: '%@'; "), self->_invitationToken);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)participantHandle
{
  return self->_participantHandle;
}

- (void)setParticipantHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CKUserIdentityLookupInfo)lookupInfo
{
  return self->_lookupInfo;
}

- (void)setLookupInfo:(id)a3
{
  objc_storeStrong((id *)&self->_lookupInfo, a3);
}

- (CKDeviceToDeviceShareInvitationToken)invitationToken
{
  return self->_invitationToken;
}

- (void)setInvitationToken:(id)a3
{
  objc_storeStrong((id *)&self->_invitationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationToken, 0);
  objc_storeStrong((id *)&self->_lookupInfo, 0);
  objc_storeStrong((id *)&self->_participantHandle, 0);
}

@end
