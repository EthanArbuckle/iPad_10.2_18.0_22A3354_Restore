@implementation CRLMathResultView

- (_TtP8Freeform25CRLMathResultViewDelegate_)delegate
{
  return (_TtP8Freeform25CRLMathResultViewDelegate_ *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Freeform17CRLMathResultView_delegate));
}

- (_TtC8Freeform17CRLMathResultView)initWithFrame:(CGRect)a3 delegate:(id)a4
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
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Freeform17CRLMathResultView_delegate) = (Class)a4;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CRLMathResultView();
  swift_unknownObjectRetain(a4);
  return -[CRLiOSUnhittableView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC8Freeform17CRLMathResultView)initWithCoder:(id)a3
{
  _TtC8Freeform17CRLMathResultView *result;

  result = (_TtC8Freeform17CRLMathResultView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLMathResultView.swift", 32, 2, 33, 0);
  __break(1u);
  return result;
}

- (void)willRemoveSubview:(id)a3
{
  sub_1006B0880(self, (uint64_t)a2, a3, (const char **)&selRef_willRemoveSubview_, (SEL *)&selRef_subviewWillBeRemovedWithSubview_);
}

- (void)didAddSubview:(id)a3
{
  sub_1006B0880(self, (uint64_t)a2, a3, (const char **)&selRef_didAddSubview_, (SEL *)&selRef_didAddSubviewWithSubview_);
}

- (_TtC8Freeform17CRLMathResultView)initWithFrame:(CGRect)a3
{
  _TtC8Freeform17CRLMathResultView *result;

  result = (_TtC8Freeform17CRLMathResultView *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLMathResultView", 26, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform17CRLMathResultView_delegate));
}

@end
