@implementation XPCValue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC4Sage8XPCValue)init
{
  return (_TtC4Sage8XPCValue *)XPCValue.init()();
}

- (_TtC4Sage8XPCValue)initWithCoder:(id)a3
{
  _TtC4Sage8XPCValue *result;

  XPCValue.init(coder:)(a3);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC4Sage8XPCValue *v5;

  v4 = a3;
  v5 = self;
  sub_2457BA2B8(v4);

}

@end
