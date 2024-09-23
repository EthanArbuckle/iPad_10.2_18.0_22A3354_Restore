@implementation VideoControlBackdrop

- (_TtC23ShelfKitCollectionViews20VideoControlBackdrop)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews20VideoControlBackdrop *)sub_9E958(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews20VideoControlBackdrop)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews20VideoControlBackdrop *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews20VideoControlBackdrop_primaryBackgroundView) = 0;
  v4 = a3;

  result = (_TtC23ShelfKitCollectionViews20VideoControlBackdrop *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/VideoControlBackdrop.swift", 50, 2, 41, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews20VideoControlBackdrop *v2;

  v2 = self;
  sub_9EAE8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20VideoControlBackdrop_primaryBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20VideoControlBackdrop_contentView));
}

@end
