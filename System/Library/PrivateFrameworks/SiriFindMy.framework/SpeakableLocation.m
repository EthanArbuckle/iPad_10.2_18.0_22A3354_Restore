@implementation SpeakableLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SpeakableLocation)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_1CCCF2A9C();
  sub_1CCCF2A9C();
  if (a5)
    sub_1CCCF2A9C();
  return (SpeakableLocation *)SpeakableLocation.init(identifier:display:pronunciationHint:)();
}

- (SpeakableLocation)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (SpeakableLocation *)SpeakableLocation.init(coder:)();
}

@end
