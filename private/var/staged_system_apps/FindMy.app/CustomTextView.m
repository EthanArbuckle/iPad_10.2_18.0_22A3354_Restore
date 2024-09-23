@implementation CustomTextView

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC6FindMy14CustomTextView *v7;
  uint64_t v8;
  _TtC6FindMy14CustomTextView *v9;
  unsigned __int8 v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = sub_10028B1FC((uint64_t)a3, (uint64_t)v12);

  sub_10005D03C((uint64_t)v12);
  return v10 & 1;
}

- (_TtC6FindMy14CustomTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CustomTextView();
  return -[CustomTextView initWithFrame:textContainer:](&v10, "initWithFrame:textContainer:", a4, x, y, width, height);
}

- (_TtC6FindMy14CustomTextView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CustomTextView();
  return -[CustomTextView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
