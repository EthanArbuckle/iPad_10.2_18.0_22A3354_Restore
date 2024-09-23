@implementation CRLFollowBorderHighlightView

- (_TtC8Freeform28CRLFollowBorderHighlightView)initWithCoder:(id)a3
{
  id v5;
  _TtC8Freeform28CRLFollowBorderHighlightView *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8Freeform28CRLFollowBorderHighlightView_delegate, 0);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform28CRLFollowBorderHighlightView_defaultCornerRadius) = (Class)0x4030000000000000;
  v5 = a3;

  result = (_TtC8Freeform28CRLFollowBorderHighlightView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLFollowBorderHighlightView.swift", 43, 2, 45, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLFollowBorderHighlightView();
  v2 = v3.receiver;
  -[CRLFollowBorderHighlightView layoutSubviews](&v3, "layoutSubviews");
  objc_msgSend(v2, "setNeedsDisplay", v3.receiver, v3.super_class);

}

- (void)drawRect:(CGRect)a3
{
  _TtC8Freeform28CRLFollowBorderHighlightView *v3;

  v3 = self;
  sub_1008F04D0();

}

- (_TtC8Freeform28CRLFollowBorderHighlightView)initWithFrame:(CGRect)a3
{
  _TtC8Freeform28CRLFollowBorderHighlightView *result;

  result = (_TtC8Freeform28CRLFollowBorderHighlightView *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLFollowBorderHighlightView", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform28CRLFollowBorderHighlightView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLFollowBorderHighlightView_color));
}

@end
