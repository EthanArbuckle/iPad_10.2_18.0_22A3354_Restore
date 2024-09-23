@implementation PKPaymentHardwareStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentHardwareStatus)initWithCoder:(id)a3
{
  id v4;
  PKPaymentHardwareStatus *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentHardwareStatus;
  v5 = -[PKPaymentHardwareStatus init](&v7, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_hasSecureElement = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSecureElement"));
    v5->_hasRemoteDevices = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasRemoteDevices"));
    v5->_canMakeRemotePayments = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canMakeRemotePayments"));
    v5->_isSRD = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSRD"));
    v5->_inFailForward = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inFailForward"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p> type:%d; canMakeLocalPayments:%d; canMakeRemotePayments:%d; hasSecureElement:%d; hasRemoteDevices:%d; isSRD:%d; "),
    objc_opt_class(),
    self,
    self->_type,
    -[PKPaymentHardwareStatus canMakeLocalPayments](self, "canMakeLocalPayments"),
    self->_canMakeRemotePayments,
    self->_hasSecureElement,
    self->_hasRemoteDevices,
    self->_isSRD);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("inFailForward:%d; "), self->_inFailForward);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasSecureElement, CFSTR("hasSecureElement"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasRemoteDevices, CFSTR("hasRemoteDevices"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canMakeRemotePayments, CFSTR("canMakeRemotePayments"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSRD, CFSTR("isSRD"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_inFailForward, CFSTR("inFailForward"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[PKPaymentHardwareStatus init](+[PKPaymentHardwareStatus allocWithZone:](PKPaymentHardwareStatus, "allocWithZone:", a3), "init");
  *((_QWORD *)result + 2) = self->_type;
  *((_BYTE *)result + 8) = self->_hasSecureElement;
  *((_BYTE *)result + 9) = self->_hasRemoteDevices;
  *((_BYTE *)result + 11) = self->_canMakeRemotePayments;
  *((_BYTE *)result + 12) = self->_isSRD;
  *((_BYTE *)result + 10) = self->_inFailForward;
  return result;
}

- (BOOL)canMakePayments
{
  return -[PKPaymentHardwareStatus canMakeLocalPayments](self, "canMakeLocalPayments")
      || -[PKPaymentHardwareStatus canMakeRemotePayments](self, "canMakeRemotePayments");
}

- (BOOL)canMakeVirtualCardPayments
{
  return -[PKPaymentHardwareStatus _canMakeLocalPaymentsNeedingSecureIntent:](self, "_canMakeLocalPaymentsNeedingSecureIntent:", 0);
}

- (BOOL)canMakeLocalPayments
{
  return -[PKPaymentHardwareStatus _canMakeLocalPaymentsNeedingSecureIntent:](self, "_canMakeLocalPaymentsNeedingSecureIntent:", 1);
}

- (BOOL)_canMakeLocalPaymentsNeedingSecureIntent:(BOOL)a3
{
  return self->_hasSecureElement && !self->_inFailForward && !self->_isSRD;
}

- (BOOL)_isDemoModeActive
{
  return PKHandsOnDemoModeEnabled() || PKUIOnlyDemoModeEnabled();
}

- (BOOL)canDecryptBAAEncryptedData
{
  return self->_hasSecureElement && !self->_inFailForward;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)hasSecureElement
{
  return self->_hasSecureElement;
}

- (void)setHasSecureElement:(BOOL)a3
{
  self->_hasSecureElement = a3;
}

- (BOOL)hasRemoteDevices
{
  return self->_hasRemoteDevices;
}

- (void)setHasRemoteDevices:(BOOL)a3
{
  self->_hasRemoteDevices = a3;
}

- (BOOL)isInFailForward
{
  return self->_inFailForward;
}

- (void)setInFailForward:(BOOL)a3
{
  self->_inFailForward = a3;
}

- (BOOL)canMakeRemotePayments
{
  return self->_canMakeRemotePayments;
}

- (void)setCanMakeRemotePayments:(BOOL)a3
{
  self->_canMakeRemotePayments = a3;
}

- (BOOL)isSRD
{
  return self->_isSRD;
}

- (void)setIsSRD:(BOOL)a3
{
  self->_isSRD = a3;
}

- (void)setCanDecryptBAAEncryptedData:(BOOL)a3
{
  self->_canDecryptBAAEncryptedData = a3;
}

@end
