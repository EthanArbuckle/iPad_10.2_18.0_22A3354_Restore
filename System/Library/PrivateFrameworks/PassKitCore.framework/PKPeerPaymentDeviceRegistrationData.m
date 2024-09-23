@implementation PKPeerPaymentDeviceRegistrationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentDeviceRegistrationData)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentDeviceRegistrationData *v5;
  uint64_t v6;
  NSString *authorizationHeader;
  uint64_t v8;
  NSString *signedAuthToken;
  uint64_t v10;
  NSDictionary *enrollmentData;
  uint64_t v12;
  NSData *signedEnrollmentDataSignature;
  void *v14;
  uint64_t v15;
  NSString *companionSerialNumber;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentDeviceRegistrationData;
  v5 = -[PKPeerPaymentDeviceRegistrationData init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorizationHeader"));
    v6 = objc_claimAutoreleasedReturnValue();
    authorizationHeader = v5->_authorizationHeader;
    v5->_authorizationHeader = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signedAuthToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    signedAuthToken = v5->_signedAuthToken;
    v5->_signedAuthToken = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enrollmentData"));
    v10 = objc_claimAutoreleasedReturnValue();
    enrollmentData = v5->_enrollmentData;
    v5->_enrollmentData = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signedEnrollmentDataSignature"));
    v12 = objc_claimAutoreleasedReturnValue();
    signedEnrollmentDataSignature = v5->_signedEnrollmentDataSignature;
    v5->_signedEnrollmentDataSignature = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("devSigned"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_devSigned = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("companionSerialNumber"));
    v15 = objc_claimAutoreleasedReturnValue();
    companionSerialNumber = v5->_companionSerialNumber;
    v5->_companionSerialNumber = (NSString *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *authorizationHeader;
  void *v5;
  id v6;

  authorizationHeader = self->_authorizationHeader;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", authorizationHeader, CFSTR("authorizationHeader"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_signedAuthToken, CFSTR("signedAuthToken"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_enrollmentData, CFSTR("enrollmentData"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_signedEnrollmentDataSignature, CFSTR("signedEnrollmentDataSignature"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_devSigned);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("devSigned"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_companionSerialNumber, CFSTR("companionSerialNumber"));
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("authorizationHeader: '%@'; "), self->_authorizationHeader);
  objc_msgSend(v6, "appendFormat:", CFSTR("signedAuthToken: '%@'; "), self->_signedAuthToken);
  objc_msgSend(v6, "appendFormat:", CFSTR("enrollmentData: '%@'; "), self->_enrollmentData);
  objc_msgSend(v6, "appendFormat:", CFSTR("signedEnrollmentDataSignature : '%@'; "),
    self->_signedEnrollmentDataSignature);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_devSigned);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("devSigned: '%@'; "), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR("companionSerialNumber: '%@'; "), self->_companionSerialNumber);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_authorizationHeader)
    objc_msgSend(v3, "addObject:");
  if (self->_signedAuthToken)
    objc_msgSend(v4, "addObject:");
  if (self->_enrollmentData)
    objc_msgSend(v4, "addObject:");
  if (self->_signedEnrollmentDataSignature)
    objc_msgSend(v4, "addObject:");
  if (self->_companionSerialNumber)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);
  v6 = self->_devSigned - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKPeerPaymentDeviceRegistrationData *v4;
  PKPeerPaymentDeviceRegistrationData *v5;
  BOOL v6;

  v4 = (PKPeerPaymentDeviceRegistrationData *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPeerPaymentDeviceRegistrationData isEqualToPeerPaymentDeviceRegistrationData:](self, "isEqualToPeerPaymentDeviceRegistrationData:", v5);

  return v6;
}

- (BOOL)isEqualToPeerPaymentDeviceRegistrationData:(id)a3
{
  _QWORD *v4;
  NSString *signedAuthToken;
  NSString *v6;
  BOOL v7;
  char v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  _BOOL4 v13;
  NSDictionary *enrollmentData;
  NSDictionary *v15;
  NSData *signedEnrollmentDataSignature;
  NSData *v17;
  NSString *companionSerialNumber;
  NSString *v19;
  char v20;

  v4 = a3;
  signedAuthToken = self->_signedAuthToken;
  v6 = (NSString *)v4[3];
  if (signedAuthToken)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (signedAuthToken != v6)
      goto LABEL_30;
  }
  else
  {
    v8 = -[NSString isEqual:](signedAuthToken, "isEqual:");
    if ((v8 & 1) == 0)
      goto LABEL_30;
  }
  v9 = (void *)v4[2];
  v10 = self->_authorizationHeader;
  v11 = v9;
  if (v10 == v11)
  {

  }
  else
  {
    v12 = v11;
    if (!v10 || !v11)
    {

      goto LABEL_30;
    }
    v13 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

    if (!v13)
      goto LABEL_30;
  }
  enrollmentData = self->_enrollmentData;
  v15 = (NSDictionary *)v4[4];
  if (enrollmentData && v15)
  {
    if ((-[NSDictionary isEqual:](enrollmentData, "isEqual:") & 1) == 0)
      goto LABEL_30;
  }
  else if (enrollmentData != v15)
  {
    goto LABEL_30;
  }
  signedEnrollmentDataSignature = self->_signedEnrollmentDataSignature;
  v17 = (NSData *)v4[5];
  if (!signedEnrollmentDataSignature || !v17)
  {
    if (signedEnrollmentDataSignature == v17)
      goto LABEL_26;
LABEL_30:
    v20 = 0;
    goto LABEL_31;
  }
  if ((-[NSData isEqual:](signedEnrollmentDataSignature, "isEqual:") & 1) == 0)
    goto LABEL_30;
LABEL_26:
  if (self->_devSigned != *((unsigned __int8 *)v4 + 8))
    goto LABEL_30;
  companionSerialNumber = self->_companionSerialNumber;
  v19 = (NSString *)v4[6];
  if (companionSerialNumber && v19)
    v20 = -[NSString isEqual:](companionSerialNumber, "isEqual:");
  else
    v20 = companionSerialNumber == v19;
LABEL_31:

  return v20;
}

- (NSString)authorizationHeader
{
  return self->_authorizationHeader;
}

- (void)setAuthorizationHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)signedAuthToken
{
  return self->_signedAuthToken;
}

- (void)setSignedAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)enrollmentData
{
  return self->_enrollmentData;
}

- (void)setEnrollmentData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)signedEnrollmentDataSignature
{
  return self->_signedEnrollmentDataSignature;
}

- (void)setSignedEnrollmentDataSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)devSigned
{
  return self->_devSigned;
}

- (void)setDevSigned:(BOOL)a3
{
  self->_devSigned = a3;
}

- (NSString)companionSerialNumber
{
  return self->_companionSerialNumber;
}

- (void)setCompanionSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionSerialNumber, 0);
  objc_storeStrong((id *)&self->_signedEnrollmentDataSignature, 0);
  objc_storeStrong((id *)&self->_enrollmentData, 0);
  objc_storeStrong((id *)&self->_signedAuthToken, 0);
  objc_storeStrong((id *)&self->_authorizationHeader, 0);
}

@end
