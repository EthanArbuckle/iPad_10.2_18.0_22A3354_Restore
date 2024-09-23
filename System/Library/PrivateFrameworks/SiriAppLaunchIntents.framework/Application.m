@implementation Application

- (NSString)description
{
  Application *v2;
  void *v3;

  v2 = self;
  Application.description.getter();

  v3 = (void *)sub_2291C46AC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Application)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_2291C46B8();
  sub_2291C46B8();
  if (a5)
    sub_2291C46B8();
  return (Application *)Application.init(identifier:display:pronunciationHint:)();
}

- (Application)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (Application *)Application.init(coder:)();
}

@end
