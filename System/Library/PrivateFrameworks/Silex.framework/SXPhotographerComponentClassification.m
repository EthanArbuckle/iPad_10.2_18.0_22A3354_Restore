@implementation SXPhotographerComponentClassification

+ (id)typeString
{
  return CFSTR("text");
}

+ (int)role
{
  return 26;
}

+ (id)roleString
{
  return CFSTR("photographer");
}

- (id)textRules
{
  return +[SXComponentTextRules smallTextRules](SXComponentTextRules, "smallTextRules");
}

+ (id)accessibilityContextualLabel
{
  void *v2;
  void *v3;

  SXBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Photographer"), &stru_24D68E0F8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a3;
  if (!a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_13:
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SXPhotographerComponentClassification;
    v7 = -[SXComponentClassification hasAffiliationWithClassification:forDirection:](&v9, sel_hasAffiliationWithClassification_forDirection_, v6, a4);
  }

  return v7;
}

@end
