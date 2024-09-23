@implementation SXEmailActionFactory

- (id)actionForAddition:(id)a3
{
  id v3;
  SXEmailAction *v4;
  void *v5;
  void *v6;
  SXEmailAction *v7;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = [SXEmailAction alloc];
    objc_msgSend(v3, "to");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SXEmailAction initWithRecipient:subject:](v4, "initWithRecipient:subject:", v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)actionForURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  SXEmailAction *v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "queryValueForName:", CFSTR("recipient"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "queryValueForName:", CFSTR("subject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SXEmailAction initWithRecipient:subject:]([SXEmailAction alloc], "initWithRecipient:subject:", v4, v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
