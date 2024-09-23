@implementation EncapsulatedColorView

- (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView)initWithCoder:(id)a3
{
  _TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView *result;

  result = (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLBoardViewControllerAnimatedTransition.swift", 55, 2, 842, 0);
  __break(1u);
  return result;
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
  v6.super_class = (Class)type metadata accessor for EncapsulatedColorView();
  -[EncapsulatedColorView frame](&v6, "frame");
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
  char *v7;
  void *v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for EncapsulatedColorView();
  v7 = (char *)v9.receiver;
  -[EncapsulatedColorView setFrame:](&v9, "setFrame:", x, y, width, height);
  v8 = *(void **)&v7[OBJC_IVAR____TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView_colorView];
  objc_msgSend(v7, "frame", v9.receiver, v9.super_class);
  objc_msgSend(v8, "setFrame:", 0.0, 0.0);

}

- (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView)initWithFrame:(CGRect)a3
{
  _TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView *result;

  result = (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView *)_swift_stdlib_reportUnimplementedInitializer("Freeform.EncapsulatedColorView", 30, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView_color));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView_colorView));
}

@end
