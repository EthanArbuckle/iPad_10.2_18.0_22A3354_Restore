@implementation ContentImage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ContentImage)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_21E9D8524();
  sub_21E9D8524();
  if (a5)
    sub_21E9D8524();
  return (ContentImage *)ContentImage.init(identifier:display:pronunciationHint:)();
}

- (ContentImage)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (ContentImage *)ContentImage.init(coder:)();
}

@end
