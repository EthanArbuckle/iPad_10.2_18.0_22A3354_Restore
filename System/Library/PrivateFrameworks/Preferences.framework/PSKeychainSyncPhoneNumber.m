@implementation PSKeychainSyncPhoneNumber

+ (id)phoneNumberWithDigits:(id)a3 countryInfo:(id)a4
{
  id v5;
  id v6;
  PSKeychainSyncPhoneNumber *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(PSKeychainSyncPhoneNumber);
  -[PSKeychainSyncPhoneNumber setDigits:](v7, "setDigits:", v6);

  -[PSKeychainSyncPhoneNumber setCountryInfo:](v7, "setCountryInfo:", v5);
  return v7;
}

- (id)_stringByAddingDialingPrefixToString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  -[PSKeychainSyncPhoneNumber countryInfo](self, "countryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dialingPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[PSKeychainSyncPhoneNumber countryInfo](self, "countryInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dialingPrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("+%@ %@"), v10, v4);
    v11 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v11;
  }
  return v4;
}

- (id)formattedString
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _Unwind_Exception *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;

  -[PSKeychainSyncPhoneNumber digits](self, "digits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncPhoneNumber countryInfo](self, "countryInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v6 = objc_msgSend(v5, "lowercaseString");
    v7 = -[PSKeychainSyncPhoneNumber digits](self, "digits");
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v8 = getCFPhoneNumberCreateSymbolLoc_ptr;
    v20 = getCFPhoneNumberCreateSymbolLoc_ptr;
    if (!getCFPhoneNumberCreateSymbolLoc_ptr)
    {
      v9 = (void *)PhoneNumbersLibrary_0();
      v8 = dlsym(v9, "CFPhoneNumberCreate");
      v18[3] = (uint64_t)v8;
      getCFPhoneNumberCreateSymbolLoc_ptr = v8;
    }
    _Block_object_dispose(&v17, 8);
    if (!v8)
    {
      PSPNCreateFormattedStringWithCountry_cold_1();
      goto LABEL_12;
    }
    v10 = ((uint64_t (*)(_QWORD, NSString *, uint64_t))v8)(0, v7, v6);
    if (v10)
    {
      v11 = (const void *)v10;
      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v12 = getCFPhoneNumberCreateStringSymbolLoc_ptr;
      v20 = getCFPhoneNumberCreateStringSymbolLoc_ptr;
      if (!getCFPhoneNumberCreateStringSymbolLoc_ptr)
      {
        v13 = (void *)PhoneNumbersLibrary_0();
        v12 = dlsym(v13, "CFPhoneNumberCreateString");
        v18[3] = (uint64_t)v12;
        getCFPhoneNumberCreateStringSymbolLoc_ptr = v12;
      }
      _Block_object_dispose(&v17, 8);
      if (v12)
      {
        v14 = ((uint64_t (*)(_QWORD, const void *, uint64_t))v12)(0, v11, 1);

        CFRelease(v11);
        v3 = (void *)v14;
        goto LABEL_10;
      }
LABEL_12:
      v16 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
      _Block_object_dispose(&v17, 8);
      _Unwind_Resume(v16);
    }
  }
LABEL_10:

  return v3;
}

- (id)formattedStringWithDialingPrefix
{
  void *v3;
  void *v4;

  -[PSKeychainSyncPhoneNumber formattedString](self, "formattedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncPhoneNumber _stringByAddingDialingPrefixToString:](self, "_stringByAddingDialingPrefixToString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)formattedAndObfuscatedString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;

  -[PSKeychainSyncPhoneNumber formattedString](self, "formattedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "length") < 3)
  {
    v4 = v3;
  }
  else
  {
    v4 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), 9679);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "length");
    if (v7 - 1 >= 0)
    {
      v8 = v7;
      v9 = 0;
      do
      {
        if (objc_msgSend(v6, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", --v8)))
        {
          if (v9 > 1)
            objc_msgSend(v4, "replaceCharactersInRange:withString:", v8, 1, v5);
          else
            ++v9;
        }
      }
      while (v8 > 0);
    }

  }
  -[PSKeychainSyncPhoneNumber _stringByAddingDialingPrefixToString:](self, "_stringByAddingDialingPrefixToString:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)digits
{
  return self->_digits;
}

- (void)setDigits:(id)a3
{
  objc_storeStrong((id *)&self->_digits, a3);
}

- (KeychainSyncCountryInfo)countryInfo
{
  return self->_countryInfo;
}

- (void)setCountryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_countryInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryInfo, 0);
  objc_storeStrong((id *)&self->_digits, 0);
}

@end
