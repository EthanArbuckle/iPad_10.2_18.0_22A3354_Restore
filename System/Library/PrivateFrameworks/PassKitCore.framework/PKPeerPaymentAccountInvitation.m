@implementation PKPeerPaymentAccountInvitation

- (PKPeerPaymentAccountInvitation)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentAccountInvitation *v5;
  uint64_t v6;
  NSString *altDSID;
  __CFString *v8;
  __CFString *v9;
  char v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentAccountInvitation;
  v5 = -[PKPeerPaymentAccountInvitation init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("altDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("status"));
    v8 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 != CFSTR("pending"))
    {
      if (v8)
      {
        v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("pending"));

        if ((v10 & 1) != 0)
          goto LABEL_5;
        v12 = v9;
        if (v12 == CFSTR("accepted")
          || (v13 = v12,
              v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("accepted")),
              v13,
              v14))
        {
          v11 = 2;
          goto LABEL_10;
        }
      }
      v11 = 0;
      goto LABEL_10;
    }
LABEL_5:
    v11 = 1;
LABEL_10:

    v5->_status = v11;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentAccountInvitation)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentAccountInvitation *v5;
  uint64_t v6;
  NSString *altDSID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentAccountInvitation;
  v5 = -[PKPeerPaymentAccountInvitation init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    v5->_registrationResult = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("registrationResult"));
    v5->_remoteRegistrationRequestLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("remoteRegistrationRequestLevel"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *altDSID;
  id v5;

  altDSID = self->_altDSID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", altDSID, CFSTR("altDSID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_registrationResult, CFSTR("registrationResult"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_remoteRegistrationRequestLevel, CFSTR("remoteRegistrationRequestLevel"));

}

- (id)description
{
  void *v3;
  int64_t status;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("altDSID: '%@'; "), self->_altDSID);
  status = self->_status;
  v5 = CFSTR("pending");
  if (status == 2)
    v5 = CFSTR("accepted");
  if (status)
    v6 = v5;
  else
    v6 = CFSTR("unknown");
  objc_msgSend(v3, "appendFormat:", CFSTR("status: '%@'; "), v6);
  PKDeviceRegistrationResultToString(self->_registrationResult);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("registrationResult: '%@'; "), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR("remoteRegistrationRequestLevel: %ld; "),
    self->_remoteRegistrationRequestLevel);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  _BOOL4 v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  v5 = (void *)v4[1];
  v6 = self->_altDSID;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

LABEL_12:
      v10 = 0;
      goto LABEL_13;
    }
    v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_12;
  }
  if (self->_status != v4[2] || self->_registrationResult != v4[3])
    goto LABEL_12;
  v10 = self->_remoteRegistrationRequestLevel == v4[4];
LABEL_13:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_altDSID);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_status - v4 + 32 * v4;
  v6 = self->_registrationResult - v5 + 32 * v5;
  v7 = self->_remoteRegistrationRequestLevel - v6 + 32 * v6;

  return v7;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (unint64_t)registrationResult
{
  return self->_registrationResult;
}

- (void)setRegistrationResult:(unint64_t)a3
{
  self->_registrationResult = a3;
}

- (int64_t)remoteRegistrationRequestLevel
{
  return self->_remoteRegistrationRequestLevel;
}

- (void)setRemoteRegistrationRequestLevel:(int64_t)a3
{
  self->_remoteRegistrationRequestLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
