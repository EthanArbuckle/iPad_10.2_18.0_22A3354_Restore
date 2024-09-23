@implementation DebugLabel

- (_TtC22UserNotificationsUIKitP33_E56270D007896E6F9A012E31D0F23E8810DebugLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC22UserNotificationsUIKitP33_E56270D007896E6F9A012E31D0F23E8810DebugLabel *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DebugLabel();
  v7 = -[DebugLabel initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  -[DebugLabel setTextAlignment:](v7, sel_setTextAlignment_, 1);
  -[DebugLabel setNumberOfLines:](v7, sel_setNumberOfLines_, 0);

  return v7;
}

- (_TtC22UserNotificationsUIKitP33_E56270D007896E6F9A012E31D0F23E8810DebugLabel)initWithCoder:(id)a3
{
  _TtC22UserNotificationsUIKitP33_E56270D007896E6F9A012E31D0F23E8810DebugLabel *result;

  result = (_TtC22UserNotificationsUIKitP33_E56270D007896E6F9A012E31D0F23E8810DebugLabel *)sub_1CFD7C814();
  __break(1u);
  return result;
}

@end
