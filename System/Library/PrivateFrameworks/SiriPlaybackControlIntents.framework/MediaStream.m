@implementation MediaStream

- (NSString)description
{
  MediaStream *v2;
  void *v3;

  v2 = self;
  MediaStream.description.getter();

  v3 = (void *)sub_2249ECDB0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MediaStream)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECDD4();
  return (MediaStream *)MediaStream.init(identifier:display:pronunciationHint:)();
}

- (MediaStream)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (MediaStream *)MediaStream.init(coder:)();
}

@end
