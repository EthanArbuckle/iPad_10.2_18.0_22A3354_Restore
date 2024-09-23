@implementation SXHeadingComponentClassification

+ (id)typeString
{
  return CFSTR("text");
}

+ (int)role
{
  return 13;
}

+ (id)roleString
{
  return CFSTR("heading");
}

- (id)accessibilityContextualLabel
{
  void *v2;
  void *v3;

  SXBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Heading"), &stru_24D68E0F8, 0);
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
  +[SXAXCustomRotorDefinition headingsRotor]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXAXCustomRotor rotorWithName:](SXAXCustomRotor, "rotorWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)accessibilitySkippedDuringReadAll
{
  return 0;
}

- (id)layoutRules
{
  return +[SXComponentLayoutRules twoColumnLayoutRules](SXComponentLayoutRules, "twoColumnLayoutRules");
}

- (id)textRules
{
  return +[SXComponentTextRules headingTextRules](SXComponentTextRules, "headingTextRules");
}

- (id)defaultTextStyleIdentifiers
{
  void *v2;
  __CFString *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", CFSTR("default"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "roleString");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", CFSTR("default-heading"));
  if (v3 && v3 != SXComponentClassificationUnknownRoleString)
  {
    SXDefaultTextStyleIdentifierForRole((uint64_t)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "containsObject:", v4) & 1) == 0)
      objc_msgSend(v2, "addObject:", v4);

  }
  return v2;
}

- (id)defaultComponentStyleIdentifiers
{
  void *v2;
  __CFString *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", CFSTR("default"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "roleString");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", CFSTR("default-heading"));
  if (v3 && v3 != SXComponentClassificationUnknownRoleString)
  {
    SXDefaultComponentStyleIdentifierForRole((uint64_t)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "containsObject:", v4) & 1) == 0)
      objc_msgSend(v2, "addObject:", v4);

  }
  return v2;
}

- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a3;
  if (a4 == 1
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SXHeadingComponentClassification;
    v7 = -[SXComponentClassification hasAffiliationWithClassification:forDirection:](&v9, sel_hasAffiliationWithClassification_forDirection_, v6, a4);
  }

  return v7;
}

@end
