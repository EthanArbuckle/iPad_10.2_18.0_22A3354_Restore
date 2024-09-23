@implementation InAppSearchCriteria

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (InAppSearchCriteria)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_2291C46B8();
  sub_2291C46B8();
  if (a5)
    sub_2291C46B8();
  return (InAppSearchCriteria *)InAppSearchCriteria.init(identifier:display:pronunciationHint:)();
}

- (InAppSearchCriteria)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (InAppSearchCriteria *)InAppSearchCriteria.init(coder:)();
}

@end
