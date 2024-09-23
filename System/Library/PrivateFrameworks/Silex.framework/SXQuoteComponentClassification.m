@implementation SXQuoteComponentClassification

+ (id)typeString
{
  return CFSTR("text");
}

+ (int)role
{
  return 29;
}

+ (id)roleString
{
  return CFSTR("quote");
}

- (id)accessibilityContextualLabel
{
  void *v2;
  void *v3;

  SXBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Quote"), &stru_24D68E0F8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SXQuoteComponentClassification;
    v7 = -[SXComponentClassification hasAffiliationWithClassification:forDirection:](&v9, sel_hasAffiliationWithClassification_forDirection_, v6, a4);
  }

  return v7;
}

@end
