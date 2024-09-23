@implementation DigitDialResultValidator

- (NSString)deviceCountryCode
{
  NSString *deviceCountryCode;
  NSString *v4;
  NSString *v5;

  deviceCountryCode = self->_deviceCountryCode;
  if (!deviceCountryCode)
  {
    TUHomeCountryCode();
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_deviceCountryCode;
    self->_deviceCountryCode = v4;

    deviceCountryCode = self->_deviceCountryCode;
  }
  return deviceCountryCode;
}

- (NSString)networkCountryCode
{
  NSString *networkCountryCode;
  NSString *v4;
  NSString *v5;

  networkCountryCode = self->_networkCountryCode;
  if (!networkCountryCode)
  {
    TUNetworkCountryCode();
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_networkCountryCode;
    self->_networkCountryCode = v4;

    networkCountryCode = self->_networkCountryCode;
  }
  return networkCountryCode;
}

- (id)_copyExceptionsForCountryCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Exceptions-%@"), v3);
    VoiceDialBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathForResource:ofType:inDirectory:", v5, CFSTR("plist"), CFSTR("DigitDialExceptions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithContentsOfFile:", v7);
    else
      v3 = 0;
  }
  else
  {
    v7 = 0;
    v5 = 0;
  }
  v8 = v3;

  return v8;
}

- (BOOL)_isValidExceptionForDevice:(id)a3
{
  id v4;
  NSArray *deviceExceptions;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  BOOL v9;

  v4 = a3;
  deviceExceptions = self->_deviceExceptions;
  if (!deviceExceptions)
  {
    -[DigitDialResultValidator deviceCountryCode](self, "deviceCountryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[DigitDialResultValidator _copyExceptionsForCountryCode:](self, "_copyExceptionsForCountryCode:", v6);
    v8 = self->_deviceExceptions;
    self->_deviceExceptions = v7;

    deviceExceptions = self->_deviceExceptions;
  }
  v9 = -[NSArray containsObject:](deviceExceptions, "containsObject:", v4);

  return v9;
}

- (BOOL)_isValidExceptionForNetwork:(id)a3
{
  id v4;
  NSArray *networkExceptions;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  BOOL v9;

  v4 = a3;
  networkExceptions = self->_networkExceptions;
  if (!networkExceptions)
  {
    -[DigitDialResultValidator networkCountryCode](self, "networkCountryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[DigitDialResultValidator _copyExceptionsForCountryCode:](self, "_copyExceptionsForCountryCode:", v6);
    v8 = self->_networkExceptions;
    self->_networkExceptions = v7;

    networkExceptions = self->_networkExceptions;
  }
  v9 = -[NSArray containsObject:](networkExceptions, "containsObject:", v4);

  return v9;
}

- (BOOL)_hasMinimumNumberOfDigits:(id)a3 countryCode:(id)a4
{
  uint64_t v4;
  const void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = CFPhoneNumberCreate();
  if (!v4)
    return 0;
  v5 = (const void *)v4;
  v6 = (void *)CFPhoneNumberCopyUnformattedRepresentation();
  v7 = v6;
  if (v6)
    v8 = (unint64_t)objc_msgSend(v6, "length") > 3;
  else
    v8 = 0;
  CFRelease(v5);

  return v8;
}

- (unint64_t)indexOfValidPhoneNumber:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (!v5)
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
LABEL_24:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  do
  {
    v12 = v11;
    objc_msgSend(v4, "objectAtIndex:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v11, "length");
    if (!v13)
      goto LABEL_18;
    -[DigitDialResultValidator deviceCountryCode](self, "deviceCountryCode");
    v14 = objc_claimAutoreleasedReturnValue();

    if (PNIsValidPhoneNumberForCountry()
      && -[DigitDialResultValidator _hasMinimumNumberOfDigits:countryCode:](self, "_hasMinimumNumberOfDigits:countryCode:", v11, v14))
    {
      goto LABEL_22;
    }
    if (v9)
    {
      if ((v8 & 1) != 0)
        goto LABEL_8;
    }
    else
    {
      -[DigitDialResultValidator networkCountryCode](self, "networkCountryCode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((TUStringsAreEqualOrNil() & 1) == 0)
      {
LABEL_8:
        if (PNIsValidPhoneNumberForCountry()
          && -[DigitDialResultValidator _hasMinimumNumberOfDigits:countryCode:](self, "_hasMinimumNumberOfDigits:countryCode:", v11, v9))
        {
          goto LABEL_22;
        }
        v15 = 1;
        goto LABEL_13;
      }
    }
    v15 = 0;
LABEL_13:
    if (-[DigitDialResultValidator _isValidExceptionForDevice:](self, "_isValidExceptionForDevice:", v11))
      goto LABEL_22;
    if (v15)
    {
      LODWORD(v13) = -[DigitDialResultValidator _isValidExceptionForNetwork:](self, "_isValidExceptionForNetwork:", v11);
      v8 = 1;
    }
    else
    {
      LODWORD(v13) = 0;
      v8 = 0;
    }
    v10 = (void *)v14;
LABEL_18:
    v7 += v13 ^ 1;
  }
  while ((v13 & 1) == 0 && v7 < v6);
  if (!(_DWORD)v13)
    goto LABEL_24;
  v14 = (uint64_t)v10;
LABEL_22:
  v10 = (void *)v14;
LABEL_25:

  return v7;
}

- (id)validRecognitionResultFromRecognitionResult:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v9;

  v9 = 0;
  v4 = a3;
  DigitDialPhoneNumberFromResult(v4, &v9, 0);
  v5 = v9;
  if (-[DigitDialResultValidator indexOfValidPhoneNumber:](self, "indexOfValidPhoneNumber:", v5) == 0x7FFFFFFFFFFFFFFFLL)
    v6 = 0;
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

- (void)setDeviceCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_deviceCountryCode, a3);
}

- (void)setNetworkCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_networkCountryCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkCountryCode, 0);
  objc_storeStrong((id *)&self->_deviceCountryCode, 0);
  objc_storeStrong((id *)&self->_networkExceptions, 0);
  objc_storeStrong((id *)&self->_deviceExceptions, 0);
}

@end
