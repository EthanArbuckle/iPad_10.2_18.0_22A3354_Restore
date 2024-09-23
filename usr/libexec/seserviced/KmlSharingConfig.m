@implementation KmlSharingConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *toIdsIdentifier;
  NSString *crossPlatformMailboxIdentifier;
  NSData *slotIdentifier;
  NSData *entitlementsInASN1;
  NSString *invitationIdentifier;
  NSString *displayName;
  NSString *vehicleEnteredPasscode;
  NSString *deviceEnteredPasscode;
  _BOOL8 mockRefreshInstanceCA;
  id v13;

  v13 = a3;
  if (self)
  {
    objc_msgSend(v13, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
    toIdsIdentifier = self->_toIdsIdentifier;
  }
  else
  {
    objc_msgSend(v13, "encodeObject:forKey:", 0, CFSTR("uuid"));
    toIdsIdentifier = 0;
  }
  objc_msgSend(v13, "encodeObject:forKey:", toIdsIdentifier, CFSTR("toIdsIdentifier"));
  if (self)
  {
    objc_msgSend(v13, "encodeObject:forKey:", self->_crossPlatformRemoteIdentifier, CFSTR("crossPlatformRemoteIdentifier"));
    crossPlatformMailboxIdentifier = self->_crossPlatformMailboxIdentifier;
  }
  else
  {
    objc_msgSend(v13, "encodeObject:forKey:", 0, CFSTR("crossPlatformRemoteIdentifier"));
    crossPlatformMailboxIdentifier = 0;
  }
  objc_msgSend(v13, "encodeObject:forKey:", crossPlatformMailboxIdentifier, CFSTR("crossPlatformMailboxIdentifier"));
  if (self)
  {
    objc_msgSend(v13, "encodeInteger:forKey:", self->_profile, CFSTR("profile"));
    objc_msgSend(v13, "encodeInteger:forKey:", self->_keyRole, CFSTR("keyRole"));
    objc_msgSend(v13, "encodeInteger:forKey:", self->_targetDeviceType, CFSTR("targetDeviceType"));
    objc_msgSend(v13, "encodeInteger:forKey:", self->_ownerSideState, CFSTR("ownerSideState"));
    objc_msgSend(v13, "encodeInteger:forKey:", self->_immoTokenLength, CFSTR("immoTokenLength"));
    objc_msgSend(v13, "encodeInteger:forKey:", self->_immoTokenOffset, CFSTR("immoTokenOffset"));
    slotIdentifier = self->_slotIdentifier;
  }
  else
  {
    objc_msgSend(v13, "encodeInteger:forKey:", 0, CFSTR("profile"));
    objc_msgSend(v13, "encodeInteger:forKey:", 0, CFSTR("keyRole"));
    objc_msgSend(v13, "encodeInteger:forKey:", 0, CFSTR("targetDeviceType"));
    objc_msgSend(v13, "encodeInteger:forKey:", 0, CFSTR("ownerSideState"));
    objc_msgSend(v13, "encodeInteger:forKey:", 0, CFSTR("immoTokenLength"));
    objc_msgSend(v13, "encodeInteger:forKey:", 0, CFSTR("immoTokenOffset"));
    slotIdentifier = 0;
  }
  objc_msgSend(v13, "encodeObject:forKey:", slotIdentifier, CFSTR("slotIdentifier"));
  if (self)
  {
    objc_msgSend(v13, "encodeInteger:forKey:", self->_slotIdentifierIndex, CFSTR("slotIdentifierIndex"));
    objc_msgSend(v13, "encodeInteger:forKey:", self->_slotIdentifierSize, CFSTR("slotIdentifierSize"));
    objc_msgSend(v13, "encodeInteger:forKey:", self->_slotIdentifierOffset, CFSTR("slotIdentifierOffset"));
    entitlementsInASN1 = self->_entitlementsInASN1;
  }
  else
  {
    objc_msgSend(v13, "encodeInteger:forKey:", 0, CFSTR("slotIdentifierIndex"));
    objc_msgSend(v13, "encodeInteger:forKey:", 0, CFSTR("slotIdentifierSize"));
    objc_msgSend(v13, "encodeInteger:forKey:", 0, CFSTR("slotIdentifierOffset"));
    entitlementsInASN1 = 0;
  }
  objc_msgSend(v13, "encodeObject:forKey:", entitlementsInASN1, CFSTR("entitlements"));
  if (self)
  {
    objc_msgSend(v13, "encodeObject:forKey:", self->_friendKeyIdentifier, CFSTR("friendKeyIdentifier"));
    invitationIdentifier = self->_invitationIdentifier;
  }
  else
  {
    objc_msgSend(v13, "encodeObject:forKey:", 0, CFSTR("friendKeyIdentifier"));
    invitationIdentifier = 0;
  }
  objc_msgSend(v13, "encodeObject:forKey:", invitationIdentifier, CFSTR("invitationIdentifier"));
  if (self)
  {
    objc_msgSend(v13, "encodeObject:forKey:", self->_authorizationId, CFSTR("authorizationId"));
    displayName = self->_displayName;
  }
  else
  {
    objc_msgSend(v13, "encodeObject:forKey:", 0, CFSTR("authorizationId"));
    displayName = 0;
  }
  objc_msgSend(v13, "encodeObject:forKey:", displayName, CFSTR("displayName"));
  if (self)
  {
    objc_msgSend(v13, "encodeBool:forKey:", self->_enableVehicleEnteredPasscode, CFSTR("enableVehicleEnteredPasscode"));
    vehicleEnteredPasscode = self->_vehicleEnteredPasscode;
  }
  else
  {
    objc_msgSend(v13, "encodeBool:forKey:", 0, CFSTR("enableVehicleEnteredPasscode"));
    vehicleEnteredPasscode = 0;
  }
  objc_msgSend(v13, "encodeObject:forKey:", vehicleEnteredPasscode, CFSTR("vehicleEnteredPasscode"));
  if (self)
  {
    objc_msgSend(v13, "encodeObject:forKey:", self->_passcodeSeed, CFSTR("passcodeSeed"));
    deviceEnteredPasscode = self->_deviceEnteredPasscode;
  }
  else
  {
    objc_msgSend(v13, "encodeObject:forKey:", 0, CFSTR("passcodeSeed"));
    deviceEnteredPasscode = 0;
  }
  objc_msgSend(v13, "encodeObject:forKey:", deviceEnteredPasscode, CFSTR("deviceEnteredPasscode"));
  if (self)
  {
    objc_msgSend(v13, "encodeInteger:forKey:", self->_depRetriesLeft, CFSTR("depRetriesLeft"));
    objc_msgSend(v13, "encodeInteger:forKey:", self->_maxDepRetriesAllowed, CFSTR("maxDepRetriesAllowed"));
    mockRefreshInstanceCA = self->_mockRefreshInstanceCA;
  }
  else
  {
    objc_msgSend(v13, "encodeInteger:forKey:", 0, CFSTR("depRetriesLeft"));
    objc_msgSend(v13, "encodeInteger:forKey:", 0, CFSTR("maxDepRetriesAllowed"));
    mockRefreshInstanceCA = 0;
  }
  objc_msgSend(v13, "encodeBool:forKey:", mockRefreshInstanceCA, CFSTR("mockRefreshInstanceCA"));

}

- (KmlSharingConfig)initWithCoder:(id)a3
{
  id v4;
  KmlSharingConfig *v5;
  id v6;
  uint64_t v7;
  NSUUID *uuid;
  id v9;
  uint64_t v10;
  NSString *toIdsIdentifier;
  id v12;
  uint64_t v13;
  NSString *crossPlatformRemoteIdentifier;
  id v15;
  uint64_t v16;
  NSString *crossPlatformMailboxIdentifier;
  id v18;
  uint64_t v19;
  NSData *slotIdentifier;
  id v21;
  uint64_t v22;
  NSData *entitlementsInASN1;
  id v24;
  uint64_t v25;
  NSString *friendKeyIdentifier;
  id v27;
  uint64_t v28;
  NSString *invitationIdentifier;
  id v30;
  uint64_t v31;
  NSData *authorizationId;
  id v33;
  uint64_t v34;
  NSString *displayName;
  id v36;
  uint64_t v37;
  NSString *vehicleEnteredPasscode;
  id v39;
  uint64_t v40;
  NSData *passcodeSeed;
  id v42;
  uint64_t v43;
  NSString *deviceEnteredPasscode;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)KmlSharingConfig;
  v5 = -[KmlSharingConfig init](&v46, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("uuid"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("toIdsIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    toIdsIdentifier = v5->_toIdsIdentifier;
    v5->_toIdsIdentifier = (NSString *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("crossPlatformRemoteIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    crossPlatformRemoteIdentifier = v5->_crossPlatformRemoteIdentifier;
    v5->_crossPlatformRemoteIdentifier = (NSString *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("crossPlatformMailboxIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    crossPlatformMailboxIdentifier = v5->_crossPlatformMailboxIdentifier;
    v5->_crossPlatformMailboxIdentifier = (NSString *)v16;

    v5->_profile = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("profile"));
    v5->_keyRole = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("keyRole"));
    v5->_targetDeviceType = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("targetDeviceType"));
    v5->_ownerSideState = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ownerSideState"));
    v5->_immoTokenLength = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("immoTokenLength"));
    v5->_immoTokenOffset = (unsigned __int16)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("immoTokenOffset"));
    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("slotIdentifier"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    slotIdentifier = v5->_slotIdentifier;
    v5->_slotIdentifier = (NSData *)v19;

    v5->_slotIdentifierIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("slotIdentifierIndex"));
    v5->_slotIdentifierSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("slotIdentifierSize"));
    v5->_slotIdentifierOffset = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("slotIdentifierOffset"));
    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("entitlements"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    entitlementsInASN1 = v5->_entitlementsInASN1;
    v5->_entitlementsInASN1 = (NSData *)v22;

    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("friendKeyIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    friendKeyIdentifier = v5->_friendKeyIdentifier;
    v5->_friendKeyIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("invitationIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue(v27);
    invitationIdentifier = v5->_invitationIdentifier;
    v5->_invitationIdentifier = (NSString *)v28;

    v30 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("authorizationId"));
    v31 = objc_claimAutoreleasedReturnValue(v30);
    authorizationId = v5->_authorizationId;
    v5->_authorizationId = (NSData *)v31;

    v33 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("displayName"));
    v34 = objc_claimAutoreleasedReturnValue(v33);
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v34;

    v5->_enableVehicleEnteredPasscode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableVehicleEnteredPasscode"));
    v36 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("vehicleEnteredPasscode"));
    v37 = objc_claimAutoreleasedReturnValue(v36);
    vehicleEnteredPasscode = v5->_vehicleEnteredPasscode;
    v5->_vehicleEnteredPasscode = (NSString *)v37;

    v39 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("passcodeSeed"));
    v40 = objc_claimAutoreleasedReturnValue(v39);
    passcodeSeed = v5->_passcodeSeed;
    v5->_passcodeSeed = (NSData *)v40;

    v42 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("deviceEnteredPasscode"));
    v43 = objc_claimAutoreleasedReturnValue(v42);
    deviceEnteredPasscode = v5->_deviceEnteredPasscode;
    v5->_deviceEnteredPasscode = (NSString *)v43;

    v5->_depRetriesLeft = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("depRetriesLeft"));
    v5->_maxDepRetriesAllowed = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxDepRetriesAllowed"));
    v5->_mockRefreshInstanceCA = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mockRefreshInstanceCA"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSUInteger v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UUID                  : %@\n"), self->_uuid));
  objc_msgSend(v3, "appendString:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FriendIdsIdentifier   : %@\n"), self->_toIdsIdentifier));
  objc_msgSend(v3, "appendString:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("XP FriendIdentifier   : %@\n"), self->_crossPlatformRemoteIdentifier));
  objc_msgSend(v3, "appendString:", v6);

  v7 = -[NSString length](self->_crossPlatformMailboxIdentifier, "length");
  if (v7 < 9)
    v8 = &stru_100316BD0;
  else
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](self->_crossPlatformMailboxIdentifier, "substringToIndex:", 4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("XP Mailbox Identifier : %@\n"), v8));
  objc_msgSend(v3, "appendString:", v9);

  if (v7 >= 9)
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InvitationIdentifier  : %@\n"), self->_invitationIdentifier));
  objc_msgSend(v3, "appendString:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FriendKeyIdentifier   : %@"), self->_friendKeyIdentifier));
  objc_msgSend(v3, "appendString:", v11);

  if (self->_enableVehicleEnteredPasscode)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("EnableVEP             : %@"), v12));
  objc_msgSend(v3, "appendString:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VEP length            : %u"), -[NSString length](self->_vehicleEnteredPasscode, "length")));
  objc_msgSend(v3, "appendString:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PasscodeSeed length   : %u"), -[NSData length](self->_passcodeSeed, "length")));
  objc_msgSend(v3, "appendString:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DEP : length - %u, Attempts/Max - %u / %u"), -[NSString length](self->_deviceEnteredPasscode, "length"), self->_maxDepRetriesAllowed - self->_depRetriesLeft, self->_maxDepRetriesAllowed));
  objc_msgSend(v3, "appendString:", v16);

  if (self->_mockRefreshInstanceCA)
    objc_msgSend(v3, "appendString:", CFSTR("Mock Refresh Instance CA requested"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceEnteredPasscode, 0);
  objc_storeStrong((id *)&self->_passcodeSeed, 0);
  objc_storeStrong((id *)&self->_vehicleEnteredPasscode, 0);
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
  objc_storeStrong((id *)&self->_friendKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_entitlementsInTLV, 0);
  objc_storeStrong((id *)&self->_entitlementsInASN1, 0);
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
  objc_storeStrong((id *)&self->_authorizationId, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_crossPlatformMailboxIdentifier, 0);
  objc_storeStrong((id *)&self->_crossPlatformRemoteIdentifier, 0);
  objc_storeStrong((id *)&self->_toIdsIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
