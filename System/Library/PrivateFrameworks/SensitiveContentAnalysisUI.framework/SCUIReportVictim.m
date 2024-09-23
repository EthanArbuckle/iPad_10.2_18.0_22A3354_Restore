@implementation SCUIReportVictim

- (SCUIReportVictim)initWithDisplayName:(id)a3
{
  id v4;
  SCUIReportVictim *v5;
  uint64_t v6;
  NSString *displayName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCUIReportVictim;
  v5 = -[SCUIReportVictim init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

  }
  return v5;
}

- (NSString)accountID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)emailAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEmailAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)fullName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFullName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)appleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSDate)dateOfBirth
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDateOfBirth:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (SCUIReportAddress)address
{
  return (SCUIReportAddress *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_dateOfBirth, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
