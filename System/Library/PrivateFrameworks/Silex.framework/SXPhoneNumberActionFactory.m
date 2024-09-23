@implementation SXPhoneNumberActionFactory

- (id)actionForAddition:(id)a3
{
  id v3;
  SXPhoneNumberAction *v4;
  SXPhoneNumberAction *v5;
  void *v6;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "phoneNumber");
    v4 = (SXPhoneNumberAction *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = [SXPhoneNumberAction alloc];
      objc_msgSend(v3, "phoneNumber");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[SXPhoneNumberAction initWithPhoneNumber:](v5, "initWithPhoneNumber:", v6);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)actionForURL:(id)a3
{
  void *v3;
  void *v4;
  SXPhoneNumberAction *v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "queryValueForName:", CFSTR("phoneNumber"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = -[SXPhoneNumberAction initWithPhoneNumber:]([SXPhoneNumberAction alloc], "initWithPhoneNumber:", v4);
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
