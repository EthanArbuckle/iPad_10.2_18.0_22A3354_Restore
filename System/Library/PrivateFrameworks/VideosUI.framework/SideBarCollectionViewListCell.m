@implementation SideBarCollectionViewListCell

- (_TtC8VideosUI29SideBarCollectionViewListCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI29SideBarCollectionViewListCell *result;

  sub_1D9E38A30();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI29SideBarCollectionViewListCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9E38D20();
}

- (void)prepareForReuse
{
  self;
  sub_1D9E3914C();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI29SideBarCollectionViewListCell_imageLoader));
  sub_1D9E39F40((uint64_t)self + OBJC_IVAR____TtC8VideosUI29SideBarCollectionViewListCell_sidebarItem);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI29SideBarCollectionViewListCell_image));
  swift_release();
}

@end
