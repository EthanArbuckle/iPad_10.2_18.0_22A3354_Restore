@implementation TintableLabel

- (void)tintColorDidChange
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TintableLabel();
  v2 = v4.receiver;
  -[TintableLabel tintColorDidChange](&v4, sel_tintColorDidChange);
  v3 = objc_msgSend(v2, sel_tintColor, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_setTextColor_, v3);

}

- (_TtC9SeymourUI13TintableLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TintableLabel();
  return -[TintableLabel initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI13TintableLabel)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TintableLabel();
  return -[TintableLabel initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
