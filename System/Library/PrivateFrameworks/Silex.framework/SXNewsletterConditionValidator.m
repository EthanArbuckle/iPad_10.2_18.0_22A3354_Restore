@implementation SXNewsletterConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  uint64_t v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "newsletterSubscriptionStatus"))
  {
    if (objc_msgSend(v5, "newsletterSubscriptionStatus") == 1)
    {
      v7 = 0;
    }
    else
    {
      v8 = objc_msgSend(v5, "newsletterSubscriptionStatus");
      v7 = v8 == objc_msgSend(v6, "newsletterSubscriptionStatus");
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

@end
