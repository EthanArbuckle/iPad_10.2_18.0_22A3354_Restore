@implementation RPNearFieldTapEvent

- (RPNearFieldTapEvent)initWithIdentifier:(id)a3 applicationLabel:(id)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6 isSameAccount:(BOOL)a7 contactID:(id)a8 accountID:(id)a9 forceSingleBandAWDLMode:(BOOL)a10 knownIdentity:(BOOL)a11 isUnsupportedApplicationLabel:(BOOL)a12 flags:(unsigned int)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  RPNearFieldTapEvent *v25;
  NSString *v26;
  NSString *identifier;
  NSString *v28;
  NSString *applicationLabel;
  NSData *v30;
  NSData *pkData;
  NSString *v32;
  NSString *contactID;
  NSString *v34;
  NSString *accountID;
  uint64_t v36;
  NSDate *date;
  objc_super v39;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a8;
  v24 = a9;
  v39.receiver = self;
  v39.super_class = (Class)RPNearFieldTapEvent;
  v25 = -[RPNearFieldTapEvent init](&v39, "init");
  if (v25)
  {
    v26 = (NSString *)objc_msgSend(v19, "copy");
    identifier = v25->_identifier;
    v25->_identifier = v26;

    v28 = (NSString *)objc_msgSend(v20, "copy");
    applicationLabel = v25->_applicationLabel;
    v25->_applicationLabel = v28;

    v30 = (NSData *)objc_msgSend(v21, "copy");
    pkData = v25->_pkData;
    v25->_pkData = v30;

    objc_storeStrong((id *)&v25->_bonjourListenerUUID, a6);
    v25->_isSameAccount = a7;
    v32 = (NSString *)objc_msgSend(v23, "copy");
    contactID = v25->_contactID;
    v25->_contactID = v32;

    v34 = (NSString *)objc_msgSend(v24, "copy");
    accountID = v25->_accountID;
    v25->_accountID = v34;

    v25->_shouldForceSingleBandAWDLMode = a10;
    v36 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    date = v25->_date;
    v25->_date = (NSDate *)v36;

    v25->_isKnownIdentity = a11;
    v25->_isUnsupportedApplicationLabel = a12;
    v25->_flags = a13;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPNearFieldTapEvent)initWithCoder:(id)a3
{
  id v4;
  RPNearFieldTapEvent *v5;
  RPNearFieldTapEvent *v6;
  NSString **p_identifier;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  RPNearFieldTapEvent *v54;
  id v55;
  void *v56;
  uint64_t v58;
  objc_super v59;
  uint64_t v60;

  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)RPNearFieldTapEvent;
  v5 = -[RPNearFieldTapEvent init](&v59, "init");
  v6 = v5;
  if (!v5)
    goto LABEL_17;
  p_identifier = &v5->_identifier;
  v8 = v4;
  v11 = objc_opt_class(NSString, v9, v10);
  NSDecodeObjectIfPresent(v8, CFSTR("identifier"), v11, &v6->_identifier);

  v12 = v8;
  v15 = objc_opt_class(NSString, v13, v14);
  NSDecodeObjectIfPresent(v12, CFSTR("appLabel"), v15, &v6->_applicationLabel);

  v16 = v12;
  v19 = objc_opt_class(NSData, v17, v18);
  NSDecodeObjectIfPresent(v16, CFSTR("pkDataKey"), v19, &v6->_pkData);

  v20 = v16;
  v23 = objc_opt_class(NSDate, v21, v22);
  NSDecodeObjectIfPresent(v20, CFSTR("date"), v23, &v6->_date);

  v24 = v20;
  if (objc_msgSend(v24, "containsValueForKey:", CFSTR("isSameAccount")))
    v6->_isSameAccount = objc_msgSend(v24, "decodeBoolForKey:", CFSTR("isSameAccount"));

  v25 = v24;
  v28 = objc_opt_class(NSString, v26, v27);
  NSDecodeObjectIfPresent(v25, CFSTR("deviceName"), v28, &v6->_deviceName);

  v29 = v25;
  v32 = objc_opt_class(NSString, v30, v31);
  NSDecodeObjectIfPresent(v29, CFSTR("deviceModel"), v32, &v6->_deviceModel);

  v33 = v29;
  v36 = objc_opt_class(NSString, v34, v35);
  NSDecodeObjectIfPresent(v33, CFSTR("accountID"), v36, &v6->_accountID);

  v37 = v33;
  v40 = objc_opt_class(NSString, v38, v39);
  NSDecodeObjectIfPresent(v37, CFSTR("contactID"), v40, &v6->_contactID);

  v41 = v37;
  v44 = objc_opt_class(NSUUID, v42, v43);
  NSDecodeObjectIfPresent(v41, CFSTR("bonjourListenerUUIDKey"), v44, &v6->_bonjourListenerUUID);

  v45 = v41;
  if (objc_msgSend(v45, "containsValueForKey:", CFSTR("forceSingleBand")))
    v6->_shouldForceSingleBandAWDLMode = objc_msgSend(v45, "decodeBoolForKey:", CFSTR("forceSingleBand"));

  v46 = v45;
  if (objc_msgSend(v46, "containsValueForKey:", CFSTR("knownIdentity")))
    v6->_isKnownIdentity = objc_msgSend(v46, "decodeBoolForKey:", CFSTR("knownIdentity"));

  v47 = v46;
  if (objc_msgSend(v47, "containsValueForKey:", CFSTR("isUnsupportedApplicationLabel")))
    v6->_isUnsupportedApplicationLabel = objc_msgSend(v47, "decodeBoolForKey:", CFSTR("isUnsupportedApplicationLabel"));

  v60 = 0;
  if (NSDecodeSInt64RangedIfPresent(v47, CFSTR("flags"), 0, 0xFFFFFFFFLL, &v60))
    v6->_flags = v60;
  if (!*p_identifier || !v6->_applicationLabel || !v6->_date)
  {
    v55 = RPErrorF(4294960591, (uint64_t)"Decode NearFieldTap with missing parameter", v48, v49, v50, v51, v52, v53, v58);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    objc_msgSend(v47, "failWithError:", v56);

LABEL_17:
    v54 = 0;
    goto LABEL_18;
  }
  v54 = v6;
LABEL_18:

  return v54;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *applicationLabel;
  NSData *pkData;
  NSDate *date;
  NSString *deviceName;
  NSString *deviceModel;
  NSString *accountID;
  NSString *contactID;
  NSUUID *bonjourListenerUUID;
  uint64_t flags;
  id v15;

  v4 = a3;
  identifier = self->_identifier;
  v15 = v4;
  if (identifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", identifier, CFSTR("identifier"));
    v4 = v15;
  }
  applicationLabel = self->_applicationLabel;
  if (applicationLabel)
  {
    objc_msgSend(v15, "encodeObject:forKey:", applicationLabel, CFSTR("appLabel"));
    v4 = v15;
  }
  pkData = self->_pkData;
  if (pkData)
  {
    objc_msgSend(v15, "encodeObject:forKey:", pkData, CFSTR("pkDataKey"));
    v4 = v15;
  }
  date = self->_date;
  if (date)
  {
    objc_msgSend(v15, "encodeObject:forKey:", date, CFSTR("date"));
    v4 = v15;
  }
  if (self->_isSameAccount)
  {
    objc_msgSend(v15, "encodeBool:forKey:", 1, CFSTR("isSameAccount"));
    v4 = v15;
  }
  deviceName = self->_deviceName;
  if (deviceName)
  {
    objc_msgSend(v15, "encodeObject:forKey:", deviceName, CFSTR("deviceName"));
    v4 = v15;
  }
  deviceModel = self->_deviceModel;
  if (deviceModel)
  {
    objc_msgSend(v15, "encodeObject:forKey:", deviceModel, CFSTR("deviceModel"));
    v4 = v15;
  }
  accountID = self->_accountID;
  if (accountID)
  {
    objc_msgSend(v15, "encodeObject:forKey:", accountID, CFSTR("accountID"));
    v4 = v15;
  }
  contactID = self->_contactID;
  if (contactID)
  {
    objc_msgSend(v15, "encodeObject:forKey:", contactID, CFSTR("contactID"));
    v4 = v15;
  }
  bonjourListenerUUID = self->_bonjourListenerUUID;
  if (bonjourListenerUUID)
  {
    objc_msgSend(v15, "encodeObject:forKey:", bonjourListenerUUID, CFSTR("bonjourListenerUUIDKey"));
    v4 = v15;
  }
  if (self->_shouldForceSingleBandAWDLMode)
  {
    objc_msgSend(v15, "encodeBool:forKey:", 1, CFSTR("forceSingleBand"));
    v4 = v15;
  }
  if (self->_isKnownIdentity)
  {
    objc_msgSend(v15, "encodeBool:forKey:", 1, CFSTR("knownIdentity"));
    v4 = v15;
  }
  if (self->_isUnsupportedApplicationLabel)
  {
    objc_msgSend(v15, "encodeBool:forKey:", 1, CFSTR("isUnsupportedApplicationLabel"));
    v4 = v15;
  }
  flags = self->_flags;
  if ((_DWORD)flags)
  {
    objc_msgSend(v15, "encodeInt64:forKey:", flags, CFSTR("flags"));
    v4 = v15;
  }

}

- (id)description
{
  return -[RPNearFieldTapEvent descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  void *v5;
  uint64_t flags;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v21 = 0;
  NSAppendPrintF(&v21, "RPNearFieldTap ID %{mask}, appLabel %@, appDomain %@, date %@ sameAccount %d CNID %@", *(_QWORD *)&a3, self->_identifier, self->_applicationLabel, self->_applicationDomain, self->_date, self->_isSameAccount, self->_contactID);
  v4 = v21;
  v5 = v4;
  flags = self->_flags;
  if ((_DWORD)flags)
  {
    v20 = v4;
    NSAppendPrintF(&v20, ", flags  %#{flags}", flags, &unk_10010B7EE);
    v7 = v20;

    v5 = v7;
  }
  v19 = v5;
  NSAppendPrintF(&v19, ", pkData <%.3@> %d B", self->_pkData, -[NSData length](self->_pkData, "length"));
  v8 = v19;

  v18 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_bonjourListenerUUID, "UUIDString"));
  NSAppendPrintF(&v18, ", bonjourUUID '%{mask}'", v9);
  v10 = v18;

  v17 = v10;
  NSAppendPrintF(&v17, ", forceSingleBand '%d'", self->_shouldForceSingleBandAWDLMode);
  v11 = v17;

  v16 = v11;
  NSAppendPrintF(&v16, ", isKnownIdentity '%d'", self->_isKnownIdentity);
  v12 = v16;

  v15 = v12;
  NSAppendPrintF(&v15, ", isUnsupportedApplicationLabel '%d'", self->_isUnsupportedApplicationLabel);
  v13 = v15;

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)applicationDomain
{
  return self->_applicationDomain;
}

- (NSString)applicationLabel
{
  return self->_applicationLabel;
}

- (NSDate)date
{
  return self->_date;
}

- (unsigned)flags
{
  return self->_flags;
}

- (BOOL)isSameAccount
{
  return self->_isSameAccount;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)pkData
{
  return self->_pkData;
}

- (NSUUID)bonjourListenerUUID
{
  return self->_bonjourListenerUUID;
}

- (BOOL)shouldForceSingleBandAWDLMode
{
  return self->_shouldForceSingleBandAWDLMode;
}

- (BOOL)isKnownIdentity
{
  return self->_isKnownIdentity;
}

- (BOOL)isUnsupportedApplicationLabel
{
  return self->_isUnsupportedApplicationLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bonjourListenerUUID, 0);
  objc_storeStrong((id *)&self->_pkData, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_applicationLabel, 0);
  objc_storeStrong((id *)&self->_applicationDomain, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
