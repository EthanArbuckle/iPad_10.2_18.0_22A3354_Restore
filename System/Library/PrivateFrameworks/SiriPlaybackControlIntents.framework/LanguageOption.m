@implementation LanguageOption

- (NSString)description
{
  LanguageOption *v2;
  void *v3;

  v2 = self;
  LanguageOption.description.getter();

  v3 = (void *)sub_2249ECDB0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LanguageOption)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECDD4();
  return (LanguageOption *)LanguageOption.init(identifier:display:pronunciationHint:)();
}

- (LanguageOption)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (LanguageOption *)LanguageOption.init(coder:)();
}

@end
