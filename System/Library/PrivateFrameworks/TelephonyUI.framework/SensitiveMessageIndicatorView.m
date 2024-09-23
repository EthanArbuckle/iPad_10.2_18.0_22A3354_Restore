@implementation SensitiveMessageIndicatorView

- (void)layoutSubviews
{
  _TtC11TelephonyUI29SensitiveMessageIndicatorView *v2;

  v2 = self;
  sub_1BCFDC16C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC11TelephonyUI29SensitiveMessageIndicatorView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1BCFDC2D0(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC11TelephonyUI29SensitiveMessageIndicatorView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC11TelephonyUI29SensitiveMessageIndicatorView *v8;
  _TtC11TelephonyUI29SensitiveMessageIndicatorView *v9;
  objc_super v11;

  v5 = OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for SensitiveMessageIndicatorView();
  v9 = -[MessageIndicatorView initWithCoder:](&v11, sel_initWithCoder_, v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel));
}

@end
