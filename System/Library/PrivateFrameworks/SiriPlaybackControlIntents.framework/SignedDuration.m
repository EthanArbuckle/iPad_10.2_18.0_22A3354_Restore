@implementation SignedDuration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SignedDuration)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECDD4();
  return (SignedDuration *)SignedDuration.init(identifier:display:pronunciationHint:)();
}

- (SignedDuration)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (SignedDuration *)SignedDuration.init(coder:)();
}

@end
