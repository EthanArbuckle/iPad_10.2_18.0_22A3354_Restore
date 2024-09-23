@implementation SXTitleComponentClassification

+ (id)typeString
{
  return CFSTR("text");
}

+ (id)roleString
{
  return CFSTR("title");
}

+ (int)role
{
  return 32;
}

- (id)textRules
{
  return +[SXComponentTextRules titleTextRules](SXComponentTextRules, "titleTextRules");
}

- (id)accessibilityContextualLabel
{
  void *v2;
  void *v3;

  SXBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Title"), &stru_24D68E0F8, 0);
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

- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a3;
  if (a4 == 1
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SXTitleComponentClassification;
    v7 = -[SXComponentClassification hasAffiliationWithClassification:forDirection:](&v9, sel_hasAffiliationWithClassification_forDirection_, v6, a4);
  }

  return v7;
}

@end
