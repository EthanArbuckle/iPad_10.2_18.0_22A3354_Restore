@implementation DOCBackgroundColorView

- (_TtC5Files22DOCBackgroundColorView)initWithFrame:(CGRect)a3
{
  return (_TtC5Files22DOCBackgroundColorView *)sub_1004694D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Files22DOCBackgroundColorView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC5Files22DOCBackgroundColorView *result;

  v5 = OBJC_IVAR____TtC5Files22DOCBackgroundColorView_backgroundLayer;
  v6 = objc_allocWithZone((Class)CALayer);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files22DOCBackgroundColorView_layerBackgroundColor) = 0;

  result = (_TtC5Files22DOCBackgroundColorView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/DOCBackgroundColorView.swift", 34, 2, 31, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC5Files22DOCBackgroundColorView *v2;

  v2 = self;
  sub_1004696C8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCBackgroundColorView_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCBackgroundColorView_layerBackgroundColor));
}

@end
