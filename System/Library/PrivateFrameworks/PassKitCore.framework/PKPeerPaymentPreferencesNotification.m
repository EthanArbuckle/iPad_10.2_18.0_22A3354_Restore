@implementation PKPeerPaymentPreferencesNotification

- (PKPeerPaymentPreferencesNotification)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentPreferencesNotification *v5;
  uint64_t v6;
  NSString *altDSID;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentPreferencesNotification;
  v5 = -[PKPeerPaymentPreferencesNotification init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("altDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("notificationType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_notificationType = PKPeerPaymentPreferencesNotificationTypeFromString(v8);

    v5->_value = objc_msgSend(v4, "PKBoolForKey:", CFSTR("value"));
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unint64_t notificationType;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", self->_altDSID, CFSTR("altDSID"));
  notificationType = self->_notificationType;
  v5 = CFSTR("unknown");
  if (notificationType)
    v5 = 0;
  if (notificationType == 1)
    v6 = CFSTR("purchases");
  else
    v6 = v5;
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("notificationType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_value);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("value"));

  v8 = (void *)objc_msgSend(v3, "copy");
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentPreferencesNotification)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentPreferencesNotification *v5;
  uint64_t v6;
  NSString *altDSID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentPreferencesNotification;
  v5 = -[PKPeerPaymentPreferencesNotification init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    v5->_notificationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("notificationType"));
    v5->_value = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("value"));
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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_notificationType, CFSTR("notificationType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_value, CFSTR("value"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPeerPaymentPreferencesNotification *v5;
  uint64_t v6;
  NSString *altDSID;

  v5 = -[PKPeerPaymentPreferencesNotification init](+[PKPeerPaymentPreferencesNotification allocWithZone:](PKPeerPaymentPreferencesNotification, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a3);
  altDSID = v5->_altDSID;
  v5->_altDSID = (NSString *)v6;

  v5->_notificationType = self->_notificationType;
  v5->_value = self->_value;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPeerPaymentPreferencesNotification *v4;
  PKPeerPaymentPreferencesNotification *v5;
  BOOL v6;

  v4 = (PKPeerPaymentPreferencesNotification *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPeerPaymentPreferencesNotification isEqualToPreferencesNotification:](self, "isEqualToPreferencesNotification:", v5);

  return v6;
}

- (BOOL)isEqualToPreferencesNotification:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  NSString *altDSID;
  NSString *v7;
  char v8;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_notificationType == v4[3] && self->_value == *((unsigned __int8 *)v4 + 8))
  {
    altDSID = self->_altDSID;
    v7 = (NSString *)v5[2];
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
  v5 = self->_notificationType - v4 + 32 * v4;
  v6 = self->_value - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  void *v3;
  unint64_t notificationType;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("altDSID: '%@'; "), self->_altDSID);
  notificationType = self->_notificationType;
  v5 = CFSTR("unknown");
  if (notificationType)
    v5 = 0;
  if (notificationType == 1)
    v6 = CFSTR("purchases");
  else
    v6 = v5;
  objc_msgSend(v3, "appendFormat:", CFSTR("notificationType: '%@'; "), v6);
  if (self->_value)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("value: '%@'; "), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(unint64_t)a3
{
  self->_notificationType = a3;
}

- (BOOL)value
{
  return self->_value;
}

- (void)setValue:(BOOL)a3
{
  self->_value = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
