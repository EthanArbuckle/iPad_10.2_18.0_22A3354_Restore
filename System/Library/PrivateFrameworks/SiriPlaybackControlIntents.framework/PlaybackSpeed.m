@implementation PlaybackSpeed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PlaybackSpeed)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECDD4();
  return (PlaybackSpeed *)PlaybackSpeed.init(identifier:display:pronunciationHint:)();
}

- (PlaybackSpeed)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (PlaybackSpeed *)PlaybackSpeed.init(coder:)();
}

@end
