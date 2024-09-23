@implementation CRLLinkView

- (_TtC8Freeform11CRLLinkView)initWithCoder:(id)a3
{
  id v5;
  _TtC8Freeform11CRLLinkView *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8Freeform11CRLLinkView_rep, 0);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform11CRLLinkView_viewScale) = (Class)0x3FF0000000000000;
  v5 = a3;

  result = (_TtC8Freeform11CRLLinkView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLLinkView.swift", 26, 2, 37, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLLinkView();
  v2 = v3.receiver;
  -[CRLLinkView layoutSubviews](&v3, "layoutSubviews");
  sub_100898CB0();

}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLLinkView();
  -[CRLLinkView frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC8Freeform11CRLLinkView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_100898A64(x, y, width, height);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for CRLLinkView();
  v7 = v13.receiver;
  v8 = a4;
  v9 = -[CRLLinkView hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (v9)
  {
    v10 = v9;
    sub_1004B8930(0, (unint64_t *)&qword_1013DFC10, UIView_ptr);
    v11 = v7;
    v7 = v10;
    LOBYTE(v10) = static NSObject.== infix(_:_:)(v7, v11);

    if ((v10 & 1) == 0)
      return v7;
  }
  else
  {

  }
  v7 = 0;
  return v7;
}

- (_TtC8Freeform11CRLLinkView)initWithFrame:(CGRect)a3
{
  _TtC8Freeform11CRLLinkView *result;

  result = (_TtC8Freeform11CRLLinkView *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLLinkView", 20, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform11CRLLinkView_rep);

}

@end
