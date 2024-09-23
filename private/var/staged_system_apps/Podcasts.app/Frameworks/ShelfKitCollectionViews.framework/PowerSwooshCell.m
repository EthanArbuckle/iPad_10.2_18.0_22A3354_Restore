@implementation PowerSwooshCell

- (_TtC23ShelfKitCollectionViews15PowerSwooshCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews15PowerSwooshCell *)sub_136288(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews15PowerSwooshCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1373A4();
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews15PowerSwooshCell *v2;

  v2 = self;
  sub_136AAC();

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15PowerSwooshCell_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15PowerSwooshCell_background));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15PowerSwooshCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15PowerSwooshCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15PowerSwooshCell_chinBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15PowerSwooshCell_textStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15PowerSwooshCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15PowerSwooshCell_subtitleLabel));
}

@end
