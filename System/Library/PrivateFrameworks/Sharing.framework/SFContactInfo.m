@implementation SFContactInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFContactInfo)initWithCoder:(id)a3
{
  id v4;
  SFContactInfo *v5;
  id v6;
  id v7;
  id v8;
  SFContactInfo *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFContactInfo;
  v5 = -[SFContactInfo init](&v11, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *contactIdentifier;
  NSString *emailAddress;
  NSString *phoneNumber;
  id v8;

  v4 = a3;
  contactIdentifier = self->_contactIdentifier;
  v8 = v4;
  if (contactIdentifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", contactIdentifier, CFSTR("cnID"));
    v4 = v8;
  }
  emailAddress = self->_emailAddress;
  if (emailAddress)
  {
    objc_msgSend(v8, "encodeObject:forKey:", emailAddress, CFSTR("email"));
    v4 = v8;
  }
  phoneNumber = self->_phoneNumber;
  if (phoneNumber)
  {
    objc_msgSend(v8, "encodeObject:forKey:", phoneNumber, CFSTR("phone"));
    v4 = v8;
  }

}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end
