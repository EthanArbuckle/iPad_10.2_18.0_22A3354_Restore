@implementation RoundedCornerView

- (_TtC23ShelfKitCollectionViews17RoundedCornerView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews17RoundedCornerView *)sub_A2FBC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews17RoundedCornerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_A33C4();
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews17RoundedCornerView *v2;

  v2 = self;
  sub_A310C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17RoundedCornerView_borderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17RoundedCornerView_borderColor));
}

@end
