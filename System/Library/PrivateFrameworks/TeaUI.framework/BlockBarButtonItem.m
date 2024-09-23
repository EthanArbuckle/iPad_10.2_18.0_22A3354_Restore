@implementation BlockBarButtonItem

- (_TtC5TeaUI18BlockBarButtonItem)init
{
  _TtC5TeaUI18BlockBarButtonItem *result;

  BlockBarButtonItem.init()();
  return result;
}

- (void)barButtonItemPressedWithSender:(id)a3
{
  id v4;
  _TtC5TeaUI18BlockBarButtonItem *v5;

  v4 = a3;
  v5 = self;
  sub_1B15C8A9C();

}

- (NSString)accessibilityLabel
{
  _TtC5TeaUI18BlockBarButtonItem *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1B15C8BB0();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1B16B983C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC5TeaUI18BlockBarButtonItem *v7;

  if (a3)
  {
    v4 = sub_1B16B9860();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1B15C8CB8(v4, v6);

}

- (_TtC5TeaUI18BlockBarButtonItem)initWithCoder:(id)a3
{
  _TtC5TeaUI18BlockBarButtonItem *result;

  BlockBarButtonItem.init(coder:)(a3);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1B13B9100(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI18BlockBarButtonItem_actionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI18BlockBarButtonItem_customContentView));
}

@end
