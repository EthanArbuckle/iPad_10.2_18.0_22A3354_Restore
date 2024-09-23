@implementation UpsellShowGridView

- (_TtC23ShelfKitCollectionViews18UpsellShowGridView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_16CF60();
}

- (void)layoutSubviews
{
  id v2;
  double Width;
  uint64_t v4;
  uint64_t v5;
  double v6;
  objc_super v7;
  CGRect v8;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v2 = v7.receiver;
  -[UpsellShowGridView layoutSubviews](&v7, "layoutSubviews");
  objc_msgSend(v2, "bounds", v7.receiver, v7.super_class);
  Width = CGRectGetWidth(v8);
  v4 = SizeClass.init(width:)(Width);
  v5 = sub_16ADB8();
  *((_BYTE *)v2 + OBJC_IVAR____TtC23ShelfKitCollectionViews18UpsellShowGridView____lazy_storage___sizeClass) = v4;
  v6 = SizeClass.rawValue.getter(v5);
  if (v6 != SizeClass.rawValue.getter(v4))
    sub_16AE00();

}

- (_TtC23ShelfKitCollectionViews18UpsellShowGridView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews18UpsellShowGridView *result;

  result = (_TtC23ShelfKitCollectionViews18UpsellShowGridView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.UpsellShowGridView", 42, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18UpsellShowGridView_upsellInformation));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews18UpsellShowGridView_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18UpsellShowGridView_horizontalStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18UpsellShowGridView____lazy_storage___gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18UpsellShowGridView____lazy_storage___hStackHeightConstraint));
}

@end
