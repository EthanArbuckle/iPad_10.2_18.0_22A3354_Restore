@implementation PKPeerPaymentPreferencesProfileAppearance

- (PKPeerPaymentPreferencesProfileAppearance)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentPreferencesProfileAppearance *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentPreferencesProfileAppearance;
  v5 = -[PKPeerPaymentPreferencesProfileAppearance init](&v7, sel_init);
  if (v5)
  {
    v5->_shareLastName = objc_msgSend(v4, "PKBoolForKey:", CFSTR("shareLastName"));
    v5->_shareProfilePicture = objc_msgSend(v4, "PKBoolForKey:", CFSTR("shareProfilePicture"));
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shareLastName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("shareLastName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shareProfilePicture);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("shareProfilePicture"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentPreferencesProfileAppearance)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentPreferencesProfileAppearance *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentPreferencesProfileAppearance;
  v5 = -[PKPeerPaymentPreferencesProfileAppearance init](&v7, sel_init);
  if (v5)
  {
    v5->_shareLastName = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shareLastName"));
    v5->_shareProfilePicture = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shareProfilePicture"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 shareLastName;
  id v5;

  shareLastName = self->_shareLastName;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", shareLastName, CFSTR("shareLastName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shareProfilePicture, CFSTR("shareProfilePicture"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[PKPeerPaymentPreferencesProfileAppearance init](+[PKPeerPaymentPreferencesProfileAppearance allocWithZone:](PKPeerPaymentPreferencesProfileAppearance, "allocWithZone:", a3), "init");
  *((_BYTE *)result + 8) = self->_shareLastName;
  *((_BYTE *)result + 9) = self->_shareProfilePicture;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PKPeerPaymentPreferencesProfileAppearance *v4;
  PKPeerPaymentPreferencesProfileAppearance *v5;
  BOOL v6;

  v4 = (PKPeerPaymentPreferencesProfileAppearance *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPeerPaymentPreferencesProfileAppearance isEqualToProfileAppearance:](self, "isEqualToProfileAppearance:", v5);

  return v6;
}

- (BOOL)isEqualToProfileAppearance:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;

  v4 = (unsigned __int8 *)a3;
  v5 = v4 && self->_shareLastName == v4[8] && self->_shareProfilePicture == v4[9];

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PKCombinedHash(17, v3);
  v5 = self->_shareLastName - v4 + 32 * v4;
  v6 = self->_shareProfilePicture - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_shareLastName)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("shareLastName: '%@'; "), v5);
  if (self->_shareProfilePicture)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("shareProfilePicture: '%@'; "), v6);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (BOOL)shareLastName
{
  return self->_shareLastName;
}

- (void)setShareLastName:(BOOL)a3
{
  self->_shareLastName = a3;
}

- (BOOL)shareProfilePicture
{
  return self->_shareProfilePicture;
}

- (void)setShareProfilePicture:(BOOL)a3
{
  self->_shareProfilePicture = a3;
}

@end
