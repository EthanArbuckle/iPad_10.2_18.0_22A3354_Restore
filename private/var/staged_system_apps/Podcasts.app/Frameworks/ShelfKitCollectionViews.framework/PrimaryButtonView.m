@implementation PrimaryButtonView

- (_TtC23ShelfKitCollectionViews17PrimaryButtonView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2A1A70();
}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews17PrimaryButtonView_button));
}

- (_TtC23ShelfKitCollectionViews17PrimaryButtonView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews17PrimaryButtonView *result;

  result = (_TtC23ShelfKitCollectionViews17PrimaryButtonView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.PrimaryButtonView", 41, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17PrimaryButtonView_hStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17PrimaryButtonView_icon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17PrimaryButtonView_button));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews17PrimaryButtonView_objectGraph));
}

@end
