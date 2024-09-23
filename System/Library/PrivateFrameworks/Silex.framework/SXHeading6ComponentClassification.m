@implementation SXHeading6ComponentClassification

+ (id)typeString
{
  return CFSTR("text");
}

+ (id)roleString
{
  return CFSTR("heading6");
}

+ (int)role
{
  return 19;
}

- (id)accessibilityContextualLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16F0], "localizedStringFromNumber:numberStyle:", &unk_24D6FF088, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SXBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Heading level %@"), &stru_24D68E0F8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityCustomRotorMembership
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  +[SXAXCustomRotorDefinition headingsRotor]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXAXCustomRotor rotorWithName:](SXAXCustomRotor, "rotorWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
