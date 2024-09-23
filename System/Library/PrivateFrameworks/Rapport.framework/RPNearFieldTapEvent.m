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
  uint64_t v26;
  NSString *identifier;
  uint64_t v28;
  NSString *applicationLabel;
  uint64_t v30;
  NSData *pkData;
  uint64_t v32;
  NSString *contactID;
  uint64_t v34;
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
  v25 = -[RPNearFieldTapEvent init](&v39, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v19, "copy");
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v26;

    v28 = objc_msgSend(v20, "copy");
    applicationLabel = v25->_applicationLabel;
    v25->_applicationLabel = (NSString *)v28;

    v30 = objc_msgSend(v21, "copy");
    pkData = v25->_pkData;
    v25->_pkData = (NSData *)v30;

    objc_storeStrong((id *)&v25->_bonjourListenerUUID, a6);
    v25->_isSameAccount = a7;
    v32 = objc_msgSend(v23, "copy");
    contactID = v25->_contactID;
    v25->_contactID = (NSString *)v32;

    v34 = objc_msgSend(v24, "copy");
    accountID = v25->_accountID;
    v25->_accountID = (NSString *)v34;

    v25->_shouldForceSingleBandAWDLMode = a10;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v36 = objc_claimAutoreleasedReturnValue();
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
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  RPNearFieldTapEvent *v21;
  void *v22;
  objc_super v24;
  uint64_t v25;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RPNearFieldTapEvent;
  v5 = -[RPNearFieldTapEvent init](&v24, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_17;
  p_identifier = &v5->_identifier;
  v8 = v4;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  v9 = v8;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  v10 = v9;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  v11 = v10;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  v12 = v11;
  if (objc_msgSend(v12, "containsValueForKey:", CFSTR("isSameAccount")))
    v6->_isSameAccount = objc_msgSend(v12, "decodeBoolForKey:", CFSTR("isSameAccount"));

  v13 = v12;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  v14 = v13;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  v15 = v14;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  v16 = v15;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  v17 = v16;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  v18 = v17;
  if (objc_msgSend(v18, "containsValueForKey:", CFSTR("forceSingleBand")))
    v6->_shouldForceSingleBandAWDLMode = objc_msgSend(v18, "decodeBoolForKey:", CFSTR("forceSingleBand"));

  v19 = v18;
  if (objc_msgSend(v19, "containsValueForKey:", CFSTR("knownIdentity")))
    v6->_isKnownIdentity = objc_msgSend(v19, "decodeBoolForKey:", CFSTR("knownIdentity"));

  v20 = v19;
  if (objc_msgSend(v20, "containsValueForKey:", CFSTR("isUnsupportedApplicationLabel")))
    v6->_isUnsupportedApplicationLabel = objc_msgSend(v20, "decodeBoolForKey:", CFSTR("isUnsupportedApplicationLabel"));

  v25 = 0;
  if (NSDecodeSInt64RangedIfPresent())
    v6->_flags = v25;
  if (!*p_identifier || !v6->_applicationLabel || !v6->_date)
  {
    RPErrorF();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "failWithError:", v22);

LABEL_17:
    v21 = 0;
    goto LABEL_18;
  }
  v21 = v6;
LABEL_18:

  return v21;
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
  id v6;
  NSData *pkData;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSString *identifier;
  NSData *v17;
  NSString *applicationLabel;
  uint64_t v19;
  NSString *applicationDomain;
  NSDate *date;
  _BOOL8 isSameAccount;
  NSString *contactID;
  void *v24;

  isSameAccount = self->_isSameAccount;
  contactID = self->_contactID;
  applicationDomain = self->_applicationDomain;
  date = self->_date;
  identifier = self->_identifier;
  applicationLabel = self->_applicationLabel;
  NSAppendPrintF();
  v4 = 0;
  v5 = v4;
  if (self->_flags)
  {
    v24 = v4;
    identifier = (NSString *)self->_flags;
    applicationLabel = (NSString *)&unk_1AF307897;
    NSAppendPrintF();
    v6 = v24;

    v5 = v6;
  }
  pkData = self->_pkData;
  v8 = -[NSData length](pkData, "length", identifier, applicationLabel, applicationDomain, date, isSameAccount, contactID);
  v17 = pkData;
  v19 = v8;
  NSAppendPrintF();
  v9 = v5;

  -[NSUUID UUIDString](self->_bonjourListenerUUID, "UUIDString", v17, v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v11 = v9;

  NSAppendPrintF();
  v12 = v11;

  NSAppendPrintF();
  v13 = v12;

  NSAppendPrintF();
  v14 = v13;

  return v14;
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
