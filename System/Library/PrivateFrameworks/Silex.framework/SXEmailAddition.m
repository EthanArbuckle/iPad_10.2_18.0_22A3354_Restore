@implementation SXEmailAddition

- (id)action
{
  SXEmailAction *v3;
  void *v4;
  void *v5;
  SXEmailAction *v6;

  v3 = [SXEmailAction alloc];
  -[SXEmailAddition to](self, "to");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXEmailAddition subject](self, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SXEmailAction initWithRecipient:subject:](v3, "initWithRecipient:subject:", v4, v5);

  return v6;
}

@end
