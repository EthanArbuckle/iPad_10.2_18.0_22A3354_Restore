@implementation PKPaymentPassActionRemoteConfiguration

- (PKPaymentPassActionRemoteConfiguration)init
{

  return 0;
}

- (PKPaymentPassActionRemoteConfiguration)initWithDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  PKPaymentPassActionRemoteConfiguration *v7;

  if (a3)
  {
    v4 = a3;
    v5 = objc_msgSend(v4, "PKBoolForKey:", CFSTR("requiresAppletData"));
    v6 = objc_msgSend(v4, "PKBoolForKey:", CFSTR("appletDataRequiresEncryption"));

    self = -[PKPaymentPassActionRemoteConfiguration initWithRequiresAppletData:appletDataRequiresEncryption:](self, "initWithRequiresAppletData:appletDataRequiresEncryption:", v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PKPaymentPassActionRemoteConfiguration)initWithRequiresAppletData:(BOOL)a3 appletDataRequiresEncryption:(BOOL)a4
{
  PKPaymentPassActionRemoteConfiguration *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPassActionRemoteConfiguration;
  result = -[PKPaymentPassActionRemoteConfiguration init](&v7, sel_init);
  if (result)
  {
    result->_requiresAppletData = a3;
    result->_appletDataRequiresEncryption = a3 && a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentPassActionRemoteConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKPaymentPassActionRemoteConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPassActionRemoteConfiguration;
  v5 = -[PKPaymentPassActionRemoteConfiguration init](&v7, sel_init);
  if (v5)
  {
    v5->_requiresAppletData = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresAppletData"));
    v5->_appletDataRequiresEncryption = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("appletDataRequiresEncryption"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 requiresAppletData;
  id v5;

  requiresAppletData = self->_requiresAppletData;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", requiresAppletData, CFSTR("requiresAppletData"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_appletDataRequiresEncryption, CFSTR("appletDataRequiresEncryption"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *((_BYTE *)result + 8) = self->_requiresAppletData;
  *((_BYTE *)result + 9) = self->_appletDataRequiresEncryption;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; "), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_requiresAppletData)
    v5 = CFSTR("Yes");
  else
    v5 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("requiresAppletData: '%@'; "), v5);
  if (self->_appletDataRequiresEncryption)
    v6 = CFSTR("Yes");
  else
    v6 = CFSTR("No");
  objc_msgSend(v4, "appendFormat:", CFSTR("appletDataRequiresEncryption: '%@'; "), v6);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (BOOL)requiresAppletData
{
  return self->_requiresAppletData;
}

- (BOOL)appletDataRequiresEncryption
{
  return self->_appletDataRequiresEncryption;
}

@end
