@implementation PKPeerPaymentPreferencesRestriction

- (PKPeerPaymentPreferencesRestriction)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentPreferencesRestriction *v5;
  uint64_t v6;
  NSString *altDSID;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentPreferencesRestriction;
  v5 = -[PKPeerPaymentPreferencesRestriction init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("altDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("restrictionType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sendRestrictionType = PKPeerPaymentPreferencesSendRestrictionTypeFromString(v8);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("receiveRestrictionType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_receiveRestrictionType = PKPeerPaymentPreferencesReceiveRestrictionTypeFromString(v9);

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unint64_t sendRestrictionType;
  uint64_t v5;
  unint64_t receiveRestrictionType;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", self->_altDSID, CFSTR("altDSID"));
  sendRestrictionType = self->_sendRestrictionType;
  if (sendRestrictionType > 4)
    v5 = 0;
  else
    v5 = (uint64_t)*(&off_1E2ADDCC0 + sendRestrictionType);
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("restrictionType"));
  receiveRestrictionType = self->_receiveRestrictionType;
  if (receiveRestrictionType > 3)
    v7 = 0;
  else
    v7 = (uint64_t)*(&off_1E2ADDCE8 + receiveRestrictionType);
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("receiveRestrictionType"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentPreferencesRestriction)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentPreferencesRestriction *v5;
  uint64_t v6;
  NSString *altDSID;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentPreferencesRestriction;
  v5 = -[PKPeerPaymentPreferencesRestriction init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restrictionType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sendRestrictionType = objc_msgSend(v8, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("receiveRestrictionType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_receiveRestrictionType = objc_msgSend(v9, "integerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *altDSID;
  id v5;
  void *v6;
  id v7;

  altDSID = self->_altDSID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", altDSID, CFSTR("altDSID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sendRestrictionType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("restrictionType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_receiveRestrictionType);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("receiveRestrictionType"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPeerPaymentPreferencesRestriction *v5;
  uint64_t v6;
  NSString *altDSID;

  v5 = -[PKPeerPaymentPreferencesRestriction init](+[PKPeerPaymentPreferencesRestriction allocWithZone:](PKPeerPaymentPreferencesRestriction, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a3);
  altDSID = v5->_altDSID;
  v5->_altDSID = (NSString *)v6;

  v5->_sendRestrictionType = self->_sendRestrictionType;
  v5->_receiveRestrictionType = self->_receiveRestrictionType;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPeerPaymentPreferencesRestriction *v4;
  PKPeerPaymentPreferencesRestriction *v5;
  BOOL v6;

  v4 = (PKPeerPaymentPreferencesRestriction *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPeerPaymentPreferencesRestriction isEqualToPreferencesRestriction:](self, "isEqualToPreferencesRestriction:", v5);

  return v6;
}

- (BOOL)isEqualToPreferencesRestriction:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  NSString *altDSID;
  NSString *v7;
  char v8;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_sendRestrictionType == v4[2] && self->_receiveRestrictionType == v4[3])
  {
    altDSID = self->_altDSID;
    v7 = (NSString *)v5[1];
    if (altDSID && v7)
      v8 = -[NSString isEqual:](altDSID, "isEqual:");
    else
      v8 = altDSID == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_altDSID);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_sendRestrictionType - v4 + 32 * v4;
  v6 = self->_receiveRestrictionType - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  void *v3;
  unint64_t sendRestrictionType;
  uint64_t v5;
  unint64_t receiveRestrictionType;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("altDSID: '%@'; "), self->_altDSID);
  sendRestrictionType = self->_sendRestrictionType;
  if (sendRestrictionType > 4)
    v5 = 0;
  else
    v5 = (uint64_t)*(&off_1E2ADDCC0 + sendRestrictionType);
  objc_msgSend(v3, "appendFormat:", CFSTR("sendRestrictionType: '%@'; "), v5);
  receiveRestrictionType = self->_receiveRestrictionType;
  if (receiveRestrictionType > 3)
    v7 = 0;
  else
    v7 = (uint64_t)*(&off_1E2ADDCE8 + receiveRestrictionType);
  objc_msgSend(v3, "appendFormat:", CFSTR("receiveRestrictionType: '%@'; "), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)sendRestrictionType
{
  return self->_sendRestrictionType;
}

- (void)setSendRestrictionType:(unint64_t)a3
{
  self->_sendRestrictionType = a3;
}

- (unint64_t)receiveRestrictionType
{
  return self->_receiveRestrictionType;
}

- (void)setReceiveRestrictionType:(unint64_t)a3
{
  self->_receiveRestrictionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
