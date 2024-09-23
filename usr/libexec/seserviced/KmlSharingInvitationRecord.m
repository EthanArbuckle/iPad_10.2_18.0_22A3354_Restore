@implementation KmlSharingInvitationRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *ownerIdsIdentifier;
  NSData *invitationFromOwner;
  NSData *signingRequest;
  NSData *ppidEncryptionEphemeralSecretKey;
  NSData *preTrackRequest;
  NSString *friendKeyIdentifier;
  unint64_t numberOfPinAttempts;
  id v11;

  v11 = a3;
  if (self)
  {
    objc_msgSend(v11, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
    ownerIdsIdentifier = self->_ownerIdsIdentifier;
  }
  else
  {
    objc_msgSend(v11, "encodeObject:forKey:", 0, CFSTR("uuid"));
    ownerIdsIdentifier = 0;
  }
  objc_msgSend(v11, "encodeObject:forKey:", ownerIdsIdentifier, CFSTR("ownerIdsIdentifier"));
  if (self)
  {
    objc_msgSend(v11, "encodeObject:forKey:", self->_crossPlatformMailboxIdentifier, CFSTR("crossPlatformMailboxIdentifier"));
    invitationFromOwner = self->_invitationFromOwner;
  }
  else
  {
    objc_msgSend(v11, "encodeObject:forKey:", 0, CFSTR("crossPlatformMailboxIdentifier"));
    invitationFromOwner = 0;
  }
  objc_msgSend(v11, "encodeObject:forKey:", invitationFromOwner, CFSTR("invitationFromOwner"));
  if (self)
  {
    objc_msgSend(v11, "encodeObject:forKey:", self->_bindingAttestation, CFSTR("bindingAttestation"));
    signingRequest = self->_signingRequest;
  }
  else
  {
    objc_msgSend(v11, "encodeObject:forKey:", 0, CFSTR("bindingAttestation"));
    signingRequest = 0;
  }
  objc_msgSend(v11, "encodeObject:forKey:", signingRequest, CFSTR("signingRequest"));
  if (self)
  {
    objc_msgSend(v11, "encodeObject:forKey:", self->_ppidEncryptionEphemeralPublicKey, CFSTR("ppidEncryptionEphemeralPublicKey"));
    ppidEncryptionEphemeralSecretKey = self->_ppidEncryptionEphemeralSecretKey;
  }
  else
  {
    objc_msgSend(v11, "encodeObject:forKey:", 0, CFSTR("ppidEncryptionEphemeralPublicKey"));
    ppidEncryptionEphemeralSecretKey = 0;
  }
  objc_msgSend(v11, "encodeObject:forKey:", ppidEncryptionEphemeralSecretKey, CFSTR("ppidEncryptionEphemeralSecretKey"));
  if (self)
  {
    objc_msgSend(v11, "encodeObject:forKey:", self->_ppidFetchRequest, CFSTR("ppidFetchRequest"));
    preTrackRequest = self->_preTrackRequest;
  }
  else
  {
    objc_msgSend(v11, "encodeObject:forKey:", 0, CFSTR("ppidFetchRequest"));
    preTrackRequest = 0;
  }
  objc_msgSend(v11, "encodeObject:forKey:", preTrackRequest, CFSTR("preTrackRequest"));
  if (self)
  {
    objc_msgSend(v11, "encodeInteger:forKey:", self->_friendSideState, CFSTR("friendSideState"));
    friendKeyIdentifier = self->_friendKeyIdentifier;
  }
  else
  {
    objc_msgSend(v11, "encodeInteger:forKey:", 0, CFSTR("friendSideState"));
    friendKeyIdentifier = 0;
  }
  objc_msgSend(v11, "encodeObject:forKey:", friendKeyIdentifier, CFSTR("friendKeyIdentifier"));
  if (self)
  {
    objc_msgSend(v11, "encodeObject:forKey:", self->_invitationIdentifier, CFSTR("invitationIdentifier"));
    numberOfPinAttempts = self->_numberOfPinAttempts;
  }
  else
  {
    objc_msgSend(v11, "encodeObject:forKey:", 0, CFSTR("invitationIdentifier"));
    numberOfPinAttempts = 0;
  }
  objc_msgSend(v11, "encodeInteger:forKey:", numberOfPinAttempts, CFSTR("numberOfPinAttempts"));

}

- (KmlSharingInvitationRecord)initWithCoder:(id)a3
{
  id v4;
  KmlSharingInvitationRecord *v5;
  KmlSharingInvitationRecord *v6;
  id v7;
  uint64_t v8;
  NSUUID *uuid;
  id v10;
  uint64_t v11;
  NSString *ownerIdsIdentifier;
  id v13;
  uint64_t v14;
  NSString *crossPlatformMailboxIdentifier;
  id v16;
  uint64_t v17;
  NSData *invitationFromOwner;
  id v19;
  uint64_t v20;
  NSData *bindingAttestation;
  id v22;
  uint64_t v23;
  NSData *signingRequest;
  id v25;
  uint64_t v26;
  NSData *ppidEncryptionEphemeralPublicKey;
  id v28;
  uint64_t v29;
  NSData *ppidEncryptionEphemeralSecretKey;
  id v31;
  uint64_t v32;
  NSData *ppidFetchRequest;
  id v34;
  uint64_t v35;
  NSData *preTrackRequest;
  id v37;
  uint64_t v38;
  NSString *friendKeyIdentifier;
  id v40;
  uint64_t v41;
  NSString *invitationIdentifier;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)KmlSharingInvitationRecord;
  v5 = -[KmlSharingInvitationRecord init](&v44, "init");
  v6 = v5;
  if (v5)
  {
    v5->_dirty = 0;
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("uuid"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v8;

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("ownerIdsIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    ownerIdsIdentifier = v6->_ownerIdsIdentifier;
    v6->_ownerIdsIdentifier = (NSString *)v11;

    v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("crossPlatformMailboxIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue(v13);
    crossPlatformMailboxIdentifier = v6->_crossPlatformMailboxIdentifier;
    v6->_crossPlatformMailboxIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("invitationFromOwner"));
    v17 = objc_claimAutoreleasedReturnValue(v16);
    invitationFromOwner = v6->_invitationFromOwner;
    v6->_invitationFromOwner = (NSData *)v17;

    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("bindingAttestation"));
    v20 = objc_claimAutoreleasedReturnValue(v19);
    bindingAttestation = v6->_bindingAttestation;
    v6->_bindingAttestation = (NSData *)v20;

    v22 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("signingRequest"));
    v23 = objc_claimAutoreleasedReturnValue(v22);
    signingRequest = v6->_signingRequest;
    v6->_signingRequest = (NSData *)v23;

    v25 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("ppidEncryptionEphemeralPublicKey"));
    v26 = objc_claimAutoreleasedReturnValue(v25);
    ppidEncryptionEphemeralPublicKey = v6->_ppidEncryptionEphemeralPublicKey;
    v6->_ppidEncryptionEphemeralPublicKey = (NSData *)v26;

    v28 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("ppidEncryptionEphemeralSecretKey"));
    v29 = objc_claimAutoreleasedReturnValue(v28);
    ppidEncryptionEphemeralSecretKey = v6->_ppidEncryptionEphemeralSecretKey;
    v6->_ppidEncryptionEphemeralSecretKey = (NSData *)v29;

    v31 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("ppidFetchRequest"));
    v32 = objc_claimAutoreleasedReturnValue(v31);
    ppidFetchRequest = v6->_ppidFetchRequest;
    v6->_ppidFetchRequest = (NSData *)v32;

    v34 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("preTrackRequest"));
    v35 = objc_claimAutoreleasedReturnValue(v34);
    preTrackRequest = v6->_preTrackRequest;
    v6->_preTrackRequest = (NSData *)v35;

    v6->_friendSideState = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("friendSideState"));
    v37 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("friendKeyIdentifier"));
    v38 = objc_claimAutoreleasedReturnValue(v37);
    friendKeyIdentifier = v6->_friendKeyIdentifier;
    v6->_friendKeyIdentifier = (NSString *)v38;

    v40 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("invitationIdentifier"));
    v41 = objc_claimAutoreleasedReturnValue(v40);
    invitationIdentifier = v6->_invitationIdentifier;
    v6->_invitationIdentifier = (NSString *)v41;

    v6->_numberOfPinAttempts = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numberOfPinAttempts"));
  }

  return v6;
}

- (KmlSharingInvitationRecord)init
{
  KmlSharingInvitationRecord *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KmlSharingInvitationRecord;
  result = -[KmlSharingInvitationRecord init](&v3, "init");
  if (result)
    result->_dirty = 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  KmlSharingInvitationRecord *v5;
  NSUUID *v6;
  NSUUID *uuid;
  NSString *v8;
  NSString *ownerIdsIdentifier;
  NSString *v10;
  NSString *crossPlatformMailboxIdentifier;
  NSData *v12;
  NSData *invitationFromOwner;
  NSString *v14;
  NSString *friendKeyIdentifier;
  NSString *v16;
  NSString *invitationIdentifier;
  NSData *v18;
  NSData *bindingAttestation;
  NSData *v20;
  NSData *signingRequest;
  NSData *v22;
  NSData *ppidEncryptionEphemeralPublicKey;
  NSData *v24;
  NSData *ppidEncryptionEphemeralSecretKey;
  NSData *v26;
  NSData *ppidFetchRequest;
  NSData *v28;
  NSData *preTrackRequest;

  v5 = -[KmlSharingInvitationRecord init](+[KmlSharingInvitationRecord allocWithZone:](KmlSharingInvitationRecord, "allocWithZone:"), "init");
  if (v5)
  {
    v6 = (NSUUID *)-[NSUUID copyWithZone:](self->_uuid, "copyWithZone:", a3);
    uuid = v5->_uuid;
    v5->_uuid = v6;

    v8 = (NSString *)-[NSString copyWithZone:](self->_ownerIdsIdentifier, "copyWithZone:", a3);
    ownerIdsIdentifier = v5->_ownerIdsIdentifier;
    v5->_ownerIdsIdentifier = v8;

    v10 = (NSString *)-[NSString copyWithZone:](self->_crossPlatformMailboxIdentifier, "copyWithZone:", a3);
    crossPlatformMailboxIdentifier = v5->_crossPlatformMailboxIdentifier;
    v5->_crossPlatformMailboxIdentifier = v10;

    v12 = (NSData *)-[NSData copyWithZone:](self->_invitationFromOwner, "copyWithZone:", a3);
    invitationFromOwner = v5->_invitationFromOwner;
    v5->_invitationFromOwner = v12;

    v5->_friendSideState = self->_friendSideState;
    v14 = (NSString *)-[NSString copyWithZone:](self->_friendKeyIdentifier, "copyWithZone:", a3);
    friendKeyIdentifier = v5->_friendKeyIdentifier;
    v5->_friendKeyIdentifier = v14;

    v16 = (NSString *)-[NSString copyWithZone:](self->_invitationIdentifier, "copyWithZone:", a3);
    invitationIdentifier = v5->_invitationIdentifier;
    v5->_invitationIdentifier = v16;

    v18 = (NSData *)-[NSData copyWithZone:](self->_bindingAttestation, "copyWithZone:", a3);
    bindingAttestation = v5->_bindingAttestation;
    v5->_bindingAttestation = v18;

    v20 = (NSData *)-[NSData copyWithZone:](self->_signingRequest, "copyWithZone:", a3);
    signingRequest = v5->_signingRequest;
    v5->_signingRequest = v20;

    v22 = (NSData *)-[NSData copyWithZone:](self->_ppidEncryptionEphemeralPublicKey, "copyWithZone:", a3);
    ppidEncryptionEphemeralPublicKey = v5->_ppidEncryptionEphemeralPublicKey;
    v5->_ppidEncryptionEphemeralPublicKey = v22;

    v24 = (NSData *)-[NSData copyWithZone:](self->_ppidEncryptionEphemeralSecretKey, "copyWithZone:", a3);
    ppidEncryptionEphemeralSecretKey = v5->_ppidEncryptionEphemeralSecretKey;
    v5->_ppidEncryptionEphemeralSecretKey = v24;

    v26 = (NSData *)-[NSData copyWithZone:](self->_ppidFetchRequest, "copyWithZone:", a3);
    ppidFetchRequest = v5->_ppidFetchRequest;
    v5->_ppidFetchRequest = v26;

    v28 = (NSData *)-[NSData copyWithZone:](self->_preTrackRequest, "copyWithZone:", a3);
    preTrackRequest = v5->_preTrackRequest;
    v5->_preTrackRequest = v28;

    v5->_numberOfPinAttempts = self->_numberOfPinAttempts;
  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSUInteger v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UUID                  : %@\n"), self->_uuid));
  objc_msgSend(v3, "appendString:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("OwnerIdsIdentifier    : %@\n"), self->_ownerIdsIdentifier));
  objc_msgSend(v3, "appendString:", v5);

  v6 = -[NSString length](self->_crossPlatformMailboxIdentifier, "length");
  if (v6 < 9)
    v7 = &stru_100316BD0;
  else
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](self->_crossPlatformMailboxIdentifier, "substringToIndex:", 4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MailboxIdentifier     : %@\n"), v7));
  objc_msgSend(v3, "appendString:", v8);

  if (v6 >= 9)
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InvitationIdentifier  : %@\n"), self->_invitationIdentifier));
  objc_msgSend(v3, "appendString:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FriendKeyIdentifier   : %@"), self->_friendKeyIdentifier));
  objc_msgSend(v3, "appendString:", v10);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
  objc_storeStrong((id *)&self->_friendKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_preTrackRequest, 0);
  objc_storeStrong((id *)&self->_ppidFetchRequest, 0);
  objc_storeStrong((id *)&self->_ppidEncryptionEphemeralSecretKey, 0);
  objc_storeStrong((id *)&self->_ppidEncryptionEphemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_signingRequest, 0);
  objc_storeStrong((id *)&self->_bindingAttestation, 0);
  objc_storeStrong((id *)&self->_invitationFromOwner, 0);
  objc_storeStrong((id *)&self->_crossPlatformMailboxIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerIdsIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
