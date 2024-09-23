@implementation TranslationResultItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TranslationResultItem)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_228A3BAE4();
  sub_228A3BAE4();
  if (a5)
    sub_228A3BAE4();
  return (TranslationResultItem *)TranslationResultItem.init(identifier:display:pronunciationHint:)();
}

- (TranslationResultItem)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (TranslationResultItem *)TranslationResultItem.init(coder:)();
}

@end
