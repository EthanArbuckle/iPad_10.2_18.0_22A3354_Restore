@implementation FMCalloutView

- (_TtC6FindMy13FMCalloutView)initWithFrame:(CGRect)a3
{
  return (_TtC6FindMy13FMCalloutView *)sub_1002B2404(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6FindMy13FMCalloutView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC6FindMy13FMCalloutView *result;

  v5 = OBJC_IVAR____TtC6FindMy13FMCalloutView_path;
  v6 = objc_allocWithZone((Class)UIBezierPath);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy13FMCalloutView_triangleWidth) = (Class)0x4028000000000000;

  result = (_TtC6FindMy13FMCalloutView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMCalloutView.swift", 26, 2, 22, 0);
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  _TtC6FindMy13FMCalloutView *v3;

  v3 = self;
  sub_1002B2690();

}

- (void).cxx_destruct
{

}

@end
