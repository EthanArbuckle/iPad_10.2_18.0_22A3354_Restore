@implementation EncapsulatedImageView

- (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView)initWithFrame:(CGRect)a3
{
  return (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView *)sub_1006786E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView)initWithCoder:(id)a3
{
  _TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView *result;

  result = (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLBoardViewControllerAnimatedTransition.swift", 55, 2, 762, 0);
  __break(1u);
  return result;
}

- (void)updateConstraints
{
  void *v2;
  _TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView_imageView);
  v3 = self;
  objc_msgSend(v2, "crl_activateEqualConstraintsForView:", v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for EncapsulatedImageView();
  -[EncapsulatedImageView updateConstraints](&v4, "updateConstraints");

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView_imageView));
}

@end
