@implementation SXPhoneNumberAction

- (SXPhoneNumberAction)initWithPhoneNumber:(id)a3
{
  id v5;
  SXPhoneNumberAction *v6;
  SXPhoneNumberAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXPhoneNumberAction;
  v6 = -[SXPhoneNumberAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_phoneNumber, a3);

  return v7;
}

- (NSString)type
{
  return (NSString *)CFSTR("phone_number");
}

- (SXJSONDictionary)analytics
{
  return self->analytics;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->analytics, 0);
}

@end
