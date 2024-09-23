@implementation SXFigureComponentClassification

+ (id)typeString
{
  return CFSTR("scalable_image");
}

+ (int)role
{
  return 11;
}

+ (id)roleString
{
  return CFSTR("figure");
}

- (id)accessibilityContextualLabel
{
  void *v2;
  void *v3;

  SXBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Figure"), &stru_24D68E0F8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityCustomRotorMembership
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  +[SXAXCustomRotorDefinition imagesRotor]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXAXCustomRotor rotorWithName:](SXAXCustomRotor, "rotorWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
