@implementation CardRim

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews7CardRim *v6;

  v5 = a3;
  v6 = self;
  sub_2790F4((uint64_t)a3);

}

- (_TtC23ShelfKitCollectionViews7CardRim)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC23ShelfKitCollectionViews7CardRim *result;

  v5 = OBJC_IVAR____TtC23ShelfKitCollectionViews7CardRim_innerRim;
  v6 = objc_allocWithZone((Class)CALayer);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews7CardRim_rimWidth) = 0;

  result = (_TtC23ShelfKitCollectionViews7CardRim *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/CardPresentationController.swift", 56, 2, 209, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;
  CGRect v5;
  CGRect v6;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[CardRim layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews7CardRim_innerRim];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  v6 = CGRectInset(v5, *(CGFloat *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews7CardRim_rimWidth], *(CGFloat *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews7CardRim_rimWidth]);
  objc_msgSend(v3, "setFrame:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);

}

- (_TtC23ShelfKitCollectionViews7CardRim)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews7CardRim *result;

  result = (_TtC23ShelfKitCollectionViews7CardRim *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.CardRim", 31, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
