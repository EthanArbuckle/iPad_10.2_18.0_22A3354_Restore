@implementation SCUIReportSuspect

- (SCUIReportSuspect)initWithDisplayName:(id)a3 sensitiveMediaFiles:(id)a4
{
  id v6;
  id v7;
  SCUIReportSuspect *v8;
  uint64_t v9;
  NSString *displayName;
  uint64_t v11;
  NSArray *sensitiveMediaFiles;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCUIReportSuspect;
  v8 = -[SCUIReportSuspect init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    displayName = v8->_displayName;
    v8->_displayName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    sensitiveMediaFiles = v8->_sensitiveMediaFiles;
    v8->_sensitiveMediaFiles = (NSArray *)v11;

  }
  return v8;
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

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (SCUIReportAddress)address
{
  return (SCUIReportAddress *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)sensitiveMediaFiles
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitiveMediaFiles, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
