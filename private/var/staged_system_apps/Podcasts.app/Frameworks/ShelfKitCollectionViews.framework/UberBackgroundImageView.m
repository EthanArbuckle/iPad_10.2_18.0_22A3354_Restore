@implementation UberBackgroundImageView

- (_TtC23ShelfKitCollectionViews23UberBackgroundImageView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews23UberBackgroundImageView *)sub_157354(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews23UberBackgroundImageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_157978();
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews23UberBackgroundImageView *v2;

  v2 = self;
  sub_157540();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23UberBackgroundImageView_backgroundImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23UberBackgroundImageView_image));
}

@end
