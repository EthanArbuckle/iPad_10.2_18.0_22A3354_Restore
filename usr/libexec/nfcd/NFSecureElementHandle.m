@implementation NFSecureElementHandle

- (NFSecureElementHandle)initWithID:(int)a3 driverWrapper:(id)a4 seInfo:(id)a5
{
  id v9;
  id v10;
  NFSecureElementHandle *v11;
  NFSecureElementHandle *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NFSecureElementHandle;
  v11 = -[NFSecureElementHandle init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_identifier = a3;
    objc_storeStrong((id *)&v11->_driver, a4);
    objc_storeStrong((id *)&v12->_info, a5);
  }

  return v12;
}

- (id)transceive:(id)a3 toOS:(int64_t)a4 error:(id *)a5
{
  id v9;
  NFDriverWrapper *driver;
  id v11;
  void *v12;
  void *v14;

  v9 = a3;
  driver = self->_driver;
  if (!driver)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFSecureElementHandle.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_driver != nil"));

    driver = self->_driver;
  }
  v11 = sub_100027CB0(driver, self->_identifier, v9, a4, 0, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

- (BOOL)setAlwaysOn:(BOOL)a3
{
  NFDriverWrapper *driver;
  void *v7;

  driver = self->_driver;
  if (!driver)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFSecureElementHandle.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_driver != nil"));

    driver = self->_driver;
  }
  return sub_100026FAC(driver);
}

- (BOOL)enableGreenCarThreshold:(BOOL)a3
{
  return sub_1001CB8C4(self->_driver, a3);
}

- (BOOL)isFieldPresent
{
  NFDriverWrapper *driver;
  BOOL fieldPresent;

  driver = self->_driver;
  if (!driver)
    return 0;
  -[NSLock lock](driver->_fieldPresentLock, "lock");
  fieldPresent = driver->_fieldPresent;
  -[NSLock unlock](driver->_fieldPresentLock, "unlock");
  return fieldPresent;
}

- (BOOL)hasTransactionEnded
{
  NFDriverWrapper *driver;

  driver = self->_driver;
  return driver && driver->_hasTransactionEnded;
}

- (BOOL)hasSentRAPDU
{
  NFDriverWrapper *driver;

  driver = self->_driver;
  return driver && driver->_hasSentRAPDU;
}

- (void)redactLogging:(BOOL)a3
{
  if (self->_driver)
    NFDriverRedactLogging(a3, a2);
}

- (int)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int)a3
{
  self->_identifier = a3;
}

- (NFDriverWrapper)driver
{
  return (NFDriverWrapper *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDriver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NFHardwareSecureElementInfo)info
{
  return (NFHardwareSecureElementInfo *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_driver, 0);
}

@end
