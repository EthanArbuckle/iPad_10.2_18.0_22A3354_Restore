@implementation TUPhoneNumber

- (TUPhoneNumber)initWithCFPhoneNumberRef:(__CFPhoneNumber *)a3
{
  TUPhoneNumber *v4;
  TUPhoneNumber *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUPhoneNumber;
  v4 = -[TUPhoneNumber init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      CFRetain(a3);
      v5->_phoneNumberRef = a3;
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (TUPhoneNumber)initWithDigits:(id)a3 countryCode:(id)a4
{
  const void *v5;
  TUPhoneNumber *v6;

  v5 = (const void *)CFPhoneNumberCreate();
  v6 = -[TUPhoneNumber initWithCFPhoneNumberRef:](self, "initWithCFPhoneNumberRef:", v5);
  if (v5)
    CFRelease(v5);
  return v6;
}

+ (TUPhoneNumber)phoneNumberWithCFPhoneNumberRef:(__CFPhoneNumber *)a3
{
  return -[TUPhoneNumber initWithCFPhoneNumberRef:]([TUPhoneNumber alloc], "initWithCFPhoneNumberRef:", a3);
}

+ (TUPhoneNumber)phoneNumberWithDigits:(id)a3 countryCode:(id)a4
{
  id v5;
  id v6;
  TUPhoneNumber *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[TUPhoneNumber initWithDigits:countryCode:]([TUPhoneNumber alloc], "initWithDigits:countryCode:", v6, v5);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUPhoneNumber)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  TUPhoneNumber *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Digits"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CountryCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TUPhoneNumber initWithDigits:countryCode:](self, "initWithDigits:countryCode:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TUPhoneNumber digits](self, "digits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Digits"));

  -[TUPhoneNumber countryCode](self, "countryCode");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CountryCode"));

}

- (void)dealloc
{
  __CFPhoneNumber *phoneNumberRef;
  objc_super v4;

  phoneNumberRef = self->_phoneNumberRef;
  if (phoneNumberRef)
    CFRelease(phoneNumberRef);
  v4.receiver = self;
  v4.super_class = (Class)TUPhoneNumber;
  -[TUPhoneNumber dealloc](&v4, sel_dealloc);
}

- (NSString)digits
{
  return (NSString *)(id)CFPhoneNumberCreateString();
}

- (NSString)countryCode
{
  return (NSString *)(id)CFPhoneNumberCopyISOCountryCode();
}

- (NSString)formattedRepresentation
{
  return (NSString *)(id)CFPhoneNumberCreateString();
}

- (NSString)formattedInternationalRepresentation
{
  return (NSString *)(id)CFPhoneNumberCreateString();
}

- (NSString)unformattedInternationalRepresentation
{
  return (NSString *)(id)CFPhoneNumberCreateString();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __CFPhoneNumber *v5;
  const void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[TUPhoneNumber phoneNumberRef](self, "phoneNumberRef");
    v6 = (const void *)objc_msgSend(v4, "phoneNumberRef");
    v7 = 0;
    if (v5 && v6)
      v7 = CFEqual(v5, v6) != 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)areDigits:(id)a3 equalToDigits:(id)a4 usingCountryCode:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "phoneNumberWithDigits:countryCode:", a3, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "phoneNumberWithDigits:countryCode:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend(v10, "isEqual:", v11);
  return (char)v9;
}

- (__CFPhoneNumber)phoneNumberRef
{
  return self->_phoneNumberRef;
}

- (void)setPhoneNumberRef:(__CFPhoneNumber *)a3
{
  self->_phoneNumberRef = a3;
}

@end
