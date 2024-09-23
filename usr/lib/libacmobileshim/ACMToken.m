@implementation ACMToken

+ (id)tokenWithPrincipal:(id)a3 creationDate:(id)a4 tokenData:(id)a5
{
  void *v8;

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setPrincipal:", a3);
  objc_msgSend(v8, "setCreationDate:", a4);
  objc_msgSend(v8, "setTokenData:", a5);
  return v8;
}

+ (id)tokenWithPrincipal:(id)a3 creationDate:(id)a4 tokenString:(id)a5
{
  void *v8;

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setPrincipal:", a3);
  objc_msgSend(v8, "setCreationDate:", a4);
  objc_msgSend(v8, "setTokenString:", a5);
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMToken setTokenData:](self, "setTokenData:", 0);
  -[ACMToken setPrincipal:](self, "setPrincipal:", 0);
  -[ACMToken setCreationDate:](self, "setCreationDate:", 0);
  -[ACMToken setExpirationDate:](self, "setExpirationDate:", 0);
  -[ACMToken setNonce:](self, "setNonce:", 0);
  -[ACMToken setUserPreferences:](self, "setUserPreferences:", 0);
  -[ACMToken setPersonID:](self, "setPersonID:", 0);
  -[ACMToken setIsTwoStepVerificationRequired:](self, "setIsTwoStepVerificationRequired:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMToken;
  -[ACMToken dealloc](&v3, sel_dealloc);
}

- (NSDate)expirationDate
{
  if (self->_expirationDate)
    return self->_expirationDate;
  else
    return -[NSDate dateByAddingTimeInterval:](-[ACMToken creationDate](self, "creationDate"), "dateByAddingTimeInterval:", 300.0);
}

- (void)setExpirationDate:(id)a3
{
  NSDate *expirationDate;
  NSDate *v6;

  expirationDate = self->_expirationDate;
  if (expirationDate != a3)
  {
    v6 = expirationDate;
    self->_expirationDate = (NSDate *)a3;
  }
}

- (NSString)tokenString
{
  return (NSString *)ACFEncodeBase64((uint64_t)-[ACMToken tokenData](self, "tokenData"));
}

- (void)setTokenString:(id)a3
{
  -[ACMToken setTokenData:](self, "setTokenData:", ACFDecodeBase64(a3));
}

- (NSData)tokenData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTokenData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (ACFPrincipal)principal
{
  return (ACFPrincipal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPrincipal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)nonce
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNonce:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)userPreferences
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUserPreferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSNumber)personID
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPersonID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)isTwoStepVerificationRequired
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIsTwoStepVerificationRequired:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

@end
