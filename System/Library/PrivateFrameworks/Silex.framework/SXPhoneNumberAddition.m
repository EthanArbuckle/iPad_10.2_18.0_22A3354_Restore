@implementation SXPhoneNumberAddition

- (id)action
{
  SXPhoneNumberAction *v3;
  void *v4;
  SXPhoneNumberAction *v5;

  v3 = [SXPhoneNumberAction alloc];
  -[SXPhoneNumberAddition phoneNumber](self, "phoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SXPhoneNumberAction initWithPhoneNumber:](v3, "initWithPhoneNumber:", v4);

  return v5;
}

@end
